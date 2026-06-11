-- ----- fragment: minion_1enoch_46.sql (session250 1-enoch 46) -----
-- Source anchor: enoch/1-enoch ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en46 (view _session250_en46_lookup). Sort band base 51125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-46-head-of-days-and-the-son-of-adam
  ('enoch', '1-enoch', 46, 1, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s Ancient of Days with hair like pure wool is Enoch''s Head of Days whose head is white like wool (46:1) — the formless Father on His throne.'),
  ('enoch', '1-enoch', 46, 2, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one *like* the Son of Adam (the kaph-comparative, for the Formed Son took on flesh) coming to the Ancient of Days; Enoch 46:2 NAMES that same One who goes with the Head of Days — same figure, different grammar, both Yahusha.'),
  ('enoch', '1-enoch', 46, 1, 'canon', 'revelation', 1, 14, 'free', E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire.* On Patmos John sees the Son of Adam (1:13) himself now bearing the white-wool hair Enoch saw on the Head of Days (46:1) — the Formed Son shares the Father''s glory.'),
  ('enoch', '1-enoch', 46, 2, 'canon', 'matthew', 26, 64, 'free', E'Matthew 26:64 — *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Yahusha claims under oath the title Enoch named (46:2) — the Son of Adam beside the Head of Days, coming in the clouds as Daniel foresaw.'),
  -- thread: 1-enoch-46-the-son-of-adam-who-hath-righteousness
  ('enoch', '1-enoch', 46, 3, 'canon', 'isaiah', 42, 1, 'free', E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* The Father''s chosen, Spirit-rested elect servant is Enoch''s Son of Adam whom Yahuah of Spirits hath chosen (46:3) — election before confession.'),
  ('enoch', '1-enoch', 46, 3, 'canon', 'isaiah', 53, 11, 'free', E'Isaiah 53:11 — *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* The righteous servant in whom righteousness dwells (46:3) is the same One who justifies many by bearing their iniquities.'),
  ('enoch', '1-enoch', 46, 3, 'enoch', '1-enoch', 48, 2, 'extras', E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The choosing of 46:3 reaches back to a naming before the Head of Days — the Formed Son named before He is confessed.'),
  ('enoch', '1-enoch', 46, 3, 'enoch', '1-enoch', 62, 7, 'extras', E'1 Enoch 62:7 — *And Yahuah (God) of Spirits said: ''This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.''* Parables restates 46:3 — the same Son of Adam over whom righteousness abides, never forsaken by the Head of Days.'),
  -- thread: 1-enoch-46-he-raises-up-kings-and-puts-them-down
  ('enoch', '1-enoch', 46, 5, 'canon', 'psalms', 2, 2, 'free', E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The kings who will not extol the Son of Adam (46:5) are the conspiring rulers of Psalm 2 ranged against Yahuah''s Anointed.'),
  ('enoch', '1-enoch', 46, 4, 'canon', 'psalms', 2, 9, 'free', E'Psalm 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The Anointed who breaks the rebellious is Enoch''s Son of Adam who breaks the teeth of the sinners and puts down the strong (46:4).'),
  ('enoch', '1-enoch', 46, 4, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Spirit-anointed Branch who smites the earth and slays the wicked is the Son of Adam who lays low the inhabitants and breaks the sinners'' teeth (46:4).'),
  ('enoch', '1-enoch', 46, 4, 'canon', 'john', 5, 27, 'free', E'John 5:27 — *And hath given him authority to execute judgment also, because he is the Son of Adam.* Yahusha holds judgment authority precisely as the Son of Adam — the very title and office Enoch saw raising up and putting down the kings (46:4).'),
  ('enoch', '1-enoch', 46, 6, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* The strong whose pride He abases and whose countenance He covers with shame (46:6) are these kings fleeing to the rocks before the wrath of the throne.'),
  -- thread: 1-enoch-46-they-deny-the-name-and-persecute-the-congregations
  ('enoch', '1-enoch', 46, 9, 'canon', 'psalms', 14, 1, 'free', E'Psalm 14:1 — *The fool hath said in his heart, There is no Elohim (God). They are corrupt, they have done abominable works, there is none that doeth good.* The mighty who deny the name of Yahuah of Spirits (46:9) are the corrupt fool of the Psalm, whose denial breeds abominable works.'),
  ('enoch', '1-enoch', 46, 10, 'apocrypha', 'the-wisdom-of-solomon', 2, 12, 'extras', E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* The wicked lie in wait for the righteous because he keeps the law — the same persecution of His congregations and the faithful Enoch names (46:10).'),
  ('enoch', '1-enoch', 46, 9, 'canon', '2-thessalonians', 1, 8, 'free', E'2 Thessalonians 1:8 — *In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ):* The vengeance on those who know not Elohim is Enoch''s judgment on the mighty who deny the name of Yahuah of Spirits (46:9).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-46-head-of-days-and-the-son-of-adam',
       E'The Head of Days and the Son of Adam — Daniel''s two figures, named',
       E'Enoch is shown the keystone of the whole Book of Parables: *And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels* (1 Enoch 46:1). This is the very throne-room Daniel saw — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9) — the Head of Days is the Ancient of Days, the formless Father. And beside Him Daniel saw a second figure: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). Hold the difference plainly: Daniel sees *one **like** the Son of Adam* (the kaph-comparative — he resembles mortal-man because he took on flesh, while remaining the Formed cloud-rider), whereas Enoch does not use the comparative but **names** him outright as *that Son of Adam* (1 Enoch 46:2) — different grammar, the same One, both landing on Yahusha. John saw him on Patmos and kept the comparative too: *And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot* — *His head and his hairs were white like wool, as white as snow* (Revelation 1:13–14), the white-wool hair of Enoch''s first figure now shared by the Formed Son who took flesh. And Yahusha named himself this very One before the high priest: *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Matthew 26:64). The Head of Days is the Father; the Son of Adam is the Formed Son ordered under Him, worshipped with Him yet distinct from Him — not a created angel, not a mere man, but the One Enoch named centuries before Bethlehem.',
       sv.verse_id, ev.verse_id, 'extras', 51125
  FROM _session250_en46_lookup sv, _session250_en46_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=46 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-46-the-son-of-adam-who-hath-righteousness',
       E'The Son of Adam who hath righteousness — chosen by Yahuah of Spirits',
       E'The angel answers Enoch''s question about the second figure: *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever* (1 Enoch 46:3). He is the Father''s elect, chosen and set apart — the very servant Isaiah heard the Father announce: *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles* (Isaiah 42:1). His indwelling righteousness is the righteousness Isaiah''s Suffering Servant carries: *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). Election precedes confession here — the Son of Adam is the chosen One *before* He is the confessed One, and Enoch later tells us how far back that choosing reaches: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2), yea *before the sun and the signs were created* (48:3). Parables itself restates this verse''s righteousness almost word for word: *This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7). The Son of Adam is the Formed One who proceeds from the formless Head of Days, named before the worlds, in whom righteousness dwells — Yahusha.',
       sv.verse_id, ev.verse_id, 'extras', 51128
  FROM _session250_en46_lookup sv, _session250_en46_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=46 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-46-he-raises-up-kings-and-puts-them-down',
       E'He raises and puts down the kings and the mighty',
       E'The Son of Adam is no passive throne-mate; He is the Judge who unseats earth''s rulers: *And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners* (1 Enoch 46:4), *And he shall put down the kings from their thrones and kingdoms* (46:5). This is the Anointed of the second Psalm before whom the rulers conspire in vain: *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2) — yet *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9). It is the rod-of-the-mouth judgment Isaiah saw in the Spirit-anointed Branch: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4) — the same justice given because *he is the Son of Adam* (John 5:27). And when this judgment falls the kings who would not extol Him (46:5) crowd the rocks: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men ... hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). The dominion is His because it was *given* — the everlasting kingdom of Daniel 7:14 — and the Son of Adam administers it, putting down every throne that will not humbly acknowledge whence its kingdom was bestowed.',
       sv.verse_id, ev.verse_id, 'extras', 51131
  FROM _session250_en46_lookup sv, _session250_en46_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=46 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-46-they-deny-the-name-and-persecute-the-congregations',
       E'They deny the name and persecute His congregations',
       E'The chapter closes on the indictment of the mighty: their power *rests upon their riches, And their faith is in the gods which they have made with their hands, And they deny the name of Yahuah (God) of Spirits* (1 Enoch 46:9), *And they persecute the houses of His congregations, And the faithful who hang upon the name of Yahuah (God) of Spirits* (46:10). The root sin is the fool''s denial Scripture names: *The fool hath said in his heart, There is no Elohim (God). They are corrupt, they have done abominable works, there is none that doeth good* (Psalm 14:1). It is the very persecution of the righteous the Wisdom of Solomon dramatizes in the mouths of the wicked: *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law* (Wisdom of Solomon 2:12) — those who hang upon the Father''s name are hunted because they keep His way and the lawless cannot bear it. But the judgment Enoch foresaw against those who deny the name is the judgment Paul preaches: *when the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels, In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 1:7–8). The faithful who *hang upon the name* (46:10) are the covenant remnant — not a class that selected itself but a people who keep the Father''s name and His Torah; their persecutors'' worms-and-darkness end (46:7) is sure because they would not extol that name.',
       sv.verse_id, ev.verse_id, 'extras', 51134
  FROM _session250_en46_lookup sv, _session250_en46_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=46 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-46-head-of-days-and-the-son-of-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s Ancient of Days with hair like pure wool is Enoch''s Head of Days whose head is white like wool (46:1) — the formless Father on His throne.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-head-of-days-and-the-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one *like* the Son of Adam (the kaph-comparative, for the Formed Son took on flesh) coming to the Ancient of Days; Enoch 46:2 NAMES that same One who goes with the Head of Days — same figure, different grammar, both Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-head-of-days-and-the-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire.* On Patmos John sees the Son of Adam (1:13) himself now bearing the white-wool hair Enoch saw on the Head of Days (46:1) — the Formed Son shares the Father''s glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-head-of-days-and-the-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:64 — *Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Yahusha claims under oath the title Enoch named (46:2) — the Son of Adam beside the Head of Days, coming in the clouds as Daniel foresaw.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-head-of-days-and-the-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-46-the-son-of-adam-who-hath-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* The Father''s chosen, Spirit-rested elect servant is Enoch''s Son of Adam whom Yahuah of Spirits hath chosen (46:3) — election before confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-the-son-of-adam-who-hath-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:11 — *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* The righteous servant in whom righteousness dwells (46:3) is the same One who justifies many by bearing their iniquities.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-the-son-of-adam-who-hath-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The choosing of 46:3 reaches back to a naming before the Head of Days — the Formed Son named before He is confessed.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-the-son-of-adam-who-hath-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:7 — *And Yahuah (God) of Spirits said: ''This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.''* Parables restates 46:3 — the same Son of Adam over whom righteousness abides, never forsaken by the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-the-son-of-adam-who-hath-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-46-he-raises-up-kings-and-puts-them-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The kings who will not extol the Son of Adam (46:5) are the conspiring rulers of Psalm 2 ranged against Yahuah''s Anointed.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-he-raises-up-kings-and-puts-them-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The Anointed who breaks the rebellious is Enoch''s Son of Adam who breaks the teeth of the sinners and puts down the strong (46:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-he-raises-up-kings-and-puts-them-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Spirit-anointed Branch who smites the earth and slays the wicked is the Son of Adam who lays low the inhabitants and breaks the sinners'' teeth (46:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-he-raises-up-kings-and-puts-them-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:27 — *And hath given him authority to execute judgment also, because he is the Son of Adam.* Yahusha holds judgment authority precisely as the Son of Adam — the very title and office Enoch saw raising up and putting down the kings (46:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-he-raises-up-kings-and-puts-them-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* The strong whose pride He abases and whose countenance He covers with shame (46:6) are these kings fleeing to the rocks before the wrath of the throne.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-he-raises-up-kings-and-puts-them-down'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-46-they-deny-the-name-and-persecute-the-congregations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 14:1 — *The fool hath said in his heart, There is no Elohim (God). They are corrupt, they have done abominable works, there is none that doeth good.* The mighty who deny the name of Yahuah of Spirits (46:9) are the corrupt fool of the Psalm, whose denial breeds abominable works.'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-they-deny-the-name-and-persecute-the-congregations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* The wicked lie in wait for the righteous because he keeps the law — the same persecution of His congregations and the faithful Enoch names (46:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-they-deny-the-name-and-persecute-the-congregations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 1:8 — *In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ):* The vengeance on those who know not Elohim is Enoch''s judgment on the mighty who deny the name of Yahuah of Spirits (46:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en46_lookup sv, _session250_en46_lookup tv
 WHERE t.slug='1-enoch-46-they-deny-the-name-and-persecute-the-congregations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=46 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

