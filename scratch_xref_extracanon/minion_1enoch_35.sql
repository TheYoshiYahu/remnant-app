-- ----- fragment: minion_1enoch_35.sql (session250 1-enoch 35) -----
-- Source anchor: enoch/1-enoch ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en35 (view _session250_en35_lookup). Sort band base 50850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-35-west-gates-storehouses-of-wind
  ('enoch', '1-enoch', 35, 2, 'canon', 'psalms', 135, 7, 'free', E'Psalms 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The west portals of Enoch 35:2 are these very treasuries from which Yahuah brings out the wind.'),
  ('enoch', '1-enoch', 35, 2, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah locates the wind''s source at the ends of the earth, exactly where Enoch 35:2 sees the portals that send it forth with rain.'),
  ('enoch', '1-enoch', 35, 2, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The hoar-frost coming through Enoch''s west portals (35:2) is drawn from these treasuries no man has entered.'),
  ('enoch', '1-enoch', 35, 1, 'enoch', '1-enoch', 34, 4, 'extras', E'1 Enoch 34:4 — *And from thence I went to the west, to the ends of the earth, and saw there three portals of the heaven open: through each of them proceed west winds: when they blow there is dew and rain and hoar-frost.* The journey of chapter 34 already met the west portals; chapter 35:1 returns to describe them, marking them small such as he had seen in the east.'),
  -- thread: 1-enoch-35-four-quarters-and-the-four-winds
  ('enoch', '1-enoch', 35, 5, 'canon', 'daniel', 7, 2, 'free', E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* Daniel''s four winds of heaven are Enoch''s same winds that divide the earth into four parts (35:5).'),
  ('enoch', '1-enoch', 35, 5, 'canon', 'zechariah', 6, 5, 'free', E'Zechariah 6:5 — *And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth.* The four winds Enoch sees dividing the earth (35:5) are these four heaven-spirits that go forth at Yahuah''s command.'),
  ('enoch', '1-enoch', 35, 5, 'canon', 'revelation', 7, 1, 'free', E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John sees the four winds and four corners of Enoch 35:5 held in check until the servants of Elohim are sealed.'),
  ('enoch', '1-enoch', 35, 5, 'canon', 'matthew', 24, 31, 'free', E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The four quarters Enoch surveys (35:5) become the compass from which Yahusha gathers the scattered elect of Yashar''el.'),
  -- thread: 1-enoch-35-pillars-of-heaven-and-the-firmament
  ('enoch', '1-enoch', 35, 7, 'canon', 'job', 26, 11, 'free', E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* Enoch names these same pillars of the heaven (35:7) that Job says tremble at Yahuah''s rebuke.'),
  ('enoch', '1-enoch', 35, 6, 'canon', '1-samuel', 2, 8, 'free', E'1 Samuel 2:8 — *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* The supports of the earth Enoch sees (35:6) belong to Yahuah, who set the world upon them.'),
  ('enoch', '1-enoch', 35, 7, 'canon', 'genesis', 1, 6, 'free', E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* The firmament Enoch sees stretched out between heaven and earth (35:7) is the firmament Elohim spoke into being on day two.'),
  ('enoch', '1-enoch', 35, 6, 'enoch', '1-enoch', 36, 9, 'extras', E'1 Enoch 36:9 — *And I saw how Yahuah (God) has ordered all creation by His wisdom, and how He has founded the world upon them.* The next gate-chapter closes by naming the Architect of the supports and pillars Enoch sees here at 35:6, founding the world by His wisdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-35-west-gates-storehouses-of-wind',
       E'The west portals and the storehouses of wind, dew, and rain',
       E'Enoch comes to the western edge and finds the same ordered apparatus he saw in the east: *And from thence I proceeded to the west of the ends of the earth, and saw there three portals of the heaven open such as I had seen in the east, but small, and three portals to the north, small likewise.* (1 Enoch 35:1) — and through them the winds come as gift, not chaos: *And the portals of the west are small, and through them proceed the west winds: when they blow there is dew and rain and hoar-frost.* (1 Enoch 35:2), repeated at the close, *And I saw the portals of the heaven open in the west, and through them proceed the winds which bring dew and rain and hoar-frost.* (1 Enoch 35:8). The Tanakh already keeps wind and weather in named storehouses that Yahuah opens at His word: *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* (Psalms 135:7); *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* (Jeremiah 10:13); and the same storehouses hold the frost Enoch names — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* (Job 38:22). This is the Creator''s order, not the Watchers'' rebellion: the lights and winds keep the way appointed for them, and Enoch is shown it gate by gate.',
       sv.verse_id, ev.verse_id, 'extras', 50850
  FROM _session250_en35_lookup sv, _session250_en35_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=35 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-35-four-quarters-and-the-four-winds',
       E'The four quarters of the earth and the four winds',
       E'From the western edge Enoch is shown the whole frame of the world divided into its four divisions: *And I saw the four quarters of the earth, and the winds which divide the earth into four parts.* (1 Enoch 35:5). The four winds and four quarters are the standard furniture of canonical vision. Daniel watches them stir the nations: *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* (Daniel 7:2). Zechariah is told the four chariot-spirits are the same: *And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth.* (Zechariah 6:5). John sees them held back at the corners: *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* (Revelation 7:1). And Yahusha gathers the scattered seed from these same four winds at the end — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* (Matthew 24:31): the four quarters Enoch surveys are the very compass from which the elect of Yashar''el are regathered.',
       sv.verse_id, ev.verse_id, 'extras', 50853
  FROM _session250_en35_lookup sv, _session250_en35_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=35 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-35-pillars-of-heaven-and-the-firmament',
       E'The pillars of heaven and the stretched-out firmament',
       E'Enoch sees the winds themselves doing the structural work of upholding the cosmos: *And I saw the winds which support the earth and the firmament of the heaven.* (1 Enoch 35:6); *And I saw how the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 35:7). The Tanakh names these pillars and the firmament they bear. Job knows the heavens rest on trembling pillars: *The pillars of heaven tremble and are astonished at his reproof.* (Job 26:11), and that the earth''s foundations are Yahuah''s own setting: *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* (1 Samuel 2:8). The firmament Enoch sees stretched is the firmament of Genesis day two: *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* (Genesis 1:6). The parallel close of the next gate-chapter names the Architect outright — *And I saw how Yahuah (God) has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 36:9) — confirming that this whole survey is creation kept in the Creator''s order, the opposite of the Watchers'' disorder.',
       sv.verse_id, ev.verse_id, 'extras', 50856
  FROM _session250_en35_lookup sv, _session250_en35_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=35 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-35-west-gates-storehouses-of-wind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The west portals of Enoch 35:2 are these very treasuries from which Yahuah brings out the wind.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-west-gates-storehouses-of-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah locates the wind''s source at the ends of the earth, exactly where Enoch 35:2 sees the portals that send it forth with rain.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-west-gates-storehouses-of-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The hoar-frost coming through Enoch''s west portals (35:2) is drawn from these treasuries no man has entered.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-west-gates-storehouses-of-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 34:4 — *And from thence I went to the west, to the ends of the earth, and saw there three portals of the heaven open: through each of them proceed west winds: when they blow there is dew and rain and hoar-frost.* The journey of chapter 34 already met the west portals; chapter 35:1 returns to describe them, marking them small such as he had seen in the east.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-west-gates-storehouses-of-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-35-four-quarters-and-the-four-winds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* Daniel''s four winds of heaven are Enoch''s same winds that divide the earth into four parts (35:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-four-quarters-and-the-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 6:5 — *And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth.* The four winds Enoch sees dividing the earth (35:5) are these four heaven-spirits that go forth at Yahuah''s command.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-four-quarters-and-the-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John sees the four winds and four corners of Enoch 35:5 held in check until the servants of Elohim are sealed.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-four-quarters-and-the-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The four quarters Enoch surveys (35:5) become the compass from which Yahusha gathers the scattered elect of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-four-quarters-and-the-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-35-pillars-of-heaven-and-the-firmament
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* Enoch names these same pillars of the heaven (35:7) that Job says tremble at Yahuah''s rebuke.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-pillars-of-heaven-and-the-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 2:8 — *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* The supports of the earth Enoch sees (35:6) belong to Yahuah, who set the world upon them.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-pillars-of-heaven-and-the-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* The firmament Enoch sees stretched out between heaven and earth (35:7) is the firmament Elohim spoke into being on day two.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-pillars-of-heaven-and-the-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 36:9 — *And I saw how Yahuah (God) has ordered all creation by His wisdom, and how He has founded the world upon them.* The next gate-chapter closes by naming the Architect of the supports and pillars Enoch sees here at 35:6, founding the world by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en35_lookup sv, _session250_en35_lookup tv
 WHERE t.slug='1-enoch-35-pillars-of-heaven-and-the-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=35 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=36 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

