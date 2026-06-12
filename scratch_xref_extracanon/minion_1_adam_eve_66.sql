-- ----- fragment: minion_1adameve_66.sql (session253 1-adam-eve 66) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch66. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae66 (view _session253_1ae66_lookup). Sort band base 65625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-66-thirst-living-water
  ('adam-eve-conflict', '1-adam-eve', 66, 1, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The dust-formed body of 1 Adam and Eve 66:1 now hungers and thirsts, for the breath that quickened it must be sustained by Yahuah''s giving.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 3, 'canon', 'john', 7, 37, 'free', E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* The Word who commands the first man to take and drink water in 1 Adam and Eve 66:3 is the same who, made flesh, calls every thirsting man to Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 2, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* Adam must pray at the stream-bank for a drink (1 Adam and Eve 66:2); the Messiah gives the deeper water that ends thirst forever.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 4, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The stream that refreshed the exiles'' bodies in 1 Adam and Eve 66:4 is the shadow of the river of life that flows from the throne in the restored garden.'),
  -- thread: 1-adam-eve-66-word-comes-and-teaches
  ('adam-eve-conflict', '1-adam-eve', 66, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who speaks to Adam in 1 Adam and Eve 66:3 is the eternal Logos, Himself Elohim, come down to the exile.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 7, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who points Adam to the land of dark soil and its food in 1 Adam and Eve 66:7 is the very One by whom that soil and grain were made.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 9, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets* The Word giving wisdom to Adam''s heart in 1 Adam and Eve 66:9 is the first of Elohim''s speakings to the fathers, finished at last in the Son.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 9, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* The wisdom Elohim pours into Adam''s heart to make bread (1 Adam and Eve 66:9) is the formed Wisdom that stood beside Him before the works of old.'),
  -- thread: 1-adam-eve-66-figs-a-sign-for-generations
  ('adam-eve-conflict', '1-adam-eve', 66, 5, 'canon', 'exodus', 12, 14, 'free', E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* Adam laying up the figs as a sign for his descendants in 1 Adam and Eve 66:5 is the first memorial of Yahuah''s mercy kept for the generations to come.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 5, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The blessing Adam stores up for his descendants in 1 Adam and Eve 66:5 is kept by the holy seed of Seth, who began to call upon the Name.'),
  -- thread: 1-adam-eve-66-bread-by-the-sweat
  ('adam-eve-conflict', '1-adam-eve', 66, 10, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam growing faint and weary winning bread from wheat in 1 Adam and Eve 66:10 is the Eden sentence now lived out day by day.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 9, 'jubilees', 'jubilees', 3, 25, 'extras', E'Jubilees 3:25 — *And to Adam also He said, “Because you have hearkened to the voice of your wife, and have eaten of the tree of which I commanded you that you should not eat thereof, cursed be the ground for your sake: thorns and thistles shall it bring forth to you, and you shall eat your bread in the sweat of your face, till you return to the earth from whence you were taken; for earth you are, and to earth shall you return.”* The same primeval history teaches that Adam''s bread-labor in 1 Adam and Eve 66:9 flows straight from the curse on the ground.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 8, 'canon', 'john', 6, 33, 'free', E'John 6:33 — *For the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world.* The wheat-bread Adam finds and labors over in 1 Adam and Eve 66:8 is the figure of the true Bread that comes down from heaven.'),
  ('adam-eve-conflict', '1-adam-eve', 66, 10, 'canon', 'john', 6, 51, 'free', E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The weary toil for perishing bread in 1 Adam and Eve 66:10 cries out for the living Bread whose flesh ends the curse of death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-66-thirst-living-water',
       E'Let us ask Him to give us a drink of water',
       E'Outside the garden the brutish body now thirsts, and Adam will not drink until he is bidden: *"Look, we asked for food of Elohim (God), and He gave it. But now let us also ask Him to give us a drink of water."* (1 Adam and Eve 66:1), and the Word answers, *"O Adam, your body has become brutish, and requires water to drink. Take some and drink it..."* (1 Adam and Eve 66:3). The same Yahuah who *formed man of the dust of the ground, and breathed into his nostrils the breath of life* (Genesis 2:7) now keeps that dust alive by water given from His own hand. And the thirst of fallen Adam is the very thirst the Messiah comes to answer: *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* (John 7:37), *the water that I shall give him shall be in him a well of water springing up into everlasting life.* (John 4:14). It ain''t new — the river that watered Eden flows on to the throne: *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* (Revelation 22:1).',
       sv.verse_id, ev.verse_id, 'extras', 65625
  FROM _session253_1ae66_lookup sv, _session253_1ae66_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=66 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-66-word-comes-and-teaches',
       E'Then the Word of Elohim came to Adam',
       E'Again and again it is *the Word of Elohim (God)* who comes to the exiles — *Then the Word of Elohim (God) came to Adam* (1 Adam and Eve 66:3), *Then the Word of Elohim (God) came and said to him* (1 Adam and Eve 66:7), and it is He who teaches: *And Elohim (God) gave Adam''s heart wisdom, to work out the corn until it became bread.* (1 Adam and Eve 66:9). This is no mere voice but the Logos by whom all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1), *All things were made by him; and without him was not any thing made that was made.* (John 1:3). He spoke to the fathers of old and still upholds them: *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1). And the wisdom He pours into Adam''s heart is the same Wisdom that stood beside Him at creation: *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him* (Proverbs 8:30). It ain''t new — the Word who comforts Adam on his first days of exile is the Word made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 65628
  FROM _session253_1ae66_lookup sv, _session253_1ae66_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=66 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-66-figs-a-sign-for-generations',
       E'A sign and a blessing to their descendants',
       E'Adam hangs the two figs in the cave as a remembrance for those who would come after: *they took the two figs and hung them in the cave, together with the leaves thereof, to be to them a sign and a blessing from Elohim (God). And they placed them there so that if their descendants came there, they would see the wonderful things Elohim (God) had done for them.* (1 Adam and Eve 66:5). This is the covenant pattern — Yahuah''s mercies laid up as a memorial for the generations: *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14). It is the way Seth''s holy line would keep, the calling on the Name that began in his house: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). The seed is kept by remembering the wonderful things Elohim has done.',
       sv.verse_id, ev.verse_id, 'extras', 65631
  FROM _session253_1ae66_lookup sv, _session253_1ae66_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=66 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-66-bread-by-the-sweat',
       E'Bread won by toil, and the Bread of life',
       E'Adam learns the curse in his own labor — wheat must be wrought into bread, and the work wearies him: *Take some of this wheat and make yourselves some bread with it, to nourish your body therewith.* (1 Adam and Eve 66:9), *Adam accomplished all that, until he grew very faint and weary.* (1 Adam and Eve 66:10). This is the sentence of Eden being lived out: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). The same word is kept in the restored library: *cursed be the ground for your sake... and you shall eat your bread in the sweat of your face, till you return to the earth from whence you were taken* (Jubilees 3:25). Yet the bread of toil points beyond itself to the bread that ends the curse: *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever; and the bread that I will give is my flesh, which I will give for the life of the world.* (John 6:51). It ain''t new — the faint and weary Adam who must labor for bread waits for the Bread of life.',
       sv.verse_id, ev.verse_id, 'extras', 65634
  FROM _session253_1ae66_lookup sv, _session253_1ae66_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=66 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-66-thirst-living-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The dust-formed body of 1 Adam and Eve 66:1 now hungers and thirsts, for the breath that quickened it must be sustained by Yahuah''s giving.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-thirst-living-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* The Word who commands the first man to take and drink water in 1 Adam and Eve 66:3 is the same who, made flesh, calls every thirsting man to Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-thirst-living-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* Adam must pray at the stream-bank for a drink (1 Adam and Eve 66:2); the Messiah gives the deeper water that ends thirst forever.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-thirst-living-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The stream that refreshed the exiles'' bodies in 1 Adam and Eve 66:4 is the shadow of the river of life that flows from the throne in the restored garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-thirst-living-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-66-word-comes-and-teaches
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who speaks to Adam in 1 Adam and Eve 66:3 is the eternal Logos, Himself Elohim, come down to the exile.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-word-comes-and-teaches'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who points Adam to the land of dark soil and its food in 1 Adam and Eve 66:7 is the very One by whom that soil and grain were made.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-word-comes-and-teaches'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets* The Word giving wisdom to Adam''s heart in 1 Adam and Eve 66:9 is the first of Elohim''s speakings to the fathers, finished at last in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-word-comes-and-teaches'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* The wisdom Elohim pours into Adam''s heart to make bread (1 Adam and Eve 66:9) is the formed Wisdom that stood beside Him before the works of old.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-word-comes-and-teaches'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-66-figs-a-sign-for-generations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* Adam laying up the figs as a sign for his descendants in 1 Adam and Eve 66:5 is the first memorial of Yahuah''s mercy kept for the generations to come.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-figs-a-sign-for-generations'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The blessing Adam stores up for his descendants in 1 Adam and Eve 66:5 is kept by the holy seed of Seth, who began to call upon the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-figs-a-sign-for-generations'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-66-bread-by-the-sweat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam growing faint and weary winning bread from wheat in 1 Adam and Eve 66:10 is the Eden sentence now lived out day by day.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-bread-by-the-sweat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 3:25 — *And to Adam also He said, “Because you have hearkened to the voice of your wife, and have eaten of the tree of which I commanded you that you should not eat thereof, cursed be the ground for your sake: thorns and thistles shall it bring forth to you, and you shall eat your bread in the sweat of your face, till you return to the earth from whence you were taken; for earth you are, and to earth shall you return.”* The same primeval history teaches that Adam''s bread-labor in 1 Adam and Eve 66:9 flows straight from the curse on the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-bread-by-the-sweat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:33 — *For the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world.* The wheat-bread Adam finds and labors over in 1 Adam and Eve 66:8 is the figure of the true Bread that comes down from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-bread-by-the-sweat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The weary toil for perishing bread in 1 Adam and Eve 66:10 cries out for the living Bread whose flesh ends the curse of death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae66_lookup sv, _session253_1ae66_lookup tv
 WHERE t.slug='1-adam-eve-66-bread-by-the-sweat'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=66 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

