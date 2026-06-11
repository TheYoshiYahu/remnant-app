-- ----- fragment: minion_1enoch_38.sql (session250 1-enoch 38) -----
-- Source anchor: enoch/1-enoch ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en38 (view _session250_en38_lookup). Sort band base 50925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-38-righteous-shine-firmament
  ('enoch', '1-enoch', 38, 8, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Daniel''s wise shining as the firmament is Enoch''s light of the righteous shining when the sinners are cast into darkness (38:8).'),
  ('enoch', '1-enoch', 38, 8, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha''s harvest-end shining of the righteous is the same dawn Enoch''s first parable opens with, when the light of the righteous shall shine (38:8).'),
  ('enoch', '1-enoch', 38, 1, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* Wisdom''s persecuted elect shining at their visitation matches Enoch''s righteous and elect appearing when the light appears on the earth (38:1).'),
  -- thread: 1-enoch-38-elect-one-throne-judge
  ('enoch', '1-enoch', 38, 10, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Son of Adam seated on the throne of His glory to judge is Enoch''s Elect One sitting on the throne of glory to judge the secret things (38:10).'),
  ('enoch', '1-enoch', 38, 10, 'canon', 'matthew', 19, 28, 'free', E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* The Son of Adam enthroned to judge with the elect seated about Him is Enoch''s Elect One on the throne of glory judging the secret things (38:10).'),
  ('enoch', '1-enoch', 38, 10, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* Isaiah''s righteous Branch judging by the breath of His lips is the Elect One whom no lying word can stand before, appointed to judge the secret things (38:10).'),
  ('enoch', '1-enoch', 38, 10, 'enoch', '1-enoch', 45, 3, 'extras', E'1 Enoch 45:3 — *On that day Mine Elect One shall sit on the throne of glory and shall try their works, and their place shall be nothing and their dwelling shall be with the faithless.* Enoch''s own parables name the same enthronement, the Elect One on the throne of glory trying works, that 38:10 declares.'),
  -- thread: 1-enoch-38-elect-one-revealed-righteous
  ('enoch', '1-enoch', 38, 3, 'canon', 'isaiah', 53, 11, 'free', E'Isaiah 53:11 — *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* Isaiah''s righteous servant who justifies many is the Elect One, the Righteous One, who appears before Yahuah of Spirits in Enoch''s first parable (38:3).'),
  ('enoch', '1-enoch', 38, 2, 'canon', 'isaiah', 26, 2, 'free', E'Isaiah 26:2 — *Open ye the gates, that the righteous nation which keepeth the truth may enter in.* Isaiah''s righteous nation that keeps the truth is the congregation of the righteous and elect who are victorious in the name of Yahuah of Spirits (38:2).'),
  ('enoch', '1-enoch', 38, 3, 'enoch', '1-enoch', 46, 3, 'extras', E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* Enoch''s later parable names the One who appears in 38:3 as the chosen Son of Adam in whom righteousness dwells and who reveals the hidden things.'),
  -- thread: 1-enoch-38-kings-mighty-furnace
  ('enoch', '1-enoch', 38, 6, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* John''s kings and mighty men hiding in terror are Enoch''s kings and mighty cast down from their thrones with their faces covered in shame (38:6).'),
  ('enoch', '1-enoch', 38, 6, 'canon', 'revelation', 6, 17, 'free', E'Revelation 6:17 — *For the great day of his wrath is come; and who shall be able to stand?* The great day before which no power can stand is Enoch''s day when the kings and mighty are cast into the furnace and cannot look on the face of the holy (38:6).'),
  ('enoch', '1-enoch', 38, 6, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* Yahusha''s furnace of fire for the children of the wicked one is the furnace of fire into which Enoch''s kings and mighty are cast (38:6).'),
  ('enoch', '1-enoch', 38, 6, 'enoch', '1-enoch', 62, 9, 'extras', E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* Enoch''s parables name the Son of Adam as the One who unseats the kings and mighty that 38:6 sees cast down from their thrones.'),
  -- thread: 1-enoch-38-sinners-bound-judged
  ('enoch', '1-enoch', 38, 3, 'canon', 'revelation', 20, 11, 'free', E'Revelation 20:11 — *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* John''s great white throne is the throne before which Enoch''s Elect One appears and all the deeds of the sinners are revealed (38:3).'),
  ('enoch', '1-enoch', 38, 3, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books opened and the dead judged by their works is Enoch''s scene where all the deeds of the sinners shall be revealed before Him (38:3).'),
  ('enoch', '1-enoch', 38, 12, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s two-fold awaking, to life or to shame, is Enoch''s parting of the righteous made victorious from the sinners bound and cast into the furnace (38:12).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-38-righteous-shine-firmament',
       E'The light of the righteous shall shine',
       E'The first parable opens with light: *The first parable which Enoch spoke concerning the righteous and the elect, when the sun rises and the light appears on the earth* (1 Enoch 38:1), and at its turning the verdict lands on the two ways — *And in those days the righteous shall be victorious, and the light of the righteous shall shine, and the sinners shall be cast into darkness, and the righteous shall be victorious in the name of Yahuah (God) of Spirits* (1 Enoch 38:8). This is no new picture. Daniel saw the same dawn: *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). Yahusha (Jesus) spoke it plainly in the parable of the wheat and the tares — the very seed-war Enoch''s Watchers began — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* (Matthew 13:43). And the Wisdom of Solomon carries the same hope for the persecuted elect: *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble* (Wisdom of Solomon 3:7). The righteous here are a people kept in covenant, not a self-chosen class — the light is given, not earned.',
       sv.verse_id, ev.verse_id, 'extras', 50925
  FROM _session250_en38_lookup sv, _session250_en38_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=38 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-38-elect-one-throne-judge',
       E'The Elect One sits on the throne of glory to judge',
       E'Enoch names the One: *And in those days the Elect One shall sit on the throne of glory, and shall judge the secret things, and no one shall be able to utter a lying word before Him; for Yahuah (God) of Spirits has appointed Him, and He has revealed all the hidden things* (1 Enoch 38:10). This is a NAMED title, not a comparison — the Elect One is the Formed Son who proceeds from the Head of Days (the Father, here called Yahuah of Spirits), chosen and appointed and seated to judge. Yahusha (Jesus) took up exactly this throne-language as His own: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31); and to the twelve, *in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel)* (Matthew 19:28) — the gathered tribes, not a church replacing them. The Spirit that fits the Elect One to judge truly is the Spirit Isaiah foresaw: *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2), so that *with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* (Isaiah 11:4). Enoch''s own parables name this same throne again: *On that day Mine Elect One shall sit on the throne of glory and shall try their works* (1 Enoch 45:3).',
       sv.verse_id, ev.verse_id, 'extras', 50928
  FROM _session250_en38_lookup sv, _session250_en38_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=38 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-38-elect-one-revealed-righteous',
       E'The Righteous One appears; the deeds of sinners revealed',
       E'Before the throne is even set, Enoch names the One who appears: *And from henceforth there shall be nothing that is destroyed, for the Elect One shall appear before Him, and all the deeds of the sinners shall be revealed before Him* (1 Enoch 38:3). This is the Messiah — the Righteous One in whom righteousness dwells. Isaiah names Him the Father''s righteous servant: *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). And the open gate of the first parable is Isaiah''s own: *Open ye the gates, that the righteous nation which keepeth the truth may enter in* (Isaiah 26:2) — a righteous nation that keeps the truth, the covenant kept, not law as curse. Enoch''s parables answer who this Elect One is: *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3). The Elect One is chosen and named by the Head of Days before He is confessed by any — election precedes confession.',
       sv.verse_id, ev.verse_id, 'extras', 50931
  FROM _session250_en38_lookup sv, _session250_en38_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=38 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-38-kings-mighty-furnace',
       E'The kings and mighty cast down from their thrones',
       E'Enoch turns to the powers of the earth: *And in those days the kings and the mighty who possess the earth shall be cast down from their thrones, and they shall be cast into the furnace of fire, and their faces shall be covered with shame* (1 Enoch 38:6). Revelation shows the same panic of the mighty at the day of wrath: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15), crying *Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb: For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). The furnace itself is Yahusha''s own word for the end of the tares: *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth* (Matthew 13:42). And Enoch''s parables name the agent of this overthrow as the Son of Adam Himself: *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9). The judgement is against systems of oppression that possess the earth, the powers that led the world astray — not against persons as enemies.',
       sv.verse_id, ev.verse_id, 'extras', 50934
  FROM _session250_en38_lookup sv, _session250_en38_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=38 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-38-sinners-bound-judged',
       E'Those who led the world astray bound with chains',
       E'The first parable binds the deceivers: *And the righteous shall be victorious in the name of Yahuah (God) of Spirits... and those who have led the world astray shall be bound with chains, and in their assemblage-place of destruction shall they be imprisoned, and all their works shall vanish from the face of the earth* (1 Enoch 38:2), and at the close, *And the sinners shall be driven from the face of the earth, and they shall be bound with chains, and their works shall be destroyed, and they shall be cast into the furnace of fire* (1 Enoch 38:12). The deeds of sinners are revealed before the throne — the same scene John saw at the books opened: *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away* (Revelation 20:11), and *I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). And the awaking to that two-fold verdict is Daniel''s: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The chains here are the Watchers'' own chains carried forward — the order of the Creator restored against the rebellion that led the world astray.',
       sv.verse_id, ev.verse_id, 'extras', 50937
  FROM _session250_en38_lookup sv, _session250_en38_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=38 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-38-righteous-shine-firmament
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Daniel''s wise shining as the firmament is Enoch''s light of the righteous shining when the sinners are cast into darkness (38:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-righteous-shine-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha''s harvest-end shining of the righteous is the same dawn Enoch''s first parable opens with, when the light of the righteous shall shine (38:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-righteous-shine-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* Wisdom''s persecuted elect shining at their visitation matches Enoch''s righteous and elect appearing when the light appears on the earth (38:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-righteous-shine-firmament'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-38-elect-one-throne-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Son of Adam seated on the throne of His glory to judge is Enoch''s Elect One sitting on the throne of glory to judge the secret things (38:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-throne-judge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* The Son of Adam enthroned to judge with the elect seated about Him is Enoch''s Elect One on the throne of glory judging the secret things (38:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-throne-judge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* Isaiah''s righteous Branch judging by the breath of His lips is the Elect One whom no lying word can stand before, appointed to judge the secret things (38:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-throne-judge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 45:3 — *On that day Mine Elect One shall sit on the throne of glory and shall try their works, and their place shall be nothing and their dwelling shall be with the faithless.* Enoch''s own parables name the same enthronement, the Elect One on the throne of glory trying works, that 38:10 declares.'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-throne-judge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=45 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-38-elect-one-revealed-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:11 — *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* Isaiah''s righteous servant who justifies many is the Elect One, the Righteous One, who appears before Yahuah of Spirits in Enoch''s first parable (38:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-revealed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 26:2 — *Open ye the gates, that the righteous nation which keepeth the truth may enter in.* Isaiah''s righteous nation that keeps the truth is the congregation of the righteous and elect who are victorious in the name of Yahuah of Spirits (38:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-revealed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* Enoch''s later parable names the One who appears in 38:3 as the chosen Son of Adam in whom righteousness dwells and who reveals the hidden things.'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-elect-one-revealed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-38-kings-mighty-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* John''s kings and mighty men hiding in terror are Enoch''s kings and mighty cast down from their thrones with their faces covered in shame (38:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-kings-mighty-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:17 — *For the great day of his wrath is come; and who shall be able to stand?* The great day before which no power can stand is Enoch''s day when the kings and mighty are cast into the furnace and cannot look on the face of the holy (38:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-kings-mighty-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* Yahusha''s furnace of fire for the children of the wicked one is the furnace of fire into which Enoch''s kings and mighty are cast (38:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-kings-mighty-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* Enoch''s parables name the Son of Adam as the One who unseats the kings and mighty that 38:6 sees cast down from their thrones.'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-kings-mighty-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-38-sinners-bound-judged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:11 — *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* John''s great white throne is the throne before which Enoch''s Elect One appears and all the deeds of the sinners are revealed (38:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-sinners-bound-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books opened and the dead judged by their works is Enoch''s scene where all the deeds of the sinners shall be revealed before Him (38:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-sinners-bound-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s two-fold awaking, to life or to shame, is Enoch''s parting of the righteous made victorious from the sinners bound and cast into the furnace (38:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en38_lookup sv, _session250_en38_lookup tv
 WHERE t.slug='1-enoch-38-sinners-bound-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=38 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

