-- ----- fragment: minion_1enoch_47.sql (session250 1-enoch 47) -----
-- Source anchor: enoch/1-enoch ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en47 (view _session250_en47_lookup). Sort band base 51150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-47-blood-of-the-righteous-cries
  ('enoch', '1-enoch', 47, 1, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The first shed blood already cried from the earth before Yahuah, exactly as Enoch 47:1 says the blood of the righteous ascends from the ground.'),
  ('enoch', '1-enoch', 47, 1, 'canon', 'genesis', 4, 11, 'free', E'Genesis 4:11 — *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother’s blood from thy hand;* The earth that opened to receive Abel''s blood is the same earth from which the righteous blood ascends in Enoch 47:1.'),
  ('enoch', '1-enoch', 47, 1, 'canon', 'psalms', 56, 8, 'free', E'Psalm 56:8 — *Thou tellest my wanderings: put thou my tears into thy bottle: are they not in thy book?* The Father keeps an exact account of the suffering of the righteous, the same reckoning Enoch 47:1 says rises before Yahuah of Spirits.'),
  ('enoch', '1-enoch', 47, 1, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* John sees the shed blood of the righteous gathered under the altar, the same blood Enoch 47:1 sees ascending before Yahuah of Spirits.'),
  -- thread: 1-enoch-47-holy-ones-intercede-how-long
  ('enoch', '1-enoch', 47, 2, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' ''how long'' is the answered echo of the holy ones'' plea in Enoch 47:2 that judgement be done for the blood of the righteous.'),
  ('enoch', '1-enoch', 47, 2, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The ''little season'' until the number is full is Enoch 47:2''s prayer that the righteous not suffer for ever — vindication delayed, never in vain.'),
  -- thread: 1-enoch-47-head-of-days-throne-books-opened
  ('enoch', '1-enoch', 47, 3, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s white-haired Ancient of days seating Himself to judge is Enoch 47:3''s Head of Days seating Himself upon the throne of His glory.'),
  ('enoch', '1-enoch', 47, 3, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The myriads standing before Him and the books opened are precisely the host, counsellors, and books of the living of Enoch 47:3.'),
  ('enoch', '1-enoch', 47, 3, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books and the book of life are Enoch 47:3''s books of the living opened before the Head of Days.'),
  -- thread: 1-enoch-47-number-of-the-righteous-election
  ('enoch', '1-enoch', 47, 4, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Deliverance belongs to those already written in the book — the named, counted righteous whose number Enoch 47:4 says has been offered.'),
  ('enoch', '1-enoch', 47, 4, 'canon', 'revelation', 20, 15, 'free', E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The reckoning turns on whether the name stands in the book — the same books of the living whose tally of the righteous gladdens heaven in Enoch 47:4.'),
  ('enoch', '1-enoch', 47, 4, 'canon', 'revelation', 13, 8, 'free', E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The names were inscribed before the foundation of the world — election precedes confession, so the number of the righteous in Enoch 47:4 is fixed, not assembled.'),
  ('enoch', '1-enoch', 47, 4, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The completing of the brethren''s number is the same fulness Enoch 47:4 calls ''the number of the righteous had been offered.'''),
  -- thread: 1-enoch-47-son-of-adam-elect-one-beside-head-of-days
  ('enoch', '1-enoch', 47, 3, 'enoch', '1-enoch', 46, 3, 'extras', E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The chosen Son of Adam of ch46 is the One sharing the throne-court where the Head of Days seats Himself in Enoch 47:3.'),
  ('enoch', '1-enoch', 47, 3, 'enoch', '1-enoch', 48, 3, 'extras', E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The Son of Adam named before creation is the One enthroned beside the Head of Days whose court Enoch 47:3 describes.'),
  ('enoch', '1-enoch', 47, 3, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam brought near the Ancient of days, the comparative kaph; Enoch 47:3 names that same One enthroned beside the Head of Days.'),
  ('enoch', '1-enoch', 47, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One named before the sun and stars were made (Enoch 48:3) is the Word who was in the beginning with the Father, the Formed Son enthroned beside the Head of Days in Enoch 47:3.'),
  ('enoch', '1-enoch', 47, 3, 'canon', 'matthew', 26, 64, 'free', E'Matthew 26:64 — *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Yahusha claims Daniel''s kaph-clouds and the throne-seat of the Head of Days, the very Son of Adam enthroned in Enoch 47:3.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-47-blood-of-the-righteous-cries',
       E'The blood of the righteous cries from the earth',
       E'Enoch hears it ascend: *And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1) — the very first blood ever spilled already cried this way: *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* (Genesis 4:10), and the ground itself drank it: *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother’s blood from thy hand;* (Genesis 4:11). The Father keeps an exact reckoning of every tear that ground absorbs: *Thou tellest my wanderings: put thou my tears into thy bottle: are they not in thy book?* (Psalm 56:8). And John sees the same martyr-blood under the altar, still crying the same single question: *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* (Revelation 6:9) — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). It ain''t new: the cry of Abel, the bottle of tears, the souls under the altar, and Enoch''s ascending blood are one cry awaiting one answer.',
       sv.verse_id, ev.verse_id, 'extras', 51150
  FROM _session250_en47_lookup sv, _session250_en47_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=47 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-47-holy-ones-intercede-how-long',
       E'The holy ones intercede; how long until judgement?',
       E'The angels do not stay silent over the blood: *In those days the holy ones who dwell above in the heavens Shall unite with one voice And supplicate and pray ... On behalf of the blood of the righteous which has been shed, And that the prayer of the righteous may not be in vain before Yahuah (God) of Spirits, That judgement may be done unto them, And that they may not have to suffer for ever.* (1 Enoch 47:2). That intercession is answered in John''s vision when the martyrs cry the very cry Enoch describes: *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10), and they are told to wait, with the number not yet full: *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* (Revelation 6:11). Enoch''s plea that they ''may not have to suffer for ever'' is the same delayed-but-certain vindication of the white-robed souls — the prayer is not in vain, only awaiting the fulness.',
       sv.verse_id, ev.verse_id, 'extras', 51153
  FROM _session250_en47_lookup sv, _session250_en47_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=47 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-47-head-of-days-throne-books-opened',
       E'The Head of Days enthroned; the books of the living opened',
       E'Enoch watches the court convene: *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). Daniel saw the identical scene — the white-haired Ancient enthroned, the myriads ministering, the books spread open: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9) — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). John sees the same opened books at the consummation, with one in particular: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). Enoch''s ''Head of Days'' is Daniel''s ''Ancient of days'' — the formless Father seated on the throne of glory, His host and counsellors standing as the assize is set. It ain''t new: one throne, one fiery host, one set of opened books across Enoch, Daniel, and the Apocalypse.',
       sv.verse_id, ev.verse_id, 'extras', 51156
  FROM _session250_en47_lookup sv, _session250_en47_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=47 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-47-number-of-the-righteous-election',
       E'The number of the righteous offered — election in the books',
       E'The court''s verdict gladdens heaven: *And the hearts of the holy were filled with joy; Because the number of the righteous had been offered, And the prayer of the righteous had been heard, And the blood of the righteous been required before Yahuah (God) of Spirits.* (1 Enoch 47:4). The ''number of the righteous'' being complete is the same fulness John awaits when the martyrs rest ''until their fellowservants also and their brethren ... should be fulfilled'' (Revelation 6:11) — and these righteous are not a self-chosen class but a named, written people: *And at that time shall Michael stand up ... and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Deliverance follows the writing, not the other way round: *And whosoever was not found written in the book of life was cast into the lake of fire.* (Revelation 20:15). And the names were not entered late but sealed before the world began: *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* (Revelation 13:8). Election precedes confession — the number of the righteous is fixed and named in the books of the living before the assize is ever read.',
       sv.verse_id, ev.verse_id, 'extras', 51159
  FROM _session250_en47_lookup sv, _session250_en47_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=47 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-47-son-of-adam-elect-one-beside-head-of-days',
       E'The Son of Adam named beside the Head of Days',
       E'Chapter 47''s throne-court is the heart of the Parables, where the One who shares that throne is named. Just before, Enoch saw Him: *And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man ... This is the Son of Adam who hath righteousness ... because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:1, 46:3); and Enoch hears His name spoken before creation itself: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits ... Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* (1 Enoch 48:2-3). Enoch NAMES the figure; Daniel sees the same One only by comparison, keeping the kaph: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13) — Daniel beholds *one like the Son of Adam* (He resembles mortal-man because He took on flesh, while remaining the Formed cloud-rider), and Enoch names that very One. He who was named before the sun was made is the Word who was there before all things: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *All things were made by him; and without him was not any thing made that was made.* (John 1:3); and Yahusha claimed Daniel''s seat under oath, again with the kaph-clouds: *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* (Matthew 26:64). The Head of Days is the formless Father; the Son of Adam / Elect One is the Formed Son, chosen and named before the worlds, ordered under the Father and worshipped with Him yet distinct from Him — not co-equal-persons, not a created angel, not a mere man, who came in flesh as Yahusha.',
       sv.verse_id, ev.verse_id, 'extras', 51162
  FROM _session250_en47_lookup sv, _session250_en47_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=47 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-47-blood-of-the-righteous-cries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The first shed blood already cried from the earth before Yahuah, exactly as Enoch 47:1 says the blood of the righteous ascends from the ground.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-blood-of-the-righteous-cries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:11 — *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother’s blood from thy hand;* The earth that opened to receive Abel''s blood is the same earth from which the righteous blood ascends in Enoch 47:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-blood-of-the-righteous-cries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 56:8 — *Thou tellest my wanderings: put thou my tears into thy bottle: are they not in thy book?* The Father keeps an exact account of the suffering of the righteous, the same reckoning Enoch 47:1 says rises before Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-blood-of-the-righteous-cries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=56 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* John sees the shed blood of the righteous gathered under the altar, the same blood Enoch 47:1 sees ascending before Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-blood-of-the-righteous-cries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-47-holy-ones-intercede-how-long
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' ''how long'' is the answered echo of the holy ones'' plea in Enoch 47:2 that judgement be done for the blood of the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-holy-ones-intercede-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The ''little season'' until the number is full is Enoch 47:2''s prayer that the righteous not suffer for ever — vindication delayed, never in vain.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-holy-ones-intercede-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-47-head-of-days-throne-books-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s white-haired Ancient of days seating Himself to judge is Enoch 47:3''s Head of Days seating Himself upon the throne of His glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-head-of-days-throne-books-opened'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The myriads standing before Him and the books opened are precisely the host, counsellors, and books of the living of Enoch 47:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-head-of-days-throne-books-opened'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books and the book of life are Enoch 47:3''s books of the living opened before the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-head-of-days-throne-books-opened'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-47-number-of-the-righteous-election
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Deliverance belongs to those already written in the book — the named, counted righteous whose number Enoch 47:4 says has been offered.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-number-of-the-righteous-election'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The reckoning turns on whether the name stands in the book — the same books of the living whose tally of the righteous gladdens heaven in Enoch 47:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-number-of-the-righteous-election'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The names were inscribed before the foundation of the world — election precedes confession, so the number of the righteous in Enoch 47:4 is fixed, not assembled.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-number-of-the-righteous-election'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The completing of the brethren''s number is the same fulness Enoch 47:4 calls ''the number of the righteous had been offered.'''
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-number-of-the-righteous-election'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-47-son-of-adam-elect-one-beside-head-of-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The chosen Son of Adam of ch46 is the One sharing the throne-court where the Head of Days seats Himself in Enoch 47:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-son-of-adam-elect-one-beside-head-of-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The Son of Adam named before creation is the One enthroned beside the Head of Days whose court Enoch 47:3 describes.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-son-of-adam-elect-one-beside-head-of-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam brought near the Ancient of days, the comparative kaph; Enoch 47:3 names that same One enthroned beside the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-son-of-adam-elect-one-beside-head-of-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One named before the sun and stars were made (Enoch 48:3) is the Word who was in the beginning with the Father, the Formed Son enthroned beside the Head of Days in Enoch 47:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-son-of-adam-elect-one-beside-head-of-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 26:64 — *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Yahusha claims Daniel''s kaph-clouds and the throne-seat of the Head of Days, the very Son of Adam enthroned in Enoch 47:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en47_lookup sv, _session250_en47_lookup tv
 WHERE t.slug='1-enoch-47-son-of-adam-elect-one-beside-head-of-days'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

