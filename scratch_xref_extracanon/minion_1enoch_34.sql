-- ----- fragment: minion_1enoch_34.sql (session250 1-enoch 34) -----
-- Source anchor: enoch/1-enoch ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en34 (view _session250_en34_lookup). Sort band base 50825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-34-wind-out-of-his-treasuries
  ('enoch', '1-enoch', 34, 1, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The dew, rain, and frost that proceed through Enoch''s portals are the wind Yahuah brings out of His own treasuries.'),
  ('enoch', '1-enoch', 34, 1, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah locates the storehouse exactly where Enoch did — at the ends of the earth, the wind brought forth out of His treasures.'),
  ('enoch', '1-enoch', 34, 1, 'canon', 'job', 37, 9, 'free', E'Job 37:9 — *Out of the south cometh the whirlwind: and cold out of the north.* Job names the cold north-wind Enoch is shown loosed from the northern portals first.'),
  ('enoch', '1-enoch', 34, 1, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* Yahuah challenges Job with the very stored frost and hoar-frost that proceed through Enoch''s gates.'),
  ('enoch', '1-enoch', 34, 1, 'enoch', '1-enoch', 76, 1, 'extras', E'1 Enoch 76:1 — *And at the ends of the earth I saw twelve portals: out of the east three portals for blessing and prosperity, and three for cursing and destruction.* Enoch''s own Luminaries section expands chapter 34''s three-per-quarter gates into the full twelve portals of the winds.'),
  -- thread: 1-enoch-34-four-winds-four-quarters
  ('enoch', '1-enoch', 34, 6, 'canon', 'daniel', 7, 2, 'free', E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* Daniel''s four winds of heaven are Enoch''s winds that divide the earth into four parts, here stirring the sea of the nations.'),
  ('enoch', '1-enoch', 34, 6, 'canon', 'revelation', 7, 1, 'free', E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John posts angels over Enoch''s four quarters, holding back the four winds until the servants of Elohim are sealed.'),
  -- thread: 1-enoch-34-pillars-stretched-vaults-of-heaven
  ('enoch', '1-enoch', 34, 8, 'canon', 'job', 26, 11, 'free', E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* Job names the same pillars of the heaven Enoch sees the winds raise between heaven and earth.'),
  ('enoch', '1-enoch', 34, 7, 'canon', 'job', 26, 7, 'free', E'Job 26:7 — *He stretcheth out the north over the empty place, and hangeth the earth upon nothing.* Job''s hung earth matches the winds Enoch sees supporting the earth and the firmament of heaven.'),
  ('enoch', '1-enoch', 34, 8, 'canon', 'isaiah', 40, 22, 'free', E'Isaiah 40:22 — *It is he that sitteth upon the circle of the earth, and the inhabitants thereof are as grasshoppers; that stretcheth out the heavens as a curtain, and spreadeth them out as a tent to dwell in:* Isaiah''s stretched-out heavens are the vaults Enoch sees the winds stretch out as the pillars of the heaven.'),
  ('enoch', '1-enoch', 34, 7, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The Psalm makes the winds Yahuah''s own ministering servants, the same agents Enoch watches support the earth and uphold the firmament.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-34-wind-out-of-his-treasuries',
       E'The north gates of heaven — the wind out of His treasuries',
       E'Enoch is carried to the ends of the earth and shown the gates from which the winds are loosed: *And from thence I went to the north, to the ends of the earth, and there I saw three portals of the heaven open: through each of them proceed north winds: when they blow there is dew and rain and hoar-frost.* (1 Enoch 34:1). The Tanakh keeps the very same storehouse: the wind, the rain, the frost are not stray weather but provisions Yahuah dispenses from His own treasuries — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* (Psalm 135:7), word for word again in *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* (Jeremiah 10:13). Job names the cold north-quarter Enoch saw first — *Out of the south cometh the whirlwind: and cold out of the north.* (Job 37:9) — and asks whether mortal man has ever entered those stores: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* (Job 38:22). It ain''t new: the gated winds and the stored frost of 1 Enoch 34 are the canon''s own doctrine that the Creator orders the weather from sealed treasuries no man controls.',
       sv.verse_id, ev.verse_id, 'extras', 50825
  FROM _session250_en34_lookup sv, _session250_en34_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=34 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-34-four-winds-four-quarters',
       E'The four quarters of the earth and its four winds',
       E'Having walked north, east, south, and west, Enoch sees the whole compass at once: *And I saw the four quarters of the earth, and the winds which divide the earth into four parts.* (1 Enoch 34:6). The fourfold winds are a fixed feature of canon prophecy. Daniel watches them stir the nations: *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* (Daniel 7:2). Revelation sets angels over those same four winds, restrained until the sealing is done: *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* (Revelation 7:1). It ain''t new: Enoch''s four quarters and dividing winds are the architecture Daniel and John assume — the earth ordered to four corners, the winds held or loosed at the Creator''s word.',
       sv.verse_id, ev.verse_id, 'extras', 50828
  FROM _session250_en34_lookup sv, _session250_en34_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=34 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-34-pillars-stretched-vaults-of-heaven',
       E'The winds that bear the earth — the pillars of heaven',
       E'The chapter closes on the cosmic frame: *And I saw the winds which support the earth and the firmament of the heaven.* (1 Enoch 34:7), and *And I saw how the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 34:8). The canon speaks the same architecture. Job knows both the hung earth and the trembling pillars: *He stretcheth out the north over the empty place, and hangeth the earth upon nothing.* (Job 26:7), and *The pillars of heaven tremble and are astonished at his reproof.* (Job 26:11). Isaiah sees the heavens stretched as a tent — *It is he that sitteth upon the circle of the earth, and the inhabitants thereof are as grasshoppers; that stretcheth out the heavens as a curtain, and spreadeth them out as a tent to dwell in:* (Isaiah 40:22) — and the Psalm makes the very winds His servants: *Who maketh his angels spirits; his ministers a flaming fire:* (Psalm 104:4). It ain''t new: Enoch''s pillars and stretched-out vaults are the canon''s own picture of a heaven the Creator hangs, spreads, and upholds.',
       sv.verse_id, ev.verse_id, 'extras', 50831
  FROM _session250_en34_lookup sv, _session250_en34_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=34 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-34-wind-out-of-his-treasuries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The dew, rain, and frost that proceed through Enoch''s portals are the wind Yahuah brings out of His own treasuries.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-wind-out-of-his-treasuries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah locates the storehouse exactly where Enoch did — at the ends of the earth, the wind brought forth out of His treasures.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-wind-out-of-his-treasuries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 37:9 — *Out of the south cometh the whirlwind: and cold out of the north.* Job names the cold north-wind Enoch is shown loosed from the northern portals first.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-wind-out-of-his-treasuries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=37 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* Yahuah challenges Job with the very stored frost and hoar-frost that proceed through Enoch''s gates.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-wind-out-of-his-treasuries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 76:1 — *And at the ends of the earth I saw twelve portals: out of the east three portals for blessing and prosperity, and three for cursing and destruction.* Enoch''s own Luminaries section expands chapter 34''s three-per-quarter gates into the full twelve portals of the winds.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-wind-out-of-his-treasuries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=76 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-34-four-winds-four-quarters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* Daniel''s four winds of heaven are Enoch''s winds that divide the earth into four parts, here stirring the sea of the nations.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-four-winds-four-quarters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John posts angels over Enoch''s four quarters, holding back the four winds until the servants of Elohim are sealed.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-four-winds-four-quarters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-34-pillars-stretched-vaults-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* Job names the same pillars of the heaven Enoch sees the winds raise between heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-pillars-stretched-vaults-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 26:7 — *He stretcheth out the north over the empty place, and hangeth the earth upon nothing.* Job''s hung earth matches the winds Enoch sees supporting the earth and the firmament of heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-pillars-stretched-vaults-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:22 — *It is he that sitteth upon the circle of the earth, and the inhabitants thereof are as grasshoppers; that stretcheth out the heavens as a curtain, and spreadeth them out as a tent to dwell in:* Isaiah''s stretched-out heavens are the vaults Enoch sees the winds stretch out as the pillars of the heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-pillars-stretched-vaults-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The Psalm makes the winds Yahuah''s own ministering servants, the same agents Enoch watches support the earth and uphold the firmament.'
  FROM cross_reference_threads t, cross_references x, _session250_en34_lookup sv, _session250_en34_lookup tv
 WHERE t.slug='1-enoch-34-pillars-stretched-vaults-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=34 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

