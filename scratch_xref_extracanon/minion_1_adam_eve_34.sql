-- ----- fragment: minion_1adameve_34.sql (session253 1-adam-eve 34) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae34 (view _session253_1ae34_lookup). Sort band base 64825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-34-formed-of-dust
  ('adam-eve-conflict', '1-adam-eve', 34, 5, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Adam''s prayer that Yahuah "created me out of one element, that of dust of the earth" simply hands the Genesis formation back to its Maker.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 5, 'canon', '1-corinthians', 15, 45, 'free', E'1 Corinthians 15:45 — *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit.* The dust-formed Adam of 34:5 is named by Sha''ul as the type whose ruin the last Adam undoes.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 5, 'canon', '1-corinthians', 15, 47, 'free', E'1 Corinthians 15:47 — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* Adam''s confession of being made from earth''s dust sets the very contrast Sha''ul draws against the heavenly Man.'),
  -- thread: 1-adam-eve-34-naming-the-beasts
  ('adam-eve-conflict', '1-adam-eve', 34, 8, 'canon', 'genesis', 2, 19, 'free', E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Adam''s plea that Yahuah "brought to me all beasts... that I should name them all" recounts this very bringing.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 9, 'canon', 'genesis', 2, 20, 'free', E'Genesis 2:20 — *And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.* The dominion Adam mourns as now "estranged from me" in 34:9 is the naming-dominion Genesis records him exercising.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 8, 'jubilees', 'jubilees', 3, 2, 'extras', E'Jubilees 3:2 — *And Adam named them all by their respective names, and as he called them, so was their name.* The restored Jubilees carries the same naming Adam rehearses in 34:8, the primeval history shared across the library.'),
  -- thread: 1-adam-eve-34-tree-and-death
  ('adam-eve-conflict', '1-adam-eve', 34, 10, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Adam''s quoted command, "When you eat of it, of death you shall die," is this Genesis word spoken back to Yahuah in 34:10.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 11, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Adam''s wonder that he was not struck dead at once (34:11) is the same death-by-one-man Sha''ul traces from this transgression.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 11, 'canon', 'romans', 5, 14, 'free', E'Romans 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.* The death Adam expected in 34:11 reigns onward, yet Adam himself is named the figure of the coming Seed.'),
  -- thread: 1-adam-eve-34-rib-and-woman
  ('adam-eve-conflict', '1-adam-eve', 34, 13, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof;* Adam''s memory of the "slumber and a sleep" and the rib drawn from his side in 34:13 is this Genesis act recounted.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 14, 'canon', 'genesis', 2, 23, 'free', E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Adam''s words in 34:14, "bone of my bones, and flesh of my flesh," are this Genesis cry repeated in his prayer.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 14, 'jubilees', 'jubilees', 3, 5, 'extras', E'Jubilees 3:5 — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs, and this rib was the origin of the woman from amongst his ribs, and He built up the flesh in its stead, and built the woman.* The restored Jubilees keeps the same rib-drawn-in-sleep that Adam rehearses in 34:14.'),
  -- thread: 1-adam-eve-34-bright-nature-lost
  ('adam-eve-conflict', '1-adam-eve', 34, 17, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Adam''s lament that "You have brought us out into a strange land" in 34:17 is this expulsion remembered from outside the gate.'),
  ('adam-eve-conflict', '1-adam-eve', 34, 17, 'canon', 'romans', 5, 15, 'free', E'Romans 5:15 — *But not as the offence, so also is the free gift. For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many.* The transgression that stripped Adam''s grace in 34:17 is the one offence Sha''ul sets against the abounding gift of the promised Seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-34-formed-of-dust',
       E'Created out of the dust of the earth',
       E'Adam, lean and parched outside the garden, rehearses his own making before Yahuah: *Then You spread Your hand and created me out of one element, that of dust of the earth; and You brought me into the garden at the third hour, on a Friday, and informed me of it in the cave.* This is the Genesis account told back to its Author — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). Sha''ul sees in that first dust-formed man the figure of the One to come: *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit.* (1 Corinthians 15:45) — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* (1 Corinthians 15:47). The dust that bore the curse waits for the Seed who would raise it. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64825
  FROM _session253_1ae34_lookup sv, _session253_1ae34_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=34 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-34-naming-the-beasts',
       E'He named all the beasts, now estranged from him',
       E'Adam recalls the dominion he held and has lost: *Then, again, O Yahuah (Lord), in that third hour in which You created me, You brought to me all beasts, and lions, and ostriches, and fowls of the air, and all things that move in the earth... And Your will was that I should name them all, one by one, with a suitable name... But now they are all estranged from me.* This is Eden''s naming remembered from exile — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* (Genesis 2:19). Jubilees keeps the same scene among the restored books — *And Adam named them all by their respective names, and as he called them, so was their name.* (Jubilees 3:2). The dominion forfeited in the garden is the dominion the Seed of the woman comes to restore. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64828
  FROM _session253_1ae34_lookup sv, _session253_1ae34_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=34 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-34-tree-and-death',
       E'The commandment of the tree, and death you shall die',
       E'Adam remembers the single prohibition and the sentence attached to it: *Then it was in that third hour of Friday... and commanded me concerning the tree, to which I was neither to go near, nor to eat thereof; for You said to me in the garden, ''When you eat of it, of death you shall die.''* This is the word of Genesis — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17). Adam marvels that mercy stayed the stroke: *And if You had punished me as You said, with death, I should have died that very moment.* Sha''ul names the law that bound them all: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12) — yet death reigning from this very Adam *who is the figure of him that was to come.* (Romans 5:14). The deferred death of 34:11 is already mercy reaching toward the Seed. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64831
  FROM _session253_1ae34_lookup sv, _session253_1ae34_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=34 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-34-rib-and-woman',
       E'The deep sleep, the rib, bone of my bones',
       E'Adam recalls the making of Eve, that she was drawn from him while he slept: *Then, at the end of the third hour of that Friday, O Yahuah (Lord), You caused a slumber and a sleep to come over me, and I slept... Then You drew a rib out of my side, and created it after my own likeness and image. Then I awoke; and when I saw her and knew who she was, I said, ''This is bone of my bones, and flesh of my flesh.''* Genesis tells it the same — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof* (Genesis 2:21) — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* (Genesis 2:23). Jubilees, among the restored books, keeps the very words — *And He awaked Adam out of his sleep... and said to her: "This is now bone of my bones and flesh of my flesh."* (Jubilees 3:5-6). One witness across the whole library. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64834
  FROM _session253_1ae34_lookup sv, _session253_1ae34_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=13
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=34 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-34-bright-nature-lost',
       E'The bright nature and the Spirit, lost by transgression',
       E'Adam contrasts the glory in which they were made with the misery of exile: *And of Your goodwill, O Yahuah (Lord), You made us both with bodies of a bright nature, and You made us two, one; and You gave us Your grace, and filled us with praises of the Ruach HaKodesh (Holy Spirit); that we should be neither hungry nor thirsty... But now, O Elohim (God), since we transgressed Your commandment and broke Your law, You have brought us out into a strange land, and have caused suffering, and faintness, hunger and thirst to come over us.* The breaking of one command threw open all this sorrow — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* (Genesis 3:23). Yet where the offence abounded the promise abounds more — *But not as the offence, so also is the free gift. For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many.* (Romans 5:15). The grace and Spirit Adam mourns as lost in 34:16-17 are the very grace the Seed restores. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64837
  FROM _session253_1ae34_lookup sv, _session253_1ae34_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=16
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=34 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-34-formed-of-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Adam''s prayer that Yahuah "created me out of one element, that of dust of the earth" simply hands the Genesis formation back to its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-formed-of-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:45 — *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit.* The dust-formed Adam of 34:5 is named by Sha''ul as the type whose ruin the last Adam undoes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-formed-of-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:47 — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* Adam''s confession of being made from earth''s dust sets the very contrast Sha''ul draws against the heavenly Man.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-formed-of-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-34-naming-the-beasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Adam''s plea that Yahuah "brought to me all beasts... that I should name them all" recounts this very bringing.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-naming-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:20 — *And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.* The dominion Adam mourns as now "estranged from me" in 34:9 is the naming-dominion Genesis records him exercising.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-naming-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:2 — *And Adam named them all by their respective names, and as he called them, so was their name.* The restored Jubilees carries the same naming Adam rehearses in 34:8, the primeval history shared across the library.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-naming-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-34-tree-and-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Adam''s quoted command, "When you eat of it, of death you shall die," is this Genesis word spoken back to Yahuah in 34:10.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-tree-and-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Adam''s wonder that he was not struck dead at once (34:11) is the same death-by-one-man Sha''ul traces from this transgression.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-tree-and-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.* The death Adam expected in 34:11 reigns onward, yet Adam himself is named the figure of the coming Seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-tree-and-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-34-rib-and-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof;* Adam''s memory of the "slumber and a sleep" and the rib drawn from his side in 34:13 is this Genesis act recounted.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-rib-and-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Adam''s words in 34:14, "bone of my bones, and flesh of my flesh," are this Genesis cry repeated in his prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-rib-and-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:5 — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs, and this rib was the origin of the woman from amongst his ribs, and He built up the flesh in its stead, and built the woman.* The restored Jubilees keeps the same rib-drawn-in-sleep that Adam rehearses in 34:14.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-rib-and-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-34-bright-nature-lost
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Adam''s lament that "You have brought us out into a strange land" in 34:17 is this expulsion remembered from outside the gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-bright-nature-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:15 — *But not as the offence, so also is the free gift. For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many.* The transgression that stripped Adam''s grace in 34:17 is the one offence Sha''ul sets against the abounding gift of the promised Seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae34_lookup sv, _session253_1ae34_lookup tv
 WHERE t.slug='1-adam-eve-34-bright-nature-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=34 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

