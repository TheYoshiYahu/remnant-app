-- ----- fragment: minion_1adameve_37.sql (session253 1-adam-eve 37) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae37 (view _session253_1ae37_lookup). Sort band base 64900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-37-fig-leaves-remembered
  ('adam-eve-conflict', '1-adam-eve', 37, 1, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* These are the very fig leaves Adam sees and names in 1 Adam & Eve 37:1 — the covering of the fall.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 2, 'jubilees', 'jubilees', 3, 21, 'extras', E'Jubilees 3:21 — *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked. And he took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame.* The same primeval history records the fig-leaf covering that 1 Adam & Eve 37:2 turns away from to seek the Tree of Life.'),
  -- thread: 1-adam-eve-37-transgressed-the-commandment
  ('adam-eve-conflict', '1-adam-eve', 37, 4, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* This is the commandment Adam confesses he transgressed at the sixth hour in 1 Adam & Eve 37:4.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 4, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The act that stripped the bright nature Adam mourns in 1 Adam & Eve 37:4.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 5, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* This is the coming-out of the garden in the evening that Adam recounts in 1 Adam & Eve 37:5.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 5, 'jubilees', 'jubilees', 3, 26, 'extras', E'Jubilees 3:26 — *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden.* The same expulsion from Eden that 1 Adam & Eve 37:5 sets in the evening of the day of the fall.'),
  -- thread: 1-adam-eve-37-cherub-keeps-the-tree-of-life
  ('adam-eve-conflict', '1-adam-eve', 37, 9, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever.* The very reason the Tree of Life was barred, which Adam grieves in 1 Adam & Eve 37:9.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 9, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* This is the cherub Adam names as keeping the Tree of Life in 1 Adam & Eve 37:9.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 8, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The fruit Adam pleads for in 1 Adam & Eve 37:8 is given at last to the overcomer in the restored paradise.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 8, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The barred Tree of Life of 1 Adam & Eve 37:8 is the inheritance reopened to the commandment-keeping seed.'),
  -- thread: 1-adam-eve-37-look-with-an-eye-of-pity
  ('adam-eve-conflict', '1-adam-eve', 37, 7, 'canon', 'psalms', 103, 10, 'free', E'Psalm 103:10 — *He hath not dealt with us after our sins; nor rewarded us according to our iniquities.* The very pardon Adam asks for in 1 Adam & Eve 37:7 — not to be avenged according to his transgression.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 7, 'canon', 'psalms', 103, 13, 'free', E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The eye of pity Adam appeals to in 1 Adam & Eve 37:7 is the Father''s mercy toward those who fear Him.'),
  ('adam-eve-conflict', '1-adam-eve', 37, 10, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The mercy Adam pleads in 1 Adam & Eve 37:10 is the seed-war''s end — the Son manifested to undo the serpent''s hour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-37-fig-leaves-remembered',
       E'The figs and their leaves — the first covering remembered',
       E'Adam looks on the very leaves that first hid the nakedness of the fall: *"Do you not see these figs and their leaves, with which we covered ourselves when we were stripped of our bright nature? But now, we do not know what misery and suffering may come over us from eating them"* (1 Adam & Eve 37:1), and he and Eve restrain themselves — *"let us restrain ourselves and not eat of them, you and I; and let us ask Elohim (God) to give us of the fruit of the Tree of Life"* (1 Adam & Eve 37:2). It ain''t new: the fig leaves are Genesis on the page — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7) — the self-made covering that could not restore the lost glory. Jubilees tells the same scene the same way: *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked. And he took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame* (Jubilees 3:21). Adam knows now that the fig was the badge of his ruin, not his repair, and turns from it to ask the Tree of Life instead.',
       sv.verse_id, ev.verse_id, 'extras', 64900
  FROM _session253_1ae37_lookup sv, _session253_1ae37_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=37 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-37-transgressed-the-commandment',
       E'One hour''s transgression — the commandment broken, the garden lost',
       E'Adam dates his ruin to a single hour: *"O Elohim (God), when we transgressed Your commandment at the sixth hour of Friday, we were stripped of the bright nature we had, and did not continue in the garden after our transgression, more than three hours"* (1 Adam & Eve 37:4), *"But in the evening You made us come out of it"* (1 Adam & Eve 37:5). The commandment he broke is Genesis: *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17), and the eating: *she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat* (Genesis 3:6). The coming-out of the garden he names is the expulsion: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23). Jubilees carries the same sentence of exile: *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26). The forty-three days of sorrow are the lengthening shadow of that one hour outside the gate.',
       sv.verse_id, ev.verse_id, 'extras', 64903
  FROM _session253_1ae37_lookup sv, _session253_1ae37_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=37 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-37-cherub-keeps-the-tree-of-life',
       E'The cherub keeps the Tree of Life — barred now, restored to the overcomer',
       E'Adam begs for the one fruit set out of his reach: *"O Elohim (God), give us of the fruit of the Tree of Life, that we may eat of it, and live"* (1 Adam & Eve 37:8), knowing the way is guarded — *"You made us come out of the garden, and sent a cherub to keep the Tree of Life, lest we should eat thereof, and live"* (1 Adam & Eve 37:9). This is Genesis exactly: *And now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22), *and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). What Adam cannot reach by his own hand, the Lamb reopens at the end of the book of the war: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7), *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The flaming sword stands today; in the city it is sheathed for the seed kept faithful.',
       sv.verse_id, ev.verse_id, 'extras', 64906
  FROM _session253_1ae37_lookup sv, _session253_1ae37_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=37 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-37-look-with-an-eye-of-pity',
       E'Look on us with an eye of pity — covenant mercy and the seed kept',
       E'Adam does not plead his merit but Yahuah''s mercy: *"O Elohim (God), look at us with an eye of pity, and do not avenge us according to our transgression of Your commandment, in Your presence"* (1 Adam & Eve 37:7), *"Make these forty-three days an equivalent for the one hour in which we transgressed"* (1 Adam & Eve 37:10). The Psalm answers him in the same tongue: *He hath not dealt with us after our sins; nor rewarded us according to our iniquities* (Psalm 103:10), *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him* (Psalm 103:13). And the eye of pity is not bare clemency but the seed-promise already moving against the serpent — the whole purpose of the war this book unfolds: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The mercy Adam asks on the forty-third day is the mercy that will crush the head of the one who stripped him.',
       sv.verse_id, ev.verse_id, 'extras', 64909
  FROM _session253_1ae37_lookup sv, _session253_1ae37_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=37 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-37-fig-leaves-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* These are the very fig leaves Adam sees and names in 1 Adam & Eve 37:1 — the covering of the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-fig-leaves-remembered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 3:21 — *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked. And he took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame.* The same primeval history records the fig-leaf covering that 1 Adam & Eve 37:2 turns away from to seek the Tree of Life.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-fig-leaves-remembered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-37-transgressed-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* This is the commandment Adam confesses he transgressed at the sixth hour in 1 Adam & Eve 37:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-transgressed-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The act that stripped the bright nature Adam mourns in 1 Adam & Eve 37:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-transgressed-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* This is the coming-out of the garden in the evening that Adam recounts in 1 Adam & Eve 37:5.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-transgressed-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:26 — *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden.* The same expulsion from Eden that 1 Adam & Eve 37:5 sets in the evening of the day of the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-transgressed-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-37-cherub-keeps-the-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever.* The very reason the Tree of Life was barred, which Adam grieves in 1 Adam & Eve 37:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-cherub-keeps-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* This is the cherub Adam names as keeping the Tree of Life in 1 Adam & Eve 37:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-cherub-keeps-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The fruit Adam pleads for in 1 Adam & Eve 37:8 is given at last to the overcomer in the restored paradise.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-cherub-keeps-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The barred Tree of Life of 1 Adam & Eve 37:8 is the inheritance reopened to the commandment-keeping seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-cherub-keeps-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-37-look-with-an-eye-of-pity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:10 — *He hath not dealt with us after our sins; nor rewarded us according to our iniquities.* The very pardon Adam asks for in 1 Adam & Eve 37:7 — not to be avenged according to his transgression.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-look-with-an-eye-of-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The eye of pity Adam appeals to in 1 Adam & Eve 37:7 is the Father''s mercy toward those who fear Him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-look-with-an-eye-of-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The mercy Adam pleads in 1 Adam & Eve 37:10 is the seed-war''s end — the Son manifested to undo the serpent''s hour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae37_lookup sv, _session253_1ae37_lookup tv
 WHERE t.slug='1-adam-eve-37-look-with-an-eye-of-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

