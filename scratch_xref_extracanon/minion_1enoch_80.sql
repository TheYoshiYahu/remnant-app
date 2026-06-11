-- ----- fragment: minion_1enoch_80.sql (session250 1-enoch 80) -----
-- Source anchor: enoch/1-enoch ch80. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en80 (view _session250_en80_lookup). Sort band base 51975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en80_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-80-host-of-heaven-idolatry
  ('enoch', '1-enoch', 80, 1, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* When Enoch''s lights fall out of order, men err and worship the host of heaven — the very driving-away Moses forbade.'),
  ('enoch', '1-enoch', 80, 1, 'canon', 'jeremiah', 8, 2, 'free', E'Jeremiah 8:2 — *And they shall spread them before the sun, and the moon, and all the host of heaven, whom they have loved, and whom they have served, and after whom they have walked, and whom they have sought, and whom they have worshipped: they shall not be gathered, nor be buried; they shall be for dung upon the face of the earth.* Jeremiah''s idolaters loved and served the same sun, moon, and host that Enoch 80:1 says men come to mistake for gods.'),
  ('enoch', '1-enoch', 80, 1, 'canon', 'romans', 1, 25, 'free', E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* Paul names the root of Enoch 80:1''s star-worship: the created luminary served in place of the Creator who appointed it.'),
  -- thread: 1-enoch-80-change-the-times-and-laws
  ('enoch', '1-enoch', 80, 10, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Enoch 80:10''s shortened year and altered months are the enemy of Daniel 7:25 making good on his design to change the times.'),
  ('enoch', '1-enoch', 80, 10, 'canon', 'isaiah', 24, 5, 'free', E'Isaiah 24:5 — *The earth also is defiled under the inhabitants thereof; because they have transgressed the laws, changed the ordinance, broken the everlasting covenant.* The altering of the whole order of the stations in Enoch 80:10 is Isaiah''s changed ordinance and broken everlasting covenant that defiles the earth.'),
  ('enoch', '1-enoch', 80, 10, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The year and months that Enoch 80:10 sees shortened and altered were written into the lights at creation as the fixed reckoning of signs and seasons.'),
  -- thread: 1-enoch-80-err-as-to-new-moons-feasts-jubilees
  ('enoch', '1-enoch', 80, 12, 'canon', 'leviticus', 23, 4, 'free', E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* Enoch 80:12 warns men will err as to the very festivals Yahuah here fixes in their appointed seasons — the moedim are His, not ours to move.'),
  ('enoch', '1-enoch', 80, 12, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The new moons and seasons men err over in Enoch 80:12 are governed by the very luminaries Yahuah appointed for that reckoning.'),
  ('enoch', '1-enoch', 80, 12, 'jubilees', 'jubilees', 6, 37, 'extras', E'Jubilees 6:37 — *For this reason the years will come upon them when they will disturb (the order), and make an abominable (day) the day of testimony, and an unclean day a feast day, and they will confound all the days, the holy with the unclean, and the unclean day with the holy; for they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees foretells the same erring over new moons, sabbaths, festivals, and jubilees as Enoch 80:12, naming the abandoned 364-day year as the cause.'),
  -- thread: 1-enoch-80-fruits-withheld-judgment
  ('enoch', '1-enoch', 80, 4, 'canon', 'isaiah', 24, 4, 'free', E'Isaiah 24:4 — *The earth mourneth and fadeth away, the world languisheth and fadeth away, the haughty people of the earth do languish.* The earth''s fruits held back in Enoch 80:4 are Isaiah''s mourning, fading world languishing under inhabitants who broke the everlasting covenant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en80_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en80_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-80-host-of-heaven-idolatry',
       E'Men take the stars for gods — the host of heaven',
       E'Enoch sees the luminaries themselves thrown out of order in the days of the sinners: *And in those days the sun shall be seen going forth at evening, And the moon rising at morning, And the moon shall alter her order, And not appear at her time.* (1 Enoch 80:1). When the lights no longer keep their appointed reckoning, men do not return to the Creator who set them — they bow to the lights as if the lights were gods. That is the very snare Moses warned against on the plains of Moab: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* (Deuteronomy 4:19). Jeremiah names the same apostasy when the bones of the idolaters are spread out before the very host they served: *And they shall spread them before the sun, and the moon, and all the host of heaven, whom they have loved, and whom they have served, and after whom they have walked, and whom they have sought, and whom they have worshipped...* (Jeremiah 8:2). Paul names the root of it: the creature exalted over the Creator — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* (Romans 1:25). The sun and moon are servants set for signs and seasons; to take the servant for the Master is the oldest lie. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51975
  FROM _session250_en80_lookup sv, _session250_en80_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=80 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-80-change-the-times-and-laws',
       E'The enemy thinks to change the times and laws',
       E'The deepest corruption in Enoch''s vision is not famine or sword but the violence done to the calendar itself: *And the year shall be shortened, And the months and their days and their weeks shall be altered, And the whole order of their stations shall be altered.* (1 Enoch 80:10), so that *men shall be at fault, And shall not reckon them correctly* (1 Enoch 80:11). This is exactly the little horn''s signature in Daniel''s night vision — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). The enemy''s aim is the appointed times themselves; if he can shorten the year and shift the order of the stations, the moedim drift and the people keep the wrong days. Isaiah shows the cost when a people lets the ordinance be moved: *The earth also is defiled under the inhabitants thereof; because they have transgressed the laws, changed the ordinance, broken the everlasting covenant.* (Isaiah 24:5). The Creator wrote the reckoning into the lights — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — so to alter the year is to assault creation''s own covenant. Torah is not the curse here; breaking the order is.',
       sv.verse_id, ev.verse_id, 'extras', 51978
  FROM _session250_en80_lookup sv, _session250_en80_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=80 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-80-err-as-to-new-moons-feasts-jubilees',
       E'They err as to the new moons, sabbaths, festivals, and jubilees',
       E'The perverted reckoning lands precisely on the moedim: *For they shall err as to the new moons, And sabbaths, And festivals, And jubilees.* (1 Enoch 80:12). The feasts are not human inventions to be set by convenience; they are Yahuah''s own, fixed in their seasons — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2), *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* (Leviticus 23:4). And those seasons hang on the luminaries the Creator appointed — *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19). Jubilees, the great calendar-witness, foretells the identical drift almost word for word, naming the failure to keep the 364-day year as the cause: *For this reason the years will come upon them when they will disturb (the order), and make an abominable (day) the day of testimony, and an unclean day a feast day, and they will confound all the days, the holy with the unclean, and the unclean day with the holy; for they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* (Jubilees 6:37). The Creator''s reckoning of whole solar days is the standard; to lose it is to lose His feasts. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51981
  FROM _session250_en80_lookup sv, _session250_en80_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=80 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-80-fruits-withheld-judgment',
       E'The fruits withheld and the sinners by the sword',
       E'When the order is perverted, the ground itself answers: *And in those days the fruits of the earth shall be backward, And shall not grow in their time, And the fruits of the trees shall be withheld in their time.* (1 Enoch 80:4), and the judgment falls — *And in those days the sinners shall be consumed by the sword, And the beasts of the field shall be consumed by the sword, And the birds of the heaven shall be consumed by the sword.* (1 Enoch 80:6). This is covenant cause and effect: defile the everlasting covenant and the earth withers — *The earth mourneth and fadeth away, the world languisheth and fadeth away, the haughty people of the earth do languish.* (Isaiah 24:4). The sword that sweeps man and beast and bird together echoes the great judgment of the prophets against a land that broke faith with its Maker. The drought and the famine are not arbitrary; the same hand that set the lights for the harvest seasons withholds the increase when men forsake His reckoning. The remedy is never to abandon the order but to keep it.',
       sv.verse_id, ev.verse_id, 'extras', 51984
  FROM _session250_en80_lookup sv, _session250_en80_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=80 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-80-host-of-heaven-idolatry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* When Enoch''s lights fall out of order, men err and worship the host of heaven — the very driving-away Moses forbade.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-host-of-heaven-idolatry'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 8:2 — *And they shall spread them before the sun, and the moon, and all the host of heaven, whom they have loved, and whom they have served, and after whom they have walked, and whom they have sought, and whom they have worshipped: they shall not be gathered, nor be buried; they shall be for dung upon the face of the earth.* Jeremiah''s idolaters loved and served the same sun, moon, and host that Enoch 80:1 says men come to mistake for gods.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-host-of-heaven-idolatry'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* Paul names the root of Enoch 80:1''s star-worship: the created luminary served in place of the Creator who appointed it.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-host-of-heaven-idolatry'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-80-change-the-times-and-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Enoch 80:10''s shortened year and altered months are the enemy of Daniel 7:25 making good on his design to change the times.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-change-the-times-and-laws'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:5 — *The earth also is defiled under the inhabitants thereof; because they have transgressed the laws, changed the ordinance, broken the everlasting covenant.* The altering of the whole order of the stations in Enoch 80:10 is Isaiah''s changed ordinance and broken everlasting covenant that defiles the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-change-the-times-and-laws'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The year and months that Enoch 80:10 sees shortened and altered were written into the lights at creation as the fixed reckoning of signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-change-the-times-and-laws'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-80-err-as-to-new-moons-feasts-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* Enoch 80:12 warns men will err as to the very festivals Yahuah here fixes in their appointed seasons — the moedim are His, not ours to move.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-err-as-to-new-moons-feasts-jubilees'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The new moons and seasons men err over in Enoch 80:12 are governed by the very luminaries Yahuah appointed for that reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-err-as-to-new-moons-feasts-jubilees'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:37 — *For this reason the years will come upon them when they will disturb (the order), and make an abominable (day) the day of testimony, and an unclean day a feast day, and they will confound all the days, the holy with the unclean, and the unclean day with the holy; for they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees foretells the same erring over new moons, sabbaths, festivals, and jubilees as Enoch 80:12, naming the abandoned 364-day year as the cause.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-err-as-to-new-moons-feasts-jubilees'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-80-fruits-withheld-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:4 — *The earth mourneth and fadeth away, the world languisheth and fadeth away, the haughty people of the earth do languish.* The earth''s fruits held back in Enoch 80:4 are Isaiah''s mourning, fading world languishing under inhabitants who broke the everlasting covenant.'
  FROM cross_reference_threads t, cross_references x, _session250_en80_lookup sv, _session250_en80_lookup tv
 WHERE t.slug='1-enoch-80-fruits-withheld-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=80 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

