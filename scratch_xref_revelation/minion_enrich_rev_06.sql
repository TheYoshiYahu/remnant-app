-- S227 enrichment — Revelation 6: seals (four horsemen, sixth-seal cosmos, hide-us, day of wrath)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: four-horsemen-of-the-seals — add Jeremiah's fourfold judgment (sword/famine/death/captivity + four kinds)
  ('canon','revelation',6,8,'canon','jeremiah',15,2,'free', E'*Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity.* (Jeremiah 15:2). The pale rider gathers the same sorted judgments — *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death* (Revelation 6:8). Jeremiah''s fourfold appointing of death, sword, famine, and captivity is the very roster the seal looses; the riders do not invent the curses but carry out the sentence Yahuah (LORD) had long since pronounced.'),
  ('canon','revelation',6,8,'canon','jeremiah',15,3,'free', E'*And I will appoint over them four kinds, saith Yahuah (LORD): the sword to slay, and the dogs to tear, and the fowls of the heaven, and the beasts of the earth, to devour and destroy.* (Jeremiah 15:3). The fourth seal kills *with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8) — exactly Jeremiah''s *four kinds,* the sword and the beasts of the earth named together to devour. The pale horse is the prophet''s appointed four, sent out from before the throne over the fourth part of the earth.'),

  -- thread: sun-black-moon-as-blood-heaven-as-scroll — add Joel 2:10 (the fuller darkening + earth quaking)
  ('canon','revelation',6,12,'canon','joel',2,10,'free', E'*The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining:* (Joel 2:10). The sixth seal opens with *a great earthquake; and the sun became black... and the moon became as blood* (Revelation 6:12). Joel had set the quaking earth and trembling heavens beside the darkened sun and moon and withdrawn stars — the whole shaking cosmos of the day of Yahuah (LORD). The seal gathers Joel''s every sign at once: the earth heaving, the lights failing, the heavens unmade.'),

  -- thread: hide-us-from-the-face — add Isaiah 2:10 and 2:21 (the rock/dust, the clefts of the rocks)
  ('canon','revelation',6,15,'canon','isaiah',2,10,'free', E'*Enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD), and for the glory of his majesty.* (Isaiah 2:10). When the seal breaks the great of the earth *hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). Isaiah had already bidden the proud *enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD)* — the same flight to the rocks before the same majesty. The hiding-place of the terrified is the prophet''s own.'),
  ('canon','revelation',6,16,'canon','isaiah',2,21,'free', E'*To go into the clefts of the rocks, and into the tops of the ragged rocks, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth.* (Isaiah 2:21). They cry *Fall on us, and hide us from the face of him that sitteth on the throne* (Revelation 6:16). Isaiah named both the flight and its cause — men creeping *into the clefts of the rocks... when he ariseth to shake terribly the earth* — and the seal''s great earthquake is precisely that shaking. The face they cannot abide is the glory of his majesty the prophet foretold.'),

  -- thread: great-day-of-his-wrath-who-shall-be-able-to-stand — add Zephaniah 1:18 and Nahum 1:6
  ('canon','revelation',6,17,'canon','zephaniah',1,18,'free', E'*Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy* (Zephaniah 1:18). The seal closes — *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Zephaniah named that day the day of wrath and said no riches could deliver in it, the whole land devoured by the fire of his jealousy. Neither the rich men nor the chief captains hiding in the rocks (6:15) can buy their way out; nothing stands in the day of wrath but what he holds.'),
  ('canon','revelation',6,17,'canon','nahum',1,6,'free', E'*Who can stand before his indignation? and who can abide in the fierceness of his anger? his fury is poured out like fire, and the rocks are thrown down by him.* (Nahum 1:6). The seal asks *who shall be able to stand?* (Revelation 6:17), and Nahum had asked it first — *Who can stand before his indignation?* He answers with the picture of the seal itself: the rocks thrown down by him, the very rocks the proud fled to. No power of man abides his anger; the day of wrath leaves none standing of itself.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- four-horsemen-of-the-seals
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 15:2 — *Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* the sorted fourfold judgment the pale rider looses (Revelation 6:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 15:3 — *I will appoint over them four kinds... the sword to slay... and the beasts of the earth, to devour and destroy* the prophet''s appointed four, the sword and the beasts of the fourth seal (Revelation 6:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- sun-black-moon-as-blood-heaven-as-scroll
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 2:10 — *the earth shall quake... the sun and the moon shall be dark, and the stars shall withdraw their shining* Joel''s whole shaking cosmos gathered into the sixth seal''s earthquake and darkening (Revelation 6:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- hide-us-from-the-face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 2:10 — *Enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD)* the prophet''s flight to the rocks before the same majesty, on the lips of the terrified at the seal (Revelation 6:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 2:21 — *To go into the clefts of the rocks... when he ariseth to shake terribly the earth* the seal''s great earthquake is Isaiah''s shaking, the face they cannot abide his foretold majesty (Revelation 6:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- great-day-of-his-wrath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zephaniah 1:18 — *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath... the whole land shall be devoured by the fire of his jealousy* no riches deliver in the day of wrath; none of the rich hiding in the rocks can stand (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Nahum 1:6 — *Who can stand before his indignation?... the rocks are thrown down by him* the seal''s question asked first by Nahum, who answers it with the rocks the proud fled to thrown down (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
