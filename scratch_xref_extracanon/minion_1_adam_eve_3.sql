-- ----- fragment: minion_1adameve_03.sql (session253 1-adam-eve 3) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae3 (view _session253_1ae3_lookup). Sort band base 64050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-3-word-that-created-you
  ('adam-eve-conflict', '1-adam-eve', 3, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim promises to send Adam is the One who was with Elohim from the beginning, naming the Logos at the very first day outside Eden in 1-adam-eve 3:1.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 1, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* This is exactly the Word "that created you" of 1-adam-eve 3:1 — the Maker of Adam is the Saviour of Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 2, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who "will again save you" (1-adam-eve 3:2) is the Word made flesh to come and save what was fallen.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 1, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Word "that created you" in 1-adam-eve 3:1 is the One by whom all things were made.'),
  -- thread: 1-adam-eve-3-five-and-a-half-days
  ('adam-eve-conflict', '1-adam-eve', 3, 6, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "5,000 and 500 years" until One comes to save (1-adam-eve 3:6) is the fulness of time at which the Son was sent forth.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 6, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour appointed to a fixed term in 1-adam-eve 3:6 is the Lamb foreordained before the foundation of the world.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 2, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The Word promised to save "when the five and a half days are fulfilled" (1-adam-eve 3:2) is the Son who in the last days speaks and by whom the worlds were made.'),
  -- thread: 1-adam-eve-3-covenant-by-the-tree
  ('adam-eve-conflict', '1-adam-eve', 3, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covenant made "by the tree where Eve took of the fruit" (1-adam-eve 3:7) is the seed-promise spoken over the serpent at that same fall.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The mercy that lifts the fallen Adam and seals a covenant (1-adam-eve 3:9) carries the same promise — Satan bruised under foot shortly.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 9, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The covenant Elohim makes with the lifted-up Adam (1-adam-eve 3:9) is fulfilled when the Son is manifested to destroy the devil''s works.'),
  -- thread: 1-adam-eve-3-cherub-and-the-angel-kept-the-garden
  ('adam-eve-conflict', '1-adam-eve', 3, 10, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub "with a sword of flashing fire" at the gate (1-adam-eve 3:10) is the very cherub and flaming sword Yahuah set to keep the way of the tree of life.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 14, 'canon', 'psalms', 91, 11, 'free', E'Psalms 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The Angel Elohim sends "to keep the garden" (1-adam-eve 3:14) is the same mercy that gives His angels charge to keep His own.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 15, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The "Word of Yahuah" who comes to Adam and Eve and raises them up (1-adam-eve 3:15) is the Word who would be made flesh and dwell among men.'),
  ('adam-eve-conflict', '1-adam-eve', 3, 10, 'jubilees', 'jubilees', 3, 29, 'extras', E'Jubilees 3:29 — *And He sent out of the Garden of Eden all flesh that was in the Garden of Eden, and all flesh was scattered according to its kinds, and according to its types to the places which had been created for them.* The same primeval record of the expulsion that frames the gate-scene of 1-adam-eve 3:10 — one history of the driven-out, kept in both books.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-3-word-that-created-you',
       E'The Word that created you will again save you',
       E'On the very first days outside the garden Elohim points Adam to the One by whom he was made: *Elohim (God) said to Adam, "I have ordained on this earth days and years, and you and your descendants shall live and walk in them, until the days and years are fulfilled; when I shall send the Word that created you, and against which you have transgressed, the Word that made you come out of the garden, and that raised you when you were fallen."* (1-adam-eve 3:1) This is the Logos — the Word who was in the beginning: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *All things were made by him; and without him was not any thing made that was made.* (John 1:3) The same Word who made Adam is the Word who comes to save him: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14) And He framed the worlds: *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16) It ain''t new — the Saviour Adam looked for is the Maker he had known.',
       sv.verse_id, ev.verse_id, 'extras', 64050
  FROM _session253_1ae3_lookup sv, _session253_1ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-3-five-and-a-half-days',
       E'The great five and a half days — the fulness of time',
       E'Elohim sets the term of the promise and Adam mishears it as a span of days: *Yes, the Word that will again save you when the five and a half days are fulfilled.* (1-adam-eve 3:2) — *For Adam was thinking there would be only five and a half days for him until the end of the world.* (1-adam-eve 3:4) But mercy explains the count: *Then Elohim (God) in his mercy for Adam who was made after His own image and likeness, explained to him, that these were 5,000 and 500 years; and how One would then come and save him and his descendants.* (1-adam-eve 3:6) This is the appointed term — the fulness of time — kept from before the world: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* (Galatians 4:4) the Lamb foreordained from the beginning: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* (1 Peter 1:20) spoken in the last days by the Son: *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* (Hebrews 1:2) The redemption was set from the first day — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64053
  FROM _session253_1ae3_lookup sv, _session253_1ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-3-covenant-by-the-tree',
       E'The covenant made by the tree of the fall',
       E'Where the fruit was taken, the promise is renewed; the seed-war and its remedy are bound to the same tree: *But before that, Elohim (God) had made this covenant with our father, Adam, in the same terms, before he came out of the garden, when he was by the tree where Eve took of the fruit and gave it to him to eat.* (1-adam-eve 3:7) — *And as Adam went to it he feared, trembled and fell down; but Elohim (God) in His mercy lifted him up, and then made this covenant with him.* (1-adam-eve 3:9) At that very tree the LORD had already spoken the seed-promise over the serpent: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) — a bruising soon finished: *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20) For this the Son was manifested: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8) The covenant of mercy is older than the curse is cold.',
       sv.verse_id, ev.verse_id, 'extras', 64056
  FROM _session253_1ae3_lookup sv, _session253_1ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-3-cherub-and-the-angel-kept-the-garden',
       E'The cherub of the flaming sword and the Angel set to keep the garden',
       E'At the gate Adam and Eve meet the guardian of the way, and again receive mercy: *And again, when Adam was by the gate of the garden, and saw the cherub with a sword of flashing fire in his hand, and the cherub grew angry and frowned at him, both Adam and Eve became afraid of him, and thought he meant to put them to death. So they fell on their faces, trembled with fear.* (1-adam-eve 3:10) — *Then Elohim (God) had pity on them, and showed them mercy, and sent His Angel to keep the garden.* (1-adam-eve 3:14) — *And the Word of Yahuah (Lord) came to Adam and Eve, and raised them up.* (1-adam-eve 3:15) This is the very cherub of Eden: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24) The angel set to keep is the Father''s charge: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalms 91:11) And the same primeval history records the expulsion: *And He sent out of the Garden of Eden all flesh that was in the Garden of Eden, and all flesh was scattered according to its kinds, and according to its types to the places which had been created for them.* (Jubilees 3:29) It ain''t new — the guarded gate and the Word who raises the fallen are one story, told twice.',
       sv.verse_id, ev.verse_id, 'extras', 64059
  FROM _session253_1ae3_lookup sv, _session253_1ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-3-word-that-created-you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim promises to send Adam is the One who was with Elohim from the beginning, naming the Logos at the very first day outside Eden in 1-adam-eve 3:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-word-that-created-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* This is exactly the Word "that created you" of 1-adam-eve 3:1 — the Maker of Adam is the Saviour of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-word-that-created-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who "will again save you" (1-adam-eve 3:2) is the Word made flesh to come and save what was fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-word-that-created-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Word "that created you" in 1-adam-eve 3:1 is the One by whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-word-that-created-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-3-five-and-a-half-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "5,000 and 500 years" until One comes to save (1-adam-eve 3:6) is the fulness of time at which the Son was sent forth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-five-and-a-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour appointed to a fixed term in 1-adam-eve 3:6 is the Lamb foreordained before the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-five-and-a-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The Word promised to save "when the five and a half days are fulfilled" (1-adam-eve 3:2) is the Son who in the last days speaks and by whom the worlds were made.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-five-and-a-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-3-covenant-by-the-tree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covenant made "by the tree where Eve took of the fruit" (1-adam-eve 3:7) is the seed-promise spoken over the serpent at that same fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-covenant-by-the-tree'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The mercy that lifts the fallen Adam and seals a covenant (1-adam-eve 3:9) carries the same promise — Satan bruised under foot shortly.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-covenant-by-the-tree'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The covenant Elohim makes with the lifted-up Adam (1-adam-eve 3:9) is fulfilled when the Son is manifested to destroy the devil''s works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-covenant-by-the-tree'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-3-cherub-and-the-angel-kept-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub "with a sword of flashing fire" at the gate (1-adam-eve 3:10) is the very cherub and flaming sword Yahuah set to keep the way of the tree of life.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-cherub-and-the-angel-kept-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The Angel Elohim sends "to keep the garden" (1-adam-eve 3:14) is the same mercy that gives His angels charge to keep His own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-cherub-and-the-angel-kept-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The "Word of Yahuah" who comes to Adam and Eve and raises them up (1-adam-eve 3:15) is the Word who would be made flesh and dwell among men.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-cherub-and-the-angel-kept-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:29 — *And He sent out of the Garden of Eden all flesh that was in the Garden of Eden, and all flesh was scattered according to its kinds, and according to its types to the places which had been created for them.* The same primeval record of the expulsion that frames the gate-scene of 1-adam-eve 3:10 — one history of the driven-out, kept in both books.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae3_lookup sv, _session253_1ae3_lookup tv
 WHERE t.slug='1-adam-eve-3-cherub-and-the-angel-kept-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

