-- ----- fragment: minion_jubilees_45.sql (session251 jubilees 45) -----
-- Source anchor: jubilees/jubilees ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju45 (view _session251_ju45_lookup). Sort band base 54100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-45-goshen-reunion
  ('jubilees', 'jubilees', 45, 1, 'canon', 'genesis', 46, 28, 'free', E'Genesis 46:28 — *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen.* Jubilees 45:1 opens with Israel entering the land of Goshen exactly as Genesis sends Judah ahead to mark the way.'),
  ('jubilees', 'jubilees', 45, 2, 'canon', 'genesis', 46, 29, 'free', E'Genesis 46:29 — *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while.* This is the very scene Jubilees 45:2 retells — Joseph falling on his father''s neck and weeping.'),
  ('jubilees', 'jubilees', 45, 3, 'canon', 'genesis', 46, 30, 'free', E'Genesis 46:30 — *And Yashar''el (Israel) said unto Joseph, Now let me die, since I have seen thy face, because thou art yet alive.* Jubilees 45:3 quotes Israel''s cry verbatim, the rejected-then-exalted son restored alive to his father.'),
  -- thread: jubilees-45-jacob-before-pharaoh-bethel
  ('jubilees', 'jubilees', 45, 4, 'canon', 'genesis', 28, 13, 'free', E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed.* The Bethel vision Jacob recalls as "true" in Jubilees 45:4 is this covenant word given to him over the ladder.'),
  ('jubilees', 'jubilees', 45, 4, 'canon', 'genesis', 28, 14, 'free', E'Genesis 28:14 — *And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south: and in thee and in thy seed shall all the families of the earth be blessed.* The seed-multiplying promise of Bethel, which Jubilees 45:4 calls a true vision, is the very increase the Goshen chapter sets in motion.'),
  ('jubilees', 'jubilees', 45, 6, 'canon', 'genesis', 47, 7, 'free', E'Genesis 47:7 — *And Joseph brought in Jacob his father, and set him before Pharaoh: and Jacob blessed Pharaoh.* Jubilees 45:6 places Israel and his sons in Goshen by Joseph''s grant; Genesis adds the patriarch blessing the king of Egypt before settling there.'),
  ('jubilees', 'jubilees', 45, 6, 'canon', 'genesis', 47, 11, 'free', E'Genesis 47:11 — *And Joseph placed his father and his brethren, and gave them a possession in the land of Egypt, in the best of the land, in the land of Rameses, as Pharaoh had commanded.* Jubilees 45:6 names Goshen and Rameses as the best part of Egypt — the same grant Genesis records.'),
  -- thread: jubilees-45-famine-fifth-part-ordinance
  ('jubilees', 'jubilees', 45, 8, 'canon', 'genesis', 47, 20, 'free', E'Genesis 47:20 — *And Joseph bought all the land of Egypt for Pharaoh; for the Egyptians sold every man his field, because the famine prevailed over them: so the land became Pharaoh’s.* Jubilees 45:8 says Joseph acquired all the land of Egypt for Pharaoh in return for food — Genesis spells out the same purchase.'),
  ('jubilees', 'jubilees', 45, 11, 'canon', 'genesis', 47, 24, 'free', E'Genesis 47:24 — *And it shall come to pass in the increase, that ye shall give the fifth part unto Pharaoh, and four parts shall be your own, for seed of the field, and for your food, and for them of your households, and for food for your little ones.* The fifth-for-the-king, four-parts-for-the-people split of Jubilees 45:11 is taken straight from Joseph''s decree here.'),
  ('jubilees', 'jubilees', 45, 11, 'canon', 'genesis', 47, 26, 'free', E'Genesis 47:26 — *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh’s.* Jubilees 45:11 calls it an ordinance for Egypt "until this day" — the very phrasing of Genesis.'),
  -- thread: jubilees-45-jacob-years-last-days-burial
  ('jubilees', 'jubilees', 45, 13, 'canon', 'genesis', 47, 28, 'free', E'Genesis 47:28 — *And Jacob lived in the land of Egypt seventeen years: so the whole age of Jacob was an hundred forty and seven years.* Jubilees 45:13 gives the identical seventeen years and 147-year total, reckoned as three jubilees.'),
  ('jubilees', 'jubilees', 45, 13, 'canon', 'genesis', 49, 1, 'free', E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* Jubilees 45:13 says Israel made known to his sons what would come upon them in the last days — this is that deathbed prophecy.'),
  ('jubilees', 'jubilees', 45, 15, 'canon', 'genesis', 49, 30, 'free', E'Genesis 49:30 — *In the cave that is in the field of Machpelah, which is before Mamre, in the land of Canaan, which Abraham bought with the field of Ephron the Hittite for a possession of a buryingplace.* The "double cave near Abraham" of Jubilees 45:15 is Machpelah, the burying-place Jacob charged his sons to use.'),
  ('jubilees', 'jubilees', 45, 15, 'canon', 'genesis', 50, 13, 'free', E'Genesis 50:13 — *For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre.* Jubilees 45:15 records the burial in the double cave near Abraham that Genesis here carries out.'),
  -- thread: jubilees-45-levi-the-books-seed-multiplied
  ('jubilees', 'jubilees', 45, 15, 'jubilees', 'jubilees', 31, 13, 'extras', E'Jubilees 31:13 — *And he turned to Levi first, and began to bless him first, and said to him:, ’May the Elohim (God) of all, the very Yahuah (God) of all the ages, bless you and your children throughout all the ages. And may Yahuah (God) give to you and to your seed greatness and great glory, and cause you and your seed, from among all flesh, to approach Him to serve in His sanctuary as the angels of the presence and as the holy ones.* Jubilees 45:15 entrusts the books to Levi — the very priestly line Isaac blessed to serve in the sanctuary.'),
  ('jubilees', 'jubilees', 45, 13, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The multiplying seed that Jubilees 45 tracks from Goshen onward reaches its fullness here, opening the Exodus.'),
  ('jubilees', 'jubilees', 45, 13, 'canon', 'acts', 7, 17, 'free', E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt.* Stephen reads the same seed-multiplying that Jubilees 45 sets in motion as the fulfilling of the oath to Abraham.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-45-goshen-reunion',
       E'Israel comes down to Goshen — "now let me die since I have seen you"',
       E'Jubilees retells the reunion of father and son word for word from Genesis: *And Joseph went to meet his father Jacob, to the land of Goshen, and he fell on his father’s neck and wept* (Jubilees 45:2), and the old man''s cry, *Now let me die since I have seen you* (Jubilees 45:3). It ain''t new — this is Genesis spoken back: *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while* (Genesis 46:29), and *And Yashar''el (Israel) said unto Joseph, Now let me die, since I have seen thy face, because thou art yet alive* (Genesis 46:30). The seed that was carried down into Egypt now settles in the best of the land — *And Yashar''el (Israel) dwelt in the land of Egypt, in the country of Goshen; and they had possessions therein, and grew, and multiplied exceedingly* (Genesis 47:27) — the multiplying that the closing chapters of Jubilees keep before us.',
       sv.verse_id, ev.verse_id, 'extras', 54100
  FROM _session251_ju45_lookup sv, _session251_ju45_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=45 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-45-jacob-before-pharaoh-bethel',
       E'Jacob before Pharaoh, dwelling in Rameses — the Bethel vision come true',
       E'Jubilees grounds Israel''s settling in Egypt and Jacob''s confidence in the promise. *It is enough for me that I have seen your face whilst I am yet alive; yea, true is the vision which I saw at Bethel* (Jubilees 45:4) — the old man reads his life by the covenant word given at Bethel. *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13), and *And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south* (Genesis 28:14) — the seed-multiplying promise is exactly what Goshen begins to fulfill. The dwelling-place of Jubilees 45:6 is Genesis 47: *And Joseph placed his father and his brethren, and gave them a possession in the land of Egypt, in the best of the land, in the land of Rameses, as Pharaoh had commanded* (Genesis 47:11), and Jacob standing before Pharaoh to bless him — *And Joseph brought in Jacob his father, and set him before Pharaoh: and Jacob blessed Pharaoh* (Genesis 47:7).',
       sv.verse_id, ev.verse_id, 'extras', 54103
  FROM _session251_ju45_lookup sv, _session251_ju45_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=45 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-45-famine-fifth-part-ordinance',
       E'Joseph and the famine — the land to Pharaoh, the fifth-part ordinance',
       E'Jubilees compresses the whole famine economy of Genesis 47 into a few verses. *And the land of Egypt suffered by reason of the famine, and Joseph acquired all the land of Egypt for Pharaoh in return for food* (Jubilees 45:8) — *And Joseph bought all the land of Egypt for Pharaoh; for the Egyptians sold every man his field, because the famine prevailed over them: so the land became Pharaoh’s* (Genesis 47:20). And the lasting statute: *And Joseph took of the corn of the harvest the fifth part for the king and left four parts for them for food and for seed, and Joseph made it an ordinance for the land of Egypt until this day* (Jubilees 45:11) — Genesis says the same: *And it shall come to pass in the increase, that ye shall give the fifth part unto Pharaoh, and four parts shall be your own, for seed of the field, and for your food* (Genesis 47:24), and *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part* (Genesis 47:26). The rejected brother now feeds the world and keeps the seed alive — "it ain''t new."',
       sv.verse_id, ev.verse_id, 'extras', 54106
  FROM _session251_ju45_lookup sv, _session251_ju45_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=45 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-45-jacob-years-last-days-burial',
       E'Jacob''s years, the last-days blessing, and burial in the double cave',
       E'The patriarch''s life closes on the covenant numbers and the covenant grave. *And Yashar’el (Israel) lived in the land of Egypt seventeen years, and all the days which he lived were three jubilees, one hundred and forty-seven years* (Jubilees 45:13) — *And Jacob lived in the land of Egypt seventeen years: so the whole age of Jacob was an hundred forty and seven years* (Genesis 47:28). Before he dies he tells his sons "what would come upon them in the last days" (Jubilees 45:13), which is Genesis 49 verbatim: *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days* (Genesis 49:1). And he is laid in the double cave of the fathers — *And he slept with his fathers, and he was buried in the double cave in the land of Canaan, near Abraham his father* (Jubilees 45:15) — *In the cave that is in the field of Machpelah... which Abraham bought... for a possession of a buryingplace* (Genesis 49:30), where his sons carried him: *For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah* (Genesis 50:13).',
       sv.verse_id, ev.verse_id, 'extras', 54109
  FROM _session251_ju45_lookup sv, _session251_ju45_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=45 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-45-levi-the-books-seed-multiplied',
       E'Levi keeper of the books; the seed multiplies in Egypt',
       E'Jubilees closes the Joseph cycle with two threads it will not let the reader miss. First, the heavenly-tablets line of transmission: *And he gave all his books and the books of his fathers to Levi his son that he might preserve them and renew them for his children until this day* (Jubilees 45:15). This is the priestly line Isaac had already blessed — *And he turned to Levi first, and began to bless him first... cause you and your seed, from among all flesh, to approach Him to serve in His sanctuary* (Jubilees 31:13) — Levi as guardian of the law and the books, the priesthood that carries the covenant forward. Second, the seed multiplying that the whole chapter has been tracking now bursts out at the threshold of the Exodus: *And the children of Yashar’el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* (Exodus 1:7), echoed by Stephen — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt* (Acts 7:17). It ain''t new: the Bethel promise of dust-like seed is being kept.',
       sv.verse_id, ev.verse_id, 'extras', 54112
  FROM _session251_ju45_lookup sv, _session251_ju45_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=45 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-45-goshen-reunion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:28 — *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen.* Jubilees 45:1 opens with Israel entering the land of Goshen exactly as Genesis sends Judah ahead to mark the way.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-goshen-reunion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:29 — *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while.* This is the very scene Jubilees 45:2 retells — Joseph falling on his father''s neck and weeping.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-goshen-reunion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 46:30 — *And Yashar''el (Israel) said unto Joseph, Now let me die, since I have seen thy face, because thou art yet alive.* Jubilees 45:3 quotes Israel''s cry verbatim, the rejected-then-exalted son restored alive to his father.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-goshen-reunion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-45-jacob-before-pharaoh-bethel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed.* The Bethel vision Jacob recalls as "true" in Jubilees 45:4 is this covenant word given to him over the ladder.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-before-pharaoh-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:14 — *And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south: and in thee and in thy seed shall all the families of the earth be blessed.* The seed-multiplying promise of Bethel, which Jubilees 45:4 calls a true vision, is the very increase the Goshen chapter sets in motion.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-before-pharaoh-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 47:7 — *And Joseph brought in Jacob his father, and set him before Pharaoh: and Jacob blessed Pharaoh.* Jubilees 45:6 places Israel and his sons in Goshen by Joseph''s grant; Genesis adds the patriarch blessing the king of Egypt before settling there.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-before-pharaoh-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 47:11 — *And Joseph placed his father and his brethren, and gave them a possession in the land of Egypt, in the best of the land, in the land of Rameses, as Pharaoh had commanded.* Jubilees 45:6 names Goshen and Rameses as the best part of Egypt — the same grant Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-before-pharaoh-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-45-famine-fifth-part-ordinance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 47:20 — *And Joseph bought all the land of Egypt for Pharaoh; for the Egyptians sold every man his field, because the famine prevailed over them: so the land became Pharaoh’s.* Jubilees 45:8 says Joseph acquired all the land of Egypt for Pharaoh in return for food — Genesis spells out the same purchase.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-famine-fifth-part-ordinance'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 47:24 — *And it shall come to pass in the increase, that ye shall give the fifth part unto Pharaoh, and four parts shall be your own, for seed of the field, and for your food, and for them of your households, and for food for your little ones.* The fifth-for-the-king, four-parts-for-the-people split of Jubilees 45:11 is taken straight from Joseph''s decree here.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-famine-fifth-part-ordinance'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 47:26 — *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh’s.* Jubilees 45:11 calls it an ordinance for Egypt "until this day" — the very phrasing of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-famine-fifth-part-ordinance'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-45-jacob-years-last-days-burial
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 47:28 — *And Jacob lived in the land of Egypt seventeen years: so the whole age of Jacob was an hundred forty and seven years.* Jubilees 45:13 gives the identical seventeen years and 147-year total, reckoned as three jubilees.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-years-last-days-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* Jubilees 45:13 says Israel made known to his sons what would come upon them in the last days — this is that deathbed prophecy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-years-last-days-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:30 — *In the cave that is in the field of Machpelah, which is before Mamre, in the land of Canaan, which Abraham bought with the field of Ephron the Hittite for a possession of a buryingplace.* The "double cave near Abraham" of Jubilees 45:15 is Machpelah, the burying-place Jacob charged his sons to use.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-years-last-days-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 50:13 — *For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre.* Jubilees 45:15 records the burial in the double cave near Abraham that Genesis here carries out.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-jacob-years-last-days-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-45-levi-the-books-seed-multiplied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 31:13 — *And he turned to Levi first, and began to bless him first, and said to him:, ’May the Elohim (God) of all, the very Yahuah (God) of all the ages, bless you and your children throughout all the ages. And may Yahuah (God) give to you and to your seed greatness and great glory, and cause you and your seed, from among all flesh, to approach Him to serve in His sanctuary as the angels of the presence and as the holy ones.* Jubilees 45:15 entrusts the books to Levi — the very priestly line Isaac blessed to serve in the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-levi-the-books-seed-multiplied'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=31 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The multiplying seed that Jubilees 45 tracks from Goshen onward reaches its fullness here, opening the Exodus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-levi-the-books-seed-multiplied'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt.* Stephen reads the same seed-multiplying that Jubilees 45 sets in motion as the fulfilling of the oath to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session251_ju45_lookup sv, _session251_ju45_lookup tv
 WHERE t.slug='jubilees-45-levi-the-books-seed-multiplied'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=45 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

