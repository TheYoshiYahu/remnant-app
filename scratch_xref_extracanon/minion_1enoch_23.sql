-- ----- fragment: minion_1enoch_23.sql (session250 1-enoch 23) -----
-- Source anchor: enoch/1-enoch ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en23 (view _session250_en23_lookup). Sort band base 50550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-23-fire-that-feeds-the-sun
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 19, 4, 'free', E'Psalms 19:4 — *Their line is gone out through all the earth, and their words to the end of the world. In them hath he set a tabernacle for the sun,* the same sun for which Yahuah appointed a tabernacle is the one Enoch sees rolled round the whole earth by its surrounding fire.'),
  ('enoch', '1-enoch', 23, 2, 'canon', 'psalms', 19, 5, 'free', E'Psalms 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* the strong man who never tires to run his race is Enoch''s fire that ran without resting and paused not day or night.'),
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 19, 6, 'free', E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* the circuit to the ends of heaven is the very course of fire Enoch is shown at the west of the ends of the earth.'),
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* the fire that surrounds the sun is no rebel flame but a minister of Yahuah, set to its task like His flaming servants.'),
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* the sun knowing its going down is exactly the sun Raguel says the fire causes to set upon the whole earth.'),
  -- thread: 1-enoch-23-portals-and-chariots-of-the-lights
  ('enoch', '1-enoch', 23, 6, 'enoch', '1-enoch', 72, 3, 'extras', E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* the Astronomical Book lays down as the first law of the luminaries the very six portals Enoch glimpses here on his journey west.'),
  ('enoch', '1-enoch', 23, 5, 'enoch', '1-enoch', 72, 4, 'extras', E'1 Enoch 72:4 — *And the great one is their leader, the great luminary which is named the Sun, and its chariot on which it ascends is driven by the wind, and its chariot descends with wind.* the chariots running to the right and left of the sun are the wind-driven chariots Uriel names in the law of the luminaries.'),
  -- thread: 1-enoch-23-stars-keep-their-order
  ('enoch', '1-enoch', 23, 8, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the stars that rise and set in their own order keep the appointment Elohim gave the lights on the fourth day, for signs and seasons.'),
  ('enoch', '1-enoch', 23, 8, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* the stars do not change their course because Yahuah established them by a decree that shall not pass.'),
  ('enoch', '1-enoch', 23, 8, 'canon', 'jeremiah', 31, 36, 'free', E'Jeremiah 31:36 — *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* the stars never departing from their course is the sworn pledge that the seed of Yashar''el is never cast off before Yahuah.'),
  ('enoch', '1-enoch', 23, 8, 'enoch', '1-enoch', 75, 15, 'extras', E'1 Enoch 75:15 — *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* the stars that do not change their course do not transgress their commandments but complete their courses according to the law.'),
  ('enoch', '1-enoch', 23, 8, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* the unchanging order of the lights is appointed to mark the sabbaths, feasts, and seasons — the moedim by which the covenant is kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-23-fire-that-feeds-the-sun',
       E'The fire that runs without resting — the luminary''s flaming course',
       E'At the western ends of the earth Enoch sees *And I saw there a burning fire which ran without resting, and paused not from its course day or night but (ran) regularly.* (1 Enoch 23:2), and the angel Raguel names it: *This course of fire which thou hast seen is the fire which surrounds the sun, and which the sun rolls round upon the whole earth, and which the sun sets.* (1 Enoch 23:4). This is no strange revelation — it is the canon''s own ordained sun. Psalm 19 sees the same untiring runner: *In them hath he set a tabernacle for the sun,* (Psalms 19:4), *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* (Psalms 19:5), and *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* (Psalms 19:6) — the very ends-of-the-earth circuit Enoch is shown. Psalm 104 says the flame that surrounds is the servant of Yahuah, who *maketh his angels spirits; his ministers a flaming fire:* (Psalms 104:4) and who *appointed the moon for seasons: the sun knoweth his going down.* (Psalms 104:19). The fire does not burn loose; it serves an appointed course. The Watchers transgressed their order; the sun never does.',
       sv.verse_id, ev.verse_id, 'extras', 50550
  FROM _session250_en23_lookup sv, _session250_en23_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-23-portals-and-chariots-of-the-lights',
       E'The six portals and the chariots of the sun, moon, and stars',
       E'Enoch sees the machinery of the lights: *And I saw chariots in the heaven, running in the world above to the right and to the left of the sun.* (1 Enoch 23:5), and the gates they pass through — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them, and also many other chariots and their leaders.* (1 Enoch 23:6). This is not new even within Enoch — the Astronomical Book sets it down word for word as the *first law of the luminaries:* *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* (1 Enoch 72:3), and there too the great luminary''s *chariot on which it ascends is driven by the wind, and its chariot descends with wind.* (1 Enoch 72:4). The portals and the chariots are the appointed gates through which the lights keep the laws Uriel showed Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 50553
  FROM _session250_en23_lookup sv, _session250_en23_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=23 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-23-stars-keep-their-order',
       E'All the stars rise and set in their order — the decree that shall not pass',
       E'The chapter ends on the great witness of the created order: *And all the stars rise and set in their own order, and they do not change their course.* (1 Enoch 23:8). This is the Creator''s ordinance from the fourth day — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — and Psalm 148 commands these same obedient lights, *Praise ye him, sun and moon: praise him, all ye stars of light.* (Psalms 148:3), because *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalms 148:6). Within Enoch the closing law of the luminaries says it plainly: *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* (1 Enoch 75:15) — the exact mirror of the stars that do not change their course. And Yahuah binds this unbreakable order to the perpetuity of His people: He *giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35), and swears *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* (Jeremiah 31:36). The stars keeping their course is the standing pledge that the elect seed of Israel is never cast off — Torah and covenant stand as surely as the lights.',
       sv.verse_id, ev.verse_id, 'extras', 50556
  FROM _session250_en23_lookup sv, _session250_en23_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=23 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-23-fire-that-feeds-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 19:4 — *Their line is gone out through all the earth, and their words to the end of the world. In them hath he set a tabernacle for the sun,* the same sun for which Yahuah appointed a tabernacle is the one Enoch sees rolled round the whole earth by its surrounding fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* the strong man who never tires to run his race is Enoch''s fire that ran without resting and paused not day or night.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* the circuit to the ends of heaven is the very course of fire Enoch is shown at the west of the ends of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* the fire that surrounds the sun is no rebel flame but a minister of Yahuah, set to its task like His flaming servants.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* the sun knowing its going down is exactly the sun Raguel says the fire causes to set upon the whole earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-23-portals-and-chariots-of-the-lights
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* the Astronomical Book lays down as the first law of the luminaries the very six portals Enoch glimpses here on his journey west.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-portals-and-chariots-of-the-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 72:4 — *And the great one is their leader, the great luminary which is named the Sun, and its chariot on which it ascends is driven by the wind, and its chariot descends with wind.* the chariots running to the right and left of the sun are the wind-driven chariots Uriel names in the law of the luminaries.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-portals-and-chariots-of-the-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-23-stars-keep-their-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the stars that rise and set in their own order keep the appointment Elohim gave the lights on the fourth day, for signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* the stars do not change their course because Yahuah established them by a decree that shall not pass.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:36 — *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* the stars never departing from their course is the sworn pledge that the seed of Yashar''el is never cast off before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 75:15 — *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* the stars that do not change their course do not transgress their commandments but complete their courses according to the law.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=75 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* the unchanging order of the lights is appointed to mark the sabbaths, feasts, and seasons — the moedim by which the covenant is kept.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

