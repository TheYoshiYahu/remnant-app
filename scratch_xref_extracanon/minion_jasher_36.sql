-- ----- fragment: minion_jasher_36.sql (session252 jasher 36) -----
-- Source anchor: jasher/jasher ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja36 (view _session252_ja36_lookup). Sort band base 55875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-36-bethel-altar
  ('jasher', 'jasher', 36, 1, 'canon', 'genesis', 35, 1, 'free', E'Genesis 35:1 — *And Elohim (God) said unto Jacob, Arise, go up to Beth-el, and dwell there: and make there an altar unto Elohim (God), that appeared unto thee when thou fleddest from the face of Esau thy brother.* The canon command Jasher 36:1 retells word for word.'),
  ('jasher', 'jasher', 36, 3, 'canon', 'genesis', 35, 6, 'free', E'Genesis 35:6 — *So Jacob came to Luz, which is in the land of Canaan, that is, Beth-el, he and all the people that were with him.* The same Luz/Bethel arrival where Jasher 36:3 has Jacob remain six months.'),
  ('jasher', 'jasher', 36, 3, 'canon', 'genesis', 35, 7, 'free', E'Genesis 35:7 — *And he built there an altar, and called the place El-beth-el: because there Elohim (God) appeared unto him, when he fled from the face of his brother.* The altar Jasher 36:3 records Jacob building to Yahuah who appeared to him.'),
  ('jasher', 'jasher', 36, 1, 'jubilees', 'jubilees', 32, 1, 'extras', E'Jubilees 32:1 — *And he abode that night at Bethel, and Levi dreamed that they had ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever; and he awoke from his sleep and blessed Yahuah (God).* The live Jubilees apparatus narrates the same Bethel night that Jasher 36:1 opens.'),
  -- thread: jasher-36-deaths-deborah-rebecca-laban
  ('jasher', 'jasher', 36, 4, 'canon', 'genesis', 35, 8, 'free', E'Genesis 35:8 — *But Deborah Rebekah''s nurse died, and she was buried beneath Beth-el under an oak: and the name of it was called Allon-bachuth.* The same nurse, oak and name Jasher 36:4,6 retells.'),
  ('jasher', 'jasher', 36, 6, 'jubilees', 'jubilees', 32, 30, 'extras', E'Jubilees 32:30 — *And in the night, on the twenty-third of this month, Deborah Rebecca''s nurse died, and they buried her beneath the city under the oak of the river, and he called the name of this place, ''The river of Deborah,'' and the oak, ''The oak of the mourning of Deborah.'' And Rebecca went and returned to her house to his father Isaac...* The live Jubilees apparatus narrates the same death and mourning-oak as Jasher 36:4-6.'),
  -- thread: jasher-36-name-israel-rachel-benjamin
  ('jasher', 'jasher', 36, 8, 'canon', 'genesis', 35, 10, 'free', E'Genesis 35:10 — *Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel).* The renaming Jasher 36:8 records as the hundred-year-old Jacob being blessed and called Israel.'),
  ('jasher', 'jasher', 36, 8, 'canon', 'genesis', 35, 11, 'free', E'Genesis 35:11 — *I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins.* The kings-and-nations promise on the elect line whose new name Jasher 36:8 announces.'),
  ('jasher', 'jasher', 36, 12, 'canon', 'genesis', 35, 18, 'free', E'Genesis 35:18 — *And it came to pass, as her soul was in departing, (for she died) that she called his name Ben-oni: but his father called him Benjamin.* The same father''s naming of Benjamin that Jasher 36:12 gives.'),
  ('jasher', 'jasher', 36, 11, 'canon', 'genesis', 35, 19, 'free', E'Genesis 35:19 — *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* The same death and Bethlehem grave Jasher 36:11 records with its pillar.'),
  ('jasher', 'jasher', 36, 8, 'jubilees', 'jubilees', 32, 17, 'extras', E'Jubilees 32:17 — *Your name shall not be called Jacob, but Yashar''el (Israel) shall they name your name.* The live Jubilees apparatus gives the same renaming Jasher 36:8 records.'),
  ('jasher', 'jasher', 36, 11, 'jubilees', 'jubilees', 32, 34, 'extras', E'Jubilees 32:34 — *And Rachel died there and she was buried in the land of Ephrath, the same is Bethlehem, and Jacob built a pillar on the grave of Rachel, on the road above her grave.* The same Ephrath/Bethlehem grave and pillar of Jasher 36:11.'),
  -- thread: jasher-36-reuben-birthright-offices
  ('jasher', 'jasher', 36, 14, 'canon', 'genesis', 35, 22, 'free', E'Genesis 35:22 — *And it came to pass, when Yashar''el (Israel) dwelt in that land, that Reuben went and lay with Bilhah his father''s concubine: and Yashar''el (Israel) heard it. Now the sons of Jacob were twelve:* The deed Jasher 36:14 retells as Reuben removing his father''s bed.'),
  ('jasher', 'jasher', 36, 15, 'canon', 'genesis', 49, 4, 'free', E'Genesis 49:4 — *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it: he went up to my couch.* Jacob''s blessing pronouncing the very forfeiture Jasher 36:15 records.'),
  ('jasher', 'jasher', 36, 15, 'canon', '1-chronicles', 5, 1, 'free', E'1 Chronicles 5:1 — *Now the sons of Reuben the firstborn of Yashar''el (Israel), (for he was the firstborn; but, forasmuch as he defiled his father''s bed, his birthright was given unto the sons of Joseph the son of Yashar''el (Israel): and the genealogy is not to be reckoned after the birthright.)* The canon names the birthright passing to Joseph exactly as Jasher 36:15.'),
  ('jasher', 'jasher', 36, 15, 'canon', '1-chronicles', 5, 2, 'free', E'1 Chronicles 5:2 — *For Yahudah (Judah) prevailed above his brethren, and of him came the chief ruler; but the birthright was Joseph''s:)* The kingly office to Judah and birthright to Joseph that Jasher 36:15 sets out.'),
  ('jasher', 'jasher', 36, 14, 'jubilees', 'jubilees', 33, 2, 'extras', E'Jubilees 33:2 — *And Reuben saw Bilhah, Rachel''s maid, the concubine of his father, bathing in water in a secret place, and he loved her.* The live Jubilees apparatus narrates the same Reuben-and-Bilhah sin Jasher 36:14 records.'),
  -- thread: jasher-36-twelve-sons
  ('jasher', 'jasher', 36, 17, 'canon', 'genesis', 35, 23, 'free', E'Genesis 35:23 — *The sons of Leah; Reuben, Jacob''s firstborn, and Simeon, and Levi, and Yahudah (Judah), and Issachar, and Zebulun:* The same sons of Leah Jasher 36:17 lists.'),
  ('jasher', 'jasher', 36, 17, 'canon', 'genesis', 35, 24, 'free', E'Genesis 35:24 — *The sons of Rachel; Joseph, and Benjamin:* The same sons of Rachel Jasher 36:17 names.'),
  ('jasher', 'jasher', 36, 16, 'jubilees', 'jubilees', 33, 22, 'extras', E'Jubilees 33:22 — *And these were the names of the sons of Jacob: the first-born Reuben, Simeon, Levi, Yahudah (Judah), Issachar, Zebulon, the sons of Leah; and the sons of Rachel, Joseph and Benjamin; and the sons of Bilhah, Dan and Naphtali, and the sons of Zilpah, Gad and Asher; and Dinah, the daughter of Leah, the only daughter of Jacob.* The live Jubilees apparatus gives the same twelve-and-Dinah roster as Jasher 36:16-18.'),
  ('jasher', 'jasher', 36, 16, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The regathering of the twelve-tribe nation Jasher 36:16 sees first forming.'),
  -- thread: jasher-36-esau-edom-seir-set-apart
  ('jasher', 'jasher', 36, 21, 'canon', 'genesis', 36, 1, 'free', E'Genesis 36:1 — *Now these are the generations of Esau, who is Edom.* The canon heading for the very Esau-genealogy Jasher 36:21-25 retells.'),
  ('jasher', 'jasher', 36, 20, 'canon', 'genesis', 36, 8, 'free', E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* The same dwelling in Seir that Jasher 36:20 records of Esau and his sons.'),
  ('jasher', 'jasher', 36, 20, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* The election that sets Esau, dwelling apart in Seir (Jasher 36:20), outside the chosen line.'),
  ('jasher', 'jasher', 36, 20, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The prophet''s verdict on Esau/Edom whose Seir settlement Jasher 36:20 narrates.'),
  ('jasher', 'jasher', 36, 20, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The New Testament names why Esau, settling in Seir (Jasher 36:20), stands apart from the seed kept in Jacob.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-36-bethel-altar',
       E'Arise, go to Bethel and build an altar',
       E'Jasher opens this chapter at Bethel: *At that time Yahuah (the Lord) appeared to Jacob saying, Arise, go to Bethel and remain there, and make there an altar to Yahuah (the Lord) who appears to you, who delivered you and your sons from affliction* (Jasher 36:1), and Jacob *built an altar to Yahuah (the Lord) who appeared to him* (Jasher 36:3). It ain''t new — this is Genesis retold. The canon gives the same command, *And Elohim (God) said unto Jacob, Arise, go up to Beth-el, and dwell there: and make there an altar unto Elohim (God), that appeared unto thee when thou fleddest from the face of Esau thy brother* (Genesis 35:1), and the same obedience at Luz, *So Jacob came to Luz, which is in the land of Canaan, that is, Beth-el, he and all the people that were with him* (Genesis 35:6); *And he built there an altar, and called the place El-beth-el: because there Elohim (God) appeared unto him, when he fled from the face of his brother* (Genesis 35:7). The Jubilees apparatus narrates the very same night and the priesthood that rose from it, *And he abode that night at Bethel, and Levi dreamed that they had ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever; and he awoke from his sleep and blessed Yahuah (God)* (Jubilees 32:1) — the fathers building altars and calling on the Name, Torah-before-Sinai kept in the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 55875
  FROM _session252_ja36_lookup sv, _session252_ja36_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=36 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-36-deaths-deborah-rebecca-laban',
       E'Deborah, Rebecca, and Laban die',
       E'At Bethel the deaths come: *At that time died Deborah the daughter of Uz, the nurse of Rebecca, who had been with Jacob; and Jacob buried her beneath Bethel under an oak that was there* (Jasher 36:4), and *he called the name of that place Allon-bachuth* (Jasher 36:6) as he mourned both Deborah and his mother Rebecca, who *died at that time in Hebron... and she was buried in the cave of Machpelah which Abraham had bought from the children of Heth* (Jasher 36:5). It ain''t new — Genesis records the same oak of weeping, *But Deborah Rebekah''s nurse died, and she was buried beneath Beth-el under an oak: and the name of it was called Allon-bachuth* (Genesis 35:8). Jasher then adds what the canon leaves untold, the death of Laban under the broken covenant, *And Laban the Syrian died in those days, for Elohim (God) smote him because he transgressed the covenant that existed between him and Jacob* (Jasher 36:7) — the legendary detail anchored to the canon scene it expands. The Jubilees apparatus carries the same burial and the named place of mourning, *And in the night, on the twenty-third of this month, Deborah Rebecca''s nurse died, and they buried her beneath the city under the oak of the river, and he called the name of this place, ''The river of Deborah,'' and the oak, ''The oak of the mourning of Deborah.'' And Rebecca went and returned to her house to his father Isaac* (Jubilees 32:30).',
       sv.verse_id, ev.verse_id, 'extras', 55878
  FROM _session252_ja36_lookup sv, _session252_ja36_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=36 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-36-name-israel-rachel-benjamin',
       E'The name Israel; Rachel dies bearing Benjamin',
       E'Jasher records the blessing of the new name and the grief that follows: *And Jacob was a hundred years old when Yahuah (the Lord) appeared to him, and blessed him and called his name Israel, and Rachel the wife of Jacob conceived in those days* (Jasher 36:8). On the road to Ephrath *Rachel bare a son and she had hard labor and she died* (Jasher 36:10), and *Jacob called the name of his son that was born to him, which Rachel bare to him, Benjamin, for he was born to him in the land on the right hand* (Jasher 36:12). It ain''t new — Genesis gives the same naming, *but his father called him Benjamin* (Genesis 35:18), the same death and grave, *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem* (Genesis 35:19), and the same renaming with the kings-promise of the elect line, *Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel)* (Genesis 35:10); *I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins* (Genesis 35:11). The Jubilees apparatus carries the same name-giving and the same Bethlehem grave, *Your name shall not be called Jacob, but Yashar''el (Israel) shall they name your name* (Jubilees 32:17); *And Rachel died there and she was buried in the land of Ephrath, the same is Bethlehem, and Jacob built a pillar on the grave of Rachel* (Jubilees 32:34) — the covenant seed named and kept.',
       sv.verse_id, ev.verse_id, 'extras', 55881
  FROM _session252_ja36_lookup sv, _session252_ja36_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=36 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-36-reuben-birthright-offices',
       E'Reuben profanes the bed; birthright, kingship, priesthood divided',
       E'Jasher tells the sin and its cost: *And it was after the death of Rachel, that Jacob pitched his tent in the tent of her handmaid Bilhah* (Jasher 36:13), and Reuben *rose up in his anger and went and entered the tent of Bilhah and he from there removed his father''s bed* (Jasher 36:14). Then comes the verdict Jasher spells out where Genesis only hints: *At that time the portion of birthright, together with the kingly and priestly offices, was removed from the sons of Reuben, for he had profaned his father''s bed, and the birthright was given to Joseph, the kingly office to Judah, and the priesthood to Levi, because Reuben had defiled his father''s bed* (Jasher 36:15). It ain''t new — Genesis records the deed, *Reuben went and lay with Bilhah his father''s concubine: and Yashar''el (Israel) heard it* (Genesis 35:22); Jacob''s blessing pronounces the loss, *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it: he went up to my couch* (Genesis 49:4); and Chronicles names the very transfer Jasher describes, *but, forasmuch as he defiled his father''s bed, his birthright was given unto the sons of Joseph the son of Yashar''el (Israel)* (1 Chronicles 5:1); *For Yahudah (Judah) prevailed above his brethren, and of him came the chief ruler; but the birthright was Joseph''s* (1 Chronicles 5:2). The Jubilees apparatus carries the same scene of Bilhah defiled. Election precedes the offices, and the firstborn forfeits — the seed is kept, but kept in righteousness.',
       sv.verse_id, ev.verse_id, 'extras', 55884
  FROM _session252_ja36_lookup sv, _session252_ja36_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=36 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-36-twelve-sons',
       E'The twelve sons of Jacob — the tribes',
       E'Jasher numbers the covenant people: *And these are the generations of Jacob who were born to him in Padan-aram, and the sons of Jacob were twelve* (Jasher 36:16); *The sons of Leah were Reuben the first born, and Simeon, Levi, Judah, Issachar, Zebulun, and their sister Dinah; and the sons of Rachel were Joseph and Benjamin* (Jasher 36:17), with Gad, Asher, Dan and Naphtali from the handmaids (Jasher 36:18). It ain''t new — Genesis lists the same twelve, *The sons of Leah; Reuben, Jacob''s firstborn, and Simeon, and Levi, and Yahudah (Judah), and Issachar, and Zebulun* (Genesis 35:23); *The sons of Rachel; Joseph, and Benjamin* (Genesis 35:24). The Jubilees apparatus carries the same roster with the daughter named, *And these were the names of the sons of Jacob: the first-born Reuben, Simeon, Levi, Yahudah (Judah), Issachar, Zebulon, the sons of Leah; and the sons of Rachel, Joseph and Benjamin; and the sons of Bilhah, Dan and Naphtali, and the sons of Zilpah, Gad and Asher; and Dinah, the daughter of Leah, the only daughter of Jacob* (Jubilees 33:22). This is the twelve-tribe nation forming — the people the prophets promise to regather, *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21).',
       sv.verse_id, ev.verse_id, 'extras', 55887
  FROM _session252_ja36_lookup sv, _session252_ja36_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=36 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-36-esau-edom-seir-set-apart',
       E'Esau dwells in Seir — Edom set apart from the elect line',
       E'Jasher closes by parting Esau from the chosen seed: *And his brother Esau and his sons, and all belonging to him went to the land of Seir and dwelt there, and had possessions in the land of Seir, and the children of Esau were fruitful and multiplied exceedingly in the land of Seir* (Jasher 36:20), then lists the generations of Esau and the families *according to their dukedoms in the land of Seir* (Jasher 36:25). It ain''t new — Genesis heads the same record, *Now these are the generations of Esau, who is Edom* (Genesis 36:1), and seats him on the same mountain, *Thus dwelt Esau in mount Seir: Esau is Edom* (Genesis 36:8). The election was spoken before either was born, *And he hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* — no, the word stands, *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2); *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:3). And the New Testament names why Esau forfeited, *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). Election precedes confession: the elder serves the younger, and Edom is set apart from the seed kept in Jacob — not a people destroyed, but a line not chosen for the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 55890
  FROM _session252_ja36_lookup sv, _session252_ja36_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=36 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-36-bethel-altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:1 — *And Elohim (God) said unto Jacob, Arise, go up to Beth-el, and dwell there: and make there an altar unto Elohim (God), that appeared unto thee when thou fleddest from the face of Esau thy brother.* The canon command Jasher 36:1 retells word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-bethel-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:6 — *So Jacob came to Luz, which is in the land of Canaan, that is, Beth-el, he and all the people that were with him.* The same Luz/Bethel arrival where Jasher 36:3 has Jacob remain six months.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-bethel-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 35:7 — *And he built there an altar, and called the place El-beth-el: because there Elohim (God) appeared unto him, when he fled from the face of his brother.* The altar Jasher 36:3 records Jacob building to Yahuah who appeared to him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-bethel-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 32:1 — *And he abode that night at Bethel, and Levi dreamed that they had ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever; and he awoke from his sleep and blessed Yahuah (God).* The live Jubilees apparatus narrates the same Bethel night that Jasher 36:1 opens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-bethel-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-36-deaths-deborah-rebecca-laban
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:8 — *But Deborah Rebekah''s nurse died, and she was buried beneath Beth-el under an oak: and the name of it was called Allon-bachuth.* The same nurse, oak and name Jasher 36:4,6 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-deaths-deborah-rebecca-laban'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 32:30 — *And in the night, on the twenty-third of this month, Deborah Rebecca''s nurse died, and they buried her beneath the city under the oak of the river, and he called the name of this place, ''The river of Deborah,'' and the oak, ''The oak of the mourning of Deborah.'' And Rebecca went and returned to her house to his father Isaac...* The live Jubilees apparatus narrates the same death and mourning-oak as Jasher 36:4-6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-deaths-deborah-rebecca-laban'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=32 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-36-name-israel-rachel-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:10 — *Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel).* The renaming Jasher 36:8 records as the hundred-year-old Jacob being blessed and called Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-name-israel-rachel-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:11 — *I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins.* The kings-and-nations promise on the elect line whose new name Jasher 36:8 announces.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-name-israel-rachel-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 35:18 — *And it came to pass, as her soul was in departing, (for she died) that she called his name Ben-oni: but his father called him Benjamin.* The same father''s naming of Benjamin that Jasher 36:12 gives.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-name-israel-rachel-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 35:19 — *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* The same death and Bethlehem grave Jasher 36:11 records with its pillar.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-name-israel-rachel-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 32:17 — *Your name shall not be called Jacob, but Yashar''el (Israel) shall they name your name.* The live Jubilees apparatus gives the same renaming Jasher 36:8 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-name-israel-rachel-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 32:34 — *And Rachel died there and she was buried in the land of Ephrath, the same is Bethlehem, and Jacob built a pillar on the grave of Rachel, on the road above her grave.* The same Ephrath/Bethlehem grave and pillar of Jasher 36:11.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-name-israel-rachel-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=32 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-36-reuben-birthright-offices
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:22 — *And it came to pass, when Yashar''el (Israel) dwelt in that land, that Reuben went and lay with Bilhah his father''s concubine: and Yashar''el (Israel) heard it. Now the sons of Jacob were twelve:* The deed Jasher 36:14 retells as Reuben removing his father''s bed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-reuben-birthright-offices'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:4 — *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it: he went up to my couch.* Jacob''s blessing pronouncing the very forfeiture Jasher 36:15 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-reuben-birthright-offices'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Chronicles 5:1 — *Now the sons of Reuben the firstborn of Yashar''el (Israel), (for he was the firstborn; but, forasmuch as he defiled his father''s bed, his birthright was given unto the sons of Joseph the son of Yashar''el (Israel): and the genealogy is not to be reckoned after the birthright.)* The canon names the birthright passing to Joseph exactly as Jasher 36:15.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-reuben-birthright-offices'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Chronicles 5:2 — *For Yahudah (Judah) prevailed above his brethren, and of him came the chief ruler; but the birthright was Joseph''s:)* The kingly office to Judah and birthright to Joseph that Jasher 36:15 sets out.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-reuben-birthright-offices'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 33:2 — *And Reuben saw Bilhah, Rachel''s maid, the concubine of his father, bathing in water in a secret place, and he loved her.* The live Jubilees apparatus narrates the same Reuben-and-Bilhah sin Jasher 36:14 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-reuben-birthright-offices'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=33 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-36-twelve-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:23 — *The sons of Leah; Reuben, Jacob''s firstborn, and Simeon, and Levi, and Yahudah (Judah), and Issachar, and Zebulun:* The same sons of Leah Jasher 36:17 lists.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-twelve-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:24 — *The sons of Rachel; Joseph, and Benjamin:* The same sons of Rachel Jasher 36:17 names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-twelve-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 33:22 — *And these were the names of the sons of Jacob: the first-born Reuben, Simeon, Levi, Yahudah (Judah), Issachar, Zebulon, the sons of Leah; and the sons of Rachel, Joseph and Benjamin; and the sons of Bilhah, Dan and Naphtali, and the sons of Zilpah, Gad and Asher; and Dinah, the daughter of Leah, the only daughter of Jacob.* The live Jubilees apparatus gives the same twelve-and-Dinah roster as Jasher 36:16-18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-twelve-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=33 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The regathering of the twelve-tribe nation Jasher 36:16 sees first forming.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-twelve-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-36-esau-edom-seir-set-apart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:1 — *Now these are the generations of Esau, who is Edom.* The canon heading for the very Esau-genealogy Jasher 36:21-25 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-esau-edom-seir-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* The same dwelling in Seir that Jasher 36:20 records of Esau and his sons.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-esau-edom-seir-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* The election that sets Esau, dwelling apart in Seir (Jasher 36:20), outside the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-esau-edom-seir-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The prophet''s verdict on Esau/Edom whose Seir settlement Jasher 36:20 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-esau-edom-seir-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The New Testament names why Esau, settling in Seir (Jasher 36:20), stands apart from the seed kept in Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja36_lookup sv, _session252_ja36_lookup tv
 WHERE t.slug='jasher-36-esau-edom-seir-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=36 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

