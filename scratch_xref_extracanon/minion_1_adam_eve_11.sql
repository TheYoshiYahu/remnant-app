-- ----- fragment: minion_1adameve_11.sql (session253 1-adam-eve 11) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae11 (view _session253_1ae11_lookup). Sort band base 64250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-11-thirst-and-the-heat
  ('adam-eve-conflict', '1-adam-eve', 11, 1, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 - *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The burning thirst, heat, and sorrow of 1 Adam and Eve 11:1 is the ground''s curse felt in their own bodies the first day outside the gate.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 - *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s dread for that of our descendants in 11:2 reaches forward along the seed line on which the serpent will keep striking and the woman''s Seed will at last bruise his head.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 1, 'canon', 'isaiah', 49, 10, 'free', E'Isaiah 49:10 - *They shall not hunger nor thirst; neither shall the heat nor sun smite them: for he that hath mercy on them shall lead them, even by the springs of water shall he guide them.* The thirst and heat that smite Adam in 11:1 are exactly what Yahuah''s mercy lifts from the gathered seed.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 3, 'canon', 'john', 4, 14, 'free', E'John 4:14 - *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The water Adam refuses in 11:3 lest it deepen the curse is answered by the living water the woman''s Seed gives, which ends thirst forever.'),
  -- thread: 1-adam-eve-11-the-cave-of-darkness
  ('adam-eve-conflict', '1-adam-eve', 11, 4, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 - *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The blind dark of the Cave in 11:4 is the bitter inside of the gate Yahuah barred with the flaming sword.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 6, 'canon', 'john', 1, 5, 'free', E'John 1:5 - *And the light shineth in darkness; and the darkness comprehended it not.* Eve standing in this darkness in 11:6 is the very night into which the Logos, the life and light of men, will shine and not be overcome.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 5, 'canon', 'john', 8, 12, 'free', E'John 8:12 - *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* Adam''s cry in the dark cave (11:5) is answered by the Seed who is Himself the light that lifts the walk out of darkness.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 4, 'jubilees', 'jubilees', 3, 32, 'extras', E'Jubilees 3:32 - *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* The same primeval history: cast out of the lit Garden, Adam and Eve now dwell below it, here in the dark Cave of 11:4.'),
  -- thread: 1-adam-eve-11-remember-the-light-of-the-garden
  ('adam-eve-conflict', '1-adam-eve', 11, 9, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 - *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Tree of Life Adam bids Eve remember in 11:9 is the very tree Yahuah set in the midst of Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 9, 'canon', 'genesis', 2, 10, 'free', E'Genesis 2:10 - *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The water that flowed from below the Tree of Life in 11:9 is the river of Eden that watered the whole garden.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 10, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 - *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The garden in which was no darkness (11:10) is restored at the end as the city of unfading light for the gathered seed.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 9, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 - *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Tree of Life and its flowing water Adam mourns in 11:9 stand again in the New Jerusalem, by the river of life, for the healing of the nations.'),
  ('adam-eve-conflict', '1-adam-eve', 11, 7, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 - *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The bright nature and garden Adam bids Eve remember in 11:7 is reopened to the seed who keep the commandments - election precedes confession, but the way back is kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-11-thirst-and-the-heat',
       E'Burning with thirst and heat - the curse outside the garden',
       E'Driven from Eden, the first man and woman feel the ground''s curse in their own flesh: *Then Adam and Eve felt themselves burning with thirst, and heat, and sorrow* (1 Adam and Eve 11:1), yet Adam will not drink lest the water *increase our punishments and that of our descendants* (11:2). This is the very curse Yahuah spoke at the gate - *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17) - the seed of the woman now bearing the serpent''s bruise (Genesis 3:15). But the same prophets who name the thirst name its end: in the gathering *They shall not hunger nor thirst; neither shall the heat nor sun smite them* (Isaiah 49:10), and the Lamb gives the thirsty *a well of water springing up into everlasting life* (John 4:14).',
       sv.verse_id, ev.verse_id, 'extras', 64250
  FROM _session253_1ae11_lookup sv, _session253_1ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-11-the-cave-of-darkness',
       E'The Cave of Treasures - darkness where there was no darkness',
       E'Entering the Cave of Treasures, Adam and Eve are swallowed in a blackness they have never known: *when in it Adam could not see Eve; he only heard the noise she made* (1 Adam and Eve 11:4), and Eve answers from the dark, *Look, I am standing in this darkness* (11:6). This is the far side of the gate that *placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24): the lit garden is shut, the dark cave opened. Yet the darkness is not the last word - *In him was life; and the life was the light of men. And the light shineth in darkness; and the darkness comprehended it not* (John 1:4-5). The Word who will come to comfort Adam is Himself the light the cave lacks: *I am the light of the world* (John 8:12).',
       sv.verse_id, ev.verse_id, 'extras', 64253
  FROM _session253_1ae11_lookup sv, _session253_1ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-11-remember-the-light-of-the-garden',
       E'Remember the garden - the lost light, the tree of life, restored',
       E'Adam comforts Eve by memory of the lost glory: *Remember the bright nature in which we lived, when we lived in the garden!* (1 Adam and Eve 11:7); *Think of the Tree of Life, from below which flowed the water, and that shed lustre over us!* (11:9); *Think, oh think of that garden in which was no darkness, while we lived in it* (11:10). That garden''s river and tree are no fable - *a river went out of Eden to water the garden* (Genesis 2:10), and in its midst was *the tree of life* (Genesis 2:9). What Adam mourns as lost is what the woman''s Seed restores at the end: a city where *there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim... giveth them light* (Revelation 22:5), where the tree of life stands again by the river of life, opened to *they that do his commandments* (Revelation 22:14). The garden Adam lost is the garden kept for the seed.',
       sv.verse_id, ev.verse_id, 'extras', 64256
  FROM _session253_1ae11_lookup sv, _session253_1ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-11-thirst-and-the-heat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 - *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The burning thirst, heat, and sorrow of 1 Adam and Eve 11:1 is the ground''s curse felt in their own bodies the first day outside the gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-thirst-and-the-heat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 - *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s dread for that of our descendants in 11:2 reaches forward along the seed line on which the serpent will keep striking and the woman''s Seed will at last bruise his head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-thirst-and-the-heat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:10 - *They shall not hunger nor thirst; neither shall the heat nor sun smite them: for he that hath mercy on them shall lead them, even by the springs of water shall he guide them.* The thirst and heat that smite Adam in 11:1 are exactly what Yahuah''s mercy lifts from the gathered seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-thirst-and-the-heat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 4:14 - *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The water Adam refuses in 11:3 lest it deepen the curse is answered by the living water the woman''s Seed gives, which ends thirst forever.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-thirst-and-the-heat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-11-the-cave-of-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 - *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The blind dark of the Cave in 11:4 is the bitter inside of the gate Yahuah barred with the flaming sword.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-the-cave-of-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:5 - *And the light shineth in darkness; and the darkness comprehended it not.* Eve standing in this darkness in 11:6 is the very night into which the Logos, the life and light of men, will shine and not be overcome.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-the-cave-of-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:12 - *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* Adam''s cry in the dark cave (11:5) is answered by the Seed who is Himself the light that lifts the walk out of darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-the-cave-of-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:32 - *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* The same primeval history: cast out of the lit Garden, Adam and Eve now dwell below it, here in the dark Cave of 11:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-the-cave-of-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-11-remember-the-light-of-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 - *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Tree of Life Adam bids Eve remember in 11:9 is the very tree Yahuah set in the midst of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-remember-the-light-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:10 - *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The water that flowed from below the Tree of Life in 11:9 is the river of Eden that watered the whole garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-remember-the-light-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:5 - *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The garden in which was no darkness (11:10) is restored at the end as the city of unfading light for the gathered seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-remember-the-light-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 - *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Tree of Life and its flowing water Adam mourns in 11:9 stand again in the New Jerusalem, by the river of life, for the healing of the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-remember-the-light-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 22:14 - *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The bright nature and garden Adam bids Eve remember in 11:7 is reopened to the seed who keep the commandments - election precedes confession, but the way back is kept.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae11_lookup sv, _session253_1ae11_lookup tv
 WHERE t.slug='1-adam-eve-11-remember-the-light-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

