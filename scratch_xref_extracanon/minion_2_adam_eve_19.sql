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

