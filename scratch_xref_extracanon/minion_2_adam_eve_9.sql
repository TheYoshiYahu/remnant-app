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

