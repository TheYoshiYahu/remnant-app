-- ----- fragment: minion_1enoch_72.sql (session250 1-enoch 72) -----
-- Source anchor: enoch/1-enoch ch72. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en72 (view _session250_en72_lookup). Sort band base 51775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en72_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-72-luminaries-set-for-laws-and-seasons
  ('enoch', '1-enoch', 72, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The fourth-day decree is the charter behind Uriel''s book — the luminaries set for the seasons (moedim) and years that 1 Enoch 72:1 catalogues as their laws.'),
  ('enoch', '1-enoch', 72, 1, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The same ordering hand that 1 Enoch 72:1 says fixed the luminaries'' laws appoints the moon for the seasons and the sun''s own setting.'),
  ('enoch', '1-enoch', 72, 1, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar’el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* Jubilees engraves on the heavenly tables the very 364-day solar reckoning whose laws Uriel shows Enoch in 72:1 — the calendar is the Creator''s covenant, not an invention of men.'),
  -- thread: 1-enoch-72-the-sun-rising-going-forth-his-circuit
  ('enoch', '1-enoch', 72, 4, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun Enoch names as the great luminary and leader in 72:4 is Genesis''s greater light made to rule the day.'),
  ('enoch', '1-enoch', 72, 2, 'canon', 'psalms', 19, 5, 'free', E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The sun''s rising from the eastern portals in 1 Enoch 72:2 is the bridegroom coming forth that David sings.'),
  ('enoch', '1-enoch', 72, 2, 'canon', 'psalms', 19, 6, 'free', E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun''s rising in the eastern portals and setting in the western (1 Enoch 72:2) is precisely the going-forth-and-circuit from end to end that the Psalm describes.'),
  -- thread: 1-enoch-72-ordinances-of-sun-and-moon-fixed-forever
  ('enoch', '1-enoch', 72, 3, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The fixed laws of sun, moon, and the leaders of the stars in 1 Enoch 72:3 are the ordinances Yahuah swears are as sure as His covenant with Yashar''el.'),
  ('enoch', '1-enoch', 72, 1, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The luminaries whose laws Uriel reveals in 72:1 are given to be read for the moedim and reckoning, never worshipped as the host of heaven.'),
  ('enoch', '1-enoch', 72, 1, 'jubilees', 'jubilees', 6, 36, 'extras', E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* Jubilees names the very drift the luminary-book guards against — the lunar reckoning falling ten days behind the solar order whose laws Enoch is shown in 72:1.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en72_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en72_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-72-luminaries-set-for-laws-and-seasons',
       E'The luminaries set for laws, seasons, and years',
       E'Uriel opens the Book of the Luminaries by naming what the lights are FOR: *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons, according to their names and places of origin, and according to their months, which Uriel, the holy angel who was with me, who was their leader, showed me; and he showed me all their laws exactly as they are, and how it is with regard to all the years of the world and unto eternity, till the new creation is accomplished which dureth till eternity* (1 Enoch 72:1). This is not new — it is the fourth-day decree spoken from the beginning: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The appointed times (moedim) are written into creation by the lights themselves; the year, the seasons, the feasts are the Creator''s order, not men''s invention. The Psalmist keeps the same reckoning: *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19). And Jubilees, the chief calendar witness, places these very laws on the heavenly tables: *And command you the children of Yashar’el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts* (Jubilees 6:32). Enoch''s 364-day solar order of whole solar days is the same covenant order Genesis decreed and Jubilees engraved — the Appointed Times of the Creator.',
       sv.verse_id, ev.verse_id, 'extras', 51775
  FROM _session250_en72_lookup sv, _session250_en72_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=72 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-72-the-sun-rising-going-forth-his-circuit',
       E'The great luminary: the sun''s rising, its chariot, and its circuit',
       E'Enoch watches the sun named as ruler of the day and traces its course: *And the great one is their leader, the great luminary which is named the Sun, and its chariot on which it ascends is driven by the wind, and its chariot descends with wind* (1 Enoch 72:4), beginning from *the luminary the Sun has its rising in the eastern portals of the heaven, and its setting in the western portals of the heaven* (1 Enoch 72:2). Genesis already crowned this greater light: *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also* (Genesis 1:16). David sings the sun''s same daily circuit through its portals: *In them hath he set a tabernacle for the sun, Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race. His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof* (Psalm 19:4–6). Enoch''s portal-tables are the technical map of the going-forth and the circuit the Psalmist praises — one and the same ordained run of the great luminary that rules the day.',
       sv.verse_id, ev.verse_id, 'extras', 51778
  FROM _session250_en72_lookup sv, _session250_en72_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=72 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-72-ordinances-of-sun-and-moon-fixed-forever',
       E'The fixed ordinances of sun, moon, and stars — kept, not changed',
       E'Uriel shows the luminaries'' laws *exactly as they are, and how it is with regard to all the years of the world and unto eternity, till the new creation is accomplished* (1 Enoch 72:1), and the portals are governed by *the leaders of the stars and those whom they lead: six in the east and six in the west following them closely* (1 Enoch 72:3). These are the unbreakable ordinances Yahuah set: *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name* (Jeremiah 31:35). Because the order is the Creator''s, its keeping is covenant fidelity — and the lights are given to be reckoned, never to be worshipped: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven* (Deuteronomy 4:19). Jubilees warns of the very perversion the later luminary-chapters foretell — the moon-reckoning that drifts off the solar order: *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon* (Jubilees 6:36). Enoch''s tables are given so the children of Yashar''el keep the reckoning fixed, the solar order primary, the appointed feasts undisturbed.',
       sv.verse_id, ev.verse_id, 'extras', 51781
  FROM _session250_en72_lookup sv, _session250_en72_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=72 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-72-luminaries-set-for-laws-and-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The fourth-day decree is the charter behind Uriel''s book — the luminaries set for the seasons (moedim) and years that 1 Enoch 72:1 catalogues as their laws.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-luminaries-set-for-laws-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The same ordering hand that 1 Enoch 72:1 says fixed the luminaries'' laws appoints the moon for the seasons and the sun''s own setting.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-luminaries-set-for-laws-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:32 — *And command you the children of Yashar’el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts.* Jubilees engraves on the heavenly tables the very 364-day solar reckoning whose laws Uriel shows Enoch in 72:1 — the calendar is the Creator''s covenant, not an invention of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-luminaries-set-for-laws-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-72-the-sun-rising-going-forth-his-circuit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun Enoch names as the great luminary and leader in 72:4 is Genesis''s greater light made to rule the day.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-the-sun-rising-going-forth-his-circuit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The sun''s rising from the eastern portals in 1 Enoch 72:2 is the bridegroom coming forth that David sings.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-the-sun-rising-going-forth-his-circuit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun''s rising in the eastern portals and setting in the western (1 Enoch 72:2) is precisely the going-forth-and-circuit from end to end that the Psalm describes.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-the-sun-rising-going-forth-his-circuit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-72-ordinances-of-sun-and-moon-fixed-forever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The fixed laws of sun, moon, and the leaders of the stars in 1 Enoch 72:3 are the ordinances Yahuah swears are as sure as His covenant with Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-ordinances-of-sun-and-moon-fixed-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The luminaries whose laws Uriel reveals in 72:1 are given to be read for the moedim and reckoning, never worshipped as the host of heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-ordinances-of-sun-and-moon-fixed-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* Jubilees names the very drift the luminary-book guards against — the lunar reckoning falling ten days behind the solar order whose laws Enoch is shown in 72:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en72_lookup sv, _session250_en72_lookup tv
 WHERE t.slug='1-enoch-72-ordinances-of-sun-and-moon-fixed-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

