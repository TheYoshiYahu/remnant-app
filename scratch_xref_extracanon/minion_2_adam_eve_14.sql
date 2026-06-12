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

