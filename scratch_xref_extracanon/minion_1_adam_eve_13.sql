-- ----- fragment: minion_1adameve_13.sql (session253 1-adam-eve 13) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae13 (view _session253_1ae13_lookup). Sort band base 64300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-13-satan-fallen-from-light
  ('adam-eve-conflict', '1-adam-eve', 13, 3, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The prophet''s son-of-the-morning is the very bright one whom Elohim says He deprived of his bright nature so that he became dark.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 5, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The Messiah witnesses the same fall from the heaven onto the earth that Elohim recounts to Adam in the cave.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 5, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The casting down to earth that Adam hears on his first dark night is shown again at the last as the dragon hurled down.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 3, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The darkness that overtook the transgressing angel is the chains of darkness in which the apostle says such angels are reserved.'),
  -- thread: 1-adam-eve-13-coats-of-skin-mercy
  ('adam-eve-conflict', '1-adam-eve', 13, 7, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The skin Elohim says He spread over Adam''s body of flesh is the very coat of skins with which He clothed the pair in the garden''s aftermath.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 7, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The body of flesh Elohim made for Adam is the dust-formed frame He first quickened with His own breath.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 8, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Elohim''s restraint of the destroying wrath leaves Adam only the mortal sentence of return-to-dust, not annihilation into darkness.'),
  -- thread: 1-adam-eve-13-night-not-punishment
  ('adam-eve-conflict', '1-adam-eve', 13, 12, 'canon', 'genesis', 1, 4, 'free', E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* The bounded twelve hours of night that Elohim explains to Adam is the very dividing of light from darkness set down at the first day.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 10, 'canon', 'john', 1, 5, 'free', E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* The promise that the night cannot last and daylight will return is the Logos''s own nature, the Light the darkness cannot overcome.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 21, 'canon', 'john', 8, 12, 'free', E'John 8:12 — *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* The One who tells Adam the daylight will soon appear is the Light of the world who keeps His own out of the darkness.'),
  -- thread: 1-adam-eve-13-children-of-light
  ('adam-eve-conflict', '1-adam-eve', 13, 14, 'canon', 'john', 1, 4, 'free', E'John 1:4 — *In him was life; and the life was the light of men.* The children of light Elohim willed to bring forth from Adam draw that light from the Logos in whom the life of men is light.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 14, 'canon', '1-thessalonians', 5, 5, 'free', E'1 Thessalonians 5:5 — *Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness.* The very children of light Elohim purposed from Adam are named in the seed kept to the day, not the night.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 12, 'canon', 'ephesians', 5, 8, 'free', E'Ephesians 5:8 — *For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light.* Those Elohim made to do their work in the day''s light are called to walk as the children of light He willed from the first.'),
  -- thread: 1-adam-eve-13-commandment-and-the-deceiver
  ('adam-eve-conflict', '1-adam-eve', 13, 16, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The Satan who deceived Adam through the tree is the serpent set at enmity with the seed of the woman — the seed-war from the first day outside the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 16, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The deceiver who deceived himself and Adam is the same transforming one the apostle warns of, the fallen light counterfeiting the true.'),
  ('adam-eve-conflict', '1-adam-eve', 13, 19, 'canon', '1-john', 1, 5, 'free', E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* Elohim''s word that the blame rests on His creatures alone rests on this: He is light, with no darkness in Him to charge.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-13-satan-fallen-from-light',
       E'The bright angel turned dark — Satan fallen from light',
       E'Elohim explains to Adam how the darkness came to be: *But when he transgressed My commandment, I deprived him of that bright nature, and he became dark.* (1 Adam & Eve 13:3) — *But he transgressed, and I made him fall from the heaven onto the earth; and it was this darkness that came over him.* (1 Adam & Eve 13:5). It ain''t new: the prophets and the Messiah Himself name this same fall. Isaiah taunts the cut-down one: *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12). Yahusha saw it: *And he said unto them, I beheld Satan as lightning fall from heaven.* (Luke 10:18). And John sees the casting-down made final: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). Jude binds the fallen ones in the very darkness this chapter describes: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6).',
       sv.verse_id, ev.verse_id, 'extras', 64300
  FROM _session253_1ae13_lookup sv, _session253_1ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-13-coats-of-skin-mercy',
       E'The body of flesh and skin — wrath withheld in mercy',
       E'Elohim tells Adam that the flesh he now wears is not death but mercy: *Yet, of My mercy, I did not turn you into darkness, but I made you your body of flesh, over which I spread this skin, in order that it may bear cold and heat.* (1 Adam & Eve 13:7) — *If I had let My wrath fall heavily on you, I should have destroyed you; and had I turned you into darkness, it would have been as if I had killed you.* (1 Adam & Eve 13:8). This is the Genesis scene unfolded: *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* (Genesis 3:21) — the covering of skin is itself the mercy. The flesh is the dust Yahuah first breathed into: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7), and to which the fall returns him: *for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). Yet Elohim withholds the killing stroke — the seed of the woman is kept alive.',
       sv.verse_id, ev.verse_id, 'extras', 64303
  FROM _session253_1ae13_lookup sv, _session253_1ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-13-night-not-punishment',
       E'This darkness is not a punishment — daylight will return',
       E'The Word comforts terrified Adam, that the night is bounded and the light will come: *Thus, O Adam, has this night deceived you. It is not to last forever; but is only of twelve hours; when it is over, daylight will return.* (1 Adam & Eve 13:10) — *Strengthen your heart, and be not afraid. This darkness is not a punishment.* (1 Adam & Eve 13:12) — *But little of darkness now remains, O Adam, and daylight will soon appear.* (1 Adam & Eve 13:21). This is the order set down at creation: *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* (Genesis 1:4). And it is the Logos who speaks here — the Light in whom the darkness cannot prevail: *And the light shineth in darkness; and the darkness comprehended it not.* (John 1:5) — *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* (John 8:12). The voice consoling Adam in the cave is the same Light that came into the world.',
       sv.verse_id, ev.verse_id, 'extras', 64306
  FROM _session253_1ae13_lookup sv, _session253_1ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-13-children-of-light',
       E'Children of light — the purpose of Adam''s making',
       E'Elohim names the reason He formed Adam and the seed He purposed: *But, O Adam, I have made the day, and have placed the sun in it to give light; in order that you and your children should do your work.* (1 Adam & Eve 13:12) — *For I made you of the light; and I willed to bring out children of light from you and like to you.* (1 Adam & Eve 13:14). This is the Logos''s own life, the light of men: *In him was life; and the life was the light of men.* (John 1:4). The apostle declares Adam''s race remade into exactly these children of light: *Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness.* (1 Thessalonians 5:5) — *For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light.* (Ephesians 5:8). The covenant purpose declared over the first man is the very calling kept for the seed of the woman.',
       sv.verse_id, ev.verse_id, 'extras', 64309
  FROM _session253_1ae13_lookup sv, _session253_1ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-13-commandment-and-the-deceiver',
       E'The commandment given, and Satan who deceived himself',
       E'Elohim shows that the commandment was given precisely so no blame could fall on Him, and names the deceiver behind the tree: *Then, concerning the tree, I commanded you not to eat of it. Yet I knew that Satan, who deceived himself, would also deceive you.* (1 Adam & Eve 13:16) — *But I commanded you, and warned you, and you fell. So that My creatures cannot blame Me; but the blame rests on them alone.* (1 Adam & Eve 13:19). This is the serpent of the seed-war: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The deceiver who first deceived himself is the same who transforms to deceive: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14) — the great serpent *which deceiveth the whole world* (Revelation 12:9). Yet Elohim is light, with no part in the dark: *that Elohim (God) is light, and in him is no darkness at all.* (1 John 1:5) — the blame rests on the deceiver and the deceived, never on the Holy One.',
       sv.verse_id, ev.verse_id, 'extras', 64312
  FROM _session253_1ae13_lookup sv, _session253_1ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-13-satan-fallen-from-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The prophet''s son-of-the-morning is the very bright one whom Elohim says He deprived of his bright nature so that he became dark.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-satan-fallen-from-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The Messiah witnesses the same fall from the heaven onto the earth that Elohim recounts to Adam in the cave.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-satan-fallen-from-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The casting down to earth that Adam hears on his first dark night is shown again at the last as the dragon hurled down.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-satan-fallen-from-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The darkness that overtook the transgressing angel is the chains of darkness in which the apostle says such angels are reserved.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-satan-fallen-from-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-13-coats-of-skin-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The skin Elohim says He spread over Adam''s body of flesh is the very coat of skins with which He clothed the pair in the garden''s aftermath.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-coats-of-skin-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The body of flesh Elohim made for Adam is the dust-formed frame He first quickened with His own breath.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-coats-of-skin-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Elohim''s restraint of the destroying wrath leaves Adam only the mortal sentence of return-to-dust, not annihilation into darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-coats-of-skin-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-13-night-not-punishment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* The bounded twelve hours of night that Elohim explains to Adam is the very dividing of light from darkness set down at the first day.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-night-not-punishment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* The promise that the night cannot last and daylight will return is the Logos''s own nature, the Light the darkness cannot overcome.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-night-not-punishment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:12 — *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* The One who tells Adam the daylight will soon appear is the Light of the world who keeps His own out of the darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-night-not-punishment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-13-children-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:4 — *In him was life; and the life was the light of men.* The children of light Elohim willed to bring forth from Adam draw that light from the Logos in whom the life of men is light.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-children-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:5 — *Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness.* The very children of light Elohim purposed from Adam are named in the seed kept to the day, not the night.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-children-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:8 — *For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light.* Those Elohim made to do their work in the day''s light are called to walk as the children of light He willed from the first.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-children-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-13-commandment-and-the-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The Satan who deceived Adam through the tree is the serpent set at enmity with the seed of the woman — the seed-war from the first day outside the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-commandment-and-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The deceiver who deceived himself and Adam is the same transforming one the apostle warns of, the fallen light counterfeiting the true.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-commandment-and-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* Elohim''s word that the blame rests on His creatures alone rests on this: He is light, with no darkness in Him to charge.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae13_lookup sv, _session253_1ae13_lookup tv
 WHERE t.slug='1-adam-eve-13-commandment-and-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

