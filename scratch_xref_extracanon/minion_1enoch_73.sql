-- ----- fragment: minion_1enoch_73.sql (session250 1-enoch 73) -----
-- Source anchor: enoch/1-enoch ch73. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en73 (view _session250_en73_lookup). Sort band base 51800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en73_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-73-lesser-light-for-seasons
  ('enoch', '1-enoch', 73, 1, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* Enoch''s "smaller luminary, which is named the Moon" is the fourth-day lesser light set to rule the night.'),
  ('enoch', '1-enoch', 73, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The moon Enoch charts is one of the lights ordained for signs and seasons — the moedim are written into creation by the luminaries.'),
  ('enoch', '1-enoch', 73, 4, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* As the moon''s light "waxes and wanes according to the number of days," she keeps the seasons she was appointed to mark.'),
  -- thread: 1-enoch-73-moon-faithful-witness
  ('enoch', '1-enoch', 73, 3, 'canon', 'psalms', 89, 37, 'free', E'Psalm 89:37 — *It shall be established for ever as the moon, and as a faithful witness in heaven. Selah.* The moon Enoch watches wax from a horn to full is the heaven''s faithful witness — her steady cycle pledges the steadiness of the covenant.'),
  ('enoch', '1-enoch', 73, 4, 'apocrypha', 'ecclesiasticus', 43, 6, 'extras', E'Ecclesiasticus 43:6 — *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* The waxing and waning Enoch numbers is the moon serving "in her season" as the declared sign of the times.'),
  -- thread: 1-enoch-73-borrowed-light-solar-order
  ('enoch', '1-enoch', 73, 7, 'apocrypha', 'ecclesiasticus', 43, 7, 'extras', E'Ecclesiasticus 43:7 — *From the moon is the sign of feasts, a light that decreaseth in her perfection.* Enoch''s moon, receiving "the half of one part of light" from the sun, is just such a decreasing, dependent light — the sign of the feasts, not the master of the count.'),
  ('enoch', '1-enoch', 73, 7, 'jubilees', 'jubilees', 6, 36, 'extras', E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* Enoch''s careful charting of the moon''s lag behind the sun is why Jubilees warns that reckoning by the moon alone disturbs the seasons.'),
  ('enoch', '1-enoch', 73, 5, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* The moon''s fractional light Enoch measures is held inside the 364-day solar reckoning Jubilees commands Israel to keep.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en73_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en73_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-73-lesser-light-for-seasons',
       E'The Moon — the lesser light, set for the appointed times',
       E'Enoch turns from the sun to *the smaller luminary, which is named the Moon* (1 Enoch 73:1), and from the first day of creation this is exactly the office the moon is given: *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* (Genesis 1:16) — the very word *smaller* / *lesser* binds Enoch''s second luminary to the fourth day. And the lights were not hung for ornament but for reckoning: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — the seasons here are the moedim, the appointed times, written into creation by the lights and not invented by men. The Psalmist says the same of this lesser light: *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19). It ain''t new: when Enoch measures the moon''s courses he is reading the Creator''s own calendar, the order set on the fourth day.',
       sv.verse_id, ev.verse_id, 'extras', 51800
  FROM _session250_en73_lookup sv, _session250_en73_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=73 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-73-moon-faithful-witness',
       E'Her light waxing and waning — the moon, a faithful witness',
       E'Enoch describes the moon''s monthly cycle: *And her form is like a horn when she is new, and when she is fourteen days old her light is full* (1 Enoch 73:3), *and her light waxes and wanes according to the number of days* (1 Enoch 73:4). That very regularity — the horn-thin new moon swelling to fullness and back, month after month without fail — is what makes her in Scripture a guarantor of covenant faithfulness: *It shall be established for ever as the moon, and as a faithful witness in heaven. Selah.* (Psalm 89:37). The moon''s unbroken reckoning is the visible pledge that Yahuah''s word stands; the apocryphal sage reads the same waxing horn as the appointed sign of the feasts: *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* (Ecclesiasticus 43:6). The order is the Creator''s covenant — to keep the reckoning is to keep faith with the One who set the witness in the sky.',
       sv.verse_id, ev.verse_id, 'extras', 51803
  FROM _session250_en73_lookup sv, _session250_en73_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=73 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-73-borrowed-light-solar-order',
       E'Her light borrowed from the sun — the 364-day reckoning',
       E'Enoch shows the moon''s light is not her own but received: *And she sets with the sun, and when the sun rises the moon rises with him and receives the half of one part of light* (1 Enoch 73:7) — her brightness is borrowed, measured out in sevenths and fourteenths against the sun''s. The Astronomical Book makes the solar year of whole days primary, and the apocryphal sage names exactly the moon''s office in that order: *From the moon is the sign of feasts, a light that decreaseth in her perfection.* (Ecclesiasticus 43:7) — a light that *decreaseth*, dependent, marking the feasts but not ruling the count. Jubilees presses the warning that flows from this: where men reckon by the lunar count alone the times slip — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* (Jubilees 6:36) — and so the charge is to hold the solar reckoning: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days... and they will not leave out any day nor disturb any feasts.* (Jubilees 6:32). It ain''t new: Enoch''s lunar tables, the sun lending her light, are the same Creator''s order Jubilees guards — keep the reckoning, keep the feasts.',
       sv.verse_id, ev.verse_id, 'extras', 51806
  FROM _session250_en73_lookup sv, _session250_en73_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=73 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-73-lesser-light-for-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* Enoch''s "smaller luminary, which is named the Moon" is the fourth-day lesser light set to rule the night.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-lesser-light-for-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The moon Enoch charts is one of the lights ordained for signs and seasons — the moedim are written into creation by the luminaries.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-lesser-light-for-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* As the moon''s light "waxes and wanes according to the number of days," she keeps the seasons she was appointed to mark.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-lesser-light-for-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-73-moon-faithful-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 89:37 — *It shall be established for ever as the moon, and as a faithful witness in heaven. Selah.* The moon Enoch watches wax from a horn to full is the heaven''s faithful witness — her steady cycle pledges the steadiness of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-moon-faithful-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 43:6 — *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* The waxing and waning Enoch numbers is the moon serving "in her season" as the declared sign of the times.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-moon-faithful-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-73-borrowed-light-solar-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 43:7 — *From the moon is the sign of feasts, a light that decreaseth in her perfection.* Enoch''s moon, receiving "the half of one part of light" from the sun, is just such a decreasing, dependent light — the sign of the feasts, not the master of the count.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-borrowed-light-solar-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* Enoch''s careful charting of the moon''s lag behind the sun is why Jubilees warns that reckoning by the moon alone disturbs the seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-borrowed-light-solar-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* The moon''s fractional light Enoch measures is held inside the 364-day solar reckoning Jubilees commands Israel to keep.'
  FROM cross_reference_threads t, cross_references x, _session250_en73_lookup sv, _session250_en73_lookup tv
 WHERE t.slug='1-enoch-73-borrowed-light-solar-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=73 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

