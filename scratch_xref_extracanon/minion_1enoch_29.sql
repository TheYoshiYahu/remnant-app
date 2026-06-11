-- ----- fragment: minion_1enoch_29.sql (session250 1-enoch 29) -----
-- Source anchor: enoch/1-enoch ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en29 (view _session250_en29_lookup). Sort band base 50700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-29-throne-mountain-zion
  ('enoch', '1-enoch', 29, 9, 'enoch', '1-enoch', 24, 9, 'extras', E'1 Enoch 24:9 — *This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness.* The same throne-mountain and tree Enoch was shown earlier, repeated here almost verbatim.'),
  ('enoch', '1-enoch', 29, 9, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* The tree the throne-mountain guards is the very tree of life Adam was barred from in Eden.'),
  -- thread: 1-enoch-29-tree-of-life-reserved
  ('enoch', '1-enoch', 29, 10, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The fragrant tree no mortal may touch is Eden''s tree of life, planted in the garden''s midst.'),
  ('enoch', '1-enoch', 29, 11, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* Enoch''s promise that the tree''s fruit is given to the elect is the same fruit Yahusha gives the overcomer.'),
  ('enoch', '1-enoch', 29, 11, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree given to the righteous for food and life stands again in the City of the end.'),
  ('enoch', '1-enoch', 29, 11, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s tree, fed from the sanctuary, is the same tree Enoch sees transplanted to the temple, its fruit for food and its leaf for healing.'),
  -- thread: 1-enoch-29-transplanted-temple-long-life
  ('enoch', '1-enoch', 29, 12, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Enoch''s promise that the elect live a long life on earth is Isaiah''s new-earth promise where the people''s days are the days of a tree.'),
  ('enoch', '1-enoch', 29, 12, 'canon', 'isaiah', 25, 8, 'free', E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The day when no sorrow or torment touches the elect is the day death is swallowed up and every tear wiped away.'),
  ('enoch', '1-enoch', 29, 12, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The end of sorrow, plague, and calamity Enoch names is the end John sees in the restored creation.'),
  ('enoch', '1-enoch', 29, 11, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The right to enter the holy place and eat the tree''s fruit belongs to those who keep the commandments — the Torah stands at the door of the temple Enoch sees.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-29-throne-mountain-zion',
       E'The throne-mountain where the Eternal King comes down',
       E'Michael answers Enoch''s wonder at the fragrant tree by first naming the mountain: *''This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness.''* (1 Enoch 29:9). This is the framework''s Zion-centre: the place of the throne is the place of the tree, and the King will come down to it. The vision repeats almost word for word the earlier throne-mountain Enoch was shown — *''This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness.''* (1 Enoch 24:9) — the same mountain, the same tree, seen again. And the tree of life it guards is the one set in Eden eastward and then fenced from mortal hands: *''And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:''* (Genesis 3:22). What Adam was barred from, the throne-mountain keeps until the King comes down. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50700
  FROM _session250_en29_lookup sv, _session250_en29_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=29 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-29-tree-of-life-reserved',
       E'The tree of life kept until the great judgement, food for the elect',
       E'The fragrant tree is no ordinary tree: *''And as for this fragrant tree no mortal is permitted to touch it till the great judgement, when His righteousness and His majesty shall be avenged on the sinners in its fruit to the righteous and humble. To the righteous it shall be given for food, and its fruit shall be for life to the elect''* (1 Enoch 29:10-11). This is Eden''s own tree, the one Yahuah planted *''pleasant to the sight, and good for food; the tree of life also in the midst of the garden''* (Genesis 2:9), and then sealed from mortal reach so that no man should *''take also of the tree of life, and eat, and live for ever''* (Genesis 3:22). Enoch sees the same fruit restored to the elect at the end — exactly the promise Yahusha makes to the overcomer: *''To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).''* (Revelation 2:7), and shows again in the City: *''In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.''* (Revelation 22:2). Ezekiel saw it too, by the water that issues from the sanctuary: *''And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.''* (Ezekiel 47:12). The tree withheld since Eden is the tree given to the righteous after the judgement. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50703
  FROM _session250_en29_lookup sv, _session250_en29_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=29 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-29-transplanted-temple-long-life',
       E'Transplanted to the temple: long life and no more sorrow',
       E'The tree''s destiny is the sanctuary, and the elect''s destiny is life beside it: *''it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King. Then shall they rejoice with joy and be glad, and into the holy place shall they enter; and its fragrance shall be in their bones, and they shall live a long life on earth, such as thy fathers lived: and in their days shall no sorrow or plague or torment or calamity touch them.''* (1 Enoch 29:11-12). This is the prophets'' restored-earth promise, where the days of the people are the days of the tree: *''They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.''* (Isaiah 65:22). And the end of sorrow, plague, and torment Enoch names is the same comfort the prophets and the Revelation give: *''He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.''* (Isaiah 25:8), unfolded as *''And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.''* (Revelation 21:4). The right to enter the holy place and eat is kept for those who keep the way: *''Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.''* (Revelation 22:14). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50706
  FROM _session250_en29_lookup sv, _session250_en29_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=29 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-29-throne-mountain-zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 24:9 — *This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness.* The same throne-mountain and tree Enoch was shown earlier, repeated here almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-throne-mountain-zion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* The tree the throne-mountain guards is the very tree of life Adam was barred from in Eden.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-throne-mountain-zion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-29-tree-of-life-reserved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The fragrant tree no mortal may touch is Eden''s tree of life, planted in the garden''s midst.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-tree-of-life-reserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* Enoch''s promise that the tree''s fruit is given to the elect is the same fruit Yahusha gives the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-tree-of-life-reserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree given to the righteous for food and life stands again in the City of the end.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-tree-of-life-reserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s tree, fed from the sanctuary, is the same tree Enoch sees transplanted to the temple, its fruit for food and its leaf for healing.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-tree-of-life-reserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-29-transplanted-temple-long-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Enoch''s promise that the elect live a long life on earth is Isaiah''s new-earth promise where the people''s days are the days of a tree.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-transplanted-temple-long-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The day when no sorrow or torment touches the elect is the day death is swallowed up and every tear wiped away.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-transplanted-temple-long-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The end of sorrow, plague, and calamity Enoch names is the end John sees in the restored creation.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-transplanted-temple-long-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The right to enter the holy place and eat the tree''s fruit belongs to those who keep the commandments — the Torah stands at the door of the temple Enoch sees.'
  FROM cross_reference_threads t, cross_references x, _session250_en29_lookup sv, _session250_en29_lookup tv
 WHERE t.slug='1-enoch-29-transplanted-temple-long-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

