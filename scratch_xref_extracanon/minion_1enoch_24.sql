-- ----- fragment: minion_1enoch_24.sql (session250 1-enoch 24) -----
-- Source anchor: enoch/1-enoch ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en24 (view _session250_en24_lookup). Sort band base 50575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-24-throne-mountain-of-glory
  ('enoch', '1-enoch', 24, 9, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s fiery seat of the Ancient of days is Enoch''s throne-mountain (24:9), where the Eternal King will sit when He comes down to visit the earth.'),
  ('enoch', '1-enoch', 24, 9, 'canon', 'ezekiel', 28, 14, 'free', E'Ezekiel 28:14 — *Thou art the anointed cherub that covereth; and I have set thee so: thou wast upon the holy mountain of Elohim (God); thou hast walked up and down in the midst of the stones of fire.* Enoch''s throne-mountain (24:9) is the canon''s own holy mountain of Elohim, the Eden-sanctuary from which the covering cherub fell.'),
  ('enoch', '1-enoch', 24, 2, 'canon', 'ezekiel', 28, 13, 'free', E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* The precious, glorious stones of Enoch''s mountains (24:2) are the same Eden-stones that covered the holy mountain.'),
  ('enoch', '1-enoch', 24, 9, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* Jubilees counts Enoch''s throne-mountain (24:9) among Yahuah''s holy places on earth, sanctified in the new creation.'),
  ('enoch', '1-enoch', 24, 3, 'enoch', '1-enoch', 18, 8, 'extras', E'1 Enoch 18:8 — *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch had already seen this central throne-mountain among the seven on his earlier journey, the same height-excelling middle peak resembling the seat of a throne (24:3).'),
  -- thread: 1-enoch-24-fragrant-tree-of-life
  ('enoch', '1-enoch', 24, 4, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The unrivalled fragrant tree Enoch finds (24:4) is Eden''s tree of life, set from the beginning in the midst of the garden.'),
  ('enoch', '1-enoch', 24, 4, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The leaf and wood that *wither not for ever* (24:4) are Ezekiel''s sanctuary-trees whose leaf shall not fade and whose fruit feeds and heals.'),
  ('enoch', '1-enoch', 24, 4, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree Enoch is shown reserved at the holy mountain (24:4) is the tree of life promised to the overcomer in the paradise of Elohim.'),
  ('enoch', '1-enoch', 24, 4, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees the same tree of life with its perpetual fruit and healing leaves (24:4) standing at last in the New Jerusalem.'),
  ('enoch', '1-enoch', 24, 11, 'apocrypha', '2-esdras', 8, 52, 'extras', E'2 Esdras 8:52 — *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom.* 2 Esdras pairs the planted tree of life with the builded city exactly as Enoch''s tree is transplanted to the holy place, the temple of the Eternal King (24:11).'),
  -- thread: 1-enoch-24-tree-reserved-for-the-elect
  ('enoch', '1-enoch', 24, 11, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The right to Enoch''s reserved tree of life (24:11) belongs to those who do Yahuah''s commandments — Torah standing, the elect keeping the way into the holy place.'),
  ('enoch', '1-enoch', 24, 11, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Isaiah measures the elect''s days by a tree, exactly as Enoch''s tree gives *fruit for life to the elect* (24:11).'),
  ('enoch', '1-enoch', 24, 10, 'apocrypha', '2-esdras', 2, 12, 'extras', E'2 Esdras 2:12 — *They shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary.* The tree''s sweet-savour healing laid up for the righteous matches Enoch''s fragrant tree reserved till the great judgement, whose fragrance shall be in their bones (24:10).'),
  -- thread: 1-enoch-24-long-life-no-sorrow
  ('enoch', '1-enoch', 24, 12, 'canon', 'isaiah', 25, 8, 'free', E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The end of all sorrow and torment Enoch promises the elect (24:12) is Isaiah''s swallowing-up of death and wiping of every tear.'),
  ('enoch', '1-enoch', 24, 12, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* John''s restored creation where no sorrow or pain remains is Enoch''s promise that *no sorrow or plague or torment or calamity* shall touch the elect (24:12).'),
  ('enoch', '1-enoch', 24, 12, 'canon', 'revelation', 22, 3, 'free', E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him.* The lifted curse and the throne in the holy place answer Enoch''s long restful life entered into the holy place by the tree (24:12).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-throne-mountain-of-glory',
       E'The throne-mountain: the holy mountain of Elohim and the seat of the Eternal King',
       E'Enoch is led to seven magnificent mountains, and *the seventh mountain was in the midst of them, and it excelled them in height, resembling the seat of a throne: and fragrant trees encircled the mountain* (1 Enoch 24:3) — and Michael unveils what it is: *This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness* (1 Enoch 24:9). This is not a new picture. Daniel saw the same fiery seat — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And the throne stands on the holy mountain that was Eden''s first sanctuary: *thou wast upon the holy mountain of Elohim (God); thou hast walked up and down in the midst of the stones of fire* (Ezekiel 28:14) — the same Eden-mountain whose covering was *every precious stone... the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created* (Ezekiel 28:13), matching the magnificent stones of Enoch''s mountains. Jubilees names that very mountain among Yahuah''s holy places: *For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth* (Jubilees 4:25). And Enoch had already glimpsed this throne-mountain on his journey: *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 18:8). The mountain is the throne; the King who descends to it is the Creator returning to His holy place — Torah''s order standing, not overturned.',
       sv.verse_id, ev.verse_id, 'extras', 50575
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-fragrant-tree-of-life',
       E'The fragrant tree of life: Eden''s tree at the holy mountain',
       E'At the throne-mountain Enoch finds a tree unlike any other: *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm* (1 Enoch 24:4). This is Eden''s own tree, planted in the beginning: *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil* (Genesis 2:9). Ezekiel saw it lining the river from the sanctuary, its undying leaf and unfailing fruit: *and by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the leaf thereof for medicine* (Ezekiel 47:12) — the leaves and wood that *wither not for ever.* The Spirit promises the overcomer this very tree at the end: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7); and John sees it standing in the restored city: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The book of 2 Esdras names the same hope — *for to you is paradise opened, the tree of life is planted, the time to come is prepared* (2 Esdras 8:52). One tree, from Eden''s midst to the New Jerusalem; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50578
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-tree-reserved-for-the-elect',
       E'Reserved till the great judgement: the tree given to the righteous and elect',
       E'The tree is sealed until the reckoning: *And as for this fragrant tree no mortal is permitted to touch it till the great judgement... To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King* (1 Enoch 24:10-11). The same gate stands at the end of Scripture: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14) — the right to the tree belongs to those who *do his commandments*, the Torah standing, election issuing in obedience, not obedience earning election. Isaiah measures the elect''s portion by that same tree: *they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands* (Isaiah 65:22) — the fruit that is *for life to the elect.* And 2 Esdras describes its healing virtue laid up for the righteous: *they shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary* (2 Esdras 2:12), the very fragrance Enoch says will be in their bones. The tree is not for the self-selected; it is *given* to a people chosen — the righteous and humble, the elect — after the judgement separates, and transplanted to Yahuah''s holy place.',
       sv.verse_id, ev.verse_id, 'extras', 50581
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-long-life-no-sorrow',
       E'Long life and no sorrow: the days of the fathers restored',
       E'Enoch closes with the blessing the tree secures for the elect: *Then shall they rejoice with joy and be glad, and into the holy place shall they enter; and its fragrance shall be in their bones, and they shall live a long life on earth, such as thy fathers lived: and in their days shall no sorrow or plague or torment or calamity touch them* (1 Enoch 24:12). The prophets sang the same end of sorrow: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it* (Isaiah 25:8). John saw it fulfilled in the restored creation: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4) — Enoch''s *no sorrow or plague or torment or calamity.* And the curse that shortened the patriarchs'' years is lifted at the throne where the tree stands: *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* (Revelation 22:3). The long life *such as thy fathers lived* is Eden''s span restored — the same end the whole canon awaits.',
       sv.verse_id, ev.verse_id, 'extras', 50584
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-24-throne-mountain-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s fiery seat of the Ancient of days is Enoch''s throne-mountain (24:9), where the Eternal King will sit when He comes down to visit the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 28:14 — *Thou art the anointed cherub that covereth; and I have set thee so: thou wast upon the holy mountain of Elohim (God); thou hast walked up and down in the midst of the stones of fire.* Enoch''s throne-mountain (24:9) is the canon''s own holy mountain of Elohim, the Eden-sanctuary from which the covering cherub fell.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* The precious, glorious stones of Enoch''s mountains (24:2) are the same Eden-stones that covered the holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:25 — *For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* Jubilees counts Enoch''s throne-mountain (24:9) among Yahuah''s holy places on earth, sanctified in the new creation.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 18:8 — *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch had already seen this central throne-mountain among the seven on his earlier journey, the same height-excelling middle peak resembling the seat of a throne (24:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-24-fragrant-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The unrivalled fragrant tree Enoch finds (24:4) is Eden''s tree of life, set from the beginning in the midst of the garden.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The leaf and wood that *wither not for ever* (24:4) are Ezekiel''s sanctuary-trees whose leaf shall not fade and whose fruit feeds and heals.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree Enoch is shown reserved at the holy mountain (24:4) is the tree of life promised to the overcomer in the paradise of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees the same tree of life with its perpetual fruit and healing leaves (24:4) standing at last in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 8:52 — *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom.* 2 Esdras pairs the planted tree of life with the builded city exactly as Enoch''s tree is transplanted to the holy place, the temple of the Eternal King (24:11).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=8 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-24-tree-reserved-for-the-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The right to Enoch''s reserved tree of life (24:11) belongs to those who do Yahuah''s commandments — Torah standing, the elect keeping the way into the holy place.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-tree-reserved-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Isaiah measures the elect''s days by a tree, exactly as Enoch''s tree gives *fruit for life to the elect* (24:11).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-tree-reserved-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 2:12 — *They shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary.* The tree''s sweet-savour healing laid up for the righteous matches Enoch''s fragrant tree reserved till the great judgement, whose fragrance shall be in their bones (24:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-tree-reserved-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-24-long-life-no-sorrow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The end of all sorrow and torment Enoch promises the elect (24:12) is Isaiah''s swallowing-up of death and wiping of every tear.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-long-life-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* John''s restored creation where no sorrow or pain remains is Enoch''s promise that *no sorrow or plague or torment or calamity* shall touch the elect (24:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-long-life-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him.* The lifted curse and the throne in the holy place answer Enoch''s long restful life entered into the holy place by the tree (24:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-long-life-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

