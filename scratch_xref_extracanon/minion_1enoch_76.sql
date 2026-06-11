-- ----- fragment: minion_1enoch_76.sql (session250 1-enoch 76) -----
-- Source anchor: enoch/1-enoch ch76. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en76 (view _session250_en76_lookup). Sort band base 51875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en76_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-76-twelve-portals-winds
  ('enoch', '1-enoch', 76, 1, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The same treasury-gates at the ends of the earth from which Enoch sees the twelve winds issue.'),
  ('enoch', '1-enoch', 76, 1, 'canon', 'job', 38, 24, 'free', E'Job 38:24 — *By what way is the light parted, which scattereth the east wind upon the earth?* Yahuah''s question to Job names the very east wind Enoch traces back to its appointed eastern portal.'),
  ('enoch', '1-enoch', 76, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The lights and the winds keep one created order of signs and seasons — the moedim written into creation, not invented by men.'),
  ('enoch', '1-enoch', 76, 1, 'jubilees', 'jubilees', 2, 2, 'extras', E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost...* Jubilees sets angels over the winds and weather at creation, the same ordered powers Enoch sees gated at the earth''s ends.'),
  -- thread: 1-enoch-76-blessing-and-curse-winds
  ('enoch', '1-enoch', 76, 9, 'canon', 'job', 37, 9, 'free', E'Job 37:9 — *Out of the south cometh the whirlwind: and cold out of the north.* Job sorts the winds by quarter just as Enoch''s southern and northern portals send heat-and-drought against cold-and-drought.'),
  -- thread: 1-enoch-76-four-winds-four-quarters
  ('enoch', '1-enoch', 76, 14, 'canon', 'jeremiah', 49, 36, 'free', E'Jeremiah 49:36 — *And upon Elam will I bring the four winds from the four quarters of heaven, and will scatter them toward all those winds; and there shall be no nation whither the outcasts of Elam shall not come.* The four winds from the four quarters of heaven that Enoch resolves the twelve portals into are Yahuah''s instrument of judgment over the nations.'),
  ('enoch', '1-enoch', 76, 14, 'canon', 'daniel', 7, 2, 'free', E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* Daniel''s beast-vision opens on the same four winds of heaven whose ordered laws Enoch has just catalogued.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en76_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en76_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-76-twelve-portals-winds',
       E'Twelve portals at the ends of the earth — the winds in their treasuries',
       E'Uriel shows Enoch the order at the world''s edge: *And at the ends of the earth I saw twelve portals: out of the east three portals for blessing and prosperity, and three for cursing and destruction* (1 Enoch 76:1) — the winds do not blow at random but issue from appointed gates by the Creator''s reckoning. This is the same honest geography the Tanakh confesses: *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries* (Psalm 135:7) — the wind kept in a treasury, brought out by Yahuah''s hand, not summoned by men. Job hears the order spoken from the same edge of creation: *By what way is the light parted, which scattereth the east wind upon the earth?* (Job 38:24). The lights of Genesis 1 are *for signs, and for seasons, and for days, and years* (Genesis 1:14), and so too the winds keep their stations — the Creator''s covenant order written into the world. Jubilees names the very angels set over these powers at the first day: *and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost... and the angels of the spirits of cold and of heat* (Jubilees 2:2). It ain''t new: the gates, the treasuries, the appointed winds — one order, one Maker.',
       sv.verse_id, ev.verse_id, 'extras', 51875
  FROM _session250_en76_lookup sv, _session250_en76_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=76 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-76-blessing-and-curse-winds',
       E'Winds of blessing and prosperity, winds of cold and drought',
       E'Each portal carries its own charge: *And through the third portal the north-east wind comes forth, bringing cold and drought and destruction* (1 Enoch 76:4), while *through the first the west wind comes forth, bringing dew and rain and prosperity and blessing* (1 Enoch 76:5) — the winds are sorted to blessing and to curse, dew-and-rain against cold-and-drought, exactly the two roads the covenant sets before a people. Job knows this sorting by quarter: *Out of the south cometh the whirlwind: and cold out of the north* (Job 37:9) — the directions are not neutral but assigned. The order stands under one Maker, and the curse is never arbitrary law-as-curse but the withholding that follows broken covenant; the dew and the rain are the blessing-wind of His treasuries. Enoch is shown the whole catalogue so the reckoning can be kept, not so men may control the sky.',
       sv.verse_id, ev.verse_id, 'extras', 51878
  FROM _session250_en76_lookup sv, _session250_en76_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=76 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-76-four-winds-four-quarters',
       E'The twelve completed — the four winds from the four quarters',
       E'Uriel closes the survey: *And after these the twelve winds are completed, and all their laws and all their plagues and all their benefactions have I shown to thee, my son Methuselah* (1 Enoch 76:14) — twelve gates resolving into the four cardinal quarters, each wind bearing its law, its plague, and its benefaction. The prophets reckon by these same four quarters when Yahuah moves in judgment: *And upon Elam will I bring the four winds from the four quarters of heaven, and will scatter them toward all those winds* (Jeremiah 49:36). Daniel''s vision opens on the same fourfold order stirred over the deep: *I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea* (Daniel 7:2) — the winds out of which the beast-kingdoms rise are the very ordered powers Enoch catalogues. The winds keep their stations under the Creator; their laws and their plagues alike are His to deploy, and to read the order rightly is part of keeping the covenant reckoning.',
       sv.verse_id, ev.verse_id, 'extras', 51881
  FROM _session250_en76_lookup sv, _session250_en76_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=14
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=76 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-76-twelve-portals-winds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The same treasury-gates at the ends of the earth from which Enoch sees the twelve winds issue.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-twelve-portals-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:24 — *By what way is the light parted, which scattereth the east wind upon the earth?* Yahuah''s question to Job names the very east wind Enoch traces back to its appointed eastern portal.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-twelve-portals-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The lights and the winds keep one created order of signs and seasons — the moedim written into creation, not invented by men.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-twelve-portals-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost...* Jubilees sets angels over the winds and weather at creation, the same ordered powers Enoch sees gated at the earth''s ends.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-twelve-portals-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-76-blessing-and-curse-winds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 37:9 — *Out of the south cometh the whirlwind: and cold out of the north.* Job sorts the winds by quarter just as Enoch''s southern and northern portals send heat-and-drought against cold-and-drought.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-blessing-and-curse-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=37 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-76-four-winds-four-quarters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 49:36 — *And upon Elam will I bring the four winds from the four quarters of heaven, and will scatter them toward all those winds; and there shall be no nation whither the outcasts of Elam shall not come.* The four winds from the four quarters of heaven that Enoch resolves the twelve portals into are Yahuah''s instrument of judgment over the nations.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-four-winds-four-quarters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=49 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* Daniel''s beast-vision opens on the same four winds of heaven whose ordered laws Enoch has just catalogued.'
  FROM cross_reference_threads t, cross_references x, _session250_en76_lookup sv, _session250_en76_lookup tv
 WHERE t.slug='1-enoch-76-four-winds-four-quarters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=76 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

