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

