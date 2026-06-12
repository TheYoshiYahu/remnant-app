-- ----- fragment: minion_2esdras_10.sql (session253 2-esdras 10) -----
-- Source anchor: apocrypha/2-esdras ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd10 (view _session253_2esd10_lookup). Sort band base 63225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-10-zion-laid-waste
  ('apocrypha', '2-esdras', 10, 22, 'canon', 'lamentations', 1, 1, 'free', E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed solitary city is the very desolation Ezra catalogues in 2 Esdras 10:22.'),
  ('apocrypha', '2-esdras', 10, 22, 'canon', 'lamentations', 2, 6, 'free', E'Lamentations 2:6 — *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* The silenced song and put-out candlestick of 2 Esdras 10:22 is Jeremiah''s forgotten feasts and silenced assembly of Zion.'),
  ('apocrypha', '2-esdras', 10, 23, 'canon', 'psalms', 137, 4, 'free', E'Psalm 137:4 — *How shall we sing the LORD’S song in a strange land?* Ezra''s grounded psaltery and silenced song in 2 Esdras 10:23 is the exile''s hung-up harp by the rivers of Babylon.'),
  -- thread: 2-esdras-10-receive-thy-son-be-comforted
  ('apocrypha', '2-esdras', 10, 16, 'canon', 'isaiah', 66, 13, 'free', E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* Ezra''s counsel that she shall receive her son and be commended (2 Esdras 10:16) is the LORD''s own comfort, mother-tender, gathered up in Jerusalem.'),
  ('apocrypha', '2-esdras', 10, 24, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The rest and ease from labour the Highest gives the mourner in 2 Esdras 10:24 is the final wiping-away of every tear in the New Jerusalem.'),
  -- thread: 2-esdras-10-woman-becomes-builded-city
  ('apocrypha', '2-esdras', 10, 27, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The city builded that shews itself from the foundations in 2 Esdras 10:27 is John''s holy city descending as a bride.'),
  ('apocrypha', '2-esdras', 10, 27, 'canon', 'revelation', 21, 9, 'free', E'Revelation 21:9 — *And there came unto me one of the seven angels which had the seven vials full of the seven last plagues, and talked with me, saying, Come hither, I will shew thee the bride, the Lamb’s wife.* The angel-guided vision of the woman-become-city in 2 Esdras 10:27 matches the angel who shews John the bride who is the city.'),
  ('apocrypha', '2-esdras', 10, 25, 'canon', 'galatians', 4, 26, 'free', E'Galatians 4:26 — *But Jerusalem which is above is free, which is the mother of us all.* The mourning mother whose face shines and is unveiled as a city (2 Esdras 10:25) is Paul''s Jerusalem above, the mother of us all.'),
  -- thread: 2-esdras-10-this-woman-is-sion
  ('apocrypha', '2-esdras', 10, 50, 'canon', 'revelation', 21, 11, 'free', E'Revelation 21:11 — *Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal;* The brightness of her glory and comeliness of her beauty shewn Ezra in 2 Esdras 10:50 is the jasper-clear glory of John''s holy city.'),
  ('apocrypha', '2-esdras', 10, 44, 'canon', 'hebrews', 12, 22, 'free', E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* The woman who is Sion in 2 Esdras 10:44 is the heavenly Jerusalem the faithful are come unto in Hebrews.'),
  ('apocrypha', '2-esdras', 10, 50, 'apocrypha', 'tobit', 13, 16, 'extras', E'Tobit 13:16 — *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold.* The comeliness of the city''s beauty shewn Ezra in 2 Esdras 10:50 is Tobit''s own jeweled, rebuilt Jerusalem — the deuterocanon self-witnessing the New Jerusalem.'),
  -- thread: 2-esdras-10-barren-bears-zion-travails
  ('apocrypha', '2-esdras', 10, 46, 'canon', 'isaiah', 54, 1, 'free', E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren who at last bare a son in 2 Esdras 10:46 is Isaiah''s barren Zion whose children outnumber the married wife''s.'),
  ('apocrypha', '2-esdras', 10, 46, 'canon', 'galatians', 4, 27, 'free', E'Galatians 4:27 — *For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband.* Paul reads the barren-who-bears, the same figure as Sion in 2 Esdras 10:46, as the Jerusalem above bringing forth her children.'),
  ('apocrypha', '2-esdras', 10, 45, 'canon', 'isaiah', 66, 8, 'free', E'Isaiah 66:8 — *Who hath heard such a thing? who hath seen such things? Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children.* The barren Sion who bears in 2 Esdras 10:45 is Isaiah''s Zion who travails and brings forth a nation at once.'),
  -- thread: 2-esdras-10-city-no-mans-building
  ('apocrypha', '2-esdras', 10, 54, 'canon', 'hebrews', 11, 10, 'free', E'Hebrews 11:10 — *For he looked for a city which hath foundations, whose builder and maker is Elohim (God).* The city no man''s building can stand in, shewn only by the Highest (2 Esdras 10:54), is the city with foundations whose builder and maker is Elohim that Abraham awaited.'),
  ('apocrypha', '2-esdras', 10, 53, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'extras', E'Baruch 5:1 — *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever.* The empty field where the Highest begins to shew his city (2 Esdras 10:53) is Baruch''s Jerusalem stripping off mourning for the glory that comes from Yahuah for ever — the deuterocanon''s own grief-to-glory turn.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-zion-laid-waste',
       E'Our sanctuary laid waste — the city that sits solitary',
       E'Ezra would have the mourning mother lift her eyes off a single dead son to a grief far greater: *Our psaltery is laid on the ground, our song is put to silence, our rejoicing is at an end, the light of our candlestick is put out, the ark of our covenant is spoiled, our holy things are defiled... and the name that is called upon us is almost profaned* (2 Esdras 10:22), *the seal of Sion has now lost her honour; for she is delivered into the hands of them that hate us* (2 Esdras 10:23). It is the lament of the fallen city that Jeremiah wept before him — *How doth the city sit solitary, that was full of people! how is she become as a widow!* (Lamentations 1:1) — and the silenced feasts of Zion: *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion* (Lamentations 2:6). By Babylon''s rivers the same harps hung silent: *How shall we sing the LORD’S song in a strange land?* (Psalm 137:4). It ain''t new — the daughter of Zion''s mourning is one mourning across the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 63225
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-receive-thy-son-be-comforted',
       E'Keep thy sorrow — thou shalt receive thy son, and be comforted',
       E'To the woman who would die mourning, Ezra speaks the gospel of the resurrection and of comfort: *For if you shall acknowledge the determination of Yahuah (God) to be just, you shall both receive your son in time, and shall be commended among women* (2 Esdras 10:16) — the son is not lost but received again *in time*, the world to come breaking through the grief. *Therefore... the Highest shall give you rest and ease from your labour* (2 Esdras 10:24). This is the Comforter''s own promise over Jerusalem: *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem* (Isaiah 66:13). The grieving mother is herself to be comforted as a mother comforts — sorrow turned, in time, to the receiving back of what death took.',
       sv.verse_id, ev.verse_id, 'extras', 63228
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-woman-becomes-builded-city',
       E'The woman vanishes — a city builded appears',
       E'While Ezra yet speaks comfort, the mourning woman is transfigured before his eyes: *her face upon a sudden shined exceedingly, and her countenance glistered* (2 Esdras 10:25), and then *the woman appeared to me no more, but there was a city builded, and a large place shewed itself from the foundations* (2 Esdras 10:27). The grieving mother becomes the glorified city. So John sees her descend: *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2) — and the angel names her both bride and city: *I will shew thee the bride, the Lamb’s wife. And he carried me away in the spirit to a great and high mountain, and shewed me that great city, the holy Jerusalem* (Revelation 21:9-10). Paul already knew her: *Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26). The mother IS the city; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63231
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-this-woman-is-sion',
       E'This woman whom thou sawest is Sion — the glory and beauty of the city',
       E'Uriel gives the solution plainly: *This woman, whom you sawest is Sion* (2 Esdras 10:44), and because Ezra grieved unfeignedly for her, *so has he shewed you the brightness of her glory, and the comeliness of her beauty* (2 Esdras 10:50). The woman whom he saw is the city; her mourning was the destruction of Jerusalem, her builded splendour the Zion to come. John is shewn that same brightness: the holy Jerusalem *Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal* (Revelation 21:11). The deuterocanon''s own gathered city sings the same jewels — *Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16) — and Hebrews names the destination: *ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22). The grieving mother is the glorified gathered city.',
       sv.verse_id, ev.verse_id, 'extras', 63234
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-barren-bears-zion-travails',
       E'The barren bare a son — Zion travails and brings forth',
       E'Uriel reads the woman''s thirty barren years and the son she bore: *she has been thirty years barren: those are the thirty years in which there was no offering made in her. But after thirty years Solomon builded the city and offered offerings: and then bare the barren a son* (2 Esdras 10:45-46). The barren who bears is the prophets'' own song of Zion: *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife* (Isaiah 54:1), which Paul lifts straight onto the Jerusalem above — *Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband* (Galatians 4:27). And Zion''s bearing is sudden, a whole people at once: *as soon as Zion travailed, she brought forth her children* (Isaiah 66:8). The mourning barren mother brings forth the gathered city full of children.',
       sv.verse_id, ev.verse_id, 'extras', 63237
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=45
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-city-no-mans-building',
       E'Where no foundation was — the city no man''s hands can build',
       E'Uriel explains why Ezra was sent to an empty field: *Therefore I commanded you to go into the field, where no foundation of any building was. For in the place in which the Highest begins to shew his city, there can no man’s building be able to stand* (2 Esdras 10:53-54). The true Zion is not raised by man''s hands; her foundations are Elohim''s. This is Abraham''s hope: *For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). And her builded glory casts off mourning for the garment of everlasting righteousness: *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever* (Baruch 5:1). The empty field where no man builds is exactly where the Highest shews the city with foundations.',
       sv.verse_id, ev.verse_id, 'extras', 63240
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=53
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-10-zion-laid-waste
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed solitary city is the very desolation Ezra catalogues in 2 Esdras 10:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-zion-laid-waste'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 2:6 — *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* The silenced song and put-out candlestick of 2 Esdras 10:22 is Jeremiah''s forgotten feasts and silenced assembly of Zion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-zion-laid-waste'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 137:4 — *How shall we sing the LORD’S song in a strange land?* Ezra''s grounded psaltery and silenced song in 2 Esdras 10:23 is the exile''s hung-up harp by the rivers of Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-zion-laid-waste'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-receive-thy-son-be-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* Ezra''s counsel that she shall receive her son and be commended (2 Esdras 10:16) is the LORD''s own comfort, mother-tender, gathered up in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-receive-thy-son-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The rest and ease from labour the Highest gives the mourner in 2 Esdras 10:24 is the final wiping-away of every tear in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-receive-thy-son-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-woman-becomes-builded-city
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The city builded that shews itself from the foundations in 2 Esdras 10:27 is John''s holy city descending as a bride.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-woman-becomes-builded-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:9 — *And there came unto me one of the seven angels which had the seven vials full of the seven last plagues, and talked with me, saying, Come hither, I will shew thee the bride, the Lamb’s wife.* The angel-guided vision of the woman-become-city in 2 Esdras 10:27 matches the angel who shews John the bride who is the city.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-woman-becomes-builded-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:26 — *But Jerusalem which is above is free, which is the mother of us all.* The mourning mother whose face shines and is unveiled as a city (2 Esdras 10:25) is Paul''s Jerusalem above, the mother of us all.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-woman-becomes-builded-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-this-woman-is-sion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:11 — *Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal;* The brightness of her glory and comeliness of her beauty shewn Ezra in 2 Esdras 10:50 is the jasper-clear glory of John''s holy city.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-this-woman-is-sion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* The woman who is Sion in 2 Esdras 10:44 is the heavenly Jerusalem the faithful are come unto in Hebrews.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-this-woman-is-sion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:16 — *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold.* The comeliness of the city''s beauty shewn Ezra in 2 Esdras 10:50 is Tobit''s own jeweled, rebuilt Jerusalem — the deuterocanon self-witnessing the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-this-woman-is-sion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=50
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-barren-bears-zion-travails
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren who at last bare a son in 2 Esdras 10:46 is Isaiah''s barren Zion whose children outnumber the married wife''s.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-barren-bears-zion-travails'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:27 — *For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband.* Paul reads the barren-who-bears, the same figure as Sion in 2 Esdras 10:46, as the Jerusalem above bringing forth her children.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-barren-bears-zion-travails'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:8 — *Who hath heard such a thing? who hath seen such things? Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children.* The barren Sion who bears in 2 Esdras 10:45 is Isaiah''s Zion who travails and brings forth a nation at once.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-barren-bears-zion-travails'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-city-no-mans-building
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:10 — *For he looked for a city which hath foundations, whose builder and maker is Elohim (God).* The city no man''s building can stand in, shewn only by the Highest (2 Esdras 10:54), is the city with foundations whose builder and maker is Elohim that Abraham awaited.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-city-no-mans-building'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 5:1 — *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever.* The empty field where the Highest begins to shew his city (2 Esdras 10:53) is Baruch''s Jerusalem stripping off mourning for the glory that comes from Yahuah for ever — the deuterocanon''s own grief-to-glory turn.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-city-no-mans-building'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=53
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

