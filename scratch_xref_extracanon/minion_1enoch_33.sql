-- ----- fragment: minion_1enoch_33.sql (session250 1-enoch 33) -----
-- Source anchor: enoch/1-enoch ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en33 (view _session250_en33_lookup). Sort band base 50800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-33-portals-sun-moon
  ('enoch', '1-enoch', 33, 3, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The sun and moon Enoch watches passing through the portals were appointed at creation for signs and seasons — the moedim.'),
  ('enoch', '1-enoch', 33, 3, 'canon', 'psalms', 19, 5, 'free', E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The sun that rises from Enoch''s eastern portals is the same sun the psalmist sees set on its joyful, fixed course.'),
  ('enoch', '1-enoch', 33, 2, 'canon', 'psalms', 19, 6, 'free', E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun''s going-forth from the end of heaven and its full circuit is exactly the gate-to-gate transit Enoch witnesses at the ends of the earth.'),
  ('enoch', '1-enoch', 33, 3, 'enoch', '1-enoch', 72, 3, 'extras', E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* The Astronomical Book opens by repeating this very vision, confirming the twelve portals Enoch first glimpses here in chapter 33.'),
  ('enoch', '1-enoch', 33, 3, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The same lights that pass through Enoch''s portals are the appointed keepers of the feasts and jubilees — the calendar of Torah set in the heavens.'),
  -- thread: 1-enoch-33-stars-keep-their-order
  ('enoch', '1-enoch', 33, 5, 'enoch', '1-enoch', 2, 1, 'extras', E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* Enoch''s opening summons to watch the unchanging order of the lights is precisely what he now sees fulfilled at the gates — the stars that do not change their course.'),
  ('enoch', '1-enoch', 33, 5, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The sun and moon that keep their order in Enoch''s portals are the appointed timekeepers the psalmist praises — the sun that knows its own setting.'),
  ('enoch', '1-enoch', 33, 5, 'canon', 'job', 38, 32, 'free', E'Job 38:32 — *Canst thou bring forth Mazzaroth in his season? or canst thou guide Arcturus with his sons?* The fixed courses Enoch marvels at belong to the Creator who alone leads the constellations out in their season.'),
  -- thread: 1-enoch-33-trees-of-paradise
  ('enoch', '1-enoch', 33, 10, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The trees of paradise Enoch sees in the north are the very trees of Eden, the tree of life among them.'),
  ('enoch', '1-enoch', 33, 10, 'enoch', '1-enoch', 24, 4, 'extras', E'1 Enoch 24:4 — *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* The fragrant trees of paradise here echo the throne-mountain tree of life Enoch had already smelled, the undying tree reserved for the righteous.'),
  ('enoch', '1-enoch', 33, 10, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The paradise Enoch sees kept in the north is restored at the centre of the New Jerusalem, the tree of life bearing fruit every month.'),
  ('enoch', '1-enoch', 33, 10, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s ever-fruitful trees beside the sanctuary river are the same paradise trees whose leaves wither not — Eden flowing out from the centre.'),
  -- thread: 1-enoch-33-treasuries-ordered-by-wisdom
  ('enoch', '1-enoch', 33, 11, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The very treasuries of snow and hail Enoch is shown are the storehouses Yahuah set before Job as proof of His unsearchable order.'),
  ('enoch', '1-enoch', 33, 12, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The treasuries of all the winds Enoch sees at the ends of the earth are the same storehouses the psalmist says Yahuah draws the wind from.'),
  ('enoch', '1-enoch', 33, 12, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah names the same ends-of-the-earth treasuries of wind and rain Enoch is shown, all ordered by the Creator''s word.'),
  ('enoch', '1-enoch', 33, 12, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Enoch''s confession that He ordered all creation by His wisdom is what Wisdom herself declares — present before the works of old, the principle on which the world is founded.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-33-portals-sun-moon',
       E'The portals of heaven — the lights for signs and seasons',
       E'Enoch reaches the eastern edge: *And to the east of those beasts I saw the ends of the earth whereon the heaven rests, and the portals of the heaven open.* (1 Enoch 33:2) — *And I saw six portals out of which the sun rises, and six portals in which the sun sets, and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them, and also many other chariots and their leaders.* (1 Enoch 33:3) This is the doorway to the Astronomical Book, and it is not new: the Creator hung the gates and set the lights at the fourth day — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — the sun keeping its appointed circuit, *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* (Psalm 19:5) and *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* (Psalm 19:6) Uriel will spell out these same portals: *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* (1 Enoch 72:3) And Jubilees reads the lights as the keepers of the moedim — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* (Jubilees 2:9) The lights govern the feasts; the Torah''s calendar is written into the sky.',
       sv.verse_id, ev.verse_id, 'extras', 50800
  FROM _session250_en33_lookup sv, _session250_en33_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=33 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-33-stars-keep-their-order',
       E'The stars rise and set in order — they do not change their course',
       E'Of the host that streams through the gates Enoch testifies: *And all the stars rise and set in their own order, and they do not change their course.* (1 Enoch 33:5) — and the winds *turn the heaven, and cause the disc of the sun and all the stars to set.* (1 Enoch 33:7) This obedient order is the same lesson Enoch opens with: *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1) The Tanakh reads the same fidelity: *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19) and the Creator alone holds the reins of the constellations — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31) and *Canst thou bring forth Mazzaroth in his season? or canst thou guide Arcturus with his sons?* (Job 38:32) The stars that never break rank become Enoch''s standing rebuke to the Watchers who did: the heavens keep covenant order; rebellion against the Creator''s appointed courses is the original transgression.',
       sv.verse_id, ev.verse_id, 'extras', 50803
  FROM _session250_en33_lookup sv, _session250_en33_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=33 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-33-trees-of-paradise',
       E'The trees of paradise at the north — the fragrant tree of life',
       E'Turning northward Enoch sees the holy garden: *And I proceeded to the north, and I saw there the great mountains of precious stones, and the trees of paradise, and the fragrant trees.* (1 Enoch 33:10) The paradise and its fragrant trees are the same Eden the Creator planted — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9) Enoch had already smelled it on the throne-mountain: *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* (1 Enoch 24:4) That same tree of life is restored at the end — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2) — its undying leaves foreseen by Ezekiel — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12) Eden lost, kept fragrant at the ends of the earth, and Eden restored at the centre — one tree, one paradise.',
       sv.verse_id, ev.verse_id, 'extras', 50806
  FROM _session250_en33_lookup sv, _session250_en33_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=33 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-33-treasuries-ordered-by-wisdom',
       E'The treasuries of snow and wind — He ordered all creation by His wisdom',
       E'Enoch''s tour closes on the storehouses of weather and the wisdom that fixed them: *And I saw the treasuries of the snow and the treasuries of the hail, and the treasuries of the clouds, and the treasuries of the dew and the rain.* (1 Enoch 33:11) — *And I saw the treasuries of all the winds: I saw how He has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 33:12) These very treasuries are what Yahuah set before Job out of the whirlwind — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* (Job 38:22) — and the prophets confess the wind drawn out of the same store: *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* (Psalm 135:7) and *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* (Jeremiah 10:13) Enoch names the founding principle — He ordered all creation by His wisdom — and Wisdom herself testifies she was there: *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* (Proverbs 8:22) The world is not chaos but covenant-order, founded on wisdom; the same God who weighs the snow appoints the times.',
       sv.verse_id, ev.verse_id, 'extras', 50809
  FROM _session250_en33_lookup sv, _session250_en33_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=33 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-33-portals-sun-moon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The sun and moon Enoch watches passing through the portals were appointed at creation for signs and seasons — the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-portals-sun-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The sun that rises from Enoch''s eastern portals is the same sun the psalmist sees set on its joyful, fixed course.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-portals-sun-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun''s going-forth from the end of heaven and its full circuit is exactly the gate-to-gate transit Enoch witnesses at the ends of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-portals-sun-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* The Astronomical Book opens by repeating this very vision, confirming the twelve portals Enoch first glimpses here in chapter 33.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-portals-sun-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The same lights that pass through Enoch''s portals are the appointed keepers of the feasts and jubilees — the calendar of Torah set in the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-portals-sun-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-33-stars-keep-their-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* Enoch''s opening summons to watch the unchanging order of the lights is precisely what he now sees fulfilled at the gates — the stars that do not change their course.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The sun and moon that keep their order in Enoch''s portals are the appointed timekeepers the psalmist praises — the sun that knows its own setting.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:32 — *Canst thou bring forth Mazzaroth in his season? or canst thou guide Arcturus with his sons?* The fixed courses Enoch marvels at belong to the Creator who alone leads the constellations out in their season.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-33-trees-of-paradise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The trees of paradise Enoch sees in the north are the very trees of Eden, the tree of life among them.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-trees-of-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 24:4 — *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* The fragrant trees of paradise here echo the throne-mountain tree of life Enoch had already smelled, the undying tree reserved for the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-trees-of-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The paradise Enoch sees kept in the north is restored at the centre of the New Jerusalem, the tree of life bearing fruit every month.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-trees-of-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s ever-fruitful trees beside the sanctuary river are the same paradise trees whose leaves wither not — Eden flowing out from the centre.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-trees-of-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-33-treasuries-ordered-by-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The very treasuries of snow and hail Enoch is shown are the storehouses Yahuah set before Job as proof of His unsearchable order.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-treasuries-ordered-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The treasuries of all the winds Enoch sees at the ends of the earth are the same storehouses the psalmist says Yahuah draws the wind from.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-treasuries-ordered-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah names the same ends-of-the-earth treasuries of wind and rain Enoch is shown, all ordered by the Creator''s word.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-treasuries-ordered-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Enoch''s confession that He ordered all creation by His wisdom is what Wisdom herself declares — present before the works of old, the principle on which the world is founded.'
  FROM cross_reference_threads t, cross_references x, _session250_en33_lookup sv, _session250_en33_lookup tv
 WHERE t.slug='1-enoch-33-treasuries-ordered-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=33 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

