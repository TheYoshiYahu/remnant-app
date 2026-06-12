-- ----- fragment: minion_1adameve_56.sql (session253 1-adam-eve 56) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch56. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae56 (view _session253_1ae56_lookup). Sort band base 65375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae56_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-56-word-promises-the-messiah
  ('adam-eve-conflict', '1-adam-eve', 56, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1 Adam & Eve 56:1 is the eternal Logos.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 7, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise of 1 Adam & Eve 56:7 — "I will come and save you" — is fulfilled when the Word becomes flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 7, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "great five and a half days" of 1 Adam & Eve 56:7 is the appointed fulness of time when the Son is sent.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 7, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The saving promised to Adam in 1 Adam & Eve 56:7 was foreordained before the world, manifested in the last times.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 7, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word who pities and promises mercy in 1 Adam & Eve 56:7 is the same Son who purges sins by Himself.'),
  -- thread: 1-adam-eve-56-empty-promise-of-the-deceiver
  ('adam-eve-conflict', '1-adam-eve', 56, 5, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The one who deceived Adam in 1 Adam & Eve 56:5 is the serpent under sentence of the seed-promise.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 6, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* That "he will not fulfil even one of the things he told you" (1 Adam & Eve 56:6) is the liar''s nature from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 6, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The empty-handed deceiver of 1 Adam & Eve 56:6 will himself be bruised under foot.'),
  -- thread: 1-adam-eve-56-cherub-sword-of-fire
  ('adam-eve-conflict', '1-adam-eve', 56, 8, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub with the sword of fire in 1 Adam & Eve 56:8 is the flaming sword set to keep the way to the tree of life.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 8, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The command to "go down from here" in 1 Adam & Eve 56:8 echoes the sending forth from Eden to till the ground.'),
  -- thread: 1-adam-eve-56-satan-transformed-false-counsel
  ('adam-eve-conflict', '1-adam-eve', 56, 13, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam mistaking Satan for one of Elohim''s angels in 1 Adam & Eve 56:13 is the very transformation Paul warns of.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 12, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan returning to the cave''s entrance the moment the angels depart (1 Adam & Eve 56:12) is the adversary prowling for whom he may devour.'),
  ('adam-eve-conflict', '1-adam-eve', 56, 13, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The deceiver''s renewed assault in 1 Adam & Eve 56:13 is the work the manifested Son comes to destroy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae56_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae56_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-56-word-promises-the-messiah',
       E'The Word who comforts and promises to come and save',
       E'The Word of Elohim Himself comes down to the man outside the garden: *Then came the Word of Elohim (God) to Adam, and said to him:--* (1 Adam & Eve 56:1), and after laying bare the toil of the cursed earth He gives the great promise of the incarnation — *Acknowledge, then, My favor towards you, and My mercy on you, My creature; that I have not avenged you for your transgression against Me, but in My pity for you I have promised you that at the end of the great five and a half days I will come and save you.* (1 Adam & Eve 56:7). It ain''t new: this is the Logos of John — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — who *was made flesh, and dwelt among us* (John 1:14). The five and a half days are the fulness of time: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* (Galatians 4:4). He who speaks to Adam is the One foreordained from the first: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3), *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 65375
  FROM _session253_1ae56_lookup sv, _session253_1ae56_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=56 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-56-empty-promise-of-the-deceiver',
       E'Ask him who deceived you — the serpent''s empty promise',
       E'The Word turns Adam to face the bankruptcy of the one he obeyed: *O Adam, ask him who deceived you, to give you the divine nature he promised you, or to make you a garden as I had made for you; or to fill you with that same bright nature with which I had filled you.* (1 Adam & Eve 56:5), *But, O Adam, he will not fulfil even one of the things he told you.* (1 Adam & Eve 56:6). This is the seed-war from Eden''s own sentence: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The deceiver is exposed by the Master Himself: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44). And the head that bruised will be bruised: *And the Elohim (God) of peace shall bruise Satan under your feet shortly...* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65378
  FROM _session253_1ae56_lookup sv, _session253_1ae56_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=56 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-56-cherub-sword-of-fire',
       E'The cherub with the sword of fire, and Adam worships',
       E'Elohim sends them down before the guarding cherub: *Then Elohim (God) said again to Adam and Eve, "Get up, go down from here, before the cherub with a sword of fire in his hand destroys you."* (1 Adam & Eve 56:8), and the comforted man bows: *But Adam''s heart was comforted by Elohim''s (God''s) words to him, and he worshipped before Him.* (1 Adam & Eve 56:9). This is the cherub of Eden''s gate: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24) — set the moment the LORD *sent him forth from the garden of Eden, to till the ground from whence he was taken.* (Genesis 3:23).',
       sv.verse_id, ev.verse_id, 'extras', 65381
  FROM _session253_1ae56_lookup sv, _session253_1ae56_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=56 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-56-satan-transformed-false-counsel',
       E'Satan transformed, with false counsel at the cave',
       E'No sooner have the angels gone than the adversary returns disguised: *But after the angels had departed from Adam and Eve, Satan came with shamefacedness, and stood at the entrance of the cave in which were Adam and Eve...* (1 Adam & Eve 56:12), and Adam is taken in — *Then Adam came out of the cave, thinking he was one of Elohim''s (God''s) angels that was come to give him some good counsel.* (1 Adam & Eve 56:13). It ain''t new: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). The roaring lion never rests: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8). But the seed of the woman comes to undo him: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65384
  FROM _session253_1ae56_lookup sv, _session253_1ae56_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=56 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-56-word-promises-the-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1 Adam & Eve 56:1 is the eternal Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-word-promises-the-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise of 1 Adam & Eve 56:7 — "I will come and save you" — is fulfilled when the Word becomes flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-word-promises-the-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "great five and a half days" of 1 Adam & Eve 56:7 is the appointed fulness of time when the Son is sent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-word-promises-the-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The saving promised to Adam in 1 Adam & Eve 56:7 was foreordained before the world, manifested in the last times.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-word-promises-the-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word who pities and promises mercy in 1 Adam & Eve 56:7 is the same Son who purges sins by Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-word-promises-the-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-56-empty-promise-of-the-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The one who deceived Adam in 1 Adam & Eve 56:5 is the serpent under sentence of the seed-promise.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-empty-promise-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* That "he will not fulfil even one of the things he told you" (1 Adam & Eve 56:6) is the liar''s nature from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-empty-promise-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The empty-handed deceiver of 1 Adam & Eve 56:6 will himself be bruised under foot.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-empty-promise-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-56-cherub-sword-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub with the sword of fire in 1 Adam & Eve 56:8 is the flaming sword set to keep the way to the tree of life.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-cherub-sword-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The command to "go down from here" in 1 Adam & Eve 56:8 echoes the sending forth from Eden to till the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-cherub-sword-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-56-satan-transformed-false-counsel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam mistaking Satan for one of Elohim''s angels in 1 Adam & Eve 56:13 is the very transformation Paul warns of.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-satan-transformed-false-counsel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan returning to the cave''s entrance the moment the angels depart (1 Adam & Eve 56:12) is the adversary prowling for whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-satan-transformed-false-counsel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The deceiver''s renewed assault in 1 Adam & Eve 56:13 is the work the manifested Son comes to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae56_lookup sv, _session253_1ae56_lookup tv
 WHERE t.slug='1-adam-eve-56-satan-transformed-false-counsel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=56 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

