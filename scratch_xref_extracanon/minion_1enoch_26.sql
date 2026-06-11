-- ----- fragment: minion_1enoch_26.sql (session250 1-enoch 26) -----
-- Source anchor: enoch/1-enoch ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en26 (view _session250_en26_lookup). Sort band base 50625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-26-middle-of-the-earth
  ('enoch', '1-enoch', 26, 1, 'canon', 'ezekiel', 5, 5, 'free', E'Ezekiel 5:5 — *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* Enoch''s blessed place at the middle of the earth is Jerusalem, set by Yahuah at the centre of the nations.'),
  ('enoch', '1-enoch', 26, 1, 'canon', 'ezekiel', 38, 12, 'free', E'Ezekiel 38:12 — *To take a spoil, and to take a prey; to turn thine hand upon the desolate places that are now inhabited, and upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land.* The regathered people dwell in the midst of the land — the same centred geography Enoch is shown.'),
  ('enoch', '1-enoch', 26, 2, 'canon', 'psalms', 48, 2, 'free', E'Psalm 48:2 — *Beautiful for situation, the joy of the whole earth, is mount Zion, on the sides of the north, the city of the great King.* Enoch''s holy mountain at the world''s centre is mount Zion, the joy of the whole earth.'),
  ('enoch', '1-enoch', 26, 1, 'canon', 'psalms', 74, 12, 'free', E'Psalm 74:12 — *For Elohim (God) is my King of old, working salvation in the midst of the earth.* Salvation is worked in the midst of the earth — the very middle to which Enoch is brought.'),
  ('enoch', '1-enoch', 26, 2, 'jubilees', 'jubilees', 8, 18, 'extras', E'Jubilees 8:18 — *And he knew that the Garden of Eden is the holy of holies, and the dwelling of Yahuah (God), and Mount Sinai the centre of the desert, and Mount Zion–the centre of the navel of the earth: these three were created as holy places facing each other.* Jubilees names Mount Zion the navel of the earth — Enoch''s holy mountain at the middle of the earth.'),
  -- thread: 1-enoch-26-trees-by-the-streams
  ('enoch', '1-enoch', 26, 4, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel sees trees lining both sides of the sanctuary-stream — Enoch''s fragrant trees on the sides of the streams of the holy mountain.'),
  ('enoch', '1-enoch', 26, 3, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The fruitful, never-withering tree by the waters is the righteous one beside the streams of the holy mountain.'),
  -- thread: 1-enoch-26-throne-mountain-tree-of-life
  ('enoch', '1-enoch', 26, 8, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The fragrant tree no mortal may touch is the tree of life set in the midst of the garden at the beginning.'),
  ('enoch', '1-enoch', 26, 8, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* Mortal hands were barred from the tree of life after the fall — exactly why no mortal may touch it till the great judgement.'),
  ('enoch', '1-enoch', 26, 9, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree transplanted to the holy place and given as food to the elect is John''s tree of life restored in the city.'),
  ('enoch', '1-enoch', 26, 9, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* Right to the tree and entry into the holy place belong to those who keep the commandments — the righteous and humble Enoch names, Torah standing.'),
  ('enoch', '1-enoch', 26, 10, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The long life of the elect with no sorrow is Isaiah''s tree-long days of Yahuah''s elect in the restored land.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-26-middle-of-the-earth',
       E'The middle of the earth and the holy mountain — Zion at the navel',
       E'Enoch is carried to the centre of the world: *And I proceeded to the middle of the earth, and saw there a blessed and fertile place, and there were many trees in it. And there was a holy mountain* (1 Enoch 26:1-2). This is not invention — the Tanakh sets Jerusalem at the very midst of the nations: *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* (Ezekiel 5:5), and names the regathered people as those *that dwell in the midst of the land.* (Ezekiel 38:12). The holy mountain is Zion, of whom the psalmist sings *Beautiful for situation, the joy of the whole earth, is mount Zion, on the sides of the north, the city of the great King.* (Psalm 48:2), the place where *Elohim (God) is my King of old, working salvation in the midst of the earth.* (Psalm 74:12). The parallel extra-canon witness says it most plainly of all: *And he knew that the Garden of Eden is the holy of holies, and the dwelling of Yahuah (God), and Mount Sinai the centre of the desert, and Mount Zion–the centre of the navel of the earth: these three were created as holy places facing each other.* (Jubilees 8:18). The blessed fertile place at the world''s centre is the Zion-centre of the whole framework — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50625
  FROM _session250_en26_lookup sv, _session250_en26_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=26 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-26-trees-by-the-streams',
       E'Fragrant trees by the streams of the holy mountain',
       E'Two streams flow from the holy mountain, and along them grow fragrant trees: *And on the sides of those streams I saw fragrant trees, and the fragrance of them was beyond all fragrance.* (1 Enoch 26:3-4). Ezekiel''s temple vision sees the same trees lining the same kind of waters: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12). The man of the covenant is himself such a tree: *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (Psalm 1:3) — the righteous flourish where the living water of the sanctuary runs out from Zion.',
       sv.verse_id, ev.verse_id, 'extras', 50628
  FROM _session250_en26_lookup sv, _session250_en26_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=26 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-26-throne-mountain-tree-of-life',
       E'The throne-mountain and the tree of life reserved for the great judgement',
       E'Michael unveils what the mountain and the tree truly are: *This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is the throne of Yahuah (God), the Holy Great One, the Eternal King, when He shall come down to visit the earth with goodness.* (1 Enoch 26:7), and of the fragrant tree, *no mortal is permitted to touch it till the great judgement... To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 26:8-9). This is the tree of life of Eden — *the tree of life also in the midst of the garden* (Genesis 2:9) — guarded from mortal hands after the fall *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22), and restored at the end to the holy city: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month* (Revelation 22:2), given to those who keep covenant — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* (Revelation 22:14). The long life Enoch promises the elect — *they shall live a long life on earth, such as thy fathers lived: and in their days shall no sorrow or plague or torment or calamity touch them* (1 Enoch 26:10) — is Isaiah''s restored Israel, *for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands* (Isaiah 65:22), and John''s new world where *there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain* (Revelation 21:4). The tree withheld until the great judgement and then given to the elect — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50631
  FROM _session250_en26_lookup sv, _session250_en26_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=26 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-26-middle-of-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 5:5 — *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* Enoch''s blessed place at the middle of the earth is Jerusalem, set by Yahuah at the centre of the nations.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-middle-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 38:12 — *To take a spoil, and to take a prey; to turn thine hand upon the desolate places that are now inhabited, and upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land.* The regathered people dwell in the midst of the land — the same centred geography Enoch is shown.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-middle-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 48:2 — *Beautiful for situation, the joy of the whole earth, is mount Zion, on the sides of the north, the city of the great King.* Enoch''s holy mountain at the world''s centre is mount Zion, the joy of the whole earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-middle-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 74:12 — *For Elohim (God) is my King of old, working salvation in the midst of the earth.* Salvation is worked in the midst of the earth — the very middle to which Enoch is brought.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-middle-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 8:18 — *And he knew that the Garden of Eden is the holy of holies, and the dwelling of Yahuah (God), and Mount Sinai the centre of the desert, and Mount Zion–the centre of the navel of the earth: these three were created as holy places facing each other.* Jubilees names Mount Zion the navel of the earth — Enoch''s holy mountain at the middle of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-middle-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-26-trees-by-the-streams
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel sees trees lining both sides of the sanctuary-stream — Enoch''s fragrant trees on the sides of the streams of the holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-trees-by-the-streams'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The fruitful, never-withering tree by the waters is the righteous one beside the streams of the holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-trees-by-the-streams'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-26-throne-mountain-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The fragrant tree no mortal may touch is the tree of life set in the midst of the garden at the beginning.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-throne-mountain-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* Mortal hands were barred from the tree of life after the fall — exactly why no mortal may touch it till the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-throne-mountain-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree transplanted to the holy place and given as food to the elect is John''s tree of life restored in the city.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-throne-mountain-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* Right to the tree and entry into the holy place belong to those who keep the commandments — the righteous and humble Enoch names, Torah standing.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-throne-mountain-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The long life of the elect with no sorrow is Isaiah''s tree-long days of Yahuah''s elect in the restored land.'
  FROM cross_reference_threads t, cross_references x, _session250_en26_lookup sv, _session250_en26_lookup tv
 WHERE t.slug='1-enoch-26-throne-mountain-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=26 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

