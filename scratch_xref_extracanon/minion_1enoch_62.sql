-- ----- fragment: minion_1enoch_62.sql (session250 1-enoch 62) -----
-- Source anchor: enoch/1-enoch ch62. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en62 (view _session250_en62_lookup). Sort band base 51525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en62_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-62-elect-one-throne-of-glory
  ('enoch', '1-enoch', 62, 1, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Head of Days who names and seats the Elect One in Enoch 62:1 is Daniel''s Ancient of days who sits before any other throne is given.'),
  ('enoch', '1-enoch', 62, 1, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one *like* the Son of Adam brought near; Enoch 62:1 names that same One as the Elect One seated on the throne of glory — keep the ''like,'' for he resembles mortal-man yet remains the Formed cloud-rider.'),
  ('enoch', '1-enoch', 62, 1, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory.* The throne of His glory in Enoch 62:1 is the very throne from which Yahusha, the Son of Adam, judges all nations.'),
  ('enoch', '1-enoch', 62, 2, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The judging ''by the way of the righteous judgement'' in Enoch 62:2 is Isaiah''s Branch who judges in righteousness, not by the sight of the eyes.'),
  -- thread: 1-enoch-62-son-of-adam-named-chosen
  ('enoch', '1-enoch', 62, 7, 'canon', 'matthew', 26, 64, 'free', E'Matthew 26:64 — *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Yahusha owns the very title Enoch 62:7 records the Father speaking: ''This is the Son of Adam'' — named, not merely likened.'),
  ('enoch', '1-enoch', 62, 8, 'enoch', '1-enoch', 46, 3, 'extras', E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* Enoch 62:8 repeats word-for-word the Parables'' first naming of the chosen Son of Adam — the same One, identified again at the throne.'),
  ('enoch', '1-enoch', 62, 7, 'enoch', '1-enoch', 48, 3, 'extras', E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The Son of Adam ''born unto righteousness'' in Enoch 62:7 was named before creation — election precedes the world, not the confession of men.'),
  -- thread: 1-enoch-62-kings-mighty-cast-down
  ('enoch', '1-enoch', 62, 9, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Son of Adam who casts down kings and kingdoms in Enoch 62:9-10 holds the everlasting dominion Daniel saw given to him by the Ancient of days.'),
  ('enoch', '1-enoch', 62, 10, 'canon', 'psalms', 2, 9, 'free', E'Psalm 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The Son of Adam who ''put down the kings from their thrones'' in Enoch 62:10 is the Psalm''s enthroned Son who breaks the raging rulers with the iron rod.'),
  ('enoch', '1-enoch', 62, 11, 'canon', 'isaiah', 45, 23, 'free', E'Isaiah 45:23 — *I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* The pride of the mighty abased in Enoch 62:11 ends where every knee bows before the throne of glory.'),
  ('enoch', '1-enoch', 62, 11, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* Paul names the One before whom the proud of Enoch 62:11 are abased: Yahusha, the Son of Adam exalted by the Father.'),
  -- thread: 1-enoch-62-mighty-shame-too-late
  ('enoch', '1-enoch', 62, 12, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains.* The shamed and hopeless strong of Enoch 62:12 are John''s kings and mighty men who hide from the One on the throne when the day of wrath comes.'),
  ('enoch', '1-enoch', 62, 12, 'canon', 'revelation', 6, 16, 'free', E'Revelation 6:16 — *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb.* The mighty whose countenance is covered with shame in Enoch 62:12 beg the rocks to hide them from the face of the enthroned Son of Adam — the wrath of the Lamb.'),
  ('enoch', '1-enoch', 62, 10, 'canon', 'revelation', 1, 7, 'free', E'Revelation 1:7 — *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* The kings who refused to acknowledge Him in Enoch 62:10 are those who at His coming see Him too late and wail before the throne of glory.'),
  ('enoch', '1-enoch', 62, 11, 'canon', 'isaiah', 52, 15, 'free', E'Isaiah 52:15 — *So shall he sprinkle many nations; the kings shall shut their mouths at him: for that which had not been told them shall they see; and that which they had not heard shall they consider.* The strong abased and silenced in Enoch 62:11 are the kings who shut their mouths before the vindicated Servant.'),
  ('enoch', '1-enoch', 62, 12, 'apocrypha', 'the-wisdom-of-solomon', 5, 3, 'extras', E'Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach.* The shame-covered strong of Enoch 62:12 echo the mockers who, too late, recognize the righteous One they had despised.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en62_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en62_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-62-elect-one-throne-of-glory',
       E'The Elect One seated on the throne of His glory to judge',
       E'Enoch sees the enthronement: *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance* (1 Enoch 62:1). The Father — the Head of Days, the formless One — names the Formed Son and sets Him to judge; the Son of Adam does not seize the throne but receives it. Daniel sees the same handover, where the Ancient of days sits first — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9) — and then *one **like** the Son of Adam* is brought near and given the kingdom (Daniel 7:13). Keep the kaph: Daniel sees one *like* the Son of Adam, resembling mortal-man because the Formed Son took on flesh; Enoch *names* that very One. Yahusha said the same before the high priest — *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Matthew 26:64) — and the Gospels carry the throne forward: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31). The righteousness of His judgement is Isaiah''s anointed King: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* (Isaiah 11:4). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51525
  FROM _session250_en62_lookup sv, _session250_en62_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=62 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-62-son-of-adam-named-chosen',
       E'This is the Son of Adam — named, born unto righteousness',
       E'Where Daniel and the Gospels say *one like the Son of Adam* under the kaph, Enoch drops the veil and **names** Him plainly: *And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7), *who revealeth all the treasures of that which is hidden, Because Yahuah (God) of Spirits hath chosen him* (1 Enoch 62:8). This is no fresh figure but the One already shown in the Parables — *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden* (1 Enoch 46:3) — and named before the world was: *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). Election precedes confession; the Father chooses and names the Formed Son, ordered under Him, distinct from Him yet worshipped with Him. The Gospel says it without the kaph because the Word had come in flesh — *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Matthew 26:64). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51528
  FROM _session250_en62_lookup sv, _session250_en62_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=62 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-62-kings-mighty-cast-down',
       E'He shall put down the kings from their thrones',
       E'The same enthroned One who saves the elect unmakes the proud: *This Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9), *And he shall put down the kings from their thrones and kingdoms Because they do not extol and praise Him, Nor humbly acknowledge whence the kingdom was bestowed upon them* (1 Enoch 62:10). This is the dominion Daniel saw given to the Son of Adam — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14) — and the iron-rod reign of the Psalm: *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9), with its warning, *Be wise now therefore, O ye kings: be instructed, ye judges of the earth* (Psalm 2:10). Before this throne every crown bows — *That unto me every knee shall bow, every tongue shall swear* (Isaiah 45:23) — and the New Testament names whose knee: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The kingdom was always His to bestow and to remove. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51531
  FROM _session250_en62_lookup sv, _session250_en62_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=62 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-62-mighty-shame-too-late',
       E'Shame, darkness, and worms — the terror of the mighty too late',
       E'For the kings and the strong the seeing comes too late: *And the countenance of the strong shall be covered with shame, And darkness shall be their dwelling, And worms shall be their bed, And they shall have no hope of rising from their beds, Because they do not extol the name of Yahuah (God) of Spirits* (1 Enoch 62:12). This is the wail of Revelation, when the kings who once ruled hide from the throne — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men... hid themselves in the dens and in the rocks of the mountains; And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb* (Revelation 6:15-16) — and *every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him* (Revelation 1:7). It is Isaiah''s despised Servant now vindicated, whom the nations once would not desire — *he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him* (Isaiah 53:2) — yet before whom *the kings shall shut their mouths at him* (Isaiah 52:15). The extra-canon witness says it of the mockers who at last behold the righteous One they had scorned: *This was he, whom we had sometimes in derision, and a proverb of reproach* (Wisdom of Solomon 5:3). The kings who would not acknowledge whence their kingdom came now have no hope of rising. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51534
  FROM _session250_en62_lookup sv, _session250_en62_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=62 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-62-elect-one-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Head of Days who names and seats the Elect One in Enoch 62:1 is Daniel''s Ancient of days who sits before any other throne is given.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one *like* the Son of Adam brought near; Enoch 62:1 names that same One as the Elect One seated on the throne of glory — keep the ''like,'' for he resembles mortal-man yet remains the Formed cloud-rider.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory.* The throne of His glory in Enoch 62:1 is the very throne from which Yahusha, the Son of Adam, judges all nations.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The judging ''by the way of the righteous judgement'' in Enoch 62:2 is Isaiah''s Branch who judges in righteousness, not by the sight of the eyes.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-62-son-of-adam-named-chosen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 26:64 — *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Yahusha owns the very title Enoch 62:7 records the Father speaking: ''This is the Son of Adam'' — named, not merely likened.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-son-of-adam-named-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* Enoch 62:8 repeats word-for-word the Parables'' first naming of the chosen Son of Adam — the same One, identified again at the throne.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-son-of-adam-named-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The Son of Adam ''born unto righteousness'' in Enoch 62:7 was named before creation — election precedes the world, not the confession of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-son-of-adam-named-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-62-kings-mighty-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Son of Adam who casts down kings and kingdoms in Enoch 62:9-10 holds the everlasting dominion Daniel saw given to him by the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-kings-mighty-cast-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The Son of Adam who ''put down the kings from their thrones'' in Enoch 62:10 is the Psalm''s enthroned Son who breaks the raging rulers with the iron rod.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-kings-mighty-cast-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:23 — *I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* The pride of the mighty abased in Enoch 62:11 ends where every knee bows before the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-kings-mighty-cast-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* Paul names the One before whom the proud of Enoch 62:11 are abased: Yahusha, the Son of Adam exalted by the Father.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-kings-mighty-cast-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-62-mighty-shame-too-late
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains.* The shamed and hopeless strong of Enoch 62:12 are John''s kings and mighty men who hide from the One on the throne when the day of wrath comes.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-mighty-shame-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:16 — *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb.* The mighty whose countenance is covered with shame in Enoch 62:12 beg the rocks to hide them from the face of the enthroned Son of Adam — the wrath of the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-mighty-shame-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:7 — *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* The kings who refused to acknowledge Him in Enoch 62:10 are those who at His coming see Him too late and wail before the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-mighty-shame-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 52:15 — *So shall he sprinkle many nations; the kings shall shut their mouths at him: for that which had not been told them shall they see; and that which they had not heard shall they consider.* The strong abased and silenced in Enoch 62:11 are the kings who shut their mouths before the vindicated Servant.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-mighty-shame-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach.* The shame-covered strong of Enoch 62:12 echo the mockers who, too late, recognize the righteous One they had despised.'
  FROM cross_reference_threads t, cross_references x, _session250_en62_lookup sv, _session250_en62_lookup tv
 WHERE t.slug='1-enoch-62-mighty-shame-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

