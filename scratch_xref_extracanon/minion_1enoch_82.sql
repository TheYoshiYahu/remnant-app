-- ----- fragment: minion_1enoch_82.sql (session250 1-enoch 82) -----
-- Source anchor: enoch/1-enoch ch82. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en82 (view _session250_en82_lookup). Sort band base 52025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en82_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-82-altering-the-times-and-seasons
  ('enoch', '1-enoch', 82, 3, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Enoch''s sinners who "alter the times, and the seasons" are Daniel''s horn that thinks to change times and laws.'),
  ('enoch', '1-enoch', 82, 3, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the times and seasons the sinners alter were written into creation by the lights, not invented by men.'),
  ('enoch', '1-enoch', 82, 3, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The new moons and seasons that sinners try to alter are appointed by the luminaries themselves.'),
  ('enoch', '1-enoch', 82, 3, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Perverting the order of the lights bends men toward the host-of-heaven idolatry Torah forbade.'),
  ('enoch', '1-enoch', 82, 3, 'jubilees', 'jubilees', 6, 37, 'extras', E'Jubilees 6:37 — *...they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees and Enoch describe the same coming apostasy from the reckoning, down to eating blood with flesh.'),
  -- thread: 1-enoch-82-blessed-who-keep-the-reckoning
  ('enoch', '1-enoch', 82, 5, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* Enoch''s "blessed are those who keep the commandments... and walk in righteousness" is the blessing of the man who does not walk in the way of sinners.'),
  ('enoch', '1-enoch', 82, 5, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* The blessed keep the commandments of Yahuah of Spirits because their delight is in His law.'),
  ('enoch', '1-enoch', 82, 5, 'canon', 'leviticus', 23, 4, 'free', E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* To "complete their years in truth" is to keep the appointed feasts in their seasons, as the lights ordain them.'),
  -- thread: 1-enoch-82-luminaries-do-not-alter-their-courses
  ('enoch', '1-enoch', 82, 7, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the luminaries do not alter their courses because their Maker fixed them for signs and seasons from creation.'),
  ('enoch', '1-enoch', 82, 7, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The earth does not alter her seasons because the moon and sun keep their appointed courses.'),
  ('enoch', '1-enoch', 82, 6, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts...* The law of the luminaries Enoch writes on the heavenly tablets is the same 364-day reckoning Jubilees commands Israel to keep.'),
  -- thread: 1-enoch-82-the-leaders-of-the-seasons-keep-the-feast
  ('enoch', '1-enoch', 82, 8, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The chiefs of the four quarters and the feasts Enoch numbers are the appointed feasts of Yahuah, proclaimed by the lights.'),
  ('enoch', '1-enoch', 82, 11, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the leaders of the stars who do not transgress their commandments keep the very signs and seasons set at creation.'),
  ('enoch', '1-enoch', 82, 8, 'jubilees', 'jubilees', 6, 17, 'extras', E'Jubilees 6:17 — *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year...* The feasts governed by Enoch''s leaders of the seasons are the heavenly-tablet appointments by which the covenant is renewed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en82_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en82_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-82-altering-the-times-and-seasons',
       E'Sinners alter the times, seasons, new moons, sabbaths and festivals',
       E'Enoch foresees the great perversion of the order: *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits, And shall say that they are from the hand of Elohim (God), And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh* (1 Enoch 82:3). This is the same enemy Daniel names — the horn that *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* (Daniel 7:25). The lights themselves were never invented by men to be altered: *Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14), and *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19). To bow to the host of heaven rather than read the order set by their Maker is the very idolatry Torah forbade — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven* (Deuteronomy 4:19). Jubilees names the same falling-away as a future apostasy from the reckoning: *they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh* (Jubilees 6:37). It ain''t new: the times and laws stand; only sinners think to change them.',
       sv.verse_id, ev.verse_id, 'extras', 52025
  FROM _session250_en82_lookup sv, _session250_en82_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=82 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-82-blessed-who-keep-the-reckoning',
       E'Blessed are those who keep the commandments and complete their years in truth',
       E'Against the perversion stands the blessing on those who hold the order: *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life* (1 Enoch 82:5), repeated over the leaders who never stray — *And blessed are those who observe these things, And keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth* (1 Enoch 82:12). This is the very blessing of Psalm 1, hung on the man whose reckoning is the Creator''s: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalm 1:1), *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). And the years are kept "in truth" because the moedim are the Creator''s own appointments, not man''s: *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons* (Leviticus 23:4). To complete one''s years in truth is to keep the feasts in their seasons — Torah stands, and the keeping of it is covenant blessing, never curse.',
       sv.verse_id, ev.verse_id, 'extras', 52028
  FROM _session250_en82_lookup sv, _session250_en82_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=82 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-82-luminaries-do-not-alter-their-courses',
       E'The heavenly tablets and the law of the luminaries that do not alter their courses',
       E'Enoch hands Methuselah the whole order written in the sky: *And now, my son Methuselah, I have shown thee the whole vision of the heavenly tablets, And all the commandments of the luminaries, And the law of the stars, And the law of the sun and the moon, And the law of the winds, And the law of the earth, And the law of the sea* (1 Enoch 82:6), with the charge — *And thou shalt preserve them, And thou shalt not alter them, For the luminaries do not alter their courses, And the earth does not alter her seasons, And the sea does not alter her boundaries* (1 Enoch 82:7). The lights keep their law because their Maker set them to: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14), *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19). Jubilees writes the same fixed measure onto the heavenly tables and binds Israel to it: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts...* (Jubilees 6:32). The 364-day reckoning of whole solar days is the Creator''s covenant order; man preserves it, he does not author it.',
       sv.verse_id, ev.verse_id, 'extras', 52031
  FROM _session250_en82_lookup sv, _session250_en82_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=82 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-82-the-leaders-of-the-seasons-keep-the-feast',
       E'The four leaders of the intercalary days and the feast of weeks of the testimony',
       E'Enoch numbers the chiefs that govern the year — *And now I have shown thee the chiefs of the stars, And the leaders of the luminaries, And the chiefs of the four quarters of the year, And the chiefs of the intercalary days, And the chiefs of the months...* (1 Enoch 82:8), the four who complete the year — *And the four leaders of the intercalary days are Melkî''êl, Hel''emmelêk, Nêlê''êl, Nârêl* (1 Enoch 82:10) — and they keep their charge without straying: *And the leaders of the stars are the chiefs of the thousands, And they serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments* (1 Enoch 82:11). These appointed quarters and feasts are exactly what Leviticus names as the Creator''s own: *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2), fixed by the lights of Genesis 1:14 — *...and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). Jubilees ties the same heavenly tables to the keeping of the feast of weeks as a perpetual testimony: *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year...* (Jubilees 6:17). The leaders of the seasons keep the moedim because keeping the moedim is the renewing of the covenant; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 52034
  FROM _session250_en82_lookup sv, _session250_en82_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=82 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-82-altering-the-times-and-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Enoch''s sinners who "alter the times, and the seasons" are Daniel''s horn that thinks to change times and laws.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the times and seasons the sinners alter were written into creation by the lights, not invented by men.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The new moons and seasons that sinners try to alter are appointed by the luminaries themselves.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Perverting the order of the lights bends men toward the host-of-heaven idolatry Torah forbade.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 6:37 — *...they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees and Enoch describe the same coming apostasy from the reckoning, down to eating blood with flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-82-blessed-who-keep-the-reckoning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* Enoch''s "blessed are those who keep the commandments... and walk in righteousness" is the blessing of the man who does not walk in the way of sinners.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-blessed-who-keep-the-reckoning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* The blessed keep the commandments of Yahuah of Spirits because their delight is in His law.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-blessed-who-keep-the-reckoning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* To "complete their years in truth" is to keep the appointed feasts in their seasons, as the lights ordain them.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-blessed-who-keep-the-reckoning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-82-luminaries-do-not-alter-their-courses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the luminaries do not alter their courses because their Maker fixed them for signs and seasons from creation.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-luminaries-do-not-alter-their-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The earth does not alter her seasons because the moon and sun keep their appointed courses.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-luminaries-do-not-alter-their-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts...* The law of the luminaries Enoch writes on the heavenly tablets is the same 364-day reckoning Jubilees commands Israel to keep.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-luminaries-do-not-alter-their-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-82-the-leaders-of-the-seasons-keep-the-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The chiefs of the four quarters and the feasts Enoch numbers are the appointed feasts of Yahuah, proclaimed by the lights.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-the-leaders-of-the-seasons-keep-the-feast'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the leaders of the stars who do not transgress their commandments keep the very signs and seasons set at creation.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-the-leaders-of-the-seasons-keep-the-feast'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:17 — *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year...* The feasts governed by Enoch''s leaders of the seasons are the heavenly-tablet appointments by which the covenant is renewed.'
  FROM cross_reference_threads t, cross_references x, _session250_en82_lookup sv, _session250_en82_lookup tv
 WHERE t.slug='1-enoch-82-the-leaders-of-the-seasons-keep-the-feast'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=82 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

