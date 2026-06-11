-- ----- fragment: minion_1enoch_58.sql (session250 1-enoch 58) -----
-- Source anchor: enoch/1-enoch ch58. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en58 (view _session250_en58_lookup). Sort band base 51425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en58_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-58-everlasting-light
  ('enoch', '1-enoch', 58, 3, 'canon', 'isaiah', 60, 19, 'free', E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The very light of eternal life Enoch grants the elect at 58:3 is Yahuah Himself become their everlasting light.'),
  ('enoch', '1-enoch', 58, 3, 'canon', 'isaiah', 60, 20, 'free', E'Isaiah 60:20 — *Thy sun shall no more go down; neither shall thy moon withdraw itself: for Yahuah (LORD) shall be thine everlasting light, and the days of thy mourning shall be ended.* The sun that never sets answers Enoch''s days of life that are unending and without number (58:3).'),
  ('enoch', '1-enoch', 58, 3, 'canon', 'revelation', 21, 23, 'free', E'Revelation 21:23 — *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof.* John sees the same uncreated light that lights the elect in Enoch 58:3, now shining as the glory of Elohim and the Lamb.'),
  ('enoch', '1-enoch', 58, 3, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The light of eternal life and the days without number of Enoch 58:3 close in John''s no-night reign forever and ever.'),
  -- thread: 1-enoch-58-righteous-shine
  ('enoch', '1-enoch', 58, 3, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The elect who stand in the light of eternal life (Enoch 58:3) are Daniel''s wise who shine as stars for ever and ever.'),
  ('enoch', '1-enoch', 58, 3, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha sets the righteous shining as the sun in the Father''s kingdom, the very picture of Enoch''s righteous in the light of the sun (58:3).'),
  ('enoch', '1-enoch', 58, 3, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'The Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* A parallel extra-canonical witness that the righteous shine at their vindication, echoing the light of the elect in Enoch 58:3.'),
  -- thread: 1-enoch-58-peace-in-the-name
  ('enoch', '1-enoch', 58, 4, 'enoch', '1-enoch', 1, 8, 'extras', E'1 Enoch 1:8 — *But with the righteous He will make peace, And will protect the elect, And mercy shall be upon them, And they shall all belong to Elohim (God), And they shall be prospered, And they shall all be blessed, And He will help them all, And light shall appear unto them, And He will make peace with them.* The peace and light promised to the elect at the book''s opening returns as the third Parable''s peace in the name of Yahuah of Spirits (58:4).'),
  -- thread: 1-enoch-58-darkness-destroyed
  ('enoch', '1-enoch', 58, 6, 'canon', 'revelation', 21, 25, 'free', E'Revelation 21:25 — *And the gates of it shall not be shut at all by day: for there shall be no night there.* The light established for ever before Yahuah of Spirits, with darkness destroyed (Enoch 58:6), is John''s city of perpetual day with no night.'),
  ('enoch', '1-enoch', 58, 5, 'canon', 'isaiah', 60, 20, 'free', E'Isaiah 60:20 — *Thy sun shall no more go down; neither shall thy moon withdraw itself: for Yahuah (LORD) shall be thine everlasting light, and the days of thy mourning shall be ended.* Isaiah''s light that never sets stands behind Enoch''s secrets become bright as the sun with the darkness past (58:5).'),
  ('enoch', '1-enoch', 58, 6, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The light with no limit that shall never cease (Enoch 58:6) is John''s no-night reign where Yahuah Elohim Himself gives them light.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en58_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en58_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-58-everlasting-light',
       E'Yahuah Their Everlasting Light — the Sun No More Goes Down',
       E'The third Parable opens on the inheritance of the righteous: *And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number.* (1 Enoch 58:3). Enoch''s vision of a light that is no created sun but eternal life itself is Isaiah''s promise made plain — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* (Isaiah 60:19), with its seal *Thy sun shall no more go down; neither shall thy moon withdraw itself: for Yahuah (LORD) shall be thine everlasting light, and the days of thy mourning shall be ended.* (Isaiah 60:20). The same city John saw at the end — *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof.* (Revelation 21:23) — and *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* (Revelation 22:5). It ain''t new: Enoch already saw the unending day.',
       sv.verse_id, ev.verse_id, 'extras', 51425
  FROM _session250_en58_lookup sv, _session250_en58_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=58 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-58-righteous-shine',
       E'The Righteous Shine Forth as the Sun',
       E'Enoch declares the elect''s destiny in light — *And the righteous shall be in the light of the sun, And the elect in the light of eternal life* (1 Enoch 58:3) — and that radiance of the righteous is exactly what Daniel and Yahusha foretell. Daniel: *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Yahusha, interpreting the seed-war harvest: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43). And the apocryphal witness keeps the same image — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* (The Wisdom of Solomon 3:7). The righteous do not merely stand in the light; they become luminaries, just as Enoch saw.',
       sv.verse_id, ev.verse_id, 'extras', 51428
  FROM _session250_en58_lookup sv, _session250_en58_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=58 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-58-peace-in-the-name',
       E'Peace to the Righteous in the Name of Yahuah of Spirits',
       E'Enoch joins light to peace: *And they shall seek the light and find righteousness with Yahuah (God) of Spirits: There shall be peace to the righteous in the name of Yahuah (God) of Spirits for ever and ever.* (1 Enoch 58:4). This is the same covenant peace Enoch declared at the very head of the book — *But with the righteous He will make peace, And will protect the elect, And mercy shall be upon them... And light shall appear unto them, And He will make peace with them.* (1 Enoch 1:8) — a self-link binding the first and third Parables: the righteous are an elect people whom Yahuah preserves, not a self-chosen class. Election precedes their seeking; they seek the light because they already belong to the One who named them.',
       sv.verse_id, ev.verse_id, 'extras', 51431
  FROM _session250_en58_lookup sv, _session250_en58_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=58 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-58-darkness-destroyed',
       E'The Darkness Past — the Light Established Forever',
       E'The Parable ends in unending day: *And there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed, And the light established for ever and ever before Yahuah (God) of Spirits.* (1 Enoch 58:6), the secrets of righteousness having *become bright as the sun upon earth, And the darkness is past.* (1 Enoch 58:5). John seals the same end of night — *And the gates of it shall not be shut at all by day: for there shall be no night there.* (Revelation 21:25) — and Isaiah''s everlasting light that never goes down stands behind both — *Thy sun shall no more go down; neither shall thy moon withdraw itself: for Yahuah (LORD) shall be thine everlasting light, and the days of thy mourning shall be ended.* (Isaiah 60:20). The destruction of darkness is the same judgement that ends the Watchers'' night and establishes the order Yahuah set from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 51434
  FROM _session250_en58_lookup sv, _session250_en58_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=58 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-58-everlasting-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The very light of eternal life Enoch grants the elect at 58:3 is Yahuah Himself become their everlasting light.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-everlasting-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:20 — *Thy sun shall no more go down; neither shall thy moon withdraw itself: for Yahuah (LORD) shall be thine everlasting light, and the days of thy mourning shall be ended.* The sun that never sets answers Enoch''s days of life that are unending and without number (58:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-everlasting-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:23 — *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof.* John sees the same uncreated light that lights the elect in Enoch 58:3, now shining as the glory of Elohim and the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-everlasting-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The light of eternal life and the days without number of Enoch 58:3 close in John''s no-night reign forever and ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-everlasting-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-58-righteous-shine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The elect who stand in the light of eternal life (Enoch 58:3) are Daniel''s wise who shine as stars for ever and ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha sets the righteous shining as the sun in the Father''s kingdom, the very picture of Enoch''s righteous in the light of the sun (58:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'The Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* A parallel extra-canonical witness that the righteous shine at their vindication, echoing the light of the elect in Enoch 58:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-58-peace-in-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 1:8 — *But with the righteous He will make peace, And will protect the elect, And mercy shall be upon them, And they shall all belong to Elohim (God), And they shall be prospered, And they shall all be blessed, And He will help them all, And light shall appear unto them, And He will make peace with them.* The peace and light promised to the elect at the book''s opening returns as the third Parable''s peace in the name of Yahuah of Spirits (58:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-peace-in-the-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-58-darkness-destroyed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:25 — *And the gates of it shall not be shut at all by day: for there shall be no night there.* The light established for ever before Yahuah of Spirits, with darkness destroyed (Enoch 58:6), is John''s city of perpetual day with no night.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-darkness-destroyed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:20 — *Thy sun shall no more go down; neither shall thy moon withdraw itself: for Yahuah (LORD) shall be thine everlasting light, and the days of thy mourning shall be ended.* Isaiah''s light that never sets stands behind Enoch''s secrets become bright as the sun with the darkness past (58:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-darkness-destroyed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The light with no limit that shall never cease (Enoch 58:6) is John''s no-night reign where Yahuah Elohim Himself gives them light.'
  FROM cross_reference_threads t, cross_references x, _session250_en58_lookup sv, _session250_en58_lookup tv
 WHERE t.slug='1-enoch-58-darkness-destroyed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=58 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

