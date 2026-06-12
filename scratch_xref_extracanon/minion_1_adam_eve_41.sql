-- ----- fragment: minion_1adameve_41.sql (session253 1-adam-eve 41) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae41 (view _session253_1ae41_lookup). Sort band base 65000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-41-four-headed-river
  ('adam-eve-conflict', '1-adam-eve', 41, 5, 'canon', 'genesis', 2, 10, 'free', E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The river Adam names in 1-adam-eve 41:5 is Eden''s own four-headed river, remembered from outside the gate.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 5, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Water of Life Adam seeks in 1-adam-eve 41:5 flows from beside the tree of life he has been barred from.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 5, 'jubilees', 'jubilees', 3, 11, 'extras', E'Jubilees 3:11 — *And when she had completed these eighty days we brought her into the Garden of Eden, for it is holier than all the earth besides, and every tree that is planted in it is holy.* The garden Adam now prays toward in 1-adam-eve 41:5 is, by Jubilees'' witness, the holiest ground on earth — and he is shut outside it.'),
  -- thread: 1-adam-eve-41-water-of-life
  ('adam-eve-conflict', '1-adam-eve', 41, 12, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The Water of Life Adam begs for in 1-adam-eve 41:12 is the gift the Messiah Himself names and gives.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 12, 'canon', 'john', 7, 37, 'free', E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* Adam''s parched cry in 1-adam-eve 41:12 is the very thirst Yahusha answers with Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 12, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The Water of Life Adam mourns in 1-adam-eve 41:12 flows again, unbarred, at the end of the seed-war.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 6, 'canon', 'revelation', 22, 17, 'free', E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The freely-given Water Adam asks for in 1-adam-eve 41:6 is held open at last to every thirst.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 12, 'canon', 'psalms', 36, 8, 'free', E'Psalms 36:8 — *They shall be abundantly satisfied with the fatness of thy house; and thou shalt make them drink of the river of thy pleasures.* The river of Yahuah''s pleasure is the same Water of Life Adam thirsts after in 1-adam-eve 41:12.'),
  -- thread: 1-adam-eve-41-parched-flesh-dust
  ('adam-eve-conflict', '1-adam-eve', 41, 12, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s parched, dying flesh in 1-adam-eve 41:12 is this very curse worked out in his body.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 6, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Adam grieves in 1-adam-eve 41:6 that Yahuah has not fed him of the Tree of Life — for the way to it is kept by the flaming sword.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 13, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam''s cry for mercy under the curse in 1-adam-eve 41:13 rests on the seed-promise that crushes the serpent at last.'),
  -- thread: 1-adam-eve-41-figs-incense-offering
  ('adam-eve-conflict', '1-adam-eve', 41, 1, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The fig Adam and Eve lift onto the rods and incense in 1-adam-eve 41:1 is the very leaf of their first shame, now offered up to Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 8, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The praying and calling on Yahuah in 1-adam-eve 41:8 is the first keeping of the way of the seed, before ever the law was given.'),
  ('adam-eve-conflict', '1-adam-eve', 41, 5, 'jubilees', 'jubilees', 3, 16, 'extras', E'Jubilees 3:16 — *And he tilled (the garden), and was naked and knew it not, and was not ashamed, and he protected the garden from the birds and beasts and cattle, and gathered its fruit, and ate, and put aside the residue for himself and for his wife and put aside that which was being kept.* The garden-fruit Adam once gathered freely is the same garden he now stands outside of, fasting, in 1-adam-eve 41:5.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-41-four-headed-river',
       E'To the river parted into four heads',
       E'Adam turns Eve toward the one landmark of the lost garden that still flows in their memory: *"O Eve, come, let us go to the border of the garden looking south; to the place from where the river flows, and is parted into four heads. There we will pray to Elohim (God), and ask Him to give us some of the Water of Life to drink."* (1-adam-eve 41:5). It ain''t new — the four-headed river is Eden''s own geography from the sixth-day account: *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* (Genesis 2:10). The Water of Life Adam thirsts for is the water that ran beneath the very tree Yahuah barred: *the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). And the same restored history is told again in Jubilees, where the garden is no ordinary ground: *And when she had completed these eighty days we brought her into the Garden of Eden, for it is holier than all the earth besides, and every tree that is planted in it is holy.* (Jubilees 3:11) — Adam stands now at the border of the holiest place on earth, shut out, and prays toward it.',
       sv.verse_id, ev.verse_id, 'extras', 65000
  FROM _session253_1ae41_lookup sv, _session253_1ae41_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=41 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-41-water-of-life',
       E'Give me of the Water of Life that I may live',
       E'From the dust outside Eden, Adam cries the thirst of all flesh: *"But now, O Elohim (God), I am dead; my flesh is parched with thirst. Give me of the Water of Life that I may drink of it and live."* (1-adam-eve 41:12). It ain''t new — this is the longing the whole of Scripture answers, and answers in One. The Word who comes to comfort Adam is the same who stood at Jacob''s well and said, *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* (John 4:14), and who cried on the great day of the feast, *If any man thirst, let him come unto me, and drink.* (John 7:37). The seed-promise runs the whole arc: the river Adam mourns will run again unbarred at the end, *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* (Revelation 22:1), and the invitation is laid open to the very thirst Adam feels: *And whosoever will, let him take the water of life freely.* (Revelation 22:17). Even now the psalmist tastes the foretaste: *thou shalt make them drink of the river of thy pleasures.* (Psalms 36:8).',
       sv.verse_id, ev.verse_id, 'extras', 65003
  FROM _session253_1ae41_lookup sv, _session253_1ae41_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=41 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-41-parched-flesh-dust',
       E'My flesh is parched: the dust of the curse',
       E'Adam''s whole plaint turns on a single sentence of the Genesis judgment made flesh in him: *"But now, O Elohim (God), I am dead; my flesh is parched with thirst."* (1-adam-eve 41:12). It ain''t new — this is the sentence spoken over him at the gate: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). And the barred Tree of Life he longs to be fed from is barred by the Cherubim''s flaming sword: *and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24). Yet his plea — *bring me into another land different from this, if You will not let me live in Your garden* — is mercy seeking mercy under the very curse, and the seed-promise is its ground, *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65006
  FROM _session253_1ae41_lookup sv, _session253_1ae41_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=41 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-41-figs-incense-offering',
       E'The figs on the golden rods and the incense',
       E'The chapter opens not with despair but with worship — the first offering Adam and Eve bring outside the garden: *Then Adam took the fig, and laid it on the golden rods. Eve also took her fig, and put it on the incense.* (1-adam-eve 41:1), and *Adam and Eve remained standing and fasting the whole of that night, until the morning dawned.* (1-adam-eve 41:3). It ain''t new — the fig is the very leaf of their first covering, *and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7), now lifted up not to hide but to offer. This is the way kept before Sinai: long before the law was law-as-curse, the line of the seed called on the Name, *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The same restored history is told in Jubilees, where Adam in the garden *gathered its fruit, and ate, and put aside the residue for himself and for his wife and put aside that which was being kept* (Jubilees 3:16) — the very garden-fruit he now stands outside of, fasting before Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 65009
  FROM _session253_1ae41_lookup sv, _session253_1ae41_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=41 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-41-four-headed-river
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The river Adam names in 1-adam-eve 41:5 is Eden''s own four-headed river, remembered from outside the gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-four-headed-river'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Water of Life Adam seeks in 1-adam-eve 41:5 flows from beside the tree of life he has been barred from.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-four-headed-river'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:11 — *And when she had completed these eighty days we brought her into the Garden of Eden, for it is holier than all the earth besides, and every tree that is planted in it is holy.* The garden Adam now prays toward in 1-adam-eve 41:5 is, by Jubilees'' witness, the holiest ground on earth — and he is shut outside it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-four-headed-river'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-41-water-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The Water of Life Adam begs for in 1-adam-eve 41:12 is the gift the Messiah Himself names and gives.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-water-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* Adam''s parched cry in 1-adam-eve 41:12 is the very thirst Yahusha answers with Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-water-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The Water of Life Adam mourns in 1-adam-eve 41:12 flows again, unbarred, at the end of the seed-war.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-water-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The freely-given Water Adam asks for in 1-adam-eve 41:6 is held open at last to every thirst.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-water-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 36:8 — *They shall be abundantly satisfied with the fatness of thy house; and thou shalt make them drink of the river of thy pleasures.* The river of Yahuah''s pleasure is the same Water of Life Adam thirsts after in 1-adam-eve 41:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-water-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-41-parched-flesh-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s parched, dying flesh in 1-adam-eve 41:12 is this very curse worked out in his body.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-parched-flesh-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Adam grieves in 1-adam-eve 41:6 that Yahuah has not fed him of the Tree of Life — for the way to it is kept by the flaming sword.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-parched-flesh-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam''s cry for mercy under the curse in 1-adam-eve 41:13 rests on the seed-promise that crushes the serpent at last.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-parched-flesh-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-41-figs-incense-offering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The fig Adam and Eve lift onto the rods and incense in 1-adam-eve 41:1 is the very leaf of their first shame, now offered up to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-figs-incense-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The praying and calling on Yahuah in 1-adam-eve 41:8 is the first keeping of the way of the seed, before ever the law was given.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-figs-incense-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:16 — *And he tilled (the garden), and was naked and knew it not, and was not ashamed, and he protected the garden from the birds and beasts and cattle, and gathered its fruit, and ate, and put aside the residue for himself and for his wife and put aside that which was being kept.* The garden-fruit Adam once gathered freely is the same garden he now stands outside of, fasting, in 1-adam-eve 41:5.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae41_lookup sv, _session253_1ae41_lookup tv
 WHERE t.slug='1-adam-eve-41-figs-incense-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=41 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

