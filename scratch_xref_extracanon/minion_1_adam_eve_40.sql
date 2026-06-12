-- ----- fragment: minion_1adameve_40.sql (session253 1-adam-eve 40) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae40 (view _session253_1ae40_lookup). Sort band base 64975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-40-the-word-who-comes-to-adam
  ('adam-eve-conflict', '1-adam-eve', 40, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who came to Adam in 1 Adam & Eve 40:1 is the eternal Logos, not a mere voice.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 1, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word who fashioned Adam now comes to instruct him outside the garden (1 Adam & Eve 40:1).'),
  ('adam-eve-conflict', '1-adam-eve', 40, 1, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* shows the Word speaking to the very first father, Adam, in 1 Adam & Eve 40:1.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 3, 'jubilees', 'jubilees', 3, 32, 'extras', E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* The same primeval history fixes the day the Word withdrew and Adam took up life in the strange land (1 Adam & Eve 40:3).'),
  -- thread: 1-adam-eve-40-no-dread-before-the-fall
  ('adam-eve-conflict', '1-adam-eve', 40, 1, 'canon', 'genesis', 2, 16, 'free', E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat:* the one command whose breaking first brought the dread the Word asks after in 1 Adam & Eve 40:1.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 1, 'canon', 'genesis', 3, 10, 'free', E'Genesis 3:10 — *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* This is the very fear born of transgression that the Word recalls in 1 Adam & Eve 40:1.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 1, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver behind Adam’s fall is the same liar from the beginning whose work the dread of 1 Adam & Eve 40:1 betrays.'),
  -- thread: 1-adam-eve-40-strange-land-earthy-body
  ('adam-eve-conflict', '1-adam-eve', 40, 2, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The earthly food the animal body now needs in 1 Adam & Eve 40:2 is the very bread of the cursed ground.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 2, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* names the curse that makes the strange land yield only laboured food in 1 Adam & Eve 40:2.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 2, 'canon', '1-corinthians', 15, 47, 'free', E'1 Corinthians 15:47 — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* Adam’s animal body of earth that must be fed in 1 Adam & Eve 40:2 is the earthy first man, set against the heavenly Second.'),
  ('adam-eve-conflict', '1-adam-eve', 40, 2, 'jubilees', 'jubilees', 3, 32, 'extras', E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* The same record sends Adam into the land where his earthy body must now find earthly food (1 Adam & Eve 40:2).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-40-the-word-who-comes-to-adam',
       E'The Word of Elohim who comes to Adam',
       E'When Adam is cast into the strange land it is not a bare voice but the Word Himself who comes and speaks: *Then the Word of Elohim (God) came to Adam, and said to him* (1 Adam & Eve 40:1) — and when the reproof is finished, *And Elohim (God) withdrew His Word for Adam* (1 Adam & Eve 40:3). This is the Logos who walked in the garden, the same of whom John testifies: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *All things were made by him; and without him was not any thing made that was made* (John 1:3). It ain’t new — from the very first day outside Eden, Elohim *who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1) speaks to Adam by His Son. The same Word who comforts and reproves here is the One who will be made flesh and dwell among us. Jubilees marks the very day He sent them out and the land of their dwelling: *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation* (Jubilees 3:32).',
       sv.verse_id, ev.verse_id, 'extras', 64975
  FROM _session253_1ae40_lookup sv, _session253_1ae40_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=40 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-40-no-dread-before-the-fall',
       E'Why no dread before the transgression',
       E'The Word presses Adam with the wound of the fall: *O Adam, why didn’t you have this dread, or this fasting, or this care before now? And why didn’t you have this fear before you transgressed?* (1 Adam & Eve 40:1). The dread came only after the one command was broken. That command stood plainly: *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat* (Genesis 2:16), with the single charge that to eat of the tree of knowledge meant death. And when the fear first awoke it was the fear of the fallen: *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself* (Genesis 3:10). The dread — “it ain’t new” — traces straight to the serpent who deceived them, the same deceiver Yahusha names: *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44). The seed-war shows from the first day: the liar struck, and Yahuah’s reproof recalls Adam to the fear he lost.',
       sv.verse_id, ev.verse_id, 'extras', 64978
  FROM _session253_1ae40_lookup sv, _session253_1ae40_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=40 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-40-strange-land-earthy-body',
       E'The strange land and the body of earth',
       E'The Word explains why Adam now hungers: *But when you came to live in this strange land, your animal body could not survive on earth without earthly food, to strengthen it and to restore its powers* (1 Adam & Eve 40:2). The body of dust now needs the bread of the cursed ground — exactly the sentence pronounced in Eden: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life... In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:17,19). It is the same earthy frame from the first forming: *The first man Adam was made a living soul... The first man is of the earth, earthy* (1 Corinthians 15:45,47) — the body that must be fed, sown a natural body, awaiting the spiritual. Jubilees too marks Adam taken from the garden to dwell in the land of his creation: *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation* (Jubilees 3:32). The strange land and its earthly food are the curse and Yahuah’s mercy together: the dust-man kept alive toward the promised Saviour.',
       sv.verse_id, ev.verse_id, 'extras', 64981
  FROM _session253_1ae40_lookup sv, _session253_1ae40_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=40 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-40-the-word-who-comes-to-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who came to Adam in 1 Adam & Eve 40:1 is the eternal Logos, not a mere voice.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-the-word-who-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word who fashioned Adam now comes to instruct him outside the garden (1 Adam & Eve 40:1).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-the-word-who-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* shows the Word speaking to the very first father, Adam, in 1 Adam & Eve 40:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-the-word-who-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* The same primeval history fixes the day the Word withdrew and Adam took up life in the strange land (1 Adam & Eve 40:3).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-the-word-who-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-40-no-dread-before-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat:* the one command whose breaking first brought the dread the Word asks after in 1 Adam & Eve 40:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-no-dread-before-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:10 — *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* This is the very fear born of transgression that the Word recalls in 1 Adam & Eve 40:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-no-dread-before-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver behind Adam’s fall is the same liar from the beginning whose work the dread of 1 Adam & Eve 40:1 betrays.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-no-dread-before-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-40-strange-land-earthy-body
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The earthly food the animal body now needs in 1 Adam & Eve 40:2 is the very bread of the cursed ground.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-strange-land-earthy-body'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* names the curse that makes the strange land yield only laboured food in 1 Adam & Eve 40:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-strange-land-earthy-body'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:47 — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* Adam’s animal body of earth that must be fed in 1 Adam & Eve 40:2 is the earthy first man, set against the heavenly Second.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-strange-land-earthy-body'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* The same record sends Adam into the land where his earthy body must now find earthly food (1 Adam & Eve 40:2).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae40_lookup sv, _session253_1ae40_lookup tv
 WHERE t.slug='1-adam-eve-40-strange-land-earthy-body'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

