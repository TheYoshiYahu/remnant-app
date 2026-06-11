-- ----- fragment: minion_1enoch_04.sql (session250 1-enoch 4) -----
-- Source anchor: enoch/1-enoch ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en04 (view _session250_en04_lookup). Sort band base 50075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-4-sun-ordained-course
  ('enoch', '1-enoch', 4, 1, 'canon', 'psalms', 19, 6, 'free', E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The very heat of the sun that Enoch tells you to feel is the wordless witness the psalm names — from its fixed circuit nothing on earth is hid from its heat.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch''s sun standing ''above the earth over against it'' is no accident of nature but an appointed luminary that knows its course, exactly as the psalm declares.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The summer-sun Enoch observes was set in the firmament on the fourth day for signs and seasons — the moedim — so that observing it is reading the Creator''s appointed times.'),
  ('enoch', '1-enoch', 4, 1, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Enoch''s burning summer-sun is the same fourth-day sign that Jubilees binds to the feasts and the calendar — the appointed times stand in the lights themselves.'),
  -- thread: 1-enoch-4-summer-winter-covenant
  ('enoch', '1-enoch', 4, 1, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The unfailing summer-heat Enoch tells you to observe is the standing post-Flood covenant — the seasons return because Yahuah (God) swore they would.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The steadfast heat of Enoch''s summer is the appointed ordinance of heaven on which Yahuah (God) stakes His covenant with the scattered seed of Yashar''el (Israel) — the order man is to heed but does not.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'matthew', 5, 45, 'free', E'Matthew 5:45 — *That ye may be the children of your Father which is in heaven: for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust.* The sun whose heat Enoch makes you feel is the Father''s own daily mercy that Yahusha (Jesus) names — the ordained light witnessing to all alike.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'acts', 14, 17, 'free', E'Acts 14:17 — *Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.* Enoch''s burning summer is one of the ''fruitful seasons'' Sha''ul calls God''s standing witness — the ordered heat itself testifies of the Creator to every nation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-4-sun-ordained-course',
       E'The Sun in His Ordained Course — Observe and Know His Works',
       E'*And again, observe ye the days of summer how the sun is above the earth over against it. And you seek shade and shelter by reason of the heat of the sun, and the earth also burns with growing heat, and so you cannot tread on the earth, or on a rock by reason of its heat.* (1 Enoch 4:1) The same heat Enoch tells you to feel on your own skin is the witness the Tanakh sings: *In them hath he set a tabernacle for the sun, Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race. His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* (Psalm 19:6) The sun does not wander — *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19) — because Yahuah (God) set it on the fourth day for exactly this: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). 1 Enoch''s own kinsman-book says the same of that fourth-day light: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9). Enoch''s burning summer is not idle weather-watching: it is the appointed luminary keeping the moedim by the Creator''s order, the same Torah-ordered calendar — it ain''t new. The lights were never given to be worshipped, but to keep the times He set; the wise heed them, and through them recognize Him.',
       sv.verse_id, ev.verse_id, 'extras', 50075
  FROM _session250_en04_lookup sv, _session250_en04_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-4-summer-winter-covenant',
       E'Summer and Heat Shall Not Cease — Creation Keeps Its Appointed Order',
       E'Enoch bids you mark the steadfastness of summer''s heat: *And again, observe ye the days of summer how the sun is above the earth over against it. And you seek shade and shelter by reason of the heat of the sun, and the earth also burns with growing heat* (1 Enoch 4:1). That reliable return of heat is itself a covenant kept. After the Flood Yahuah (God) swore: *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22). The ordered turning of the seasons is the very pledge Yahuah (God) names as more sure than His promise to the seed of Yashar''el (Israel): *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — so steadfast a heat and cold that He stakes the regathering of the scattered house on it. The Son who came in flesh, Yahusha (Jesus), points to the same daily mercy: *for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust* (Matthew 5:45); and Sha''ul preaches it to the nations as God''s standing witness: *he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness* (Acts 14:17). Enoch''s point in this whole section is the rebuke that follows: the sun, the seasons, the heat — all keep the appointed order they were given, while man alone breaks the covenant. Creation''s obedience condemns rebellion; the way of the righteous is to keep, as the heavens keep.',
       sv.verse_id, ev.verse_id, 'extras', 50078
  FROM _session250_en04_lookup sv, _session250_en04_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-4-sun-ordained-course
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The very heat of the sun that Enoch tells you to feel is the wordless witness the psalm names — from its fixed circuit nothing on earth is hid from its heat.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch''s sun standing ''above the earth over against it'' is no accident of nature but an appointed luminary that knows its course, exactly as the psalm declares.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The summer-sun Enoch observes was set in the firmament on the fourth day for signs and seasons — the moedim — so that observing it is reading the Creator''s appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Enoch''s burning summer-sun is the same fourth-day sign that Jubilees binds to the feasts and the calendar — the appointed times stand in the lights themselves.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-4-summer-winter-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The unfailing summer-heat Enoch tells you to observe is the standing post-Flood covenant — the seasons return because Yahuah (God) swore they would.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The steadfast heat of Enoch''s summer is the appointed ordinance of heaven on which Yahuah (God) stakes His covenant with the scattered seed of Yashar''el (Israel) — the order man is to heed but does not.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:45 — *That ye may be the children of your Father which is in heaven: for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust.* The sun whose heat Enoch makes you feel is the Father''s own daily mercy that Yahusha (Jesus) names — the ordained light witnessing to all alike.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 14:17 — *Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.* Enoch''s burning summer is one of the ''fruitful seasons'' Sha''ul calls God''s standing witness — the ordered heat itself testifies of the Creator to every nation.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=14 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

