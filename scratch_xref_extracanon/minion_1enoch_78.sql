-- ----- fragment: minion_1enoch_78.sql (session250 1-enoch 78) -----
-- Source anchor: enoch/1-enoch ch78. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en78 (view _session250_en78_lookup). Sort band base 51925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en78_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-78-two-great-lights
  ('enoch', '1-enoch', 78, 1, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* Enoch''s "great luminary" and "lesser luminary" are simply Moses'' greater and lesser light named out — the same two great lights of creation week.'),
  ('enoch', '1-enoch', 78, 2, 'canon', 'psalms', 148, 3, 'free', E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The luminaries Enoch names are creatures under command, called to praise their Maker — not deities, the witness against all host-of-heaven worship.'),
  ('enoch', '1-enoch', 78, 3, 'canon', 'psalms', 148, 5, 'free', E'Psalm 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* Enoch frames the names "according to the law and the reckoning of their light"; Psalm 148 grounds that law in the Creator''s command that made them.'),
  -- thread: 1-enoch-78-364-day-solar-order
  ('enoch', '1-enoch', 78, 4, 'enoch', '1-enoch', 74, 10, 'extras', E'1 Enoch 74:10 — *And the sun and the moon complete the year in three hundred and sixty-four days.* Enoch''s own luminary book fixes the same solar reckoning Enoch 78:4 gives to the sun''s revolution.'),
  ('enoch', '1-enoch', 78, 5, 'enoch', '1-enoch', 74, 11, 'extras', E'1 Enoch 74:11 — *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* This names the very 354-versus-364 gap Enoch 78:4-5 records, showing the lunar count falling behind the solar order.'),
  ('enoch', '1-enoch', 78, 4, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* The 364-day revolution of Enoch 78:4 is the very reckoning Jubilees commands Israel keep so the feasts are not disturbed.'),
  -- thread: 1-enoch-78-waxing-waning-new-moon
  ('enoch', '1-enoch', 78, 6, 'canon', 'psalms', 81, 3, 'free', E'Psalm 81:3 — *Blow up the trumpet in the new moon, in the time appointed, on our solemn feast day.* The moon''s waxing and waning that Enoch 78:6 counts marks the new moon Israel is commanded to keep as an appointed feast.'),
  ('enoch', '1-enoch', 78, 6, 'canon', 'isaiah', 66, 23, 'free', E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The phases of the moon Enoch tracks set the new-moon cycle by which all flesh will one day come to worship — the moedim written into the lights.'),
  -- thread: 1-enoch-78-courses-in-righteousness-signs-seasons
  ('enoch', '1-enoch', 78, 12, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Enoch 78:12 quotes the fourth-day mandate almost word for word — the lights set for signs, seasons (the moedim), days, and years.'),
  ('enoch', '1-enoch', 78, 12, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon and sun Enoch sets for seasons and days are the same lights the Psalm appoints for the seasons — the Creator''s order of the moedim.'),
  ('enoch', '1-enoch', 78, 9, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The luminaries that complete their courses in righteousness (Enoch 78:9) are the firmament preaching its Maker''s order without a word.'),
  ('enoch', '1-enoch', 78, 11, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the most High, and shall wear out the saints of the most High, and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Where Enoch''s lights do not change their courses, the enemy thinks to change the times — the perversion of the reckoning Enoch''s luminary book warns against.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en78_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en78_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-78-two-great-lights',
       E'The names of the sun and moon — the two great lights',
       E'Enoch names the luminaries: *And the names of the sun are these: the great luminary, the hot one, the shining one, the giver of light. And the moon has four names: the lesser luminary, the pale one, the light-giver, the blessed one* (1 Enoch 78:1-2), and again *the sun is called the great luminary, and the moon the lesser luminary* (1 Enoch 78:10). It ain''t new — this is creation week itself: *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also* (Genesis 1:16). The naming is no idle catalogue; it is the order the heavens keep so they can sing it back: *Praise ye him, sun and moon: praise him, all ye stars of light* (Psalm 148:3), for *he commanded, and they were created* (Psalm 148:5). The lights belong to the Creator and bear His reckoning; they are servants set in their stations, never powers to be feared or worshipped.',
       sv.verse_id, ev.verse_id, 'extras', 51925
  FROM _session250_en78_lookup sv, _session250_en78_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=78 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-78-364-day-solar-order',
       E'The 364-day solar reckoning — the moon falls behind',
       E'Enoch sets the solar year as the primary measure: *And the sun rises and sets, and returns to his place, and makes one revolution in three hundred and sixty-four days, and is thus always at his station* (1 Enoch 78:4), while *the moon also revolves and completes her light in three hundred and fifty-four days* (1 Enoch 78:5). The ten-day gap is the whole point: the lunar count runs behind the solar order, and Enoch elsewhere fixes the reckoning by the sun — *the sun and the moon complete the year in three hundred and sixty-four days* and *complete the years with righteousness, three hundred and sixty-four days* (1 Enoch 74:10,13). Jubilees lays the same charge on Israel: *command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts* (Jubilees 6:32). The 364-day order is whole solar days, the Creator''s calendar set at the fourth day; the appointed times stand or fall by it. It ain''t new — to keep the reckoning is covenant fidelity, not a later invention of men.',
       sv.verse_id, ev.verse_id, 'extras', 51928
  FROM _session250_en78_lookup sv, _session250_en78_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=78 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-78-waxing-waning-new-moon',
       E'Her light waxes and wanes — the new moon appointed for worship',
       E'Enoch measures the moon''s fullness: *And in the days of her waxing she completes her light in fourteen days, and in the days of her waning she completes her light in fourteen days* (1 Enoch 78:6). The waxing and waning are not chaos but appointment — the moon is set for the times Israel keeps. So the Psalm fixes the trumpet to the moon''s renewal: *Blow up the trumpet in the new moon, in the time appointed, on our solemn feast day* (Psalm 81:3), and the prophet sees worship itself ordered by that cycle: *it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The phases Enoch reckons are the Creator''s clock for the moedim; the new moon is an appointed time written into the light, and keeping it is covenant worship — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51931
  FROM _session250_en78_lookup sv, _session250_en78_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=78 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-78-courses-in-righteousness-signs-seasons',
       E'Their courses in righteousness — set for signs and seasons',
       E'The luminaries do not stray: *And the sun and the moon complete their courses in righteousness, and they do not transgress their commandments... and they do not change their courses* (1 Enoch 78:9,11), for *the sun and the moon are for signs and for seasons and for days and for years* (1 Enoch 78:12). This is the fourth-day charge spoken back: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — the very "seasons" being the moedim, the appointed times. The Psalm seals it: *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19), and the heavens preach their Maker''s order: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). The lights keep their commandments in righteousness; men are called to keep the reckoning they mark. To neglect or change the order is the enemy''s work who *think to change times and laws* (Daniel 7:25) — but the Creator''s calendar stands, fixed in the lights. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51934
  FROM _session250_en78_lookup sv, _session250_en78_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=78 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-78-two-great-lights
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* Enoch''s "great luminary" and "lesser luminary" are simply Moses'' greater and lesser light named out — the same two great lights of creation week.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-two-great-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The luminaries Enoch names are creatures under command, called to praise their Maker — not deities, the witness against all host-of-heaven worship.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-two-great-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* Enoch frames the names "according to the law and the reckoning of their light"; Psalm 148 grounds that law in the Creator''s command that made them.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-two-great-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-78-364-day-solar-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 74:10 — *And the sun and the moon complete the year in three hundred and sixty-four days.* Enoch''s own luminary book fixes the same solar reckoning Enoch 78:4 gives to the sun''s revolution.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-364-day-solar-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 74:11 — *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* This names the very 354-versus-364 gap Enoch 78:4-5 records, showing the lunar count falling behind the solar order.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-364-day-solar-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* The 364-day revolution of Enoch 78:4 is the very reckoning Jubilees commands Israel keep so the feasts are not disturbed.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-364-day-solar-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-78-waxing-waning-new-moon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 81:3 — *Blow up the trumpet in the new moon, in the time appointed, on our solemn feast day.* The moon''s waxing and waning that Enoch 78:6 counts marks the new moon Israel is commanded to keep as an appointed feast.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-waxing-waning-new-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=81 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The phases of the moon Enoch tracks set the new-moon cycle by which all flesh will one day come to worship — the moedim written into the lights.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-waxing-waning-new-moon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-78-courses-in-righteousness-signs-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Enoch 78:12 quotes the fourth-day mandate almost word for word — the lights set for signs, seasons (the moedim), days, and years.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-courses-in-righteousness-signs-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon and sun Enoch sets for seasons and days are the same lights the Psalm appoints for the seasons — the Creator''s order of the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-courses-in-righteousness-signs-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The luminaries that complete their courses in righteousness (Enoch 78:9) are the firmament preaching its Maker''s order without a word.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-courses-in-righteousness-signs-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:25 — *And he shall speak great words against the most High, and shall wear out the saints of the most High, and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Where Enoch''s lights do not change their courses, the enemy thinks to change the times — the perversion of the reckoning Enoch''s luminary book warns against.'
  FROM cross_reference_threads t, cross_references x, _session250_en78_lookup sv, _session250_en78_lookup tv
 WHERE t.slug='1-enoch-78-courses-in-righteousness-signs-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=78 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

