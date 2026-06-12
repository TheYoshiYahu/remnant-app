-- ----- fragment: minion_1adameve_35.sql (session253 1-adam-eve 35) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae35 (view _session253_1ae35_lookup). Sort band base 64850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-35-word-comes-to-adam
  ('adam-eve-conflict', '1-adam-eve', 35, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes to Adam in 35:1 is the eternal Logos, Elohim Himself, not a created messenger.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 1, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word who made Adam now stoops to comfort him in his crying and groaning.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 1, 'canon', 'genesis', 3, 8, 'free', E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* The voice that walked in Eden is the Word who now comes to Adam outside it in 35:1.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 1, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comforts the exiled Adam in 35:1 will one day take flesh to redeem that exile.'),
  -- thread: 1-adam-eve-35-garden-no-suffering
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'genesis', 2, 15, 'free', E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* The garden of 35:2, free of faintness and suffering, is the very Eden Yahuah first gave Adam to keep.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The no-suffering, no-change estate of the garden in 35:2 is exactly what is restored in the New Jerusalem.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The garden''s deathless life of 35:2 returns at the tree of life in the city of Elohim.'),
  -- thread: 1-adam-eve-35-strange-land-curse
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The transgression named in 35:2 is the breaking of this one command, the door to all the trials.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* The trials of the strange land in 35:2 are the curse pronounced over Adam at the fall.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Paul names the same one-man transgression that brought Adam into the strange land of suffering in 35:2.'),
  ('adam-eve-conflict', '1-adam-eve', 35, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Even as the trials begin in 35:2, the seed-promise already stands as Yahuah''s mercy against the serpent.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-35-word-comes-to-adam',
       E'The Word of Elohim comes to the grieving Adam',
       E'*Then Elohim (God) looked again at Adam and his crying and groaning, and the Word of Elohim (God) came to him, and said to him* (1 Adam and Eve 35:1). From the very first day outside the garden it is the **Word** — the Logos — who comes to Adam, hears his groaning, and speaks. This is no created angel but the One of whom John testifies: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *All things were made by him; and without him was not any thing made that was made* (John 1:3). The same Word who walked in Eden in the cool of the day — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day* (Genesis 3:8) — now seeks the fallen man outside it. And the Word that comforts Adam in his exile is the Word that will at last *be made flesh, and dwell among us* (John 1:14) to bear that exile away. It ain''t new: the Comforter of Adam is the Saviour of the world.',
       sv.verse_id, ev.verse_id, 'extras', 64850
  FROM _session253_1ae35_lookup sv, _session253_1ae35_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=35 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-35-garden-no-suffering',
       E'In the garden no suffering; in the strange land the trials came',
       E'*O Adam, when you were in My garden, you knew neither eating nor drinking; neither faintness nor suffering; neither leanness of flesh, nor change; neither did sleep depart from thine eyes* (1 Adam and Eve 35:2). The Word names what Eden was: a place free of want, pain, and decay, where Yahuah had set the man — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it* (Genesis 2:15). That painless estate is precisely what the prophets promise will be restored at the end: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4). The first garden and the New Jerusalem bracket the whole story — and at the river of the city stands again *the tree of life... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). It ain''t new: redemption is Eden regained.',
       sv.verse_id, ev.verse_id, 'extras', 64853
  FROM _session253_1ae35_lookup sv, _session253_1ae35_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=35 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-35-strange-land-curse',
       E'The strange land: the trials that came by transgression',
       E'*But since you transgressed, and came into this strange land, all these trials are come over you* (1 Adam and Eve 35:2). The Word traces every trial to a single root — transgression. The warning had been plain: *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17). When Adam ate, the ground itself was cursed and toil and sorrow became his bread: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Paul names the same hinge of history: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The ''strange land'' of exile and its trials are the very curse of Eden''s fall — and the seed-war answer is already promised back in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64856
  FROM _session253_1ae35_lookup sv, _session253_1ae35_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=35 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-35-word-comes-to-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes to Adam in 35:1 is the eternal Logos, Elohim Himself, not a created messenger.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word who made Adam now stoops to comfort him in his crying and groaning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* The voice that walked in Eden is the Word who now comes to Adam outside it in 35:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comforts the exiled Adam in 35:1 will one day take flesh to redeem that exile.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-35-garden-no-suffering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* The garden of 35:2, free of faintness and suffering, is the very Eden Yahuah first gave Adam to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-garden-no-suffering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The no-suffering, no-change estate of the garden in 35:2 is exactly what is restored in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-garden-no-suffering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The garden''s deathless life of 35:2 returns at the tree of life in the city of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-garden-no-suffering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-35-strange-land-curse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The transgression named in 35:2 is the breaking of this one command, the door to all the trials.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-strange-land-curse'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* The trials of the strange land in 35:2 are the curse pronounced over Adam at the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-strange-land-curse'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Paul names the same one-man transgression that brought Adam into the strange land of suffering in 35:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-strange-land-curse'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Even as the trials begin in 35:2, the seed-promise already stands as Yahuah''s mercy against the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae35_lookup sv, _session253_1ae35_lookup tv
 WHERE t.slug='1-adam-eve-35-strange-land-curse'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

