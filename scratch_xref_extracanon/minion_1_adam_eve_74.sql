-- ----- fragment: minion_1adameve_74.sql (session253 1-adam-eve 74) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch74. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae74 (view _session253_1ae74_lookup). Sort band base 65825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae74_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-74-in-sorrow-bring-forth
  ('adam-eve-conflict', '1-adam-eve', 74, 3, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The narrator names this very sentence as the word being fulfilled in Eve''s hard labour at 1-adam-eve 74:3.'),
  ('adam-eve-conflict', '1-adam-eve', 74, 4, 'canon', 'genesis', 4, 1, 'free', E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* The brief Genesis notice of the first conception is unfolded here into Adam''s prayer and Eve''s deliverance at 1-adam-eve 74:4-5.'),
  -- thread: 1-adam-eve-74-cain-the-hater-seed-war
  ('adam-eve-conflict', '1-adam-eve', 74, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The enmity decreed at Eden''s gate already burns in the womb when Cain hates his sister before birth at 1-adam-eve 74:7.'),
  ('adam-eve-conflict', '1-adam-eve', 74, 7, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* John names the line Cain belongs to, confirming the hatred that 1-adam-eve 74:7 traces back to the womb.'),
  ('adam-eve-conflict', '1-adam-eve', 74, 5, 'jubilees', 'jubilees', 4, 1, 'extras', E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* The parallel primeval record keeps the same sequence — Cain first, then a daughter — matching the first-born son and daughter of 1-adam-eve 74:5.'),
  -- thread: 1-adam-eve-74-two-lines-cain-and-the-keeper
  ('adam-eve-conflict', '1-adam-eve', 74, 7, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude makes Cain a whole "way" — a lineage of works — which the womb-hatred named at 1-adam-eve 74:7 begins.'),
  ('adam-eve-conflict', '1-adam-eve', 74, 8, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Against Cain the hater stands the righteous offerer, the parting of the two lines latent in the children of 1-adam-eve 74:6-8.'),
  -- thread: 1-adam-eve-74-offering-for-the-children
  ('adam-eve-conflict', '1-adam-eve', 74, 9, 'canon', 'genesis', 4, 3, 'free', E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* The offering Adam makes for his children at 1-adam-eve 74:9 is the same altar-practice his children will keep, the way kept before Sinai.'),
  ('adam-eve-conflict', '1-adam-eve', 74, 9, 'jubilees', 'jubilees', 3, 27, 'extras', E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* The parallel record shows Adam already an offerer from the day he left Eden, the same priestly hand that offers for the children at 1-adam-eve 74:9.'),
  ('adam-eve-conflict', '1-adam-eve', 74, 9, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s offering for his newborns at 1-adam-eve 74:9 belongs to the same calling-on-the-Name that marks the covenant line from the first.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae74_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae74_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-74-in-sorrow-bring-forth',
       E'In sorrow shall you bring forth — the Eden sentence fulfilled outside the garden',
       E'Eve''s first labour, far from the cave of treasures, fulfils to the letter the word spoken at the gate of Eden. *When the time came for her to give birth, she strained a lot. Adam felt sorry, and he was very worried about her because she was close to death and the words of Elohim (God) to her were being fulfilled: "In suffering shall you bear a child, and in sorrow shall you bring forth a child."* (1-adam-eve 74:3). It ain''t new — the sentence was passed already: *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* (Genesis 3:16). Yet the same Yahuah who pronounced the sorrow hears Adam''s cry and delivers her — mercy travels with the curse. *And Elohim (God) looked at His maid-servant Eve, and delivered her, and she gave birth to her first-born son, and with him a daughter.* (1-adam-eve 74:5).',
       sv.verse_id, ev.verse_id, 'extras', 65825
  FROM _session253_1ae74_lookup sv, _session253_1ae74_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=74 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-74-cain-the-hater-seed-war',
       E'Cain the hater — the seed-war shows its face in the first child',
       E'The first child born outside Eden is named for the hatred already in him. *The meaning of Cain is "hater," because he hated his sister in their mother''s womb; before they came out of it. Therefore Adam named him Cain.* (1-adam-eve 74:7). The enmity put between the seeds at the gate of the garden is not a thing of the future — it is in the womb. *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The other primeval witnesses keep the same order — Cain first, then Abel, then a daughter: *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* (Jubilees 4:1). And the apostle reads Cain back to its true father: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12).',
       sv.verse_id, ev.verse_id, 'extras', 65828
  FROM _session253_1ae74_lookup sv, _session253_1ae74_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=74 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-74-two-lines-cain-and-the-keeper',
       E'Two works, two lines — the hater and the righteous brother foretold',
       E'Cain named "hater" before he draws a second breath foreshadows the first murder and the parting of the two seed-lines. *The meaning of Cain is "hater," because he hated his sister in their mother''s womb; before they came out of it. Therefore Adam named him Cain.* (1-adam-eve 74:7). Scripture later sets his works against his brother''s: *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* (Jude 1:11) — "the way of Cain" is a road, a lineage of works. Over against it stands the witness of faith: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* (Hebrews 11:4). The serpent''s striker and the woman''s seed are present in the cradle.',
       sv.verse_id, ev.verse_id, 'extras', 65831
  FROM _session253_1ae74_lookup sv, _session253_1ae74_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=74 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-74-offering-for-the-children',
       E'An offering for the children — the way kept before Sinai',
       E'Forty days after the birth, Adam sets an offering for his children — the sacrifices of the covenant line, kept generations before the mountain. *Then Adam and Eve waited until Cain and his sister were forty days old, when Adam said to Eve, "We will make an offering and offer it up in behalf of the children."* (1-adam-eve 74:9). This is the same Adam who, leaving Eden, kept the sweet savour: *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* (Jubilees 3:27). The children he offers for will themselves bring offerings — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* (Genesis 4:3) — and the Name kept by this line is the same Name men called upon from the beginning: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26).',
       sv.verse_id, ev.verse_id, 'extras', 65834
  FROM _session253_1ae74_lookup sv, _session253_1ae74_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=74 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-74-in-sorrow-bring-forth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The narrator names this very sentence as the word being fulfilled in Eve''s hard labour at 1-adam-eve 74:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-in-sorrow-bring-forth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* The brief Genesis notice of the first conception is unfolded here into Adam''s prayer and Eve''s deliverance at 1-adam-eve 74:4-5.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-in-sorrow-bring-forth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-74-cain-the-hater-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The enmity decreed at Eden''s gate already burns in the womb when Cain hates his sister before birth at 1-adam-eve 74:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-cain-the-hater-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* John names the line Cain belongs to, confirming the hatred that 1-adam-eve 74:7 traces back to the womb.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-cain-the-hater-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* The parallel primeval record keeps the same sequence — Cain first, then a daughter — matching the first-born son and daughter of 1-adam-eve 74:5.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-cain-the-hater-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-74-two-lines-cain-and-the-keeper
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude makes Cain a whole "way" — a lineage of works — which the womb-hatred named at 1-adam-eve 74:7 begins.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-two-lines-cain-and-the-keeper'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Against Cain the hater stands the righteous offerer, the parting of the two lines latent in the children of 1-adam-eve 74:6-8.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-two-lines-cain-and-the-keeper'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-74-offering-for-the-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* The offering Adam makes for his children at 1-adam-eve 74:9 is the same altar-practice his children will keep, the way kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-offering-for-the-children'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* The parallel record shows Adam already an offerer from the day he left Eden, the same priestly hand that offers for the children at 1-adam-eve 74:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-offering-for-the-children'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s offering for his newborns at 1-adam-eve 74:9 belongs to the same calling-on-the-Name that marks the covenant line from the first.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae74_lookup sv, _session253_1ae74_lookup tv
 WHERE t.slug='1-adam-eve-74-offering-for-the-children'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=74 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

