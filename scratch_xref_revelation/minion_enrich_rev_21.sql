-- S227 enrichment — Revelation 21: the bride-city, the tabernacle with men, no more tears, the overcomer-son, the twelve gates, the jeweled city, no temple no sun
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- new Jerusalem coming down as a bride (has Isaiah + Tobit 13:10): add 2 Esdras (extras)
  ('canon','revelation',21,2,'apocrypha','2-esdras',10,27,'extras', E'*And I looked, and, behold, the woman appeared to me no more, but there was a city builded, and a large place shewed itself from the foundations...* (2 Esdras 10:27). John sees *the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). Esdras saw the same mystery — the mourning woman who is Sion transformed before his eyes into a builded city. The bride and the city are one: the woman Israel revealed as the New Jerusalem, restored to her husband, not a new people in her place.'),
  ('canon','revelation',21,10,'apocrypha','2-esdras',13,36,'extras', E'*And Sion shall come, and shall be shewed to all men, being prepared and builded, like as you sawest the hill graven without hands.* (2 Esdras 13:36). The seer is carried to a great mountain and shown *that great city, the holy Jerusalem, descending out of heaven from Elohim (God)* (Revelation 21:10). Esdras foretold it — Sion *prepared and builded*, shewed to all men. The city not made with hands of the apocalypse is the prepared Sion of the restored library, the kingdom-mountain come down.'),

  -- the tabernacle of Elohim with men (has Ezek 37:27, Lev 26, Zech 2, Exod 29): add Jeremiah 31:33 (prophetic)
  ('canon','revelation',21,3,'canon','jeremiah',31,33,'free', E'*...I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The great voice declares, *the tabernacle of Elohim (God) is with men... and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). This is the new-covenant promise of Jeremiah fulfilled — the indwelling God, the law written within, *they shall be my people* and *I will be their Elohim (God)*: the dwelling of God with men is the covenant of the heart come home.'),

  -- wipe away all tears, no more death (has Isaiah 25:8, 55:1): add Isaiah 35:10, 65:19 (prophetic)
  ('canon','revelation',21,4,'canon','isaiah',35,10,'free', E'*And the ransomed of Yahuah (LORD) shall return... and sorrow and sighing shall flee away.* (Isaiah 35:10). *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying* (Revelation 21:4). Isaiah promised the ransomed everlasting joy upon their heads, *sorrow and sighing* fled away. The wiping of every tear is that homecoming joy made final — the redeemed returned to Zion, their sorrow and sighing gone for ever.'),
  ('canon','revelation',21,4,'canon','isaiah',65,19,'free', E'*and the voice of weeping shall be no more heard in her, nor the voice of crying.* (Isaiah 65:19). *...neither sorrow, nor crying, neither shall there be any more pain* (Revelation 21:4). In the new heavens and new earth Isaiah heard the end of weeping — *the voice of weeping shall be no more heard.* The new Jerusalem where God wipes every tear is the rejoicing-city of Isaiah, where the voice of crying is silenced for ever.'),

  -- he shall be my son, the overcomer inherits (P=0,E=0): Jeremiah 31:9, Psalm 89:26-27 (prophetic)
  ('canon','revelation',21,7,'canon','jeremiah',31,9,'free', E'*...for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9). *He that overcometh shall inherit all things; and I will be his Elohim (God), and he shall be my son* (Revelation 21:7). The sonship promised the overcomer is the sonship Jeremiah declared over the regathered house — *I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* The inheriting son is restored Israel, Ephraim brought home as firstborn; the consummation is the two houses owned again as sons.'),
  ('canon','revelation',21,7,'canon','psalms',89,26,'free', E'*He shall cry unto me, Thou art my father, my Elohim (God), and the rock of my salvation.* (Psalm 89:26). The overcomer is promised, *I will be his Elohim (God), and he shall be my son* (Revelation 21:7). The covenant-psalm spoke the same sonship — the one who cries *Thou art my father*, whom God makes *my firstborn, higher than the kings of the earth* (Psalm 89:27). The overcomer''s inheritance is the firstborn-sonship of the Davidic covenant opened to all who conquer.'),

  -- twelve gates and twelve foundations (has Ezek 48): add Exodus 28:21 (Torah root)
  ('canon','revelation',21,12,'canon','exodus',28,21,'free', E'*And the stones shall be with the names of the children of Yashar''el (Israel), twelve, according to their names... every one with his name shall they be according to the twelve tribes.* (Exodus 28:21). The city has *twelve gates, and at the gates twelve angels, and names written thereon, which are the names of the twelve tribes* (Revelation 21:12). The twelve names borne on the high priest''s breastplate are the twelve names on the gates — the tribes carried into the holy place, the whole house of Israel inscribed on the New Jerusalem, the two sticks made one.'),

  -- the city of gold and precious stones (has Isaiah 54:11-12, Tobit 13:16-17): add Ezekiel 28:13, Exodus 28:17 (prophetic/Torah)
  ('canon','revelation',21,18,'canon','ezekiel',28,13,'free', E'*Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz... the beryl, the onyx, and the jasper, the sapphire, the emerald... and gold...* (Ezekiel 28:13). The city''s foundations are *garnished with all manner of precious stones... jasper... sapphire... emerald... and the city was pure gold* (Revelation 21:18-19). The very stones of Eden''s covering in Ezekiel — jasper, sapphire, emerald, and gold — are the jewels of the New Jerusalem; the garden-glory lost is restored as the foundation of the city.'),
  ('canon','revelation',21,19,'canon','exodus',28,17,'free', E'*And thou shalt set in it settings of stones, even four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle...* (Exodus 28:17). *And the foundations of the wall of the city were garnished with all manner of precious stones* (Revelation 21:19). The twelve foundation-stones answer the twelve stones of the breastplate, set in four rows for the twelve tribes; the jeweled city wears the priestly stones of Israel, the whole tribal company built into her walls.'),

  -- no temple, no sun, the glory the light (has Isaiah 60, 2 Esdras 7:26): add Zechariah 14:7 (prophetic)
  ('canon','revelation',21,23,'canon','zechariah',14,7,'free', E'*But it shall be one day which shall be known to Yahuah (LORD), not day, nor night: but it shall come to pass, that at evening time it shall be light.* (Zechariah 14:7). *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it* (Revelation 21:23). Zechariah foresaw the day that needs no sun — *at evening time it shall be light* — light without the heavenly lamps. The city lit by the glory of God, where there is no night, is that one Yahuah-day the prophet knew.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- new Jerusalem bride
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 10:27 — *the woman appeared to me no more, but there was a city builded* the mourning woman who is Sion transformed into a city, the bride who is the New Jerusalem (Revelation 21:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-new-jerusalem-coming-down-as-a-bride-isaiah-52'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 13:36 — *Sion shall come, and shall be shewed to all men, being prepared and builded* the prepared Sion not made with hands, the holy Jerusalem descending out of heaven (Revelation 21:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-new-jerusalem-coming-down-as-a-bride-isaiah-52'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- tabernacle with men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 31:33 — *I will... be their Elohim (God), and they shall be my people* the new-covenant indwelling, the tabernacle of God with men, the law written in the heart (Revelation 21:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-tabernacle-of-elohim-with-men-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- wipe away all tears
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 35:10 — *the ransomed of Yahuah (LORD) shall return... and sorrow and sighing shall flee away* the homecoming joy of the ransomed, every tear wiped away (Revelation 21:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-wipe-away-all-tears-no-more-death-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 65:19 — *the voice of weeping shall be no more heard in her, nor the voice of crying* the rejoicing-city of the new heavens and earth, no more sorrow nor crying (Revelation 21:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-wipe-away-all-tears-no-more-death-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- he shall be my son, the overcomer inherits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 31:9 — *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* the regathered house owned as firstborn son, the overcomer who shall be his son (Revelation 21:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-he-shall-be-my-son-the-overcomer-inherits-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 89:26 — *Thou art my father, my Elohim (God), and the rock of my salvation* the Davidic firstborn-sonship (Psalm 89:27), opened to the overcomer who shall be his son (Revelation 21:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-he-shall-be-my-son-the-overcomer-inherits-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- twelve gates and twelve foundations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Exodus 28:21 — *the stones shall be with the names of the children of Yashar''el (Israel), twelve... according to the twelve tribes* the tribal names on the breastplate, the same twelve names on the gates of the city (Revelation 21:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-twelve-gates-and-twelve-foundations-the-one-covenant-people-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the city of gold and precious stones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 28:13 — *in Eden the garden of Elohim (God); every precious stone was thy covering... the sapphire, the emerald... and gold* the stones of Eden''s covering restored as the jewels of the New Jerusalem (Revelation 21:18-19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-city-of-gold-and-precious-stones-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Exodus 28:17 — *four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle* the twelve breastplate stones of the tribes, answered by the twelve foundation-stones of the city (Revelation 21:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-city-of-gold-and-precious-stones-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- no temple, no sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:7 — *not day, nor night: but... at evening time it shall be light* the one Yahuah-day that needs no sun, the city lit by the glory of Elohim (God) (Revelation 21:23).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-no-temple-no-sun-the-glory-of-elohim-the-light-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
