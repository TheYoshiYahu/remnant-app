-- ----- fragment: minion_1adameve_30.sql (session253 1-adam-eve 30) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae30 (view _session253_1ae30_lookup). Sort band base 64725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-30-gold-incense-myrrh
  ('adam-eve-conflict', '1-adam-eve', 30, 10, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The three tokens given to Adam at 1-adam-eve 30:10 are the same three the magi lay before the Saviour — kept from the garden against His coming.'),
  ('adam-eve-conflict', '1-adam-eve', 30, 6, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh gathered from the borders of the garden in 1-adam-eve 30:6 are the very gifts borne to Bethlehem.'),
  ('adam-eve-conflict', '1-adam-eve', 30, 10, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The myrrh that is a token of sorrow in 1-adam-eve 30:10 answers the sorrow pronounced over the ground at the fall.'),
  -- thread: 1-adam-eve-30-cherub-tree-of-life
  ('adam-eve-conflict', '1-adam-eve', 30, 7, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub who guards the Tree in 1-adam-eve 30:7 is the same guardian set at the east of Eden after the expulsion.'),
  ('adam-eve-conflict', '1-adam-eve', 30, 7, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Tree of Life beside which the angels stand in 1-adam-eve 30:7 stands again, unbarred, in the restored City.'),
  ('adam-eve-conflict', '1-adam-eve', 30, 7, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Tree of Life in the garden of 1-adam-eve 30:7 is the same Yahuah planted in the midst of Eden at the beginning.'),
  -- thread: 1-adam-eve-30-water-of-comfort
  ('adam-eve-conflict', '1-adam-eve', 30, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s seeking to make an end of Adam and Eve in 1-adam-eve 30:9 is the serpent striking at the seed; Yahuah''s comfort keeps the seed He swore to preserve.'),
  ('adam-eve-conflict', '1-adam-eve', 30, 8, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The spring of water that comforts the mourners in 1-adam-eve 30:8 anticipates the river of life that flows from the throne in the City.'),
  -- thread: 1-adam-eve-30-incense-before-elohim
  ('adam-eve-conflict', '1-adam-eve', 30, 2, 'canon', 'exodus', 30, 34, 'free', E'Exodus 30:34 — *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* The sweet-smelling incense Yahuah commands brought for Adam in 1-adam-eve 30:2 is the same holy frankincense He later commands for the tabernacle''s perfume.'),
  ('adam-eve-conflict', '1-adam-eve', 30, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim whose order moves the angels and the cherub in 1-adam-eve 30:3 is the Logos who was in the beginning, soon to restore the light Adam lost.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-30-gold-incense-myrrh',
       E'Gold, Incense, and Myrrh — Kept Against the Saviour''s Coming',
       E'From the gates of the lost garden the angels bring three tokens to the grieving man: *The golden rods were from the Indian sea, where there are precious stones. The incense was from the eastern border of the garden; and the myrrh from the western border, from where bitterness came over Adam.* (1-adam-eve 30:6). These are the very treasures the holy line will keep in the Cave of Treasures down to the manger, for when the wise men came they *presented unto him gifts; gold, and frankincense, and myrrh.* (Matthew 2:11) — the gold for the King, the incense for Elohim, the myrrh for the burial; it ain''t new, the gifts were chosen the first day outside Eden. Adam reads them aright: *And when Adam saw the golden rods, the incense and the myrrh, he was rejoiced and cried because he thought that the gold was a token of the kingdom from where he had come, that the incense was a token of the bright light which had been taken from him, and that the myrrh was a token of the sorrow in which he was.* (1-adam-eve 30:10). The myrrh of bitterness answers the curse spoken over the ground: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17) — and that same sorrow is undone in the seed who carries the myrrh to His own grave.',
       sv.verse_id, ev.verse_id, 'extras', 64725
  FROM _session253_1ae30_lookup sv, _session253_1ae30_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=30 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-30-cherub-tree-of-life',
       E'The Cherub at the Garden and the Tree of Life',
       E'Elohim sends His angels back to the very gate that was barred against Adam: *And the angels brought these things to Elohim (God), by the Tree of Life, in the garden.* (1-adam-eve 30:7), and at the Tree''s spring the cherub yields up the incense and myrrh. This is the gate kept by the guardian set after the fall: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24) — the way is shut, yet mercy reaches through the cherub to comfort the exiles. And the Tree of Life is not lost forever; it stands again in the City at the end: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2). The seed-war that opens here closes at that Tree.',
       sv.verse_id, ev.verse_id, 'extras', 64728
  FROM _session253_1ae30_lookup sv, _session253_1ae30_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=30 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-30-water-of-comfort',
       E'The Spring of Water and Yahuah''s Comfort for the Mourners',
       E'Yahuah does not leave the exiles to despair on the mountain where Satan had driven them: *Then Elohim (God) said to the angels, "Dip them in the spring of water; then take them and sprinkle their water over Adam and Eve, that they be a little comforted in their sorrow, and give them to Adam and Eve.* (1-adam-eve 30:8), and the angels carry the comfort to the very crag of the enemy''s assault: *And the angels did as Elohim (God) had commanded them, and they gave all those things to Adam and Eve on the top of the mountain on which Satan had placed them, when he sought to make an end of them.* (1-adam-eve 30:9). This is covenant mercy keeping the seed Satan sought to destroy — the enmity sworn at the gate: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The water of comfort sprinkled here flows on to the throne: *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* (Revelation 22:1).',
       sv.verse_id, ev.verse_id, 'extras', 64731
  FROM _session253_1ae30_lookup sv, _session253_1ae30_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=30 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-30-incense-before-elohim',
       E'The Incense Brought Before Elohim',
       E'Twice the angels are sent for the holy incense — Gabriel by command, the cherub assenting: *Then the angel Gabriel went down by Elohim''s (God''s) order to the garden, and told the cherub as Elohim (God) had commanded him.* and *The cherub then said, "Well." And Gabriel went in and took the incense.* (1-adam-eve 30:2, 30:3). The incense is no ordinary spice but a holy thing set apart before Yahuah, as the perfume of the tabernacle was commanded: *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* (Exodus 30:34). Adam reads it rightly — the incense a token of the bright light taken from him in 1-adam-eve 30:10 — the ascending smoke a sign of the light and presence he had lost, kept against the day the True Light returns. The Word who will restore that light is the Logos: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 64734
  FROM _session253_1ae30_lookup sv, _session253_1ae30_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-30-gold-incense-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The three tokens given to Adam at 1-adam-eve 30:10 are the same three the magi lay before the Saviour — kept from the garden against His coming.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh gathered from the borders of the garden in 1-adam-eve 30:6 are the very gifts borne to Bethlehem.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The myrrh that is a token of sorrow in 1-adam-eve 30:10 answers the sorrow pronounced over the ground at the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-30-cherub-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub who guards the Tree in 1-adam-eve 30:7 is the same guardian set at the east of Eden after the expulsion.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-cherub-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Tree of Life beside which the angels stand in 1-adam-eve 30:7 stands again, unbarred, in the restored City.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-cherub-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Tree of Life in the garden of 1-adam-eve 30:7 is the same Yahuah planted in the midst of Eden at the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-cherub-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-30-water-of-comfort
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s seeking to make an end of Adam and Eve in 1-adam-eve 30:9 is the serpent striking at the seed; Yahuah''s comfort keeps the seed He swore to preserve.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-water-of-comfort'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The spring of water that comforts the mourners in 1-adam-eve 30:8 anticipates the river of life that flows from the throne in the City.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-water-of-comfort'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-30-incense-before-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 30:34 — *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* The sweet-smelling incense Yahuah commands brought for Adam in 1-adam-eve 30:2 is the same holy frankincense He later commands for the tabernacle''s perfume.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-incense-before-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim whose order moves the angels and the cherub in 1-adam-eve 30:3 is the Logos who was in the beginning, soon to restore the light Adam lost.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae30_lookup sv, _session253_1ae30_lookup tv
 WHERE t.slug='1-adam-eve-30-incense-before-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

