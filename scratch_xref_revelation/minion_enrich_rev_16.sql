-- S227 enrichment — Revelation 16: the bowls; Armageddon; it is done
-- ADD-ONLY. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sun-scorching-and-darkness-on-throne-of-beast
  ('canon','revelation',16,8,'canon','isaiah',24,6,'free', E'*Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* (Isaiah 24:6). Isaiah saw the curse devour the earth, *the inhabitants of the earth burned.* The fourth vial brings it: *power was given unto him to scorch men with fire. And men were scorched with great heat* (Revelation 16:8-9). The burning that leaves few men is the scorching wrath of the bowl, poured on the men who *blasphemed the name of Elohim (God)* and would not turn.'),
  ('canon','revelation',16,10,'canon','joel',2,31,'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). Joel set the darkened sun as the herald of the day of Yahuah (LORD). The fifth vial darkens the beast''s seat: *his kingdom was full of darkness; and they gnawed their tongues for pain* (Revelation 16:10). The sun turned to darkness before the terrible day falls now on the throne of the beast, the day of Yahuah (LORD) come upon his kingdom.'),
  ('canon','revelation',16,10,'canon','amos',8,9,'free', E'*And it shall come to pass in that day, saith Adonai Yahuah (the Lord GOD), that I will cause the sun to go down at noon, and I will darken the earth in the clear day:* (Amos 8:9). Amos foretold the sun *down at noon* and the earth darkened *in the clear day.* So the fifth angel pours his vial *upon the seat of the beast; and his kingdom was full of darkness* (Revelation 16:10). The midday darkness Amos named is the plague of Egypt on the beast''s throne, the light withdrawn from the kingdom that would not repent.'),
  -- thread: euphrates-dried-for-the-kings-of-the-east
  ('canon','revelation',16,12,'canon','isaiah',44,27,'free', E'*That saith to the deep, Be dry, and I will dry up thy rivers:* (Isaiah 44:27). Yahuah (LORD) speaks to the deep, *Be dry,* and dries the rivers — the word spoken to open the way for Cyrus from the east. The sixth vial enacts it on the great river: *the water thereof was dried up, that the way of the kings of the east might be prepared* (Revelation 16:12). The same word that dried Babylon''s waters for the conqueror from the east dries the Euphrates here.'),
  ('canon','revelation',16,12,'canon','isaiah',45,1,'free', E'*Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* (Isaiah 45:1). Isaiah named the king from the east — Cyrus — for whom Yahuah (LORD) opened the gates and dried the river to take Babylon. The sixth vial dries the Euphrates *that the way of the kings of the east might be prepared* (Revelation 16:12): the road opened for the conquerors from the east, as the gates were opened for Cyrus, the river drawn back at the word of Yahuah (LORD).'),
  -- thread: i-come-as-a-thief-armageddon
  ('canon','revelation',16,16,'canon','zechariah',14,2,'free', E'*For I will gather all nations against Jerusalem to battle; and the city shall be taken...* (Zechariah 14:2). Zechariah saw all nations gathered against Jerusalem to battle, and (in the verse following) Yahuah (LORD) going forth to fight them. So the frog-spirits gather the kings *into a place called in the Hebrew tongue Armageddon* (Revelation 16:16) — the nations massed for the last battle, drawn to the field where Yahuah (LORD) himself goes forth to break them.'),
  ('canon','revelation',16,16,'canon','zephaniah',3,8,'free', E'*for my determination is to gather the nations, that I may assemble the kingdoms, to pour upon them mine indignation, even all my fierce anger: for all the earth shall be devoured with the fire of my jealousy.* (Zephaniah 3:8). Zephaniah heard Yahuah (LORD) declare his purpose *to gather the nations... to pour upon them mine indignation.* The gathering at Armageddon is that very assembling: *he gathered them together into a place called in the Hebrew tongue Armageddon* (Revelation 16:16). The kings drawn by the unclean spirits are the nations assembled for the outpouring of his fierce anger.'),
  -- thread: it-is-done-the-great-earthquake-and-the-great-hail
  ('canon','revelation',16,18,'canon','haggai',2,6,'free', E'*For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land;* (Haggai 2:6). Haggai foretold the one final shaking of heaven and earth and sea. The seventh vial brings it: *there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great* (Revelation 16:18). The promised once-for-all shaking of all things is the earthquake that splits the great city and topples the cities of the nations.'),
  ('canon','revelation',16,18,'canon','joel',3,16,'free', E'*Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people...* (Joel 3:16). Joel heard Yahuah (LORD) roar from Zion till *the heavens and the earth shall shake.* So at the seventh vial a *great voice out of the temple of heaven, from the throne, saying, It is done* (Revelation 16:17) is followed by the great earthquake (16:18). The voice that shakes heaven and earth is the hope of his people even as it is the terror of the beast''s world.'),
  ('canon','revelation',16,18,'enoch','1-enoch',1,6,'extras', E'*And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame* (1 Enoch 1:6). The Hebrew library beheld the day of judgment as the shaking of the mountains, melted like wax, *the earth... wholly rent in sunder* (1 Enoch 1:7). The seventh vial brings that shaking: *a great earthquake, such as was not since men were upon the earth* (Revelation 16:18), every island fled and the mountains not found. The cosmic shaking the watchers'' seer foretold is the earthquake of the finished wrath.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- sun-scorching-and-darkness-on-throne-of-beast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 24:6 — *the inhabitants of the earth are burned, and few men left* the curse that burns the earth; the fourth vial scorches men with great heat (Revelation 16:8-9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-sun-scorching-and-the-darkness-on-the-throne-of-the-beast-exodus-10-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:31 — *The sun shall be turned into darkness... before the great and the terrible day of Yahuah (LORD) come* the darkened sun heralds the day; the fifth vial fills the beast''s kingdom with darkness (Revelation 16:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-sun-scorching-and-the-darkness-on-the-throne-of-the-beast-exodus-10-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Amos 8:9 — *I will cause the sun to go down at noon, and I will darken the earth in the clear day* the midday darkness of the day of Yahuah; the fifth vial darkens the seat of the beast (Revelation 16:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-sun-scorching-and-the-darkness-on-the-throne-of-the-beast-exodus-10-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- euphrates-dried-for-the-kings-of-the-east
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 44:27 — *That saith to the deep, Be dry, and I will dry up thy rivers* the word that dries Babylon''s waters for the conqueror from the east; the Euphrates dried for the kings of the east (Revelation 16:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-euphrates-dried-for-the-kings-of-the-east-the-way-prepared-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 45:1 — *to Cyrus... to open before him the two leaved gates; and the gates shall not be shut* the king from the east for whom the gates are opened and the river dried; the way of the kings of the east prepared (Revelation 16:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-euphrates-dried-for-the-kings-of-the-east-the-way-prepared-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- i-come-as-a-thief-armageddon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:2 — *I will gather all nations against Jerusalem to battle; and the city shall be taken* the nations gathered to battle, and Yahuah going forth to fight them (14:3); the kings gathered to Armageddon (Revelation 16:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-i-come-as-a-thief-blessed-is-he-that-keepeth-his-garments-and-armageddon-zechariah-3-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Zephaniah 3:8 — *my determination is to gather the nations, that I may assemble the kingdoms, to pour upon them mine indignation* Yahuah''s purpose to assemble the kingdoms for his wrath; the kings mustered at Armageddon (Revelation 16:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-i-come-as-a-thief-blessed-is-he-that-keepeth-his-garments-and-armageddon-zechariah-3-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- it-is-done-the-great-earthquake-and-the-great-hail
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Haggai 2:6 — *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* the promised once-for-all shaking of all things; the great earthquake of the seventh vial (Revelation 16:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-it-is-done-the-great-earthquake-and-the-great-hail-ezekiel-38-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 3:16 — *Yahuah (LORD) also shall roar out of Zion... and the heavens and the earth shall shake* the roar from Zion that shakes heaven and earth; the great voice and earthquake of *It is done* (Revelation 16:17-18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-it-is-done-the-great-earthquake-and-the-great-hail-ezekiel-38-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 1:6 — *the high mountains shall be shaken... And shall melt like wax before the flame* the Hebrew library''s day of judgment shakes the mountains and rends the earth; the great earthquake of the finished wrath (Revelation 16:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-it-is-done-the-great-earthquake-and-the-great-hail-ezekiel-38-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
