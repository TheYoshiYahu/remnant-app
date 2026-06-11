-- ----- fragment: minion_1enoch_36.sql (session250 1-enoch 36) -----
-- Source anchor: enoch/1-enoch ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en36 (view _session250_en36_lookup). Sort band base 50875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-36-portals-four-winds
  ('enoch', '1-enoch', 36, 3, 'canon', 'revelation', 7, 1, 'free', E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John sees the same four winds at the four quarters that Enoch sees dividing the earth into four parts.'),
  ('enoch', '1-enoch', 36, 1, 'canon', 'job', 28, 25, 'free', E'Job 28:25 — *To make the weight for the winds; and he weigheth the waters by measure.* The very winds that bring Enoch''s dew, rain, and hoar-frost are weighed out by the Creator who orders them.'),
  ('enoch', '1-enoch', 36, 3, 'enoch', '1-enoch', 77, 1, 'extras', E'1 Enoch 77:1 — *And the first quarter is called the east, because it is the first: and the second, the south, because the Most High descends there, yea, there in quite a special sense He who is blessed for ever comes down.* Enoch''s own Luminaries book names the same four quarters he surveys here, confirming one consistent cosmology across the books.'),
  -- thread: 1-enoch-36-pillars-of-heaven
  ('enoch', '1-enoch', 36, 5, 'canon', '1-samuel', 2, 8, 'free', E'1 Samuel 2:8 — *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* Hannah confesses the pillars of the earth that Enoch beholds, and that they belong to Yahuah who set the world upon them.'),
  ('enoch', '1-enoch', 36, 5, 'canon', 'jeremiah', 10, 12, 'free', E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The stretching-out of the vaults of heaven that Enoch watches is Yahuah''s own work of establishing and spreading the heavens.'),
  ('enoch', '1-enoch', 36, 4, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The foundations Enoch sees the winds support are the same foundations Yahuah challenges Job to account for — they are the Creator''s, not man''s.'),
  -- thread: 1-enoch-36-ordered-by-wisdom-praise
  ('enoch', '1-enoch', 36, 9, 'canon', 'proverbs', 3, 19, 'free', E'Proverbs 3:19 — *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* This is the canon''s exact confession of what Enoch sees: Yahuah ordered and founded all creation by His wisdom.'),
  ('enoch', '1-enoch', 36, 9, 'canon', 'psalms', 104, 24, 'free', E'Psalm 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* The psalmist marvels at the wisdom-made creation that Enoch''s closing blessing celebrates.'),
  ('enoch', '1-enoch', 36, 9, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The ordered heavens Enoch surveys are themselves a ceaseless declaration of the Creator''s glory.'),
  ('enoch', '1-enoch', 36, 9, 'canon', 'psalms', 148, 3, 'free', E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The lights of the heaven Enoch journeyed among are called to praise the Creator whose wisdom set them in order.'),
  ('enoch', '1-enoch', 36, 9, 'jubilees', 'jubilees', 2, 2, 'extras', E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence... and of snow and of hail and of hoar frost...* Jubilees confesses the same created, ordered service — even the winds and hoar-frost of Enoch 36 — set in place by the Creator''s wisdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-36-portals-four-winds',
       E'The portals of heaven and the four winds',
       E'Enoch ends his journey at the south, *And from thence I proceeded to the south, to the ends of the earth, and saw there three portals of the heaven open: through each of them proceed south winds: when they blow there is dew and rain and hoar-frost.* (1 Enoch 36:1), and he sees *the four quarters of the earth, and the winds which divide the earth into four parts.* (1 Enoch 36:3). This is not invented machinery — John sees the same four-cornered order in the last days: *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* (Revelation 7:1). Job already knew the winds are weighed and measured by the Creator''s hand — *To make the weight for the winds; and he weigheth the waters by measure.* (Job 28:25) — and Enoch within his own Luminaries book names those same quarters: *And the first quarter is called the east, because it is the first... And the west quarter is named the diminished, because there all the luminaries of the heaven wane and go down.* (1 Enoch 77:1). The four winds are the Creator''s ordered servants, not free powers.',
       sv.verse_id, ev.verse_id, 'extras', 50875
  FROM _session250_en36_lookup sv, _session250_en36_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=36 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-36-pillars-of-heaven',
       E'The winds that bear the earth — the pillars of heaven',
       E'Enoch sees *the winds which support the earth and the firmament of the heaven* (1 Enoch 36:4), and *how the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 36:5). Scripture speaks the same way of the world resting on the Creator''s pillars: *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* (1 Samuel 2:8). The stretching-out of the heavens is the Creator''s own act — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* (Jeremiah 10:12) — and when Yahuah answers Job He plants this same foundation: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* (Job 38:4). Enoch is not describing brute pillars but the ordered service of winds upholding what Yahuah has founded.',
       sv.verse_id, ev.verse_id, 'extras', 50878
  FROM _session250_en36_lookup sv, _session250_en36_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=36 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-36-ordered-by-wisdom-praise',
       E'All creation ordered by His wisdom — Enoch blesses Yahuah of glory',
       E'The Book of the Watchers closes in a doxology: *And I saw how Yahuah (God) has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 36:9). This is the heart of the canon''s own confession — *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* (Proverbs 3:19) — and the psalmist cries the same wonder Enoch feels: *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* (Psalm 104:24). The wordless witness of that ordered creation never stops praising — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1), *Day unto day uttereth speech, and night unto night sheweth knowledge.* (Psalm 19:2) — the sun and moon and stars are summoned by name to praise: *Praise ye him, sun and moon: praise him, all ye stars of light.* (Psalm 148:3); and that praise stretches over the whole earth Enoch has just circled: *From the rising of the sun unto the going down of the same the LORD''S name is to be praised.* (Psalm 113:3). Jubilees confesses the same six-day ordering, that even *the angels of the spirit of the winds... and of snow and of hail and of hoar frost* (Jubilees 2:2) were created and set to serve. Enoch ends as every righteous one ends — blessing the Creator whose wisdom holds the world.',
       sv.verse_id, ev.verse_id, 'extras', 50881
  FROM _session250_en36_lookup sv, _session250_en36_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=36 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-36-portals-four-winds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John sees the same four winds at the four quarters that Enoch sees dividing the earth into four parts.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-portals-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 28:25 — *To make the weight for the winds; and he weigheth the waters by measure.* The very winds that bring Enoch''s dew, rain, and hoar-frost are weighed out by the Creator who orders them.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-portals-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 77:1 — *And the first quarter is called the east, because it is the first: and the second, the south, because the Most High descends there, yea, there in quite a special sense He who is blessed for ever comes down.* Enoch''s own Luminaries book names the same four quarters he surveys here, confirming one consistent cosmology across the books.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-portals-four-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=77 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-36-pillars-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 2:8 — *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* Hannah confesses the pillars of the earth that Enoch beholds, and that they belong to Yahuah who set the world upon them.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-pillars-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The stretching-out of the vaults of heaven that Enoch watches is Yahuah''s own work of establishing and spreading the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-pillars-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The foundations Enoch sees the winds support are the same foundations Yahuah challenges Job to account for — they are the Creator''s, not man''s.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-pillars-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-36-ordered-by-wisdom-praise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:19 — *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* This is the canon''s exact confession of what Enoch sees: Yahuah ordered and founded all creation by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-ordered-by-wisdom-praise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* The psalmist marvels at the wisdom-made creation that Enoch''s closing blessing celebrates.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-ordered-by-wisdom-praise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The ordered heavens Enoch surveys are themselves a ceaseless declaration of the Creator''s glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-ordered-by-wisdom-praise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The lights of the heaven Enoch journeyed among are called to praise the Creator whose wisdom set them in order.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-ordered-by-wisdom-praise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence... and of snow and of hail and of hoar frost...* Jubilees confesses the same created, ordered service — even the winds and hoar-frost of Enoch 36 — set in place by the Creator''s wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en36_lookup sv, _session250_en36_lookup tv
 WHERE t.slug='1-enoch-36-ordered-by-wisdom-praise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

