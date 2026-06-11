-- ----- fragment: minion_1enoch_74.sql (session250 1-enoch 74) -----
-- Source anchor: enoch/1-enoch ch74. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en74 (view _session250_en74_lookup). Sort band base 51825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en74_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-74-uriel-luminaries-signs-and-seasons
  ('enoch', '1-enoch', 74, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries Uriel shows Enoch are the very lights set for the appointed times (moedim) on the fourth day.'),
  ('enoch', '1-enoch', 74, 3, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon''s return through her portals to complete her light is the Creator''s own appointment of the seasons, not a man-made scheme.'),
  ('enoch', '1-enoch', 74, 1, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The orderly circuit of the moon through the six portals is the firmament preaching the Maker''s handiwork, the same witness Uriel unfolds to Enoch.'),
  -- thread: 1-enoch-74-solar-year-364-days
  ('enoch', '1-enoch', 74, 10, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The 364-day year of whole solar days is the Genesis decree of lights for days and years worked out in full.'),
  ('enoch', '1-enoch', 74, 11, 'jubilees', 'jubilees', 6, 36, 'extras', E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* Jubilees names the same shortfall Enoch records — the lunar 354 against the solar 364, ten days short each year.'),
  ('enoch', '1-enoch', 74, 12, 'jubilees', 'jubilees', 6, 37, 'extras', E'Jubilees 6:37 — *...so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals...* Because the moon falls behind, Jubilees commands the fixed 364-day count so the feasts do not drift, guarding the same order Enoch 74 sets down.'),
  -- thread: 1-enoch-74-stations-not-transgress-the-feasts
  ('enoch', '1-enoch', 74, 13, 'canon', 'leviticus', 23, 4, 'free', E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The stations that must not transgress their reckoning are the moedim — the feasts proclaimed in their seasons, fixed by the lights Enoch is shown.'),
  ('enoch', '1-enoch', 74, 13, 'jubilees', 'jubilees', 6, 35, 'extras', E'Jubilees 6:35 — *...for the book (lies) written before me, and on the heavenly tables the division of days is ordained, lest they forget the feasts of the covenant and walk according to the feasts of the nations after their error and after their ignorance.* The heavenly tables ordain the division of days so the covenant feasts are kept — the same righteousness Enoch 74:13 demands of the year.'),
  -- thread: 1-enoch-74-change-not-the-order-against-the-times-changer
  ('enoch', '1-enoch', 74, 13, 'enoch', '1-enoch', 82, 3, 'extras', E'1 Enoch 82:3 — *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits, And shall say that they are from the hand of Elohim (God), And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* The charge that the lights must not change their order is set against the sinners who alter the times and festivals — the very perversion of the reckoning Enoch 74:13 guards against.'),
  ('enoch', '1-enoch', 74, 13, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* To change the order of the lights is the enemy''s work — the horn who thinks to change the very times and laws Enoch 74:13 says must not be changed.'),
  ('enoch', '1-enoch', 74, 13, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The luminaries that mark the reckoning are servants of the appointed times, never to be worshipped — the host of heaven is the Creator''s order, not a god to serve.'),
  ('enoch', '1-enoch', 74, 13, 'enoch', '1-enoch', 82, 5, 'extras', E'1 Enoch 82:5 — *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* To complete the years ''with righteousness'' (74:13) is the very blessing on those who keep the reckoning and complete their years in truth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en74_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en74_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-74-uriel-luminaries-signs-and-seasons',
       E'Uriel completes the moon''s course — the lights for signs and seasons',
       E'Enoch is shown the moon''s whole circuit by the archangel of the lights: *And afterwards the course of the moon was also completed in the six portals, as was shown to me there by the angel Uriel, who is the leader of all the luminaries.* (1 Enoch 74:1). This is not novel cosmology but the unfolding of the fourth-day decree: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — the moedim, the appointed times, are written into creation by the luminaries themselves. The Psalmist sings the same order, that the moon''s reckoning is the Creator''s own appointment, not man''s invention: *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19). And the heavens keep no silence about it: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1). It ain''t new — Enoch only spells out by name what Genesis sets in the sky and the Psalms confess.',
       sv.verse_id, ev.verse_id, 'extras', 51825
  FROM _session250_en74_lookup sv, _session250_en74_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=74 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-74-solar-year-364-days',
       E'The sun and the moon complete the year in 364 days',
       E'Here the Astronomical Book states the reckoning plainly: *And the sun and the moon complete the year in three hundred and sixty-four days.* (1 Enoch 74:10), and shows where the lunar count falls short: *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* (1 Enoch 74:11) — the moon trailing the sun: *And the moon falls behind the sun and the stars by thirty days in the course of one year.* (1 Enoch 74:12). This is the 364-day solar order of whole days that Genesis sets up when the lights are given for *days, and years* (Genesis 1:14). Jubilees guards the very same number and warns against letting the moon set the feasts: *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* (Jubilees 6:36) — the lunar 354 against the solar 364, ten days short each year, exactly Enoch''s deficit. So that the feasts not drift, Jubilees commands the fixed count: *...so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals...* (Jubilees 6:37). The solar reckoning is primary; the moon is read against it, never over it.',
       sv.verse_id, ev.verse_id, 'extras', 51828
  FROM _session250_en74_lookup sv, _session250_en74_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=74 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-74-stations-not-transgress-the-feasts',
       E'That they transgress not their stations — the feasts kept in righteousness',
       E'The chapter closes on covenant, not arithmetic: *And the moon brings in all the years exactly, that their stations may come, and that they may not transgress their reckoned stations, and that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days.* (1 Enoch 74:13). The whole point of the reckoning is that the appointed times arrive on time — the feasts of Yahuah are fixed by the lights, not invented by men: *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* (Leviticus 23:4). Jubilees seals it with the warning that the heavenly tables ordain the division of days precisely so the covenant feasts are not forgotten: *...for the book (lies) written before me, and on the heavenly tables the division of days is ordained, lest they forget the feasts of the covenant and walk according to the feasts of the nations after their error and after their ignorance.* (Jubilees 6:35). To complete the years ''with righteousness'' is covenant fidelity — the order is the Creator''s, and keeping the right reckoning is keeping His appointed times. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51831
  FROM _session250_en74_lookup sv, _session250_en74_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=74 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-74-change-not-the-order-against-the-times-changer',
       E'Change not their order — against the one who thinks to change times',
       E'Enoch''s charge that the lights *may not change their order* (1 Enoch 74:13) stands against the great perversion the Astronomical Book later names, when sinners tamper with the reckoning itself: *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals...* (1 Enoch 82:3). That is the very work Daniel sees in the horn who wars on the saints: *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25) — to change the times is to fight the Creator''s order. The same temptation is idolatry of the host of heaven, forbidden at Sinai: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them...* (Deuteronomy 4:19) — the lights are servants of the appointed times, never gods, and never men''s to re-order. Against all of it stands the blessing on those who keep the reckoning: *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* (1 Enoch 82:5). Torah stands; the order is covenant, never curse.',
       sv.verse_id, ev.verse_id, 'extras', 51834
  FROM _session250_en74_lookup sv, _session250_en74_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=74 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-74-uriel-luminaries-signs-and-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries Uriel shows Enoch are the very lights set for the appointed times (moedim) on the fourth day.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-uriel-luminaries-signs-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon''s return through her portals to complete her light is the Creator''s own appointment of the seasons, not a man-made scheme.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-uriel-luminaries-signs-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The orderly circuit of the moon through the six portals is the firmament preaching the Maker''s handiwork, the same witness Uriel unfolds to Enoch.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-uriel-luminaries-signs-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-74-solar-year-364-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The 364-day year of whole solar days is the Genesis decree of lights for days and years worked out in full.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-solar-year-364-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* Jubilees names the same shortfall Enoch records — the lunar 354 against the solar 364, ten days short each year.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-solar-year-364-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:37 — *...so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals...* Because the moon falls behind, Jubilees commands the fixed 364-day count so the feasts do not drift, guarding the same order Enoch 74 sets down.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-solar-year-364-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-74-stations-not-transgress-the-feasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The stations that must not transgress their reckoning are the moedim — the feasts proclaimed in their seasons, fixed by the lights Enoch is shown.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-stations-not-transgress-the-feasts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:35 — *...for the book (lies) written before me, and on the heavenly tables the division of days is ordained, lest they forget the feasts of the covenant and walk according to the feasts of the nations after their error and after their ignorance.* The heavenly tables ordain the division of days so the covenant feasts are kept — the same righteousness Enoch 74:13 demands of the year.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-stations-not-transgress-the-feasts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-74-change-not-the-order-against-the-times-changer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 82:3 — *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits, And shall say that they are from the hand of Elohim (God), And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* The charge that the lights must not change their order is set against the sinners who alter the times and festivals — the very perversion of the reckoning Enoch 74:13 guards against.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-change-not-the-order-against-the-times-changer'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* To change the order of the lights is the enemy''s work — the horn who thinks to change the very times and laws Enoch 74:13 says must not be changed.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-change-not-the-order-against-the-times-changer'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The luminaries that mark the reckoning are servants of the appointed times, never to be worshipped — the host of heaven is the Creator''s order, not a god to serve.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-change-not-the-order-against-the-times-changer'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 82:5 — *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* To complete the years ''with righteousness'' (74:13) is the very blessing on those who keep the reckoning and complete their years in truth.'
  FROM cross_reference_threads t, cross_references x, _session250_en74_lookup sv, _session250_en74_lookup tv
 WHERE t.slug='1-enoch-74-change-not-the-order-against-the-times-changer'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=74 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

