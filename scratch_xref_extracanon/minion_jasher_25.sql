-- ----- fragment: minion_jasher_25.sql (session252 jasher 25) -----
-- Source anchor: jasher/jasher ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja25 (view _session252_ja25_lookup). Sort band base 55600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-25-keturah-six-sons
  ('jasher', 'jasher', 25, 1, 'canon', 'genesis', 25, 1, 'free', E'Genesis 25:1 — *Then again Abraham took a wife, and her name was Keturah.* The Genesis source Jasher 25:1 is retelling, Abraham taking Keturah in his old age.'),
  ('jasher', 'jasher', 25, 2, 'canon', 'genesis', 25, 2, 'free', E'Genesis 25:2 — *And she bare him Zimran, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah.* The same six sons of Keturah named in Jasher 25:2.'),
  ('jasher', 'jasher', 25, 3, 'canon', 'genesis', 25, 4, 'free', E'Genesis 25:4 — *And the sons of Midian; Ephah, and Epher, and Hanoch, and Abidah, and Eldaah. All these were the children of Keturah.* The Midian descendants Jasher 25:3 expands into a fuller genealogy come straight from the Genesis seed-list.'),
  ('jasher', 'jasher', 25, 2, 'jubilees', 'jubilees', 19, 11, 'extras', E'Jubilees 19:11 — *And Abraham took to himself a third wife, and her name was Keturah, from among the daughters of his household servants, for Hagar had died before Sarah. And she bare him six sons, Zimram, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah, in the two weeks of years.* The same Keturah-and-six-sons scene in the parallel patriarchal record beside Jasher 25:2.'),
  -- thread: jasher-25-gifts-sent-east-all-to-isaac
  ('jasher', 'jasher', 25, 6, 'canon', 'genesis', 25, 6, 'free', E'Genesis 25:6 — *But unto the sons of the concubines, which Abraham had, Abraham gave gifts, and sent them away from Isaac his son, while he yet lived, eastward, unto the east country.* The gifts and the eastward sending of Jasher 25:6 are the Genesis original.'),
  ('jasher', 'jasher', 25, 6, 'canon', 'genesis', 25, 5, 'free', E'Genesis 25:5 — *And Abraham gave all that he had unto Isaac.* The election Jasher dramatizes: the branches are sent off with gifts while the whole inheritance stays with the chosen heir.'),
  ('jasher', 'jasher', 25, 6, 'jubilees', 'jubilees', 20, 10, 'extras', E'Jubilees 20:10 — *And you will be for a blessing on the earth, And all nations of the earth will desire you, And bless your sons in my name, That they may be blessed as I am.” And he gave to Ishmael and to his sons, and to the sons of Keturah, gifts, and sent them away from Isaac his son, and he gave everything to Isaac his son.* The parallel record gives the same verdict as Jasher 25:6 — gifts to the branches, everything to Isaac.'),
  -- thread: jasher-25-ishmael-twelve-princes
  ('jasher', 'jasher', 25, 14, 'canon', 'genesis', 25, 12, 'free', E'Genesis 25:12 — *Now these are the generations of Ishmael, Abraham''s son, whom Hagar the Egyptian, Sarah''s handmaid, bare unto Abraham:* The genealogy heading of Jasher 25:14 is the Genesis original word-for-word.'),
  ('jasher', 'jasher', 25, 19, 'canon', 'genesis', 25, 16, 'free', E'Genesis 25:16 — *These are the sons of Ishmael, and these are their names, by their towns, and by their castles; twelve princes according to their nations.* The twelve princes summary of Jasher 25:19 matches Genesis exactly.'),
  ('jasher', 'jasher', 25, 19, 'canon', 'genesis', 17, 20, 'free', E'Genesis 17:20 — *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation.* The twelve princes Jasher 25:19 records are the keeping of this promise spoken over Ishmael long before.'),
  -- thread: jasher-25-ishmael-dwelt-havilah-shur
  ('jasher', 'jasher', 25, 20, 'canon', 'genesis', 25, 18, 'free', E'Genesis 25:18 — *And they dwelt from Havilah unto Shur, that is before Egypt, as thou goest toward Assyria: and he died in the presence of all his brethren.* The exact borders of Ishmael''s dwelling that Jasher 25:20 records.'),
  ('jasher', 'jasher', 25, 21, 'canon', 'genesis', 16, 10, 'free', E'Genesis 16:10 — *And the angel of Yahuah (LORD) said unto her, I will multiply thy seed exceedingly, that it shall not be numbered for multitude.* The abundant increase of Ishmael''s sons in Jasher 25:21 is this promise to Hagar coming to pass.'),
  -- thread: jasher-25-rebecca-barren-isaac-election
  ('jasher', 'jasher', 25, 28, 'canon', 'genesis', 25, 21, 'free', E'Genesis 25:21 — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* The barrenness of Rebecca that Jasher 25:28 names is the Genesis source — the covenant rests on a womb only Yahuah can open.'),
  ('jasher', 'jasher', 25, 28, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Rebecca''s barrenness in Jasher 25:28 sets up the election Paul reads here — the seed chosen before any work.'),
  ('jasher', 'jasher', 25, 28, 'jubilees', 'jubilees', 19, 13, 'extras', E'Jubilees 19:13 — *And in the sixth week, in the second year thereof, Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field, and hairy, and Jacob dwelt in tents.* The parallel record carries Rebecca''s barren womb of Jasher 25:28 forward to the elect twins it will bear.'),
  ('jasher', 'jasher', 25, 28, 'canon', 'genesis', 11, 10, 'free', E'Genesis 11:10 — *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood:* The Arpachshad whose death Jasher 25:28 records anchors the chosen seed-line from Shem down to Isaac.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-25-keturah-six-sons',
       E'Keturah and the six sons of Abraham''s old age',
       E'Jasher opens the chapter where Genesis does: *And it was at that time that Abraham again took a wife in his old age, and her name was Keturah, from the land of Canaan* (Jasher 25:1), *And she bare to him Zimran, Jokshan, Medan, Midian, Ishbak and Shuach, being six sons* (Jasher 25:2). It ain''t new — this is Genesis retold: *Then again Abraham took a wife, and her name was Keturah* (Genesis 25:1), and *And she bare him Zimran, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah* (Genesis 25:2). The same scene stands in the parallel patriarchal record: *And Abraham took to himself a third wife, and her name was Keturah, from among the daughters of his household servants, for Hagar had died before Sarah. And she bare him six sons, Zimram, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah, in the two weeks of years* (Jubilees 19:11). These six are sent out from the seed-line — branches, not the chosen heir.',
       sv.verse_id, ev.verse_id, 'extras', 55600
  FROM _session252_ja25_lookup sv, _session252_ja25_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=25 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-25-gifts-sent-east-all-to-isaac',
       E'The gifts, the sending east, and all given to Isaac',
       E'*And Abraham sent all these away, and he gave them gifts, and they went away from his son Isaac to dwell wherever they should find a place* (Jasher 25:6), *And all these went to the mountain at the east, and they built themselves six cities in which they dwelt to this day* (Jasher 25:7). This is Genesis exactly: *And Abraham gave all that he had unto Isaac* (Genesis 25:5), *But unto the sons of the concubines, which Abraham had, Abraham gave gifts, and sent them away from Isaac his son, while he yet lived, eastward, unto the east country* (Genesis 25:6). The election is in the structure — the branches receive gifts and the east country, but the covenant inheritance is undivided to Isaac. Jubilees carries the same verdict: *And he gave to Ishmael and to his sons, and to the sons of Keturah, gifts, and sent them away from Isaac his son, and he gave everything to Isaac his son* (Jubilees 20:10). The seed is kept in one line.',
       sv.verse_id, ev.verse_id, 'extras', 55603
  FROM _session252_ja25_lookup sv, _session252_ja25_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=25 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-25-ishmael-twelve-princes',
       E'The generations of Ishmael — twelve princes',
       E'*And these are the generations of Ishmael the son Abraham, whom Hagar, Sarah''s handmaid, bare to Abraham* (Jasher 25:14), and after the listing, *These are the sons of Ishmael, and these are their names, being twelve princes according to their nations* (Jasher 25:19). Genesis tells it the same way: *Now these are the generations of Ishmael, Abraham''s son, whom Hagar the Egyptian, Sarah''s handmaid, bare unto Abraham* (Genesis 25:12), and *These are the sons of Ishmael, and these are their names, by their towns, and by their castles; twelve princes according to their nations* (Genesis 25:16). The twelve princes are no accident — they are the keeping of a promise spoken long before: *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation* (Genesis 17:20). Yahuah keeps His word to Hagar''s son even while the covenant line runs through Isaac.',
       sv.verse_id, ev.verse_id, 'extras', 55606
  FROM _session252_ja25_lookup sv, _session252_ja25_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=25 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-25-ishmael-dwelt-havilah-shur',
       E'Ishmael multiplied and dwelt from Havilah to Shur',
       E'*And they went and dwelt near the wilderness of Paran, and their dwelling was from Havilah to Shur, that is before Egypt as you come toward Assyria* (Jasher 25:20), *And Ishmael and his sons dwelt in the land, and they had children born to them, and they were fruitful and increased abundantly* (Jasher 25:21). Genesis sets the same borders: *And they dwelt from Havilah unto Shur, that is before Egypt, as thou goest toward Assyria: and he died in the presence of all his brethren* (Genesis 25:18). The increase fulfills the word the angel of Yahuah spoke to Hagar in the wilderness: *And the angel of Yahuah (LORD) said unto her, I will multiply thy seed exceedingly, that it shall not be numbered for multitude* (Genesis 16:10). It ain''t new — the fruitfulness Jasher reports is a promise being kept.',
       sv.verse_id, ev.verse_id, 'extras', 55609
  FROM _session252_ja25_lookup sv, _session252_ja25_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=25 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-25-rebecca-barren-isaac-election',
       E'Rebecca barren, Isaac kept — and the election to come',
       E'The chapter closes on the chosen line held in tension: *And Rebecca the daughter of Bethuel, the wife of Abraham''s son Isaac, was barren in those days, she had no offspring; and Isaac dwelt with his father in the land of Canaan; and Yahuah (the Lord) was with Isaac; and Arpachshad the son of Shem the son of Noah died in those days, in the forty-eighth year of the life of Isaac* (Jasher 25:28). Genesis tells the barrenness the same way: *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived* (Genesis 25:21). The covenant rests on a barren womb because election precedes confession — the seed is given, not earned: *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11). The parallel record presses the same election forward to the twins that womb will bear: *And in the sixth week, in the second year thereof, Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field, and hairy, and Jacob dwelt in tents* (Jubilees 19:13). And the dying Arpachshad anchors Jasher''s seed-line back to Shem: *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood* (Genesis 11:10) — Adam to Seth to Noah to Shem to Abraham to Isaac, the line kept generation by generation.',
       sv.verse_id, ev.verse_id, 'extras', 55612
  FROM _session252_ja25_lookup sv, _session252_ja25_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=25 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-25-keturah-six-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:1 — *Then again Abraham took a wife, and her name was Keturah.* The Genesis source Jasher 25:1 is retelling, Abraham taking Keturah in his old age.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-keturah-six-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:2 — *And she bare him Zimran, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah.* The same six sons of Keturah named in Jasher 25:2.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-keturah-six-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:4 — *And the sons of Midian; Ephah, and Epher, and Hanoch, and Abidah, and Eldaah. All these were the children of Keturah.* The Midian descendants Jasher 25:3 expands into a fuller genealogy come straight from the Genesis seed-list.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-keturah-six-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 19:11 — *And Abraham took to himself a third wife, and her name was Keturah, from among the daughters of his household servants, for Hagar had died before Sarah. And she bare him six sons, Zimram, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah, in the two weeks of years.* The same Keturah-and-six-sons scene in the parallel patriarchal record beside Jasher 25:2.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-keturah-six-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-25-gifts-sent-east-all-to-isaac
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:6 — *But unto the sons of the concubines, which Abraham had, Abraham gave gifts, and sent them away from Isaac his son, while he yet lived, eastward, unto the east country.* The gifts and the eastward sending of Jasher 25:6 are the Genesis original.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-gifts-sent-east-all-to-isaac'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:5 — *And Abraham gave all that he had unto Isaac.* The election Jasher dramatizes: the branches are sent off with gifts while the whole inheritance stays with the chosen heir.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-gifts-sent-east-all-to-isaac'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 20:10 — *And you will be for a blessing on the earth, And all nations of the earth will desire you, And bless your sons in my name, That they may be blessed as I am.” And he gave to Ishmael and to his sons, and to the sons of Keturah, gifts, and sent them away from Isaac his son, and he gave everything to Isaac his son.* The parallel record gives the same verdict as Jasher 25:6 — gifts to the branches, everything to Isaac.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-gifts-sent-east-all-to-isaac'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-25-ishmael-twelve-princes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:12 — *Now these are the generations of Ishmael, Abraham''s son, whom Hagar the Egyptian, Sarah''s handmaid, bare unto Abraham:* The genealogy heading of Jasher 25:14 is the Genesis original word-for-word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-ishmael-twelve-princes'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:16 — *These are the sons of Ishmael, and these are their names, by their towns, and by their castles; twelve princes according to their nations.* The twelve princes summary of Jasher 25:19 matches Genesis exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-ishmael-twelve-princes'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:20 — *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation.* The twelve princes Jasher 25:19 records are the keeping of this promise spoken over Ishmael long before.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-ishmael-twelve-princes'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-25-ishmael-dwelt-havilah-shur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:18 — *And they dwelt from Havilah unto Shur, that is before Egypt, as thou goest toward Assyria: and he died in the presence of all his brethren.* The exact borders of Ishmael''s dwelling that Jasher 25:20 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-ishmael-dwelt-havilah-shur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 16:10 — *And the angel of Yahuah (LORD) said unto her, I will multiply thy seed exceedingly, that it shall not be numbered for multitude.* The abundant increase of Ishmael''s sons in Jasher 25:21 is this promise to Hagar coming to pass.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-ishmael-dwelt-havilah-shur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-25-rebecca-barren-isaac-election
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:21 — *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* The barrenness of Rebecca that Jasher 25:28 names is the Genesis source — the covenant rests on a womb only Yahuah can open.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-rebecca-barren-isaac-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Rebecca''s barrenness in Jasher 25:28 sets up the election Paul reads here — the seed chosen before any work.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-rebecca-barren-isaac-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 19:13 — *And in the sixth week, in the second year thereof, Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field, and hairy, and Jacob dwelt in tents.* The parallel record carries Rebecca''s barren womb of Jasher 25:28 forward to the elect twins it will bear.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-rebecca-barren-isaac-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:10 — *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood:* The Arpachshad whose death Jasher 25:28 records anchors the chosen seed-line from Shem down to Isaac.'
  FROM cross_reference_threads t, cross_references x, _session252_ja25_lookup sv, _session252_ja25_lookup tv
 WHERE t.slug='jasher-25-rebecca-barren-isaac-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=25 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

