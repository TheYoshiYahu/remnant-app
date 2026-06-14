-- ----- fragment: minion_revelation_01.sql (S224 Revelation 1) -----
-- =====================================================================
-- S224 minion — REVELATION 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 1 (20 verses) — THE FIRST KAPH CARVE-OUT of the book.
-- Tag: rv01 (temp view _s224_rv01_lookup).
-- Sort band: floor 9000, step 3 (9000, 9003, 9006, 9009, 9012 used; under 9025).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Revelation = the consummation of the covenant story — same Yahuah, same Torah,
-- same Yashar'el brought to restoration; the saints are those who keep the commandments of Elohim;
-- NOT a rapture-escape, NOT a church that replaced Israel, NOT a Torah abolished). Chapter 1 opens
-- on the vision of the Formed — *one like unto the Son of Adam* among the seven lampstands. The
-- KAPH CARVE-OUT fires here: the text reads *one LIKE unto the Son of Adam* (Revelation 1:13), the
-- Greek homoion preserved exactly as the pull returns it, re-speaking Daniel 7:13's *one like the
-- Son of Adam came with the clouds of heaven, and came to the Ancient of days.* The kaph is
-- incarnation-honoring, not identity-opening: the figure is Yahusha (Jesus), the Formed cloud-rider
-- who took on flesh and resembled mortal-man while remaining the Formed — vv.8,11 are Yahuah's own
-- Alpha-and-Omega self-designation, v.18's credentials (*was dead... alive for evermore... keys of
-- hell and of death*) are Yahusha's alone. The Formed bears the Ancient of Days' OWN appearance
-- (head and hairs white like wool, Revelation 1:14 / Daniel 7:9) — the Formed drawn from the
-- Formless, who is Yahuah and has a Father (v.6, *unto Elohim and his Father*). No Trinitarian
-- co-equal-persons grammar; no modalist collapse. Preserve the pull's Son-of-Adam restoration and
-- the kaph exactly.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the revelation given, blessed is he that keepeth the words of this prophecy
--           Tanakh: none warranted (the apparatus carries the keep-the-commandments weight at 12:17/
--                   14:12; v.3's *keep* is a single phrase, not the load-bearing thread of ch1)
--           Extras: none warranted   NT: none warranted
--   v.4-6   the faithful witness, first begotten of the dead, made us kings and priests
--           Tanakh: Exodus 19:6 (a kingdom of priests and an holy nation)
--           Extras: none warranted (carried in the throne thread)
--           NT: none warranted (Christology carried in prose)
--   v.7     behold he cometh with clouds; they also which pierced him; all kindreds shall wail
--           Tanakh: Zechariah 12:10 (they shall look upon me whom they have pierced), Daniel 7:13
--                   (one like the Son of Adam came with the clouds of heaven)
--           Extras: none warranted   NT: Matthew 24:30 (they shall see the Son of Adam coming in
--                   the clouds of heaven... all the tribes of the earth mourn)
--   v.8,11,17 I am Alpha and Omega, the first and the last
--           Tanakh: Isaiah 44:6 (I am the first, and I am the last), Isaiah 48:12 (I am he; I am
--                   the first, I also am the last)
--           Extras: none warranted   NT: none warranted (the self-designation is the Tanakh root)
--   v.12-16 the vision: one like unto the Son of Adam among the seven golden lampstands [KAPH]
--           Tanakh: Daniel 7:13 (one like the Son of Adam... to the Ancient of days), Daniel 7:9
--                   (the Ancient of days, hair like the pure wool), Daniel 10:6 (eyes as lamps of
--                   fire, feet like polished brass), Ezekiel 1:7 (feet... like burnished brass),
--                   Ezekiel 43:2 (his voice like a noise of many waters), Isaiah 49:2 (mouth like a
--                   sharp sword), Zechariah 4:2 (the candlestick all of gold, seven lamps)
--           Extras: 1 Enoch 46:1 (head of days white like wool, and the Son of Adam beside him),
--                   1 Enoch 48:2-3 (that Son of Adam named before the Head of Days, before creation)
--           NT: Matthew 24:30 (the Son of Adam coming in the clouds — the same Daniel-7 vision)
--   v.13-18 (extras throne layer) the throne-and-fire theophany; Son of Adam on the throne of glory
--           Tanakh: carried in the kaph thread   Extras: 1 Enoch 14:15 (the throne of Yahuah of
--                   stibium and sapphire), 1 Enoch 46:1-3 (the Son of Adam beside the Head of Days),
--                   1 Enoch 62:7 (the Son of Adam born unto righteousness)   NT: none warranted
--   v.19-20 the mystery of the seven stars and the seven candlesticks
--           Tanakh: none warranted (the candlestick root carried at v.12 / Zechariah 4)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9000 revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7   (Tanakh + Extras + NT)  [KAPH CENTERPIECE]
--   9003 revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44    (Tanakh)
--   9006 revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19  (Tanakh)
--   9009 revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12  (Tanakh + NT)
--   9012 revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s224_rv01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7  [KAPH CENTERPIECE]
  ('canon', 'revelation', 1, 13, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). This is the vision John re-speaks: *in the midst of the seven candlesticks one like unto the Son of Adam* (Revelation 1:13). Mark the kaph that both texts keep — *one LIKE the Son of Adam,* *one LIKE unto the Son of Adam* — not a bare title but a figure described, resembling mortal-man because he took on flesh, while remaining the Formed who rides the clouds of heaven. The One Daniel saw brought near to the Ancient of days is the One John sees walking among the lampstands; the everlasting kingdom given him in Daniel''s next verse is his alone.'),
  ('canon', 'revelation', 1, 14, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). John sees the One like the Son of Adam wearing this very appearance: *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire* (Revelation 1:14). The hair *like the pure wool,* the snow, the flame — what Daniel saw on the Ancient of days, John now sees on the Formed. The Formed drawn from the Formless bears the Father''s own likeness; he is Yahuah (LORD) and has a Father, the One on the throne and the One brought near to it shown in one glory.'),
  ('canon', 'revelation', 1, 15, 'canon', 'daniel', 10, 6, 'free', E'*His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* (Daniel 10:6). Daniel saw this same Formed One by the great river: *his eyes as lamps of fire,* *his feet like in colour to polished brass.* John beholds him among the lampstands — *his eyes were as a flame of fire; And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters* (Revelation 1:14-15). The eyes of flame, the burning brass of the feet, the overwhelming voice: it is one and the same figure who left Daniel without strength, fallen on his face, the Formed who is the God of the Tanakh interactions come in the flesh.'),
  ('canon', 'revelation', 1, 15, 'canon', 'ezekiel', 1, 7, 'free', E'*And their feet were straight feet; and the sole of their feet was like the sole of a calf''s foot: and they sparkled like the colour of burnished brass.* (Ezekiel 1:7). The living creatures of the throne-chariot sparkled *like the colour of burnished brass,* and the Formed One among the lampstands has *feet like unto fine brass, as if they burned in a furnace* (Revelation 1:15). The same fire-bright brass of Ezekiel''s throne-vision clothes the feet of the One John sees; the whole apparatus of Ezekiel''s chariot-glory is gathered up into the appearance of the slain-yet-living Messiah, who stands in the midst of the seven assemblies as Yahuah (LORD) stood over the cherubim.'),
  ('canon', 'revelation', 1, 15, 'canon', 'ezekiel', 43, 2, 'free', E'*And, behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory.* (Ezekiel 43:2). When the glory of the Elohim (God) of Yashar''el (Israel) returned to the temple, *his voice was like a noise of many waters* — and the Formed One among the lampstands speaks with *his voice as the sound of many waters* (Revelation 1:15). The voice that filled Ezekiel''s temple-vision is the voice John hears; the returning glory of the God of Yashar''el (Israel) is the very One walking among his assemblies, come not to abolish his house but to consummate it.'),
  ('canon', 'revelation', 1, 16, 'canon', 'isaiah', 49, 2, 'free', E'*And he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft; in his quiver hath he hid me;* (Isaiah 49:2). The Servant of Isaiah speaks: Yahuah (LORD) *hath made my mouth like a sharp sword.* And out of the mouth of the Formed One *went a sharp twoedged sword* (Revelation 1:16). The word of the Servant is the weapon — the same sword that proceeds from the rider on the white horse who *in righteousness he doth judge and make war.* The One among the lampstands is the Servant whom Yahuah (LORD) hid in his quiver and now reveals, his word the two-edged sword that divides and judges his people.'),
  ('canon', 'revelation', 1, 12, 'canon', 'zechariah', 4, 2, 'free', E'*And said unto me, What seest thou? And I said, I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps, which are upon the top thereof:* (Zechariah 4:2). Zechariah saw *a candlestick all of gold* with its *seven lamps* — the menorah that stood in the tabernacle and the temple. John sees *seven golden candlesticks* (Revelation 1:12), and the Formed One stands in their midst; *the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20). The lampstand of the sanctuary becomes the assemblies of the gathered, and the light among them is the One who is himself the light, standing where Yahuah (LORD) stood over the menorah of his house.'),
  ('canon', 'revelation', 1, 13, 'enoch', '1-enoch', 46, 1, 'extras', E'*And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels.* (1 Enoch 46:1). The Hebrew library saw the same pairing John sees: the Head of Days *white like wool,* and beside him *another being whose countenance had the appearance of a man* — the Son of Adam. In Revelation the two appearances are joined in one Formed figure, *one like unto the Son of Adam* (Revelation 1:13) whose *head and his hairs were white like wool* (Revelation 1:14): the Son of Adam who stands beside the Head of Days now bears the Head of Days'' own white-wool likeness, the Formed who is Yahuah (LORD) and has a Father.'),
  ('canon', 'revelation', 1, 13, 'enoch', '1-enoch', 48, 2, 'extras', E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* (1 Enoch 48:2). The restored library names the Son of Adam before the Head of Days, and names him from before the world: *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). This is the One John beholds *like unto the Son of Adam* in the midst of the lampstands (Revelation 1:13), who declares *I am Alpha and Omega, the first and the last* (Revelation 1:11) — named before creation, the first and the last, the Son of Adam whose name was spoken before the stars were made.'),
  ('canon', 'revelation', 1, 13, 'canon', 'matthew', 24, 30, 'free', E'*And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* (Matthew 24:30). Yahusha (Jesus) speaks the Daniel-7 vision of himself: *the Son of Adam coming in the clouds of heaven.* It is the same vision John records — *one like unto the Son of Adam* (Revelation 1:13), and *Behold, he cometh with clouds* (Revelation 1:7). The figure among the lampstands and the cloud-rider Yahusha (Jesus) named in the gospel are one; the One who told the disciples they would see the Son of Adam coming is the One who shows John how he appears, walking among his assemblies until that day.'),
  -- thread: revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44
  ('canon', 'revelation', 1, 8, 'canon', 'isaiah', 44, 6, 'free', E'*Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). Yahuah (LORD), the King and Redeemer of Yashar''el (Israel), declares *I am the first, and I am the last.* The One among the lampstands takes that very name to himself: *I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty* (Revelation 1:8). The first-and-last of Isaiah is the Formed One of the vision — Yahusha (Jesus) bearing the divine name, the Redeemer of Yashar''el (Israel) come in the flesh, beside whom there is no other Elohim (God).'),
  ('canon', 'revelation', 1, 11, 'canon', 'isaiah', 44, 6, 'free', E'*Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). The voice behind John, *as of a trumpet,* says *I am Alpha and Omega, the first and the last* (Revelation 1:11) — the exact title Yahuah (LORD) spoke through Isaiah. The Formed One who commissions the seven letters is the King and Redeemer of Yashar''el (Israel); the *first and the last* is no new claim but the name borne since Isaiah, now spoken by the One who stands in the midst of the assemblies.'),
  ('canon', 'revelation', 1, 17, 'canon', 'isaiah', 48, 12, 'free', E'*Hearken unto me, O Jacob and Yashar''el (Israel), my called; I am he; I am the first, I also am the last.* (Isaiah 48:12). Yahuah (LORD) calls to Jacob and Yashar''el (Israel): *I am he; I am the first, I also am the last.* When John falls at his feet as dead, the Formed One lays his right hand upon him and says, *Fear not; I am the first and the last* (Revelation 1:17). The same self-naming that summoned Jacob and Yashar''el (Israel) now lifts the fallen seer; the *first and the last* who called Yashar''el (Israel) of old is the One who lives, and was dead, and is alive for evermore.'),
  -- thread: revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19
  ('canon', 'revelation', 1, 6, 'canon', 'exodus', 19, 6, 'free', E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* (Exodus 19:6). At Sinai Yahuah (LORD) named the destiny of his people: *a kingdom of priests, and an holy nation.* Revelation says Yahusha (Jesus) *hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6). The promise spoken to the children of Yashar''el (Israel) is fulfilled in the gathered seed — the same kingdom of priests, the same holy nation, brought to its purpose by the slain Lamb who washed them in his own blood. This is not a new people replacing Yashar''el (Israel) but the covenant calling of Yashar''el (Israel) consummated.'),
  -- thread: revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12
  ('canon', 'revelation', 1, 7, 'canon', 'zechariah', 12, 10, 'free', E'*And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn.* (Zechariah 12:10). Yahuah (LORD) says the house of David and Jerusalem *shall look upon me whom they have pierced, and they shall mourn.* John writes *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him* (Revelation 1:7). The pierced One whom they look upon is Yahuah (LORD) himself — the Formed, pierced in the flesh; the mourning of Zechariah becomes the wailing of all kindreds when he comes with the clouds.'),
  ('canon', 'revelation', 1, 7, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). Daniel saw *one like the Son of Adam came with the clouds of heaven.* John announces his coming in the same words: *Behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7). The cloud-coming of the Son of Adam in Daniel is the cloud-coming John proclaims — the Formed cloud-rider, who alone is given the everlasting kingdom, coming to be seen by every eye.'),
  ('canon', 'revelation', 1, 7, 'canon', 'matthew', 24, 30, 'free', E'*And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* (Matthew 24:30). Yahusha (Jesus) joined the cloud-coming of Daniel 7 to the mourning of Zechariah 12: *all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven.* John speaks the same joined word: *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him* (Revelation 1:7). The seeing, the mourning, the clouds — the gospel-word of the Son of Adam''s coming is the word with which John opens his vision.'),
  -- thread: revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62
  ('canon', 'revelation', 1, 13, 'enoch', '1-enoch', 14, 15, 'extras', E'*But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15). Enoch, carried up in a chariot of fire, saw *the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire,* with flaming fire round about it. It is the same throne-and-fire theophany John is brought into when he beholds the Formed One whose *eyes were as a flame of fire* and whose *feet like unto fine brass, as if they burned in a furnace* (Revelation 1:14-15). The fire of the throne Enoch saw clothes the One who walks among the lampstands; the seer falls as dead, as Enoch trembled before the great glory.'),
  ('canon', 'revelation', 1, 17, 'enoch', '1-enoch', 46, 3, 'extras', E'*And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* (1 Enoch 46:3). The library names the Son of Adam *who revealeth all the treasures of that which is hidden* — and it is this One who tells John, *Fear not; I am the first and the last* (Revelation 1:17), and bids him *write the things which thou hast seen, and the things which are, and the things which shall be hereafter* (Revelation 1:19). The Son of Adam chosen before Yahuah (God) of Spirits to reveal the hidden things is the One unveiling the Revelation, the first and the last who holds the keys of hell and of death.'),
  ('canon', 'revelation', 1, 18, 'enoch', '1-enoch', 62, 7, 'extras', E'*And Yahuah (God) of Spirits said: ''This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.''* (1 Enoch 62:7). The Hebrew library beholds the Son of Adam seated on the throne of glory, *born unto righteousness,* over whom the righteousness of the Head of Days never fails. He is the One who declares to John, *I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death* (Revelation 1:18). The Son of Adam enthroned beside the Head of Days in Enoch''s vision is the slain-yet-living One of John''s vision — the Formed, alive for evermore, who holds death and the grave in his hand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7',
       E'One like unto the Son of Adam among the seven golden lampstands (Daniel 7)',
       E'John turns to see the voice and beholds *seven golden candlesticks; And in the midst of the seven candlesticks one like unto the Son of Adam* (Revelation 1:12-13). Mark the kaph the text keeps — *one LIKE unto the Son of Adam* — the very construction of Daniel''s vision: *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). It is not a bare title but a figure described: he resembles mortal-man because he took on flesh, while remaining the Formed who rides the clouds of heaven. And the appearance John sees is the Ancient of Days'' own: *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire* (Revelation 1:14) — for Daniel saw *the Ancient of days... whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame* (Daniel 7:9). The Formed drawn from the Formless bears the Father''s likeness; he is Yahuah (LORD) and has a Father. The Hebrew library held the same pairing: *there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man* (1 Enoch 46:1) — the Son of Adam who *was named In the presence of Yahuah (God) of Spirits... before the sun and the signs were created* (1 Enoch 48:2-3), named before creation, the first and the last. The rest of the vision gathers up the whole prophetic glory into this one figure. His *eyes as lamps of fire* and *feet like in colour to polished brass* are the appearance of the Formed One Daniel saw by the great river (Daniel 10:6); the burning brass of his feet is the *burnished brass* of the throne-chariot creatures (Ezekiel 1:7); his *voice as the sound of many waters* (Revelation 1:15) is the returning glory of the Elohim (God) of Yashar''el (Israel) whose *voice was like a noise of many waters* (Ezekiel 43:2); *out of his mouth went a sharp twoedged sword* (Revelation 1:16) is the Servant whose *mouth* Yahuah (LORD) made *like a sharp sword* (Isaiah 49:2); and the golden lampstands are the menorah Zechariah saw, *a candlestick all of gold... and his seven lamps* (Zechariah 4:2), now become the seven assemblies (Revelation 1:20). This is the same vision Yahusha (Jesus) spoke of himself — *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30). The figure among the lampstands is Yahusha (Jesus), the Formed cloud-rider who took on flesh: vv.8 and 11 are Yahuah''s own Alpha-and-Omega name, and v.18''s credentials — *was dead... alive for evermore... keys of hell and of death* — are his alone. The kaph honors the incarnation and points at the Standard; harmonized, the One like unto the Son of Adam is the slain-yet-living Messiah walking in the midst of his gathered people.',
       sv.verse_id, ev.verse_id, 'extras', 9000
  FROM _s224_rv01_lookup sv, _s224_rv01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44',
       E'I am Alpha and Omega, the first and the last (Isaiah 44, 48)',
       E'Three times in this chapter the Formed One takes a name that Yahuah (LORD) spoke through Isaiah. *I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty* (Revelation 1:8); *I am Alpha and Omega, the first and the last* (Revelation 1:11); and to the fallen seer, *Fear not; I am the first and the last* (Revelation 1:17). The title is Isaiah''s: *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6); and again, *Hearken unto me, O Jacob and Yashar''el (Israel), my called; I am he; I am the first, I also am the last* (Isaiah 48:12). The *first and the last* is the King and Redeemer of Yashar''el (Israel), beside whom there is no other Elohim (God) — and the One who bears it in the vision is the Formed, Yahusha (Jesus), come in the flesh. He does not claim a new name; he speaks the name he has borne since Isaiah, the One who called Jacob and Yashar''el (Israel) of old now lifting the fallen John with the same self-naming. The self-designation that summoned Yashar''el (Israel) is the voice that commissions the seven letters and unveils the Revelation.',
       sv.verse_id, ev.verse_id, 'free', 9003
  FROM _s224_rv01_lookup sv, _s224_rv01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19',
       E'The faithful witness who made us kings and priests unto Elohim (God) (Exodus 19)',
       E'John opens his greeting with the Christology of the whole book: grace and peace *from Yahusha HaMashiach (Jesus Christ), who is the faithful witness, and the first begotten of the dead, and the prince of the kings of the earth. Unto him that loved us, and washed us from our sins in his own blood, And hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:5-6). The slain Lamb who washed his people in his own blood has brought them to the destiny Yahuah (LORD) named at Sinai: *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). What was promised to the children of Yashar''el (Israel) at the mountain is consummated in the gathered seed — *kings and priests unto Elohim (God) and his Father.* This is not a new people replacing Yashar''el (Israel) but the covenant calling of Yashar''el (Israel) brought to its purpose. And mark the Christology: the One who made them priests did so *unto Elohim (God) and his Father* — Yahusha (Jesus) is the Formed who has a Father, the *faithful witness* and *first begotten of the dead,* distinguished from the One on the throne even as he bears the divine name and the divine glory and dominion *for ever and ever.*',
       sv.verse_id, ev.verse_id, 'free', 9006
  FROM _s224_rv01_lookup sv, _s224_rv01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12',
       E'Behold, he cometh with clouds, and they also which pierced him (Zechariah 12, Daniel 7)',
       E'*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen* (Revelation 1:7). The verse weaves two prophetic words into one. The cloud-coming is Daniel''s: *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the Formed cloud-rider to whom the everlasting kingdom is given. The piercing and the mourning are Zechariah''s: Yahuah (LORD) says the house of David and Jerusalem *shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son* (Zechariah 12:10). It is Yahuah (LORD) himself who says *whom they have pierced* — the Formed, pierced in the flesh; the One they pierced is the One who comes with the clouds. Yahusha (Jesus) joined these same two prophecies when he spoke of his own coming: *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* and *all the tribes of the earth mourn* (Matthew 24:30). The seeing, the mourning, the clouds — John opens his vision with the gospel-word of the Son of Adam''s coming, the pierced and cloud-borne Messiah whom every eye shall see.',
       sv.verse_id, ev.verse_id, 'free', 9009
  FROM _s224_rv01_lookup sv, _s224_rv01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62',
       E'The throne of fire and the Son of Adam on the throne of glory (1 Enoch 14, 46, 62)',
       E'The vision of the Formed One among the lampstands breathes the same air as the throne-visions of the restored library. Enoch, carried up in a chariot of fire, saw the throne theophany: *the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15), with flaming fire round about — the very fire that clothes the One whose *eyes were as a flame of fire* and whose *feet like unto fine brass, as if they burned in a furnace* (Revelation 1:14-15), before whom John *fell at his feet as dead* (Revelation 1:17) as Enoch trembled before the great glory. And the library names the One who stands there: the Son of Adam beside the Head of Days, *who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3) — it is this revealing One who tells John *Fear not; I am the first and the last* and bids him *write the things which thou hast seen* (Revelation 1:17,19). He is *the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7), seated on the throne of glory — the same slain-yet-living One who declares *I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death* (Revelation 1:18). The Son of Adam enthroned beside the Head of Days in Enoch''s vision is the Formed of John''s vision, alive for evermore, holding death and the grave in his hand.',
       sv.verse_id, ev.verse_id, 'extras', 9012
  FROM _s224_rv01_lookup sv, _s224_rv01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the kaph-vision John re-speaks; *one like unto the Son of Adam* in the midst of the lampstands (Revelation 1:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *the Ancient of days... whose garment was white as snow, and the hair of his head like the pure wool* the Formed bears the Ancient of Days'' own appearance; *his head and his hairs were white like wool, as white as snow* (Revelation 1:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 10:6 — *his eyes as lamps of fire, and his arms and his feet like in colour to polished brass* the Formed One Daniel saw by the great river; the same eyes of flame and feet of brass among the lampstands (Revelation 1:14-15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:7 — *they sparkled like the colour of burnished brass* the throne-chariot creatures'' fire-bright brass; the Formed One''s *feet like unto fine brass, as if they burned in a furnace* (Revelation 1:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 43:2 — *his voice was like a noise of many waters* the returning glory of the Elohim (God) of Yashar''el (Israel); the Formed One''s *voice as the sound of many waters* (Revelation 1:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 49:2 — *he hath made my mouth like a sharp sword* the Servant''s word the weapon; *out of his mouth went a sharp twoedged sword* (Revelation 1:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Zechariah 4:2 — *a candlestick all of gold... and his seven lamps* the menorah of the sanctuary; John sees *seven golden candlesticks* become the seven assemblies (Revelation 1:12,20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Enoch 46:1 — *One who had a head of days... white like wool, and with Him was another being whose countenance had the appearance of a man* the library''s same pairing, joined in one Formed figure who bears the Head of Days'' white-wool likeness (Revelation 1:13-14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'1 Enoch 48:2 — *that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* named before creation; the One *like unto the Son of Adam* who is *the first and the last* (Revelation 1:11,13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Matthew 24:30 — *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* Yahusha (Jesus) speaking the Daniel-7 vision of himself; the same One John sees *like unto the Son of Adam* (Revelation 1:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-one-like-the-son-of-adam-among-the-lampstands-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:6 — *I am the first, and I am the last; and beside me there is no Elohim (God)* the King and Redeemer of Yashar''el (Israel)''s name, taken by the Formed One: *I am Alpha and Omega... the Almighty* (Revelation 1:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *I am the first, and I am the last* the same title behind the trumpet-voice; *I am Alpha and Omega, the first and the last* commissioning the seven letters (Revelation 1:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 48:12 — *Hearken unto me, O Jacob and Yashar''el (Israel), my called; I am he; I am the first, I also am the last* the self-naming that summoned Yashar''el (Israel) now lifts the fallen seer: *Fear not; I am the first and the last* (Revelation 1:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:6 — *ye shall be unto me a kingdom of priests, and an holy nation* the Sinai promise to the children of Yashar''el (Israel), consummated in the gathered seed *made... kings and priests unto Elohim (God) and his Father* (Revelation 1:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 12:10 — *they shall look upon me whom they have pierced, and they shall mourn for him* Yahuah (LORD) himself the pierced One; *they also which pierced him... all kindreds of the earth shall wail* (Revelation 1:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven* the cloud-coming John proclaims: *Behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:30 — *all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven* Yahusha (Jesus) joining Daniel 7 and Zechariah 12; the same joined word opens John''s vision (Revelation 1:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-behold-he-cometh-with-clouds-and-they-which-pierced-him-zechariah-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:15 — *like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* the throne-and-fire theophany Enoch saw; the fire that clothes the One with *eyes... as a flame of fire* (Revelation 1:13-14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness... and who revealeth all the treasures of that which is hidden* the chosen revealer; the One who tells John *Fear not; I am the first and the last* and bids him *write* (Revelation 1:17,19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 62:7 — *This is the Son of Adam who is born unto righteousness... the righteousness of the Head of Days forsakes him not* seated on the throne of glory; the slain-yet-living One *alive for evermore... have the keys of hell and of death* (Revelation 1:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv01_lookup sv, _s224_rv01_lookup tv
 WHERE t.slug='revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
