-- ----- fragment: minion_1enoch_79.sql (session250 1-enoch 79) -----
-- Source anchor: enoch/1-enoch ch79. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en79 (view _session250_en79_lookup). Sort band base 51950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en79_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-79-luminaries-set-for-the-moedim
  ('enoch', '1-enoch', 79, 3, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The lights are appointed for the seasons (moedim) — Enoch 79 simply unfolds the law Genesis sets at creation.'),
  ('enoch', '1-enoch', 79, 2, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The reckoning of months and signs Enoch lists is the same appointment of sun and moon David sings.'),
  ('enoch', '1-enoch', 79, 3, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The ordinances of moon and stars Enoch shows are Yahuah''s own fixed ordinances, sworn by His name.'),
  -- thread: 1-enoch-79-hosts-keep-their-appointed-courses
  ('enoch', '1-enoch', 79, 4, 'canon', 'psalms', 148, 6, 'free', E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The decree that holds the host in their courses is the same reason Enoch''s luminaries do not change their order.'),
  ('enoch', '1-enoch', 79, 4, 'canon', 'psalms', 148, 3, 'free', E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* Sun, moon and stars serving Yahuah (God) of Spirits in Enoch 79:4 is the same chorus the Psalm calls to praise.'),
  ('enoch', '1-enoch', 79, 4, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The hosts completing their revolutions in righteousness is the firmament''s wordless declaration of its Maker.'),
  ('enoch', '1-enoch', 79, 7, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* The unbroken courses of the luminaries are the surety of Yahuah''s covenant — the lights keep their law so that His covenant stands.'),
  ('enoch', '1-enoch', 79, 4, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The host serve Yahuah in their places (Enoch 79:4); Torah forbids reversing that to serve the host — the host-of-heaven idolatry.'),
  -- thread: 1-enoch-79-the-364-day-solar-reckoning
  ('enoch', '1-enoch', 79, 5, 'enoch', '1-enoch', 74, 11, 'extras', E'1 Enoch 74:11 — *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* The same 364-vs-354 reckoning Enoch already gave in the courses of the moon — the solar year is the primary order.'),
  ('enoch', '1-enoch', 79, 5, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* The 364-day year Enoch completes is the same reckoning Jubilees commands Israel to keep so the feasts are not disturbed.'),
  ('enoch', '1-enoch', 79, 5, 'jubilees', 'jubilees', 6, 36, 'extras', E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* The very ten-day gap Enoch records — the moon falling behind by ten days — is the disturbance Jubilees warns of when men reckon by the moon alone.'),
  -- thread: 1-enoch-79-keep-the-reckoning-blessing
  ('enoch', '1-enoch', 79, 10, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The years completed in truth carry the feasts of Yahuah — the moedim fixed by the lights and proclaimed in Torah.'),
  ('enoch', '1-enoch', 79, 10, 'enoch', '1-enoch', 82, 5, 'extras', E'1 Enoch 82:5 — *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* Enoch''s own closing benediction repeats the blessing of 79:10 word for word and adds its reward — eternal life.'),
  ('enoch', '1-enoch', 79, 9, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The spirits of error that lead men to transgress the commandments are the same hand that thinks to change the times and laws — the perversion of the reckoning Enoch keeps.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en79_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en79_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-79-luminaries-set-for-the-moedim',
       E'The luminaries set for signs and seasons — it ain''t new',
       E'Uriel''s recap closes the Book of the Luminaries by declaring the *law* of the lights: *And now I have shown thee the vision of all the luminaries of the heaven, how they go forth and how they return, and how they complete their courses, and how they do not transgress their commandments* (1 Enoch 79:3). The moedim — the appointed times — are not invented by men; they are written into creation by the lights on the fourth day: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14). The same order is sung in *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19), and it is the very fabric the prophet swears by: *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* (Jeremiah 31:35). The calendar is the Creator''s covenant order — the Appointed Times stand because the lights stand.',
       sv.verse_id, ev.verse_id, 'extras', 51950
  FROM _session250_en79_lookup sv, _session250_en79_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=79 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-79-hosts-keep-their-appointed-courses',
       E'The host of heaven serve in their appointed places',
       E'The lights are obedient servants, never autonomous powers: *And the sun and the moon and the stars and the leaders of the stars, and all the hosts of heaven, serve Yahuah (God) of Spirits in their appointed places, and they do not change their courses, and they complete their revolutions in righteousness* (1 Enoch 79:4). They do not stray because *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalm 148:6) — the very heavens commanded to *Praise ye him, sun and moon: praise him, all ye stars of light.* (Psalm 148:3). Their silent obedience preaches: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1). And because they keep their order, they become the surety of the covenant itself: *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* (Jeremiah 33:25). The hosts serve their Maker — which is exactly why Torah forbids serving *them*: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* (Deuteronomy 4:19).',
       sv.verse_id, ev.verse_id, 'extras', 51953
  FROM _session250_en79_lookup sv, _session250_en79_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=79 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-79-the-364-day-solar-reckoning',
       E'The 364-day solar order and the moon ten days behind',
       E'Enoch fixes the primary reckoning precisely: *And the year is completed in three hundred and sixty-four days, and the moon completes her light in three hundred and fifty-four days, and falls behind by ten days* (1 Enoch 79:5), so that *the moon brings in all the years exactly, that their stations may come, and that they may not transgress their reckoned stations, and that they may not change their order, but complete the years with righteousness* (1 Enoch 79:6). The solar order is primary; the lunar year lags and must be brought back into line — Enoch says it himself earlier: *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* (1 Enoch 74:12). The same 364-day reckoning is commanded in Jubilees, with the identical ten-day diagnosis of the moon: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* (Jubilees 6:32) — and the very lag Enoch names: *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* (Jubilees 6:36). The whole-day solar order completes the year in righteousness — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51956
  FROM _session250_en79_lookup sv, _session250_en79_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=79 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-79-keep-the-reckoning-blessing',
       E'Keep and observe the law — blessed are those who keep the commandments',
       E'The luminary-laws are handed down to be kept, not catalogued: *And these are the laws and the commandments which I have shown thee, my son Methuselah, that thou mayest show them to thy children after thee, and that they may keep them and observe them, and that they may not be led astray by the spirits of error* (1 Enoch 79:8), for *the spirits of error lead astray the sons of men, and cause them to transgress the commandments of Yahuah (God) of Spirits* (1 Enoch 79:9), and the chapter ends in benediction: *But blessed are those who keep the commandments of Yahuah (God) of Spirits, and walk in righteousness, and complete their years in truth* (1 Enoch 79:10). The feasts these years carry are the moedim Torah fixes: *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2). Enoch echoes his own closing blessing: *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* (1 Enoch 82:5). But when sinners refuse the order it is the enemy''s work — to change the very times: *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). To keep the right reckoning is covenant fidelity; to change the times is rebellion against the Creator''s order.',
       sv.verse_id, ev.verse_id, 'extras', 51959
  FROM _session250_en79_lookup sv, _session250_en79_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=79 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-79-luminaries-set-for-the-moedim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The lights are appointed for the seasons (moedim) — Enoch 79 simply unfolds the law Genesis sets at creation.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-luminaries-set-for-the-moedim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The reckoning of months and signs Enoch lists is the same appointment of sun and moon David sings.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-luminaries-set-for-the-moedim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The ordinances of moon and stars Enoch shows are Yahuah''s own fixed ordinances, sworn by His name.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-luminaries-set-for-the-moedim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-79-hosts-keep-their-appointed-courses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The decree that holds the host in their courses is the same reason Enoch''s luminaries do not change their order.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-hosts-keep-their-appointed-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* Sun, moon and stars serving Yahuah (God) of Spirits in Enoch 79:4 is the same chorus the Psalm calls to praise.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-hosts-keep-their-appointed-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The hosts completing their revolutions in righteousness is the firmament''s wordless declaration of its Maker.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-hosts-keep-their-appointed-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* The unbroken courses of the luminaries are the surety of Yahuah''s covenant — the lights keep their law so that His covenant stands.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-hosts-keep-their-appointed-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The host serve Yahuah in their places (Enoch 79:4); Torah forbids reversing that to serve the host — the host-of-heaven idolatry.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-hosts-keep-their-appointed-courses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-79-the-364-day-solar-reckoning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 74:11 — *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* The same 364-vs-354 reckoning Enoch already gave in the courses of the moon — the solar year is the primary order.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-the-364-day-solar-reckoning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* The 364-day year Enoch completes is the same reckoning Jubilees commands Israel to keep so the feasts are not disturbed.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-the-364-day-solar-reckoning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* The very ten-day gap Enoch records — the moon falling behind by ten days — is the disturbance Jubilees warns of when men reckon by the moon alone.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-the-364-day-solar-reckoning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-79-keep-the-reckoning-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The years completed in truth carry the feasts of Yahuah — the moedim fixed by the lights and proclaimed in Torah.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-keep-the-reckoning-blessing'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 82:5 — *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* Enoch''s own closing benediction repeats the blessing of 79:10 word for word and adds its reward — eternal life.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-keep-the-reckoning-blessing'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The spirits of error that lead men to transgress the commandments are the same hand that thinks to change the times and laws — the perversion of the reckoning Enoch keeps.'
  FROM cross_reference_threads t, cross_references x, _session250_en79_lookup sv, _session250_en79_lookup tv
 WHERE t.slug='1-enoch-79-keep-the-reckoning-blessing'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=79 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

