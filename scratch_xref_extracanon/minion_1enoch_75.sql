-- ----- fragment: minion_1enoch_75.sql (session250 1-enoch 75) -----
-- Source anchor: enoch/1-enoch ch75. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en75 (view _session250_en75_lookup). Sort band base 51850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en75_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-75-leaders-over-the-seasons
  ('enoch', '1-enoch', 75, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminary-captains over creation and the stars in Enoch 75:1 simply administer the order Elohim spoke on the fourth day, the lights set for signs and the appointed seasons.'),
  ('enoch', '1-enoch', 75, 6, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The leaders set over the seasons in Enoch 75:6 keep the very appointment the Psalmist celebrates — the moon for the moedim, the sun for its setting.'),
  ('enoch', '1-enoch', 75, 4, 'canon', '1-chronicles', 27, 1, 'free', E'1 Chronicles 27:1 — *Now the children of Yashar''el (Israel) after their number, to wit, the chief fathers and captains of thousands and hundreds, and their officers that served the king in any matter of the courses, which came in and went out month by month throughout all the months of the year, of every course were twenty and four thousand.* The captains of thousands serving by months in Enoch 75:4 are mirrored on earth by Israel''s monthly courses of captains of thousands — the heavenly ranks ordering time as the priestly ranks order service.'),
  ('enoch', '1-enoch', 75, 1, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars over which Enoch''s leaders are placed (75:1) stand by an unbreakable decree, the same fixed order that summons sun, moon and stars to praise their Maker.'),
  -- thread: 1-enoch-75-the-four-intercalary-days
  ('enoch', '1-enoch', 75, 12, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts. But if they do neglect and do not observe them according to His commandment, then they will disturb all their seasons, and the years will be dislodged from this (order), and they will disturb the seasons and the years will be dislodged and they will neglect their ordinances.* The three-hundred-and-sixty-four-day year Enoch completes with four intercalary days (75:12) is the exact reckoning Jubilees commands Israel to keep, lest the feasts be dislodged.'),
  ('enoch', '1-enoch', 75, 13, 'jubilees', 'jubilees', 6, 35, 'extras', E'Jubilees 6:35 — *For I know and from henceforth shall I declare it to you, and it is not of my own devising; for the book (lies) written before me, and on the heavenly tables the division of days is ordained, lest they forget the feasts of the covenant and walk according to the feasts of the nations after their error and after their ignorance.* The year *completed in righteousness* by the four days (Enoch 75:13) is the same division of days written on the heavenly tables, given so the feasts of the covenant are not forgotten for the feasts of the nations.'),
  ('enoch', '1-enoch', 75, 12, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The full count of three hundred and sixty-four days (Enoch 75:12) is the reckoning of the very *days, and years* the lights were appointed to mark — the calendar is the Creator''s order, not man''s device.'),
  ('enoch', '1-enoch', 75, 13, 'canon', 'leviticus', 23, 4, 'free', E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The seasons completed in righteousness by the four added days (Enoch 75:13) are the very *seasons* in which the feasts of Yahuah are to be proclaimed — keep the reckoning and the moedim fall in their appointed places.'),
  -- thread: 1-enoch-75-luminaries-keep-their-courses
  ('enoch', '1-enoch', 75, 15, 'enoch', '1-enoch', 2, 1, 'extras', E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* The sun, moon and stars completing their courses according to the law (75:15) echo Enoch''s opening call to behold the luminaries that never transgress their appointed order.'),
  ('enoch', '1-enoch', 75, 15, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* The luminaries that *do not transgress their commandments* (Enoch 75:15) are the very ordinances of heaven Yahuah names as His unbreakable covenant, surety of His promise to His people.'),
  ('enoch', '1-enoch', 75, 15, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The lights completing their courses according to the law (Enoch 75:15) stand by the decree that shall not pass, the fixed order of sun, moon and stars established for ever.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en75_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en75_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-75-leaders-over-the-seasons',
       E'The leaders set over the seasons — the moedim written into creation',
       E'Enoch sees an ordered hierarchy of luminary-captains set over every division of time: *And the leaders of the heads of the thousands, who are placed over the whole creation and over all the stars, also have their special stations, and they serve Yahuah (God) of Spirits in their appointed places.* (1 Enoch 75:1), down through *the four parts of the year* (75:2), *the seven days* (75:3), *the months* (75:4), *the years* (75:5), and *the seasons* (75:6). This is not invention but the Creator''s own order: from the fourth day the lights were appointed to mark out the times — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — so the appointed feasts (Leviticus 23) are fixed by the luminaries, not declared by men. The Psalmist names the same governance, *He appointed the moon for seasons: the sun knoweth his going down.* (Psalms 104:19), and earthly Israel mirrored the heavenly ranks in the priestly *courses, which came in and went out month by month throughout all the months of the year* (1 Chronicles 27:1). The stars themselves are summoned to bless the One who set them: *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalms 148:6). The appointed times are the Creator''s covenant order — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51850
  FROM _session250_en75_lookup sv, _session250_en75_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=75 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-75-the-four-intercalary-days',
       E'The four intercalary days that complete the 364-day year',
       E'Here is the heart of the Enoch reckoning, the whole solar order men so often neglect: *And the leaders of the heads of the thousands who are over the four parts of the year, and over the four intercalary days, serve Yahuah (God) of Spirits in their appointed places.* (1 Enoch 75:2), named as *Melkî''êl... Hel''emmelêk... Nêlê''êl... and Nârêl* (75:11), *And the days of the year are three hundred and sixty-four, and these four intercalary days are added to complete the year.* (75:12), *And because of these four days the seasons are changed, and the year is completed in righteousness.* (75:13). Jubilees gives the very same command and the very same warning that men would drop these days: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts. But if they do neglect and do not observe them according to His commandment, then they will disturb all their seasons, and the years will be dislodged from this (order), and they will disturb the seasons and the years will be dislodged and they will neglect their ordinances.* (Jubilees 6:32) — the reckoning is set down *lest they forget the feasts of the covenant and walk according to the feasts of the nations* (Jubilees 6:35). The 364-day solar year of whole days, completed by these four added days, is the Creator''s calendar; to omit them is to dislodge the feasts. It ain''t new — Genesis appointed the lights *for seasons, and for days, and years* (Genesis 1:14), the moedim of Leviticus 23 hang upon this order.',
       sv.verse_id, ev.verse_id, 'extras', 51853
  FROM _session250_en75_lookup sv, _session250_en75_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=75 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-75-luminaries-keep-their-courses',
       E'The sun, moon and stars transgress not — covenant order in the heavens',
       E'The chapter closes on the obedience of the lights: *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* (1 Enoch 75:15). This is the same testimony Enoch opens with — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1) — and it is the covenant the prophets appeal to as the surest thing in creation: *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* (Jeremiah 33:25), an ordinance so fixed it cannot be broken, *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalms 148:6). The lights keeping the law is the standing rebuke to men who would change the times: where the luminaries never transgress their commandments, the order they trace out is the Creator''s covenant, never law-as-curse. It ain''t new — the heavens keep the reckoning faithfully, and men are called to do the same.',
       sv.verse_id, ev.verse_id, 'extras', 51856
  FROM _session250_en75_lookup sv, _session250_en75_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=75 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-75-leaders-over-the-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminary-captains over creation and the stars in Enoch 75:1 simply administer the order Elohim spoke on the fourth day, the lights set for signs and the appointed seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-leaders-over-the-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The leaders set over the seasons in Enoch 75:6 keep the very appointment the Psalmist celebrates — the moon for the moedim, the sun for its setting.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-leaders-over-the-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Chronicles 27:1 — *Now the children of Yashar''el (Israel) after their number, to wit, the chief fathers and captains of thousands and hundreds, and their officers that served the king in any matter of the courses, which came in and went out month by month throughout all the months of the year, of every course were twenty and four thousand.* The captains of thousands serving by months in Enoch 75:4 are mirrored on earth by Israel''s monthly courses of captains of thousands — the heavenly ranks ordering time as the priestly ranks order service.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-leaders-over-the-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars over which Enoch''s leaders are placed (75:1) stand by an unbreakable decree, the same fixed order that summons sun, moon and stars to praise their Maker.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-leaders-over-the-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-75-the-four-intercalary-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts. But if they do neglect and do not observe them according to His commandment, then they will disturb all their seasons, and the years will be dislodged from this (order), and they will disturb the seasons and the years will be dislodged and they will neglect their ordinances.* The three-hundred-and-sixty-four-day year Enoch completes with four intercalary days (75:12) is the exact reckoning Jubilees commands Israel to keep, lest the feasts be dislodged.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-the-four-intercalary-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:35 — *For I know and from henceforth shall I declare it to you, and it is not of my own devising; for the book (lies) written before me, and on the heavenly tables the division of days is ordained, lest they forget the feasts of the covenant and walk according to the feasts of the nations after their error and after their ignorance.* The year *completed in righteousness* by the four days (Enoch 75:13) is the same division of days written on the heavenly tables, given so the feasts of the covenant are not forgotten for the feasts of the nations.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-the-four-intercalary-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The full count of three hundred and sixty-four days (Enoch 75:12) is the reckoning of the very *days, and years* the lights were appointed to mark — the calendar is the Creator''s order, not man''s device.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-the-four-intercalary-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The seasons completed in righteousness by the four added days (Enoch 75:13) are the very *seasons* in which the feasts of Yahuah are to be proclaimed — keep the reckoning and the moedim fall in their appointed places.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-the-four-intercalary-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-75-luminaries-keep-their-courses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* The sun, moon and stars completing their courses according to the law (75:15) echo Enoch''s opening call to behold the luminaries that never transgress their appointed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-luminaries-keep-their-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* The luminaries that *do not transgress their commandments* (Enoch 75:15) are the very ordinances of heaven Yahuah names as His unbreakable covenant, surety of His promise to His people.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-luminaries-keep-their-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The lights completing their courses according to the law (Enoch 75:15) stand by the decree that shall not pass, the fixed order of sun, moon and stars established for ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en75_lookup sv, _session250_en75_lookup tv
 WHERE t.slug='1-enoch-75-luminaries-keep-their-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=75 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

