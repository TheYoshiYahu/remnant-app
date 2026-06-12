-- ----- fragment: minion_ecclesiasticus_43.sql (session253 ecclesiasticus 43) -----
-- Source anchor: apocrypha/ecclesiasticus ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir43 (view _session253_sir43_lookup). Sort band base 59350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-43-firmament-declares-glory
  ('apocrypha', 'ecclesiasticus', 43, 1, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The clear firmament of Sirach 43:1 is the same silent preacher David heard.'),
  ('apocrypha', 'ecclesiasticus', 43, 2, 'canon', 'psalms', 19, 5, 'free', E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* Sirach''s sun *declaring at his rising a marvellous instrument* (43:2) runs the very race the bridegroom-sun runs in the psalm.'),
  ('apocrypha', 'ecclesiasticus', 43, 1, 'canon', 'psalms', 148, 3, 'free', E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The beauty of heaven that Sirach 43:1 beholds is summoned into open praise here.'),
  -- thread: sirach-43-moon-sign-of-feasts
  ('apocrypha', 'ecclesiasticus', 43, 6, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* Sirach''s moon *for a declaration of times* (43:6) is exactly the seasons-marker — the moedim — set on the fourth day.'),
  ('apocrypha', 'ecclesiasticus', 43, 7, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon as *the sign of feasts* (43:7) is the psalm''s appointed moon-for-seasons word for word.'),
  ('apocrypha', 'ecclesiasticus', 43, 6, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The moon Sira watches *increasing wonderfully in her changing* is the lesser light made to rule the night.'),
  -- thread: sirach-43-stars-in-their-watches
  ('apocrypha', 'ecclesiasticus', 43, 10, 'canon', 'job', 38, 7, 'free', E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The stars that *stand in their order* (43:10) are the singing morning-stars of the world''s foundation.'),
  ('apocrypha', 'ecclesiasticus', 43, 10, 'canon', 'job', 38, 31, 'free', E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The host that never faints in their watches (43:10) keeps the very bands no man can bind or loose.'),
  ('apocrypha', 'ecclesiasticus', 43, 9, 'canon', 'psalms', 148, 6, 'free', E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars *never faint in their watches* (43:10) because of this unpassing decree.'),
  -- thread: sirach-43-rainbow-snow-frost-treasures
  ('apocrypha', 'ecclesiasticus', 43, 14, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The *treasures* opened in Sirach 43:14 are the very snow-treasures Job is asked whether he has entered.'),
  ('apocrypha', 'ecclesiasticus', 43, 19, 'canon', 'job', 38, 29, 'free', E'Job 38:29 — *Out of whose womb came the ice? and the hoary frost of heaven, who hath gendered it?* Sirach''s hoarfrost *as salt he poureth on the earth* (43:19) answers Job''s question by naming its Maker.'),
  ('apocrypha', 'ecclesiasticus', 43, 13, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The snow and *lightnings of his judgment* of Sirach 43:13 are Jeremiah''s lightnings-with-rain from the treasure-store.'),
  ('apocrypha', 'ecclesiasticus', 43, 13, 'canon', 'psalms', 148, 8, 'free', E'Psalm 148:8 — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word.* The snow that falls *by his commandment* (43:13) is the storm fulfilling His word in the psalm.'),
  -- thread: sirach-43-he-appeaseth-the-deep
  ('apocrypha', 'ecclesiasticus', 43, 25, 'canon', 'genesis', 1, 21, 'free', E'Genesis 1:21 — *And Elohim (God) created great whales, and every living creature that moveth, which the waters brought forth abundantly, after their kind, and every winged fowl after his kind: and Elohim (God) saw that it was good.* The *whales created* of Sirach 43:25 are the fifth-day great whales of Genesis.'),
  ('apocrypha', 'ecclesiasticus', 43, 23, 'canon', 'job', 38, 8, 'free', E'Job 38:8 — *Or who shut up the sea with doors, when it brake forth, as if it had issued out of the womb?* He who *appeaseth the deep* (43:23) is the One who shut the sea behind doors in Job.'),
  ('apocrypha', 'ecclesiasticus', 43, 23, 'canon', 'psalms', 33, 7, 'free', E'Psalm 33:7 — *He gathereth the waters of the sea together as an heap: he layeth up the depth in storehouses.* Sirach''s appeasing of the deep (43:23) is the psalm''s gathering of the sea and storing of the depth.'),
  -- thread: sirach-43-by-his-word-all-things-consist
  ('apocrypha', 'ecclesiasticus', 43, 26, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* Paul says of the Son the very thing Sirach 43:26 says of the Maker — *by him all things consist.*'),
  ('apocrypha', 'ecclesiasticus', 43, 26, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The word by which all things *consist* (43:26) is the word of power by which the Son upholds all things.'),
  ('apocrypha', 'ecclesiasticus', 43, 26, 'canon', 'psalms', 33, 6, 'free', E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The word that holds all things together (43:26) is the word that made the heavens and their host.'),
  ('apocrypha', 'ecclesiasticus', 43, 27, 'canon', 'psalms', 33, 9, 'free', E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* Sira''s confession that words *come short* before the One who *is all* (43:27) bows to the God whose mere speech makes creation stand fast.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-43-firmament-declares-glory',
       E'The pride of the height — the heavens declare His glory',
       E'Yeshua ben Sira lifts his eyes and the whole sky preaches: *The pride of the height, the clear firmament, the beauty of heaven, with his glorious shew* (Ecclesiasticus 43:1), and the sun *declaring at his rising a marvellous instrument, the work of the Most High* (Ecclesiasticus 43:2). It ain''t new. David sang the same wordless sermon: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1), with the sun *as a bridegroom coming out of his chamber* (Psalm 19:5). The psalmist of Israel calls every register of the cosmos into the choir: *Praise ye him, sun and moon: praise him, all ye stars of light* (Psalm 148:3) — and they obey because *he commanded, and they were created* (Psalm 148:5). The firmament is no idol to fear, but the workman''s witness.',
       sv.verse_id, ev.verse_id, 'extras', 59350
  FROM _session253_sir43_lookup sv, _session253_sir43_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=43 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-43-moon-sign-of-feasts',
       E'The moon — a sign of feasts, the moed-marker',
       E'Here is the heart of the hymn for the keepers of the Appointed Times: *He made the moon also to serve in her season for a declaration of times, and a sign of the world* (Ecclesiasticus 43:6), for *From the moon is the sign of feasts, a light that decreaseth in her perfection* (Ecclesiasticus 43:7). The lights were never mere decoration — at the fourth day Elohim set them *for signs, and for seasons, and for days, and years* (Genesis 1:14), the lesser light *to rule the night* (Genesis 1:16). The same ordinance the psalmist names: *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19). The moedim hang on the lamp Sira watched wane and return — *the sign of feasts* written in the sky for Israel to read.',
       sv.verse_id, ev.verse_id, 'extras', 59353
  FROM _session253_sir43_lookup sv, _session253_sir43_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=43 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-43-stars-in-their-watches',
       E'The stars stand in their order — the host that never faints',
       E'The night sky is a disciplined army: *The beauty of heaven, the glory of the stars, an ornament giving light in the highest places of Yahuah (God)* (Ecclesiasticus 43:9), and *At the commandment of the Holy One they will stand in their order, and never faint in their watches* (Ecclesiasticus 43:10). Job heard them sing at the foundation of the world: *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy* (Job 38:7) — and was asked, *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31). David calls that same host to praise: *Praise ye him, all his angels: praise ye him, all his hosts* (Psalm 148:2). The stars keep their watch because the Holy One commanded their order, and *he hath made a decree which shall not pass* (Psalm 148:6).',
       sv.verse_id, ev.verse_id, 'extras', 59356
  FROM _session253_sir43_lookup sv, _session253_sir43_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=43 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-43-rainbow-snow-frost-treasures',
       E'Rainbow, snow, and frost — the treasures of heaven opened',
       E'Sira reads the weather as theology: *Look upon the rainbow, and praise him that made it... the hands of the Most High have bended it* (Ecclesiasticus 43:11-12); *By his commandment he makes the snow to fall aplace, and sends swiftly the lightnings of his judgment. Through this the treasures are opened* (Ecclesiasticus 43:13-14); *The hoarfrost also as salt he poureth on the earth* (Ecclesiasticus 43:19). Out of the whirlwind Yahuah pressed Job with the same wonders: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail* (Job 38:22), and *Out of whose womb came the ice? and the hoary frost of heaven, who hath gendered it?* (Job 38:29). Jeremiah binds the lightning and treasure-winds to the Maker who shames every idol: *he maketh lightnings with rain, and bringeth forth the wind out of his treasures* (Jeremiah 10:13). And the whole host obeys at a word: *Fire, and hail; snow, and vapour; stormy wind fulfilling his word* (Psalm 148:8).',
       sv.verse_id, ev.verse_id, 'extras', 59359
  FROM _session253_sir43_lookup sv, _session253_sir43_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=43 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-43-he-appeaseth-the-deep',
       E'By his counsel he appeaseth the deep',
       E'Sira turns to the sea: *By his counsel he appeaseth the deep, and planteth islands in it* (Ecclesiasticus 43:23), and there *be strange and wondrous works, variety of all kinds of beasts and whales created* (Ecclesiasticus 43:25). Genesis names that fifth-day act: *And Elohim (God) created great whales, and every living creature that moveth, which the waters brought forth abundantly* (Genesis 1:21). Job hears the deep set behind its barred doors: *Or who shut up the sea with doors, when it brake forth, as if it had issued out of the womb?* (Job 38:8). And David tells how it was tamed: *He gathereth the waters of the sea together as an heap: he layeth up the depth in storehouses* (Psalm 33:7). The deep that drowns the proud is the deep He appeases at a word.',
       sv.verse_id, ev.verse_id, 'extras', 59362
  FROM _session253_sir43_lookup sv, _session253_sir43_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=43 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-43-by-his-word-all-things-consist',
       E'He is all — and by his word all things consist',
       E'The hymn closes in confessed limit and overflowing praise: *By him the end of them has prosperous success, and by his word all things consist* (Ecclesiasticus 43:26); *We may speak much, and yet come short: wherefore in sum, he is all* (Ecclesiasticus 43:27); *For Yahuah (God) has made all things; and to the godly has he given wisdom* (Ecclesiasticus 43:33). It ain''t new — and the apostles will say it of the Son through whom the worlds were framed: *For by him were all things created... all things were created by him, and for him: And he is before all things, and by him all things consist* (Colossians 1:16-17). The Son is *upholding all things by the word of his power* (Hebrews 1:3) — the very word by which Sira says all things consist. And it was ever so: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth... For he spake, and it was done; he commanded, and it stood fast* (Psalm 33:6,9).',
       sv.verse_id, ev.verse_id, 'extras', 59365
  FROM _session253_sir43_lookup sv, _session253_sir43_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=43 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-43-firmament-declares-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The clear firmament of Sirach 43:1 is the same silent preacher David heard.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-firmament-declares-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* Sirach''s sun *declaring at his rising a marvellous instrument* (43:2) runs the very race the bridegroom-sun runs in the psalm.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-firmament-declares-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The beauty of heaven that Sirach 43:1 beholds is summoned into open praise here.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-firmament-declares-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-43-moon-sign-of-feasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* Sirach''s moon *for a declaration of times* (43:6) is exactly the seasons-marker — the moedim — set on the fourth day.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-moon-sign-of-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon as *the sign of feasts* (43:7) is the psalm''s appointed moon-for-seasons word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-moon-sign-of-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The moon Sira watches *increasing wonderfully in her changing* is the lesser light made to rule the night.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-moon-sign-of-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-43-stars-in-their-watches
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The stars that *stand in their order* (43:10) are the singing morning-stars of the world''s foundation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-stars-in-their-watches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The host that never faints in their watches (43:10) keeps the very bands no man can bind or loose.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-stars-in-their-watches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars *never faint in their watches* (43:10) because of this unpassing decree.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-stars-in-their-watches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-43-rainbow-snow-frost-treasures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The *treasures* opened in Sirach 43:14 are the very snow-treasures Job is asked whether he has entered.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-rainbow-snow-frost-treasures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:29 — *Out of whose womb came the ice? and the hoary frost of heaven, who hath gendered it?* Sirach''s hoarfrost *as salt he poureth on the earth* (43:19) answers Job''s question by naming its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-rainbow-snow-frost-treasures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The snow and *lightnings of his judgment* of Sirach 43:13 are Jeremiah''s lightnings-with-rain from the treasure-store.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-rainbow-snow-frost-treasures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 148:8 — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word.* The snow that falls *by his commandment* (43:13) is the storm fulfilling His word in the psalm.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-rainbow-snow-frost-treasures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-43-he-appeaseth-the-deep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:21 — *And Elohim (God) created great whales, and every living creature that moveth, which the waters brought forth abundantly, after their kind, and every winged fowl after his kind: and Elohim (God) saw that it was good.* The *whales created* of Sirach 43:25 are the fifth-day great whales of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-he-appeaseth-the-deep'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:8 — *Or who shut up the sea with doors, when it brake forth, as if it had issued out of the womb?* He who *appeaseth the deep* (43:23) is the One who shut the sea behind doors in Job.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-he-appeaseth-the-deep'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:7 — *He gathereth the waters of the sea together as an heap: he layeth up the depth in storehouses.* Sirach''s appeasing of the deep (43:23) is the psalm''s gathering of the sea and storing of the depth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-he-appeaseth-the-deep'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-43-by-his-word-all-things-consist
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* Paul says of the Son the very thing Sirach 43:26 says of the Maker — *by him all things consist.*'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-by-his-word-all-things-consist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The word by which all things *consist* (43:26) is the word of power by which the Son upholds all things.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-by-his-word-all-things-consist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The word that holds all things together (43:26) is the word that made the heavens and their host.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-by-his-word-all-things-consist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* Sira''s confession that words *come short* before the One who *is all* (43:27) bows to the God whose mere speech makes creation stand fast.'
  FROM cross_reference_threads t, cross_references x, _session253_sir43_lookup sv, _session253_sir43_lookup tv
 WHERE t.slug='sirach-43-by-his-word-all-things-consist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=43 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

