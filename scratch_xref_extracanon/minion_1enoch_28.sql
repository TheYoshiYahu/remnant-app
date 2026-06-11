-- ----- fragment: minion_1enoch_28.sql (session250 1-enoch 28) -----
-- Source anchor: enoch/1-enoch ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en28 (view _session250_en28_lookup). Sort band base 50675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-28-watered-wilderness
  ('enoch', '1-enoch', 28, 4, 'canon', 'isaiah', 35, 1, 'free', E'Isaiah 35:1 — *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* The valley full of water Enoch finds in the eastern desert is the prophet''s wilderness made glad when Yahuah comes.'),
  ('enoch', '1-enoch', 28, 4, 'canon', 'isaiah', 35, 6, 'free', E'Isaiah 35:6 — *Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert.* Enoch''s valley full of water in a desert place is exactly this promised breaking-out of waters in the wilderness.'),
  ('enoch', '1-enoch', 28, 4, 'canon', 'isaiah', 41, 18, 'free', E'Isaiah 41:18 — *I will open rivers in high places, and fountains in the midst of the valleys: I will make the wilderness a pool of water, and the dry land springs of water.* The same fountains-in-the-valley that Yahuah promises fill the watered valley Enoch sees in the east.'),
  ('enoch', '1-enoch', 28, 5, 'canon', 'isaiah', 41, 19, 'free', E'Isaiah 41:19 — *I will plant in the wilderness the cedar, the shittah tree, and the myrtle, and the oil tree; I will set in the desert the fir tree, and the pine, and the box tree together:* the fragrant trees Yahuah plants in the desert are the very trees of beyond-all-fragrance Enoch smells along the watered valley.'),
  -- thread: 1-enoch-28-tree-of-life-temple
  ('enoch', '1-enoch', 28, 11, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* Enoch''s fragrant tree given to the righteous for food is the tree of life planted in the midst of Eden.'),
  ('enoch', '1-enoch', 28, 11, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* this is why no mortal is permitted to touch Enoch''s tree — fallen hands are barred from the tree of life until the great judgement.'),
  ('enoch', '1-enoch', 28, 11, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The guarding of the way of the tree of life is the very prohibition Michael names over the fragrant tree until the judgement.'),
  ('enoch', '1-enoch', 28, 12, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree given for food to the righteous and elect in Enoch is the tree of life Yahusha grants the overcomer.'),
  ('enoch', '1-enoch', 28, 12, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit kept for the righteous who keep the way is the right to the tree of life given to the commandment-keepers who enter the holy city.'),
  ('enoch', '1-enoch', 28, 12, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Enoch''s fragrant tree transplanted to the temple, its fruit for food, matches the sanctuary-fed trees whose fruit is meat and leaf medicine.'),
  -- thread: 1-enoch-28-throne-mountain-self-link
  ('enoch', '1-enoch', 28, 10, 'enoch', '1-enoch', 27, 6, 'extras', E'1 Enoch 27:6 — *’This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is the throne of Yahuah (God), the Holy Great One, the Eternal King, when He shall come down to visit the earth with goodness.* Michael''s word over this throne-mountain is the same vision Enoch received at the prior throne-mountain — the Eternal King who comes down to visit the earth.'),
  ('enoch', '1-enoch', 28, 11, 'enoch', '1-enoch', 27, 7, 'extras', E'1 Enoch 27:7 — *And as for this fragrant tree no mortal is permitted to touch it till the great judgement, when His righteousness and His majesty shall be punished for ever in its fruit to the righteous and humble.* The prohibition on the fragrant tree until the great judgement is given in the same words at the parallel throne-mountain vision.'),
  ('enoch', '1-enoch', 28, 10, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The river of life flows from the very throne whose summit Enoch sees on the high mountain when the Eternal King comes down.'),
  ('enoch', '1-enoch', 28, 12, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* Enoch''s tree transplanted to the temple of the Eternal King is the tree of life by the river of the throne in the holy city.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-28-watered-wilderness',
       E'The valley full of water in the desert — the wilderness made glad',
       E'Enoch''s journey eastward reaches a thirsty land made fertile: *And beyond these trees I proceeded to the east, and I saw another place, a valley full of water.* (1 Enoch 28:4), where *there was a tree which had fragrance such as the mastic tree, and its fruit was like the clusters of the vine, very beautiful; and the fragrance of that tree penetrated far beyond the valley.* (1 Enoch 28:5). It is the prophets'' picture of the watered wilderness, the sign that Yahuah comes to save: *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* (Isaiah 35:1), *for in the wilderness shall waters break out, and streams in the desert.* (Isaiah 35:6). The same hand that opens the spring also plants the fragrant trees Enoch smells: *I will open rivers in high places, and fountains in the midst of the valleys: I will make the wilderness a pool of water, and the dry land springs of water.* (Isaiah 41:18) — *I will plant in the wilderness the cedar, the shittah tree, and the myrtle, and the oil tree; I will set in the desert the fir tree, and the pine, and the box tree together* (Isaiah 41:19), so that all may *know, and consider, and understand together, that the hand of Yahuah (LORD) hath done this, and the Holy One of Yashar''el (Israel) hath created it.* (Isaiah 41:20). It ain''t new: Enoch walks the same renewed desert the prophets sing.',
       sv.verse_id, ev.verse_id, 'extras', 50675
  FROM _session250_en28_lookup sv, _session250_en28_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=28 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-28-tree-of-life-temple',
       E'The tree no mortal may touch — the tree of life kept for the elect',
       E'Michael unfolds the fragrant tree of the valley: *And as for this fragrant tree no mortal is permitted to touch it till the great judgement, when His righteousness and His majesty shall be avenged on the sinners in its fruit to the righteous and humble.* (1 Enoch 28:11) — *To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 28:12). This is the tree of life of Eden, planted and then guarded: *the tree of life also in the midst of the garden* (Genesis 2:9), barred from fallen hands *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22) — so Yahuah *placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24). Enoch sees the same tree kept until the great judgement, then opened to the righteous — which is precisely the promise the risen Messiah holds out: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* (Revelation 2:7), and *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* (Revelation 22:14) — note: it is the commandment-keepers, the elect who keep the way, who are given its fruit, never a self-chosen class. Enoch''s tree even shares Ezekiel''s temple-fed fruit: *and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12). It ain''t new: the tree fenced in Eden and opened again in Revelation is the tree Enoch already saw transplanted to the temple of the Eternal King.',
       sv.verse_id, ev.verse_id, 'extras', 50678
  FROM _session250_en28_lookup sv, _session250_en28_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=28 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-28-throne-mountain-self-link',
       E'The high mountain whose summit is the throne — God comes down to visit',
       E'Michael''s word over the watered-valley tree repeats, almost verbatim, what Enoch was shown one mountain earlier — the throne-mountain and its fragrant tree: *’This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness.* (1 Enoch 28:10). It is the same revelation given at the throne-mountain of the previous vision: *’This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is the throne of Yahuah (God), the Holy Great One, the Eternal King, when He shall come down to visit the earth with goodness.* (1 Enoch 27:6) — *And as for this fragrant tree no mortal is permitted to touch it till the great judgement, when His righteousness and His majesty shall be punished for ever in its fruit to the righteous and humble.* (1 Enoch 27:7) — *To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 27:8). And the river of life that flows from this throne to that temple-tree is what Yochanan sees at the end: *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* (Revelation 22:1), *In the midst of the street of it, and on either side of the river, was there the tree of life... and the leaves of the tree were for the healing of the nations.* (Revelation 22:2). It ain''t new: the throne-mountain, the tree, and the visiting King are one vision carried from Enoch into the Apocalypse.',
       sv.verse_id, ev.verse_id, 'extras', 50681
  FROM _session250_en28_lookup sv, _session250_en28_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=28 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-28-watered-wilderness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:1 — *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* The valley full of water Enoch finds in the eastern desert is the prophet''s wilderness made glad when Yahuah comes.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-watered-wilderness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:6 — *Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert.* Enoch''s valley full of water in a desert place is exactly this promised breaking-out of waters in the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-watered-wilderness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 41:18 — *I will open rivers in high places, and fountains in the midst of the valleys: I will make the wilderness a pool of water, and the dry land springs of water.* The same fountains-in-the-valley that Yahuah promises fill the watered valley Enoch sees in the east.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-watered-wilderness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 41:19 — *I will plant in the wilderness the cedar, the shittah tree, and the myrtle, and the oil tree; I will set in the desert the fir tree, and the pine, and the box tree together:* the fragrant trees Yahuah plants in the desert are the very trees of beyond-all-fragrance Enoch smells along the watered valley.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-watered-wilderness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-28-tree-of-life-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* Enoch''s fragrant tree given to the righteous for food is the tree of life planted in the midst of Eden.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-tree-of-life-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* this is why no mortal is permitted to touch Enoch''s tree — fallen hands are barred from the tree of life until the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-tree-of-life-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The guarding of the way of the tree of life is the very prohibition Michael names over the fragrant tree until the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-tree-of-life-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree given for food to the righteous and elect in Enoch is the tree of life Yahusha grants the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-tree-of-life-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit kept for the righteous who keep the way is the right to the tree of life given to the commandment-keepers who enter the holy city.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-tree-of-life-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Enoch''s fragrant tree transplanted to the temple, its fruit for food, matches the sanctuary-fed trees whose fruit is meat and leaf medicine.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-tree-of-life-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-28-throne-mountain-self-link
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 27:6 — *’This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is the throne of Yahuah (God), the Holy Great One, the Eternal King, when He shall come down to visit the earth with goodness.* Michael''s word over this throne-mountain is the same vision Enoch received at the prior throne-mountain — the Eternal King who comes down to visit the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-throne-mountain-self-link'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 27:7 — *And as for this fragrant tree no mortal is permitted to touch it till the great judgement, when His righteousness and His majesty shall be punished for ever in its fruit to the righteous and humble.* The prohibition on the fragrant tree until the great judgement is given in the same words at the parallel throne-mountain vision.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-throne-mountain-self-link'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=27 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The river of life flows from the very throne whose summit Enoch sees on the high mountain when the Eternal King comes down.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-throne-mountain-self-link'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* Enoch''s tree transplanted to the temple of the Eternal King is the tree of life by the river of the throne in the holy city.'
  FROM cross_reference_threads t, cross_references x, _session250_en28_lookup sv, _session250_en28_lookup tv
 WHERE t.slug='1-enoch-28-throne-mountain-self-link'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=28 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

