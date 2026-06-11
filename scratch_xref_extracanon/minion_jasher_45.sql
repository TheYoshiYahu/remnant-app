-- ----- fragment: minion_jasher_45.sql (session252 jasher 45) -----
-- Source anchor: jasher/jasher ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja45 (view _session252_ja45_lookup). Sort band base 56100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-45-twelve-tribes-down-to-egypt
  ('jasher', 'jasher', 45, 2, 'canon', 'genesis', 46, 9, 'free', E'Genesis 46:9 — *And the sons of Reuben; Hanoch, and Phallu, and Hezron, and Carmi.* Genesis registers Reuben''s four sons by the same names Jasher 45:2 records for Reuben''s house.'),
  ('jasher', 'jasher', 45, 6, 'canon', 'genesis', 46, 11, 'free', E'Genesis 46:11 — *And the sons of Levi; Gershon, Kohath, and Merari.* The three sons of Levi that Jasher 45:6 names for Adinah are exactly the Levitical line Genesis counts among the seventy.'),
  ('jasher', 'jasher', 45, 7, 'canon', 'genesis', 46, 27, 'free', E'Genesis 46:27 — *And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* The household whose offspring Jasher 45 itemizes is the seventy souls Genesis numbers going down into Egypt.'),
  ('jasher', 'jasher', 45, 2, 'canon', 'exodus', 1, 1, 'free', E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* Exodus reopens with the same households Jasher 45 has just enumerated, the twelve tribes about to become a nation.'),
  -- thread: jasher-45-elohim-remembered-the-barren
  ('jasher', 'jasher', 45, 8, 'canon', 'genesis', 46, 23, 'free', E'Genesis 46:23 — *And the sons of Dan; Hushim.* Genesis records Dan''s single son, the very child Jasher 45:8 says Elohim gave the barren Aphlaleth when He remembered her.'),
  -- thread: jasher-45-judah-er-onan-shiloh
  ('jasher', 'jasher', 45, 26, 'canon', 'genesis', 38, 9, 'free', E'Genesis 38:9 — *And Onan knew that the seed should not be his; and it came to pass, when he went in unto his brother''s wife, that he spilled it on the ground, lest that he should give seed to his brother.* Genesis gives the very deed Jasher 45:26 calls ''the work of his brother,'' for which Yahuah slew Onan.'),
  ('jasher', 'jasher', 45, 24, 'canon', 'genesis', 38, 7, 'free', E'Genesis 38:7 — *And Er, Yahudah''s (Judah''s) firstborn, was wicked in the sight of Yahuah (LORD); and Yahuah (LORD) slew him.* Genesis records the death of Er that Jasher 45:24 narrates word for word, Judah''s evil firstborn slain by Yahuah.'),
  ('jasher', 'jasher', 45, 26, 'jubilees', 'jubilees', 41, 5, 'extras', E'Jubilees 41:5 — *And Onan knew that the seed would not be his, (but) his brother''s only, and he went into the house of his brother''s wife, and spilt the seed on the ground, and he was wicked in the eyes of Yahuah (God), and He slew him.* The Jubilees apparatus tells the same slaying of Onan that Jasher 45:26 records.'),
  ('jasher', 'jasher', 45, 24, 'canon', 'numbers', 26, 19, 'free', E'Numbers 26:19 — *The sons of Yahudah (Judah) were Er and Onan: and Er and Onan died in the land of Canaan.* The wilderness census remembers the deaths Jasher 45:24-26 narrates, the two sons of Judah who perished in Canaan.'),
  -- thread: jasher-45-tamar-the-veil-and-the-twins
  ('jasher', 'jasher', 45, 31, 'canon', 'genesis', 38, 14, 'free', E'Genesis 38:14 — *And she put her widow''s garments off from her, and covered her with a vail, and wrapped herself, and sat in an open place, which is by the way to Timnath; for she saw that Shelah was grown, and she was not given unto him to wife.* Genesis gives the veiling at the Timnath road that Jasher 45:31 retells almost word for word.'),
  ('jasher', 'jasher', 45, 32, 'canon', 'genesis', 38, 27, 'free', E'Genesis 38:27 — *And it came to pass in the time of her travail, that, behold, twins were in her womb.* Genesis records the twin birth Jasher 45:32 names as Perez and Zarah.'),
  ('jasher', 'jasher', 45, 31, 'jubilees', 'jubilees', 41, 19, 'extras', E'Jubilees 41:19 — *And Yahudah (Judah) acknowledged, and said: “Tamar is more righteous than I am. And therefore let them burn her not.”* The Jubilees apparatus carries Judah''s vindication of the very Tamar whose veiled meeting Jasher 45:31 narrates.'),
  -- thread: jasher-45-judah-sceptre-perez-line
  ('jasher', 'jasher', 45, 32, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Perez born in Jasher 45:32 carries the sceptre of Judah toward the promised Shiloh.'),
  ('jasher', 'jasher', 45, 32, 'canon', 'ruth', 4, 12, 'free', E'Ruth 4:12 — *And let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman.* Bethlehem blesses Boaz by the very house of Perez that Tamar bears at the close of Jasher 45:32, the line that runs to David.'),
  ('jasher', 'jasher', 45, 32, 'canon', 'matthew', 1, 3, 'free', E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram.* The Messiah''s genealogy names Tamar and the twins Perez and Zarah of Jasher 45:32 in the royal line of Judah.'),
  ('jasher', 'jasher', 45, 27, 'canon', 'numbers', 26, 20, 'free', E'Numbers 26:20 — *And the sons of Yahudah (Judah) after their families were; of Shelah, the family of the Shelanites: of Pharez, the family of the Pharzites: of Zerah, the family of the Zarhites.* The census enrolls Shelah, Perez and Zarah as the families of Judah, the sons named across Jasher 45:27-32.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-45-twelve-tribes-down-to-egypt',
       E'The sons of Jacob and their offspring — the twelve tribes forming',
       E'Jasher pauses the Joseph cycle to register the marriages and offspring of Jacob''s sons: *And Eliuram the wife of Reuben conceived and bare him Hanoch, Palu, Chetzron and Carmi, four sons; and Simeon his brother took his sister Dinah for a wife, and she bare to him Memuel, Yamin, Ohad, Jachin and Zochar, five sons* (Jasher 45:2). This is the canon''s own tribal roster being filled in name by name — the seventy souls of the house of Jacob being gathered before the descent into Egypt. Genesis names the very same sons: *And the sons of Reuben; Hanoch, and Phallu, and Hezron, and Carmi* (Genesis 46:9), and the household it numbers is precisely this nation in seed-form — *All the souls of the house of Jacob, which came into Egypt, were threescore and ten* (Genesis 46:27). Exodus opens the bondage by reciting the same twelve who went down — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob* (Exodus 1:1) — the covenant people the gathering will one day restore (Ezek 37). It ain''t new: the tribes Jasher counts here are the tribes whose inheritance the whole Book carries.',
       sv.verse_id, ev.verse_id, 'extras', 56100
  FROM _session252_ja45_lookup sv, _session252_ja45_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=45 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-45-elohim-remembered-the-barren',
       E'Elohim remembered Aphlaleth — the Name kept before Sinai',
       E'When Dan''s wife proves barren, Jasher names the One who opens the womb: *And Aphlaleth was barren, she had no offspring, and Elohim (God) afterward remembered Aphlaleth the wife of Dan, and she conceived and bare a son, and she called his name Chushim* (Jasher 45:8). This is the patriarchal faith carried forward — the same Elohim who *remembered* the matriarchs is at work in the tribe of Dan, and Genesis confirms the single son: *And the sons of Dan; Hushim* (Genesis 46:23). Jasher adds that the household walked in the way already given — *she went in the sanctified ways of the children of Jacob; she lacked nothing, and Yahuah (the Lord) gave her wisdom and understanding* (Jasher 45:17). Torah-before-Sinai: the fathers call on the Name, the Name remembers them, and the elect seed is kept. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56103
  FROM _session252_ja45_lookup sv, _session252_ja45_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=45 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-45-judah-er-onan-shiloh',
       E'Er and Onan slain — Judah''s house and the kept seed',
       E'Jasher retells the dark scene of Judah''s first two sons: *And Onan took Tamar for a wife and he came to her, and Onan also did like to the work of his brother, and his work was evil in the sight of Yahuah (the Lord), and he slew him also* (Jasher 45:26). This is Genesis 38 unfolded: *And Onan knew that the seed should not be his; and it came to pass, when he went in unto his brother''s wife, that he spilled it on the ground, lest that he should give seed to his brother* (Genesis 38:9), *And the thing which he did displeased Yahuah (LORD): wherefore he slew him also* (Genesis 38:10). The Jubilees apparatus carries the identical judgment — *And Onan knew that the seed would not be his, (but) his brother''s only, and he went into the house of his brother''s wife, and spilt the seed on the ground, and he was wicked in the eyes of Yahuah (God), and He slew him* (Jubilees 41:5). And the tribal census remembers it forever: *The sons of Yahudah (Judah) were Er and Onan: and Er and Onan died in the land of Canaan* (Numbers 26:19). The seed of the sceptre-tribe is being protected even through judgment.',
       sv.verse_id, ev.verse_id, 'extras', 56106
  FROM _session252_ja45_lookup sv, _session252_ja45_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=45 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-45-tamar-the-veil-and-the-twins',
       E'Tamar at the wayside — Perez and Zarah born',
       E'Jasher narrates Tamar''s veiled meeting with Judah and the twins it brings forth: *And Tamar rose up and put off the garments of her widowhood, and she put a vail upon her, and she entirely covered herself, and she went and sat in the public thoroughfare, which is upon the road to Timnah* (Jasher 45:31). Genesis is the source retold — *And she put her widow''s garments off from her, and covered her with a vail, and wrapped herself, and sat in an open place, which is by the way to Timnath; for she saw that Shelah was grown, and she was not given unto him to wife* (Genesis 38:14) — and the birth follows exactly: *And it came to pass in the time of her travail, that, behold, twins were in her womb* (Genesis 38:27). The Jubilees apparatus closes the matter with the same verdict that vindicates her — *And Yahudah (Judah) acknowledged, and said: “Tamar is more righteous than I am. And therefore let them burn her not”* (Jubilees 41:19). Through this struggling-at-the-birth twins comes Perez, whose breach Genesis names — and the seed of the sceptre-tribe is carried on.',
       sv.verse_id, ev.verse_id, 'extras', 56109
  FROM _session252_ja45_lookup sv, _session252_ja45_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=45 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-45-judah-sceptre-perez-line',
       E'Perez of Judah — the sceptre, Shiloh, and the seed to David',
       E'When Jasher closes the chapter — *and he called the name of the first Perez, and the name of the second Zarah* (Jasher 45:32) — it has just delivered the line through which the sceptre will run. Jacob''s blessing on this very tribe declares it: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The same Perez Jasher names becomes the blessing pronounced over Boaz: *And let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman* (Ruth 4:12) — the house that leads to David, *and Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21). The New Testament gathers it all to the Messiah, naming Tamar and Perez in the royal genealogy: *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram* (Matthew 1:3). The kept seed of Judah is the Shiloh-line — bound honestly to Genesis 49 and the Messiah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56112
  FROM _session252_ja45_lookup sv, _session252_ja45_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=45 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-45-twelve-tribes-down-to-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:9 — *And the sons of Reuben; Hanoch, and Phallu, and Hezron, and Carmi.* Genesis registers Reuben''s four sons by the same names Jasher 45:2 records for Reuben''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-twelve-tribes-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:11 — *And the sons of Levi; Gershon, Kohath, and Merari.* The three sons of Levi that Jasher 45:6 names for Adinah are exactly the Levitical line Genesis counts among the seventy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-twelve-tribes-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 46:27 — *And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* The household whose offspring Jasher 45 itemizes is the seventy souls Genesis numbers going down into Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-twelve-tribes-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* Exodus reopens with the same households Jasher 45 has just enumerated, the twelve tribes about to become a nation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-twelve-tribes-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-45-elohim-remembered-the-barren
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:23 — *And the sons of Dan; Hushim.* Genesis records Dan''s single son, the very child Jasher 45:8 says Elohim gave the barren Aphlaleth when He remembered her.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-elohim-remembered-the-barren'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-45-judah-er-onan-shiloh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 38:9 — *And Onan knew that the seed should not be his; and it came to pass, when he went in unto his brother''s wife, that he spilled it on the ground, lest that he should give seed to his brother.* Genesis gives the very deed Jasher 45:26 calls ''the work of his brother,'' for which Yahuah slew Onan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-er-onan-shiloh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 38:7 — *And Er, Yahudah''s (Judah''s) firstborn, was wicked in the sight of Yahuah (LORD); and Yahuah (LORD) slew him.* Genesis records the death of Er that Jasher 45:24 narrates word for word, Judah''s evil firstborn slain by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-er-onan-shiloh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 41:5 — *And Onan knew that the seed would not be his, (but) his brother''s only, and he went into the house of his brother''s wife, and spilt the seed on the ground, and he was wicked in the eyes of Yahuah (God), and He slew him.* The Jubilees apparatus tells the same slaying of Onan that Jasher 45:26 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-er-onan-shiloh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=41 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 26:19 — *The sons of Yahudah (Judah) were Er and Onan: and Er and Onan died in the land of Canaan.* The wilderness census remembers the deaths Jasher 45:24-26 narrates, the two sons of Judah who perished in Canaan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-er-onan-shiloh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-45-tamar-the-veil-and-the-twins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 38:14 — *And she put her widow''s garments off from her, and covered her with a vail, and wrapped herself, and sat in an open place, which is by the way to Timnath; for she saw that Shelah was grown, and she was not given unto him to wife.* Genesis gives the veiling at the Timnath road that Jasher 45:31 retells almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-tamar-the-veil-and-the-twins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 38:27 — *And it came to pass in the time of her travail, that, behold, twins were in her womb.* Genesis records the twin birth Jasher 45:32 names as Perez and Zarah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-tamar-the-veil-and-the-twins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 41:19 — *And Yahudah (Judah) acknowledged, and said: “Tamar is more righteous than I am. And therefore let them burn her not.”* The Jubilees apparatus carries Judah''s vindication of the very Tamar whose veiled meeting Jasher 45:31 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-tamar-the-veil-and-the-twins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=41 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-45-judah-sceptre-perez-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Perez born in Jasher 45:32 carries the sceptre of Judah toward the promised Shiloh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-sceptre-perez-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ruth 4:12 — *And let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman.* Bethlehem blesses Boaz by the very house of Perez that Tamar bears at the close of Jasher 45:32, the line that runs to David.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-sceptre-perez-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram.* The Messiah''s genealogy names Tamar and the twins Perez and Zarah of Jasher 45:32 in the royal line of Judah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-sceptre-perez-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 26:20 — *And the sons of Yahudah (Judah) after their families were; of Shelah, the family of the Shelanites: of Pharez, the family of the Pharzites: of Zerah, the family of the Zarhites.* The census enrolls Shelah, Perez and Zarah as the families of Judah, the sons named across Jasher 45:27-32.'
  FROM cross_reference_threads t, cross_references x, _session252_ja45_lookup sv, _session252_ja45_lookup tv
 WHERE t.slug='jasher-45-judah-sceptre-perez-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=45 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

