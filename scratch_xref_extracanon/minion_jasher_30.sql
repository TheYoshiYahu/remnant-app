-- ----- fragment: minion_jasher_30.sql (session252 jasher 30) -----
-- Source anchor: jasher/jasher ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja30 (view _session252_ja30_lookup). Sort band base 55725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-30-bethel-ladder
  ('jasher', 'jasher', 30, 1, 'canon', 'genesis', 28, 13, 'free', E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed;* The same covenant word Jasher 30:1 puts in Yahuah''s mouth over Jacob at Luz.'),
  ('jasher', 'jasher', 30, 1, 'canon', 'genesis', 28, 12, 'free', E'Genesis 28:12 — *And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it.* The ladder vision Jasher 30:1 compresses into Yahuah appearing to Jacob that night.'),
  ('jasher', 'jasher', 30, 2, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* The keeping-and-return promise Jasher 30:2 expands with the multiplied seed and victory over enemies.'),
  ('jasher', 'jasher', 30, 3, 'canon', 'genesis', 28, 19, 'free', E'Genesis 28:19 — *And he called the name of that place Beth-el: but the name of that city was called Luz at the first.* Jasher 30:3 names the place Bethel just as Genesis does, the city formerly Luz.'),
  ('jasher', 'jasher', 30, 1, 'canon', 'john', 1, 51, 'free', E'John 1:51 — *And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* The Messiah is the Bethel ladder of Jasher 30:1 — heaven opened, earth joined, on the Son of Adam.'),
  ('jasher', 'jasher', 30, 3, 'jubilees', 'jubilees', 27, 21, 'extras', E'Jubilees 27:21 — *And he dreamt that night, and behold a ladder set up on the earth, and the top of it reached to heaven, and behold, the angels of Yahuah (God) ascended and descended on it: and behold, Yahuah (God) stood upon it...* Jubilees narrates the identical Bethel night that Jasher 30:1-3 retells.'),
  -- thread: jasher-30-well-rachel
  ('jasher', 'jasher', 30, 4, 'canon', 'genesis', 29, 2, 'free', E'Genesis 29:2 — *And he looked, and behold a well in the field, and, lo, there were three flocks of sheep lying by it; for out of that well they watered the flocks: and a great stone was upon the well''s mouth.* The shepherd''s well of Jasher 30:4 where Jacob waits at Haran.'),
  ('jasher', 'jasher', 30, 6, 'canon', 'genesis', 29, 6, 'free', E'Genesis 29:6 — *And he said unto them, Is he well? And they said, He is well: and, behold, Rachel his daughter cometh with the sheep.* The shepherds'' answer that Rachel is coming, matched by Jasher 30:6.'),
  ('jasher', 'jasher', 30, 7, 'canon', 'genesis', 29, 9, 'free', E'Genesis 29:9 — *And while he yet spake with them, Rachel came with her father''s sheep: for she kept them.* Jasher 30:7 has the same — Rachel the shepherdess arriving while Jacob still speaks with the men.'),
  ('jasher', 'jasher', 30, 8, 'canon', 'genesis', 29, 11, 'free', E'Genesis 29:11 — *And Jacob kissed Rachel, and lifted up his voice, and wept.* The very gesture Jasher 30:8 records as Jacob sees his mother''s brother''s daughter.'),
  -- thread: jasher-30-laban-leah-rachel-seven-years
  ('jasher', 'jasher', 30, 10, 'canon', 'genesis', 29, 13, 'free', E'Genesis 29:13 — *And it came to pass, when Laban heard the tidings of Jacob his sister''s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house. And he told Laban all these things.* The welcome Jasher 30:10 gives — Laban running, kissing, embracing, bringing Jacob in.'),
  ('jasher', 'jasher', 30, 12, 'canon', 'genesis', 29, 15, 'free', E'Genesis 29:15 — *And Laban said unto Jacob, Because thou art my brother, shouldest thou therefore serve me for nought? tell me, what shall thy wages be?* The wage question Jasher 30:12 puts in Laban''s mouth word for word.'),
  ('jasher', 'jasher', 30, 13, 'canon', 'genesis', 29, 17, 'free', E'Genesis 29:17 — *Leah was tender eyed; but Rachel was beautiful and well favoured.* The same description of the two daughters carried in Jasher 30:13.'),
  ('jasher', 'jasher', 30, 14, 'canon', 'genesis', 29, 18, 'free', E'Genesis 29:18 — *And Jacob loved Rachel; and said, I will serve thee seven years for Rachel thy younger daughter.* The seven-year bond for Rachel that Jasher 30:14 records.'),
  ('jasher', 'jasher', 30, 14, 'jubilees', 'jubilees', 28, 1, 'extras', E'Jubilees 28:1 — *And he went on his journey, and came to the land of the east, to Laban, the brother of Rebecca, and he was with him, and served him for Rachel his daughter one week.* Jubilees narrates the same service-for-Rachel that Jasher 30:14 sets at seven years.'),
  -- thread: jasher-30-eber-dies-seed-line
  ('jasher', 'jasher', 30, 15, 'canon', 'genesis', 11, 17, 'free', E'Genesis 11:17 — *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters.* The same Eber of the seed-line whose death Jasher 30:15 sets in Jacob''s seventy-ninth year.'),
  ('jasher', 'jasher', 30, 15, 'canon', 'luke', 3, 35, 'free', E'Luke 3:35 — *Which was the son of Saruch, which was the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala,* Eber stands in the Messiah''s own genealogy, the kept line Jasher 30:15 pauses to mourn.'),
  -- thread: jasher-30-esau-wives-seir
  ('jasher', 'jasher', 30, 25, 'canon', 'genesis', 36, 5, 'free', E'Genesis 36:5 — *And Aholibamah bare Jeush, and Jaalam, and Korah: these are the sons of Esau, which were born unto him in the land of Canaan.* The three sons of Aholibamah that Jasher 30:25 names Yeush, Yaalan, and Korah.'),
  ('jasher', 'jasher', 30, 27, 'canon', 'genesis', 36, 6, 'free', E'Genesis 36:6 — *And Esau took his wives, and his sons, and his daughters, and all the persons of his house, and his cattle, and all his beasts, and all his substance, which he had got in the land of Canaan; and went into the country from the face of his brother Jacob.* Esau''s departure from Canaan that Jasher 30:27 sends to the land of Seir.'),
  ('jasher', 'jasher', 30, 26, 'canon', 'genesis', 36, 7, 'free', E'Genesis 36:7 — *For their riches were more than that they might dwell together; and the land wherein they were strangers could not bear them because of their cattle.* The reason for the move Jasher 30:26 gives — Esau''s cattle too abundant for Canaan to bear.'),
  ('jasher', 'jasher', 30, 27, 'jubilees', 'jubilees', 29, 17, 'extras', E'Jubilees 29:17 — *For in the days when Jacob went to Mesopotamia, Esau took to himself a wife Mahalath, the daughter of Ishmael, and he gathered together all the flocks of his father and his wives, and went up and dwelt on Mount Seir, and left Isaac his father at the Well of the Oath alone.* Jubilees sets Esau''s move to Seir in the same span Jasher 30:27 does — while Jacob serves Laban.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-30-bethel-ladder',
       E'The ladder at Bethel — Yahuah stands above and gives the land to the seed',
       E'Jacob breaks his journey at Moriah near Luz, and the covenant is spoken over him: *And Yahuah (the Lord) appeared there to Jacob on that night, and he said to him, I am Yahuah Elohim (the Lord God) of Abraham and the Elohim (God) of Isaac your father; the land upon which you lie I will give to you and your seed.* (Jasher 30:1) This is Genesis 28''s dream retold — *And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it* (Genesis 28:12), and the same word given there, *I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13). The election runs in the seed-line — the land is promised to the chosen seed, not earned. Jubilees narrates the very same night: *And he dreamt that night, and behold a ladder set up on the earth, and the top of it reached to heaven, and behold, the angels of Yahuah (God) ascended and descended on it* (Jubilees 27:21). And the Messiah names Himself the ladder — heaven joined to earth on the Son of Adam: *And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam* (John 1:51). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55725
  FROM _session252_ja30_lookup sv, _session252_ja30_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-30-well-rachel',
       E'The well at Haran — Rachel the shepherdess',
       E'Jacob reaches the East and waits where the flocks are watered: *he returned to Haran and he set by the shepherd''s well* (Jasher 30:4), and the shepherds tell him *behold his daughter Rachel is coming along to feed her father''s flock* (Jasher 30:6). This is Genesis 29 scene for scene — *And he looked, and behold a well in the field, and, lo, there were three flocks of sheep lying by it; for out of that well they watered the flocks: and a great stone was upon the well''s mouth* (Genesis 29:2), and the same answer at the well, *And he said unto them, Is he well? And they said, He is well: and, behold, Rachel his daughter cometh with the sheep* (Genesis 29:6). When she comes, Jacob weeps over her: *And when Jacob saw Rachel, the daughter of Laban, his mother''s brother, he ran and kissed her, and lifted up his voice and wept* (Jasher 30:8) — the canon''s own *And Jacob kissed Rachel, and lifted up his voice, and wept* (Genesis 29:11). The seed-line meets its mother at a well; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55728
  FROM _session252_ja30_lookup sv, _session252_ja30_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=30 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-30-laban-leah-rachel-seven-years',
       E'Laban''s house — Leah and Rachel, seven years for Rachel',
       E'Laban welcomes his sister''s son and asks his wage: *afterward Laban said to Jacob, Tell me what shall be your wages, for how can you serve me for nought?* (Jasher 30:12). Genesis frames it identically — *And Laban said unto Jacob, Because thou art my brother, shouldest thou therefore serve me for nought? tell me, what shall thy wages be?* (Genesis 29:15). The two daughters are named, and the heart is set: *the name of the elder was Leah and the name of the younger was Rachel; and Leah was tender-eyed, but Rachel was beautiful and well favored, and Jacob loved her* (Jasher 30:13), the canon''s *Leah was tender eyed; but Rachel was beautiful and well favoured* (Genesis 29:17). Then the bond: *I will serve you seven years for Rachel your younger daughter* (Jasher 30:14) — *And Jacob loved Rachel; and said, I will serve thee seven years for Rachel thy younger daughter* (Genesis 29:18). Jubilees keeps the same account: *And he went on his journey, and came to the land of the east, to Laban, the brother of Rebecca, and he was with him, and served him for Rachel his daughter one week* (Jubilees 28:1). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55731
  FROM _session252_ja30_lookup sv, _session252_ja30_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=30 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-30-eber-dies-seed-line',
       E'The death of Eber — the kept seed-line marks the years',
       E'Jasher dates Jacob''s exile by a death in the chosen line: *in the seventy ninth year of the life of Jacob, in that year died Eber the son of Shem, he was four hundred and sixty-four years old at his death* (Jasher 30:15), and Jacob mourns him: *And when Jacob heard that Eber was dead he grieved exceedingly, and he lamented and mourned over him many days* (Jasher 30:16). This is Jasher''s legendary expansion, not in Genesis 29''s narrative — but the man is the canon''s own seed-line link Adam→Seth→Noah→Shem→Eber→Abraham. Genesis records him and his years: *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters* (Genesis 11:17), and Luke threads him into the Messiah''s own line: *Which was the son of Heber, which was the son of Sala, which was the son of Cainan* (Luke 3:35). The seed is kept and counted, generation by generation; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55734
  FROM _session252_ja30_lookup sv, _session252_ja30_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=30 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-30-esau-wives-seir',
       E'Esau''s wives and the move to Seir — the brother parts from the seed',
       E'While Jacob serves in Haran, Jasher tracks the rejected brother: Ahlibamah *bare to Esau three sons, Yeush, Yaalan, and Korah* (Jasher 30:25), and when his cattle outgrew Canaan, *he rose up and took his wives and his sons and his daughters... and he went away from the inhabitants of the land to the land of Seir, and Esau and all belonging to him dwelt in the land of Seir* (Jasher 30:27). Genesis 36 tells it the same way — *And Aholibamah bare Jeush, and Jaalam, and Korah: these are the sons of Esau, which were born unto him in the land of Canaan* (Genesis 36:5), and *Esau took his wives, and his sons, and his daughters... and went into the country from the face of his brother Jacob. For their riches were more than that they might dwell together; and the land wherein they were strangers could not bear them because of their cattle* (Genesis 36:6-7). The election holds: Jacob keeps the land of promise and Esau departs to Seir. Jubilees records the same parting — *Esau took to himself a wife Mahalath, the daughter of Ishmael, and he gathered together all the flocks of his father and his wives, and went up and dwelt on Mount Seir* (Jubilees 29:17). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55737
  FROM _session252_ja30_lookup sv, _session252_ja30_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=30 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-30-bethel-ladder
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed;* The same covenant word Jasher 30:1 puts in Yahuah''s mouth over Jacob at Luz.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-bethel-ladder'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:12 — *And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it.* The ladder vision Jasher 30:1 compresses into Yahuah appearing to Jacob that night.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-bethel-ladder'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* The keeping-and-return promise Jasher 30:2 expands with the multiplied seed and victory over enemies.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-bethel-ladder'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 28:19 — *And he called the name of that place Beth-el: but the name of that city was called Luz at the first.* Jasher 30:3 names the place Bethel just as Genesis does, the city formerly Luz.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-bethel-ladder'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:51 — *And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* The Messiah is the Bethel ladder of Jasher 30:1 — heaven opened, earth joined, on the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-bethel-ladder'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 27:21 — *And he dreamt that night, and behold a ladder set up on the earth, and the top of it reached to heaven, and behold, the angels of Yahuah (God) ascended and descended on it: and behold, Yahuah (God) stood upon it...* Jubilees narrates the identical Bethel night that Jasher 30:1-3 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-bethel-ladder'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-30-well-rachel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:2 — *And he looked, and behold a well in the field, and, lo, there were three flocks of sheep lying by it; for out of that well they watered the flocks: and a great stone was upon the well''s mouth.* The shepherd''s well of Jasher 30:4 where Jacob waits at Haran.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-well-rachel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:6 — *And he said unto them, Is he well? And they said, He is well: and, behold, Rachel his daughter cometh with the sheep.* The shepherds'' answer that Rachel is coming, matched by Jasher 30:6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-well-rachel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:9 — *And while he yet spake with them, Rachel came with her father''s sheep: for she kept them.* Jasher 30:7 has the same — Rachel the shepherdess arriving while Jacob still speaks with the men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-well-rachel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 29:11 — *And Jacob kissed Rachel, and lifted up his voice, and wept.* The very gesture Jasher 30:8 records as Jacob sees his mother''s brother''s daughter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-well-rachel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-30-laban-leah-rachel-seven-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:13 — *And it came to pass, when Laban heard the tidings of Jacob his sister''s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house. And he told Laban all these things.* The welcome Jasher 30:10 gives — Laban running, kissing, embracing, bringing Jacob in.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-laban-leah-rachel-seven-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:15 — *And Laban said unto Jacob, Because thou art my brother, shouldest thou therefore serve me for nought? tell me, what shall thy wages be?* The wage question Jasher 30:12 puts in Laban''s mouth word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-laban-leah-rachel-seven-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:17 — *Leah was tender eyed; but Rachel was beautiful and well favoured.* The same description of the two daughters carried in Jasher 30:13.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-laban-leah-rachel-seven-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 29:18 — *And Jacob loved Rachel; and said, I will serve thee seven years for Rachel thy younger daughter.* The seven-year bond for Rachel that Jasher 30:14 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-laban-leah-rachel-seven-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 28:1 — *And he went on his journey, and came to the land of the east, to Laban, the brother of Rebecca, and he was with him, and served him for Rachel his daughter one week.* Jubilees narrates the same service-for-Rachel that Jasher 30:14 sets at seven years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-laban-leah-rachel-seven-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-30-eber-dies-seed-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:17 — *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters.* The same Eber of the seed-line whose death Jasher 30:15 sets in Jacob''s seventy-ninth year.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-eber-dies-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 3:35 — *Which was the son of Saruch, which was the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala,* Eber stands in the Messiah''s own genealogy, the kept line Jasher 30:15 pauses to mourn.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-eber-dies-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-30-esau-wives-seir
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:5 — *And Aholibamah bare Jeush, and Jaalam, and Korah: these are the sons of Esau, which were born unto him in the land of Canaan.* The three sons of Aholibamah that Jasher 30:25 names Yeush, Yaalan, and Korah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-esau-wives-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:6 — *And Esau took his wives, and his sons, and his daughters, and all the persons of his house, and his cattle, and all his beasts, and all his substance, which he had got in the land of Canaan; and went into the country from the face of his brother Jacob.* Esau''s departure from Canaan that Jasher 30:27 sends to the land of Seir.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-esau-wives-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:7 — *For their riches were more than that they might dwell together; and the land wherein they were strangers could not bear them because of their cattle.* The reason for the move Jasher 30:26 gives — Esau''s cattle too abundant for Canaan to bear.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-esau-wives-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 29:17 — *For in the days when Jacob went to Mesopotamia, Esau took to himself a wife Mahalath, the daughter of Ishmael, and he gathered together all the flocks of his father and his wives, and went up and dwelt on Mount Seir, and left Isaac his father at the Well of the Oath alone.* Jubilees sets Esau''s move to Seir in the same span Jasher 30:27 does — while Jacob serves Laban.'
  FROM cross_reference_threads t, cross_references x, _session252_ja30_lookup sv, _session252_ja30_lookup tv
 WHERE t.slug='jasher-30-esau-wives-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=30 AND sv.verse_number=27
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=29 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

