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

