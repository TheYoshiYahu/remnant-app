-- =====================================================================
-- Session 253 — 2 Adam and Eve FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_2_adam_eve_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 2 Adam and Eve cross-references starting...'
BEGIN;

-- ----- fragment: minion_2adameve_01.sql (session253 2-adam-eve 1) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae1 (view _session253_2ae1_lookup). Sort band base 66000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-1-righteous-abel-blood
  ('adam-eve-conflict', '2-adam-eve', 1, 3, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is the deed that has left Abel lying killed on the earth in 2 Adam and Eve 1:3.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 3, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The body Adam and Eve weep over in 2 Adam and Eve 1:3 is the blood whose cry has already reached heaven.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 3, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Yahusha dates the whole shedding of righteous blood from the just one mourned here in 2 Adam and Eve 1:3.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 3, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The purity that breathes sweet spices from Abel''s body in 2 Adam and Eve 1:3 is the witness that he was righteous.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 3, 'jasher', 'jasher', 1, 25, 'extras', E'Jasher 1:25 — *And Cain hastened and rose up, and took the iron part of his ploughing instrument, with which he suddenly smote his brother and he slew him, and Cain spilt the blood of his brother Abel upon the earth, and the blood of Abel streamed upon the earth before the flock.* Jasher streams the same blood upon the earth that the family finds in 2 Adam and Eve 1:3.'),
  -- thread: 2-adam-eve-1-cave-spices-myrrh
  ('adam-eve-conflict', '2-adam-eve', 1, 4, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh of the Cave of Treasures where Adam buries Abel in 2 Adam and Eve 1:4 are the very gifts opened before the Messiah.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 4, 'canon', 'john', 19, 39, 'free', E'John 19:39 — *And there came also Nicodemus, which at the first came to Yahusha (Jesus) by night, and brought a mixture of myrrh and aloes, about an hundred pound weight.* The myrrh Adam winds about righteous Abel in 2 Adam and Eve 1:4 is brought again for the burial of the righteous One.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 4, 'canon', 'john', 19, 40, 'free', E'John 19:40 — *Then took they the body of Yahusha (Jesus), and wound it in linen clothes with the spices, as the manner of the Yahudim (Jews) is to bury.* The Saviour''s body is wound in spices exactly as Adam wound up Abel with sweet spices and myrrh in 2 Adam and Eve 1:4.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 4, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The blood Adam buries in myrrh in 2 Adam and Eve 1:4 still speaks, but the better blood it points to is the Mediator''s own.'),
  -- thread: 2-adam-eve-1-cain-down-mountain-two-lines
  ('adam-eve-conflict', '2-adam-eve', 1, 7, 'canon', 'genesis', 4, 16, 'free', E'Genesis 4:16 — *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* Cain''s descent to the bottom of the mountain away from the garden in 2 Adam and Eve 1:7 is his going out from the presence of Yahuah.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 8, 'canon', 'genesis', 4, 17, 'free', E'Genesis 4:17 — *And Cain knew his wife; and she conceived, and bare Enoch: and he builded a city, and called the name of the city, after the name of his son, Enoch.* The children who multiply and fill Cain''s place in 2 Adam and Eve 1:8 are the line that builds the first city of the wicked seed.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 6, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The Cain who marries and departs without leave in 2 Adam and Eve 1:6 is named here as of the wicked one — the serpent''s seed of Genesis 3:15.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 7, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The downward way Cain takes off the mountain in 2 Adam and Eve 1:7 becomes the very name of apostasy, ''the way of Cain.'''),
  ('adam-eve-conflict', '2-adam-eve', 1, 8, 'jubilees', 'jubilees', 4, 9, 'extras', E'Jubilees 4:9 — *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city, and called its name after the name of his son Enoch.* Jubilees records the same sister-marriage and multiplying line that fills Cain''s place in 2 Adam and Eve 1:8.'),
  -- thread: 2-adam-eve-1-offering-for-new-seed
  ('adam-eve-conflict', '2-adam-eve', 1, 9, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The fair child Adam asks Yahuah to give in 2 Adam and Eve 1:9 is Seth, the appointed second seed.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The calling upon the Name begun in Seth''s line is the very entreaty Adam makes at the altar in 2 Adam and Eve 1:10.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The seed Adam prays for in 2 Adam and Eve 1:9 is the woman''s seed of the first promise, kept alive after Cain''s blow.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 11, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The offering Elohim accepts in 2 Adam and Eve 1:11 keeps the seed-line whose end is Satan bruised underfoot.'),
  ('adam-eve-conflict', '2-adam-eve', 1, 9, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees gives the same comfort-after-mourning that Adam prays toward in 2 Adam and Eve 1:9.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-1-righteous-abel-blood',
       E'Righteous Abel — the first blood that cries',
       E'The very first scene outside Eden is a grave. *And they found him lying on the earth, killed, and beasts around him; while they wept and cried because of this just one. From his body, by reason of its purity, went forth a smell of sweet spices* (2 Adam and Eve 1:3). The seed-war of Genesis 3:15 has drawn its first blood, and it is the blood of the just. Genesis records the deed and the cry it raised: *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him* (Genesis 4:8), and then *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The Messiah Himself dates all righteous blood from this morning — *from the blood of righteous Abel* (Matthew 23:35) — and the apostle names Abel''s offering the first witness of faith: *by it he being dead yet speaketh* (Hebrews 11:4). Jasher tells the same field and the same streaming blood: *and Cain spilt the blood of his brother Abel upon the earth, and the blood of Abel streamed upon the earth before the flock* (Jasher 1:25). It ain''t new — the killing of the righteous seed is as old as the first family outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 66000
  FROM _session253_2ae1_lookup sv, _session253_2ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-1-cave-spices-myrrh',
       E'Wound up with spices and myrrh — the Cave of Treasures',
       E'Adam carries his son to burial: *And Adam carried him, his tears streaming down his face; and went to the Cave of Treasures, where he laid him, and wound him up with sweet spices and myrrh* (2 Adam and Eve 1:4). The first burial of the righteous is a burial in spices and myrrh, kept in the Cave of Treasures where Adam laid up gold and incense and myrrh against the coming of the Saviour. When that Saviour came, the magi opened the same three treasures: *and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). And when He was laid in His own tomb, He too was wound in myrrh and spices: *Then took they the body of Yahusha (Jesus), and wound it in linen clothes with the spices, as the manner of the Yahudim (Jews) is to bury* (John 19:40), Nicodemus having *brought a mixture of myrrh and aloes, about an hundred pound weight* (John 19:39). The blood of righteous Abel, wound in myrrh by his father, *speaketh better things than that of Abel* only in the blood of the One whose own body would be wound the same way (Hebrews 12:24). It ain''t new — the spices of the just man''s grave reach from the first morning to the empty tomb.',
       sv.verse_id, ev.verse_id, 'extras', 66003
  FROM _session253_2ae1_lookup sv, _session253_2ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-1-cain-down-mountain-two-lines',
       E'Cain goes down the mountain — the two seed-lines part',
       E'The covenant line and the line of the wicked one now divide along the mountain. Cain takes his sister without leave and departs the holy place: *He then went down to the bottom of the mountain, away from the garden, near to the place where he had killed his brother... His sister bare him children, who in their turn began to multiply by degrees until they filled that place* (2 Adam and Eve 1:7-8). Genesis sends Cain out the same direction to build the same city: *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden* (Genesis 4:16), and *he builded a city* (Genesis 4:17). John names the paternity of that line — election precedes confession — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12); and Jude warns of those who *have gone in the way of Cain* (Jude 1:11). Jubilees keeps the same record of the line below: *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city* (Jubilees 4:9). This is not race but the paternal-seed parting of Genesis 3:15 — the seed of the serpent below, the seed of the woman to be kept above.',
       sv.verse_id, ev.verse_id, 'extras', 66006
  FROM _session253_2ae1_lookup sv, _session253_2ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-1-offering-for-new-seed',
       E'An offering for a new seed — toward Seth and the kept promise',
       E'Out of the grief, Adam turns to the altar and asks Yahuah for another child: *Come, let us take an offering and offer it up unto Elohim (God), and ask Him to give us a fair child, in whom we may find comfort, and whom we may join in marriage to Abel''s sister* (2 Adam and Eve 1:9), and *Elohim (God) heard Adam and accepted his offering* (2 Adam and Eve 1:11). This is the mercy that keeps the seed of the woman alive after the serpent has struck. Genesis names the answer to that very prayer: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25), and then *began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — the very calling on the Name that Adam does at this altar. The promise being guarded is Genesis 3:15: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) — and the apostle declares its end, *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). Jubilees keeps the same comfort after the same mourning: *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said ''Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him''* (Jubilees 4:7).',
       sv.verse_id, ev.verse_id, 'extras', 66009
  FROM _session253_2ae1_lookup sv, _session253_2ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-1-righteous-abel-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is the deed that has left Abel lying killed on the earth in 2 Adam and Eve 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-righteous-abel-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The body Adam and Eve weep over in 2 Adam and Eve 1:3 is the blood whose cry has already reached heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-righteous-abel-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Yahusha dates the whole shedding of righteous blood from the just one mourned here in 2 Adam and Eve 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-righteous-abel-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The purity that breathes sweet spices from Abel''s body in 2 Adam and Eve 1:3 is the witness that he was righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-righteous-abel-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 1:25 — *And Cain hastened and rose up, and took the iron part of his ploughing instrument, with which he suddenly smote his brother and he slew him, and Cain spilt the blood of his brother Abel upon the earth, and the blood of Abel streamed upon the earth before the flock.* Jasher streams the same blood upon the earth that the family finds in 2 Adam and Eve 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-righteous-abel-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-1-cave-spices-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh of the Cave of Treasures where Adam buries Abel in 2 Adam and Eve 1:4 are the very gifts opened before the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cave-spices-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 19:39 — *And there came also Nicodemus, which at the first came to Yahusha (Jesus) by night, and brought a mixture of myrrh and aloes, about an hundred pound weight.* The myrrh Adam winds about righteous Abel in 2 Adam and Eve 1:4 is brought again for the burial of the righteous One.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cave-spices-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 19:40 — *Then took they the body of Yahusha (Jesus), and wound it in linen clothes with the spices, as the manner of the Yahudim (Jews) is to bury.* The Saviour''s body is wound in spices exactly as Adam wound up Abel with sweet spices and myrrh in 2 Adam and Eve 1:4.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cave-spices-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The blood Adam buries in myrrh in 2 Adam and Eve 1:4 still speaks, but the better blood it points to is the Mediator''s own.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cave-spices-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-1-cain-down-mountain-two-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:16 — *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* Cain''s descent to the bottom of the mountain away from the garden in 2 Adam and Eve 1:7 is his going out from the presence of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cain-down-mountain-two-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:17 — *And Cain knew his wife; and she conceived, and bare Enoch: and he builded a city, and called the name of the city, after the name of his son, Enoch.* The children who multiply and fill Cain''s place in 2 Adam and Eve 1:8 are the line that builds the first city of the wicked seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cain-down-mountain-two-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The Cain who marries and departs without leave in 2 Adam and Eve 1:6 is named here as of the wicked one — the serpent''s seed of Genesis 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cain-down-mountain-two-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The downward way Cain takes off the mountain in 2 Adam and Eve 1:7 becomes the very name of apostasy, ''the way of Cain.'''
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cain-down-mountain-two-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:9 — *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city, and called its name after the name of his son Enoch.* Jubilees records the same sister-marriage and multiplying line that fills Cain''s place in 2 Adam and Eve 1:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-cain-down-mountain-two-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-1-offering-for-new-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The fair child Adam asks Yahuah to give in 2 Adam and Eve 1:9 is Seth, the appointed second seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-offering-for-new-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The calling upon the Name begun in Seth''s line is the very entreaty Adam makes at the altar in 2 Adam and Eve 1:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-offering-for-new-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The seed Adam prays for in 2 Adam and Eve 1:9 is the woman''s seed of the first promise, kept alive after Cain''s blow.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-offering-for-new-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The offering Elohim accepts in 2 Adam and Eve 1:11 keeps the seed-line whose end is Satan bruised underfoot.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-offering-for-new-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees gives the same comfort-after-mourning that Adam prays toward in 2 Adam and Eve 1:9.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae1_lookup sv, _session253_2ae1_lookup tv
 WHERE t.slug='2-adam-eve-1-offering-for-new-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_02.sql (session253 2-adam-eve 2) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae2 (view _session253_2ae2_lookup). Sort band base 66025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-2-another-seed-seth
  ('adam-eve-conflict', '2-adam-eve', 2, 3, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The Conflict''s naming of Seth in comfort for Abel is the same scene Moses records, the appointed seed kept after the murder.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 1, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* The beautiful son who is "like that of his father Adam" in 2:1 is the Seth begotten in Adam''s own likeness who heads the book of the generations.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 3, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees carries the identical word over Seth''s name — the raised-up second seed — confirming the Conflict''s account.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 3, 'canon', 'luke', 3, 38, 'free', E'Luke 3:38 — *Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* The child Adam names in his affliction stands at the head of the genealogy that runs down to the Messiah, the kept seed of the woman.'),
  -- thread: 2-adam-eve-2-offering-accepted-seth
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The offering Elohim accepts and blesses over Seth is the same respected sacrifice of the holy line, the altar kept before the Law.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The accepted offering for the babe Seth is the faith-offering Hebrews names, Elohim testifying over the righteous seed.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The Elohim who accepts the offering over Seth is the same who weighed Abel''s and Cain''s, the holy line distinguished by the accepted sacrifice.'),
  -- thread: 2-adam-eve-2-seth-line-against-cain
  ('adam-eve-conflict', '2-adam-eve', 2, 8, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The Conflict names Cain among the five but keeps Seth holy alone — the two seed-lines John divides, Cain of the wicked one against the righteous seed.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 9, 'canon', '1-john', 3, 10, 'free', E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Seth waxing in strength to fast and pray is the child of Elohim made manifest, the holy seed distinguished from the line of Cain.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The two lines that remain of Adam''s children are the very enmity of seed against seed, the serpent''s offspring against the woman''s kept seed.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Seth fasting and praying fervently is the kept seed pressing toward the promised bruising of Satan''s head, the seed-war begun in Genesis 3:15 finished in the Messiah.'),
  -- thread: 2-adam-eve-2-calling-on-the-name
  ('adam-eve-conflict', '2-adam-eve', 2, 6, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The washing for purification and the offering in the line of Seth open the way that becomes the calling on the Name of Yahuah in Seth''s own house.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'jubilees', 'jubilees', 4, 12, 'extras', E'Jubilees 4:12 — *He began to call on the name of Yahuah (God) on the earth. And in the seventh jubilee in the third week Enos took Nôâm his sister to be his wife, and she bare him a son in the third year of the fifth week, and he called his name Kenan.* Jubilees keeps the same memory — the calling on the Name begun in Seth''s line — the worship the Conflict shows in Adam''s accepted offering for Seth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-another-seed-seth',
       E'Seth — another seed appointed instead of Abel',
       E'Eve brings forth a son after the murder of Abel, and Adam names him with thanksgiving: *Then he named the child Seth, that means, "that Elohim (God) has heard my prayer, and has delivered me out of my affliction." But it means also "power and strength."* (2 Adam and Eve 2:3). This is the very naming Moses records — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* (Genesis 4:25) — and the head of the holy generations: *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3). Jubilees keeps the same word: *and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* (Jubilees 4:7). It ain''t new — the seed of the woman is kept alive against the serpent, and the line runs unbroken to the very Son of Elohim: *which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* (Luke 3:38).',
       sv.verse_id, ev.verse_id, 'extras', 66025
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-offering-accepted-seth',
       E'The offering accepted and the blessing on Seth',
       E'Adam and Eve come to the river to wash, then bring an offering for the babe: *Then they returned, and took an offering, and went to the mountain and offered it up, for the babe; and Elohim (God) accepted their offering, and sent His blessing upon them, and upon their son Seth* (2 Adam and Eve 2:6-7). This is the way of the altar kept before Sinai — the offering Yahuah RESPECTS, as He had respected Abel: *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* (Genesis 4:4). Hebrews names it faith: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* (Hebrews 11:4). The acceptance over Seth is the same Yahuah who weighs the two offerings in Jubilees: *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* (Jubilees 4:2). Mercy, not law-as-curse — the covenant kept from the first day outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 66028
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-seth-line-against-cain',
       E'The holy line of Seth against the line of the wicked one',
       E'Of all Adam''s children only one holy son remains to carry the promise: *but only those five, Cain, Luluwa, Abel, Aklia, and Seth alone. But Seth waxed in stature and in strength; and began to fast and pray, fervently.* (2 Adam and Eve 2:8-9). The book sets two seed-lines side by side from the start — the murderer and the kept seed — exactly as John divides them: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12). The whole household of Elohim is manifest against the children of the devil: *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* (1 John 3:10). This is the seed-war of Genesis 3:15 worked out in two families — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). Seth fasting and praying is the seed of the woman holding the line; the bruising of the serpent''s head is promised to be finished — *And the Elohim (God) of peace shall bruise Satan under your feet shortly.* (Romans 16:20). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 66031
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-calling-on-the-name',
       E'Purification and calling on the Name before Sinai',
       E'Eve and the babe wash for purification while Adam and his daughter wash for their sorrow, and the household returns to offer and to be blessed: *but Eve and the babe washed for purification.* (2 Adam and Eve 2:6) ... *and Elohim (God) accepted their offering, and sent His blessing upon them* (2 Adam and Eve 2:7). The way of cleansing and the calling on the Name is kept from the line of Seth onward — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). Jubilees binds the same: *He began to call on the name of Yahuah (God) on the earth.* (Jubilees 4:12). This is Torah-as-the-way kept before Sinai, the offerings and the Name called upon — never law-as-curse, but the covenant mercy of Yahuah keeping His people from the first generations.',
       sv.verse_id, ev.verse_id, 'extras', 66034
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-2-another-seed-seth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The Conflict''s naming of Seth in comfort for Abel is the same scene Moses records, the appointed seed kept after the murder.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* The beautiful son who is "like that of his father Adam" in 2:1 is the Seth begotten in Adam''s own likeness who heads the book of the generations.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees carries the identical word over Seth''s name — the raised-up second seed — confirming the Conflict''s account.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 3:38 — *Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* The child Adam names in his affliction stands at the head of the genealogy that runs down to the Messiah, the kept seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-2-offering-accepted-seth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The offering Elohim accepts and blesses over Seth is the same respected sacrifice of the holy line, the altar kept before the Law.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-offering-accepted-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The accepted offering for the babe Seth is the faith-offering Hebrews names, Elohim testifying over the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-offering-accepted-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The Elohim who accepts the offering over Seth is the same who weighed Abel''s and Cain''s, the holy line distinguished by the accepted sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-offering-accepted-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-2-seth-line-against-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The Conflict names Cain among the five but keeps Seth holy alone — the two seed-lines John divides, Cain of the wicked one against the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Seth waxing in strength to fast and pray is the child of Elohim made manifest, the holy seed distinguished from the line of Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The two lines that remain of Adam''s children are the very enmity of seed against seed, the serpent''s offspring against the woman''s kept seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Seth fasting and praying fervently is the kept seed pressing toward the promised bruising of Satan''s head, the seed-war begun in Genesis 3:15 finished in the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-2-calling-on-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The washing for purification and the offering in the line of Seth open the way that becomes the calling on the Name of Yahuah in Seth''s own house.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-calling-on-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:12 — *He began to call on the name of Yahuah (God) on the earth. And in the seventh jubilee in the third week Enos took Nôâm his sister to be his wife, and she bare him a son in the third year of the fifth week, and he called his name Kenan.* Jubilees keeps the same memory — the calling on the Name begun in Seth''s line — the worship the Conflict shows in Adam''s accepted offering for Seth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-calling-on-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_03.sql (session253 2-adam-eve 3) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae3 (view _session253_2ae3_lookup). Sort band base 66050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-3-satan-envies-the-seed
  ('adam-eve-conflict', '2-adam-eve', 3, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s envy of Adam and his strife against the marriage is the enmity at the seed sworn at the garden gate, set loose here in the seventh year outside Eden.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 1, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The envying adversary of 2 Adam & Eve 3:1 meets the verdict already sworn against him: the bruising of his head.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 8, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murder of righteous Abel that Satan feigns to mourn in 2 Adam & Eve 3:8 was his own work, for he was a murderer from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 1, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The seed-war Satan opens against Adam in 2 Adam & Eve 3:1 is the very work the manifested Son comes to destroy.'),
  -- thread: 2-adam-eve-3-satan-as-the-beautiful-woman
  ('adam-eve-conflict', '2-adam-eve', 3, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan''s appearing to Adam in the form of a beautiful woman in 2 Adam & Eve 3:4 is the very transforming Paul names — the deceiver in a borrowed, comely shape.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 11, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The false wedding-promise pressed on Adam in 2 Adam & Eve 3:11 is the same subtilty that beguiled Eve, now turned on her husband.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The shape-shifting tempter of 2 Adam & Eve 3:4 is that old serpent whose trade is deceiving the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 12, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The flattering counsel to spend the days of youth in mirth and pleasure in 2 Adam & Eve 3:12 is the adversary stalking to devour his prey.'),
  -- thread: 2-adam-eve-3-the-word-comes-and-unmasks
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Adam in 2 Adam & Eve 3:15 is the eternal Logos, with Elohim and Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to comfort Adam in 2 Adam & Eve 3:15 is the same who would be made flesh and dwell among men.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word sent to Adam in 2 Adam & Eve 3:15 is Yahuah speaking to the first father, the earliest of the sundry manners He spoke of old.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The Word names the woman-figure as the one that promised Adam the Godhead in 2 Adam & Eve 3:15 — the serpent''s identical first lie, that man should be as gods.'),
  -- thread: 2-adam-eve-3-many-forms-and-mercy
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent-form among the deceiver''s many guises in 2 Adam & Eve 3:15 is the very beast that beguiled Eve in the garden.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'enoch', '1-enoch', 19, 1, 'extras', E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The many forms Satan takes to destroy Adam''s soul in 2 Adam & Eve 3:15 are the same shape-shifting by which the fallen spirits defile mankind and are worshipped as gods.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 16, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* Yahuah''s delivering Adam many a time from the deceiver''s hands in 2 Adam & Eve 3:16 is the same encamping mercy that guards all who fear Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-satan-envies-the-seed',
       E'Satan envies the man and strives at the seed',
       E'*As for our father Adam, at the end of seven years from the day he had been severed from his wife Eve, Satan envied him, when he saw him thus separated from her; and strove to make him live with her again* (2 Adam & Eve 3:1) — and the grief of the murdered Abel and the rejoicing over the born Seth (3:8-9) name the war out loud. It ain''t new: this is the enmity Yahuah set in the dust at the gate of the garden, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Every assault on Adam''s marriage and seed is the serpent striking at the seed of the woman, and the verdict is already written: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). For this the Son was manifested — *that he might destroy the works of the devil* (1 John 3:8). And the first murder, Abel, is the first casualty of the seed-war the apostle remembers — *He was a murderer from the beginning* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 66050
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-satan-as-the-beautiful-woman',
       E'Satan transformed as a beautiful woman with a false promise',
       E'On the night of the fortieth day *Satan, the hater of all good, when he saw Adam thus alone, fasting and praying, appeared unto him in the form of a beautiful woman* (2 Adam & Eve 3:4), claiming *Elohim''s (God''s) promise to me is fulfilled; for it is He who has sent me to thee for the wedding* (3:11) — a false word of God in a borrowed shape. It ain''t new: the same beguiler who deceived Eve transforms to deceive again, *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14), the very pattern Paul fears, *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah* (2 Corinthians 11:3). He is *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), prowling *as a roaring lion* who *walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 66053
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-the-word-comes-and-unmasks',
       E'The Word of Elohim comes and unmasks the deceiver',
       E'Adam *prayed to Elohim (God) with a fervent heart to deliver him from her* (2 Adam & Eve 3:14), and *Then Elohim (God) sent His Word unto Adam* (3:15) — the Word who exposes that the figure is the one that promised him the Godhead and majesty, at one time in the form of a woman, another moment in the likeness of an angel, doing all only to destroy his soul. It ain''t new: this is the Logos, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), *And the Word was made flesh, and dwelt among us* (John 1:14), the same who in old time *spake in time past unto the fathers by the prophets* (Hebrews 1:1). The promise of the Godhead the Word unmasks is the serpent''s first lie verbatim — *ye shall be as gods, knowing good and evil* (Genesis 3:5).',
       sv.verse_id, ev.verse_id, 'extras', 66056
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-many-forms-and-mercy',
       E'The many forms of the deceiver and the mercy that delivers',
       E'The Word tells Adam the figure shows himself at one time in the form of a woman, another moment in the likeness of an angel, on another occasion in the similitude of a serpent, and at another in the semblance of a god, doing all only to destroy his soul (2 Adam & Eve 3:15) — yet *I have delivered thee many a time from his hands; in order to show thee that I am a merciful Elohim (God)* (3:16). It ain''t new: the deceiver''s serpent-form is the garden serpent, *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* (Genesis 3:1). The watchers of old likewise *assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods* (1 Enoch 19:1). But against him Yahuah''s mercy keeps the seed, for *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7).',
       sv.verse_id, ev.verse_id, 'extras', 66059
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-3-satan-envies-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s envy of Adam and his strife against the marriage is the enmity at the seed sworn at the garden gate, set loose here in the seventh year outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The envying adversary of 2 Adam & Eve 3:1 meets the verdict already sworn against him: the bruising of his head.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murder of righteous Abel that Satan feigns to mourn in 2 Adam & Eve 3:8 was his own work, for he was a murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The seed-war Satan opens against Adam in 2 Adam & Eve 3:1 is the very work the manifested Son comes to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-3-satan-as-the-beautiful-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan''s appearing to Adam in the form of a beautiful woman in 2 Adam & Eve 3:4 is the very transforming Paul names — the deceiver in a borrowed, comely shape.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The false wedding-promise pressed on Adam in 2 Adam & Eve 3:11 is the same subtilty that beguiled Eve, now turned on her husband.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The shape-shifting tempter of 2 Adam & Eve 3:4 is that old serpent whose trade is deceiving the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The flattering counsel to spend the days of youth in mirth and pleasure in 2 Adam & Eve 3:12 is the adversary stalking to devour his prey.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-3-the-word-comes-and-unmasks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Adam in 2 Adam & Eve 3:15 is the eternal Logos, with Elohim and Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to comfort Adam in 2 Adam & Eve 3:15 is the same who would be made flesh and dwell among men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word sent to Adam in 2 Adam & Eve 3:15 is Yahuah speaking to the first father, the earliest of the sundry manners He spoke of old.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The Word names the woman-figure as the one that promised Adam the Godhead in 2 Adam & Eve 3:15 — the serpent''s identical first lie, that man should be as gods.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-3-many-forms-and-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent-form among the deceiver''s many guises in 2 Adam & Eve 3:15 is the very beast that beguiled Eve in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-many-forms-and-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The many forms Satan takes to destroy Adam''s soul in 2 Adam & Eve 3:15 are the same shape-shifting by which the fallen spirits defile mankind and are worshipped as gods.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-many-forms-and-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* Yahuah''s delivering Adam many a time from the deceiver''s hands in 2 Adam & Eve 3:16 is the same encamping mercy that guards all who fear Him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-many-forms-and-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_04.sql (session253 2-adam-eve 4) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae4 (view _session253_2ae4_lookup). Sort band base 66075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-4-hideous-form-unmasked
  ('adam-eve-conflict', '2-adam-eve', 4, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hideous form Adam is made to see is the unmasking of the old serpent whose whole trade is deceiving the world.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 1, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Messiah names the same liar-from-the-beginning whom Yahuah here orders to show himself plainly to Adam.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 3, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The one who made Adam fall from brightness into darkness is the very work the Son was manifested to destroy.'),
  -- thread: 2-adam-eve-4-can-elohim-be-black
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The devil who once *said of himself that he is Elohim* is the same transformer Paul warns of; Yahuah unmasks the very disguise.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The subtle claim to be Elohim that Yahuah here exposes is the same beguiling that took Eve in Eden.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', 'genesis', 3, 13, 'free', E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Yahuah''s questions to Adam answer the very lie by which the serpent had beguiled Eve to eat.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The pretender who claims to be Elohim is the fallen son of the morning, cut down and now shown to Adam in his hideous form.'),
  -- thread: 2-adam-eve-4-bound-in-the-air
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The enemy Adam beholds *bound in thy presence, in the air* is the same dragon laid hold of and chained at the end.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The charge *be not afraid of him* rests on the seed-promise that Yahuah will bruise this Satan underfoot.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam''s order to *beware of him, in whatever he may do to thee* is Peter''s same vigilance against the prowling adversary.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'jubilees', 'jubilees', 10, 11, 'extras', E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The devil shown to Adam *bound... unable to flee away* belongs to the same binding the angels carried out in the primeval history.'),
  -- thread: 2-adam-eve-4-word-comforts-cave-of-treasures
  ('adam-eve-conflict', '2-adam-eve', 4, 6, 'canon', 'john', 14, 18, 'free', E'John 14:18 — *I will not leave you comfortless: I will come to you.* The Word who *strengthened* Adam and *comforted* his heart is the same Logos who promises His own He will not leave comfortless.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 6, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* Yahuah''s strengthening of Adam after the assault is the same covenant assurance He gives His people not to fear.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 8, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s worship before Yahuah for his deliverance is the first calling on the Name, kept down the holy line of Seth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-hideous-form-unmasked',
       E'Satan shown in his own hideous form',
       E'Yahuah strips the disguise off the deceiver and makes Adam look him in the face: *THEN Elohim (God) ordered Satan to show himself to Adam plainly, in his own hideous form.* (2 Adam & Eve 4:1), *And Elohim (God) said to Adam, ''Look at this devil, and at his hideous look, and know that he it is who made thee fall from brightness into darkness, from peace and rest to toil and misery.* (2 Adam & Eve 4:3). It ain''t new — this is the old serpent of the garden unmasked. From the first day outside Eden he is named for what he is: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). Messiah declares his nature with the same plainness — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* (John 8:44). And the reason the Son of Elohim came is the destruction of this very enemy: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66075
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-can-elohim-be-black',
       E'The false claim to be Elohim exposed',
       E'Yahuah dismantles the lie by which the serpent first seduced Eve — that he speaks for or as Elohim: *And look, 0 Adam, at him, who said of himself that he is Elohim (God)! Can Elohim (God) be black? Would Elohim (God) take the form of a woman? Is there any one stronger than Elohim (God)? And can He be overpowered?* (2 Adam & Eve 4:4). This is the deceiver''s signature method — transformation, the lie dressed as light: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). It is the same subtlety that took Eve in the garden: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* (2 Corinthians 11:3) — for the woman confessed *The serpent beguiled me, and I did eat* (Genesis 3:13). The lie has a name and a beginning in heaven''s own record: *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12).',
       sv.verse_id, ev.verse_id, 'extras', 66078
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-bound-in-the-air',
       E'Behold him bound — fear him not',
       E'Adam is shown the enemy not loosed but bound and powerless, and is charged to fear him no longer: *"See, then, 0 Adam, and behold him bound in thy presence, in the air, unable to flee away! Therefore, I say unto thee, be not afraid of him; henceforth take care, and beware of him, in whatever he may do to thee."* (2 Adam & Eve 4:5). This is the seed-war''s whole arc previewed on the first day outside Eden — the dragon is destined to be seized and chained: *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* (Revelation 20:2). The crushing was already promised at the gate: *And the Elohim (God) of peace shall bruise Satan under your feet shortly...* (Romans 16:20). Yet Adam is told to *beware of him*, for the bound adversary still prowls: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8). The chains prepared for him are the same the primeval record knows — *all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* (Jubilees 10:11).',
       sv.verse_id, ev.verse_id, 'extras', 66081
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-word-comforts-cave-of-treasures',
       E'The Word strengthens Adam and quells the lust',
       E'Having driven the deceiver off, the Word of Elohim Himself strengthens and comforts Adam, names the Cave of Treasures, and quells the disordered passion stirred by the assault: *Then Elohim (God) drove Satan away from before Adam, whom He strengthened, and whose heart He comforted, saying to him, "Go down to the Cave of Treasures, and separate not thyself from Eve; I will quell in you all animal lust."* (2 Adam & Eve 4:6), *Then Adam worshipped before Yahuah (Lord), for having delivered him, and for having layed his passions.* (2 Adam & Eve 4:8). The comforting voice that comes to the man is the Logos who will not abandon His own — *I will not leave you comfortless: I will come to you.* (John 14:18) — the very promise Yahuah keeps from the first day outside the garden: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee...* (Isaiah 41:10). And Adam''s worship and calling on his Deliverer is the worship the holy seed will carry down the line of Seth: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26).',
       sv.verse_id, ev.verse_id, 'extras', 66084
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-4-hideous-form-unmasked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hideous form Adam is made to see is the unmasking of the old serpent whose whole trade is deceiving the world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-hideous-form-unmasked'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Messiah names the same liar-from-the-beginning whom Yahuah here orders to show himself plainly to Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-hideous-form-unmasked'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The one who made Adam fall from brightness into darkness is the very work the Son was manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-hideous-form-unmasked'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-4-can-elohim-be-black
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The devil who once *said of himself that he is Elohim* is the same transformer Paul warns of; Yahuah unmasks the very disguise.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The subtle claim to be Elohim that Yahuah here exposes is the same beguiling that took Eve in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Yahuah''s questions to Adam answer the very lie by which the serpent had beguiled Eve to eat.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The pretender who claims to be Elohim is the fallen son of the morning, cut down and now shown to Adam in his hideous form.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-4-bound-in-the-air
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The enemy Adam beholds *bound in thy presence, in the air* is the same dragon laid hold of and chained at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The charge *be not afraid of him* rests on the seed-promise that Yahuah will bruise this Satan underfoot.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam''s order to *beware of him, in whatever he may do to thee* is Peter''s same vigilance against the prowling adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The devil shown to Adam *bound... unable to flee away* belongs to the same binding the angels carried out in the primeval history.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-4-word-comforts-cave-of-treasures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:18 — *I will not leave you comfortless: I will come to you.* The Word who *strengthened* Adam and *comforted* his heart is the same Logos who promises His own He will not leave comfortless.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-word-comforts-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* Yahuah''s strengthening of Adam after the assault is the same covenant assurance He gives His people not to fear.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-word-comforts-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s worship before Yahuah for his deliverance is the first calling on the Name, kept down the holy line of Seth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-word-comforts-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_05.sql (session253 2-adam-eve 5) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae5 (view _session253_2ae5_lookup). Sort band base 66100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-5-seth-holy-seed
  ('adam-eve-conflict', '2-adam-eve', 5, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth fasting and praying from his seventh year (2 Adam & Eve 5:1) is the appointed seed himself, set in the slain Abel''s place.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 1, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth entreating Elohim through the night (2 Adam & Eve 5:1) is the house in which calling on the Name begins.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 3, 'canon', 'genesis', 4, 3, 'free', E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Seth''s offering that pleased Elohim (2 Adam & Eve 5:3) is Abel''s accepted altar carried on against Cain''s rejected one.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Seth kept holy from childhood (2 Adam & Eve 5:1) is the seed of the woman that the serpent now moves to strike.'),
  -- thread: 2-adam-eve-5-angel-of-light
  ('adam-eve-conflict', '2-adam-eve', 5, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan appearing to Seth as a beautiful angel girt with light (2 Adam & Eve 5:4) is exactly the transformation Paul exposes.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The fair words by which Satan begins to beguile Seth (2 Adam & Eve 5:5) are the lies of the father of lies.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel of light at Seth''s altar (2 Adam & Eve 5:4) is the same old serpent who deceiveth the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 5, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The smiling tempter circling the seven-year-old at his offering (2 Adam & Eve 5:5) is the adversary seeking whom he may devour.'),
  -- thread: 2-adam-eve-5-ye-shall-be-as-gods
  ('adam-eve-conflict', '2-adam-eve', 5, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s boast that we all are gods (2 Adam & Eve 5:11) is the garden serpent''s lie repeated to the seed of the woman.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 9, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The false promise of a sinless world of light without offering (2 Adam & Eve 5:9) is the deception of the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 11, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Against Satan''s godless ''we all are gods'' (2 Adam & Eve 5:11), the Son of Elohim is manifested to destroy these works.'),
  -- thread: 2-adam-eve-5-mingling-the-seed
  ('adam-eve-conflict', '2-adam-eve', 5, 6, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan urging Seth to wed his beautiful women (2 Adam & Eve 5:6) is the very mingling Genesis 6 records of Seth''s line.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 10, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The wedding Satan calls ''no sin'' (2 Adam & Eve 5:10) bears the very fruit of giants Genesis names.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 6, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The line Seth is wooed to join (2 Adam & Eve 5:6) is the wicked one''s seed-line, set apart from the righteous from the start.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-seth-holy-seed',
       E'Seth the appointed seed, daily before the altar',
       E'From his seventh year Seth is the holy seed kept against the serpent: *As for Seth, when he was seven years old, he knew good and evil, and was consistent in fasting and praying, and spent all his nights in entreating Elohim (God) for mercy and forgiveness.* (2 Adam & Eve 5:1) — *for he was of a fair countenance, like unto an angel of Elohim (God)* (2 Adam & Eve 5:2), *And Elohim (God) was pleased with his offering* (2 Adam & Eve 5:3). It ain''t new: Seth is the very son Yahuah set in Abel''s place — *and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). With Seth''s house the worship of the Name begins — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — the way kept before Sinai. Seth''s daily offering that pleased Elohim is Abel''s accepted altar carried on in the line — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD)* (Genesis 4:3). This is the seed-war from the first day outside Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66100
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-angel-of-light',
       E'Satan transformed into an angel of light',
       E'The very moment Seth steps down from the altar, the deceiver comes wearing borrowed glory: *Satan appeared unto him in the form of a beautiful angel, brilliant with light; with a staff of light in his hand, himself girt about with a girdle of light.* (2 Adam & Eve 5:4) — *He greeted Seth with a beautiful smile, and began to beguile him with fair words* (2 Adam & Eve 5:5). It ain''t new — this is the apostle''s plain warning: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). He is the liar from the first day — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44) — the same old serpent: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). And he hunts the holy child as ever: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 66103
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-ye-shall-be-as-gods',
       E'The old Eden lie: no more sin, ye shall be gods',
       E'Satan''s offer to Seth recycles the first deception word for word: *thou shalt remain in our world, and rest from this world and the misery of it... thou shalt never bring up an offering, nor sue for mercy; for thou shalt commit no more sin nor be swayed by passions* (2 Adam & Eve 5:9), and the climax — *For in our world we have no Elohim (God); but we all are gods; we all are of the light, heavenly, powerful, strong and glorious* (2 Adam & Eve 5:11). This is the serpent''s word in the garden made plain — the promise of godhood without Yahuah, the very voice cursed in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new: the deceiver of the whole world is still selling the lie — *and Satan, which deceiveth the whole world* (Revelation 12:9). But the Son of Elohim was manifested for this very war — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66106
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-mingling-the-seed',
       E'Satan''s daughters: the mingling of the two seed-lines',
       E'The whole aim of the deception is to mingle the holy seed with Satan''s house: *I wish thee, 0 Seth, to wed one of them... in this land there is not one woman good enough for thee* (2 Adam & Eve 5:6), and again — *if thou wilt hearken to what I say, thou shalt wed one of my daughters; for with us it is no sin so to do; neither is it reckoned animal lust* (2 Adam & Eve 5:10). It ain''t new — this is the very corruption Genesis records when Seth''s line is later drawn down: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4). The two seed-lines are never to be mingled — Cain''s house is the wicked one''s: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12).',
       sv.verse_id, ev.verse_id, 'extras', 66109
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-5-seth-holy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth fasting and praying from his seventh year (2 Adam & Eve 5:1) is the appointed seed himself, set in the slain Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth entreating Elohim through the night (2 Adam & Eve 5:1) is the house in which calling on the Name begins.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Seth''s offering that pleased Elohim (2 Adam & Eve 5:3) is Abel''s accepted altar carried on against Cain''s rejected one.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Seth kept holy from childhood (2 Adam & Eve 5:1) is the seed of the woman that the serpent now moves to strike.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-5-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan appearing to Seth as a beautiful angel girt with light (2 Adam & Eve 5:4) is exactly the transformation Paul exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The fair words by which Satan begins to beguile Seth (2 Adam & Eve 5:5) are the lies of the father of lies.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel of light at Seth''s altar (2 Adam & Eve 5:4) is the same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The smiling tempter circling the seven-year-old at his offering (2 Adam & Eve 5:5) is the adversary seeking whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-5-ye-shall-be-as-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s boast that we all are gods (2 Adam & Eve 5:11) is the garden serpent''s lie repeated to the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-ye-shall-be-as-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The false promise of a sinless world of light without offering (2 Adam & Eve 5:9) is the deception of the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-ye-shall-be-as-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Against Satan''s godless ''we all are gods'' (2 Adam & Eve 5:11), the Son of Elohim is manifested to destroy these works.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-ye-shall-be-as-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-5-mingling-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan urging Seth to wed his beautiful women (2 Adam & Eve 5:6) is the very mingling Genesis 6 records of Seth''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-mingling-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The wedding Satan calls ''no sin'' (2 Adam & Eve 5:10) bears the very fruit of giants Genesis names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-mingling-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The line Seth is wooed to join (2 Adam & Eve 5:6) is the wicked one''s seed-line, set apart from the righteous from the start.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-mingling-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_06.sql (session253 2-adam-eve 6) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae6 (view _session253_2ae6_lookup). Sort band base 66125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-6-satan-angel-of-light
  ('adam-eve-conflict', '2-adam-eve', 6, 7, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan dresses his offer of "our world" of "beautiful things" in light, exactly as he comes to Seth in 2 Adam & Eve 6:7.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 2, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The "praise" Satan promises in 2 Adam & Eve 6:2 is a lie spoken of his own, for there is no truth in him.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 7, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* the very lie that downplayed the danger in Eden is replayed to Seth as harmless one-night mirth in 2 Adam & Eve 6:7.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 15, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel-form that befell Seth in 2 Adam & Eve 6:15 is that old serpent who deceiveth the whole world.'),
  -- thread: 2-adam-eve-6-seed-kept-not-as-cain
  ('adam-eve-conflict', '2-adam-eve', 6, 5, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* Seth''s dread of perishing "like my brother Cain" in 2 Adam & Eve 6:5 names the very seed of the wicked one this verse warns against.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 5, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is the killing Seth remembers when he refuses to follow Satan "lest I perish like my brother Cain" in 2 Adam & Eve 6:5.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 9, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* the appointed seed who clings so to Adam and Eve in 2 Adam & Eve 6:9 is the one set in the place of slain Abel to carry the covenant.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s bid to lure away the obedient seed in 2 Adam & Eve 6:8 is one more blow in the enmity decreed here against the seed of the woman.'),
  -- thread: 2-adam-eve-6-altar-the-word-curses-satan
  ('adam-eve-conflict', '2-adam-eve', 6, 12, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" Elohim sends to curse Satan in 2 Adam & Eve 6:12 is this same eternal Word who was with Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 11, 'canon', 'psalms', 50, 15, 'free', E'Psalm 50:15 — *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* Seth spreading his hands at the altar and seeking deliverance in 2 Adam & Eve 6:11 is exactly this calling-upon in the day of trouble, and Yahuah answers.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 12, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* When the Word curses Satan and he flees in 2 Adam & Eve 6:12, the everlasting pattern is shown: the adversary cannot stand before submission to Elohim.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 13, 'canon', 'ephesians', 6, 11, 'free', E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* Seth''s confidence that at the altar Satan shall be unable to hurt him in 2 Adam & Eve 6:13 is the same standing against the wiles of the devil that Yahuah''s armour secures.'),
  -- thread: 2-adam-eve-6-adam-unmasks-cave-of-treasures
  ('adam-eve-conflict', '2-adam-eve', 6, 16, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The "angel" Adam unmasks as Satan in 2 Adam & Eve 6:16 is this same old serpent who deceiveth the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 17, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Adam and Eve never parting from Seth thereafter in 2 Adam & Eve 6:17 mirrors the charge to keep the seed in all his ways against the deceiver.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 16, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The treasures rejoiced over in the Cave in 2 Adam & Eve 6:16 are the very gold, frankincense, and myrrh kept by Adam''s line against the coming of the Saviour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-satan-angel-of-light',
       E'Satan transformed — the deceiver works on Seth',
       E'Satan comes to the holy seed of Seth wearing borrowed beauty, painting "another world" more fair than this: *And Satan said "Yes; behold thou hast heard me; but I will yet praise them and their ways, in thy hearing."* (2 Adam & Eve 6:2), and *"come with me to-day, to our world; where thou shalt see beautiful things and enjoy thyself there"* (2 Adam & Eve 6:7). It ain''t new — this is the serpent''s first lie wearing fresh paint. *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). Adam himself names the disguise: the account *befell him from Satan, under the form of an angel* (2 Adam & Eve 6:15). The father of it has not changed his trade — *When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44) — the same dragon *which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 66125
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-seed-kept-not-as-cain',
       E'The seed kept — Seth fears to walk as Cain',
       E'The holy line will not stir without the covenant: *"I am afraid of doing any thing without my father''s and mother''s leave, lest I perish like my brother Cain, and like my father Adam, who transgressed the commandment of Elohim"* (2 Adam & Eve 6:5), and *"if I hide from them one day, they will die, and Elohim will hold me guilty of sinning against them"* (2 Adam & Eve 6:8). Here are the two seed-lines drawn in a child''s fear: Seth, *begat... in his own likeness, after his image; and called his name Seth* (Genesis 5:3), set against *Cain, who was of that wicked one, and slew his brother* (1 John 3:12) — *when they were in the field, that Cain rose up against Abel his brother, and slew him* (Genesis 4:8). Election precedes confession; the seed of the woman is kept while the seed of the serpent strikes — *And I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66128
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-altar-the-word-curses-satan',
       E'The altar and the Word — Satan flees, cursed',
       E'Hard-pressed, Seth runs to the only ground that is safe: *he... went up to the altar, and spread his hands unto Elohim, and sought deliverance from Him* (2 Adam & Eve 6:11), trusting *"The altar is the place of offering, and Elohim is there; a divine fire shall consume it; so shall Satan be unable to hurt me"* (2 Adam & Eve 6:13). And the deliverer is the Word: *Then Elohim sent His Word, and cursed Satan, who fled from Him* (2 Adam & Eve 6:12). This is the Logos who answers prayer and routs the enemy — *In the beginning was the Word, and the Word was with Elohim, and the Word was Elohim* (John 1:1). Yahuah''s own promise is fulfilled in the cry from the altar — *And call upon me in the day of trouble: I will deliver thee* (Psalm 50:15) — and the rule still holds: *Resist the devil, and he will flee from you.* (James 4:7).',
       sv.verse_id, ev.verse_id, 'extras', 66131
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-adam-unmasks-cave-of-treasures',
       E'Adam unmasks the angel — joy in the Cave of Treasures',
       E'The father discerns the spirit his child could not: *Adam heard his account... and warned him against that angel, telling him it was Satan who thus appeared to him. Then Adam took Seth, and they went to the Cave of Treasures, and rejoiced therein* (2 Adam & Eve 6:16). The deceiver who *appeared to him* is unmasked as *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). The watchful father guards the seed as the angels are charged to guard — *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11) — and the Cave of Treasures, where the holy line keeps gold and incense and myrrh against the Saviour''s coming, looks forward to the day they *presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 66134
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-6-satan-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan dresses his offer of "our world" of "beautiful things" in light, exactly as he comes to Seth in 2 Adam & Eve 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The "praise" Satan promises in 2 Adam & Eve 6:2 is a lie spoken of his own, for there is no truth in him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* the very lie that downplayed the danger in Eden is replayed to Seth as harmless one-night mirth in 2 Adam & Eve 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel-form that befell Seth in 2 Adam & Eve 6:15 is that old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-6-seed-kept-not-as-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* Seth''s dread of perishing "like my brother Cain" in 2 Adam & Eve 6:5 names the very seed of the wicked one this verse warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is the killing Seth remembers when he refuses to follow Satan "lest I perish like my brother Cain" in 2 Adam & Eve 6:5.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* the appointed seed who clings so to Adam and Eve in 2 Adam & Eve 6:9 is the one set in the place of slain Abel to carry the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s bid to lure away the obedient seed in 2 Adam & Eve 6:8 is one more blow in the enmity decreed here against the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-6-altar-the-word-curses-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" Elohim sends to curse Satan in 2 Adam & Eve 6:12 is this same eternal Word who was with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 50:15 — *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* Seth spreading his hands at the altar and seeking deliverance in 2 Adam & Eve 6:11 is exactly this calling-upon in the day of trouble, and Yahuah answers.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* When the Word curses Satan and he flees in 2 Adam & Eve 6:12, the everlasting pattern is shown: the adversary cannot stand before submission to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* Seth''s confidence that at the altar Satan shall be unable to hurt him in 2 Adam & Eve 6:13 is the same standing against the wiles of the devil that Yahuah''s armour secures.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-6-adam-unmasks-cave-of-treasures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The "angel" Adam unmasks as Satan in 2 Adam & Eve 6:16 is this same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-adam-unmasks-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Adam and Eve never parting from Seth thereafter in 2 Adam & Eve 6:17 mirrors the charge to keep the seed in all his ways against the deceiver.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-adam-unmasks-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The treasures rejoiced over in the Cave in 2 Adam & Eve 6:16 are the very gold, frankincense, and myrrh kept by Adam''s line against the coming of the Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-adam-unmasks-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_07.sql (session253 2-adam-eve 7) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae7 (view _session253_2ae7_lookup). Sort band base 66150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-7-seed-kept
  ('adam-eve-conflict', '2-adam-eve', 7, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s dread that "the enemy should overcome" Seth is exactly the serpent striking at the seed of the woman, so guarding that line is guarding the promise of 2 Adam and Eve 7:1.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 2, 'canon', 'genesis', 1, 28, 'free', E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* Adam''s wish that Seth''s children "replenish the earth, according to Elohim''s promise" carries the un-revoked Eden mandate into 2 Adam and Eve 7:2.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 2, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth is the "appointed seed" raised up to replace the slain Abel, the very line 2 Adam and Eve 7:2 now marries forward.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 3, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha the Messiah be with you. Amen.* The "enemy" Adam fears in 2 Adam and Eve 7:3 is the Satan whose head Yahuah has sworn to crush, so the seed kept is the seed that will tread him down.'),
  -- thread: 2-adam-eve-7-sethite-line
  ('adam-eve-conflict', '2-adam-eve', 7, 6, 'canon', 'genesis', 5, 6, 'free', E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* The same Seth-to-Enos generation that opens the Sethite roll in 2 Adam and Eve 7:6.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 7, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* Genesis records the very Enos-begat-Cainan link 2 Adam and Eve 7:7 names.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 8, 'canon', 'luke', 3, 37, 'free', E'Luke 3:37 — *Which was the son of Mathusala, which was the son of Enoch, which was the son of Jared, which was the son of Maleleel, which was the son of Cainan,* The gospel''s own genealogy carries Cainan and Maleleel forward, the unbroken seed-line whose Cainan-begat-Mahalaleel step 2 Adam and Eve 7:8 records.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 7, 'jubilees', 'jubilees', 4, 12, 'extras', E'Jubilees 4:12 — *He began to call on the name of Yahuah (God) on the earth. And in the seventh jubilee in the third week Enos took Nôâm his sister to be his wife, and she bare him a son in the third year of the fifth week, and he called his name Kenan.* Jubilees marks this Enos as the one who began to call on the Name and begat Cainan, the same holy generation of 2 Adam and Eve 7:7.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 8, 'jasher', 'jasher', 2, 16, 'extras', E'Jasher 2:16 — *And these are the names of the children of Cainan; the name of the first born Mahlallel, the second Enan, and the third Mered, and their sisters were Adah and Zillah; these are the five children of Cainan that were born to him.* Jasher names Mahalaleel as Cainan''s firstborn, confirming the begetting 2 Adam and Eve 7:8 records.'),
  -- thread: 2-adam-eve-7-cave-fasting
  ('adam-eve-conflict', '2-adam-eve', 7, 9, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, frankincense, and myrrh laid up in the Cave of Treasures where these fathers dwell (2 Adam and Eve 7:9) are the very gifts the magi bring to the Messiah they were kept for.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos; then began men to call upon the name of Yahuah (LORD).* Mahalaleel''s life of fasting and prayer in 2 Adam and Eve 7:10 is the worship of the same line in which men first began to call on the Name.'),
  ('adam-eve-conflict', '2-adam-eve', 7, 9, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount. For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* Enoch''s burnt incense on the holy mountain matches the treasured incense kept by the fathers at the Cave of Treasures in 2 Adam and Eve 7:9.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-7-seed-kept',
       E'Seth wed for the seed — lest the enemy overcome',
       E'*WHEN our father Adam saw that Seth was of a perfect heart, he wished him to marry; lest the enemy should appear to him another time, and overcome him.* (2 Adam and Eve 7:1) Adam marries the holy line *that she may bear thee children, who shall replenish the earth, according to Elohim''s (God''s) promise to us* (2 Adam and Eve 7:2) — and his stated fear, *from fear lest the enemy overcome thee* (2 Adam and Eve 7:3), names the war by its right name. It ain''t new: from the first day outside the garden the marriage of Seth is a move in the seed-war declared in Eden, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The replenishing charge is the un-revoked Eden mandate, *Be fruitful, and multiply, and replenish the earth* (Genesis 1:28). Seth himself is the appointed seed in Abel''s place, *For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). And the head Yahuah bruises is the deceiver Adam dreads, *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66150
  FROM _session253_2ae7_lookup sv, _session253_2ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-7-sethite-line',
       E'Enos, Cainan, Mahalaleel — the line kept toward Noah',
       E'*But when he was twenty years of age, he begat a son, whom he called Enos; and then begat other children than him* (2 Adam and Eve 7:6); *Then Enos grew up, married, and begat Cainan* (2 Adam and Eve 7:7); *Cainan also grew up, married, and begat Mahalaleel* (2 Adam and Eve 7:8). This is the same generations of the covenant line Genesis records, *And Seth lived an hundred and five years, and begat Enos* (Genesis 5:6), *And Enos lived ninety years, and begat Cainan* (Genesis 5:9), *And Cainan lived seventy years, and begat Mahalaleel* (Genesis 5:12). It ain''t new — the restored primeval witnesses run the same roll: Jubilees marks the day Enos *began to call on the name of Yahuah (God) on the earth* (Jubilees 4:12), and Jasher names the children of Cainan, *the name of the first born Mahlallel* (Jasher 2:16). The line is unbroken all the way down to the gospel''s own genealogy, *which was the son of Jared, which was the son of Maleleel, which was the son of Cainan* (Luke 3:37) — the seed kept until the Saviour comes.',
       sv.verse_id, ev.verse_id, 'extras', 66153
  FROM _session253_2ae7_lookup sv, _session253_2ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-7-cave-fasting',
       E'By the Cave of Treasures — Mahalaleel given to fasting and prayer',
       E'*Those fathers were born during Adam''s lifetime, and dwelt by the Cave of Treasures.* (2 Adam and Eve 7:9) The holy line is kept on the mountain of the cave where Adam laid up the gold and incense and myrrh against the Saviour''s coming — the same gifts the magi will bring, *and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). And of the last of these fathers it is written, *But Mahalaleel, when he was grown up, loved fasting, praying, and with hard labours, until the end of our father Adam''s days drew near* (2 Adam and Eve 7:10). This is the way kept before Sinai, the calling on the Name that began in this line, *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). It ain''t new: the same righteousness the restored fathers carry — Enoch who *burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25) — the worship of the seed kept holy in the waiting generations.',
       sv.verse_id, ev.verse_id, 'extras', 66156
  FROM _session253_2ae7_lookup sv, _session253_2ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-7-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s dread that "the enemy should overcome" Seth is exactly the serpent striking at the seed of the woman, so guarding that line is guarding the promise of 2 Adam and Eve 7:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* Adam''s wish that Seth''s children "replenish the earth, according to Elohim''s promise" carries the un-revoked Eden mandate into 2 Adam and Eve 7:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth is the "appointed seed" raised up to replace the slain Abel, the very line 2 Adam and Eve 7:2 now marries forward.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha the Messiah be with you. Amen.* The "enemy" Adam fears in 2 Adam and Eve 7:3 is the Satan whose head Yahuah has sworn to crush, so the seed kept is the seed that will tread him down.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-7-sethite-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* The same Seth-to-Enos generation that opens the Sethite roll in 2 Adam and Eve 7:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-sethite-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* Genesis records the very Enos-begat-Cainan link 2 Adam and Eve 7:7 names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-sethite-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 3:37 — *Which was the son of Mathusala, which was the son of Enoch, which was the son of Jared, which was the son of Maleleel, which was the son of Cainan,* The gospel''s own genealogy carries Cainan and Maleleel forward, the unbroken seed-line whose Cainan-begat-Mahalaleel step 2 Adam and Eve 7:8 records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-sethite-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:12 — *He began to call on the name of Yahuah (God) on the earth. And in the seventh jubilee in the third week Enos took Nôâm his sister to be his wife, and she bare him a son in the third year of the fifth week, and he called his name Kenan.* Jubilees marks this Enos as the one who began to call on the Name and begat Cainan, the same holy generation of 2 Adam and Eve 7:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-sethite-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 2:16 — *And these are the names of the children of Cainan; the name of the first born Mahlallel, the second Enan, and the third Mered, and their sisters were Adah and Zillah; these are the five children of Cainan that were born to him.* Jasher names Mahalaleel as Cainan''s firstborn, confirming the begetting 2 Adam and Eve 7:8 records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-sethite-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-7-cave-fasting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, frankincense, and myrrh laid up in the Cave of Treasures where these fathers dwell (2 Adam and Eve 7:9) are the very gifts the magi bring to the Messiah they were kept for.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-cave-fasting'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos; then began men to call upon the name of Yahuah (LORD).* Mahalaleel''s life of fasting and prayer in 2 Adam and Eve 7:10 is the worship of the same line in which men first began to call on the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-cave-fasting'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount. For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* Enoch''s burnt incense on the holy mountain matches the treasured incense kept by the fathers at the Cave of Treasures in 2 Adam and Eve 7:9.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae7_lookup sv, _session253_2ae7_lookup tv
 WHERE t.slug='2-adam-eve-7-cave-fasting'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_08.sql (session253 2-adam-eve 8) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae8 (view _session253_2ae8_lookup). Sort band base 66175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-8-keep-the-commandment
  ('adam-eve-conflict', '2-adam-eve', 8, 8, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The very names Adam binds the commandment to — Seth, then Enos — are the line on whom the calling on the Name begins.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 8, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed begins exactly where Adam hands down the commandment — through Seth, in Adam''s own likeness.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 7, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam''s warning against Satan''s *apparitions in which he will show himself* is the same deceiver who masks himself as light.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 7, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Adam''s charge not to hearken to Satan is the same sober vigilance against the adversary who prowls to destroy.'),
  -- thread: 2-adam-eve-8-gold-incense-myrrh
  ('adam-eve-conflict', '2-adam-eve', 8, 17, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The three treasures Adam preserved for a sign are the three gifts the magi lay before the child Messiah.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 17, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* The Saviour for whom Adam kept the gifts was already foreordained, awaiting His manifestation in the fulness of time.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 17, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The *days that are coming* when the treasures are offered is the fulness of time when the Son is sent forth.'),
  -- thread: 2-adam-eve-8-flood-eight-souls
  ('adam-eve-conflict', '2-adam-eve', 8, 10, 'canon', '1-peter', 3, 20, 'free', E'1 Peter 3:20 — *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* Adam''s *only eight souls* left out from the flood are the eight the apostle numbers saved in the ark.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 11, 'canon', 'genesis', 7, 13, 'free', E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark.* The very eight whom the flood would leave out, to bear Adam''s body, are named at the door of the ark.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 10, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The flood Adam foretells overwhelming all creatures is the very judgment Yahuah decrees against the corrupted earth.'),
  -- thread: 2-adam-eve-8-word-made-man
  ('adam-eve-conflict', '2-adam-eve', 8, 18, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The *Word of Elohim made man* whom Adam awaits is the eternal Logos who was Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 18, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Adam''s *Word of Elohim, made man* is exactly the Word made flesh who dwelt among us.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 18, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds.* The incense token of His *being Elohim of heaven and earth* answers the Son by whom the worlds were made.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 19, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The gold''s token of *His overcoming Satan, and all our foes* is the promised bruising of Satan under foot.'),
  -- thread: 2-adam-eve-8-sever-seth-from-cain
  ('adam-eve-conflict', '2-adam-eve', 8, 15, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The command to sever Seth''s seed from Cain''s is the keeping of the enmity between the two seeds set from the first promise.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 15, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Adam keeps his line from *Cain''s children* because Cain is of the wicked one — the seed of the serpent.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 15, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very mingling Adam forbids — Seth''s line coming near Cain''s — is the corruption that brings on the flood when the lines mix.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-keep-the-commandment',
       E'Keep the commandment — handed down the holy line',
       E'Dying Adam charges Seth, *"to keep innocency, to be pure and just, and trusting in Elohim (God); and lean not to the discourses of Satan, nor to the apparitions in which he will show himself to thee"* (2 Adam and Eve 8:7), and binds the word to the generations: *"keep the commandments that I give thee this day; then give the same to thy son Enos; and let Enos give it to his son Cainan"* (2 Adam and Eve 8:8). It ain''t new — the way of Yahuah is kept from the first father, before Sinai, by a faithful handing-down. So *"to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)"* (Genesis 4:26), and the line is the very seed-list Adam names: *"And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth"* (Genesis 5:3). And the warning against Satan''s *apparitions* is the apostle''s: *"And no marvel; for Satan himself is transformed into an angel of light"* (2 Corinthians 11:14), *"Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour"* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 66175
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-gold-incense-myrrh',
       E'Gold, incense, and myrrh — kept against the Saviour''s coming',
       E'Adam commands his body wound *"with myrrh, aloes, and cassia"* (2 Adam and Eve 8:9) and charges Seth and Eve, *"Preserve this gold, this incense, and this myrrh, that Elohim (God) has given us for a sign"* (2 Adam and Eve 8:17), to be carried through the flood and laid up in the midst of the earth until the Saviour comes. It ain''t new — the magi''s treasures are the very treasures Adam kept: *"And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh"* (Matthew 2:11). The gift was foreordained before the foundation: *"Who verily was foreordained before the foundation of the world, but was manifest in these last times for you"* (1 Peter 1:20), kept till *"when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law"* (Galatians 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 66178
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-flood-eight-souls',
       E'The flood foretold — eight souls and Adam''s body in the ark',
       E'Adam prophesies the deluge: *"hereafter shall a flood come and overwhelm all creatures, and leave out only eight souls"* (2 Adam and Eve 8:10), and that his body be borne in a ship *"until the flood has been assuaged, and they come out of the ship"* (2 Adam and Eve 8:11). It ain''t new — the same eight are named at the ark''s door: *"In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark"* (Genesis 7:13), and counted by the apostle: *"the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water"* (1 Peter 3:20). The judgment Adam sees is Yahuah''s: *"And GOD saw that the wickedness of man was great in the earth... I will destroy man whom I have created from the face of the earth"* (Genesis 6:5,7) — yet the seed and the promise are carried through the waters.',
       sv.verse_id, ev.verse_id, 'extras', 66181
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-word-made-man',
       E'The Word of Elohim made man — King, Elohim, and His passion',
       E'Adam unveils the mystery of the gifts: they are kept *"until the Word of Elohim (God), made man shall come; when kings shall take them, and shall offer to Him, gold in token of His being King; incense, in token of His being Elohim (God) of heaven and earth; and myrrh, in token of His passion"* (2 Adam and Eve 8:18), and again, *"gold also, as a token of His overcoming Satan... incense as a token that He will rise from the dead... and myrrh, in token that He will drink bitter gall"* (2 Adam and Eve 8:19). It ain''t new — the Word made man is the Logos: *"In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)"* (John 1:1), *"And the Word was made flesh, and dwelt among us"* (John 1:14), the Son *"by whom also he made the worlds"* (Hebrews 1:2). And the *overcoming of Satan* foretold in the gold is the seed-promise crushing the serpent: *"And the Elohim (God) of peace shall bruise Satan under your feet shortly"* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66184
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-sever-seth-from-cain',
       E'Sever Seth''s line from Cain''s — the two seed-lines',
       E'Adam''s last command guards the seed: *"sever thy children and thy children''s children from Cain''s children; do not let them ever mix with those, nor come near them either in their words or in their deeds"* (2 Adam and Eve 8:15). It ain''t new — this is the seed-war of the first promise, the two lines kept apart: *"And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel"* (Genesis 3:15). Cain is marked of the wicked one — *"Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous"* (1 John 3:12) — and when the lines later mingle the flood follows: *"That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose"* (Genesis 6:2). It is not race but the covenant seed kept: election precedes confession.',
       sv.verse_id, ev.verse_id, 'extras', 66187
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-8-keep-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The very names Adam binds the commandment to — Seth, then Enos — are the line on whom the calling on the Name begins.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed begins exactly where Adam hands down the commandment — through Seth, in Adam''s own likeness.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam''s warning against Satan''s *apparitions in which he will show himself* is the same deceiver who masks himself as light.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Adam''s charge not to hearken to Satan is the same sober vigilance against the adversary who prowls to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-gold-incense-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The three treasures Adam preserved for a sign are the three gifts the magi lay before the child Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* The Saviour for whom Adam kept the gifts was already foreordained, awaiting His manifestation in the fulness of time.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The *days that are coming* when the treasures are offered is the fulness of time when the Son is sent forth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-flood-eight-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 3:20 — *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* Adam''s *only eight souls* left out from the flood are the eight the apostle numbers saved in the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-flood-eight-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark.* The very eight whom the flood would leave out, to bear Adam''s body, are named at the door of the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-flood-eight-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The flood Adam foretells overwhelming all creatures is the very judgment Yahuah decrees against the corrupted earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-flood-eight-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-word-made-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The *Word of Elohim made man* whom Adam awaits is the eternal Logos who was Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Adam''s *Word of Elohim, made man* is exactly the Word made flesh who dwelt among us.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds.* The incense token of His *being Elohim of heaven and earth* answers the Son by whom the worlds were made.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The gold''s token of *His overcoming Satan, and all our foes* is the promised bruising of Satan under foot.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-sever-seth-from-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The command to sever Seth''s seed from Cain''s is the keeping of the enmity between the two seeds set from the first promise.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-sever-seth-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Adam keeps his line from *Cain''s children* because Cain is of the wicked one — the seed of the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-sever-seth-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very mingling Adam forbids — Seth''s line coming near Cain''s — is the corruption that brings on the flood when the lines mix.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-sever-seth-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_09.sql (session253 2-adam-eve 9) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae9 (view _session253_2ae9_lookup). Sort band base 66200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-9-adam-returns-to-dust
  ('adam-eve-conflict', '2-adam-eve', 9, 1, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s loosened limbs and stilled tongue in 2 Adam and Eve 9:1 are the Eden sentence reaching its appointed end.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 3, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The Conflict reckons the identical nine hundred and thirty years for Adam''s life in 2 Adam and Eve 9:3.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 1, 'canon', 'ecclesiastes', 12, 7, 'free', E'Ecclesiastes 12:7 — *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it.* Adam giving up the ghost in 2 Adam and Eve 9:1 is the body to dust and the breath back to its Giver.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 3, 'canon', 'romans', 5, 14, 'free', E'Romans 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.* Adam''s death after nine hundred and thirty years in 2 Adam and Eve 9:3 is the first reign of the death that one Man would undo.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 3, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* The same library: Adam is the first man laid in the ground, as the Conflict mourns him in 2 Adam and Eve 9:3.'),
  -- thread: 2-adam-eve-9-died-the-day-he-was-made
  ('adam-eve-conflict', '2-adam-eve', 9, 4, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The Friday of Adam''s making in 2 Adam and Eve 9:4 is the day the breath of life first entered him.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 4, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* The Conflict says Adam too rested on the day he was created in 2 Adam and Eve 9:4, sharing the Creator''s seventh-day rest.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 4, 'jubilees', 'jubilees', 4, 30, 'extras', E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die." For this reason he did not complete the years of this day; for he died during it.* The same-day, same-hour symmetry of 2 Adam and Eve 9:4 is Eden''s sentence — death within the day of his eating — kept in the heavens'' reckoning.'),
  -- thread: 2-adam-eve-9-spices-from-the-holy-mountain
  ('adam-eve-conflict', '2-adam-eve', 9, 5, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The sweet spices of the Holy Mountain that embalm Adam in 2 Adam and Eve 9:5 are the frankincense and myrrh kept against the day they are laid before the promised Saviour.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 5, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* The Conflict''s spices from the Holy Mountain and the cave''s side of the incense in 2 Adam and Eve 9:5 are the same mountain-sanctuary incense kept acceptable before Yahuah.'),
  -- thread: 2-adam-eve-9-offerings-and-the-name
  ('adam-eve-conflict', '2-adam-eve', 9, 7, 'canon', 'genesis', 5, 6, 'free', E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos.* The Seth-and-Enos of the altar in 2 Adam and Eve 9:7 are the kept covenant line Genesis traces from father to son.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 7, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan.* Cainan the son of Enos who offers in 2 Adam and Eve 9:7 is the next link of the holy seed Genesis records.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 7, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth and Enos coming with offerings to call on Yahuah in 2 Adam and Eve 9:7 is the very generation Genesis says began to call upon the Name.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 7, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering.* The altar of Adam where Seth''s line offers in 2 Adam and Eve 9:7 keeps the accepted way of offering Abel walked before them.'),
  -- thread: 2-adam-eve-9-take-up-his-soul-to-rest
  ('adam-eve-conflict', '2-adam-eve', 9, 8, 'canon', 'job', 19, 25, 'free', E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth.* Eve''s prayer to keep Adam''s soul and take it up to rest in 2 Adam and Eve 9:8 is the same hope of a living Redeemer at the latter day.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 8, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The soul of Adam Eve commits to rest in 2 Adam and Eve 9:8 is the very Adam in whom all die, awaiting the making-alive in Messiah.'),
  ('adam-eve-conflict', '2-adam-eve', 9, 8, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* Eve asking Elohim to take up Adam''s soul to rest in 2 Adam and Eve 9:8 bows to the appointment of death and the judgment that follows it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-9-adam-returns-to-dust',
       E'Adam gives up the ghost — dust returns to dust',
       E'The Conflict tells the death of the first man with a tenderness the bare genealogy of Genesis only names: *WHEN Adam had ended his commandment to Seth, his limbs were loosened, his hands and feet lost all power, his mouth became dumb, and his tongue ceased altogether to speak. He closed his eyes and gave up the ghost* (2 Adam and Eve 9:1), and *The death of Adam took place at the end of nine hundred and thirty years that he lived upon the earth* (2 Adam and Eve 9:3). Genesis seals the same number — *And all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5) — the curse of Eden run all the way out: *for dust thou art, and unto dust shalt thou return* (Genesis 3:19), and *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). Sha''ul names the reign that brought him here: *Nevertheless death reigned from Adam to Moses* (Romans 5:14). And Jubilees, sharing this same primeval history, marks the very grave: *Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth* (Jubilees 4:29). It ain''t new — the wages of the serpent''s lie are paid out in full, yet the seed of the woman lives on in Seth.',
       sv.verse_id, ev.verse_id, 'extras', 66200
  FROM _session253_2ae9_lookup sv, _session253_2ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-9-died-the-day-he-was-made',
       E'Friday, the very day he was created — the day of his death',
       E'The Conflict notes a haunting symmetry: *It was on a Friday, the very day on which he was created, and on which he rested; and the hour at which he died, was the same as that at which he came out of the garden* (2 Adam and Eve 9:4) — the man formed and the man unmade fall on the same day and hour. Genesis frames both ends: Adam was made of the ground — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — and Yahuah Himself rested when the work was done: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). Jubilees, on the very threshold of recounting Adam''s death, gives the reckoning the Conflict''s symmetry rests upon: *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: ''On the day that you eat thereof you will die.''* (Jubilees 4:30). The day of his making is the day of his dying — sin entered, and death by sin.',
       sv.verse_id, ev.verse_id, 'extras', 66203
  FROM _session253_2ae9_lookup sv, _session253_2ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-9-spices-from-the-holy-mountain',
       E'Embalmed with sweet spices from the Holy Mountain — laid by the incense',
       E'Seth tends his father''s body with the treasures Adam had kept against the Saviour''s coming: *Then Seth wound him up well, and embalmed him with plenty of sweet spices, from sacred trees and from the Holy Mountain; and he laid his body on the eastern side of the inside of the cave, the side of the incense; and placed in front of him a lamp-stand kept burning* (2 Adam and Eve 9:5). The sweet spices of the Holy Mountain are the very gifts the magi will one day lay before the Child: *and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11) — frankincense for worship and myrrh for burial, kept from the first father to the last Adam. Jubilees names the same mountain-incense of the sanctuary: *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25). It ain''t new — the burning lamp and the side of the incense in the Cave of Treasures are the first sanctuary, looking down the years to the One the spices were saved for.',
       sv.verse_id, ev.verse_id, 'extras', 66206
  FROM _session253_2ae9_lookup sv, _session253_2ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-9-offerings-and-the-name',
       E'Seth, Enos and Cainan offer at the altar — the holy seed kept',
       E'The covenant line carries the way of offering down from Adam: *Then Seth and his son Enos, and Cainan, the son of Enos, went out and took good offerings to present unto Yahuah (Lord), and they came to the altar upon which Adam offered gifts to Elohim (God), when he did offer* (2 Adam and Eve 9:7). This is the very chain Genesis names — *And Seth lived an hundred and five years, and begat Enos* (Genesis 5:6) and *And Enos lived ninety years, and begat Cainan* (Genesis 5:9) — the holy seed of Seth set apart from the line of Cain. It is in this line that the Name is first called upon: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). And the altar of Adam keeps the way of Abel, whose offering was received — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4) — the Torah-way of sacrifice kept long before Sinai, election preceding the law.',
       sv.verse_id, ev.verse_id, 'extras', 66209
  FROM _session253_2ae9_lookup sv, _session253_2ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-9-take-up-his-soul-to-rest',
       E'Eve''s prayer — keep the soul of Adam and take it up to rest',
       E'Over the body, Eve prays not as one without hope: *But Eve said to them, "Wait until we have first asked Elohim (God) to accept our offering, and to keep by Him the soul of Adam His servant, and to take it up to rest"* (2 Adam and Eve 9:8). That the soul is kept by Elohim and taken up to rest is the hope Iyob (Job) held even in the dust: *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* (Job 19:25). The death that began in Adam is answered in the last Adam: *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). Yet the appointment of death and judgment still stands over every man — *And as it is appointed unto men once to die, but after this the judgment* (Hebrews 9:27) — and so Eve''s prayer rests the soul of the first father with the Elohim who will raise it. It ain''t new: from the first grave, the seed of the woman looks for the resurrection.',
       sv.verse_id, ev.verse_id, 'extras', 66212
  FROM _session253_2ae9_lookup sv, _session253_2ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-9-adam-returns-to-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s loosened limbs and stilled tongue in 2 Adam and Eve 9:1 are the Eden sentence reaching its appointed end.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-adam-returns-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The Conflict reckons the identical nine hundred and thirty years for Adam''s life in 2 Adam and Eve 9:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-adam-returns-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 12:7 — *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it.* Adam giving up the ghost in 2 Adam and Eve 9:1 is the body to dust and the breath back to its Giver.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-adam-returns-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.* Adam''s death after nine hundred and thirty years in 2 Adam and Eve 9:3 is the first reign of the death that one Man would undo.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-adam-returns-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* The same library: Adam is the first man laid in the ground, as the Conflict mourns him in 2 Adam and Eve 9:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-adam-returns-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-9-died-the-day-he-was-made
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The Friday of Adam''s making in 2 Adam and Eve 9:4 is the day the breath of life first entered him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-died-the-day-he-was-made'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* The Conflict says Adam too rested on the day he was created in 2 Adam and Eve 9:4, sharing the Creator''s seventh-day rest.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-died-the-day-he-was-made'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die." For this reason he did not complete the years of this day; for he died during it.* The same-day, same-hour symmetry of 2 Adam and Eve 9:4 is Eden''s sentence — death within the day of his eating — kept in the heavens'' reckoning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-died-the-day-he-was-made'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-9-spices-from-the-holy-mountain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The sweet spices of the Holy Mountain that embalm Adam in 2 Adam and Eve 9:5 are the frankincense and myrrh kept against the day they are laid before the promised Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-spices-from-the-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* The Conflict''s spices from the Holy Mountain and the cave''s side of the incense in 2 Adam and Eve 9:5 are the same mountain-sanctuary incense kept acceptable before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-spices-from-the-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-9-offerings-and-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos.* The Seth-and-Enos of the altar in 2 Adam and Eve 9:7 are the kept covenant line Genesis traces from father to son.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-offerings-and-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan.* Cainan the son of Enos who offers in 2 Adam and Eve 9:7 is the next link of the holy seed Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-offerings-and-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth and Enos coming with offerings to call on Yahuah in 2 Adam and Eve 9:7 is the very generation Genesis says began to call upon the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-offerings-and-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering.* The altar of Adam where Seth''s line offers in 2 Adam and Eve 9:7 keeps the accepted way of offering Abel walked before them.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-offerings-and-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-9-take-up-his-soul-to-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth.* Eve''s prayer to keep Adam''s soul and take it up to rest in 2 Adam and Eve 9:8 is the same hope of a living Redeemer at the latter day.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-take-up-his-soul-to-rest'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The soul of Adam Eve commits to rest in 2 Adam and Eve 9:8 is the very Adam in whom all die, awaiting the making-alive in Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-take-up-his-soul-to-rest'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* Eve asking Elohim to take up Adam''s soul to rest in 2 Adam and Eve 9:8 bows to the appointment of death and the judgment that follows it.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae9_lookup sv, _session253_2ae9_lookup tv
 WHERE t.slug='2-adam-eve-9-take-up-his-soul-to-rest'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_10.sql (session253 2-adam-eve 10) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae10 (view _session253_2ae10_lookup). Sort band base 66225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-10-word-comforts
  ('adam-eve-conflict', '2-adam-eve', 10, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The very Word of Elohim who comes and comforts Adam''s children in 2 Adam & Eve 10:1 is the eternal Logos who was with Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who speaks to Seth and dwells with the holy line in 2 Adam & Eve 10:3 is the same Word who would be made flesh and tabernacle among men.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 1, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word coming to comfort Adam in 2 Adam & Eve 10:1 is Elohim speaking to the fathers, the first of those divers manners before the prophets.'),
  -- thread: 2-adam-eve-10-i-will-send-my-word-and-save
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise to save Seth and his seed in 2 Adam & Eve 10:3 is the seed-promise of Eden, the deliverer who would crush the serpent''s head.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word''s pledge to send and save in 2 Adam & Eve 10:3 is fulfilled when the fulness of time came and the Son was sent forth, made of a woman.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour promised to Seth in 2 Adam & Eve 10:3 was foreordained before the foundation of the world, awaiting the appointed manifestation.'),
  -- thread: 2-adam-eve-10-sever-thy-seed-from-cain
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The command to sever Seth''s seed from Cain''s in 2 Adam & Eve 10:4 guards the appointed seed given in Abel''s place.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The separation of Seth''s seed from Cain''s in 2 Adam & Eve 10:4 is the line drawn between the children of the wicked one and the righteous.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The Word commands Seth to keep clear of Cain''s line in 2 Adam & Eve 10:4, the way of Cain that still ends in woe.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* The same primeval witness as 2 Adam & Eve 10:4 — Seth raised up as the second, holy seed after Cain slew Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'jasher', 'jasher', 2, 1, 'extras', E'Jasher 2:1 — *And it was in the hundred and thirtieth year of the life of Adam upon the earth, that he again knew Eve his wife, and she conceived and bare a son in his likeness and in his image, and she called his name Seth, saying, Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him.* Jasher tells the same appointing that 2 Adam & Eve 10:4 commands Seth to guard — the seed set in Abel''s place, kept apart from Cain.'),
  -- thread: 2-adam-eve-10-the-first-whose-soul-died
  ('adam-eve-conflict', '2-adam-eve', 10, 7, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The note that Adam was the first whose soul died in 2 Adam & Eve 10:7 records the falling of the Edenic sentence Genesis seals with "and he died."'),
  ('adam-eve-conflict', '2-adam-eve', 10, 7, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Abel who "died murdered" in 2 Adam & Eve 10:7 is the righteous brother slain by the seed of the wicked one.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 7, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Though Abel "died murdered" in 2 Adam & Eve 10:7, his righteous faith yet speaks.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-word-comforts',
       E'The Word of Elohim comes and comforts',
       E'When the mourners end their prayer, *AND when they had ended their prayer, the Word of Elohim (God) came and comforted them concerning their father Adam* (2 Adam & Eve 10:1), and again *the Word of Elohim (God) came to Seth, the eldest among them* (2 Adam & Eve 10:3). This Comforter who comes, speaks, and dwells with the seed is the Logos: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), the Word who *was made flesh, and dwelt among us* (John 1:14). He is the One *who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1). It ain''t new — from the very day outside the garden the seed is kept by the speaking Word.',
       sv.verse_id, ev.verse_id, 'extras', 66225
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-i-will-send-my-word-and-save',
       E'I will send My Word and save thee and thy seed',
       E'To Seth the Word renews the promise made to Adam: *I will send My Word and save thee and thy seed* (2 Adam & Eve 10:3) — the same enmity-and-deliverance set in Eden, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The sending is appointed to its hour: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4), the Son *who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20). The five-and-a-half days are the appointed clock of that one promise, foreordained before the world and kept down the line of the seed.',
       sv.verse_id, ev.verse_id, 'extras', 66228
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-sever-thy-seed-from-cain',
       E'Sever thy seed from that of Cain',
       E'The Word''s charge to Seth divides the two lines: *keep thou the commandment he gave thee; and sever thy seed from that of Cain thy brother* (2 Adam & Eve 10:4). This is the appointing of the holy seed in place of Abel, *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). John marks the fault-line: be *Not as Cain, who was of that wicked one, and slew his brother... Because his own works were evil, and his brother''s righteous* (1 John 3:12), and Jude warns of those who *have gone in the way of Cain* (Jude 1:11). The same severing is told in the parallel primeval record: *Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7) and *Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him* (Jasher 2:1). Not race but the paternal covenant line — election before confession.',
       sv.verse_id, ev.verse_id, 'extras', 66231
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-the-first-whose-soul-died',
       E'Adam the first whose soul died, Abel murdered',
       E'The chapter closes on death: *But Adam was the first whose soul died in the land of Eden, in the Cave of Treasures; for no one died before him, but his son Abel, who died murdered* (2 Adam & Eve 10:7). Genesis seals the sentence first passed in Eden, *And all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). Yet Abel died first, by his brother''s hand, *Because his own works were evil, and his brother''s righteous* (1 John 3:12) — and though slain, the righteous one is not silenced, for *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). Death entered, but the seed and its witness were kept.',
       sv.verse_id, ev.verse_id, 'extras', 66234
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-10-word-comforts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The very Word of Elohim who comes and comforts Adam''s children in 2 Adam & Eve 10:1 is the eternal Logos who was with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-word-comforts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who speaks to Seth and dwells with the holy line in 2 Adam & Eve 10:3 is the same Word who would be made flesh and tabernacle among men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-word-comforts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word coming to comfort Adam in 2 Adam & Eve 10:1 is Elohim speaking to the fathers, the first of those divers manners before the prophets.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-word-comforts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-10-i-will-send-my-word-and-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise to save Seth and his seed in 2 Adam & Eve 10:3 is the seed-promise of Eden, the deliverer who would crush the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-i-will-send-my-word-and-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word''s pledge to send and save in 2 Adam & Eve 10:3 is fulfilled when the fulness of time came and the Son was sent forth, made of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-i-will-send-my-word-and-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour promised to Seth in 2 Adam & Eve 10:3 was foreordained before the foundation of the world, awaiting the appointed manifestation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-i-will-send-my-word-and-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-10-sever-thy-seed-from-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The command to sever Seth''s seed from Cain''s in 2 Adam & Eve 10:4 guards the appointed seed given in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The separation of Seth''s seed from Cain''s in 2 Adam & Eve 10:4 is the line drawn between the children of the wicked one and the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The Word commands Seth to keep clear of Cain''s line in 2 Adam & Eve 10:4, the way of Cain that still ends in woe.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* The same primeval witness as 2 Adam & Eve 10:4 — Seth raised up as the second, holy seed after Cain slew Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 2:1 — *And it was in the hundred and thirtieth year of the life of Adam upon the earth, that he again knew Eve his wife, and she conceived and bare a son in his likeness and in his image, and she called his name Seth, saying, Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him.* Jasher tells the same appointing that 2 Adam & Eve 10:4 commands Seth to guard — the seed set in Abel''s place, kept apart from Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-10-the-first-whose-soul-died
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The note that Adam was the first whose soul died in 2 Adam & Eve 10:7 records the falling of the Edenic sentence Genesis seals with "and he died."'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-the-first-whose-soul-died'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Abel who "died murdered" in 2 Adam & Eve 10:7 is the righteous brother slain by the seed of the wicked one.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-the-first-whose-soul-died'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Though Abel "died murdered" in 2 Adam & Eve 10:7, his righteous faith yet speaks.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-the-first-whose-soul-died'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_11.sql (session253 2-adam-eve 11) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae11 (view _session253_2ae11_lookup). Sort band base 66250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-11-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 11, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The severing of Seth''s children from Cain''s in 11:1 begins from this appointed-seed that replaces slain Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain''s seed going down westward below Abel''s blood (11:1) is the wicked-one''s line the apostle names.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 3, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Seth refusing to let one child go down to Cain''s people (11:3) is the line that does not walk the way of Cain.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 1, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same primeval record sets Seth''s line apart from Cain''s as 2 Adam and Eve 11:1 does.'),
  -- thread: 2-adam-eve-11-children-of-elohim
  ('adam-eve-conflict', '2-adam-eve', 11, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The pure line named "Children of Elohim" in 11:4 is the very phrase whose corruption Genesis records at the flood''s threshold.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 4, 'canon', 'john', 1, 12, 'free', E'John 1:12 — *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name.* The sonship Seth''s children hold by purity in 11:4 is given anew in the Word to all who receive Him.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 4, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* Seth''s sons stand "instead of the hosts of angels who fell" (11:4) — these are the very watchers who fell.'),
  -- thread: 2-adam-eve-11-heavenly-praises-offerings
  ('adam-eve-conflict', '2-adam-eve', 11, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The offerings and unceasing praises of Seth''s children in 11:6-10 are this calling on the Name begun in Seth''s own line.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 10, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering.* The cave-dwellers who bring "only offerings" (11:10) keep the accepted worship of righteous Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 6, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* Enoch of Seth''s line keeps the same heavenly offering-worship that Seth''s children give themselves to in 11:6.'),
  -- thread: 2-adam-eve-11-blood-of-abel
  ('adam-eve-conflict', '2-adam-eve', 11, 12, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The blood of Abel the just sworn by in 11:12 is the blood that first cried from the ground.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 12, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The oath by Abel''s blood in 11:12 reaches toward the better blood it foreshadows.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 12, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Swearing by Abel the just (11:12) confesses the righteous seed against the wicked one''s line.'),
  -- thread: 2-adam-eve-11-blessing-in-adam-seed-kept
  ('adam-eve-conflict', '2-adam-eve', 11, 13, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The daily worship and blessing in Adam''s body in 11:13 is the kept seed of the woman guarded against the serpent.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 14, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* Seth''s holy line kept in the cave until his end (11:14) is the generations of Adam through Seth that carry the seed onward.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 13, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The cave''s worship guarding the seed (11:13) looks to the promised crushing of the serpent that the woman''s seed will accomplish.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-two-seed-lines',
       E'Seth severs the holy line from Cain',
       E'The very first day''s history outside the garden is already the seed-war. *AFTER the death of Adam and of Eve, Seth severed his children, and his children''s children, from Cain''s children. Cain and his seed went down and dwelt westward, below the place where he had killed his brother Abel* (2 Adam and Eve 11:1), while *Seth and his children, dwelt northwards upon the mountain of the Cave of Treasures* (2 Adam and Eve 11:2), and Seth *did not allow one of them to go down to Cain''s children* (2 Adam and Eve 11:3). This is not race but the paternal-seed separation of the covenant line — Yahuah Himself appointed the line: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25), and *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The NT names the wicked seed plainly: *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12), and warns of those who *have gone in the way of Cain* (Jude 1:11). Jubilees keeps the same record — *Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7). It ain''t new: from the first generation the two seeds are kept apart, the woman''s seed guarded against the serpent''s (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66250
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-children-of-elohim',
       E'Children of Elohim in the room of the fallen angels',
       E'The holy line of Seth is given the very name the watchers forfeited. *But because of their own purity, they were named "Children of Elohim (God)," and they were with Elohim (God), instead of the hosts of angels who fell; for they continued in praises to Elohim (God), and in singing psalms unto Him, in their cave - the Cave of Treasures* (2 Adam and Eve 11:4). This is the same phrase Genesis sets at the brink of the flood — *That the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2) — and the later mingling of Seth''s purity with Cain''s valley is the corruption that follows. Enoch shows the angels who fell, leaving the rooms now filled by the sons of Seth: *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men''* (1 Enoch 6:2). And the gospel turns the title forward — *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name* (John 1:12). The name belongs to the kept seed, never to the fallen.',
       sv.verse_id, ev.verse_id, 'extras', 66253
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-heavenly-praises-offerings',
       E'The cave-dwellers gave themselves to heavenly things',
       E'Seth''s children kept the worship of the Most High before ever Sinai was given. *But Seth and his children did not like earthly work, but gave themselves to heavenly things; for they had no other thought than praises, doxologies, and psalms unto Elohim (God)* (2 Adam and Eve 11:6), and *therefore did they at all times hear the voices of angels, praising and glorifying Elohim (God)* (2 Adam and Eve 11:7). They *sowed not, neither did they reap... but only offerings* (2 Adam and Eve 11:10). This is the way kept from the beginning — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — the offerings of the righteous reaching back to Abel, of whom *Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4). Jubilees names Enoch of this same line burning incense on the mount: *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25). The Name was called upon, the offerings were brought, generations before the law — never law-as-curse, but the way of mercy kept.',
       sv.verse_id, ev.verse_id, 'extras', 66256
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-blood-of-abel',
       E'They swore by the blood of Abel the just',
       E'The holiness of the cave is sealed by the most solemn oath the first world knew. *For the men of that time never swore, but under hard circumstances, when men must swear, they swore by the blood of Abel the just* (2 Adam and Eve 11:12) — among them *no jealousy, no evil action, no hatred... neither evil counsel nor fraud*. That blood already cried from the ground: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). And the apostle holds Abel''s righteous blood up to a greater — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). The swearing by Abel''s blood marks which seed they belong to, for Cain *was of that wicked one, and slew his brother... Because his own works were evil, and his brother''s righteous* (1 John 3:12). The oath itself confesses the seed-war and which side is theirs.',
       sv.verse_id, ev.verse_id, 'extras', 66259
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-blessing-in-adam-seed-kept',
       E'Blessed in the body of Adam — the seed kept',
       E'The cave devotion turns ever toward the kept seed and the promise. *But they constrained their children and their women every day in the cave to fast and pray, and to worship the most High Elohim (God). They blessed themselves in the body of their father Adam, and anointed themselves with it* (2 Adam and Eve 11:13), keeping the line holy *until the end of Seth drew near* (2 Adam and Eve 11:14). This guarding of the line is the keeping of the seed promised in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The kept seed runs on through the generations of Adam toward Noah — *This is the book of the generations of Adam... and called his name Seth* (Genesis 5:1, 3) — and the whole line of the cave is the seed Yahuah preserves against the serpent until the Saviour comes (Genesis 3:15; Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66262
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=13
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-11-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The severing of Seth''s children from Cain''s in 11:1 begins from this appointed-seed that replaces slain Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain''s seed going down westward below Abel''s blood (11:1) is the wicked-one''s line the apostle names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Seth refusing to let one child go down to Cain''s people (11:3) is the line that does not walk the way of Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same primeval record sets Seth''s line apart from Cain''s as 2 Adam and Eve 11:1 does.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-children-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The pure line named "Children of Elohim" in 11:4 is the very phrase whose corruption Genesis records at the flood''s threshold.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-children-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:12 — *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name.* The sonship Seth''s children hold by purity in 11:4 is given anew in the Word to all who receive Him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-children-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* Seth''s sons stand "instead of the hosts of angels who fell" (11:4) — these are the very watchers who fell.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-children-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-heavenly-praises-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The offerings and unceasing praises of Seth''s children in 11:6-10 are this calling on the Name begun in Seth''s own line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-heavenly-praises-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering.* The cave-dwellers who bring "only offerings" (11:10) keep the accepted worship of righteous Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-heavenly-praises-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* Enoch of Seth''s line keeps the same heavenly offering-worship that Seth''s children give themselves to in 11:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-heavenly-praises-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-blood-of-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The blood of Abel the just sworn by in 11:12 is the blood that first cried from the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The oath by Abel''s blood in 11:12 reaches toward the better blood it foreshadows.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Swearing by Abel the just (11:12) confesses the righteous seed against the wicked one''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-blessing-in-adam-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The daily worship and blessing in Adam''s body in 11:13 is the kept seed of the woman guarded against the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blessing-in-adam-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* Seth''s holy line kept in the cave until his end (11:14) is the generations of Adam through Seth that carry the seed onward.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blessing-in-adam-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The cave''s worship guarding the seed (11:13) looks to the promised crushing of the serpent that the woman''s seed will accomplish.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blessing-in-adam-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_12.sql (session253 2-adam-eve 12) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae12 (view _session253_2ae12_lookup). Sort band base 66275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-12-the-word-shall-save-thy-seed
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Yahuah promises to send to Seth is no mere message but the eternal Logos, with Elohim before the world.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* "The great five days and a half" reckons to the incarnation, when the promised Word took flesh to save the seed.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* — the appointed term of Seth''s promise is the same fulness of time at which the Son was sent.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The "seed" Yahuah pledges to save through Seth is the very seed of the woman set against the serpent from the first day outside Eden.'),
  -- thread: 2-adam-eve-12-two-seed-lines-seth-and-cain
  ('adam-eve-conflict', '2-adam-eve', 12, 11, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Seth names Cain "the murderer" of his brother precisely as John marks him the seed of the wicked one — the line to be fled.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 10, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The "Holy and pure Mountain" Seth guards is the appointed seed-line given in Abel''s place.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 11, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To make fellowship with Cain''s children is to go "in the way of Cain" — the very apostasy Seth forbids.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 11, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same two houses stand in Jubilees — Seth the raised-up second seed over against Cain the slayer.'),
  -- thread: 2-adam-eve-12-altar-offerings-kept-from-satan
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth''s altar and intercession are the calling on the Name that Scripture says began in his very line.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Seth''s accepted offering continues the faith of Abel, whose blood he later swears his sons by.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Seth prays to be kept "from the hand of Satan"; the manifested Son is the answer that breaks Satan''s works.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Seth begs is the crushing of the serpent promised to the whole seed of the woman.'),
  -- thread: 2-adam-eve-12-the-blessing-passes-down-the-line
  ('adam-eve-conflict', '2-adam-eve', 12, 12, 'canon', 'genesis', 5, 6, 'free', E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* The first-born Seth blesses and sets over the people is the same Enos of the scriptural seed-genealogy.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 9, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* The very names gathered to Seth''s blessing — Enos, Cainan, Mahalaleel, Jared, Enoch — march in order down the holy line Scripture records.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 15, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Enos feeding his people "in righteousness and judgment" is the line that began to call on the Name carried forward.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 9, 'jubilees', 'jubilees', 4, 9, 'extras', E'Jubilees 4:9 — *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city, and called its name after the name of his son Enoch.* Against Seth''s blessed line on the mountain, Jubilees sets Cain''s line building its city below — the same two seed-houses this chapter divides.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-the-word-shall-save-thy-seed',
       E'I will send My Word and save thee and thy seed',
       E'Elohim renews to Seth the very promise made to Adam in the cave: *And Elohim (God) accepted his offering, and sent His blessing upon him and upon his children. And then Elohim (God) made a promise to Seth, saying, "At the end of the great five days and a half, concerning which I have made a promise to thee and to thy father, I will send My Word and save thee and thy seed."* (2-adam-eve 12:6). It ain''t new — this is the Logos foretold from the second generation outside Eden. The Word who is promised is the same who *was in the beginning... and the Word was Elohim (God)* (John 1:1), and who *was made flesh, and dwelt among us* (John 1:14) when *the fulness of the time was come* (Galatians 4:4). And the seed He comes to save is the seed of the woman of the first promise: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66275
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-two-seed-lines-seth-and-cain',
       E'Make no fellowship with the children of Cain',
       E'Dying Seth adjures his sons by the blood of Abel to keep the holy mountain and never mingle with Cain''s line: *I beg of you my children, not to let one of you go down from this Holy and pure Mountain. Make no fellowship with the children of Cain the murderer and the sinner, who killed his brother; for ye know, 0 my children, that we flee from him, and from all his sin with all our might because he killed his brother Abel.* (2-adam-eve 12:10-11). This is the two-seed war set in the genealogy: Seth himself was given as the appointed seed in Abel''s room — *Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). The line below is the serpent''s: *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12); they who follow it *have gone in the way of Cain* (Jude 1:11). Jubilees carries the same two houses — *Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7) — while Cain built his city below.',
       sv.verse_id, ev.verse_id, 'extras', 66278
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-altar-offerings-kept-from-satan',
       E'The altar, the offering, and mercy from the hand of Satan',
       E'Before his death Seth roofs the altar and offers for his children, that the seed be kept: *he took them and offered them upon the altar; and prayed Elohim (God) to accept their offerings, to have mercy on the souls of his children, and to keep them from the hand of Satan.* (2-adam-eve 12:5). The way of acceptable offering was kept from the first generations — *to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). It is the faith of righteous Abel before him: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous* (Hebrews 11:4). And the prayer "to keep them from the hand of Satan" is answered in the seed-promise itself — *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8); *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66281
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-the-blessing-passes-down-the-line',
       E'Enos fed his people in righteousness — the line kept to Enoch',
       E'The covenant blessing passes by hand down the holy generations: Enos, Cainan, Mahalaleel, Jared and Enoch come to receive it, and Seth commits the priesthood and the rule to Enos — *Then Seth blessed Enos, his first - born son, and commanded him habitually to minister in purity before the body of our father Adam... And he commanded him to feed his people in righteousness, in judgment and purity all the days of his life.* (2-adam-eve 12:12); *After the death of Seth, Enos rose at the head of his people, whom he fed in righteousness, and judgment, as his father had commanded him.* (2-adam-eve 12:15). This is the very genealogy of the kept seed in Scripture: *Seth lived an hundred and five years, and begat Enos* (Genesis 5:6); *Enos lived ninety years, and begat Cainan* (Genesis 5:9). It is the line that began to call on the Name — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — and that runs on to the translated Enoch named here at twenty years old.',
       sv.verse_id, ev.verse_id, 'extras', 66284
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-12-the-word-shall-save-thy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Yahuah promises to send to Seth is no mere message but the eternal Logos, with Elohim before the world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* "The great five days and a half" reckons to the incarnation, when the promised Word took flesh to save the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* — the appointed term of Seth''s promise is the same fulness of time at which the Son was sent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The "seed" Yahuah pledges to save through Seth is the very seed of the woman set against the serpent from the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-12-two-seed-lines-seth-and-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Seth names Cain "the murderer" of his brother precisely as John marks him the seed of the wicked one — the line to be fled.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The "Holy and pure Mountain" Seth guards is the appointed seed-line given in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To make fellowship with Cain''s children is to go "in the way of Cain" — the very apostasy Seth forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same two houses stand in Jubilees — Seth the raised-up second seed over against Cain the slayer.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-12-altar-offerings-kept-from-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth''s altar and intercession are the calling on the Name that Scripture says began in his very line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Seth''s accepted offering continues the faith of Abel, whose blood he later swears his sons by.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Seth prays to be kept "from the hand of Satan"; the manifested Son is the answer that breaks Satan''s works.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Seth begs is the crushing of the serpent promised to the whole seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-12-the-blessing-passes-down-the-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* The first-born Seth blesses and sets over the people is the same Enos of the scriptural seed-genealogy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* The very names gathered to Seth''s blessing — Enos, Cainan, Mahalaleel, Jared, Enoch — march in order down the holy line Scripture records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Enos feeding his people "in righteousness and judgment" is the line that began to call on the Name carried forward.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:9 — *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city, and called its name after the name of his son Enoch.* Against Seth''s blessed line on the mountain, Jubilees sets Cain''s line building its city below — the same two seed-houses this chapter divides.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_13.sql (session253 2-adam-eve 13) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae13 (view _session253_2ae13_lookup). Sort band base 66300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-13-cain-of-the-wicked-one
  ('adam-eve-conflict', '2-adam-eve', 13, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The blind Lamech is reckoned of the sons of Cain, the seed of the wicked one whose mark is murder, exactly as 2 Adam & Eve 13:1 frames his whole house.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The valley of robbery, murder and sin in 2 Adam & Eve 13:2 is the serpent''s seed living out the enmity Yahuah pronounced at the gate of Eden.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 1, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Scripture names "the way of Cain" a path of woe, and 2 Adam & Eve 13:1 sets Lamech the blind squarely on it as one of the sons of Cain.'),
  -- thread: 2-adam-eve-13-cain-the-fugitive-slain
  ('adam-eve-conflict', '2-adam-eve', 13, 5, 'canon', 'genesis', 4, 12, 'free', E'Genesis 4:12 — *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.* Cain''s restless wandering with trembling and terror in 2 Adam & Eve 13:5 is precisely the fugitive-and-vagabond curse Yahuah laid on him over Abel''s blood.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'canon', 'genesis', 4, 14, 'free', E'Genesis 4:14 — *Behold, thou hast driven me out this day from the face of the earth; and from thy face shall I be hid; and I shall be a fugitive and a vagabond in the earth; and it shall come to pass, that every one that findeth me shall slay me.* Cain''s own dread that whoever found him would slay him is fulfilled when Lamech''s stone fells him in 2 Adam & Eve 13:11.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'jubilees', 'jubilees', 4, 31, 'extras', E'Jubilees 4:31 — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* The restored libraries share one memory: Cain dies by a stone, the same instrument he used on Abel, matching the stone that fells him in 2 Adam & Eve 13:11.'),
  -- thread: 2-adam-eve-13-blood-required-stone-for-stone
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man’s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The stone that fells Cain in 2 Adam & Eve 13:11 enacts the blood-for-blood ordinance Yahuah set over all flesh.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'canon', 'numbers', 35, 17, 'free', E'Numbers 35:17 — *And if he smite him with throwing a stone, wherewith he may die, and he die, he is a murderer: the murderer shall surely be put to death.* The Torah names the very weapon — a thrown stone — that kills Cain in 2 Adam & Eve 13:11 as the mark of a murderer worthy of death.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'jubilees', 'jubilees', 4, 32, 'extras', E'Jubilees 4:32 — *With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him.* The heavenly-tables law of like-for-like is exactly what the stone in 2 Adam & Eve 13:11 carries out upon Cain.'),
  -- thread: 2-adam-eve-13-lamech-two-slain-perish-by-sword
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'genesis', 4, 23, 'free', E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Lamech''s two killings — Cain the man and the young shepherd — in 2 Adam & Eve 13:11-13 are the very "man" and "young man" his own ancient song confesses.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'genesis', 4, 24, 'free', E'Genesis 4:24 — *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold.* The escalating bloodguilt of Cain''s house, swelling sevenfold to seventy-sevenfold, is the spirit of the double slaying Lamech commits in 2 Adam & Eve 13:13.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'numbers', 35, 19, 'free', E'Numbers 35:19 — *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him.* The Torah''s avenger of blood stands against the very kind of slaying Lamech works upon the young shepherd in 2 Adam & Eve 13:13.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'matthew', 26, 52, 'free', E'Matthew 26:52 — *Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* The Messiah''s word on those who live by violence reads the doom of Lamech''s stone-wielding hands in 2 Adam & Eve 13:13.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-cain-of-the-wicked-one',
       E'The line of Cain, sons of the wicked one',
       E'The scene opens deep in the cursed seed-line: *IN those days lived Lamech the blind, who was of the sons of Cain* (2 Adam & Eve 13:1), a valley of cattle and bloodshed where *among the children of Cain, there was much robbery, murder and sin* (2 Adam & Eve 13:2). This is the other seed shown from its root. Yochanan names it plainly: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous* (1 John 3:12) — the murder bred in the father is bred in the sons. The fountainhead is in the garden-word itself, the enmity sown between two seeds: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new — the seed-war was running in Lamech''s valley before ever Sinai. And the way of Cain is named a curse to walk in: *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 1:11).',
       sv.verse_id, ev.verse_id, 'extras', 66300
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-cain-the-fugitive-slain',
       E'Cain the cursed fugitive, found and felled',
       E'Here the curse pronounced in the field comes home. From the day of Abel''s blood, *Cain, ever since Elohim (God) had cast him off, and had cursed him with trembling and terror, could neither settle nor find rest in any one place; but wandered from place to place* (2 Adam & Eve 13:5) — until a stone from Lamech''s sling finds him: *And Lamech struck him with a stone from his sling, that fell upon his face, and knocked out both his eyes; then Cain fell at once and died* (2 Adam & Eve 13:11). This is the very sentence Genesis records over Cain: *a fugitive and a vagabond shalt thou be in the earth* (Genesis 4:12), and his own dread, *every one that findeth me shall slay me* (Genesis 4:14). The book of Jubilees keeps the same memory and reads the manner of his death as measured judgment: *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31). Stone for stone — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 66303
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-blood-required-stone-for-stone',
       E'Blood for blood: the measure a man metes',
       E'Lamech''s stone is no accident in the larger reckoning — it is the measure Cain meted returning on his own head: *Then Lamech shot at Cain with his arrow and hit him in his side. And Lamech struck him with a stone from his sling, that fell upon his face, and knocked out both his eyes; then Cain fell at once and died* (2 Adam & Eve 13:11). Yahuah set this standard for the sons of Noah: *Whoso sheddeth man’s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6), and made the stone itself a token of murder in the Torah given through Mosheh: *And if he smite him with throwing a stone, wherewith he may die, and he die, he is a murderer: the murderer shall surely be put to death* (Numbers 35:17). The heavenly tables in Jubilees pronounce the very law dramatized in this cave-and-valley episode: *With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him* (Jubilees 4:32). The seed-war runs, but Yahuah''s justice runs through it.',
       sv.verse_id, ev.verse_id, 'extras', 66306
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-lamech-two-slain-perish-by-sword',
       E'Lamech''s two slain, and the avenger of blood',
       E'In the bitterness of his deed Lamech strikes again and a second man falls: *Then was Lamech sorry for it, and from the bitterness of his regret, he clapped his hands together, and struck with his flat palm the head of the youth, who fell as if dead... so he took up a stone and smote him, and smashed his head until he died* (2 Adam & Eve 13:13). This is the man and the young man of Lamech''s own song in Genesis: *for I have slain a man to my wounding, and a young man to my hurt* (Genesis 4:23) — the violence of Cain multiplied in his line: *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold* (Genesis 4:24). The Torah sets the avenger of blood against such a deed: *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him* (Numbers 35:19), and the Messiah seals the law of the violent: *for all they that take the sword shall perish with the sword* (Matthew 26:52). Sin breeds death down the seed of the serpent until the heel-bruised Seed treads it: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66309
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-13-cain-of-the-wicked-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The blind Lamech is reckoned of the sons of Cain, the seed of the wicked one whose mark is murder, exactly as 2 Adam & Eve 13:1 frames his whole house.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-of-the-wicked-one'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The valley of robbery, murder and sin in 2 Adam & Eve 13:2 is the serpent''s seed living out the enmity Yahuah pronounced at the gate of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-of-the-wicked-one'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Scripture names "the way of Cain" a path of woe, and 2 Adam & Eve 13:1 sets Lamech the blind squarely on it as one of the sons of Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-of-the-wicked-one'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-13-cain-the-fugitive-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:12 — *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.* Cain''s restless wandering with trembling and terror in 2 Adam & Eve 13:5 is precisely the fugitive-and-vagabond curse Yahuah laid on him over Abel''s blood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-the-fugitive-slain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:14 — *Behold, thou hast driven me out this day from the face of the earth; and from thy face shall I be hid; and I shall be a fugitive and a vagabond in the earth; and it shall come to pass, that every one that findeth me shall slay me.* Cain''s own dread that whoever found him would slay him is fulfilled when Lamech''s stone fells him in 2 Adam & Eve 13:11.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-the-fugitive-slain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:31 — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* The restored libraries share one memory: Cain dies by a stone, the same instrument he used on Abel, matching the stone that fells him in 2 Adam & Eve 13:11.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-the-fugitive-slain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-13-blood-required-stone-for-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man’s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The stone that fells Cain in 2 Adam & Eve 13:11 enacts the blood-for-blood ordinance Yahuah set over all flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-blood-required-stone-for-stone'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 35:17 — *And if he smite him with throwing a stone, wherewith he may die, and he die, he is a murderer: the murderer shall surely be put to death.* The Torah names the very weapon — a thrown stone — that kills Cain in 2 Adam & Eve 13:11 as the mark of a murderer worthy of death.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-blood-required-stone-for-stone'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:32 — *With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him.* The heavenly-tables law of like-for-like is exactly what the stone in 2 Adam & Eve 13:11 carries out upon Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-blood-required-stone-for-stone'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-13-lamech-two-slain-perish-by-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Lamech''s two killings — Cain the man and the young shepherd — in 2 Adam & Eve 13:11-13 are the very "man" and "young man" his own ancient song confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:24 — *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold.* The escalating bloodguilt of Cain''s house, swelling sevenfold to seventy-sevenfold, is the spirit of the double slaying Lamech commits in 2 Adam & Eve 13:13.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 35:19 — *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him.* The Torah''s avenger of blood stands against the very kind of slaying Lamech works upon the young shepherd in 2 Adam & Eve 13:13.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:52 — *Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* The Messiah''s word on those who live by violence reads the doom of Lamech''s stone-wielding hands in 2 Adam & Eve 13:13.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_14.sql (session253 2-adam-eve 14) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae14 (view _session253_2ae14_lookup). Sort band base 66325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-14-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 14, 2, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John names the very line of the murderer Enos warns his children never to join with in 2 Adam and Eve 14:2.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 2, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The fellowship Enos forbids in 2 Adam and Eve 14:2 is “the way of Cain” that Jude pronounces woe upon.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 2, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very mingling Enos labors to prevent in 2 Adam and Eve 14:2 is what breaks loose a few generations on and brings the flood.'),
  -- thread: 2-adam-eve-14-blood-of-abel
  ('adam-eve-conflict', '2-adam-eve', 14, 2, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The blood Enos swears by in 2 Adam and Eve 14:2 is the blood that has cried from the ground since Cain slew Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 2, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Enos calls Abel “the just” in 2 Adam and Eve 14:2, the same witness of righteousness Hebrews records.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 2, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The blood of Abel that Enos invokes in 2 Adam and Eve 14:2 is the very type the Messiah’s blood answers and surpasses.'),
  -- thread: 2-adam-eve-14-ministering-righteousness
  ('adam-eve-conflict', '2-adam-eve', 14, 3, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The righteousness Enos commands Cainan to establish in 2 Adam and Eve 14:3 is the calling-on-the-Name that began in Enos’s own generation.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 3, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan.* The very father-and-son Enos charges in 2 Adam and Eve 14:3 stand together in the book of the generations of Adam, the covenant seed kept by name.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 3, 'jubilees', 'jubilees', 4, 14, 'extras', E'Jubilees 4:14 — *And at the close of the eighth jubilee Kenan took Mûalêlêth his sister to be his wife, and she bare him a son in the ninth jubilee, in the first week in the third year of this week, and he called his name Mahalalel.* The same Cainan/Kenan that Enos charges in 2 Adam and Eve 14:3 carries the holy line forward in the jubilee-reckoning.'),
  -- thread: 2-adam-eve-14-cave-of-treasures-offerings
  ('adam-eve-conflict', '2-adam-eve', 14, 4, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Cainan lays Enos beside Adam in the Cave in 2 Adam and Eve 14:4, gathering the fathers to the one whose burial Jubilees records first.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 4, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* The offerings Cainan makes after the custom of his fathers in 2 Adam and Eve 14:4 are the incense-worship of the Holy Mountain, one of the appointed places of Yahuah.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 4, 'canon', 'genesis', 5, 11, 'free', E'Genesis 5:11 — *And all the days of Enos were nine hundred and five years: and he died.* The death and rest of Enos that closes 2 Adam and Eve 14:4 is sealed in the book of the generations of Adam.'),
  ('adam-eve-conflict', '2-adam-eve', 14, 4, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The Cave of Treasures where Cainan buries Enos in 2 Adam and Eve 14:4 holds the gold, incense, and myrrh Adam stored against the Saviour, brought at last by the magi.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-14-two-seed-lines',
       E'No fellowship with the children of Cain — the seed kept apart',
       E'Enos blesses the holy line and adjures them by the blood of Abel: *Let not one of your children go down from this Holy Mountain, and let them make no fellowship with the children of Cain the murderer* (2 Adam and Eve 14:2). It ain''t new — the seed-war runs from the first generations outside the garden, the line of Seth kept on the mountain, the line of Cain in the valley below. John names the murderer''s line plainly: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). Jude marks the road they walk: *Woe unto them! for they have gone in the way of Cain* (Jude 1:11). And when the two lines at last mingle, the flood draws near: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). Enos guards the carved-out covenant seed — election before confession, the seed of the woman against the seed of the serpent.',
       sv.verse_id, ev.verse_id, 'extras', 66325
  FROM _session253_2ae14_lookup sv, _session253_2ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-14-blood-of-abel',
       E'The blood of Abel the just that yet speaketh',
       E'Enos seals the charge with the most ancient oath of the righteous seed: he *adjured them by the blood of Abel the just* (2 Adam and Eve 14:2). That blood has cried from the ground since the first murder: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). It is the faith-witness that opens the great cloud: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous... and by it he being dead yet speaketh* (Hebrews 11:4). And it is the type that the better blood answers and surpasses: *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). Enos swears by the blood that cries for justice; the Messiah''s blood will cry mercy.',
       sv.verse_id, ev.verse_id, 'extras', 66328
  FROM _session253_2ae14_lookup sv, _session253_2ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-14-ministering-righteousness',
       E'Establish them in righteousness, calling on the Name',
       E'Enos hands the charge to Cainan: *establish them in righteousness, and in innocence; and stand ministering before the body of our father Adam, all the days of thy life* (2 Adam and Eve 14:3). This is the way kept before Sinai — the covenant walk that began in Enos''s own days: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The seed is kept by name and by line, and the genealogy itself is the record of the covenant: *And Enos lived ninety years, and begat Cainan* (Genesis 5:9). The same holy descent is told in the jubilee-reckoning of the restored history — *And at the close of the eighth jubilee Kenan took Mûalêlêth his sister to be his wife... and he called his name Mahalalel* (Jubilees 4:14). It ain''t new: ministering, righteousness, and the Name carried down the seed-line toward the promised One.',
       sv.verse_id, ev.verse_id, 'extras', 66331
  FROM _session253_2ae14_lookup sv, _session253_2ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-14-cave-of-treasures-offerings',
       E'Laid in the Cave of Treasures, offerings after the custom of the fathers',
       E'Enos enters his rest and Cainan *laid him in the Cave of Treasures on the left of his father Adam; and made offerings for him, after the custom of his fathers* (2 Adam and Eve 14:4). The patriarchs are gathered to one another in the mountain-sanctuary; so the restored history records the first burial: *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth* (Jubilees 4:29). The Cave on the Holy Mountain is one of the appointed places of Yahuah, where incense is offered: *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25). And the close of each father''s days is the seal of the generations: *And all the days of Enos were nine hundred and five years: and he died* (Genesis 5:11). The offerings made “after the custom of his fathers” are the Torah-way kept from the beginning — never law-as-curse, but the covenant walk awaiting the Saviour for whose coming the gold and incense and myrrh are stored in that very Cave (Matthew 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 66334
  FROM _session253_2ae14_lookup sv, _session253_2ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-14-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John names the very line of the murderer Enos warns his children never to join with in 2 Adam and Eve 14:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The fellowship Enos forbids in 2 Adam and Eve 14:2 is “the way of Cain” that Jude pronounces woe upon.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very mingling Enos labors to prevent in 2 Adam and Eve 14:2 is what breaks loose a few generations on and brings the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-14-blood-of-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The blood Enos swears by in 2 Adam and Eve 14:2 is the blood that has cried from the ground since Cain slew Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Enos calls Abel “the just” in 2 Adam and Eve 14:2, the same witness of righteousness Hebrews records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The blood of Abel that Enos invokes in 2 Adam and Eve 14:2 is the very type the Messiah’s blood answers and surpasses.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-14-ministering-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The righteousness Enos commands Cainan to establish in 2 Adam and Eve 14:3 is the calling-on-the-Name that began in Enos’s own generation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-ministering-righteousness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan.* The very father-and-son Enos charges in 2 Adam and Eve 14:3 stand together in the book of the generations of Adam, the covenant seed kept by name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-ministering-righteousness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:14 — *And at the close of the eighth jubilee Kenan took Mûalêlêth his sister to be his wife, and she bare him a son in the ninth jubilee, in the first week in the third year of this week, and he called his name Mahalalel.* The same Cainan/Kenan that Enos charges in 2 Adam and Eve 14:3 carries the holy line forward in the jubilee-reckoning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-ministering-righteousness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-14-cave-of-treasures-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Cainan lays Enos beside Adam in the Cave in 2 Adam and Eve 14:4, gathering the fathers to the one whose burial Jubilees records first.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-cave-of-treasures-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* The offerings Cainan makes after the custom of his fathers in 2 Adam and Eve 14:4 are the incense-worship of the Holy Mountain, one of the appointed places of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-cave-of-treasures-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:11 — *And all the days of Enos were nine hundred and five years: and he died.* The death and rest of Enos that closes 2 Adam and Eve 14:4 is sealed in the book of the generations of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-cave-of-treasures-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The Cave of Treasures where Cainan buries Enos in 2 Adam and Eve 14:4 holds the gold, incense, and myrrh Adam stored against the Saviour, brought at last by the magi.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae14_lookup sv, _session253_2ae14_lookup tv
 WHERE t.slug='2-adam-eve-14-cave-of-treasures-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_15.sql (session253 2-adam-eve 15) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae15 (view _session253_2ae15_lookup). Sort band base 66350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-15-cainan-910-years
  ('adam-eve-conflict', '2-adam-eve', 15, 1, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* The Genesis genealogy names Cainan as the son of Enos exactly as 2 Adam and Eve 15:1 sets him at the head of his people after Enos'' death.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 2, 'canon', 'genesis', 5, 14, 'free', E'Genesis 5:14 — *And all the days of Cainan were nine hundred and ten years: and he died.* The exact nine-hundred-and-ten-year span of 2 Adam and Eve 15:2 is the very lifespan sealed in the Genesis record of Cainan.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 3, 'jubilees', 'jubilees', 4, 14, 'extras', E'Jubilees 4:14 — *And at the close of the eighth jubilee Kenan took Mûalêlêth his sister to be his wife, and she bare him a son in the ninth jubilee, in the first week in the third year of this week, and he called his name Mahalalel.* Jubilees names Mahalalel as the son Cainan begat, matching the firstborn who receives the dying father''s blessing in 2 Adam and Eve 15:3.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The righteous succession kept in the Cave of Treasures in 2 Adam and Eve 15:1 is Yahuah guarding the seed-line of the woman against the serpent from the first generations.'),
  -- thread: 2-adam-eve-15-holy-mountain-not-children-of-cain
  ('adam-eve-conflict', '2-adam-eve', 15, 2, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* John names Cain as of the wicked one, the very line 2 Adam and Eve 15:2 forbids the holy seed to mingle with.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 2, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* Cainan adjures his people by the blood of Abel the just (2 Adam and Eve 15:2), the same blood that cries from the ground in Genesis.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 2, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude pronounces woe on the way of Cain, the murderer''s path 2 Adam and Eve 15:2 charges the Holy Mountain never to follow.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 2, 'jasher', 'jasher', 2, 27, 'extras', E'Jasher 2:27 — *And Tubal Cain told his father to draw his bow, and with the arrows he smote Cain, who was yet far off, and he slew him, for he appeared to them to be an animal.* Jasher shows the violence still running in Cain''s valley-line below, the fellowship 2 Adam and Eve 15:2 forbids the children on the mountain.'),
  -- thread: 2-adam-eve-15-embalmed-sweet-spices-offerings
  ('adam-eve-conflict', '2-adam-eve', 15, 4, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The offerings made after the custom of the fathers in 2 Adam and Eve 15:4 are the faith-offerings begun by Abel, the way kept before the law.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 4, 'canon', 'genesis', 49, 29, 'free', E'Genesis 49:29 — *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite,* Jacob''s charge to be laid in the cave with his fathers mirrors the burial of Cainan in the Cave of Treasures with his fathers in 2 Adam and Eve 15:4.'),
  ('adam-eve-conflict', '2-adam-eve', 15, 4, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* The sweet spices used to embalm and the offerings of 2 Adam and Eve 15:4 belong to the same primeval worship Jubilees names on the holy mount.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-15-cainan-910-years',
       E'Cainan stood at the head in righteousness, and at nine hundred and ten years entered into rest',
       E'The Cave of Treasures keeps the seed-line by name and by number: *AFTER the death of Enos, Cainan stood at the head of his people in righteousness and innocence, as his father had commanded him; he also continued to minister before the body of Adam, inside the Cave of Treasures* (2 Adam and Eve 15:1), and *when he had lived nine hundred and ten years... he was about to enter into rest* (2 Adam and Eve 15:2). This is the very ledger of Genesis, kept holy generation by generation: *And Enos lived ninety years, and begat Cainan* (Genesis 5:9), and the days are sealed to the exact span — *And all the days of Cainan were nine hundred and ten years: and he died* (Genesis 5:14). The same primeval reckoning is carried in Jubilees, where *Kenan took Mûalêlêth his sister to be his wife, and she bare him a son... and he called his name Mahalalel* (Jubilees 4:14). It ain''t new: the line through which the seed of the woman would come (Genesis 3:15) is named, numbered, and watched over from the very first days outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 66350
  FROM _session253_2ae15_lookup sv, _session253_2ae15_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-15-holy-mountain-not-children-of-cain',
       E'Go not down from the Holy Mountain; make no fellowship with the children of Cain',
       E'The dying charge of Cainan is the law of the two seed-lines: *he blessed them, and adjured them by the blood of Abel, the just, saying to them, "Let not one among you go down from this Holy Mountain; and make no fellowship with the children of Cain the murderer"* (2 Adam and Eve 15:2). This is not racism but the paternal separation of the covenant line, and the apostle names the very division — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). The blood of Abel still cries: *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). Jude marks the way that the children of Cain walk — *Woe unto them! for they have gone in the way of Cain* (Jude 1:11) — and Jasher tells how that valley-line below the mountain ran to violence, even slaying Cain himself: *And Tubal Cain told his father to draw his bow, and with the arrows he smote Cain, who was yet far off, and he slew him, for he appeared to them to be an animal* (Jasher 2:27). The mingling of the holy seed with that line is the road to the flood (Genesis 6) — election precedes confession, and the seed must be kept.',
       sv.verse_id, ev.verse_id, 'extras', 66353
  FROM _session253_2ae15_lookup sv, _session253_2ae15_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-15-embalmed-sweet-spices-offerings',
       E'Embalmed with sweet spices, laid in the Cave of Treasures, offerings after the custom of the fathers',
       E'The seed is kept in worship as well as in blood: *Then Mahalaleel embalmed him with sweet spices, and laid him in the Cave of Treasures, with his fathers; and they made offerings for him, after the custom of their fathers* (2 Adam and Eve 15:4). The offerings of the covenant line are no novelty of Sinai — they are the way kept from the beginning, as Abel offered before any law was written: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). The fathers gathered to the cave of their fathers, even as Jacob charged his sons — *bury me with my fathers in the cave that is in the field of Ephron the Hittite* (Genesis 49:29) — the covenant burial that joins each generation to the last. And the sweet spices kept in the treasures look forward: the incense burned on the holy mount, *the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25), are of a piece with the gold and frankincense and myrrh Adam laid up against the Saviour''s coming. It ain''t new: the way of offering and the keeping of the Name run unbroken from Eden to the manger.',
       sv.verse_id, ev.verse_id, 'extras', 66356
  FROM _session253_2ae15_lookup sv, _session253_2ae15_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-15-cainan-910-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* The Genesis genealogy names Cainan as the son of Enos exactly as 2 Adam and Eve 15:1 sets him at the head of his people after Enos'' death.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-cainan-910-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:14 — *And all the days of Cainan were nine hundred and ten years: and he died.* The exact nine-hundred-and-ten-year span of 2 Adam and Eve 15:2 is the very lifespan sealed in the Genesis record of Cainan.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-cainan-910-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:14 — *And at the close of the eighth jubilee Kenan took Mûalêlêth his sister to be his wife, and she bare him a son in the ninth jubilee, in the first week in the third year of this week, and he called his name Mahalalel.* Jubilees names Mahalalel as the son Cainan begat, matching the firstborn who receives the dying father''s blessing in 2 Adam and Eve 15:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-cainan-910-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The righteous succession kept in the Cave of Treasures in 2 Adam and Eve 15:1 is Yahuah guarding the seed-line of the woman against the serpent from the first generations.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-cainan-910-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-15-holy-mountain-not-children-of-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* John names Cain as of the wicked one, the very line 2 Adam and Eve 15:2 forbids the holy seed to mingle with.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-holy-mountain-not-children-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* Cainan adjures his people by the blood of Abel the just (2 Adam and Eve 15:2), the same blood that cries from the ground in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-holy-mountain-not-children-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude pronounces woe on the way of Cain, the murderer''s path 2 Adam and Eve 15:2 charges the Holy Mountain never to follow.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-holy-mountain-not-children-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 2:27 — *And Tubal Cain told his father to draw his bow, and with the arrows he smote Cain, who was yet far off, and he slew him, for he appeared to them to be an animal.* Jasher shows the violence still running in Cain''s valley-line below, the fellowship 2 Adam and Eve 15:2 forbids the children on the mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-holy-mountain-not-children-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-15-embalmed-sweet-spices-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The offerings made after the custom of the fathers in 2 Adam and Eve 15:4 are the faith-offerings begun by Abel, the way kept before the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-embalmed-sweet-spices-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:29 — *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite,* Jacob''s charge to be laid in the cave with his fathers mirrors the burial of Cainan in the Cave of Treasures with his fathers in 2 Adam and Eve 15:4.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-embalmed-sweet-spices-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* The sweet spices used to embalm and the offerings of 2 Adam and Eve 15:4 belong to the same primeval worship Jubilees names on the holy mount.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae15_lookup sv, _session253_2ae15_lookup tv
 WHERE t.slug='2-adam-eve-15-embalmed-sweet-spices-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_16.sql (session253 2-adam-eve 16) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae16 (view _session253_2ae16_lookup). Sort band base 66375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-16-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 16, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The children of Cain whom Mahalaleel forbids his people to mingle with are named by their father in 2 Adam & Eve 16:1.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 5, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To go down to the children of Cain (2 Adam & Eve 16:5) is to walk “the way of Cain” unto perishing.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 7, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Mahalaleel foresees in 16:7 the very mingling of the two lines that Genesis 6 records as the prelude to the flood.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 5, 'jubilees', 'jubilees', 4, 15, 'extras', E'Jubilees 4:15 — *...and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men...* Jubilees sets the mingling Mahalaleel guards against in 16:5 squarely in the days of his own son Jared.'),
  -- thread: 2-adam-eve-16-flood-foretold
  ('adam-eve-conflict', '2-adam-eve', 16, 6, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Mahalaleel''s foretelling of destruction by waters in 16:6 is Yahuah''s own sentence on the corrupted earth.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 6, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* Peter frames the flood Mahalaleel foresees in 16:6 as judgment on the ungodly out of which the kept seed alone is saved.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 6, 'enoch', '1-enoch', 10, 2, 'extras', E'1 Enoch 10:2 — *And said to him: ’Go to Noah and tell him in My Name “Hide thyself!” and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The same flood Mahalaleel announces in 16:6 is revealed to Noah by the watcher Uriel.'),
  -- thread: 2-adam-eve-16-cave-calling-name
  ('adam-eve-conflict', '2-adam-eve', 16, 2, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Mahalaleel''s praying and ministering before Adam''s body in 16:2 is the calling on the Name that began in Seth''s holy line.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 2, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount...* The Cave-of-Treasures ministry of 16:2 mirrors Enoch''s sanctuary incense kept on the holy mountain before the flood.'),
  -- thread: 2-adam-eve-16-embalmed-with-fathers
  ('adam-eve-conflict', '2-adam-eve', 16, 9, 'canon', 'genesis', 50, 2, 'free', E'Genesis 50:2 — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel).* Mahalaleel''s charge to be embalmed in 16:9 keeps the same patriarchal burial Joseph renders to Jacob.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 12, 'canon', 'genesis', 50, 3, 'free', E'Genesis 50:3 — *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days.* The forty days of mourning over Mahalaleel in 16:12 match the forty days of embalming kept for Israel.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 9, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Laying Mahalaleel by his fathers in 16:9 continues the burial in the holy line that began with Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-two-seed-lines',
       E'Watch over them: the holy seed kept from the children of Cain',
       E'Mahalaleel feeds his people *in righteousness and innocence*, watching *that they held no intercourse with the children of Cain* (2 Adam & Eve 16:1), and charges Jared, *not to let one of them go down from this Holy Mountain to the children of Cain, lest he perish with them* (16:5). It ain''t new: this is the seed-war drawn between two paternal lines from the very first generations outside the garden. John names the elder line by its father — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12) — and Jude marks the apostate path as *the way of Cain* (Jude 1:11). The whole disaster of Genesis 6 begins here, when the two lines are at last mingled and *the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2). The Jubilee record sets the very mingling in Mahalaleel and Jared''s own days, when in Jared''s days *the angels of Yahuah (God) descended on the earth, those who are named the Watchers* (Jubilees 4:15). This is election and the kept seed, not race; the covenant line guarded down toward Noah.',
       sv.verse_id, ev.verse_id, 'extras', 66375
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-flood-foretold',
       E'A great destruction by waters: the flood foretold to Jared',
       E'Mahalaleel prophesies on his deathbed, *hereafter there shall come a great destruction upon this earth on account of them; Elohim (God) will be angry with the world, and will destroy them with waters* (2 Adam & Eve 16:6). The word is Yahuah''s own from Genesis: *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth* (Genesis 6:7). Peter reads the same flood as the judgment of an ungodly world out of which the righteous seed alone is kept — Elohim *spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly* (2 Peter 2:5). The same warning runs through the restored primeval history: Uriel is sent to Noah with the word *that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it* (1 Enoch 10:2). It ain''t new — the coming of the waters is announced to the holy line generations before it falls.',
       sv.verse_id, ev.verse_id, 'extras', 66378
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-cave-calling-name',
       E'Praying before the fathers in the Cave of Treasures',
       E'Mahalaleel *continued in the Cave of Treasures praying and ministering before the body of our father Adam, asking Elohim (God) for mercy on himself and on his people* (2 Adam & Eve 16:2), and charges Jared, *stand thou by my body and pray to Elohim (God)... and fulfil thy ministry before them* (16:9). This is the way kept before Sinai — the calling on the Name that begins in Seth''s line: *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The cave-ministry is a sanctuary of incense and intercession, the very pattern Jubilees records of Enoch, who *burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25). The holy seed keeps the Name and the offering generations before the law was written.',
       sv.verse_id, ev.verse_id, 'extras', 66381
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-embalmed-with-fathers',
       E'Laid by the bodies of his fathers: the patriarch''s burial',
       E'Mahalaleel charges, *When I die, embalm my body and lay it in the Cave of Treasures, by the bodies of my fathers* (2 Adam & Eve 16:9), and his children *embalmed him carefully, and laid him by the bodies of his fathers. Then they arose, and mourned for him forty days* (16:12). The pattern of the patriarch''s death — the embalming, the forty days, the gathering of his children for the blessing — is the same kept at the end of Genesis: *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel)* (Genesis 50:2), and *forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed* (Genesis 50:3). The restored primeval record marks the same continuity of burial in the line, when *Adam died, and all his sons buried him in the land of his creation* (Jubilees 4:29). It ain''t new — the deathbed charge and burial with the fathers run unbroken from Adam to Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 66384
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-16-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The children of Cain whom Mahalaleel forbids his people to mingle with are named by their father in 2 Adam & Eve 16:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To go down to the children of Cain (2 Adam & Eve 16:5) is to walk “the way of Cain” unto perishing.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Mahalaleel foresees in 16:7 the very mingling of the two lines that Genesis 6 records as the prelude to the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:15 — *...and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men...* Jubilees sets the mingling Mahalaleel guards against in 16:5 squarely in the days of his own son Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-16-flood-foretold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Mahalaleel''s foretelling of destruction by waters in 16:6 is Yahuah''s own sentence on the corrupted earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-flood-foretold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* Peter frames the flood Mahalaleel foresees in 16:6 as judgment on the ungodly out of which the kept seed alone is saved.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-flood-foretold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:2 — *And said to him: ’Go to Noah and tell him in My Name “Hide thyself!” and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The same flood Mahalaleel announces in 16:6 is revealed to Noah by the watcher Uriel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-flood-foretold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-16-cave-calling-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Mahalaleel''s praying and ministering before Adam''s body in 16:2 is the calling on the Name that began in Seth''s holy line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-cave-calling-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount...* The Cave-of-Treasures ministry of 16:2 mirrors Enoch''s sanctuary incense kept on the holy mountain before the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-cave-calling-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-16-embalmed-with-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:2 — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel).* Mahalaleel''s charge to be embalmed in 16:9 keeps the same patriarchal burial Joseph renders to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-embalmed-with-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:3 — *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days.* The forty days of mourning over Mahalaleel in 16:12 match the forty days of embalming kept for Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-embalmed-with-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Laying Mahalaleel by his fathers in 16:9 continues the burial in the holy line that began with Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-embalmed-with-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_17.sql (session253 2-adam-eve 17) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae17 (view _session253_2ae17_lookup). Sort band base 66400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-17-angel-of-light
  ('adam-eve-conflict', '2-adam-eve', 17, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The thirty beautiful men full of light at the cave''s mouth are exactly this transformation, the seed-war''s oldest disguise worn against Jared.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 9, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The elder''s claim to be Adam comforting his children is the father of lies speaking of his own against the holy line.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 6, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The beauty that made Jared wonder is the devouring lion''s lure, and Jared who arose ''like a lion over his people'' is hunted by the false lion.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 6, 'canon', 'revelation', 12, 8, 'free', E'Revelation 12:8 — *And prevailed not; neither was their place found any more in heaven.* The ''great beauty'' Satan wears is stolen light from the heaven he was cast out of, the same dragon who counterfeits the patriarchs at the cave.'),
  -- thread: 2-adam-eve-17-false-fathers
  ('adam-eve-conflict', '2-adam-eve', 17, 9, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The same deceiver who first contradicted Yahuah''s word now raises the ''dead'' fathers as living glory to contradict death itself and ensnare Jared.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 13, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The false elder''s tale of the beautiful land north of the garden is the same promise of a better estate the serpent dangled before Eve.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 9, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who counterfeits Adam and Abel here is the one the promised Son is manifested to destroy.'),
  -- thread: 2-adam-eve-17-down-to-cain
  ('adam-eve-conflict', '2-adam-eve', 17, 18, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan''s command to ''go down to them'' is the mingling of the two seed-lines that Genesis names as the prelude to the flood Mahalaleel foretold.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 7, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Jared''s own reckoning that the children of Cain are no kindred of his marks the covenant separation John names — the line of the wicked one kept distinct from the righteous seed.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 18, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The descent to the daughters below is the same primeval crossing the Watchers made — the seed-war told twice in the same first history.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The thirty hosts of Satan luring Jared down are of that order of angels who left their estate, reserved for the judgment.'),
  -- thread: 2-adam-eve-17-the-infamy
  ('adam-eve-conflict', '2-adam-eve', 17, 38, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The daughters of Cain brought to the fountain are the very daughters of men whose fairness Genesis says drew the holy line down into corruption.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 41, 'canon', 'jude', 1, 7, 'free', E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The ''infamy'' the elder works before Jared is the going after strange flesh that Jude sets forth as the example of judgment.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 42, 'canon', '1-corinthians', 6, 9, 'free', E'1 Corinthians 6:9 — *Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind,* Jared''s refusal — ''my fathers never did the like'' — keeps the very purity Paul says the deceived forfeit the kingdom by losing.'),
  -- thread: 2-adam-eve-17-prayer-routs-devils
  ('adam-eve-conflict', '2-adam-eve', 17, 44, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the elder and his companions could not abide in a place of prayer but fled is the very promise James gives — the resisted devil flees.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 43, 'canon', 'matthew', 4, 10, 'free', E'Matthew 4:10 — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve.* The Messiah dismisses the same tempter on a mountain by the word, as Jared''s fervent prayer dismisses him from the cave-mountain.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 47, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The angel sent to draw Jared out of the midst of Cain is Yahuah''s mercy bruising Satan and keeping the seed, the standing edge of Genesis 3:15.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-angel-of-light',
       E'Handsome men full of light — Satan transformed',
       E'Satan does not come against Jared as a monster but as glory: *Satan then appeared to him with thirty men of his hosts, in the form of handsome men; Satan himself being the elder and tallest among them, with a fine beard* (2 Adam and Eve 17:4), and at the cave''s mouth Jared *found them looking like fine men, full of light, and of great beauty* (2 Adam and Eve 17:6). It ain''t new — this is the oldest disguise: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). The light is borrowed and the speech is a lie, for *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The adversary still prowls the same way: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — and he was cast down from the very light he counterfeits: *And prevailed not; neither was their place found any more in heaven* (Revelation 12:8).',
       sv.verse_id, ev.verse_id, 'extras', 66400
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-false-fathers',
       E'I am Adam — the counterfeit of the holy seed',
       E'The lie is precise and genealogical: *I am Adam whom Elohim (God) made first; and this is Abel my son, who was killed by his brother Cain... Then this is my son Seth, whom I asked of Yahuah (Lord), who gave him to me, to comfort me instead of Abel* (2 Adam and Eve 17:9-10), and the false elder names the whole line down to *Mahalaleel... thy father* (2 Adam and Eve 17:11). Satan counterfeits the very seed Yahuah is keeping. This is the garden lie wearing new robes — there the serpent said *Ye shall not surely die* (Genesis 3:4) and *ye shall be as gods, knowing good and evil* (Genesis 3:5); here he raises the dead fathers as bait. But the Son comes precisely to undo this: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66403
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-down-to-cain',
       E'Go down to them — the two seed-lines',
       E'The whole aim of the deception is to break the separation of the holy line of Seth on the mountain from the line of Cain in the valley: *Now, therefore, 0 my son, hearken to my counsel, and go down to them, thou and thy children* (2 Adam and Eve 17:18). The Watchers'' generation runs the same channel — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children''* (1 Enoch 6:2) — angels *which kept not their first estate, but left their own habitation* (Jude 1:6). It is the mingling that Genesis records: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). And it is the very line Jared is warned of, *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12) — election precedes confession, the covenant seed kept apart.',
       sv.verse_id, ev.verse_id, 'extras', 66406
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-the-infamy',
       E'Working infamy by the fountain — the corruption refused',
       E'At the fountain by the houses of Cain the trap springs: *every one of Cain''s sons brought his wife, and another brought his daughter, and so, many women came to them* (2 Adam and Eve 17:38), and the elder *spread his hands and took one of the women, and five of his companions did the same before Jared, that he should do as they did* (2 Adam and Eve 17:41). But Jared *when he saw them working infamy he wept, and said in his mind, - My fathers never did the like* (2 Adam and Eve 17:42). This is the same going *after strange flesh* (Jude 1:7) that the fair daughters of men provoked: *That the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2). Jared keeps what Paul charges the redeemed to keep: *Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers...* (1 Corinthians 6:9).',
       sv.verse_id, ev.verse_id, 'extras', 66409
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=38
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-prayer-routs-devils',
       E'He prayed, and the devils fled — mercy keeps the seed',
       E'Jared has no power of his own; he has prayer: *He then spread his hands and prayed with a fervent heart, and with much weeping, and entreated Elohim (God) to deliver him from their hands* (2 Adam and Eve 17:43), and at once *No sooner did Jared begin to pray than the elder fled with his companions; for they could not abide in a place of prayer* (2 Adam and Eve 17:44). This is the law of the seed-war: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7). The Messiah Himself routed the same elder on a mountain with the word — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10). And the mercy that sends the angel to draw Jared out of the midst of Cain is the standing promise that the seed is kept: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66412
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=43
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-17-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The thirty beautiful men full of light at the cave''s mouth are exactly this transformation, the seed-war''s oldest disguise worn against Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The elder''s claim to be Adam comforting his children is the father of lies speaking of his own against the holy line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The beauty that made Jared wonder is the devouring lion''s lure, and Jared who arose ''like a lion over his people'' is hunted by the false lion.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:8 — *And prevailed not; neither was their place found any more in heaven.* The ''great beauty'' Satan wears is stolen light from the heaven he was cast out of, the same dragon who counterfeits the patriarchs at the cave.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-false-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The same deceiver who first contradicted Yahuah''s word now raises the ''dead'' fathers as living glory to contradict death itself and ensnare Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-false-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The false elder''s tale of the beautiful land north of the garden is the same promise of a better estate the serpent dangled before Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-false-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who counterfeits Adam and Abel here is the one the promised Son is manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-false-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-down-to-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan''s command to ''go down to them'' is the mingling of the two seed-lines that Genesis names as the prelude to the flood Mahalaleel foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Jared''s own reckoning that the children of Cain are no kindred of his marks the covenant separation John names — the line of the wicked one kept distinct from the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The descent to the daughters below is the same primeval crossing the Watchers made — the seed-war told twice in the same first history.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The thirty hosts of Satan luring Jared down are of that order of angels who left their estate, reserved for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-the-infamy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The daughters of Cain brought to the fountain are the very daughters of men whose fairness Genesis says drew the holy line down into corruption.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-the-infamy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The ''infamy'' the elder works before Jared is the going after strange flesh that Jude sets forth as the example of judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-the-infamy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 6:9 — *Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind,* Jared''s refusal — ''my fathers never did the like'' — keeps the very purity Paul says the deceived forfeit the kingdom by losing.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-the-infamy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-prayer-routs-devils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the elder and his companions could not abide in a place of prayer but fled is the very promise James gives — the resisted devil flees.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-prayer-routs-devils'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:10 — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve.* The Messiah dismisses the same tempter on a mountain by the word, as Jared''s fervent prayer dismisses him from the cave-mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-prayer-routs-devils'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The angel sent to draw Jared out of the midst of Cain is Yahuah''s mercy bruising Satan and keeping the seed, the standing edge of Genesis 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-prayer-routs-devils'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_18.sql (session253 2-adam-eve 18) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae18 (view _session253_2ae18_lookup). Sort band base 66425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-18-satan-false-apparition
  ('adam-eve-conflict', '2-adam-eve', 18, 2, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very deceit the elders name in 2 Adam & Eve 18:2 is the apparition Sha''ul warns is Satan''s standing disguise.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 2, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The bodies say Satan would destroy Jared *as he destroyed Cain* (18:2) — the same wicked one working the same end down the line.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The devil who *wrought a great and false apparition* against Jared (18:3) is the prowling adversary Kepha says is always hunting the seed.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 3, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The elders'' cry to *deliver our son from the hand of Satan* (18:3) is the same resistance Ya''aqob says puts the deceiver to flight.'),
  -- thread: 2-adam-eve-18-fathers-intercede
  ('adam-eve-conflict', '2-adam-eve', 18, 8, 'canon', 'revelation', 5, 8, 'free', E'Revelation 5:8 — *And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The fathers *praying for his deliverance* (18:8) are of one company with the prayers of the saints kept in golden vials before the Lamb.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 9, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* Jared begs his fathers'' *intercession* (18:9), which points beyond them to the one Mediator who ever liveth to make it.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 9, 'canon', 'luke', 22, 31, 'free', E'Luke 22:31 — *And Yahuah (Lord) said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat:* Jared asks to be hidden *from him unto the day of my death* (18:9) — the same sifting hand Messiah warns reaches for His own, met by intercession.'),
  -- thread: 2-adam-eve-18-adam-command-offer-gifts
  ('adam-eve-conflict', '2-adam-eve', 18, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s charge to *offer gifts to Elohim* on the altar (18:10) is the same calling on the Name kept by Seth''s line down to Jared.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s *apparitions, wishing to destroy* Adam (18:10) are the serpent''s enmity against the seed, declared in the garden from the start.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 11, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam bids his people *be on their guard against him* (18:11); Sha''ul gives the end of that guard — the deceiver bruised under the feet of the seed.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 10, 'jubilees', 'jubilees', 4, 15, 'extras', E'Jubilees 4:15 — *And in the second week of the tenth jubilee Mahalalel took to him to wife Dînâh... and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers...* The very Jared whom Adam''s voice charges (18:10) is named in Jubilees for the days when the Watchers fell — the same primeval seed-war from another witness.'),
  -- thread: 2-adam-eve-18-sacred-fire-blessing
  ('adam-eve-conflict', '2-adam-eve', 18, 14, 'canon', 'leviticus', 6, 13, 'free', E'Leviticus 6:13 — *The fire shall ever be burning upon the altar; it shall never go out.* The *sacred fire from the altar* that Jared must never let lapse (18:14) is the unceasing altar-fire Torah later writes into the law — the way kept before Sinai.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 13, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth...* Jared''s offering *accepted* on the altar (18:13) is of one savour with Noah''s, the covenant mercy that keeps the seed against the curse.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 14, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Elohim who *appeared* and *blessed* on the altar (18:14) is the same manifested Son who comes to undo the deceiver''s apparitions throughout this book.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-satan-false-apparition',
       E'Satan in an apparition has deceived our son',
       E'The voices from the holy bodies name the enemy by his oldest craft: *"Satan in an apparition has deceived our son, wishing to destroy him, as he destroyed our son Cain."* (2 Adam & Eve 18:2). It ain''t new — Sha''ul tells the same story plainly: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). The adversary is *as a roaring lion* (1 Peter 5:8), and the cave''s elders pray the only counter there is: *"Yahuah Elohim of heaven and earth, deliver our son from the hand of Satan, who wrought a great and false apparition before him."* (2 Adam & Eve 18:3) — *Resist the devil, and he will flee from you.* (James 4:7). The same enemy that struck the first murderer is striking the seed kept in the cave: *Not as Cain, who was of that wicked one, and slew his brother.* (1 John 3:12).',
       sv.verse_id, ev.verse_id, 'extras', 66425
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-fathers-intercede',
       E'Through your intercession, let Elohim deliver me',
       E'Jared falls upon the holy bodies and pleads: *"O my fathers, through your intercession, let Elohim deliver me from the hand of Satan!"* — and finds the fathers *themselves praying for his deliverance from the hand of Satan.* (2 Adam & Eve 18:8-9). The righteous before the throne are heard the same way in the Revelation: *golden vials full of odours, which are the prayers of saints.* (Revelation 5:8). And there is One whose intercession never ceases — *Wherefore he is able also to save them to the uttermost that come unto Elohim by him, seeing he ever liveth to make intercession for them.* (Hebrews 7:25). The enemy still desires to sift the seed — *Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat:* (Luke 22:31) — but the prayer of the righteous keeps the watch on the mountain of the cave.',
       sv.verse_id, ev.verse_id, 'extras', 66428
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-adam-command-offer-gifts',
       E'Offer gifts to Elohim, and beware of Satan',
       E'Adam''s own voice breaks from the bodies and lays down the way kept before Sinai: *"O Jared, my son, offer gifts to Elohim for having delivered thee from the hand of Satan... offerest them on the altar on which I did offer. Then also, beware of Satan; for he deluded me many a time with his apparitions, wishing to destroy me, but Elohim delivered me out of his hand."* (2 Adam & Eve 18:10). This is the worship of the seed from the first day outside the garden — *then began men to call upon the name of Yahuah.* (Genesis 4:26). It is the altar Noah will keep — *And Noah builded an altar unto Yahuah; and took of every clean beast... and offered burnt offerings on the altar.* (Genesis 8:20) — and the deliverance is the promise of Eden itself: *And the Elohim of peace shall bruise Satan under your feet shortly.* (Romans 16:20). The enemy''s *apparitions* are the serpent''s old enmity (Genesis 3:15), and Yahuah''s hand still parts the seed from the deceiver.',
       sv.verse_id, ev.verse_id, 'extras', 66431
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-sacred-fire-blessing',
       E'Elohim appeared on the altar, and the sacred fire',
       E'Jared offers as Adam commanded, and the Word answers from the altar: *Then Elohim appeared unto Jared on the altar and blessed him and his children, and accepted their offerings; and commanded Jared to take of the sacred fire from the altar, and with it to light the lamp that shed light on the body of Adam.* (2 Adam & Eve 18:13-14). The fire Adam keeps is the fire Torah will guard at Sinai — *The fire shall ever be burning upon the altar; it shall never go out.* (Leviticus 6:13). The accepted offering is Noah''s accepted offering — *And Yahuah smelled a sweet savour... I will not again curse the ground any more for man’s sake* (Genesis 8:21). And the Elohim who *appeared* and *blessed* on the altar is the same Word who delivers the seed from the deceiver — *For this purpose the Son of Elohim was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66434
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=13
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-18-satan-false-apparition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very deceit the elders name in 2 Adam & Eve 18:2 is the apparition Sha''ul warns is Satan''s standing disguise.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The bodies say Satan would destroy Jared *as he destroyed Cain* (18:2) — the same wicked one working the same end down the line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The devil who *wrought a great and false apparition* against Jared (18:3) is the prowling adversary Kepha says is always hunting the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The elders'' cry to *deliver our son from the hand of Satan* (18:3) is the same resistance Ya''aqob says puts the deceiver to flight.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-18-fathers-intercede
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:8 — *And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The fathers *praying for his deliverance* (18:8) are of one company with the prayers of the saints kept in golden vials before the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-fathers-intercede'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* Jared begs his fathers'' *intercession* (18:9), which points beyond them to the one Mediator who ever liveth to make it.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-fathers-intercede'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 22:31 — *And Yahuah (Lord) said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat:* Jared asks to be hidden *from him unto the day of my death* (18:9) — the same sifting hand Messiah warns reaches for His own, met by intercession.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-fathers-intercede'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-18-adam-command-offer-gifts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s charge to *offer gifts to Elohim* on the altar (18:10) is the same calling on the Name kept by Seth''s line down to Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s *apparitions, wishing to destroy* Adam (18:10) are the serpent''s enmity against the seed, declared in the garden from the start.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam bids his people *be on their guard against him* (18:11); Sha''ul gives the end of that guard — the deceiver bruised under the feet of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:15 — *And in the second week of the tenth jubilee Mahalalel took to him to wife Dînâh... and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers...* The very Jared whom Adam''s voice charges (18:10) is named in Jubilees for the days when the Watchers fell — the same primeval seed-war from another witness.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-18-sacred-fire-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 6:13 — *The fire shall ever be burning upon the altar; it shall never go out.* The *sacred fire from the altar* that Jared must never let lapse (18:14) is the unceasing altar-fire Torah later writes into the law — the way kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-sacred-fire-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth...* Jared''s offering *accepted* on the altar (18:13) is of one savour with Noah''s, the covenant mercy that keeps the seed against the curse.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-sacred-fire-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Elohim who *appeared* and *blessed* on the altar (18:14) is the same manifested Son who comes to undo the deceiver''s apparitions throughout this book.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-sacred-fire-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_19.sql (session253 2-adam-eve 19) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae19 (view _session253_2ae19_lookup). Sort band base 66450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-19-the-mystery-of-his-coming
  ('adam-eve-conflict', '2-adam-eve', 19, 1, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* the appointed term Elohim explained to Jared as the 5500 years runs out in the sending of the Son in 2 Adam and Eve 19:1.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One who reveals to Jared the mystery of His coming is the eternal Word who would Himself come upon the earth in 2 Adam and Eve 19:1.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 1, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who promises His own incarnation to the holy line is the Maker of all, the mystery hidden from Adam''s day in 2 Adam and Eve 19:1.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 1, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* showing the coming explained to the fathers as the 5500 years was settled before the world, exactly the mystery of 2 Adam and Eve 19:1.'),
  -- thread: 2-adam-eve-19-the-fire-kept-until-the-body-comes-out
  ('adam-eve-conflict', '2-adam-eve', 19, 2, 'canon', '1-peter', 1, 19, 'free', E'1 Peter 1:19 — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* the altar-fire kept burning before Adam''s body until the appointed coming points to the spotless Lamb whose redemption that fire awaits in 2 Adam and Eve 19:2.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 2, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* the true Light the lamp prefigures is the Son whose own purging frees Adam''s body from the cave in 2 Adam and Eve 19:2.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 3, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Jared is charged to receive an order by true vision and not by apparition, guarding the holy fire against the deceiver''s counterfeit light in 2 Adam and Eve 19:3.'),
  -- thread: 2-adam-eve-19-the-two-seed-lines-kept-apart
  ('adam-eve-conflict', '2-adam-eve', 19, 4, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The command to keep apart from Cain''s children is the enmity of the two seeds set at Eden, guarding the woman''s seed in 2 Adam and Eve 19:4.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 4, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain is named of the wicked one, so the charge not to learn his children''s ways in 2 Adam and Eve 19:4 is the seed of the woman kept from the seed of the serpent.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 4, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The people kept from Cain''s iniquity are the line of Seth that calls on the Name, the holy seed guarded in 2 Adam and Eve 19:4.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 4, 'jubilees', 'jubilees', 4, 10, 'extras', E'Jubilees 4:10 — *And Adam knew Eve his wife and she bare yet nine sons. And in the fifth week of the fifth jubilee Seth took ''Azûrâ his sister to be his wife, and in the fourth (year of the sixth week) she bare him Enos.* Jubilees keeps the same holy line of Seth and Enos set against Cain''s city, the covenant seed Jared is told to keep separate in 2 Adam and Eve 19:4.'),
  -- thread: 2-adam-eve-19-the-word-withdrawn-and-the-descent
  ('adam-eve-conflict', '2-adam-eve', 19, 8, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The sons of God descending to mix is the same foul fellowship the children of Jared fall into as they come down from the Holy Mountain in 2 Adam and Eve 19:8.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 8, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The mingling of the holy seed with Cain''s line in 2 Adam and Eve 19:8 is the corruption that fills the earth before the Flood.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 8, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* Enoch records the same primeval breach of the seed-lines that begins on the Holy Mountain in 2 Adam and Eve 19:8.'),
  ('adam-eve-conflict', '2-adam-eve', 19, 8, 'jubilees', 'jubilees', 4, 22, 'extras', E'Jubilees 4:22 — *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* Jubilees names the defiling union that the children of Jared enter as they go down to mingle with Cain''s children in 2 Adam and Eve 19:8.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-19-the-mystery-of-his-coming',
       E'The 5500 years — the mystery of the Word''s coming',
       E'From the first days outside the garden the promise of the Saviour is already the spine of the seed-war. *THEN Elohim (God) revealed to him again the promise He had made to Adam; He explained to him the 5500 years, and revealed unto him the mystery of His coming upon the earth.* (2 Adam and Eve 19:1). This is no late invention — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* (Galatians 4:4), the appointed term run out at last. The One who reveals the promise is the Word Himself: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1), *All things were made by him; and without him was not any thing made that was made.* (John 1:3). And the coming foretold to Adam was *foreordained before the foundation of the world, but was manifest in these last times for you,* (1 Peter 1:20) — it ain''t new; the mystery was spoken to the fathers from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 66450
  FROM _session253_2ae19_lookup sv, _session253_2ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-19-the-fire-kept-until-the-body-comes-out',
       E'The fire kept by Adam''s body until the Lamb comes',
       E'The holy fire is to burn before the body of Adam until the appointed deliverance. *And Elohim (God) said to Jared, "As to that fire which thou hast taken from the altar to light the lamp withal, let it abide with you to give light to the bodies; and let it not come out of the cave, until the body of Adam comes out of it.* (2 Adam and Eve 19:2). The light kept against the day of redemption answers to the Lamb foreordained: *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* (1 Peter 1:19), who is *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power,* (Hebrews 1:3). The vision Jared must wait for, not the apparition, is the discernment of the true Light against the deceiver — *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14).',
       sv.verse_id, ev.verse_id, 'extras', 66453
  FROM _session253_2ae19_lookup sv, _session253_2ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-19-the-two-seed-lines-kept-apart',
       E'No intercourse with the children of Cain — the seed kept',
       E'The paternal seed-line of the covenant is to be kept holy and unmingled. *"Then command again thy people not to hold intercourse with the children of Cain, and not to learn their ways; for I am Elohim (God) who loves not hatred and works of iniquity."* (2 Adam and Eve 19:4). This is the enmity set at the gate of Eden — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) — and Cain stands on the serpent''s side of it: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12). The holy line is the appointed seed who call on the Name: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). Jubilees keeps the same two lines, the holy Seth set against the city of Cain: *And Adam knew Eve his wife and she bare yet nine sons. And in the fifth week of the fifth jubilee Seth took ''Azûrâ his sister to be his wife, and in the fourth (year of the sixth week) she bare him Enos.* (Jubilees 4:10). It ain''t new — election precedes confession, and the seed is guarded from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 66456
  FROM _session253_2ae19_lookup sv, _session253_2ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-19-the-word-withdrawn-and-the-descent',
       E'The Word withdrawn, and the line goes down to mingle',
       E'Elohim blesses and then withdraws His Word, and in time the holy children break the charge and go down. *Elohim (God) gave also many other commandments to Jared, and blessed him. And then withdrew His Word from him.* (2 Adam and Eve 19:5) ... *They began to go down from the Holy Mountain one after another, and to mix with the children of Cain, in foul fellowships.* (2 Adam and Eve 19:8). This downward mingling of the holy line with the seed of Cain is the very corruption Genesis records: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2), *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4). The same primeval history runs through the restored books: *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* (1 Enoch 6:2), and Jubilees testifies *to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* (Jubilees 4:22). It ain''t new — the breach of the seed begins on the Holy Mountain.',
       sv.verse_id, ev.verse_id, 'extras', 66459
  FROM _session253_2ae19_lookup sv, _session253_2ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-19-the-mystery-of-his-coming
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* the appointed term Elohim explained to Jared as the 5500 years runs out in the sending of the Son in 2 Adam and Eve 19:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-mystery-of-his-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One who reveals to Jared the mystery of His coming is the eternal Word who would Himself come upon the earth in 2 Adam and Eve 19:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-mystery-of-his-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who promises His own incarnation to the holy line is the Maker of all, the mystery hidden from Adam''s day in 2 Adam and Eve 19:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-mystery-of-his-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* showing the coming explained to the fathers as the 5500 years was settled before the world, exactly the mystery of 2 Adam and Eve 19:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-mystery-of-his-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-19-the-fire-kept-until-the-body-comes-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:19 — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* the altar-fire kept burning before Adam''s body until the appointed coming points to the spotless Lamb whose redemption that fire awaits in 2 Adam and Eve 19:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-fire-kept-until-the-body-comes-out'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* the true Light the lamp prefigures is the Son whose own purging frees Adam''s body from the cave in 2 Adam and Eve 19:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-fire-kept-until-the-body-comes-out'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Jared is charged to receive an order by true vision and not by apparition, guarding the holy fire against the deceiver''s counterfeit light in 2 Adam and Eve 19:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-fire-kept-until-the-body-comes-out'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-19-the-two-seed-lines-kept-apart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The command to keep apart from Cain''s children is the enmity of the two seeds set at Eden, guarding the woman''s seed in 2 Adam and Eve 19:4.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-two-seed-lines-kept-apart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain is named of the wicked one, so the charge not to learn his children''s ways in 2 Adam and Eve 19:4 is the seed of the woman kept from the seed of the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-two-seed-lines-kept-apart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The people kept from Cain''s iniquity are the line of Seth that calls on the Name, the holy seed guarded in 2 Adam and Eve 19:4.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-two-seed-lines-kept-apart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:10 — *And Adam knew Eve his wife and she bare yet nine sons. And in the fifth week of the fifth jubilee Seth took ''Azûrâ his sister to be his wife, and in the fourth (year of the sixth week) she bare him Enos.* Jubilees keeps the same holy line of Seth and Enos set against Cain''s city, the covenant seed Jared is told to keep separate in 2 Adam and Eve 19:4.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-two-seed-lines-kept-apart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-19-the-word-withdrawn-and-the-descent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The sons of God descending to mix is the same foul fellowship the children of Jared fall into as they come down from the Holy Mountain in 2 Adam and Eve 19:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-word-withdrawn-and-the-descent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The mingling of the holy seed with Cain''s line in 2 Adam and Eve 19:8 is the corruption that fills the earth before the Flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-word-withdrawn-and-the-descent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* Enoch records the same primeval breach of the seed-lines that begins on the Holy Mountain in 2 Adam and Eve 19:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-word-withdrawn-and-the-descent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:22 — *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* Jubilees names the defiling union that the children of Jared enter as they go down to mingle with Cain''s children in 2 Adam and Eve 19:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae19_lookup sv, _session253_2ae19_lookup tv
 WHERE t.slug='2-adam-eve-19-the-word-withdrawn-and-the-descent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_20.sql (session253 2-adam-eve 20) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae20 (view _session253_2ae20_lookup). Sort band base 66475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-20-genun-arts-of-cain
  ('adam-eve-conflict', '2-adam-eve', 20, 2, 'canon', 'genesis', 4, 21, 'free', E'Genesis 4:21 — *And his brother’s name was Jubal: he was the father of all such as handle the harp and organ.* The Torah''s own genealogy already names Cain''s line as the fathers of the instruments Genun multiplies in 2 Adam & Eve 20:2.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 7, 'canon', 'genesis', 4, 22, 'free', E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Cain''s house births the worker of brass and iron, exactly as Satan increases Genun''s understanding to take iron and make weapons of war in 2 Adam & Eve 20:7.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 2, 'enoch', '1-enoch', 8, 1, 'extras', E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* The Watcher Azazel''s curriculum — weaponry, ornament, dyes, painted eyes — is Genun''s curriculum verbatim, the same seed-war wearing a new name.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 3, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The sweet, heart-ravishing sounds that Satan plays through Genun''s instruments in 2 Adam & Eve 20:3 are the adversary disguising death as delight.'),
  -- thread: 2-adam-eve-20-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 20, 14, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The sons of Cain who shine in beauty and abomination at the foot of the mountain in 2 Adam & Eve 20:14 are the line of him who was of that wicked one.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 17, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The children of Cain calling up to the holy mountain in 2 Adam & Eve 20:17 are walking — and beckoning others into — the way of Cain that Jude condemns.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 15, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The praying, praising children of Seth on the Holy Mountain in 2 Adam & Eve 20:15 are the very line of which Genesis says men began to call on the Name.'),
  -- thread: 2-adam-eve-20-satan-shows-the-way-down
  ('adam-eve-conflict', '2-adam-eve', 20, 19, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Satan''s night-counsel showing the way down the western stream in 2 Adam & Eve 20:19 is the serpent''s same subtilty that beguiled Eve.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 18, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Genun bethinking himself how to bring the sons of Seth down in 2 Adam & Eve 20:18 is the adversary walking about, seeking whom he may devour.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 19, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lie Satan whispers to Genun in 2 Adam & Eve 20:19 is the father of lies speaking of his own from the beginning.'),
  -- thread: 2-adam-eve-20-sons-of-seth-descend
  ('adam-eve-conflict', '2-adam-eve', 20, 32, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The sons of Seth lusting after the daughters of Cain until they committed abomination in 2 Adam & Eve 20:32 is the very sons-of-God / daughters-of-men mingling of Genesis 6.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 33, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The defilement that bars the sons of Seth from the holy mountain in 2 Adam & Eve 20:33 is the flood-bringing wickedness Genesis names.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 31, 'enoch', '1-enoch', 7, 1, 'extras', E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The fire of sin kindled by the painted daughters of Cain in 2 Adam & Eve 20:31 is the same defiling descent the Watchers made in Enoch.'),
  -- thread: 2-adam-eve-20-word-to-jared-children-of-devil
  ('adam-eve-conflict', '2-adam-eve', 20, 35, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Jared in 2 Adam & Eve 20:35 is the eternal Logos who was in the beginning with Elohim.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 27, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Jared''s warning that the descenders shall be called ''children of the devil'' in 2 Adam & Eve 20:27 is John''s same verdict on those of the devil who sins from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 27, 'canon', '1-john', 3, 10, 'free', E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Jared''s two names — ''children of Elohim'' or ''children of the devil'' — in 2 Adam & Eve 20:27 are the two manifest seeds John sets side by side.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-genun-arts-of-cain',
       E'Genun and the arts of Cain — it ain''t new',
       E'Down in the valley of Cain''s line rises Genun, and Satan is his teacher: *But as to this Genun, Satan came into him in his childhood; and he made sundry trumpets and horns, and string instruments, cymbals and psalteries, and lyres and harps, and flutes; and he played on them at all times and at every hour* (2 Adam & Eve 20:2). Music, strong drink, weapons of war — the very catalogue Yahuah''s own record already kept of Cain''s house: *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ* (Genesis 4:21), and *Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron* (Genesis 4:22). And it ain''t new even there — the Watchers'' apostasy is the same script: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures* (1 Enoch 8:1). The fallen one ever transforms a gift into a snare: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14).',
       sv.verse_id, ev.verse_id, 'extras', 66475
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-two-seed-lines',
       E'The two seed-lines: Cain below, Seth on the mountain',
       E'The whole drama is the parting of two seeds — the children of Cain in the valley of iniquity and the children of Seth kept on the Holy Mountain: *Meanwhile the children of Seth, who were on the Holy Mountain, prayed and praised Elohim (God), in the place of the hosts of angels who had fallen; wherefore Elohim (God) had called them ''angels,'' because He rejoiced over them greatly* (2 Adam & Eve 20:15). John names the two lines exactly: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12), and Jude pronounces the woe: *Woe unto them! for they have gone in the way of Cain* (Jude 1:11). And the mingling that follows is the very crisis Genesis records before the flood: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). It ain''t new — the seed-war of Genesis 3:15 is the same war, told from the first generations outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 66478
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-satan-shows-the-way-down',
       E'Satan shows the way down — the serpent''s subtilty',
       E'When the sons of Seth plead ignorance of the descent, the deceiver supplies the path: *Then Satan appeared to him by night, saying, "There is no way for them to come down from the mountain on which they dwell; but when they come to-morrow, say to them, ''Come ye to the western side of the mountain; there you will find the way of a stream of water, that comes down to the foot of the mountain, between two hills; come down that way to us"* (2 Adam & Eve 20:19). This is the same subtilty Paul fears: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). The adversary prowls for the descent: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — and he is, from the first, the murderer who lies: *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 66481
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-sons-of-seth-descend',
       E'The sons of Seth descend — sons of God, daughters of men',
       E'The hundred go down, the fire of lust is kindled, and the holy mountain shuts behind them: *But after they had thus fallen into this defilement, they returned by the way they had come, and tried to ascend the Holy Mountain. But they could not, because the stones of that holy mountain were of fire flashing before them, by reason of which they could not go up again* (2 Adam & Eve 20:33). This is the pre-flood crisis Genesis records: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and the corruption that follows: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5). The other restored witness tells the same descent: *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments* (1 Enoch 7:1). One seed-war, many tongues.',
       sv.verse_id, ev.verse_id, 'extras', 66484
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=31
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-word-to-jared-children-of-devil',
       E'The Word to Jared — children of Elohim or children of the devil',
       E'Jared''s warning sets the two destinies in the plainest terms: *He again adjured them, saying... for the moment you leave it, you will be reft of life and of mercy; and you shall no longer be called ''children of Elohim (God),'' but ''children of the devil''* (2 Adam & Eve 20:27). And when they fall, it is the Word of Elohim who comes to Jared: *Then Elohim (God) sent His Word to Jared, saying, "These thy children, whom thou didst call ''My children,'' - behold they have transgressed My commandment"* (2 Adam & Eve 20:35). That sent Word is the Logos: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1). And Jared''s two names are John''s two lines exactly: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8); *In this the children of Elohim (God) are manifest, and the children of the devil* (1 John 3:10). Election before confession — the seed kept, the seed lost.',
       sv.verse_id, ev.verse_id, 'extras', 66487
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=27
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-20-genun-arts-of-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:21 — *And his brother’s name was Jubal: he was the father of all such as handle the harp and organ.* The Torah''s own genealogy already names Cain''s line as the fathers of the instruments Genun multiplies in 2 Adam & Eve 20:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Cain''s house births the worker of brass and iron, exactly as Satan increases Genun''s understanding to take iron and make weapons of war in 2 Adam & Eve 20:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* The Watcher Azazel''s curriculum — weaponry, ornament, dyes, painted eyes — is Genun''s curriculum verbatim, the same seed-war wearing a new name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The sweet, heart-ravishing sounds that Satan plays through Genun''s instruments in 2 Adam & Eve 20:3 are the adversary disguising death as delight.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The sons of Cain who shine in beauty and abomination at the foot of the mountain in 2 Adam & Eve 20:14 are the line of him who was of that wicked one.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The children of Cain calling up to the holy mountain in 2 Adam & Eve 20:17 are walking — and beckoning others into — the way of Cain that Jude condemns.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The praying, praising children of Seth on the Holy Mountain in 2 Adam & Eve 20:15 are the very line of which Genesis says men began to call on the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-satan-shows-the-way-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Satan''s night-counsel showing the way down the western stream in 2 Adam & Eve 20:19 is the serpent''s same subtilty that beguiled Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-satan-shows-the-way-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Genun bethinking himself how to bring the sons of Seth down in 2 Adam & Eve 20:18 is the adversary walking about, seeking whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-satan-shows-the-way-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lie Satan whispers to Genun in 2 Adam & Eve 20:19 is the father of lies speaking of his own from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-satan-shows-the-way-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-sons-of-seth-descend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The sons of Seth lusting after the daughters of Cain until they committed abomination in 2 Adam & Eve 20:32 is the very sons-of-God / daughters-of-men mingling of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-sons-of-seth-descend'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The defilement that bars the sons of Seth from the holy mountain in 2 Adam & Eve 20:33 is the flood-bringing wickedness Genesis names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-sons-of-seth-descend'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The fire of sin kindled by the painted daughters of Cain in 2 Adam & Eve 20:31 is the same defiling descent the Watchers made in Enoch.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-sons-of-seth-descend'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=31
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-word-to-jared-children-of-devil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Jared in 2 Adam & Eve 20:35 is the eternal Logos who was in the beginning with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-word-to-jared-children-of-devil'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Jared''s warning that the descenders shall be called ''children of the devil'' in 2 Adam & Eve 20:27 is John''s same verdict on those of the devil who sins from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-word-to-jared-children-of-devil'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Jared''s two names — ''children of Elohim'' or ''children of the devil'' — in 2 Adam & Eve 20:27 are the two manifest seeds John sets side by side.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-word-to-jared-children-of-devil'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_21.sql (session253 2-adam-eve 21) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae21 (view _session253_2ae21_lookup). Sort band base 66500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-21-keep-the-commandment-holy-mountain
  ('adam-eve-conflict', '2-adam-eve', 21, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The mingling that drew Seth''s children down off the holy mountain in 2 Adam & Eve 21:4 is Genesis'' sons-of-God taking the daughters of men.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 4, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Jared''s grief over the fallen children of Seth (21:4) looks straight onto the giant-bearing intermarriage Genesis records.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 4, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The holy mountain-line Jared charges to keep the commandment (21:4) is the Seth-line that first called on the Name.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Jared''s charge to set their hearts and keep Elohim''s commandment (21:7) guards the very seed of the woman the serpent has hunted from the first day outside Eden.'),
  -- thread: 2-adam-eve-21-gold-incense-myrrh-the-saviour
  ('adam-eve-conflict', '2-adam-eve', 21, 7, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh Jared bids them keep (21:7) are the magi''s three gifts, prepared in the first age for the Saviour''s coming.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 7, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount. For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* The incense Jared lays up (21:7) is the same sanctuary-incense Enoch offered on the holy Mount.'),
  -- thread: 2-adam-eve-21-word-of-elohim-salvation-middle-of-earth
  ('adam-eve-conflict', '2-adam-eve', 21, 8, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim Jared says will come to the one left (21:8) is the eternal Logos of John''s prologue.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 8, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to work salvation in the middle of the earth (21:8) is the Word made flesh.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 8, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The coming of the Word foretold in 21:8 is fulfilled when the fulness of time was come.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The place whence salvation shall come, where Shem lays Adam''s body (21:11), is where the woman''s seed bruises the serpent''s head.'),
  -- thread: 2-adam-eve-21-noah-shem-ark-flood
  ('adam-eve-conflict', '2-adam-eve', 21, 10, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The Noah Jared names as the one left, who bears Adam''s body into the ark (21:10), is the faith-Noah who prepared the ark to save his house.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 10, 'canon', 'genesis', 7, 7, 'free', E'Genesis 7:7 — *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood.* The flood and the ark Jared foretells (21:10) is the very entry Genesis narrates.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 11, 'canon', 'genesis', 7, 13, 'free', E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark;* Shem, whom Jared singles out to lay Adam''s body (21:11), enters the ark first-named among Noah''s sons.'),
  -- thread: 2-adam-eve-21-jared-rest-enoch-ministers
  ('adam-eve-conflict', '2-adam-eve', 21, 12, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Enoch charged to minister before Adam''s body all his days (21:12) is the Enoch who walked with Elohim until he was taken.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 12, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s diligent ministry in the cave (21:12) is the pleasing-Elohim testimony that crowned his translation.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 12, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The Enoch set to minister before Adam''s body (21:12) is the same scribe-witness conducted into the Garden of Eden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-keep-the-commandment-holy-mountain',
       E'Keep the commandment — the seed kept on the holy mountain',
       E'Dying Jared gathers the covenant line — *Then he called Enoch his eldest son, and Methuselah Enoch''s son, and Lamech the son of Methuselah, and Noah the son of Lamech* (2 Adam & Eve 21:3) — and binds them to the seed kept apart: *Ye are righteous, innocent sons; go ye not down from this holy mountain; for behold, your children and your children''s children have gone down from this holy mountain, and have estranged themselves from this holy mountain, through their abominable lust and transgression of Elohim''s (God''s) commandment* (21:4). This is the two seed-lines of the primeval war: the children of Seth held holy above, drawn down by the daughters below. *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days* (Genesis 6:4) — the same mingling Jared weeps over. The line itself is the calling on the Name begun in Seth: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). It ain''t new — election precedes confession, and the seed is kept by mercy against the day the serpent''s head is bruised: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66500
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-gold-incense-myrrh-the-saviour',
       E'The gold, the incense, and the myrrh kept for the Saviour',
       E'Jared commits the cave''s treasure to the line: *take with you the body of our father Adam, and with it these three precious gifts and offerings, namely, the gold, the incense, and the myrrh; and let them be in the place where the body of our father Adam shall lay* (2 Adam & Eve 21:7). These three gifts, hoarded from the first generation against the coming of the Saviour, are the very three the magi will carry to His cradle: *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). It ain''t new — the gift was prepared at the dawn of the world. The incense itself echoes Enoch, who in the parallel witness *burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25), the same mountain-sanctuary worship the holy line keeps.',
       sv.verse_id, ev.verse_id, 'extras', 66503
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-word-of-elohim-salvation-middle-of-earth',
       E'The Word of Elohim shall come — salvation in the middle of the earth',
       E'Jared prophesies the Logos who will come to redeem: *And unto him of you who shall be left, 0 my sons, shall the Word of Elohim (God) come, and when he goes out of this land he shall take with him the body of our father Adam, and shall lay it in the middle of the earth, the place in which salvation shall be wrought* (2 Adam & Eve 21:8). The Word of Elohim who comes is the Logos by whom all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The promised coming arrives in the appointed fulness: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the place salvation is wrought is the place where the seed of the woman bruises the serpent: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new — the first fathers knew the Saviour was coming.',
       sv.verse_id, ev.verse_id, 'extras', 66506
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-noah-shem-ark-flood',
       E'Noah is the one left — Shem and the ark against the flood',
       E'Jared names the survivor of the holy line: *Thou art he that shall be left. And thou shalt take the body of our father Adam from the cave, and place it with thee in the ark when the flood comes* (2 Adam & Eve 21:10), and of Shem, *he it is who shall lay the body of our father Adam in the middle of the earth, in the place whence salvation shall come* (21:11). Noah preserved through the flood is the canon''s man of faith: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). Genesis records the very entry Jared foretells: *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood* (Genesis 7:7), and names Shem first among the sons: *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah* (Genesis 7:13). It ain''t new — the seed is carried alive through judgment to the place of salvation.',
       sv.verse_id, ev.verse_id, 'extras', 66509
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-jared-rest-enoch-ministers',
       E'Jared enters rest — Enoch ministers before the body of Adam',
       E'Jared charges Enoch to keep the cave-sanctuary — *Thou, my son, abide in this cave, and minister diligently before the body of our father Adam all the days of thy life; and feed thy people in righteousness and innocence* (2 Adam & Eve 21:12) — then *His hands were loosened, his eyes closed, and he entered into rest like his fathers* (21:13). Enoch''s faithful ministry before he is taken echoes the canon''s witness of him: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), confirmed in faith — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The parallel restored witness sets him as the priest-scribe on the Mount: *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men* (Jubilees 4:23). It ain''t new — the same Enoch who ministers in the cave is taken up to walk with Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 66512
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-21-keep-the-commandment-holy-mountain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The mingling that drew Seth''s children down off the holy mountain in 2 Adam & Eve 21:4 is Genesis'' sons-of-God taking the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Jared''s grief over the fallen children of Seth (21:4) looks straight onto the giant-bearing intermarriage Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The holy mountain-line Jared charges to keep the commandment (21:4) is the Seth-line that first called on the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Jared''s charge to set their hearts and keep Elohim''s commandment (21:7) guards the very seed of the woman the serpent has hunted from the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-gold-incense-myrrh-the-saviour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh Jared bids them keep (21:7) are the magi''s three gifts, prepared in the first age for the Saviour''s coming.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-gold-incense-myrrh-the-saviour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount. For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* The incense Jared lays up (21:7) is the same sanctuary-incense Enoch offered on the holy Mount.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-gold-incense-myrrh-the-saviour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-word-of-elohim-salvation-middle-of-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim Jared says will come to the one left (21:8) is the eternal Logos of John''s prologue.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to work salvation in the middle of the earth (21:8) is the Word made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The coming of the Word foretold in 21:8 is fulfilled when the fulness of time was come.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The place whence salvation shall come, where Shem lays Adam''s body (21:11), is where the woman''s seed bruises the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-noah-shem-ark-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The Noah Jared names as the one left, who bears Adam''s body into the ark (21:10), is the faith-Noah who prepared the ark to save his house.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-noah-shem-ark-flood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:7 — *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood.* The flood and the ark Jared foretells (21:10) is the very entry Genesis narrates.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-noah-shem-ark-flood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark;* Shem, whom Jared singles out to lay Adam''s body (21:11), enters the ark first-named among Noah''s sons.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-noah-shem-ark-flood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-jared-rest-enoch-ministers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Enoch charged to minister before Adam''s body all his days (21:12) is the Enoch who walked with Elohim until he was taken.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-jared-rest-enoch-ministers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s diligent ministry in the cave (21:12) is the pleasing-Elohim testimony that crowned his translation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-jared-rest-enoch-ministers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The Enoch set to minister before Adam''s body (21:12) is the same scribe-witness conducted into the Garden of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-jared-rest-enoch-ministers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2adameve_22.sql (session253 2-adam-eve 22) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae22 (view _session253_2ae22_lookup). Sort band base 66525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-22-enoch-translated
  ('adam-eve-conflict', '2-adam-eve', 22, 8, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Conflict''s transporting of Enoch from the mountain to the land of life is Moses'' "he was not, for Elohim took him" told from inside the cave.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 4, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s awareness through grace that Yahuah meant to remove him (22:4) is the same testimony of pleasing Elohim before the translation.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 9, 'enoch', '1-enoch', 12, 1, 'extras', E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* That Enoch was "out of the reach of death" (22:9) is the hidden, untraced abode of his own restored book.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 8, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The mansions of the righteous and Paradise of joy (22:8) is Jubilees'' Garden of Eden into which the angels conducted Enoch.'),
  -- thread: 2-adam-eve-22-enoch-celebrated-book
  ('adam-eve-conflict', '2-adam-eve', 22, 2, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The "celebrated book" of 22:2 is the very scroll Jude quotes as Scripture, the seventh from Adam prophesying.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 2, 'jubilees', 'jubilees', 4, 17, 'extras', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book... And he was the first to write a testimony.* Enoch who "wrote a celebrated book" (22:2) is Jubilees'' first man to write a testimony.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 2, 'jubilees', 'jubilees', 4, 19, 'extras', E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep, as it will happen to the children of men throughout their generations until the day of judgment; he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* The "many wonders" that may not be told here (22:2) are the visions Jubilees says he saw and wrote down.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 1, 'canon', 'genesis', 5, 22, 'free', E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters.* Enoch keeping the commandment and continuing to minister in the cave (22:1) is the walk with Elohim that Genesis measures in years.'),
  -- thread: 2-adam-eve-22-watch-over-your-souls
  ('adam-eve-conflict', '2-adam-eve', 22, 5, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Enoch''s foreknowledge that Elohim would bring the waters of the Flood and destroy creation (22:5) is the very sentence Yahuah speaks to Noah.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 7, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos; then began men to call upon the name of Yahuah (LORD).* To "hold fast by your fear of Elohim and by your service of Him, and worship Him in upright faith" (22:7) is the calling on the Name kept in the line of Seth — the way before the law.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 5, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The destroying flood Enoch foretells (22:5) is the judgment Jude reports the same Enoch prophesying upon all the ungodly.'),
  -- thread: 2-adam-eve-22-seth-mingled-with-cain
  ('adam-eve-conflict', '2-adam-eve', 22, 10, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The children of Seth going down to "fall into sin with the children of Cain" (22:10) is Genesis'' sons of Elohim taking the daughters of men.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 3, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* That Seth''s line "went astray and fell" toward Cain''s children (22:3) is the seed of the wicked one drawing in the seed kept righteous — the seed-war from the first murder.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 10, 'enoch', '1-enoch', 6, 6, 'extras', E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The descent from the holy mountain into sin (22:10) is mirrored by the Watchers'' own descent in the days of Jared in Enoch''s book.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 3, 'jubilees', 'jubilees', 4, 22, 'extras', E'Jubilees 4:22 — *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* The same Enoch who here grieves over Seth''s children falling (22:3) is the Enoch who, in Jubilees, testifies against the defiling union of the seed-lines.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-enoch-translated',
       E'Enoch Translated — He Was Not, For Elohim Took Him',
       E'Of the seventh from Adam this book says, *Enoch continued in his ministry before Yahuah (Lord) three hundred and eighty-five years, and at the end of that time he became aware through the grace of Elohim (God), that Elohim (God) intended to remove him from the earth* (2 Adam and Eve 22:4); and so it was that *Elohim (God) transported him from that mountain to the land of life, to the mansions of the righteous and of the chosen, the abode of Paradise of joy* (22:8). It ain''t new — Moses wrote it plainly: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and the witness of faith is sealed in the Renewed Covenant: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5). The restored book of Enoch keeps the same memory of the hidden one: *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him* (1 Enoch 12:1), and Jubilees: *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). One walk, one taking, witnessed in four scrolls.',
       sv.verse_id, ev.verse_id, 'extras', 66525
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-enoch-celebrated-book',
       E'The Celebrated Book and the Wonders of Enoch',
       E'The book lingers on the scribe of the cave: *It is this Enoch to whom many wonders happened, and who also wrote a celebrated book; but those wonders may not be told in this place* (2 Adam and Eve 22:2). It ain''t new — the apostle Jude reaches for that very book by name: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14), citing the words *To execute judgment upon all, and to convince all that are ungodly* (Jude 1:15). Jubilees remembers the same first author and the same wonders: *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven... and he was the first to write a testimony* (Jubilees 4:17); *And what was and what will be he saw in a vision of his sleep... he saw and understood everything, and wrote his testimony* (Jubilees 4:19). The celebrated book is no legend invented late — three witnesses name it.',
       sv.verse_id, ev.verse_id, 'extras', 66528
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-watch-over-your-souls',
       E'Watch Over Your Souls — Enoch''s Last Charge and the Coming Flood',
       E'Before he is taken, Enoch foretells the judgment and charges the holy remnant: *I know that Elohim (God) intends to bring the waters of the Flood upon the earth, and to destroy our creation* (2 Adam and Eve 22:5), and *Watch over your souls, and hold fast by your fear of Elohim (God) and by your service of Him, and worship Him in upright faith, and serve Him in righteousness, innocence and judgment, in repentance and also in purity* (22:7). It ain''t new — Yahuah Himself announces the same flood to Noah: *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die* (Genesis 6:17). The charge to fear and serve Him in repentance is the way kept before Sinai, when first *began men to call upon the name of Yahuah (LORD)* (Genesis 4:26); and the judgment Enoch foresees is the very word Jude reports him preaching: *To execute judgment upon all, and to convince all that are ungodly* (Jude 1:15).',
       sv.verse_id, ev.verse_id, 'extras', 66531
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-seth-mingled-with-cain',
       E'The Two Seed-Lines Mingle — Seth''s Children Fall to the Children of Cain',
       E'Here the long-guarded separation of the holy mountain breaks: *the children of Seth went astray and fell, they, their children and their wives* (2 Adam and Eve 22:3), until *not one of our fathers or of their children, remained on that holy mountain, except those three, Methuselah, Lamech, and Noah. For all the rest went down from the mountain and fell into sin with the children of Cain* (22:10). It ain''t new — this is Genesis 6 told from the mountain above: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). The mingling is the undoing of the seed-war separation that runs from the first murder: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). The restored scrolls set the same descent in the days of Jared: *who descended in the days of Yered (Jared) on the summit of Mount Hermon* (1 Enoch 6:6); and Enoch *testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men* (Jubilees 4:22). Election precedes confession; the covenant seed is kept in three men against the day of the ark.',
       sv.verse_id, ev.verse_id, 'extras', 66534
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-22-enoch-translated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Conflict''s transporting of Enoch from the mountain to the land of life is Moses'' "he was not, for Elohim took him" told from inside the cave.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s awareness through grace that Yahuah meant to remove him (22:4) is the same testimony of pleasing Elohim before the translation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* That Enoch was "out of the reach of death" (22:9) is the hidden, untraced abode of his own restored book.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The mansions of the righteous and Paradise of joy (22:8) is Jubilees'' Garden of Eden into which the angels conducted Enoch.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-22-enoch-celebrated-book
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The "celebrated book" of 22:2 is the very scroll Jude quotes as Scripture, the seventh from Adam prophesying.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book... And he was the first to write a testimony.* Enoch who "wrote a celebrated book" (22:2) is Jubilees'' first man to write a testimony.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep, as it will happen to the children of men throughout their generations until the day of judgment; he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* The "many wonders" that may not be told here (22:2) are the visions Jubilees says he saw and wrote down.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters.* Enoch keeping the commandment and continuing to minister in the cave (22:1) is the walk with Elohim that Genesis measures in years.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-22-watch-over-your-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Enoch''s foreknowledge that Elohim would bring the waters of the Flood and destroy creation (22:5) is the very sentence Yahuah speaks to Noah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-watch-over-your-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos; then began men to call upon the name of Yahuah (LORD).* To "hold fast by your fear of Elohim and by your service of Him, and worship Him in upright faith" (22:7) is the calling on the Name kept in the line of Seth — the way before the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-watch-over-your-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The destroying flood Enoch foretells (22:5) is the judgment Jude reports the same Enoch prophesying upon all the ungodly.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-watch-over-your-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-22-seth-mingled-with-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The children of Seth going down to "fall into sin with the children of Cain" (22:10) is Genesis'' sons of Elohim taking the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* That Seth''s line "went astray and fell" toward Cain''s children (22:3) is the seed of the wicked one drawing in the seed kept righteous — the seed-war from the first murder.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The descent from the holy mountain into sin (22:10) is mirrored by the Watchers'' own descent in the days of Jared in Enoch''s book.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:22 — *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* The same Enoch who here grieves over Seth''s children falling (22:3) is the Enoch who, in Jubilees, testifies against the defiling union of the seed-lines.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 2 Adam and Eve cross-references complete.'
