-- ----- fragment: minion_1enoch_30.sql (session250 1-enoch 30) -----
-- Source anchor: enoch/1-enoch ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en30 (view _session250_en30_lookup). Sort band base 50725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-30-fragrant-spices
  ('enoch', '1-enoch', 30, 2, 'canon', 'song-of-solomon', 4, 14, 'free', E'Song of Solomon 4:14 — *Spikenard and saffron; calamus and cinnamon, with all trees of frankincense; myrrh and aloes, with all the chief spices:* The bride''s enclosed garden carries the very orchard of fragrant trees Enoch smells on the eastern mountain (30:2).'),
  ('enoch', '1-enoch', 30, 1, 'canon', 'exodus', 30, 23, 'free', E'Exodus 30:23 — *Take thou also unto thee principal spices, of pure myrrh five hundred shekels, and of sweet cinnamon half so much, even two hundred and fifty shekels, and of sweet calamus two hundred and fifty shekels,* The same chief spices that flow from Enoch''s trees (30:1) are the principal spices Yahuah set apart for the holy anointing oil.'),
  -- thread: 1-enoch-30-tree-of-wisdom-eden
  ('enoch', '1-enoch', 30, 7, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The tree of wisdom in the midst of Enoch''s grove (30:7) is Eden''s tree of knowledge, set in the midst of the garden.'),
  ('enoch', '1-enoch', 30, 7, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Enoch''s note that the first parents *have eaten, and they learnt wisdom* (30:7) retells Eve''s reach for the tree desired to make one wise.'),
  ('enoch', '1-enoch', 30, 7, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Enoch''s *their eyes were opened, and they knew that they were naked* (30:7) is quoted from the moment of the fall.'),
  ('enoch', '1-enoch', 30, 7, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The driving out of the garden that closes Enoch 30:7 is the same expulsion, with the way to the tree guarded until the appointed time.'),
  -- thread: 1-enoch-30-tree-transplanted-temple
  ('enoch', '1-enoch', 30, 9, 'enoch', '1-enoch', 24, 11, 'extras', E'1 Enoch 24:11 — *To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* Enoch had already seen this fragrant tree at the throne-mountain; 30:9 repeats it nearly word for word, binding the two visions.'),
  ('enoch', '1-enoch', 30, 9, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree transplanted to the temple of the Eternal King (30:9) is John''s tree of life set at the centre of the renewed Zion.'),
  ('enoch', '1-enoch', 30, 8, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit reserved for the righteous and humble at the judgement (30:8) is given to those who keep the commandments — the Torah stands, and the tree is theirs.'),
  ('enoch', '1-enoch', 30, 10, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s healing trees flowing from the sanctuary match the temple-tree of Enoch 30:9-10 whose fragrance brings life and ends all plague.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-30-fragrant-spices',
       E'The fragrant trees — the chief spices',
       E'Enoch comes east to a range of spice-bearing trees: *And beyond these, I proceeded to the east, and I saw other mountains, and trees out of which flowed the resin called styrax and the gum called galbanum, and onycha, and the trees which produce stacte, and the balsam tree.* (1 Enoch 30:1), and beyond them an almond-like mountain whose *fragrance was sweet and strong* (1 Enoch 30:2). The same chief spices line the canon''s most fragrant places. The bride''s garden is an orchard of them: *Spikenard and saffron; calamus and cinnamon, with all trees of frankincense; myrrh and aloes, with all the chief spices:* (Song of Solomon 4:14). And the holy anointing oil is compounded from the very same list: *Take thou also unto thee principal spices, of pure myrrh five hundred shekels, and of sweet cinnamon half so much, even two hundred and fifty shekels, and of sweet calamus two hundred and fifty shekels,* (Exodus 30:23). It ain''t new: Enoch''s eastern mountain of sweet-smelling trees is the same family of spices Yahuah set apart for His sanctuary and sang over in His garden.',
       sv.verse_id, ev.verse_id, 'extras', 50725
  FROM _session250_en30_lookup sv, _session250_en30_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=30 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-30-tree-of-wisdom-eden',
       E'The tree of wisdom — Eden''s tree of knowledge',
       E'At the centre of the fragrant grove Enoch finds one surpassing tree, and the angel names it: *This is the tree of wisdom, of which thy father old (in years) and thy aged mother, who were before thee, have eaten, and they learnt wisdom, and their eyes were opened, and they knew that they were naked, and they were driven out of the garden.* (1 Enoch 30:7). This is Eden''s own tree, the one Genesis sets *in the midst of the garden*: *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). Enoch''s phrase *they learnt wisdom* repeats Eve''s reach for it: *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6). And *their eyes were opened, and they knew that they were naked* is lifted straight from the fall: *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* (Genesis 3:7). So is the expulsion: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24). It ain''t new — Enoch is reading Genesis 2-3, naming the tree of knowledge by its fruit and its consequence, with the way back guarded until the appointed day.',
       sv.verse_id, ev.verse_id, 'extras', 50728
  FROM _session250_en30_lookup sv, _session250_en30_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=30 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-30-tree-transplanted-temple',
       E'The tree transplanted to the temple — fruit for the righteous',
       E'The tree withheld from Adam is not destroyed but reserved: *And from that time forward no one has been permitted to touch it until the great judgment, when His righteousness shall be avenged upon the sinners, and its fruit given to the righteous and humble.* (1 Enoch 30:8); then *its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 30:9), and the redeemed *shall live a long life on earth* with *no sorrow or plague or torment or calamity* (1 Enoch 30:10). Enoch himself has already shown the same scene at the throne-mountain: *To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 24:11). John sees the tree replanted at the centre of the renewed Zion: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2), and only the covenant-keepers come to it: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* (Revelation 22:14). Ezekiel sets the same healing trees flowing from the sanctuary: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12). It ain''t new: the Eden-tree denied at the fall is transplanted to the temple-mountain at the judgement, its fruit for the elect who keep the way — Zion at the centre, the righteous regathered, no replacement of the covenant people but their restoration.',
       sv.verse_id, ev.verse_id, 'extras', 50731
  FROM _session250_en30_lookup sv, _session250_en30_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=30 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-30-fragrant-spices
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Song of Solomon 4:14 — *Spikenard and saffron; calamus and cinnamon, with all trees of frankincense; myrrh and aloes, with all the chief spices:* The bride''s enclosed garden carries the very orchard of fragrant trees Enoch smells on the eastern mountain (30:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-fragrant-spices'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:23 — *Take thou also unto thee principal spices, of pure myrrh five hundred shekels, and of sweet cinnamon half so much, even two hundred and fifty shekels, and of sweet calamus two hundred and fifty shekels,* The same chief spices that flow from Enoch''s trees (30:1) are the principal spices Yahuah set apart for the holy anointing oil.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-fragrant-spices'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-30-tree-of-wisdom-eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The tree of wisdom in the midst of Enoch''s grove (30:7) is Eden''s tree of knowledge, set in the midst of the garden.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Enoch''s note that the first parents *have eaten, and they learnt wisdom* (30:7) retells Eve''s reach for the tree desired to make one wise.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Enoch''s *their eyes were opened, and they knew that they were naked* (30:7) is quoted from the moment of the fall.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The driving out of the garden that closes Enoch 30:7 is the same expulsion, with the way to the tree guarded until the appointed time.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-30-tree-transplanted-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 24:11 — *To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* Enoch had already seen this fragrant tree at the throne-mountain; 30:9 repeats it nearly word for word, binding the two visions.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-transplanted-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree transplanted to the temple of the Eternal King (30:9) is John''s tree of life set at the centre of the renewed Zion.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-transplanted-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit reserved for the righteous and humble at the judgement (30:8) is given to those who keep the commandments — the Torah stands, and the tree is theirs.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-transplanted-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s healing trees flowing from the sanctuary match the temple-tree of Enoch 30:9-10 whose fragrance brings life and ends all plague.'
  FROM cross_reference_threads t, cross_references x, _session250_en30_lookup sv, _session250_en30_lookup tv
 WHERE t.slug='1-enoch-30-tree-transplanted-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=30 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

