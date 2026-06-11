-- ----- fragment: minion_1enoch_27.sql (session250 1-enoch 27) -----
-- Source anchor: enoch/1-enoch ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en27 (view _session250_en27_lookup). Sort band base 50650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-27-throne-mountain-zion
  ('enoch', '1-enoch', 27, 6, 'canon', 'psalms', 48, 1, 'free', E'Psalm 48:1 — *Great is Yahuah (LORD), and greatly to be praised in the city of our Elohim (God), in the mountain of his holiness.* The psalmist names the same holy mountain Enoch is shown to be the throne of the Eternal King.'),
  ('enoch', '1-enoch', 27, 6, 'canon', 'isaiah', 2, 2, 'free', E'Isaiah 2:2 — *And it shall come to pass in the last days, that the mountain of the LORD''S house shall be established in the top of the mountains, and shall be exalted above the hills; and all nations shall flow unto it.* Isaiah''s last-days throne-mountain is the high mountain whose summit is the throne of Yahuah that Enoch beholds.'),
  ('enoch', '1-enoch', 27, 2, 'canon', 'ezekiel', 47, 1, 'free', E'Ezekiel 47:1 — *Afterward he brought me again unto the door of the house; and, behold, waters issued out from under the threshold of the house eastward: for the forefront of the house stood toward the east, and the waters came down from under from the right side of the house, at the south side of the altar.* Ezekiel''s eastward and southward sanctuary waters are the very streams Enoch sees flowing east and south from under the holy mountain.'),
  ('enoch', '1-enoch', 27, 2, 'canon', 'zechariah', 14, 4, 'free', E'Zechariah 14:4 — *And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof toward the east and toward the west, and there shall be a very great valley; and half of the mountain shall remove toward the north, and half of it toward the south.* Zechariah''s day of the Eternal King descending to the mountain matches the moment He shall come down to visit the earth that Michael describes.'),
  -- thread: 1-enoch-27-fragrant-tree-of-life
  ('enoch', '1-enoch', 27, 7, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* Enoch''s fragrant tree reserved for life to the elect is Eden''s tree of life, the same fruit set in the midst of the garden.'),
  ('enoch', '1-enoch', 27, 7, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever.* This is why no mortal is permitted to touch the tree till the great judgement: access was barred after the fall and is restored only to the righteous.'),
  ('enoch', '1-enoch', 27, 3, 'enoch', '1-enoch', 24, 4, 'extras', E'1 Enoch 24:4 — *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* Enoch describes the very fragrant tree one chapter earlier, confirming this is the unfading tree of life.'),
  ('enoch', '1-enoch', 27, 8, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The fruit Enoch says shall be given to the righteous for food is the tree of life promised to the overcomer.'),
  ('enoch', '1-enoch', 27, 8, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* Right to the tree belongs to those who keep the commandments — Enoch''s elect who enter the holy place are the covenant-keepers, not a self-chosen class.'),
  ('enoch', '1-enoch', 27, 8, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s unfading sanctuary trees match the tree transplanted to the temple of the Eternal King, its fruit given for food to the righteous.'),
  -- thread: 1-enoch-27-righteous-joy-no-sorrow
  ('enoch', '1-enoch', 27, 9, 'canon', 'isaiah', 35, 10, 'free', E'Isaiah 35:10 — *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* Enoch''s righteous who rejoice and enter the holy place with no sorrow are Isaiah''s ransomed coming to Zion with everlasting joy.'),
  ('enoch', '1-enoch', 27, 9, 'canon', 'isaiah', 65, 13, 'free', E'Isaiah 65:13 — *Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, my servants shall eat, but ye shall be hungry: behold, my servants shall drink, but ye shall be thirsty: behold, my servants shall rejoice, but ye shall be ashamed.* The fruit given to the elect for food marks out Yahuah''s servants who eat and rejoice, dividing them from those shut out.'),
  ('enoch', '1-enoch', 27, 9, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* Revelation''s holy city where no sorrow remains is the same holy place Enoch''s elect enter, where no sorrow, plague, or torment touches them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-27-throne-mountain-zion',
       E'The holy mountain whose summit is the throne of Yahuah',
       E'Enoch is led to *a blessed and fertile place... And there was a holy mountain, and under the mountain to the east there was a stream flowing, and to the south another stream* (1 Enoch 27:1-2), and Michael names it: *This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is the throne of Yahuah (God), the Holy Great One, the Eternal King, when He shall come down to visit the earth with goodness* (1 Enoch 27:6). The prophets see the same throne-mountain at the centre of the earth: *Great is Yahuah (LORD), and greatly to be praised in the city of our Elohim (God), in the mountain of his holiness* (Psalm 48:1), the very *mountain of the LORD''S house... established in the top of the mountains... and all nations shall flow unto it* (Isaiah 2:2). From under it the living waters break, *waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1) — Enoch''s eastward and southward streams are this same sanctuary river, which Zechariah sees split when *his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* (Zechariah 14:4). This is the Zion-centre of the framework: not a throne the nations reach by their own confession, but the place the Eternal King Himself comes down to, the Creator''s order made visible.',
       sv.verse_id, ev.verse_id, 'extras', 50650
  FROM _session250_en27_lookup sv, _session250_en27_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=27 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-27-fragrant-tree-of-life',
       E'The fragrant tree no mortal may touch — life for the elect',
       E'On the mountain stands *a tree, the colour of whose fragrance was like the mastic tree* (1 Enoch 27:3), and of it Michael says *as for this fragrant tree no mortal is permitted to touch it till the great judgement... To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King* (1 Enoch 27:7-8). This is the tree of Eden, withheld and then restored: *the tree of life also in the midst of the garden* (Genesis 2:9), guarded after the fall *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22) — the very fruit no mortal may now touch until judgement. Enoch had already smelt it one chapter on: *amongst them was a tree such as I had never yet smelt... it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever* (1 Enoch 24:4). Revelation hands it back to the overcomer and transplants it to the holy city: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7); *in the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). And who has right to it is no self-selected class but those who keep the way: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14) — Torah stands; the elect keep the covenant. Ezekiel sets the same fruit-trees by the sanctuary river, *whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12).',
       sv.verse_id, ev.verse_id, 'extras', 50653
  FROM _session250_en27_lookup sv, _session250_en27_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=27 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-27-righteous-joy-no-sorrow',
       E'The elect enter the holy place — no sorrow, plague, or torment',
       E'When the tree is transplanted to the temple, Enoch sees the end of the righteous: *Then shall they rejoice with joy and be glad, and into the holy place shall they enter; and its fragrance shall be in their bones, and they shall live a long life on earth... and in their days shall no sorrow or plague or torment or calamity touch them* (1 Enoch 27:9). The prophets give the elect the same homecoming: *the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away* (Isaiah 35:10), for *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8). It is the servants, the covenant people, who eat in that day: *Behold, my servants shall eat, but ye shall be hungry... behold, my servants shall rejoice, but ye shall be ashamed* (Isaiah 65:13) — election divides those who enter from those who are shut out. Revelation seals the same scene of the holy place where no calamity touches them: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4).',
       sv.verse_id, ev.verse_id, 'extras', 50656
  FROM _session250_en27_lookup sv, _session250_en27_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=27 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-27-throne-mountain-zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 48:1 — *Great is Yahuah (LORD), and greatly to be praised in the city of our Elohim (God), in the mountain of his holiness.* The psalmist names the same holy mountain Enoch is shown to be the throne of the Eternal King.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-throne-mountain-zion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 2:2 — *And it shall come to pass in the last days, that the mountain of the LORD''S house shall be established in the top of the mountains, and shall be exalted above the hills; and all nations shall flow unto it.* Isaiah''s last-days throne-mountain is the high mountain whose summit is the throne of Yahuah that Enoch beholds.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-throne-mountain-zion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 47:1 — *Afterward he brought me again unto the door of the house; and, behold, waters issued out from under the threshold of the house eastward: for the forefront of the house stood toward the east, and the waters came down from under from the right side of the house, at the south side of the altar.* Ezekiel''s eastward and southward sanctuary waters are the very streams Enoch sees flowing east and south from under the holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-throne-mountain-zion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 14:4 — *And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof toward the east and toward the west, and there shall be a very great valley; and half of the mountain shall remove toward the north, and half of it toward the south.* Zechariah''s day of the Eternal King descending to the mountain matches the moment He shall come down to visit the earth that Michael describes.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-throne-mountain-zion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-27-fragrant-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* Enoch''s fragrant tree reserved for life to the elect is Eden''s tree of life, the same fruit set in the midst of the garden.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever.* This is why no mortal is permitted to touch the tree till the great judgement: access was barred after the fall and is restored only to the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 24:4 — *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* Enoch describes the very fragrant tree one chapter earlier, confirming this is the unfading tree of life.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The fruit Enoch says shall be given to the righteous for food is the tree of life promised to the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* Right to the tree belongs to those who keep the commandments — Enoch''s elect who enter the holy place are the covenant-keepers, not a self-chosen class.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s unfading sanctuary trees match the tree transplanted to the temple of the Eternal King, its fruit given for food to the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-27-righteous-joy-no-sorrow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:10 — *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* Enoch''s righteous who rejoice and enter the holy place with no sorrow are Isaiah''s ransomed coming to Zion with everlasting joy.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-righteous-joy-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:13 — *Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, my servants shall eat, but ye shall be hungry: behold, my servants shall drink, but ye shall be thirsty: behold, my servants shall rejoice, but ye shall be ashamed.* The fruit given to the elect for food marks out Yahuah''s servants who eat and rejoice, dividing them from those shut out.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-righteous-joy-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* Revelation''s holy city where no sorrow remains is the same holy place Enoch''s elect enter, where no sorrow, plague, or torment touches them.'
  FROM cross_reference_threads t, cross_references x, _session250_en27_lookup sv, _session250_en27_lookup tv
 WHERE t.slug='1-enoch-27-righteous-joy-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=27 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

