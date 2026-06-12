-- ----- fragment: minion_1adameve_77.sql (session253 1-adam-eve 77) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch77. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae77 (view _session253_1ae77_lookup). Sort band base 65900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae77_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-77-two-offerings
  ('adam-eve-conflict', '1-adam-eve', 77, 1, 'canon', 'genesis', 4, 3, 'free', E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* The canon records the very offering Adam here commands of his sons.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 2, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Abel obeys the father''s charge of 77:2 with the firstlings of his flock.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 1, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The altar Adam teaches his sons is the same one Noah will build — the way of offering is unbroken from Eden to the ark.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 2, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The forgiveness Adam seeks in 77:2 is sought by calling on the same Name the holy line will keep.'),
  -- thread: 1-adam-eve-77-abel-good-heart
  ('adam-eve-conflict', '1-adam-eve', 77, 5, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The good heart of 77:5 is exactly the faith for which the canon crowns Abel righteous.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 5, 'canon', '1-samuel', 16, 7, 'free', E'1 Samuel 16:7 — *But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* Yahuah looks on Abel''s heart in 77:5, not on the size of the gift.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 4, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The acceptance Adam and Eve pray for in 77:4 is granted in the canon''s word that Yahuah had respect unto Abel.'),
  -- thread: 1-adam-eve-77-cain-grudging-altar
  ('adam-eve-conflict', '1-adam-eve', 77, 8, 'canon', 'proverbs', 15, 8, 'free', E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* Cain''s grudging gift in 77:7-8 is the sacrifice of the wicked that Yahuah refuses.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 7, 'canon', 'genesis', 4, 5, 'free', E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* The unaccepted gift of 77:7-8 is the canon''s word that Yahuah had no respect unto Cain''s offering.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 8, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The murderous thoughts already in Cain''s heart at the altar in 77:8 ripen into the slaying Jubilees records.'),
  -- thread: 1-adam-eve-77-cain-hated-brother
  ('adam-eve-conflict', '1-adam-eve', 77, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The hatred Adam sees in 77:1 is the serpent''s seed striking at the woman''s — Cain of the wicked one, Abel the righteous.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 8, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Cain''s murderous heart at the altar in 77:8 becomes the proverbial "way of Cain" Jude warns against.'),
  ('adam-eve-conflict', '1-adam-eve', 77, 5, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Messiah names the Abel of 77:5 — the pure-hearted offerer — as the first righteous blood, head of the line of slain witnesses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae77_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae77_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-77-two-offerings',
       E'Take of the fruits of your sowing and make an offering',
       E'Adam, grieved that *the older brother hated the younger,* teaches both sons the way of the altar: *"O my son, take of the fruits of your sowing and make an offering to Elohim (God), so that He might forgive you for your wickedness and sin"* (1 Adam and Eve 77:1). It ain''t new — the offering for sin is kept from the first family outside Eden, long before Sinai. Genesis gives the same scene plainly: *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD). And Abel, he also brought of the firstlings of his flock and of the fat thereof* (Genesis 4:3-4). The altar itself is the covenant''s oldest furniture: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar* (Genesis 8:20). Adam''s house already calls on the Name — the same Name his line will keep: *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26).',
       sv.verse_id, ev.verse_id, 'extras', 65900
  FROM _session253_1ae77_lookup sv, _session253_1ae77_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=77 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-77-abel-good-heart',
       E'Because of his good heart and pure body — no trace of guile',
       E'Abel obeys at once — *"Come with me and show me how to offer it up"* (1 Adam and Eve 77:3) — and *Elohim (God) was more pleased with Abel than with his offering, because of his good heart and pure body. There was no trace of guile in him* (1 Adam and Eve 77:5). The gift is received because the heart is received first. So Hebrews names Abel the firstborn of faith: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). Yahuah''s measure has never been the outward gift but the inward man: *for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7).',
       sv.verse_id, ev.verse_id, 'extras', 65903
  FROM _session253_1ae77_lookup sv, _session253_1ae77_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=77 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-77-cain-grudging-altar',
       E'His eyes were on the lamb — the sacrifice of the wicked',
       E'Cain comes to the altar only under compulsion: *he did not want to make an offering, but after his father became very angry, he offered up a gift once. He took the smallest of his sheep for an offering and when he offered it up, his eyes were on the lamb. Therefore Elohim (God) did not accept his offering, because his heart was full of murderous thoughts* (1 Adam and Eve 77:7-8). The grudging gift with the grudging heart is the very thing Scripture calls abomination: *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8). Genesis records the same refusal and the falling face: *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell* (Genesis 4:5).',
       sv.verse_id, ev.verse_id, 'extras', 65906
  FROM _session253_1ae77_lookup sv, _session253_1ae77_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=77 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-77-cain-hated-brother',
       E'The older brother hated the younger — Cain of the wicked one',
       E'The chapter opens with the wound that drives the whole scene: *Adam saw that the older brother hated the younger* (1 Adam and Eve 77:1), and ends with the heart *full of murderous thoughts* (1 Adam and Eve 77:8). This is the seed-war in the very first brothers — election precedes confession, and the line of the woman is hated by the line of the serpent. John names it: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). Jude marks Cain''s road as a warning forever: *Woe unto them! for they have gone in the way of Cain* (Jude 1:11). And Messiah Himself reaches back to this altar, naming Abel the first martyr-prophet: *from the blood of righteous Abel unto the blood of Zacharias son of Barachias* (Matthew 23:35).',
       sv.verse_id, ev.verse_id, 'extras', 65909
  FROM _session253_1ae77_lookup sv, _session253_1ae77_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=77 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-77-two-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* The canon records the very offering Adam here commands of his sons.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-two-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Abel obeys the father''s charge of 77:2 with the firstlings of his flock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-two-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The altar Adam teaches his sons is the same one Noah will build — the way of offering is unbroken from Eden to the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-two-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The forgiveness Adam seeks in 77:2 is sought by calling on the same Name the holy line will keep.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-two-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-77-abel-good-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The good heart of 77:5 is exactly the faith for which the canon crowns Abel righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-abel-good-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 16:7 — *But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* Yahuah looks on Abel''s heart in 77:5, not on the size of the gift.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-abel-good-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The acceptance Adam and Eve pray for in 77:4 is granted in the canon''s word that Yahuah had respect unto Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-abel-good-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-77-cain-grudging-altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* Cain''s grudging gift in 77:7-8 is the sacrifice of the wicked that Yahuah refuses.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-cain-grudging-altar'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* The unaccepted gift of 77:7-8 is the canon''s word that Yahuah had no respect unto Cain''s offering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-cain-grudging-altar'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The murderous thoughts already in Cain''s heart at the altar in 77:8 ripen into the slaying Jubilees records.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-cain-grudging-altar'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-77-cain-hated-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The hatred Adam sees in 77:1 is the serpent''s seed striking at the woman''s — Cain of the wicked one, Abel the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-cain-hated-brother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Cain''s murderous heart at the altar in 77:8 becomes the proverbial "way of Cain" Jude warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-cain-hated-brother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Messiah names the Abel of 77:5 — the pure-hearted offerer — as the first righteous blood, head of the line of slain witnesses.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae77_lookup sv, _session253_1ae77_lookup tv
 WHERE t.slug='1-adam-eve-77-cain-hated-brother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=77 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

