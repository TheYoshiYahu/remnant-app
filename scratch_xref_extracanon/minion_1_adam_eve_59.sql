-- ----- fragment: minion_1adameve_59.sql (session253 1-adam-eve 59) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch59. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae59 (view _session253_1ae59_lookup). Sort band base 65450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae59_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-59-satan-smites-the-praying
  ('adam-eve-conflict', '1-adam-eve', 59, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s beating of Adam and Eve in 1-adam-eve 59:3 is the serpent striking at the woman''s seed under the enmity Yahuah decreed.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 3, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The hosts that came into the cave to leave Adam and Eve for dead in 1-adam-eve 59:3 are this same devouring adversary at his ancient work.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 3, 'canon', 'job', 2, 7, 'free', E'Job 2:7 — *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* As Satan smote righteous Job in his flesh, so he beats the praying Adam and Eve in 1-adam-eve 59:3 — the adversary permitted to afflict the body, never the covenant.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The ''hater of all good'' who calls his hosts in 1-adam-eve 59:1 is this same old serpent who deceiveth the whole world.'),
  -- thread: 1-adam-eve-59-the-word-raises-them
  ('adam-eve-conflict', '1-adam-eve', 59, 4, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''Word of Elohim'' who comes and raises Adam in 1-adam-eve 59:4 is this same eternal Word, the Logos who is Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comforts Adam in the cave in 1-adam-eve 59:4 is the One who would Himself be made flesh to save the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 4, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to father Adam in 1-adam-eve 59:4 is the first of those many manners in which Elohim spoke to the fathers.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 4, 'canon', 'luke', 22, 43, 'free', E'Luke 22:43 — *And there appeared an angel unto him from heaven, strengthening him.* As Adam is raised and told ''Be strong'' after Satan''s assault in 1-adam-eve 59:4, so the Messiah was strengthened from heaven in His own agony.'),
  -- thread: 1-adam-eve-59-the-empty-promise-of-divinity
  ('adam-eve-conflict', '1-adam-eve', 59, 6, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The ''divinity'' Satan said he would give, named in 1-adam-eve 59:6, is the very ''ye shall be as gods'' lie by which he first deceived them.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 6, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The undelivered ''gift he promised'' in 1-adam-eve 59:6 proves him the liar he was from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 7, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Yahuah''s charge in 1-adam-eve 59:7 that Adam yielded to Satan''s counsel exposes the works of the devil the Son would come to destroy.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 6, 'enoch', '1-enoch', 69, 6, 'extras', E'1 Enoch 69:6 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* The deceiver whose hollow promise is unmasked in 1-adam-eve 59:6 is the same liar whose deceit leads the whole earth astray into corruption.'),
  -- thread: 1-adam-eve-59-deliver-me-out-of-his-hands
  ('adam-eve-conflict', '1-adam-eve', 59, 8, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam''s cry to be delivered out of Satan''s hands in 1-adam-eve 59:8 looks ahead to the Elohim of peace crushing that same adversary under the seed''s feet.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 8, 'canon', 'genesis', 3, 9, 'free', E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* The Yahuah whom Adam cries to for deliverance in 1-adam-eve 59:8 is the same who first sought fallen Adam in mercy rather than wrath.'),
  ('adam-eve-conflict', '1-adam-eve', 59, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Yahuah''s patience that keeps Adam and Eve alive through the forty days in 1-adam-eve 59:10 is the mercy preserving the very seed that will bruise the serpent''s head.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae59_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae59_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-59-satan-smites-the-praying',
       E'Satan smites the praying — the adversary as a roaring lion',
       E'Satan musters his hosts against the seed and falls upon the worshippers: *Then Satan, great in wickedness, took his hosts and came into the cave, in the thirtieth night of the forty days and one; and he beat Adam and Eve, until he left them dead.* (1 Adam and Eve 59:3) This is the seed-war from the first days outside the garden — the enmity Yahuah set between the serpent and the woman: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The adversary still prowls for the worshipper: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8) — and as he once smote righteous Job, *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* (Job 2:7) It ain''t new; the same dragon, *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), strikes at the seed of the woman.',
       sv.verse_id, ev.verse_id, 'extras', 65450
  FROM _session253_1ae59_lookup sv, _session253_1ae59_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=59 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-59-the-word-raises-them',
       E'The Word of Elohim raises them — the Logos who comforts',
       E'When the adversary leaves them for dead, it is the Logos Himself who lifts them: *Then came the Word of Elohim (God) to Adam and Eve, who raised them from their suffering, and Elohim (God) said to Adam, "Be strong, and be not afraid of him who has just come to you."* (1 Adam and Eve 59:4) This is the Word who was from the beginning: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *All things were made by him; and without him was not any thing made that was made.* (John 1:3) — the same Word who would be *made flesh, and dwelt among us* (John 1:14). He is the One *who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1), come to comfort the first father in the cave. And as the Word strengthened Adam in his agony, so an angel came to strengthen the Son in His: *And there appeared an angel unto him from heaven, strengthening him.* (Luke 22:43)',
       sv.verse_id, ev.verse_id, 'extras', 65453
  FROM _session253_1ae59_lookup sv, _session253_1ae59_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=59 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-59-the-empty-promise-of-divinity',
       E'Where is the gift he promised? — the deceiver''s empty word',
       E'Yahuah exposes the serpent''s lie by its emptiness: *Then Elohim (God) said to him, "O Adam, see, he is lord and master of all you have, he who said, he would give you divinity. Where is this love for you? And where is the gift he promised?* (1 Adam and Eve 59:6) The promise of divinity is the very lie of the garden: *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* (Genesis 3:5) — first whispered through the serpent''s *Ye shall not surely die:* (Genesis 3:4). He is a liar from the start: *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44) — for *he that committeth sin is of the devil; for the devil sinneth from the beginning* (1 John 3:8). The same godlessness still spreads from his deceit: *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* (1 Enoch 69:6) It ain''t new — the gift the deceiver promised is never delivered.',
       sv.verse_id, ev.verse_id, 'extras', 65456
  FROM _session253_1ae59_lookup sv, _session253_1ae59_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=59 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-59-deliver-me-out-of-his-hands',
       E'Deliver me out of his hands — mercy keeps the seed',
       E'Adam pleads, and Yahuah''s patient mercy keeps him through the forty days: *Then Adam cried before Yahuah (Lord), and said, "O Yahuah (Lord) because I transgressed a little, You have severely punished me in return for it, I ask You to deliver me out of his hands..."* (1 Adam and Eve 59:8) Yahuah does not abandon the seed: *But Elohim (God) had patience with Adam, and let him and Eve remain in the cave until they had fulfilled the forty days.* (1 Adam and Eve 59:10) This is the mercy that undergirds the seed-promise, for the Elohim of peace will crush the very adversary who beat them: *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20) It is Yahuah who first sought fallen Adam in mercy: *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* (Genesis 3:9) — keeping the covenant line down toward Noah and the promised Saviour.',
       sv.verse_id, ev.verse_id, 'extras', 65459
  FROM _session253_1ae59_lookup sv, _session253_1ae59_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=59 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-59-satan-smites-the-praying
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s beating of Adam and Eve in 1-adam-eve 59:3 is the serpent striking at the woman''s seed under the enmity Yahuah decreed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-satan-smites-the-praying'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The hosts that came into the cave to leave Adam and Eve for dead in 1-adam-eve 59:3 are this same devouring adversary at his ancient work.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-satan-smites-the-praying'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 2:7 — *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* As Satan smote righteous Job in his flesh, so he beats the praying Adam and Eve in 1-adam-eve 59:3 — the adversary permitted to afflict the body, never the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-satan-smites-the-praying'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The ''hater of all good'' who calls his hosts in 1-adam-eve 59:1 is this same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-satan-smites-the-praying'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-59-the-word-raises-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''Word of Elohim'' who comes and raises Adam in 1-adam-eve 59:4 is this same eternal Word, the Logos who is Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comforts Adam in the cave in 1-adam-eve 59:4 is the One who would Himself be made flesh to save the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to father Adam in 1-adam-eve 59:4 is the first of those many manners in which Elohim spoke to the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 22:43 — *And there appeared an angel unto him from heaven, strengthening him.* As Adam is raised and told ''Be strong'' after Satan''s assault in 1-adam-eve 59:4, so the Messiah was strengthened from heaven in His own agony.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-59-the-empty-promise-of-divinity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The ''divinity'' Satan said he would give, named in 1-adam-eve 59:6, is the very ''ye shall be as gods'' lie by which he first deceived them.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-empty-promise-of-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The undelivered ''gift he promised'' in 1-adam-eve 59:6 proves him the liar he was from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-empty-promise-of-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Yahuah''s charge in 1-adam-eve 59:7 that Adam yielded to Satan''s counsel exposes the works of the devil the Son would come to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-empty-promise-of-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 69:6 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* The deceiver whose hollow promise is unmasked in 1-adam-eve 59:6 is the same liar whose deceit leads the whole earth astray into corruption.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-the-empty-promise-of-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=69 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-59-deliver-me-out-of-his-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam''s cry to be delivered out of Satan''s hands in 1-adam-eve 59:8 looks ahead to the Elohim of peace crushing that same adversary under the seed''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-deliver-me-out-of-his-hands'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* The Yahuah whom Adam cries to for deliverance in 1-adam-eve 59:8 is the same who first sought fallen Adam in mercy rather than wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-deliver-me-out-of-his-hands'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Yahuah''s patience that keeps Adam and Eve alive through the forty days in 1-adam-eve 59:10 is the mercy preserving the very seed that will bruise the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae59_lookup sv, _session253_1ae59_lookup tv
 WHERE t.slug='1-adam-eve-59-deliver-me-out-of-his-hands'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=59 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

