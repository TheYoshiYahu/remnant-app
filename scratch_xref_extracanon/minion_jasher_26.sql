-- ----- fragment: minion_jasher_26.sql (session252 jasher 26) -----
-- Source anchor: jasher/jasher ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja26 (view _session252_ja26_lookup). Sort band base 55625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-26-isaac-prays-barren-rebecca
  ('jasher', 'jasher', 26, 5, 'canon', 'genesis', 25, 21, 'free', E'Genesis 25:21 — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* Jasher 26:5 expands the same prayer at the place of barrenness into Isaac''s full plea, but lands exactly where Genesis does.'),
  ('jasher', 'jasher', 26, 8, 'canon', 'genesis', 25, 21, 'free', E'Genesis 25:21 — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* Jasher 26:8 — *And Yahuah (the Lord) heard the prayer of Isaac... and Rebecca his wife conceived* — is the same answered prayer, the conception that keeps the line.'),
  ('jasher', 'jasher', 26, 2, 'canon', 'genesis', 21, 1, 'free', E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Rebecca in Jasher 26:2 appeals to Sarah''s own barrenness-then-conception as the precedent for her prayer; the chosen seed comes by Yahuah visiting, twice over.'),
  ('jasher', 'jasher', 26, 6, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* Isaac pleads in Jasher 26:6 on the very promise of seed and land given to his father, asking that the word be verified.'),
  -- thread: jasher-26-two-nations-elder-serve-younger
  ('jasher', 'jasher', 26, 12, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Jasher 26:12 delivers the identical oracle of two nations and the greater serving the younger.'),
  ('jasher', 'jasher', 26, 12, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul reads the very womb of Jasher 26:12 as election before works — the chosen seed kept by Yahuah''s purpose, not human merit.'),
  ('jasher', 'jasher', 26, 12, 'canon', 'romans', 9, 12, 'free', E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* The oracle quoted in Jasher 26:12 is the same word Paul cites as the ground of election.'),
  ('jasher', 'jasher', 26, 9, 'canon', 'genesis', 25, 22, 'free', E'Genesis 25:22 — *And the children struggled together within her; and she said, If it be so, why am I thus? And she went to enquire of Yahuah (LORD).* Jasher 26:9 expands Rebecca''s distress at the struggle and her going to enquire — to Shem, Eber, and Abraham — of Yahuah.'),
  -- thread: jasher-26-birth-esau-jacob-characters
  ('jasher', 'jasher', 26, 15, 'canon', 'genesis', 25, 26, 'free', E'Genesis 25:26 — *And after that came his brother out, and his hand took hold on Esau''s heel; and his name was called Jacob: and Isaac was threescore years old when she bare them.* Jasher 26:15 gives the identical heel-grasp and naming of Jacob.'),
  ('jasher', 'jasher', 26, 17, 'canon', 'genesis', 25, 27, 'free', E'Genesis 25:27 — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* Jasher 26:17 unfolds the same contrast and adds that Jacob was learning the instructions of Yahuah and the commands of his parents.'),
  ('jasher', 'jasher', 26, 15, 'jubilees', 'jubilees', 19, 13, 'extras', E'Jubilees 19:13 — *And in the sixth week, in the second year thereof, Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field, and hairy, and Jacob dwelt in tents.* The Jubilees apparatus narrates the same birth and the same dividing of the brothers as Jasher 26:14-15.'),
  ('jasher', 'jasher', 26, 17, 'jubilees', 'jubilees', 19, 14, 'extras', E'Jubilees 19:14 — *And the youths grew, and Jacob learned to write; but Esau did not learn, for he was a man of the field and a hunter, and he learnt war, and all his deeds were fierce. And Abraham loved Jacob, but Isaac loved Esau.* The same growing-up of the twins that Jasher 26:17 frames as Jacob learning the way of Yahuah while Esau hunted.'),
  -- thread: jasher-26-abraham-charge-keep-commandments
  ('jasher', 'jasher', 26, 25, 'canon', 'genesis', 18, 19, 'free', E'Genesis 18:19 — *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment; that Yahuah (LORD) may bring upon Abraham that which he hath spoken of him.* Jasher 26:25 shows Abraham doing exactly this — charging Isaac to keep the commandments and turn neither right nor left.'),
  ('jasher', 'jasher', 26, 27, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Abraham''s command in Jasher 26:27 to teach the children the instructions of Yahuah is the Shema obeyed generations before Sinai.'),
  ('jasher', 'jasher', 26, 24, 'canon', 'genesis', 26, 5, 'free', E'Genesis 26:5 — *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Jasher 26:24 has Abraham recount that the land is given to a seed who keep the commandments, statutes, and judgments — the same Torah-keeping Genesis credits to Abraham.'),
  -- thread: jasher-26-death-of-abraham
  ('jasher', 'jasher', 26, 29, 'canon', 'genesis', 25, 8, 'free', E'Genesis 25:8 — *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people.* Jasher 26:29 reports the same death — good old age, satisfied with days, gathered to his people, buried by Isaac and Ishmael.'),
  ('jasher', 'jasher', 26, 29, 'canon', 'genesis', 25, 7, 'free', E'Genesis 25:7 — *And these are the days of the years of Abraham''s life which he lived, an hundred threescore and fifteen years.* Jasher 26:29 gives the identical span of Abraham''s life, one hundred and seventy-five years.'),
  ('jasher', 'jasher', 26, 31, 'jubilees', 'jubilees', 22, 1, 'extras', E'Jubilees 22:1 — *And it came to pass in the first week in the forty-fourth jubilee, in the second year, that is, the year in which Abraham died, that Isaac and Ishmael came from the Well of the Oath to celebrate the feast of weeks... to Abraham, their father, and Abraham rejoiced because his two sons had come.* The Jubilees apparatus sets the same death of Abraham, with Isaac and Ishmael gathered, that Jasher 26:31 surrounds with the burial.'),
  ('jasher', 'jasher', 26, 28, 'jubilees', 'jubilees', 19, 17, 'extras', E'Jubilees 19:17 — *My daughter, watch over my son Jacob, For he shall be in my stead on the earth, And for a blessing in the midst of the children of men, And for the glory of the whole seed of Shem. For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth.* Where Jasher 26:28 has Abraham bless Isaac and teach Jacob the way of Yahuah, Jubilees fixes the election squarely on Jacob as the chosen seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-26-isaac-prays-barren-rebecca',
       E'Isaac entreats Yahuah for barren Rebecca',
       E'Jasher opens the cycle where Genesis does, with the same barren womb and the same prayer: *And Rebecca said to him, But arise now you also and pray, that Yahuah (the Lord) may hear your prayer and grant me children, and Isaac hearkened to the words of his wife... and Isaac stood up and prayed to Yahuah (the Lord) on account of his wife because she was barren.* (Jasher 26:5). Genesis carries the scene in a single verse — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* (Genesis 25:21). It is the pattern already worked in Sarah, which Rebecca herself names — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* (Genesis 21:1). The seed-line is kept not by the strength of the flesh but because Yahuah hears: the chosen line continues by promise and prayer, generation to generation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55625
  FROM _session252_ja26_lookup sv, _session252_ja26_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=26 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-26-two-nations-elder-serve-younger',
       E'Two nations in the womb — the elder shall serve the younger',
       E'The struggle and the oracle stand at the heart of the chapter: *they brought her word from Yahuah (the Lord) and told her, Two children are in your womb, and two nations shall rise from them; and one nation shall be stronger than the other, and the greater shall serve the younger.* (Jasher 26:12). This is Genesis word for word in substance — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). Paul reads this exact womb as the proof that election precedes works and confession: *For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth* (Romans 9:11), *It was said unto her, The elder shall serve the younger* (Romans 9:12). The choice is Yahuah''s, made before the twins draw breath; the seed is chosen, not earned. The writer of Hebrews names the cost of despising what was given — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* (Hebrews 12:16). The election is real; the birthright is not to be held cheap.',
       sv.verse_id, ev.verse_id, 'extras', 55628
  FROM _session252_ja26_lookup sv, _session252_ja26_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=26 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-26-birth-esau-jacob-characters',
       E'Esau the hunter, Jacob perfect in tents',
       E'The twins are born and grow into their callings: *And the first came out red all over like a hairy garment... they called his name Esau... And after that came his brother, and his hand took hold of Esau''s heel, therefore they called his name Jacob.* (Jasher 26:14-15). Genesis tells it the same — *And the first came out red, all over like an hairy garment; and they called his name Esau. And after that came his brother out, and his hand took hold on Esau''s heel; and his name was called Jacob: and Isaac was threescore years old when she bare them.* (Genesis 25:25-26). Their characters divide along the seed-line: *Esau was a designing and deceitful man, and an expert hunter in the field, and Jacob was a man perfect and wise, dwelling in tents, feeding flocks and learning the instructions of Yahuah (the Lord)* (Jasher 26:17) — Genesis: *and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* (Genesis 25:27). Jubilees, narrating the same birth and the same boys, draws the line still sharper — *Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field... And Jacob dwelt in tents* (Jubilees 19:13), *Jacob learned to write; but Esau did not learn... and he learnt war... And Abraham loved Jacob, but Isaac loved Esau.* (Jubilees 19:14). Jacob is the one learning the way of Yahuah — Torah before Sinai.',
       sv.verse_id, ev.verse_id, 'extras', 55631
  FROM _session252_ja26_lookup sv, _session252_ja26_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=26 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-26-abraham-charge-keep-commandments',
       E'Abraham''s charge: keep the commandments, teach your children',
       E'Before he dies Abraham hands Isaac the covenant and the Torah-way: *Now therefore my son, hearken to my voice, and keep the commandments of Yahuah your Elohim, which I commanded you, do not turn from the right way either to the right or to the left, in order that it may be well with you and your children after you forever.* (Jasher 26:25), *And teach you your children and your seed the instructions of Yahuah (the Lord) and his commandments, and teach them the upright way in which they should go* (Jasher 26:27). This is the fathers keeping the way before Sinai — exactly what Genesis says of Abraham: *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment* (Genesis 18:19), and why the land-promise rests on him: *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* (Genesis 26:5). The charge to teach the children is the heart of the Shema given later — *And these words, which I command thee this day, shall be in thine heart: And thou shalt teach them diligently unto thy children* (Deuteronomy 6:6-7). Torah stands; it ain''t new, and it was never a curse — it is the upright way handed father to son so it may be well forever.',
       sv.verse_id, ev.verse_id, 'extras', 55634
  FROM _session252_ja26_lookup sv, _session252_ja26_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=26 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-26-death-of-abraham',
       E'Abraham gathered to his people in good old age',
       E'The chapter closes the father''s life: *And it was at that time that Abraham died, in the fifteenth year of the life of Jacob and Esau... and all the days of Abraham were one hundred and seventy-five years, and he died and was gathered to his people in good old age, old and satisfied with days, and Isaac and Ishmael his sons buried him.* (Jasher 26:29). Genesis records it in the same numbers and the same words — *And these are the days of the years of Abraham''s life which he lived, an hundred threescore and fifteen years.* (Genesis 25:7), *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people.* (Genesis 25:8). Jubilees, telling the same death, places it at the feast of weeks with the two sons gathered — *that is, the year in which Abraham died, that Isaac and Ishmael came from the Well of the Oath to celebrate the feast of weeks* (Jubilees 22:1) — and gives the dying blessing that fixes the election on Jacob: *I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth.* (Jubilees 19:17). The seed passes to Isaac, and the chosen line runs on. Abraham dies satisfied, and Yahuah is with Isaac as he was with his father.',
       sv.verse_id, ev.verse_id, 'extras', 55637
  FROM _session252_ja26_lookup sv, _session252_ja26_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=29
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=26 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-26-isaac-prays-barren-rebecca
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:21 — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* Jasher 26:5 expands the same prayer at the place of barrenness into Isaac''s full plea, but lands exactly where Genesis does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-isaac-prays-barren-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:21 — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* Jasher 26:8 — *And Yahuah (the Lord) heard the prayer of Isaac... and Rebecca his wife conceived* — is the same answered prayer, the conception that keeps the line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-isaac-prays-barren-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Rebecca in Jasher 26:2 appeals to Sarah''s own barrenness-then-conception as the precedent for her prayer; the chosen seed comes by Yahuah visiting, twice over.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-isaac-prays-barren-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* Isaac pleads in Jasher 26:6 on the very promise of seed and land given to his father, asking that the word be verified.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-isaac-prays-barren-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-26-two-nations-elder-serve-younger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Jasher 26:12 delivers the identical oracle of two nations and the greater serving the younger.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-two-nations-elder-serve-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul reads the very womb of Jasher 26:12 as election before works — the chosen seed kept by Yahuah''s purpose, not human merit.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-two-nations-elder-serve-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* The oracle quoted in Jasher 26:12 is the same word Paul cites as the ground of election.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-two-nations-elder-serve-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 25:22 — *And the children struggled together within her; and she said, If it be so, why am I thus? And she went to enquire of Yahuah (LORD).* Jasher 26:9 expands Rebecca''s distress at the struggle and her going to enquire — to Shem, Eber, and Abraham — of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-two-nations-elder-serve-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-26-birth-esau-jacob-characters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:26 — *And after that came his brother out, and his hand took hold on Esau''s heel; and his name was called Jacob: and Isaac was threescore years old when she bare them.* Jasher 26:15 gives the identical heel-grasp and naming of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-birth-esau-jacob-characters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:27 — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* Jasher 26:17 unfolds the same contrast and adds that Jacob was learning the instructions of Yahuah and the commands of his parents.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-birth-esau-jacob-characters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 19:13 — *And in the sixth week, in the second year thereof, Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field, and hairy, and Jacob dwelt in tents.* The Jubilees apparatus narrates the same birth and the same dividing of the brothers as Jasher 26:14-15.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-birth-esau-jacob-characters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 19:14 — *And the youths grew, and Jacob learned to write; but Esau did not learn, for he was a man of the field and a hunter, and he learnt war, and all his deeds were fierce. And Abraham loved Jacob, but Isaac loved Esau.* The same growing-up of the twins that Jasher 26:17 frames as Jacob learning the way of Yahuah while Esau hunted.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-birth-esau-jacob-characters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=17
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-26-abraham-charge-keep-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:19 — *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment; that Yahuah (LORD) may bring upon Abraham that which he hath spoken of him.* Jasher 26:25 shows Abraham doing exactly this — charging Isaac to keep the commandments and turn neither right nor left.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-abraham-charge-keep-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Abraham''s command in Jasher 26:27 to teach the children the instructions of Yahuah is the Shema obeyed generations before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-abraham-charge-keep-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 26:5 — *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Jasher 26:24 has Abraham recount that the land is given to a seed who keep the commandments, statutes, and judgments — the same Torah-keeping Genesis credits to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-abraham-charge-keep-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-26-death-of-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:8 — *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people.* Jasher 26:29 reports the same death — good old age, satisfied with days, gathered to his people, buried by Isaac and Ishmael.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-death-of-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:7 — *And these are the days of the years of Abraham''s life which he lived, an hundred threescore and fifteen years.* Jasher 26:29 gives the identical span of Abraham''s life, one hundred and seventy-five years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-death-of-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 22:1 — *And it came to pass in the first week in the forty-fourth jubilee, in the second year, that is, the year in which Abraham died, that Isaac and Ishmael came from the Well of the Oath to celebrate the feast of weeks... to Abraham, their father, and Abraham rejoiced because his two sons had come.* The Jubilees apparatus sets the same death of Abraham, with Isaac and Ishmael gathered, that Jasher 26:31 surrounds with the burial.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-death-of-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 19:17 — *My daughter, watch over my son Jacob, For he shall be in my stead on the earth, And for a blessing in the midst of the children of men, And for the glory of the whole seed of Shem. For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth.* Where Jasher 26:28 has Abraham bless Isaac and teach Jacob the way of Yahuah, Jubilees fixes the election squarely on Jacob as the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja26_lookup sv, _session252_ja26_lookup tv
 WHERE t.slug='jasher-26-death-of-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=26 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

