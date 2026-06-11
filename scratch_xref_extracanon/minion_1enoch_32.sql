-- ----- fragment: minion_1enoch_32.sql (session250 1-enoch 32) -----
-- Source anchor: enoch/1-enoch ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en32 (view _session250_en32_lookup). Sort band base 50775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-32-tree-of-wisdom-eden
  ('enoch', '1-enoch', 32, 6, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The tree of wisdom Enoch is shown is Genesis''s own tree of knowledge of good and evil, standing in the garden in the east.'),
  ('enoch', '1-enoch', 32, 6, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* This is the very tree whose fruit Enoch''s ''father old (in years) and aged mother'' ate against the command, and so were driven out.'),
  ('enoch', '1-enoch', 32, 6, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Enoch''s ''they learnt wisdom'' is Eve''s reach for the tree ''to make one wise'' — the same eating, the same tree.'),
  ('enoch', '1-enoch', 32, 6, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Enoch''s ''their eyes were opened, and they knew that they were naked'' repeats Genesis verbatim — it ain''t new.'),
  ('enoch', '1-enoch', 32, 6, 'jubilees', 'jubilees', 3, 21, 'extras', E'Jubilees 3:21 — *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked. And he took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame.* Jubilees carries the same eyes-opened, naked, fig-leaf account Enoch points back to at the tree of wisdom.'),
  -- thread: 1-enoch-32-driven-out-tree-barred
  ('enoch', '1-enoch', 32, 6, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* This is why Enoch''s tree was barred — man, fallen, must not seize the fruit until the judgement makes him fit.'),
  ('enoch', '1-enoch', 32, 7, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Enoch''s ''no one has been permitted to touch it'' is exactly the flaming sword keeping the way at the garden in the east.'),
  ('enoch', '1-enoch', 32, 7, 'canon', 'proverbs', 3, 18, 'free', E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The wisdom the barred tree bears is not cursed but blessed for those who lay hold of her rightly — the fruit reserved for the righteous and humble.'),
  -- thread: 1-enoch-32-fruit-for-righteous-temple
  ('enoch', '1-enoch', 32, 8, 'canon', 'ezekiel', 28, 13, 'free', E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* Eden is named ''the garden of Elohim,'' a holy place — matching Enoch''s tree transplanted to the temple of Yahuah.'),
  ('enoch', '1-enoch', 32, 8, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* Enoch''s ''its fruit shall be for life to the elect'' is Yahusha''s promise of the tree''s fruit to the overcomer in paradise.'),
  ('enoch', '1-enoch', 32, 8, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Eden tree transplanted to Yahuah''s holy place is Revelation''s tree of life at the throne in the city — Zion at the centre.'),
  ('enoch', '1-enoch', 32, 8, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit given ''to the righteous and humble'' is granted to the commandment-keepers — Torah stands; the right to the tree belongs to those who keep the way.'),
  ('enoch', '1-enoch', 32, 7, 'apocrypha', '2-esdras', 8, 52, 'extras', E'2 Esdras 8:52 — *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom.* Ezra hears the same opening Enoch foresees: at the time to come the paradise is opened and the tree planted for the righteous.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-32-tree-of-wisdom-eden',
       E'The tree of wisdom — Eden''s tree of knowledge',
       E'Enoch is carried to the garden of righteousness in the east and shown the very tree of Eden: *And I said: ''Behold this beautiful tree, and what is its name?'' Then answered the angel who was with me, and said unto me: ''This is the tree of wisdom, of which thy father old (in years) and thy aged mother, who were before thee, have eaten, and they learnt wisdom, and their eyes were opened, and they knew that they were naked, and they were driven out of the garden.''* (1 Enoch 32:5-6). This is no new tree — it is the one Genesis planted: *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil* (Genesis 2:9), the same of which Yahuah commanded, *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17). Enoch''s ''they learnt wisdom'' is Eve''s reach: *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat* (Genesis 3:6); and Enoch''s ''their eyes were opened, and they knew that they were naked'' is Genesis word for word — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7). Jubilees tells the same scene the same way: *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked* (Jubilees 3:21). It ain''t new — Enoch sees the literal Eden tree and names it exactly as Moses did.',
       sv.verse_id, ev.verse_id, 'extras', 50775
  FROM _session250_en32_lookup sv, _session250_en32_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=32 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-32-driven-out-tree-barred',
       E'Driven out — the tree barred until the great judgement',
       E'Of the eaten tree Enoch is told the sequel: *and they were driven out of the garden. And from that time forward no one has been permitted to touch it until the great judgement, when His righteousness shall be avenged upon the sinners, and its fruit given to the righteous and humble* (1 Enoch 32:6-7). Genesis gives the reason for the barring — lest fallen man seize life forever: *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22) — and the guard set to keep the way: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). Enoch''s ''no one permitted to touch it'' is that flaming sword''s whole purpose. Yet the wisdom the tree bears is never cursed in itself — Solomon names her a tree to be laid hold of: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). The bar is not on wisdom but on stolen wisdom; the righteous wait for the great judgement, when the way is opened again. Torah stands: the driving-out was for the breach of the command, not a curse on the tree.',
       sv.verse_id, ev.verse_id, 'extras', 50778
  FROM _session250_en32_lookup sv, _session250_en32_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=32 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-32-fruit-for-righteous-temple',
       E'The fruit given to the righteous — transplanted to the temple',
       E'At the great judgement Enoch''s tree is opened to the elect and moved to the holy place: *Then shall it be given to the righteous and humble, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King. Then shall they rejoice with joy and be glad, and into the holy place shall they enter; and its fragrance shall be in their bones, and they shall live a long life on earth* (1 Enoch 32:8-9). The Eden tree restored to a holy place is the prophets'' own picture — Eden was always the garden of Elohim: *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created* (Ezekiel 28:13). Yahusha gives the same promise to the overcomer: *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7), and Revelation sets the tree at the throne in the holy city: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2) — its right reserved for the commandment-keepers: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). And 2 Esdras hears the same opening: *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom* (2 Esdras 8:52). The fruit is for the elect who keep the way, transplanted to Yahuah''s temple at the centre — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50781
  FROM _session250_en32_lookup sv, _session250_en32_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=32 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-32-tree-of-wisdom-eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The tree of wisdom Enoch is shown is Genesis''s own tree of knowledge of good and evil, standing in the garden in the east.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* This is the very tree whose fruit Enoch''s ''father old (in years) and aged mother'' ate against the command, and so were driven out.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Enoch''s ''they learnt wisdom'' is Eve''s reach for the tree ''to make one wise'' — the same eating, the same tree.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Enoch''s ''their eyes were opened, and they knew that they were naked'' repeats Genesis verbatim — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 3:21 — *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked. And he took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame.* Jubilees carries the same eyes-opened, naked, fig-leaf account Enoch points back to at the tree of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-32-driven-out-tree-barred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* This is why Enoch''s tree was barred — man, fallen, must not seize the fruit until the judgement makes him fit.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-driven-out-tree-barred'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Enoch''s ''no one has been permitted to touch it'' is exactly the flaming sword keeping the way at the garden in the east.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-driven-out-tree-barred'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The wisdom the barred tree bears is not cursed but blessed for those who lay hold of her rightly — the fruit reserved for the righteous and humble.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-driven-out-tree-barred'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-32-fruit-for-righteous-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* Eden is named ''the garden of Elohim,'' a holy place — matching Enoch''s tree transplanted to the temple of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-fruit-for-righteous-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* Enoch''s ''its fruit shall be for life to the elect'' is Yahusha''s promise of the tree''s fruit to the overcomer in paradise.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-fruit-for-righteous-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Eden tree transplanted to Yahuah''s holy place is Revelation''s tree of life at the throne in the city — Zion at the centre.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-fruit-for-righteous-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit given ''to the righteous and humble'' is granted to the commandment-keepers — Torah stands; the right to the tree belongs to those who keep the way.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-fruit-for-righteous-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 8:52 — *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom.* Ezra hears the same opening Enoch foresees: at the time to come the paradise is opened and the tree planted for the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en32_lookup sv, _session250_en32_lookup tv
 WHERE t.slug='1-enoch-32-fruit-for-righteous-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=8 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

