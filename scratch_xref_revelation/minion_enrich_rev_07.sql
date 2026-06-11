-- S227 enrichment — Revelation 7: 144,000 + great multitude (Sukkot palms; the Lamb feeds)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: white-robes-and-palms-the-sukkot-ingathering — add prophetic roots (no prophetic member yet)
  ('canon','revelation',7,9,'canon','zechariah',14,16,'free', E'*every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* (Zechariah 14:16). The palms in the multitude''s hands (Revelation 7:9) are the palms of the feast Zechariah said the gathered nations would keep — *the feast of tabernacles,* Sukkot. The prophet foresaw the regathered from all nations going up to keep the ingathering feast before the King; the seer sees them arrived, palm-bearing before the throne, keeping the great Sukkot the prophet promised.'),
  ('canon','revelation',7,14,'canon','isaiah',1,18,'free', E'*though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool.* (Isaiah 1:18). The white robes are explained at the throne: *these are they... which have washed their robes, and made them white in the blood of the Lamb* (Revelation 7:14). Isaiah had promised the very washing — sins scarlet and crimson made *white as snow,* white as wool. The robes washed white are the prophet''s cleansing made visible: the blood of the Lamb does what Isaiah said Yahuah (LORD) would do, turning the crimson-stained white.'),
  ('canon','revelation',7,14,'canon','daniel',12,10,'free', E'*Many shall be purified, and made white, and tried; but the wicked shall do wickedly... but the wise shall understand.* (Daniel 12:10). They *came out of great tribulation, and have washed their robes, and made them white* (Revelation 7:14). Daniel foresaw the end-time refining: *many shall be purified, and made white, and tried.* The white-robed who came through tribulation are Daniel''s purified and tried — made white not by their own hand but by the trial endured and the blood of the Lamb, the wise who are kept while the wicked do wickedly.'),

  -- thread: the-lamb-shall-feed-them-and-lead-them-to-living-fountains — add 2 Esdras (fountains/trees), no extra yet
  ('canon','revelation',7,17,'apocrypha','2-esdras',2,19,'extras', E'*And as many fountains flowing with milk and honey, and seven mighty mountains, whereupon there grow roses and lilies, by which I will fill your children with joy.* (2 Esdras 2:19). The Lamb *shall lead them unto living fountains of waters* (Revelation 7:17), and the restored library shows the same reward of the gathered: *fountains flowing with milk and honey* and the trees of the holy mountains where Yahuah (God) fills his children with joy. The living fountains of the throne and the flowing fountains of Esdras are one promise — the homecoming seed led to springs of life and joy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- white-robes-and-palms-the-sukkot-ingathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:16 — *all the nations... shall even go up from year to year to worship the King... and to keep the feast of tabernacles* the prophet''s gathered nations keeping Sukkot, the palms in the multitude''s hands (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 1:18 — *though your sins be as scarlet, they shall be as white as snow* the prophet''s washing white, the robes made white in the blood of the Lamb (Revelation 7:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Daniel 12:10 — *Many shall be purified, and made white, and tried* the end-time refining; the white-robed who came out of great tribulation are Daniel''s purified and tried (Revelation 7:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-lamb-shall-feed-them-and-lead-them-to-living-fountains
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 2:19 — *as many fountains flowing with milk and honey... by which I will fill your children with joy* the restored library''s flowing fountains, the living fountains the Lamb leads the gathered to (Revelation 7:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
