-- ----- fragment: minion_1adameve_38.sql (session253 1-adam-eve 38) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae38 (view _session253_1ae38_lookup). Sort band base 64925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-38-word-comes-5500-years
  ('adam-eve-conflict', '1-adam-eve', 38, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes to speak with Adam in 1-adam-eve 38:1 is the eternal Logos, with Elohim and Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The 5500-year promise of 1-adam-eve 38:2 is fulfilled when this same Word takes flesh to save Adam''s seed.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 1, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to Adam in 1-adam-eve 38:1 is the first of those manifold speakings to the fathers fulfilled at last in the Son.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour pledged for the end of the 5500 years in 1-adam-eve 38:2 was already foreordained before the world was.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The fulfilled 5500 years of 1-adam-eve 38:2 is the fulness of time when the promised Son is sent.'),
  -- thread: 1-adam-eve-38-tree-of-life-withheld-then-given
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The fruit Adam asks for in 1-adam-eve 38:2 is this same Tree of Life set in the midst of Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', 'genesis', 3, 22, 'free', E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* The Word''s "not now" in 1-adam-eve 38:2 echoes the barring of fallen Adam from the tree of life.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The deferred fruit of 1-adam-eve 38:2 is the overcomer''s reward when paradise is restored.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The eating-and-living-forever pledged to Adam''s righteous descendants in 1-adam-eve 38:2 belongs to those who keep the commandments.'),
  -- thread: 1-adam-eve-38-five-thousand-five-hundred-years
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'canon', '2-peter', 3, 8, 'free', E'2 Peter 3:8 — *But, beloved, be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day.* The 5500-year count of 1-adam-eve 38:2 is reckoned by this day-for-a-thousand-years measure pointing to the Saviour''s day.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 2, 'jubilees', 'jubilees', 4, 30, 'extras', E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: “On the day that you eat thereof you will die.” For this reason he did not complete the years of this day; for he died during it.* The same day-as-a-thousand-years testimony of the heavens stands behind the 5500-year promise of 1-adam-eve 38:2.'),
  -- thread: 1-adam-eve-38-endure-until-the-covenant
  ('adam-eve-conflict', '1-adam-eve', 38, 5, 'canon', '2-corinthians', 1, 20, 'free', E'2 Corinthians 1:20 — *For all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us.* The hope the Word promises not to disappoint in 1-adam-eve 38:5 is sure because all His promises are Yea and Amen in the Son.'),
  ('adam-eve-conflict', '1-adam-eve', 38, 5, 'canon', 'hebrews', 8, 6, 'free', E'Hebrews 8:6 — *But now hath he obtained a more excellent ministry, by how much also he is the mediator of a better covenant, which was established upon better promises.* The covenant Adam is told to endure for in 1-adam-eve 38:5 is the better covenant the coming Mediator establishes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-38-word-comes-5500-years',
       E'The Word of Elohim comes and promises the Saviour after the 5500 years',
       E'The very Word who made the worlds comes down to comfort fallen Adam, and the comfort He gives is Himself: *"After these things the Word of Elohim (God) came to Adam, and said to him"* (1-adam-eve 38:1), promising that *"only when the 5500 years are fulfilled... I will give you fruit from the Tree of Life, and you will eat, and live forever"* (1-adam-eve 38:2). It ain''t new — this is the Logos of the prologue, the One *"In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)"* (John 1:1), who would in due time be *"made flesh, and dwelt among us"* (John 1:14). The 5500-year promise is the foreordained incarnation, for He *"who at sundry times and in divers manners spake in time past unto the fathers by the prophets"* (Hebrews 1:1) was *"foreordained before the foundation of the world, but was manifest in these last times for you"* (1 Peter 1:20), and at the appointed hour *"when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law"* (Galatians 4:4). From the first day outside the garden the Word is already the Saviour-to-come.',
       sv.verse_id, ev.verse_id, 'extras', 64925
  FROM _session253_1ae38_lookup sv, _session253_1ae38_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=38 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-38-tree-of-life-withheld-then-given',
       E'The Tree of Life withheld now, given when the years are fulfilled',
       E'Adam begs for the Tree of Life, and the Word does not deny but defers it: *"O Adam, as to the fruit on the Tree of Life that you have asked for, I will not give it to you now, but only when the 5500 years are fulfilled. At that time I will give you fruit from the Tree of Life, and you will eat, and live forever, you, and Eve, and your righteous descendants"* (1-adam-eve 38:2). This is the very tree Genesis set in the garden — *"the tree of life also in the midst of the garden"* (Genesis 2:9) — from which fallen man was barred, for Yahuah drove him out *"lest he put forth his hand, and take also of the tree of life, and eat, and live for ever"* (Genesis 3:22). What was sealed by the flaming sword is reopened at the end of the age: the overcomer is told *"To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)"* (Revelation 2:7), and the regathered are blessed who *"do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city"* (Revelation 22:14). The promise to Adam is the promise of paradise restored.',
       sv.verse_id, ev.verse_id, 'extras', 64928
  FROM _session253_1ae38_lookup sv, _session253_1ae38_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=38 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-38-five-thousand-five-hundred-years',
       E'The 5500 years — a thousand years as a day',
       E'The whole comfort hangs on a span of time — *"only when the 5500 years are fulfilled"* (1-adam-eve 38:2) — and the days of the fall are weighed against it: *"these forty-three days cannot make amends for the hour in which you transgressed My commandment"* (1-adam-eve 38:3). The reckoning is the day-for-a-thousand-years measure of the heavens, for *"one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day"* (2 Peter 3:8). The book of Jubilees reads Adam''s own death by that same measure: *"one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge"* (Jubilees 4:30). It ain''t new — the 5500-year prophecy of the incarnation is the primeval church''s count of the Day toward which all the fathers waited.',
       sv.verse_id, ev.verse_id, 'extras', 64931
  FROM _session253_1ae38_lookup sv, _session253_1ae38_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=38 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-38-endure-until-the-covenant',
       E'Endure until the covenant is fulfilled — the surety of the promise',
       E'The Word seals the comfort with covenant faithfulness: *"I will not deny your request, neither will I disappoint your hope; therefore, endure until the fulfillment of the covenant I made with you"* (1-adam-eve 38:5). Every pledge of Elohim is sure in the One who is coming, for *"all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us"* (2 Corinthians 1:20). The covenant Adam is told to endure for is the better covenant the Saviour Himself mediates, He who *"obtained a more excellent ministry, by how much also he is the mediator of a better covenant, which was established upon better promises"* (Hebrews 8:6). Yahuah''s mercy keeps the seed from the first day, never law-as-curse but a hope undisappointed.',
       sv.verse_id, ev.verse_id, 'extras', 64934
  FROM _session253_1ae38_lookup sv, _session253_1ae38_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=38 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-38-word-comes-5500-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes to speak with Adam in 1-adam-eve 38:1 is the eternal Logos, with Elohim and Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-word-comes-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The 5500-year promise of 1-adam-eve 38:2 is fulfilled when this same Word takes flesh to save Adam''s seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-word-comes-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to Adam in 1-adam-eve 38:1 is the first of those manifold speakings to the fathers fulfilled at last in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-word-comes-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour pledged for the end of the 5500 years in 1-adam-eve 38:2 was already foreordained before the world was.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-word-comes-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The fulfilled 5500 years of 1-adam-eve 38:2 is the fulness of time when the promised Son is sent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-word-comes-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-38-tree-of-life-withheld-then-given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The fruit Adam asks for in 1-adam-eve 38:2 is this same Tree of Life set in the midst of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-tree-of-life-withheld-then-given'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:22 — *And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever:* The Word''s "not now" in 1-adam-eve 38:2 echoes the barring of fallen Adam from the tree of life.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-tree-of-life-withheld-then-given'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The deferred fruit of 1-adam-eve 38:2 is the overcomer''s reward when paradise is restored.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-tree-of-life-withheld-then-given'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The eating-and-living-forever pledged to Adam''s righteous descendants in 1-adam-eve 38:2 belongs to those who keep the commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-tree-of-life-withheld-then-given'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-38-five-thousand-five-hundred-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 3:8 — *But, beloved, be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day.* The 5500-year count of 1-adam-eve 38:2 is reckoned by this day-for-a-thousand-years measure pointing to the Saviour''s day.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-five-thousand-five-hundred-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: “On the day that you eat thereof you will die.” For this reason he did not complete the years of this day; for he died during it.* The same day-as-a-thousand-years testimony of the heavens stands behind the 5500-year promise of 1-adam-eve 38:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-five-thousand-five-hundred-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-38-endure-until-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 1:20 — *For all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us.* The hope the Word promises not to disappoint in 1-adam-eve 38:5 is sure because all His promises are Yea and Amen in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-endure-until-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 8:6 — *But now hath he obtained a more excellent ministry, by how much also he is the mediator of a better covenant, which was established upon better promises.* The covenant Adam is told to endure for in 1-adam-eve 38:5 is the better covenant the coming Mediator establishes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae38_lookup sv, _session253_1ae38_lookup tv
 WHERE t.slug='1-adam-eve-38-endure-until-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=38 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

