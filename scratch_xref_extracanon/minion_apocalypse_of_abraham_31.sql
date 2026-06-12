-- ----- fragment: minion_apocalypseofabraham_31.sql (session253 apocalypse-of-abraham 31) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa31 (view _session253_aoa31_lookup). Sort band base 67750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-31-trumpet-elect-one-gathering
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 1, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The same trumpet that summons Abraham''s despised people from the nations in Apocalypse of Abraham 31:1 gathers the outcasts of Israel home.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 1, 'canon', 'matthew', 24, 31, 'free', E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The Messiah''s trumpet-gathering of the elect is the very scene of the Elect One summoning the despised people in Apocalypse of Abraham 31:1.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 1, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The summoning of the despised people from the nations in Apocalypse of Abraham 31:1 is this second-time recovery of the scattered remnant — the two-house gathering, not a replacement.'),
  -- thread: apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 2, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The fire prepared for the mockers in Apocalypse of Abraham 31:2 is Malachi''s oven-day that burns up the proud who scorned the righteous.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 2, 'canon', 'revelation', 20, 14, 'free', E'Revelation 20:14 — *And death and hell were cast into the lake of fire. This is the second death.* The fire of Hades and the ceaseless underworld torment of Apocalypse of Abraham 31:2 is the second death — death and hell themselves cast in.'),
  -- thread: apocalypse-of-abraham-31-two-peoples-kept-commandments
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 3, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The two peoples of Apocalypse of Abraham 31:3 — those who kept the commandments and those who followed the idols — are the two ways Moses set before Israel.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 3, 'canon', 'deuteronomy', 30, 16, 'free', E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Those who *openly kept my commandments* in Apocalypse of Abraham 31:3 walk the commanded way of life that Moses set out — Torah stands, never as a curse.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 3, 'canon', 'matthew', 25, 32, 'free', E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The downfall of the idol-followers and the joy of the commandment-keepers in Apocalypse of Abraham 31:3 is the Messiah''s final separation of the sheep from the goats.'),
  -- thread: apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The evil worm Azazel whose fire devours the idolaters in Apocalypse of Abraham 31:4 is the bound Watcher of Enoch''s vision.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The fire of Azazel''s tongue in Apocalypse of Abraham 31:4 answers Enoch''s word that Azazel himself is cast into the fire at the great judgment.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'canon', 'leviticus', 16, 8, 'free', E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* Azazel by name in Apocalypse of Abraham 31:4 is the scapegoat''s lot of the Torah, the one set apart from Yahuah''s — the adversary''s portion.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The fallen Azazel devouring the idolaters in Apocalypse of Abraham 31:4 is among the angels reserved in chains for the judgment of the great day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-trumpet-elect-one-gathering',
       E'The trumpet, the Elect One, and the despised people summoned',
       E'The vision ends where Yahuah''s word always ends — with a trumpet and a gathering: *"And then I will sound the trumpet out of the air, and will send mine Elect One, having in him all my power, one measure; and this one shall summon my despised people from the nations, and I will burn with fire those who have insulted them and who have ruled among them in this Age."* (Apocalypse of Abraham 31:1). It ain''t new. The prophets blew this same trumpet over Abraham''s scattered seed: *"And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem."* (Isaiah 27:13). The Messiah names the same Elect One and the same sound: *"And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other."* (Matthew 24:31). This is the two-house regathering, not a church replacing Israel — *"that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt..."* (Isaiah 11:11). The despised people are summoned home; the seed kept by promise is not lost.',
       sv.verse_id, ev.verse_id, 'extras', 67750
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors',
       E'The day that burns as an oven on those who mocked',
       E'Those who insulted and ruled over Abraham''s people are appointed to the fire: *"And I will give those who have covered me with mockery to the scorn of the coming Age; and I have prepared them to be food for the fire of Hades, and for ceaseless flight to and fro through the air in the underworld beneath the earth, the body filled with worms."* (Apocalypse of Abraham 31:2). It ain''t new. Malachi saw the same furnace-day: *"For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch."* (Malachi 4:1). The Revelation seals it: *"And death and hell were cast into the lake of fire. This is the second death."* (Revelation 20:14). The fire of Hades that swallows the mockers is the second death of the prophets — judgment falling on the system that ruled over and scorned the elect, not the cancelling of Yahuah''s covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67753
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-two-peoples-kept-commandments',
       E'Those who kept the commandments and those who chose the idols',
       E'The line is drawn between two peoples by what they chose to do: *"For on them shall they see the righteousness of the Creator — those, namely, who have chosen to do my will, and those who have openly kept my commandments; and they shall rejoice with joy over the downfall of the men who still remain, who have followed the idols and their murders."* (Apocalypse of Abraham 31:3). It ain''t new. Moses set the same two ways before the people: *"See, I have set before thee this day life and good, and death and evil;"* (Deuteronomy 30:15). The Messiah divides the same two flocks at the end: *"And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:"* (Matthew 25:32). Election precedes confession, and Torah stands — the righteous are known by having *openly kept my commandments*, the wicked by following the idols. The keeping of the commandments was never the curse; it is the mark of those who see the righteousness of the Creator.',
       sv.verse_id, ev.verse_id, 'extras', 67756
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah',
       E'The worm and fire of Azazel, and the strange god forsaken for Yahuah',
       E'The fallen one rebuked through the whole vision is named as the destroyer of the idolaters: *"For they shall putrefy in the body of the evil worm Azazel, and be burnt with the fire of Azazel''s tongue; for I hoped that they would come to me, and not have loved and praised the strange god, and not have adhered to him for whom they were not allotted, but instead they have forsaken the mighty Yahuah (Lord)."* (Apocalypse of Abraham 31:4). It ain''t new. Azazel is the Watcher to whom all sin is ascribed, bound for the fire: *"And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein."* (1 Enoch 10:4); *"And on the day of the great judgement he shall be cast into the fire."* (1 Enoch 10:6). The Torah already set his lot apart by name: *"And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat."* (Leviticus 16:8). And the apostle keeps the same reservation: *"And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day."* (Jude 1:6). Those who adhered to the strange god — to him for whom they were not allotted — share Azazel''s fire; they forsook the mighty Yahuah for the system of the adversary.',
       sv.verse_id, ev.verse_id, 'extras', 67759
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-31-trumpet-elect-one-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The same trumpet that summons Abraham''s despised people from the nations in Apocalypse of Abraham 31:1 gathers the outcasts of Israel home.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-trumpet-elect-one-gathering'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The Messiah''s trumpet-gathering of the elect is the very scene of the Elect One summoning the despised people in Apocalypse of Abraham 31:1.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-trumpet-elect-one-gathering'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The summoning of the despised people from the nations in Apocalypse of Abraham 31:1 is this second-time recovery of the scattered remnant — the two-house gathering, not a replacement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-trumpet-elect-one-gathering'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The fire prepared for the mockers in Apocalypse of Abraham 31:2 is Malachi''s oven-day that burns up the proud who scorned the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:14 — *And death and hell were cast into the lake of fire. This is the second death.* The fire of Hades and the ceaseless underworld torment of Apocalypse of Abraham 31:2 is the second death — death and hell themselves cast in.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-31-two-peoples-kept-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The two peoples of Apocalypse of Abraham 31:3 — those who kept the commandments and those who followed the idols — are the two ways Moses set before Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Those who *openly kept my commandments* in Apocalypse of Abraham 31:3 walk the commanded way of life that Moses set out — Torah stands, never as a curse.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The downfall of the idol-followers and the joy of the commandment-keepers in Apocalypse of Abraham 31:3 is the Messiah''s final separation of the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The evil worm Azazel whose fire devours the idolaters in Apocalypse of Abraham 31:4 is the bound Watcher of Enoch''s vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The fire of Azazel''s tongue in Apocalypse of Abraham 31:4 answers Enoch''s word that Azazel himself is cast into the fire at the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* Azazel by name in Apocalypse of Abraham 31:4 is the scapegoat''s lot of the Torah, the one set apart from Yahuah''s — the adversary''s portion.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The fallen Azazel devouring the idolaters in Apocalypse of Abraham 31:4 is among the angels reserved in chains for the judgment of the great day.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

