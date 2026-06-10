-- =====================================================================
-- Session 224 — Revelation FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session224_revelation_cross_references.sql
-- =====================================================================

\echo 'session224 — Revelation cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_revelation_02.sql (S224 Revelation 2) -----
-- =====================================================================
-- S224 minion — REVELATION 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 2 (29 verses) — the letters to Ephesus, Smyrna, Pergamos, Thyatira.
-- Tag: rv02 (temp view _s224_rv02_lookup).
-- Sort band: floor 9025, step 3 (9025, 9028, 9031, 9034, 9037, 9040, 9043 used; under 9050).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: the seven letters are the covenant-faithfulness charge brought to the assemblies
-- of the scattered seed — the SAME charge the prophets brought to the two houses: hold fast the name
-- and the works, do not eat what is sacrificed to idols, do not commit the spiritual fornication that
-- the doctrine of Balaam and the woman Jezebel seduce men into. This is NOT anti-Jewish polemic and
-- NOT a how-to list; it is the Shepherd calling his own to keep his works unto the end. The
-- overcomer's reward in each letter is a restoration-promise: the tree of life in the paradise of
-- Elohim (Eden restored), the hidden manna and the new name, power over the nations with the rod of
-- iron, the morning star.
--
-- WATCHPOINT — 2:9 *which say they are Yahudim (Jews), and are not, but are the synagogue of Satan*:
-- held as a FALSE-CLAIM DIAGNOSTIC, never a charter for anti-Jewish replacement. It is the same
-- measure Paul names in Romans 2:28-29 — *he is not a Yahudi (Jew), which is one outwardly* — those
-- who claim the covenant name while opposing the Messiah and slandering his keepers (the verse names
-- their *blasphemy*). The true Yashar'el (Israel) is the one being sealed and gathered in ch 7. The
-- diagnostic falls on a posture of opposition, not on a people; the persecuted poor-but-rich assembly
-- of Smyrna is itself largely the covenant seed.
--
-- Christology: the speaker in each letter is the Formed — *the first and the last, which was dead,
-- and is alive* (2:8 / Isaiah 44:6), *the Son of Elohim (God), who hath his eyes like unto a flame
-- of fire, and his feet are like fine brass* (2:18 / Daniel 10:6), who receives the rod-of-iron
-- authority *of my Father* (2:27 / Psalm 2:7-9) — Yahuah and yet having a Father, never collapsed,
-- never co-equal-persons grammar. Preserved exactly as the pull gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   Ephesus: holdeth the seven stars, left thy first love, hatest the Nicolaitans
--           Tanakh: none warranted (the load-bearing root is the tree-of-life PROMISE at v.7)
--           Extras: none warranted   NT: none warranted (the v.1 lampstand/stars carry to ch 1's thread)
--   v.7     the tree of life in the midst of the paradise of Elohim
--           Tanakh: Genesis 2:9 (the tree of life in the midst of the garden), Ezekiel 47:12 (the
--                   trees whose leaf fadeth not, for meat and medicine)
--           Extras: 1 Enoch 24:4 (the fragrant tree by the throne), 24:11 (its fruit for life to the
--                   elect, transplanted to the temple)
--           NT: Revelation 22:2 (the tree of life, the leaves for the healing of the nations — Eden
--               restored, the promise kept)
--   v.8     the first and the last, which was dead, and is alive (the Formed)
--           Tanakh: Isaiah 44:6 (I am the first, and I am the last; and beside me there is no Elohim)
--           Extras: none warranted   NT: Revelation 22:13 (I am Alpha and Omega... the first and the last)
--   v.9     they which say they are Yahudim (Jews), and are not — the false-claim diagnostic
--           Tanakh: none warranted (the diagnostic is internal; the prophets' charge carried in prose)
--           Extras: none warranted   NT: Romans 2:28-29 (he is not a Yahudi who is one outwardly)
--   v.13-16 Pergamos: the doctrine of Balaam, the stumblingblock, fornication and idol-meat
--           Tanakh: Numbers 25:1-3 (Yashar'el joined to Baal-peor through whoredom), Numbers 31:16
--                   (these caused Yashar'el to trespass through the counsel of Balaam)
--           Extras: none warranted   NT: none warranted (the prophetic root is the whole weight)
--   v.17    the hidden manna and the white stone with the new name
--           Tanakh: Exodus 16:4 (I will rain bread from heaven), Exodus 16:15 (this is the bread
--                   which Yahuah hath given you to eat)
--           Extras: none warranted   NT: John 6:32 (my Father giveth you the true bread from heaven),
--                   John 6:51 (I am the living bread which came down from heaven)
--   v.20-23 Thyatira: that woman Jezebel, the prophetess who seduces to fornication and idol-meat
--           Tanakh: 1 Kings 16:31 (Ahab took Jezebel and served Baal), 1 Kings 21:25 (Jezebel his
--                   wife stirred him up), 2 Kings 9:22 (the whoredoms and witchcrafts of Jezebel)
--           Extras: none warranted   NT: none warranted
--   v.18    the Son of Elohim, eyes like a flame of fire, feet like fine brass (the Formed)
--           Tanakh: Daniel 10:6 (his eyes as lamps of fire, his feet like polished brass)
--           Extras: none warranted   NT: none warranted (folded into the rod-of-iron thread's Christology prose)
--   v.26-28 power over the nations, rule with a rod of iron, the morning star
--           Tanakh: Psalm 2:8 (ask of me, I shall give thee the heathen for thine inheritance),
--                   Psalm 2:9 (thou shalt break them with a rod of iron), Numbers 24:17 (a Star out
--                   of Jacob, a Sceptre out of Yashar'el — Balaam's own forced blessing)
--           Extras: none warranted   NT: Revelation 22:16 (I am the root and offspring of David, the
--                   bright and morning star — the Giver is himself the gift)
--
-- THREADS (slug -> target libraries):
--   9025 revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2                              (Tanakh + Extras + NT)
--   9028 revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44                      (Tanakh + NT)
--   9031 revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2      (NT)  [BLESSING FLAG]
--   9034 revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25       (Tanakh)
--   9037 revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16                              (Tanakh + NT)
--   9040 revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21                    (Tanakh)
--   9043 revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2                         (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2
  ('canon', 'revelation', 2, 7, 'canon', 'genesis', 2, 9, 'free', E'*And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). The promise to him that overcometh reaches all the way back to Eden: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The tree that stood *in the midst of the garden,* barred after the fall, is the very tree set before the overcomer — not a new reward but the old inheritance restored. Paradise is Eden by its Greek name; the Shepherd is calling his own home to the garden Adam was driven from.'),
  ('canon', 'revelation', 2, 7, 'canon', 'ezekiel', 47, 12, 'free', E'*And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12). Ezekiel saw the tree of life multiplied into a riverside orchard by the waters from the sanctuary — *whose leaf shall not fade,* the fruit *for meat,* the leaf *for medicine.* This is the same restored Eden the overcomer is promised when he is given *to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The garden barred in Genesis is the garden Ezekiel measures and the garden the letter promises — one unbroken hope of the healed creation.'),
  ('canon', 'revelation', 2, 7, 'enoch', '1-enoch', 24, 4, 'extras', E'*And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* (1 Enoch 24:4). The Hebrew library carries the same tree the letter promises — the fragrant tree by the throne-mountain whose *leaves and blooms and wood wither not for ever.* It is the tree of life the overcomer is given *to eat of... which is in the midst of the paradise of Elohim (God)* (Revelation 2:7), set apart by the throne until the day of restoration, the very hope Eden held out and the apocalypse seals.'),
  ('canon', 'revelation', 2, 7, 'enoch', '1-enoch', 24, 11, 'extras', E'*To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 24:11). Here the restored library says plainly what the letter promises: the fruit of the tree of life *shall be for life to the elect,* given to the righteous and transplanted to the holy place. *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The same elect, the same tree, the same gift of life — the overcomer of Ephesus is the righteous one to whom the fruit is given when Eden is restored at the temple of the Eternal King.'),
  ('canon', 'revelation', 2, 7, 'canon', 'revelation', 22, 2, 'free', E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2). What is promised to the overcomer in the letter is shown fulfilled at the end of the book: the tree of life standing by the river in the new Jerusalem, *the leaves of the tree... for the healing of the nations.* *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The promise of chapter 2 and the vision of chapter 22 are one Eden restored — the garden barred at the beginning thrown open at the end, the curse undone, the tree freely given.'),
  -- thread: revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44
  ('canon', 'revelation', 2, 8, 'canon', 'isaiah', 44, 6, 'free', E'*Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). The one who speaks to Smyrna names himself with the divine name of Isaiah: *These things saith the first and the last, which was dead, and is alive* (Revelation 2:8). *I am the first, and I am the last* is Yahuah''s own self-naming, *beside me there is no Elohim (God)* — and the Formed who took it on his own lips is the same one *which was dead, and is alive.* The redeemer-King of Yashar''el (Israel) who is the first and the last is the slain-yet-living Messiah, comforting the persecuted assembly with the name that outlasts death itself.'),
  ('canon', 'revelation', 2, 8, 'canon', 'revelation', 22, 13, 'free', E'*I am Alpha and Omega, the beginning and the end, the first and the last.* (Revelation 22:13). The title the speaker gives Smyrna is the title the book closes on: *the first and the last* (Revelation 2:8). At the end Yahusha (Jesus) says *I am Alpha and Omega... the first and the last,* the same self-naming that opened the letter to the dying assembly. The one who *was dead, and is alive* bears from beginning to end the name of the first and the last — the Formed who holds the keys of death speaking comfort to those who *shall have tribulation ten days.*'),
  -- thread: revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2
  ('canon', 'revelation', 2, 9, 'canon', 'romans', 2, 28, 'free', E'*For he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh:* (Romans 2:28). The letter to Smyrna names a false claim, not a people: *I know the blasphemy of them which say they are Yahudim (Jews), and are not, but are the synagogue of Satan* (Revelation 2:9). Paul holds exactly this measure — *he is not a Yahudi (Jew), which is one outwardly* — the covenant name is not secured by the outward mark when the heart opposes the Messiah and slanders his keepers. The charge falls on a posture of opposition that claims the name while warring against the name''s King, never on the covenant people as such; the persecuted poor-but-rich assembly is itself largely the seed.'),
  ('canon', 'revelation', 2, 9, 'canon', 'romans', 2, 29, 'free', E'*But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God).* (Romans 2:29). Paul completes the diagnostic the letter assumes: the true Yahudi (Jew) is *one inwardly,* the circumcision *that of the heart, in the spirit.* So when the Messiah says of some that they *say they are Yahudim (Jews), and are not* (Revelation 2:9), he is not unmaking the covenant or handing it to another people — he is naming the gap between the claimed name and the heart that opposes him. The true Yashar''el (Israel) is the one being sealed and gathered later in the book; the false claim is exposed here, the true seed gathered there.'),
  -- thread: revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25
  ('canon', 'revelation', 2, 14, 'canon', 'numbers', 25, 1, 'free', E'*And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab.* (Numbers 25:1). The doctrine of Balaam is named by its first fruit: *thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). What Balaam could not do by cursing he did by counsel — drawing Yashar''el (Israel) into *whoredom with the daughters of Moab,* the joining of bed and altar that is at once bodily fornication and the spiritual harlotry of idolatry. The same stumblingblock is laid at Pergamos; the charge is the prophets'' charge, covenant-faithlessness, not a new offense.'),
  ('canon', 'revelation', 2, 14, 'canon', 'numbers', 25, 3, 'free', E'*And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel).* (Numbers 25:3). The whoredom at Shittim was never merely bodily — it was the covenant people *joined... unto Baal-peor,* bound to a foreign god through the snare of the table and the bed. This is the *stumblingblock* the doctrine of Balaam casts, *to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). The two sins are one motion: to eat the idol''s meat is to join the idol, spiritual harlotry in the costume of fellowship. The letter brings the Numbers charge forward unbroken — the same seduction, the same kindled jealousy of Yahuah (LORD) for his own.'),
  ('canon', 'revelation', 2, 14, 'canon', 'numbers', 31, 16, 'free', E'*Behold, these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor, and there was a plague among the congregation of Yahuah (LORD).* (Numbers 31:16). Here scripture names Balaam as the architect of the snare he could not speak as a curse: it was *through the counsel of Balaam* that Yashar''el (Israel) was caused *to commit trespass against Yahuah (LORD) in the matter of Peor.* This is precisely *the doctrine of Balaam, who taught Balac to cast a stumblingblock* (Revelation 2:14). The prophet who was forced to bless turned to teaching the seduction instead — and his doctrine, the counsel that draws the covenant people into idol-fornication, is the very thing the Messiah hates at Pergamos.'),
  -- thread: revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16
  ('canon', 'revelation', 2, 17, 'canon', 'exodus', 16, 4, 'free', E'*Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* (Exodus 16:4). The hidden manna promised to the overcomer reaches back to the wilderness bread: *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17). The bread Yahuah (LORD) *rained from heaven* to *prove them, whether they will walk in my law,* a pot of which was hidden away before the Testimony, is the very provision held in store for the one who keeps the works unto the end — the table of heaven set against the idol-table the doctrine of Balaam offered.'),
  ('canon', 'revelation', 2, 17, 'canon', 'exodus', 16, 15, 'free', E'*And when the children of Yashar''el (Israel) saw it, they said one to another, It is manna: for they wist not what it was. And Moses said unto them, This is the bread which Yahuah (LORD) hath given you to eat.* (Exodus 16:15). The manna was *the bread which Yahuah (LORD) hath given you to eat* — heaven''s own food in the wilderness, a portion of it laid up before the Testimony to be kept for the generations. *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17): the bread that fed the fathers, hidden and reserved, becomes the overcomer''s reward, set over against the things sacrificed unto idols that Pergamos was tempted to eat.'),
  ('canon', 'revelation', 2, 17, 'canon', 'john', 6, 32, 'free', E'*Then Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* (John 6:32). The Messiah himself reads the manna forward to its truth: *my Father giveth you the true bread from heaven* (John 6:32). So the hidden manna promised the overcomer — *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17) — is no mere relic of the wilderness but the true bread the Father gives, the manna kept in store now opened to the one who overcomes; the wilderness loaf and the living bread are one provision.'),
  ('canon', 'revelation', 2, 17, 'canon', 'john', 6, 51, 'free', E'*I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* (John 6:51). The hidden manna of the letter finds its name in the Messiah''s own mouth: *I am the living bread which came down from heaven... if any man eat of this bread, he shall live for ever* (John 6:51). The bread laid up before the Testimony pointed forward to him; *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17) is the promise of the living bread himself, the food that does not perish, the table of life set against the table of idols at Pergamos.'),
  -- thread: revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21
  ('canon', 'revelation', 2, 20, 'canon', '1-kings', 16, 31, 'free', E'*And it came to pass, as if it had been a light thing for him to walk in the sins of Jeroboam the son of Nebat, that he took to wife Jezebel the daughter of Ethbaal king of the Zidonians, and went and served Baal, and worshipped him.* (1 Kings 16:31). The name the Messiah lays on Thyatira is the name of Ahab''s queen, who brought Baal into the house of Yashar''el (Israel): Ahab *took to wife Jezebel the daughter of Ethbaal... and went and served Baal.* So *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20) wears the historic Jezebel''s very office — the seductress who turns the covenant people to the idol''s bed and the idol''s table. The charge is the prophets'' charge against Baal-worship, brought forward into the assembly.'),
  ('canon', 'revelation', 2, 20, 'canon', '1-kings', 21, 25, 'free', E'*But there was none like unto Ahab, which did sell himself to work wickedness in the sight of Yahuah (LORD), whom Jezebel his wife stirred up.* (1 Kings 21:25). Scripture marks Jezebel as the one *whom* Ahab was *stirred up* by — the active seducer behind the throne''s wickedness, the prophets of Baal at her table, Naboth murdered by her letters. The Messiah names Thyatira''s teacher *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants* (Revelation 2:20): the same office of seduction, a self-claimed prophetess turning servants to fornication and idol-meat. The first Jezebel stirred a king to Baal; this one would stir the assembly — the same spiritual harlotry the prophets withstood.'),
  ('canon', 'revelation', 2, 20, 'canon', '2-kings', 9, 22, 'free', E'*And it came to pass, when Joram saw Jehu, that he said, Is it peace, Jehu? And he answered, What peace, so long as the whoredoms of thy mother Jezebel and her witchcrafts are so many?* (2 Kings 9:22). Jehu names what Jezebel was — *the whoredoms... and her witchcrafts* — the spiritual harlotry and sorcery that defiled the house of Yashar''el (Israel) and brought the prophets'' judgment down. The same is set before Thyatira in *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20). To name the seducer *Jezebel* is to name the whole pattern — idolatry as harlotry against Yahuah (LORD) — and to warn that, as of old, *I gave her space to repent of her fornication; and she repented not* (Revelation 2:21).'),
  -- thread: revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2
  ('canon', 'revelation', 2, 26, 'canon', 'psalms', 2, 8, 'free', E'*Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession.* (Psalm 2:8). The promise to the overcomer is the inheritance the Father swore to his Anointed: *And he that overcometh, and keepeth my works unto the end, to him will I give power over the nations* (Revelation 2:26). What Yahuah (LORD) said to his Son — *Ask of me, and I shall give thee the heathen for thine inheritance* — the Son shares with the one who keeps his works to the end. The overcomer is brought into the very dominion of Psalm 2, ruling with the King who received the nations from his Father.'),
  ('canon', 'revelation', 2, 27, 'canon', 'psalms', 2, 9, 'free', E'*Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* (Psalm 2:9). The letter quotes the Psalm almost word for word: *And he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:27). The *rod of iron* and the *potter''s vessel* are Psalm 2''s, the authority Yahuah (LORD) gave his Anointed over the raging nations — and the Messiah says he received it *of my Father* and gives it to the overcomer. The Formed who holds the rod has a Father from whom he received it; the dominion is shared down to those who keep his works.'),
  ('canon', 'revelation', 2, 28, 'canon', 'numbers', 24, 17, 'free', E'*I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* (Numbers 24:17). The morning star given to the overcomer — *And I will give him the morning star* (Revelation 2:28) — was foretold by Balaam himself, the very prophet whose doctrine seduces at Pergamos: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel).* The seer of the idol-counsel was forced to behold the rising Star and Sceptre of the true King. The overcomer who refuses Balaam''s stumblingblock is given the Star that Balaam could only see afar — the King out of Jacob, who is himself the gift.'),
  ('canon', 'revelation', 2, 28, 'canon', 'revelation', 22, 16, 'free', E'*I Yahusha (Jesus) have sent mine angel to testify unto you these things in the churches. I am the root and the offspring of David, and the bright and morning star.* (Revelation 22:16). The morning star promised the overcomer is the Messiah himself: *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). So *And I will give him the morning star* (Revelation 2:28) is the gift of the Giver — the overcomer is given Yahusha (Jesus), the Star out of Jacob, the root and offspring of David. The Sceptre Balaam foresaw and the rod of Psalm 2 and the morning star are one King, given to those who keep his works unto the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2',
       E'The tree of life in the midst of the paradise of Elohim (God) — Eden restored (Genesis 2)',
       E'The first letter ends with the oldest promise of all: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). Paradise is Eden by its Greek name, and the tree is the very tree of Genesis: *the tree of life also in the midst of the garden* (Genesis 2:9). The tree barred to Adam after the fall is set before the overcomer — not a new reward but the old inheritance opened again. Ezekiel saw it multiplied into a riverside orchard by the waters from the sanctuary: *all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12). The restored library carries the same tree — the fragrant tree by the throne-mountain whose *leaves and blooms and wood wither not for ever* (1 Enoch 24:4), whose fruit *shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King* (1 Enoch 24:11). And the book itself shows the promise kept at the end: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). Genesis bars the tree; Ezekiel and the seer of Enoch behold it reserved; the letter promises it; the new Jerusalem throws it open. It is one unbroken hope — Eden brought to its consummation, the curse undone, the tree freely given to the one who keeps the works unto the end.',
       sv.verse_id, ev.verse_id, 'extras', 9025
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44',
       E'The first and the last, which was dead, and is alive — the Formed who bears the divine name (Isaiah 44)',
       E'To the persecuted assembly at Smyrna the speaker names himself with the divine name of Isaiah: *These things saith the first and the last, which was dead, and is alive* (Revelation 2:8). *I am the first, and I am the last* is Yahuah''s own self-designation — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). The redeemer-King of Yashar''el (Israel) who bears that name is here the one *which was dead, and is alive* — the Formed who took the divine name on his own lips and yet died and rose, the slain-yet-living Messiah who holds the keys of death. He bears the name from beginning to end of the book: *I am Alpha and Omega, the beginning and the end, the first and the last* (Revelation 22:13). To Smyrna, told *ye shall have tribulation ten days,* the comfort is the name that outlasts death itself: the One who was dead and is alive is the first and the last, beside whom there is no other.',
       sv.verse_id, ev.verse_id, 'free', 9028
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2',
       E'They which say they are Yahudim (Jews), and are not — the false-claim diagnostic, not a charter for replacement (Romans 2)',
       E'This verse has been turned into a weapon against the covenant people, and the turning misreads what it says. *I know the blasphemy of them which say they are Yahudim (Jews), and are not, but are the synagogue of Satan* (Revelation 2:9). Read it as the Messiah speaks it: a false-claim diagnostic, not a charter for anti-Jewish replacement. The charge is on *the blasphemy* — the slander against the persecuted assembly — and on a claim to the covenant name held by those whose hearts oppose the name''s King. Paul holds exactly this measure: *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28); *but he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God)* (Romans 2:29). The outward mark does not secure the name when the heart wars against the Messiah and his keepers. So *say they are Yahudim (Jews), and are not* is not the unmaking of the covenant, and it is not the handing of Yashar''el''s (Israel''s) name to some other people — it is the naming of the gap between a claimed name and a heart in opposition. The true Yashar''el (Israel) is not erased here; it is the very seed being sealed and gathered later in the book — the twelve tribes named one by one, the great multitude gathered home. The false claim is exposed in this letter; the true seed is gathered in the chapters to come. To read the verse as a license for replacement is to make it deny the very gathering the book is moving toward.',
       sv.verse_id, ev.verse_id, 'free', 9031
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25',
       E'The doctrine of Balaam — the stumblingblock of idol-meat and spiritual harlotry (Numbers 25)',
       E'The charge against Pergamos is named from the Torah: *thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). What Balaam could not accomplish by cursing he accomplished by counsel — *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1), until *Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* (Numbers 25:3). The whoredom and the idol-joining are one motion: to eat at the idol''s table and to lie in the idol''s bed is to be bound to the idol — bodily fornication and spiritual harlotry together. And scripture marks Balaam as the architect of the snare: *these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* (Numbers 31:16). The prophet forced to bless turned to teaching the seduction. This is *the doctrine of Balaam* — and it is the prophets'' own charge of covenant-faithlessness, not a new offense: the covenant people drawn from their faithfulness by the lure of the idol-feast. The Messiah hates at Pergamos exactly what kindled Yahuah''s (LORD''s) jealousy at Shittim, and calls *Repent; or else I will come unto thee quickly, and will fight against them with the sword of my mouth* (Revelation 2:16).',
       sv.verse_id, ev.verse_id, 'free', 9034
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16',
       E'The hidden manna — the bread from heaven kept in store, fulfilled in the living bread (Exodus 16)',
       E'Against the idol-meat the doctrine of Balaam offered, the overcomer is promised the true food: *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17). The manna is the wilderness bread of Exodus: *Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no* (Exodus 16:4) — *This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15). A pot of that manna was *laid up before the Testimony, to be kept,* hidden in the holy place; that hidden manna is held in store for the one who keeps the works unto the end. And the Messiah himself reads the manna forward to its truth: *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32); *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). So the hidden manna is no mere relic of the wilderness — it is the living bread himself, the food that does not perish, the table of life set against the table of idols at Pergamos. The overcomer who refuses the idol-feast is given the bread of heaven, and *a white stone, and in the stone a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17).',
       sv.verse_id, ev.verse_id, 'free', 9037
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21',
       E'That woman Jezebel, which calleth herself a prophetess — the seductress to idolatry named again (1 Kings 21)',
       E'The teacher the Messiah charges at Thyatira wears a historic name: *Notwithstanding I have a few things against thee, because thou sufferest that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20). The first Jezebel brought Baal into the house of Yashar''el (Israel): Ahab *took to wife Jezebel the daughter of Ethbaal king of the Zidonians, and went and served Baal, and worshipped him* (1 Kings 16:31). She was the active seducer behind the throne''s wickedness — *there was none like unto Ahab, which did sell himself to work wickedness in the sight of Yahuah (LORD), whom Jezebel his wife stirred up* (1 Kings 21:25) — her prophets of Baal at her table, Naboth murdered by her letters. And Jehu named what she was: *What peace, so long as the whoredoms of thy mother Jezebel and her witchcrafts are so many?* (2 Kings 9:22). To call Thyatira''s teacher *Jezebel* is to name the whole pattern — idolatry as harlotry against Yahuah (LORD), seduction of the covenant people to the idol''s bed and the idol''s table, the very thing the prophets withstood with fire and sword. The same charge the prophets brought to Samaria is brought to the assembly, and the same patience precedes the same judgment: *I gave her space to repent of her fornication; and she repented not* (Revelation 2:21).',
       sv.verse_id, ev.verse_id, 'free', 9040
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2',
       E'Rule them with a rod of iron, and the morning star — the overcomer brought into the Anointed''s dominion (Psalm 2)',
       E'The reward to the overcomer at Thyatira is the inheritance of the Anointed himself: *And he that overcometh, and keepeth my works unto the end, to him will I give power over the nations: and he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:26-27). The words are Psalm 2''s, where Yahuah (LORD) speaks to his Son: *Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* (Psalm 2:8); *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9). The Messiah says he received this dominion *of my Father* — the Formed who holds the rod has a Father from whom he received it — and he shares it with the one who keeps his works to the end. Then: *And I will give him the morning star* (Revelation 2:28). That star was foretold by Balaam himself, the very prophet whose doctrine seduces at Pergamos: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* (Numbers 24:17). The seer of the idol-counsel was forced to behold the rising Star and Sceptre of the true King. And the Star is the Messiah himself: *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). So the rod of Psalm 2, the Sceptre Balaam foresaw, and the morning star are one King — and the overcomer who refuses the idol-stumblingblock is given the King himself, the Giver who is the gift.',
       sv.verse_id, ev.verse_id, 'free', 9043
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *the tree of life also in the midst of the garden* the tree barred to Adam after the fall, set before the overcomer; paradise is Eden restored (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 47:12 — *whose leaf shall not fade... the fruit thereof for meat, and the leaf thereof for medicine* the tree of life multiplied by the sanctuary waters, the restored Eden the overcomer is promised (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 24:4 — *its leaves and blooms and wood wither not for ever* the fragrant tree by the throne-mountain, the same tree of life reserved for the day of restoration (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 24:11 — *its fruit shall be for life to the elect; it shall be transplanted to the holy place* the restored library says plainly the tree''s fruit is given to the elect, as the letter promises the overcomer (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 22:2 — *the tree of life... and the leaves of the tree were for the healing of the nations* the promise of ch 2 shown fulfilled in the new Jerusalem; Eden thrown open at the end (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:6 — *I am the first, and I am the last; and beside me there is no Elohim (God)* Yahuah''s own self-naming, taken on the lips of the one *which was dead, and is alive*; the Formed bearing the divine name (Revelation 2:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:13 — *I am Alpha and Omega... the first and the last* the same self-naming closing the book, the title that opened the letter to Smyrna (Revelation 2:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 2:28 — *he is not a Yahudi (Jew), which is one outwardly* Paul''s same measure: the covenant name is not secured by the outward mark when the heart opposes the Messiah (Revelation 2:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:29 — *he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart* the true Yahudi is inward; the false claim is the gap between name and heart, not the unmaking of the covenant (Revelation 2:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:1 — *the people began to commit whoredom with the daughters of Moab* the first fruit of Balaam''s counsel, the joining of bed and altar the stumblingblock casts (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:3 — *Yashar''el (Israel) joined himself unto Baal-peor* the whoredom was spiritual harlotry, the covenant people bound to a foreign god; idol-meat and fornication are one motion (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 31:16 — *through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* scripture names Balaam the architect of the snare he could not speak as a curse; this is *the doctrine of Balaam* (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *I will rain bread from heaven for you... that I may prove them, whether they will walk in my law* the wilderness manna, a pot of it hidden before the Testimony, held in store for the overcomer (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 16:15 — *This is the bread which Yahuah (LORD) hath given you to eat* heaven''s own food in the wilderness, set over against the idol-meat Pergamos was tempted to eat (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:32 — *my Father giveth you the true bread from heaven* the Messiah reads the manna forward to its truth; the hidden manna is the true bread the Father gives (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:51 — *I am the living bread which came down from heaven... he shall live for ever* the hidden manna named in the Messiah''s own mouth, the food that does not perish (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 16:31 — *he took to wife Jezebel... and went and served Baal* the first Jezebel who brought Baal into the house of Yashar''el (Israel); Thyatira''s teacher wears her office (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=16 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 21:25 — *whom Jezebel his wife stirred up* the active seducer behind the throne''s wickedness; the same office of seduction set before the assembly (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 9:22 — *the whoredoms of thy mother Jezebel and her witchcrafts are so many* Jehu names the pattern: idolatry as harlotry against Yahuah (LORD), the prophets'' charge brought to the assembly (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:8 — *Ask of me, and I shall give thee the heathen for thine inheritance* the inheritance the Father swore to his Anointed, shared with the overcomer who keeps his works (Revelation 2:26).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:9 — *Thou shalt break them with a rod of iron... like a potter''s vessel* the letter quotes the Psalm nearly word for word; the Messiah received it *of my Father* and shares it (Revelation 2:27).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* the morning star foretold by Balaam himself, whose doctrine seduces at Pergamos; the overcomer is given the Star he saw afar (Revelation 2:28).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:16 — *I am the root and the offspring of David, and the bright and morning star* the morning star is the Messiah himself; the Giver is the gift (Revelation 2:28).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_03.sql (S224 Revelation 3) -----
-- =====================================================================
-- S224 minion — REVELATION 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 3 (22 verses) — the letters to Sardis, Philadelphia, Laodicea.
-- Tag: rv03 (temp view _s224_rv03_lookup).
-- Sort band: floor 9050, step 3 (9050, 9053, 9056, 9059, 9062, 9065, 9068 used; under 9075).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation is the consummation of the covenant story — the same Yahuah, the same
-- Torah, the same Yashar'el (Israel) brought to restoration. The overcomer of the seven letters is
-- the one who keeps the word and is not blotted out of the book of life; the destination is the new
-- Jerusalem coming DOWN (3:12), the city of the restored tribes (ch 21). The 3:9 *synagogue of Satan,
-- which say they are Yahudim (Jews), and are not* is read exactly as 2:9 is: a FALSE-CLAIM diagnostic
-- (those claiming the covenant name while opposing the Messiah and his commandment-keepers), NEVER a
-- charter for anti-Jewish replacement. The true Yashar'el is the one being gathered and sealed.
-- Christology: Yahusha is the Formed drawn from the Formless — *the Amen, the faithful and true
-- witness, the beginning of the creation of Elohim* (3:14), who has a Father and is *set down with my
-- Father in his throne* (3:21): Father and Formed Son distinguished, never collapsed, never co-equal-
-- persons. Names preserved exactly as the pull gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   Sardis: a name that thou livest and art dead; the book of life, names not blotted out
--           Tanakh: Exodus 32:32-33 (blot me out of thy book / whosoever sinned will I blot out),
--                   Daniel 12:1 (every one found written in the book delivered), Psalm 69:28 (let them
--                   be blotted out of the book of the living)
--           Extras: 1 Enoch 104:1 (the books of life, names written before the Most High), 1 Enoch
--                   108:3 (their names blotted out of the book of life)
--           NT: Matthew 10:32 (confess me before men, I will confess before my Father), Luke 12:8
--               (the Son of Adam confess before the angels of Elohim)
--   v.7-8   Philadelphia: the key of David, he that openeth and no man shutteth
--           Tanakh: Isaiah 22:22 (the key of the house of David, he shall open and none shut)
--           Extras: none warranted   NT: none warranted (carried in the throne thread at v.21)
--   v.9-11  the synagogue of Satan, which say they are Jews and are not — the FALSE-CLAIM diagnostic
--           Tanakh: Isaiah 65:15-16 (leave your name a curse, his servants called by another name,
--                   the Elohim of truth)
--           Extras: none warranted   NT: Romans 9:25-26 (I will call them my people which were not my
--                   people — the true reckoning is by the calling, not the bare claim)
--   v.12    the pillar in the temple, the name of the new Jerusalem written on the overcomer
--           Tanakh: Ezekiel 48:35 (the name of the city, Yahuah Shammah), Isaiah 62:2 (called by a new
--                   name which the mouth of Yahuah shall name)
--           Extras: Tobit 13:16 (Jerusalem built with sapphires and emeralds and gold)
--           NT: Revelation 21:2 (the new Jerusalem coming down from Elohim out of heaven)
--   v.13    He that hath an ear — refrain; none warranted
--   v.14    Laodicea: the Amen, the faithful and true witness, the beginning of the creation of Elohim
--           Tanakh: Isaiah 65:16 (the Elohim of truth — Hebrew Elohei Amen), Isaiah 44:6 (the first
--                   and the last), Proverbs 8:22 (Yahuah possessed me in the beginning of his way)
--           Extras: none warranted   NT: Colossians 1:15 (firstborn of every creature), 1:18 (the
--                   beginning, the firstborn from the dead)
--   v.15-18 lukewarm; buy of me gold tried in the fire and white raiment and eyesalve
--           Tanakh: Isaiah 55:1 (buy wine and milk without money and without price)
--           Extras: none warranted   NT: none warranted
--   v.19-20 I stand at the door and knock; whom I love I rebuke and chasten
--           Tanakh: Proverbs 8:34 (blessed is the man that heareth me, watching at my gates)
--           Extras: none warranted   NT: none warranted (woven into the door thread)
--   v.21-22 sit with me in my throne, even as I overcame and am set down with my Father in his throne
--           Tanakh: Daniel 7:9 (the Ancient of days did sit), Daniel 7:14 (dominion given him)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9050 revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12   (Tanakh + Extras + NT)
--   9053 revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22  (Tanakh)
--   9056 revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65  (Tanakh + NT)
--   9059 revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48  (Tanakh + Extras + NT)
--   9062 revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8  (Tanakh + NT)
--   9065 revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55  (Tanakh)
--   9068 revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12
  ('canon', 'revelation', 3, 5, 'canon', 'exodus', 32, 32, 'free', E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* (Exodus 32:32). Here is the book itself, named at the foot of Sinai: Moses pleads to be blotted out of *thy book which thou hast written* rather than see Yashar''el (Israel) lost. To Sardis the same book is the promise: *I will not blot out his name out of the book of life* (Revelation 3:5). The book the overcomer is kept written in is no new thing — it is the book Yahuah (LORD) has kept from the beginning, and to remain in it is to be kept among the living people of the covenant.'),
  ('canon', 'revelation', 3, 5, 'canon', 'exodus', 32, 33, 'free', E'*And Yahuah (LORD) said unto Moses, Whosoever hath sinned against me, him will I blot out of my book.* (Exodus 32:33). The blotting is real and it answers sin — *him will I blot out of my book.* So the word to Sardis is a warning held inside a promise: the assembly has *a name that thou livest, and art dead* (Revelation 3:1), and only the overcomer is told *I will not blot out his name out of the book of life* (Revelation 3:5). The name written can be struck; the call is to *be watchful, and strengthen the things which remain* (Revelation 3:2), to keep the place in the book that sin would forfeit.'),
  ('canon', 'revelation', 3, 5, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel sees the deliverance run by the book — *every one that shall be found written in the book* is delivered through the time of trouble. This is the book Sardis is summoned to stay written in: *I will not blot out his name out of the book of life* (Revelation 3:5). To be kept in the book is to be among *thy people* delivered at the end; the overcomer of Sardis stands with the children of the covenant whom Michael guards.'),
  ('canon', 'revelation', 3, 5, 'canon', 'psalms', 69, 28, 'free', E'*Let them be blotted out of the book of the living, and not be written with the righteous.* (Psalm 69:28). The psalmist prays the blotting upon the persecutors of the righteous sufferer — *blotted out of the book of the living, and not be written with the righteous.* The promise to Sardis is the mirror of that judgment: the overcomer *shall be clothed in white raiment; and I will not blot out his name out of the book of life* (Revelation 3:5). The two books are one book; to be *written with the righteous* is to keep the white garments undefiled, while the name that defiles its garments is the name in danger of the blotting.'),
  ('canon', 'revelation', 3, 5, 'enoch', '1-enoch', 104, 1, 'extras', E'*And now I swear unto you, ye righteous, By the greatness of His splendour and His glory, By His greatness I swear unto you. That I have seen, and the light has shone upon me, And I have seen the holy ones of heaven, And I have beheld the books of life.* (1 Enoch 104:1-2). Enoch is shown the same books, and the same writing of the righteous in them: *your names are written in the books of life before the Most High* (1 Enoch 104:3). To Sardis the slain-yet-living one speaks of that very register: *I will not blot out his name out of the book of life* (Revelation 3:5). The restored library keeps the picture whole — the books of life are open before the Most High, and the names of the righteous stand written there.'),
  ('canon', 'revelation', 3, 5, 'enoch', '1-enoch', 108, 3, 'extras', E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever* (1 Enoch 108:3). Enoch names the blotting that falls on the sinners — *their names shall be blotted out of the book of life.* That is the very sentence the overcomer of Sardis is promised exemption from: *I will not blot out his name out of the book of life* (Revelation 3:5). The same book, the same blotting, the same patience-unto-the-end — the Hebrew library and the Apocalypse speak one judgment, and the white-robed who endure are kept written.'),
  ('canon', 'revelation', 3, 5, 'canon', 'matthew', 10, 32, 'free', E'*Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* (Matthew 10:32). The promise to Sardis closes with this very confessing — *I will confess his name before my Father, and before his angels* (Revelation 3:5). The word the Messiah spoke in the gospel he now speaks from the throne to the overcomer: the one who held his name before men is owned by name before the Father. And mark the Christology the verse carries plainly: he confesses *before my Father* — the Formed Son before the Formless, the two distinguished, never collapsed.'),
  ('canon', 'revelation', 3, 5, 'canon', 'luke', 12, 8, 'free', E'*Also I say unto you, Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God)* (Luke 12:8). Luke records the same word, and names the confessor *the Son of Adam* — the seed of Adam who owns his own before the angels. To Sardis he keeps it: *I will confess his name before my Father, and before his angels* (Revelation 3:5). The confessing *before the angels of Elohim (God)* and *before his angels* are one promise; the overcomer who confessed the name on earth is confessed by the Son of Adam in heaven.'),
  -- thread: revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22
  ('canon', 'revelation', 3, 7, 'canon', 'isaiah', 22, 22, 'free', E'*And the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut; and he shall shut, and none shall open.* (Isaiah 22:22). The risen one announces himself to Philadelphia in Isaiah''s very words: *he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth* (Revelation 3:7). In Isaiah the key passes from faithless Shebna to faithful Eliakim, who is *a father to the inhabitants of Jerusalem* (Isaiah 22:21) — the steward who holds the sole authority over the house of David. That whole stewardship is gathered into the hand of the Messiah; the key of David is his, and the door he opens — *behold, I have set before thee an open door, and no man can shut it* (Revelation 3:8) — no man can close.'),
  -- thread: revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65
  ('canon', 'revelation', 3, 9, 'canon', 'isaiah', 65, 15, 'free', E'*And ye shall leave your name for a curse unto my chosen: for Adonai Yahuah (the Lord GOD) shall slay thee, and call his servants by another name* (Isaiah 65:15). Isaiah sets the line not between Yahudi (Jew) and non-Yahudi but between those who forsake Yahuah (LORD) and the servants he keeps: the rebels leave their name a curse, while *his servants* he calls by a name of his own giving. That is the very line drawn at Philadelphia: *them of the synagogue of Satan, which say they are Yahudim (Jews), and are not, but do lie* (Revelation 3:9). The claim is not the proof; the name is owned only where the covenant is kept. Those who *say they are Yahudim (Jews), and are not* claim the covenant name while opposing the Messiah and his keepers — and to the faithful he gives, as in Isaiah, a new name (Revelation 3:12). This is a diagnostic of false claim, never a charter against the people of Yahudah (Judah), whom the prophets gather home.'),
  ('canon', 'revelation', 3, 9, 'canon', 'isaiah', 65, 16, 'free', E'*That he who blesseth himself in the earth shall bless himself in the Elohim (God) of truth; and he that sweareth in the earth shall swear by the Elohim (God) of truth; because the former troubles are forgotten, and because they are hid from mine eyes.* (Isaiah 65:16). Twice Isaiah names him *the Elohim (God) of truth* — and the one who speaks to Philadelphia is *he that is holy, he that is true* (Revelation 3:7), the Amen who cannot lie. So the charge against the false claimants is precisely that they *do lie* (Revelation 3:9): they stand over against the Elohim (God) of truth. The reckoning is by truth, not by the bare word of the mouth; the true and holy one knows his own, and *I have loved thee* (Revelation 3:9) is spoken to the keepers, not the claimers.'),
  ('canon', 'revelation', 3, 9, 'canon', 'romans', 9, 25, 'free', E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.* (Romans 9:25). Paul names the reckoning that decides the matter: the people of Yahuah (LORD) are *called* — *I will call them my people, which were not my people* — and the beloved are made beloved by his love, *which was not beloved.* So the synagogue of Satan are exposed not by ancestry but by their lie against the calling — they *say they are Yahudim (Jews), and are not* (Revelation 3:9) — while to the faithful of Philadelphia the loving word is sealed: *I will make them to come and worship before thy feet, and to know that I have loved thee* (Revelation 3:9). The beloved are those Yahuah (LORD) calls and loves, the scattered owned again as his people — not a people self-named by a claim the Messiah denies.'),
  -- thread: revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48
  ('canon', 'revelation', 3, 12, 'canon', 'ezekiel', 48, 35, 'free', E'*It was round about eighteen thousand measures: and the name of the city from that day shall be, Yahuah Shammah (The LORD is there).* (Ezekiel 48:35). Ezekiel ends his measured city with its name — *Yahuah Shammah (The LORD is there)* — the city of the twelve tribes whose twelve gates he has just named one by one. To the overcomer of Philadelphia the promise gathers that name onto the man himself: *I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem* (Revelation 3:12). The city whose name is Yahuah-is-there is the new Jerusalem, and to bear its name is to belong forever to the restored city of the tribes — *he shall go no more out.*'),
  ('canon', 'revelation', 3, 12, 'canon', 'isaiah', 62, 2, 'free', E'*And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name.* (Isaiah 62:2). Isaiah promises Jerusalem a new name spoken by the mouth of Yahuah (LORD) — the forsaken city renamed and married (Isaiah 62:4). The same new-naming falls on the overcomer: *I will write upon him my new name* (Revelation 3:12). The new name is no erasure of the city but its restoration — the people who were called Forsaken given a name out of the mouth of Yahuah (LORD), and the faithful written into that renamed city as pillars that go no more out.'),
  ('canon', 'revelation', 3, 12, 'apocrypha', 'tobit', 13, 16, 'extras', E'*For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold.* (Tobit 13:16). Tobit sings the new Jerusalem before John sees it — the city rebuilt of sapphire and emerald and gold, the gathered city of *the children of the just* (Tobit 13:13). That is the city whose name the overcomer is promised to bear: *the name of the city of my Elohim (God), which is new Jerusalem, which cometh down out of heaven from my Elohim (God)* (Revelation 3:12). The Hebrew library already held the hope of the jewelled city built up for the gathered people; Revelation shows it coming down, and writes its name on the faithful.'),
  ('canon', 'revelation', 3, 12, 'canon', 'revelation', 21, 2, 'free', E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:2). The name promised to the overcomer in the letter is the city John will see descend at the end: *new Jerusalem, coming down from Elohim (God) out of heaven.* What is written on the man at Philadelphia — *new Jerusalem, which cometh down out of heaven from my Elohim (God)* (Revelation 3:12) — is shown in full when the city itself comes down to the restored earth. The letter and the vision are one hope: not a flight away to heaven, but the holy city coming DOWN, and the faithful belonging to it as pillars that go no more out.'),
  -- thread: revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8
  ('canon', 'revelation', 3, 14, 'canon', 'isaiah', 65, 16, 'free', E'*That he who blesseth himself in the earth shall bless himself in the Elohim (God) of truth; and he that sweareth in the earth shall swear by the Elohim (God) of truth; because the former troubles are forgotten, and because they are hid from mine eyes.* (Isaiah 65:16). The title the Messiah takes to Laodicea — *the Amen, the faithful and true witness* (Revelation 3:14) — is Isaiah''s *Elohim (God) of truth*, the Elohei-Amen by whom the faithful bless and swear. He is the Amen because he is the truth that does not fail; the lukewarm assembly that thinks itself *rich, and increased with goods* (Revelation 3:17) is measured against the one who is himself the faithful and true witness, the Amen of Yahuah (LORD) standing where the false claims fall away.'),
  ('canon', 'revelation', 3, 14, 'canon', 'isaiah', 44, 6, 'free', E'*Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). Isaiah''s King of Yashar''el (Israel) declares *I am the first, and I am the last* — the same one who names himself to Laodicea *the beginning of the creation of Elohim (God)* (Revelation 3:14). This is the Formed drawn from the Formless: the first-and-the-last of Isaiah is the one who speaks from the throne, Yahuah''s own self-naming carried by the Messiah, who *am set down with my Father in his throne* (Revelation 3:21). He is the beginning — not a creature among creatures, but the One in whom and by whom the creation begins.'),
  ('canon', 'revelation', 3, 14, 'canon', 'proverbs', 8, 22, 'free', E'*Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* (Proverbs 8:22). Wisdom speaks of standing with Yahuah (LORD) *in the beginning of his way, before his works of old* — *brought up with him* and *daily his delight* as the world was framed (Proverbs 8:30). The Messiah names himself to Laodicea in that very register: *the beginning of the creation of Elohim (God)* (Revelation 3:14). The beginning of the creation is the Formed who was with the Father before the works of old, by whom the heavens were prepared — the Wisdom of Proverbs given a face and a voice, speaking now to the assembly that knows not its own poverty.'),
  ('canon', 'revelation', 3, 14, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). Paul names the same one Laodicea hears: *the image of the invisible Elohim (God)* — the visible Formed of the invisible Formless — *the firstborn of every creature*, by whom *were all things created* (Colossians 1:16). That is precisely *the beginning of the creation of Elohim (God)* (Revelation 3:14): not the first thing made, but the firstborn over and the maker of all things, the image in whom the invisible Father is seen. The Amen who speaks to Laodicea is the one through whom and for whom the whole creation came to be.'),
  ('canon', 'revelation', 3, 14, 'canon', 'colossians', 1, 18, 'free', E'*And he is the head of the body, the church: who is the beginning, the firstborn from the dead; that in all things he might have the preeminence.* (Colossians 1:18). Paul calls him *the beginning, the firstborn from the dead* — the same word the Messiah takes at Laodicea: *the beginning of the creation of Elohim (God)* (Revelation 3:14). He is the beginning of the first creation and the beginning of the new — *the firstborn from the dead*, the first to rise into the life of the age to come. The faithful and true witness who counsels Laodicea to buy *white raiment* (Revelation 3:18) is the one in whom the new creation has already begun, having the preeminence in all things.'),
  -- thread: revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55
  ('canon', 'revelation', 3, 18, 'canon', 'isaiah', 55, 1, 'free', E'*Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* (Isaiah 55:1). Isaiah''s gospel-cry is the buying that costs nothing — *buy, and eat... without money and without price* — to the thirsty who have nothing. The Messiah turns it on Laodicea, who thinks she has everything: *I counsel thee to buy of me gold tried in the fire, that thou mayest be rich; and white raiment* (Revelation 3:18). The one who says *I am rich... and have need of nothing* (Revelation 3:17) is the truly poor; the riches worth having are bought of him, on Isaiah''s terms — come to the one who gives without price what gold cannot buy.'),
  ('canon', 'revelation', 3, 20, 'canon', 'proverbs', 8, 34, 'free', E'*Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors.* (Proverbs 8:34). Wisdom blesses the one who watches at her doors and waits at her posts — the hearer who keeps the threshold. At Laodicea the figure is turned: now it is the Messiah himself who waits at the door — *Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him* (Revelation 3:20). The blessing of Proverbs falls on the one who *heareth me*; the same hearing opens the door — *if any man hear my voice* — and the one who waited at wisdom''s posts now finds Wisdom himself knocking, ready to come in and sup.'),
  -- thread: revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7
  ('canon', 'revelation', 3, 21, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). Daniel sees the thrones set and *the Ancient of days* take his seat — the Father in the vision-form of the throne-court. To that throne the overcomer of Laodicea is called up: *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The Messiah is set down *with my Father* — the Formed Son distinguished from the Ancient of days who sits, never collapsed into him — and the faithful are granted to sit with the Son, drawn into the throne-court Daniel beheld.'),
  ('canon', 'revelation', 3, 21, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the one like the Son of Adam in Daniel''s vision is *given... dominion, and glory, and a kingdom* — the everlasting reign received from the Ancient of days. That granting is what the Messiah shares with his own at Laodicea: *To him that overcometh will I grant to sit with me in my throne* (Revelation 3:21). As the kingdom was given to him, so he grants the overcomers a seat in it; the everlasting dominion that *shall not pass away* is the throne the faithful are called to share with the one who overcame.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12',
       E'Sardis: a name that thou livest and art dead — the book of life, names not blotted out (Exodus 32, Daniel 12)',
       E'To Sardis, the assembly with *a name that thou livest, and art dead* (Revelation 3:1), the slain-yet-living one speaks of the book that decides the living from the dead. The overcomer *shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels* (Revelation 3:5). The book is not new. It is the book Moses pleaded over at the foot of Sinai — *blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32) — and the book whose blotting answers sin — *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). It is the book Daniel saw run the deliverance: *at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). It is the book the psalmist named in his cry against the persecutors — *Let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28). And the restored library keeps the same picture whole: Enoch is shown *the books of life*, and *your names are written in the books of life before the Most High* (1 Enoch 104:1-3), while the sinners'' *names shall be blotted out of the book of life* (1 Enoch 108:3). So the warning to Sardis is a warning held inside a promise: the name written can be struck, therefore *be watchful, and strengthen the things which remain, that are ready to die* (Revelation 3:2) — keep the place in the book that defiling the garments would forfeit. And the promise closes with the confessing the Messiah spoke in the gospel: *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven* (Matthew 10:32); *Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God)* (Luke 12:8). The overcomer who held the name on earth is owned by name before the Father and his angels — the Formed Son confessing his own before the Formless.',
       sv.verse_id, ev.verse_id, 'extras', 9050
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22',
       E'Philadelphia: the key of David, he that openeth and no man shutteth (Isaiah 22)',
       E'The risen one announces himself to Philadelphia in the words of Isaiah: *These things saith he that is holy, he that is true, he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth* (Revelation 3:7). The key of David is Isaiah''s own image: *And the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut; and he shall shut, and none shall open* (Isaiah 22:22). In Isaiah the stewardship of the house of David passes from faithless Shebna to faithful Eliakim, who is made *a father to the inhabitants of Jerusalem, and to the house of Yahudah (Judah)* (Isaiah 22:21) — the steward who holds sole authority over the royal house, opening and shutting at his word alone. That whole stewardship is gathered into the hand of the Messiah, the true son of David: the key is his, and the door he opens no man can close. So to the assembly of little strength that *hast kept my word, and hast not denied my name* (Revelation 3:8), the promise is sure: *behold, I have set before thee an open door, and no man can shut it.* The one who holds the key of the house of David has opened the way home, and no power of man or synagogue can shut it against the faithful.',
       sv.verse_id, ev.verse_id, 'free', 9053
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65',
       E'The synagogue of Satan, which say they are Yahudim (Jews), and are not — the false-claim diagnostic (Isaiah 65)',
       E'This is the verse the inherited reading has bent into a weapon against the Yahudim (Jews); read in the prophets'' own frame it is nothing of the kind. *Behold, I will make them of the synagogue of Satan, which say they are Yahudim (Jews), and are not, but do lie; behold, I will make them to come and worship before thy feet, and to know that I have loved thee* (Revelation 3:9). The charge is not against the people of Yahudah (Judah), whom the prophets gather home; it is against those who CLAIM the covenant name *and are not, but do lie* — who wear the name while opposing the Messiah and his commandment-keepers. Isaiah drew exactly this line: not between Yahudi (Jew) and non-Yahudi, but between those who forsake Yahuah (LORD) and the servants he keeps. *Ye shall leave your name for a curse unto my chosen: for Adonai Yahuah (the Lord GOD) shall slay thee, and call his servants by another name* (Isaiah 65:15) — the rebels'' name becomes a curse, while the servants are called by a name of Yahuah''s (LORD''s) own giving, the new name promised to the overcomer at Philadelphia (Revelation 3:12). And Isaiah names the standard twice: the faithful bless and swear by *the Elohim (God) of truth* (Isaiah 65:16) — the very one who speaks here as *he that is holy, he that is true* (Revelation 3:7), the Amen who cannot lie. The false claimants *do lie*; they stand over against the Elohim (God) of truth. The reckoning is by truth, not by the bare word of the mouth — and the true word is settled by the calling, as Paul says: *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). The people of Yahuah (LORD) are those he calls and loves, the scattered owned again as his own — not a people self-named by a claim the Messiah denies. So to the faithful the loving word is sealed: *I have loved thee.* This is a diagnostic of the false claim, never a charter for anti-Yahudi replacement; the true Yashar''el (Israel) is the one being gathered and sealed.',
       sv.verse_id, ev.verse_id, 'free', 9056
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48',
       E'The pillar in the temple and the name of the new Jerusalem written on the overcomer (Ezekiel 48, Tobit 13)',
       E'The promise to Philadelphia gathers the whole hope of the restored city onto the overcomer himself: *Him that overcometh will I make a pillar in the temple of my Elohim (God), and he shall go no more out: and I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem, which cometh down out of heaven from my Elohim (God): and I will write upon him my new name* (Revelation 3:12). The name of the city is Ezekiel''s: at the close of his measured city of the twelve tribes, with its twelve gates named one by one, *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35). To bear that name is to belong forever to the restored city of the tribes — the pillar that goes no more out. And the new name is Isaiah''s promise to the city: *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2) — no erasure of Jerusalem but her restoration, the forsaken renamed and married. The Hebrew library already sang the jewelled city for the gathered people: *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16). What the letter writes on the man, the vision shows coming down in full: *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). This is the restoration, not a flight away — the holy city of the tribes coming DOWN to the renewed earth, and the faithful written into it as pillars that go no more out.',
       sv.verse_id, ev.verse_id, 'extras', 9059
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8',
       E'The Amen, the faithful and true witness, the beginning of the creation of Elohim (God) (Isaiah 44, Proverbs 8)',
       E'To Laodicea the Messiah takes a title that names who he is in himself: *These things saith the Amen, the faithful and true witness, the beginning of the creation of Elohim (God)* (Revelation 3:14). He is the Amen — Isaiah''s *Elohim (God) of truth* (Isaiah 65:16), the Elohei-Amen by whom the faithful bless and swear, the truth that does not fail, set against the lukewarm assembly that thinks itself *rich, and increased with goods, and have need of nothing* (Revelation 3:17). And *the beginning of the creation of Elohim (God)* is the Formed drawn from the Formless. Isaiah''s King of Yashar''el (Israel) declares *I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6) — Yahuah''s (LORD''s) own self-naming, carried by the one who *am set down with my Father in his throne* (Revelation 3:21), the Son distinguished from the Father, never collapsed. Proverbs gives the same beginning a voice: Wisdom stood with Yahuah (LORD) *in the beginning of his way, before his works of old* (Proverbs 8:22), *brought up with him* as the heavens were framed. And Paul names him plainly: *the image of the invisible Elohim (God), the firstborn of every creature* by whom *were all things created* (Colossians 1:15-16), *the beginning, the firstborn from the dead* (Colossians 1:18). So the beginning of the creation is not the first thing made but the firstborn over and the maker of all things — the visible Formed of the invisible Formless, and the beginning of the new creation as the firstborn from the dead. The faithful and true witness who counsels Laodicea to buy *white raiment* (Revelation 3:18) is the one in whom the whole creation began and in whom it is made new.',
       sv.verse_id, ev.verse_id, 'free', 9062
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55',
       E'Buy of me gold tried in the fire, and I stand at the door and knock (Isaiah 55, Proverbs 8)',
       E'Laodicea is the assembly that has it backward — *Because thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor, and blind, and naked* (Revelation 3:17). The counsel turns her self-reckoning inside out: *I counsel thee to buy of me gold tried in the fire, that thou mayest be rich; and white raiment, that thou mayest be clothed... and anoint thine eyes with eyesalve, that thou mayest see* (Revelation 3:18). The buying is Isaiah''s gospel-cry, the purchase that costs nothing made to the ones who have nothing: *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price* (Isaiah 55:1). The truly poor is the one who thinks she has need of nothing; the riches worth having are bought of him on Isaiah''s terms — come, and receive without price what gold cannot buy. And the love behind the rebuke comes to the very threshold: *As many as I love, I rebuke and chasten: be zealous therefore, and repent. Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him, and will sup with him, and he with me* (Revelation 3:19-20). Wisdom blessed the one who waited at her doors — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors* (Proverbs 8:34) — and now Wisdom himself stands at the door and knocks, asking only to be heard and let in. The hearing opens the door; the one who *heareth me* finds him already there, ready to come in and sup.',
       sv.verse_id, ev.verse_id, 'free', 9065
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7',
       E'Sit with me in my throne, even as I overcame and am set down with my Father in his throne (Daniel 7)',
       E'The seven letters close with the highest promise of all: *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The throne is Daniel''s throne-court. Daniel saw the thrones set and *the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame* (Daniel 7:9) — the Father in the vision-form of the court — and to the one like the Son of Adam who came to him was *given... dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14). The Messiah names that very scene: he overcame and *am set down with my Father in his throne* — the Formed Son seated WITH the Father, distinguished from the Ancient of days who sits, never collapsed into him, never a co-equal third. And the dominion given to him he shares with his own: as the everlasting kingdom was given to the Son, so he grants the overcomers to *sit with me in my throne.* The reign that shall not pass away is the throne the faithful are called to share with the one who overcame — the consummation toward which every letter''s *to him that overcometh* has been pointing.',
       sv.verse_id, ev.verse_id, 'free', 9068
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *blot me, I pray thee, out of thy book which thou hast written* the book named at Sinai, Moses pleading for Yashar''el (Israel); the book the overcomer is kept written in (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 32:33 — *Whosoever hath sinned against me, him will I blot out of my book* the blotting answers sin; the warning held inside the Sardis promise (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *thy people shall be delivered, every one that shall be found written in the book* the deliverance run by the book; the overcomer kept among the people delivered at the end (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous* the blotting prayed on the persecutors; to be written with the righteous is to keep the white garments (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 104:1-2 — *I have beheld the books of life... your names are written in the books of life before the Most High* the restored library shows the books of life open and the righteous written there (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=104 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 108:3 — *their names shall be blotted out of the book of life* the blotting that falls on the sinners, the sentence the overcomer is promised exemption from (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 10:32 — *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven* the gospel word kept to the overcomer; the Formed Son confessing his own before the Formless Father (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Luke 12:8 — *Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God)* the same confessing, naming the confessor the Son of Adam who owns his own before the angels (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 22:22 — *the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut* the sole stewardship of David''s house, gathered into the Messiah''s hand; the open door no man can shut (Revelation 3:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:15 — *Ye shall leave your name for a curse unto my chosen... and call his servants by another name* the line drawn between those who forsake Yahuah (LORD) and the servants he keeps and renames, not between Yahudi (Jew) and non-Yahudi (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:16 — *he that sweareth in the earth shall swear by the Elohim (God) of truth* the standard is truth; the false claimants who *do lie* stand over against the Elohim (God) of truth, the holy and true one who speaks (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:25 — *I will call them my people, which were not my people; and her beloved, which was not beloved* the people of Yahuah (LORD) reckoned by his calling and love, the scattered owned again, not by a bare self-claim (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 48:35 — *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* the name of the measured city of the twelve tribes, written on the overcomer as the new Jerusalem (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=48 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:2 — *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* the new name given to the city, the forsaken restored; written on the faithful as his new name (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:16 — *Jerusalem shall be built up with sapphires and emeralds, and precious stone... with pure gold* the restored library''s jewelled city for the gathered people, the new Jerusalem named on the overcomer (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:2 — *the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride* the name on the man shown in full when the city itself comes DOWN to the restored earth (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:16 — *the Elohim (God) of truth* the Elohei-Amen by whom the faithful bless and swear; the title the Messiah takes as *the Amen, the faithful and true witness* (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *I am the first, and I am the last; and beside me there is no Elohim (God)* Yahuah''s (LORD''s) own self-naming, carried by the Formed who is set down with his Father; the beginning of the creation (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* Wisdom with the Father before the works of old, the beginning of the creation given a voice (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:15 — *the image of the invisible Elohim (God), the firstborn of every creature* the visible Formed of the invisible Formless, by whom all things were created; the beginning of the creation (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:18 — *who is the beginning, the firstborn from the dead* the beginning of the new creation as well as the old; the firstborn from the dead, having the preeminence (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:1 — *come ye, buy, and eat; yea, come, buy wine and milk without money and without price* the gospel-buying that costs nothing, made to the truly poor; what Laodicea must buy of him (Revelation 3:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:34 — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors* Wisdom blesses the one at her door; now Wisdom himself stands at the door and knocks, asking to be heard (Revelation 3:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *the Ancient of days did sit, whose garment was white as snow* the Father in the vision-form of the throne-court; the Son set down WITH him, distinguished, never collapsed (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* the kingdom given to the one like the Son of Adam, shared with the overcomers who sit in his throne (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_04.sql (S224 Revelation 4) -----
-- =====================================================================
-- S224 minion — REVELATION 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 4 (11 verses) — THE THRONE IN HEAVEN. The throne-chariot vision of
--   Ezekiel 1 / 10 re-spoken, the seraphim *Holy holy holy* of Isaiah 6, the sea of glass of
--   Exodus 24, the Maker worshipped of Genesis 1 / Nehemiah 9.
-- Tag: rv04 (temp view _s224_rv04_lookup).
-- Sort band: floor 9075, step 3 (9075, 9078, 9081, 9084, 9087, 9090 used; under 9100).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (CHRISTOLOGY WATCHPOINT):
-- The One on the throne in chapter 4 is *him that liveth for ever and ever* (4:9-10) — the FATHER,
-- the formless Most High shown in vision-form on the throne-chariot of Ezekiel. The Lamb does NOT
-- appear until chapter 5, where he is distinguished from the throne-sitter (5:6-7, *he came and took
-- the book out of the right hand of him that sat upon the throne*). The two are NOT collapsed here:
-- the throne-sitter is the Father; the Formed Son comes forward in ch 5. The four living creatures
-- and the *Holy, holy, holy* are the cherubim/seraphim of Ezekiel 1 and Isaiah 6, the same throne
-- the prophets saw — Revelation never says *it is written*; it is woven entirely out of the Tanakh
-- and the Hebrew library. Read every figure inside the consummation-of-the-covenant frame: the same
-- Yahuah (LORD), the same throne, the same worship the prophets beheld, now opened to the seer.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1   the open door, *Come up hither* — the seer caught up to the throne
--         Tanakh: none warranted (carried into the throne thread at v.2)
--         Extras: 1 Enoch 14:3 (Enoch carried off in a whirlwind into the ends of heaven) — woven in prose of thread 9075
--         NT: none warranted
--   v.2-3 a throne set in heaven, and one sat on it; like jasper and sardine, a rainbow round about
--         Tanakh: Ezekiel 1:26 (the likeness of a throne, the appearance of a man above upon it),
--                 Ezekiel 1:28 (the bow in the cloud, the glory of Yahuah), Ezekiel 10:1 (the sapphire throne)
--         Extras: 1 Enoch 14:15 (the throne of Yahuah, of stibium, the top of sapphire),
--                 Apocalypse of Abraham 18:9 (the chariot with fiery wheels, the throne covered with fire)
--         NT: none warranted (the throne-sitter is the Father; the Lamb is ch 5)
--   v.4   four and twenty elders, white raiment, crowns of gold
--         Tanakh: none warranted (the enthroned council; carried in prose)
--         Extras: 1 Enoch 40:1 (thousands of thousands standing before Yahuah of Spirits) — thread 9087
--         NT: none warranted
--   v.5   seven lamps of fire before the throne, lightnings and thunderings
--         Tanakh: Exodus 19:16 (thunders and lightnings on Sinai) — woven into the throne thread prose
--         Extras: none warranted   NT: none warranted (curated; the menorah/seven-Spirits carried lightly)
--   v.6a  a sea of glass like crystal before the throne
--         Tanakh: Exodus 24:10 (the paved work of sapphire, the body of heaven in clearness),
--                 Ezekiel 1:22 (the firmament as the colour of the terrible crystal over their heads)
--         Extras: none warranted   NT: none warranted
--   v.6-8 four beasts full of eyes; like a lion, calf, man, eagle; six wings; resting not
--         Tanakh: Ezekiel 1:5-6 (four living creatures, four faces), Ezekiel 1:10 (face of man, lion,
--                 ox, eagle), Ezekiel 1:18 (the rings full of eyes), Ezekiel 10:12 (full of eyes round about),
--                 Ezekiel 10:14 (cherub, man, lion, eagle)
--         Extras: Apocalypse of Abraham 18:3 (four fiery living creatures under the throne),
--                 18:4 (lion, man, ox, eagle, six wings)
--         NT: none warranted
--   v.8   Holy, holy, holy, Yahuah Elohim Almighty, which was, and is, and is to come
--         Tanakh: Isaiah 6:2 (the seraphim, six wings), Isaiah 6:3 (Holy, holy, holy, Yahuah Tseva'ot)
--         Extras: 1 Enoch 39:12 (the four presences uttering praises before Yahuah of glory),
--                 1 Enoch 39:13 (the first voice blesses Yahuah of Spirits for ever and ever)
--         NT: none warranted
--   v.9-10 the elders fall down, worship him that liveth for ever and ever, cast their crowns
--         Tanakh: Nehemiah 9:6 (the host of heaven worshippeth thee) — carried in thread 9087 / 9090
--         Extras: 1 Enoch 40:1 (the myriads standing before the throne)
--         NT: none warranted
--   v.11  Thou hast created all things, and for thy pleasure they are and were created
--         Tanakh: Genesis 1:1 (in the beginning Elohim created), Nehemiah 9:6 (thou hast made heaven
--                 and earth and the host of heaven, and thou preservest them all)
--         Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9075 revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1     (Tanakh + Extras)
--   9078 revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1  (Tanakh + Extras)
--   9081 revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6                    (Tanakh + Extras)
--   9084 revelation-4-the-sea-of-glass-before-the-throne-exodus-24                     (Tanakh)
--   9087 revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne   (Tanakh + Extras)
--   9090 revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
  ('canon', 'revelation', 4, 2, 'canon', 'ezekiel', 1, 26, 'free', E'*And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26). This is the throne John is caught up to behold: *and, behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). Ezekiel saw it first by the river of Chebar — *the likeness of a throne... and upon the likeness of the throne... the appearance of a man above upon it* — and the seer of the Apocalypse is brought into the same throne-room. The One on the throne here is *him that liveth for ever and ever* (Revelation 4:9), the Father shown in vision-form; the Formed Son comes forward only in the chapter that follows.'),
  ('canon', 'revelation', 4, 3, 'canon', 'ezekiel', 1, 28, 'free', E'*As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* (Ezekiel 1:28). The rainbow round the throne is no new sight — Ezekiel saw *the appearance of the bow that is in the cloud* encircling *the likeness of the glory of Yahuah (LORD)*. So John writes, *and there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). The same encircling bow, the same glory; the seer beholds what the prophet beheld, the throne of the living Elohim (God) crowned with the bow of the covenant.'),
  ('canon', 'revelation', 4, 3, 'canon', 'ezekiel', 10, 1, 'free', E'*Then I looked, and, behold, in the firmament that was above the head of the cherubims there appeared over them as it were a sapphire stone, as the appearance of the likeness of a throne.* (Ezekiel 10:1). Ezekiel saw the throne again over the cherubim — *as it were a sapphire stone, as the appearance of the likeness of a throne.* It is the throne of Revelation 4, *and he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3): the same throne above the living creatures, gleaming like precious stone, that the prophet saw mounted over the cherubim above the firmament.'),
  ('canon', 'revelation', 4, 3, 'enoch', '1-enoch', 14, 15, 'extras', E'*But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15). Enoch, carried up in a chariot of fire into the ends of heaven, saw *the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* — the same sapphire-gleaming throne Ezekiel saw and John now beholds. *And he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3): the Hebrew library beheld the throne of precious stone reaching to heaven, the throne of the Most High, before ever the Apocalypse opened its door in heaven.'),
  ('canon', 'revelation', 4, 2, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'extras', E'*And as I stood alone and looked, I saw behind the living creatures a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne, which I saw, and this was covered with fire, and fire encircled it round about, and lo, an indescribable fire environed a fiery host.* (Apocalypse of Abraham 18:9). Abraham too was carried up and saw the throne-chariot — *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire.* It is the throne John sees set in heaven, *and one sat on the throne* (Revelation 4:2), with the lightnings proceeding out of it (Revelation 4:5). The same fiery throne-chariot of Ezekiel runs through the restored library: the seers of Yashar''el (Israel) beheld one throne, the throne of the living Elohim (God).'),
  -- thread: revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1
  ('canon', 'revelation', 4, 6, 'canon', 'ezekiel', 1, 5, 'free', E'*Also out of the midst thereof came the likeness of four living creatures. And this was their appearance; they had the likeness of a man.* (Ezekiel 1:5). John''s *four beasts full of eyes before and behind* (Revelation 4:6) are Ezekiel''s *four living creatures* — the cherubim that bear the throne. The seer of the Apocalypse beholds the same four that Ezekiel saw come *out of the midst* of the fire by the river of Chebar; the throne-room of Revelation 4 is the throne-chariot of Ezekiel 1, the same living creatures round about the same throne.'),
  ('canon', 'revelation', 4, 7, 'canon', 'ezekiel', 1, 10, 'free', E'*As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* (Ezekiel 1:10). Here are the four faces John names one by one: *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7). The lion, the man, the ox (the calf), the eagle — the very four faces of Ezekiel''s living creatures, the cherubim of the throne. The Apocalypse distributes among the four what Ezekiel gathered into each; the same fourfold face beholds the throne in both.'),
  ('canon', 'revelation', 4, 8, 'canon', 'ezekiel', 1, 18, 'free', E'*As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* (Ezekiel 1:18). The eyes that fill John''s living creatures — *they were full of eyes within* (Revelation 4:8), *full of eyes before and behind* (Revelation 4:6) — are the eyes Ezekiel saw, *full of eyes round about them four.* Nothing of the throne-bearers escapes their seeing; the cherubim are all eyes, watching every way, the unsleeping watchers of the throne in both the prophet''s vision and the seer''s.'),
  ('canon', 'revelation', 4, 7, 'canon', 'ezekiel', 10, 14, 'free', E'*And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle.* (Ezekiel 10:14). When Ezekiel saw the living creatures a second time he named them outright — *I knew that they were the cherubims* (Ezekiel 10:20) — and gave the same four faces: cherub, man, lion, eagle. John''s four beasts, *like a lion... like a calf... a face as a man... like a flying eagle* (Revelation 4:7), are these cherubim; the four-faced throne-bearers of the prophet are the four living creatures of the Apocalypse.'),
  ('canon', 'revelation', 4, 6, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'extras', E'*And as the fire raised itself up, ascending into the height, I saw under the fire a throne of fire, and, round about it, all-seeing ones, reciting the song; and under the throne four fiery living creatures singing, and their appearance was one, each one of them with four faces.* (Apocalypse of Abraham 18:3). The restored library sets the same four beneath the same throne: *under the throne four fiery living creatures singing... each one of them with four faces,* surrounded by *all-seeing ones.* So John sees *in the midst of the throne, and round about the throne... four beasts full of eyes before and behind* (Revelation 4:6). The all-seeing throne-bearers of Abraham''s vision are John''s eye-filled living creatures, the cherubim of the one throne.'),
  ('canon', 'revelation', 4, 8, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'extras', E'*And such was the appearance of their countenances, of a lion, of a man, of an ox, of an eagle: four heads were upon their bodies, so that the four creatures had sixteen faces; and each had six wings from their shoulders, and their sides, and their loins.* (Apocalypse of Abraham 18:4). The Hebrew library names the four faces and the six wings together — *of a lion, of a man, of an ox, of an eagle... and each had six wings.* John beholds exactly this: the four faces *like a lion... like a calf... a face as a man... like a flying eagle* (Revelation 4:7), and *the four beasts had each of them six wings about him; and they were full of eyes within* (Revelation 4:8). The same lion-man-ox-eagle, the same six wings; one throne-vision held across the restored library.'),
  -- thread: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
  ('canon', 'revelation', 4, 8, 'canon', 'isaiah', 6, 3, 'free', E'*And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* (Isaiah 6:3). This is the cry the four beasts take up day and night: *Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). Isaiah heard the seraphim cry it about the throne *high and lifted up;* John hears the living creatures cry it about the same throne. The thrice-holy of the prophet is the thrice-holy of the seer — one unceasing worship of the One who fills the whole earth with his glory.'),
  ('canon', 'revelation', 4, 8, 'canon', 'isaiah', 6, 2, 'free', E'*Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* (Isaiah 6:2). The six wings of John''s living creatures are the six wings of Isaiah''s seraphim — *each one had six wings* about the throne. *And the four beasts had each of them six wings about him* (Revelation 4:8). The burning ones who stood above the throne and cried *Holy, holy, holy* are of one order with the four beasts who *rest not day and night* crying the same; the seer sees the seraphim-cherubim worship Isaiah saw.'),
  ('canon', 'revelation', 4, 8, 'enoch', '1-enoch', 39, 12, 'extras', E'*And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* (1 Enoch 39:12). Enoch too saw four about the throne of glory and heard their unceasing praise — *the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits* (1 Enoch 39:11), *as they uttered praises before Yahuah (God) of glory.* So the *four beasts... rest not day and night, saying, Holy, holy, holy* (Revelation 4:8). The restored library beheld the same fourfold worship before the same throne, the ceaseless praise of the Most High.'),
  ('canon', 'revelation', 4, 8, 'enoch', '1-enoch', 39, 13, 'extras', E'*And the first voice blesses Yahuah (God) of Spirits for ever and ever.* (1 Enoch 39:13). The praise Enoch heard rises *for ever and ever* — the very note John''s creatures sound, who *give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever* (Revelation 4:9). The blessing of Yahuah (God) of Spirits *for ever and ever* in the Hebrew library and the worship of *him that liveth for ever and ever* in the Apocalypse are one everlasting song before one everlasting throne.'),
  -- thread: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
  ('canon', 'revelation', 4, 6, 'canon', 'exodus', 24, 10, 'free', E'*And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* (Exodus 24:10). When Moses and the seventy elders went up, they saw beneath the feet of the Elohim (God) of Yashar''el (Israel) *a paved work of a sapphire stone... as it were the body of heaven in his clearness* — a floor like clear sky before the throne. John sees the same crystalline expanse: *and before the throne there was a sea of glass like unto crystal* (Revelation 4:6). The pavement under the feet of Elohim (God) at Sinai is the sea of glass before the throne in heaven; the elders of Yashar''el (Israel) beheld what the seer beholds.'),
  ('canon', 'revelation', 4, 6, 'canon', 'ezekiel', 1, 22, 'free', E'*And the likeness of the firmament upon the heads of the living creature was as the colour of the terrible crystal, stretched forth over their heads above.* (Ezekiel 1:22). Above the cherubim Ezekiel saw a firmament *as the colour of the terrible crystal* — a shining crystal expanse beneath the throne. John names the same: *a sea of glass like unto crystal* (Revelation 4:6) before the throne, with *the four beasts* in the midst. The crystal firmament over the living creatures in Ezekiel and the crystal sea before the throne in Revelation are the same clear expanse, the floor of the heavenly throne-room.'),
  -- thread: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
  ('canon', 'revelation', 4, 10, 'enoch', '1-enoch', 40, 1, 'extras', E'*And after that I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits.* (1 Enoch 40:1). Around the throne Enoch saw a countless host — *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits.* John sees the four and twenty elders among that worshipping host: *the four and twenty elders fall down before him that sat on the throne, and worship him that liveth for ever and ever, and cast their crowns before the throne* (Revelation 4:10). The enthroned council that casts down its crowns belongs to the same numberless worship the Hebrew library beheld before the throne of glory.'),
  ('canon', 'revelation', 4, 9, 'canon', 'nehemiah', 9, 6, 'free', E'*Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The Levites confessed that *the host of heaven worshippeth thee* — and this is the worship John sees: *when those beasts give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever* (Revelation 4:9). The host that worships the Maker in Nehemiah''s prayer is the host that gives glory before the throne in the Apocalypse; the living creatures and the elders are that worshipping host of heaven.'),
  -- thread: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
  ('canon', 'revelation', 4, 11, 'canon', 'genesis', 1, 1, 'free', E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1). The ground of all the worship in this chapter is the first verse of the Word: *In the beginning Elohim (God) created the heaven and the earth.* So the elders cast their crowns and cry, *Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). He is worthy because he is the Maker; the throne is the throne of the Creator, and the heaven and earth that he made render him his glory.'),
  ('canon', 'revelation', 4, 11, 'canon', 'nehemiah', 9, 6, 'free', E'*Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). Nehemiah''s Levites name the Maker of *heaven... the earth, and all things that are therein* — and not the Maker only but the Preserver, *thou preservest them all.* The elders sound the same note: *thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). All things were created by him and stand by his pleasure; the One worshipped on the throne is the One who made and upholds the whole host of heaven and earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1',
       E'A throne set in heaven, and one sat on the throne — the throne-chariot of Ezekiel (Ezekiel 1, 10)',
       E'A door opens in heaven and the first voice, *as it were of a trumpet,* says *Come up hither* (Revelation 4:1); and at once the seer is *in the spirit,* and *behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). This is no new throne. Ezekiel saw it first by the river of Chebar: *above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26), and over the cherubim again *as it were a sapphire stone, as the appearance of the likeness of a throne* (Ezekiel 10:1). John writes that *he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3), gleaming like precious stone as Ezekiel''s throne gleamed like sapphire. And round it the same encircling bow the prophet saw: *as the appearance of the bow that is in the cloud in the day of rain... this was the appearance of the likeness of the glory of Yahuah (LORD)* (Ezekiel 1:28) — *and there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). The Hebrew library beheld the same throne reaching to heaven: *the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15), and Abraham saw the throne-chariot entire — *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire* (Apocalypse of Abraham 18:9), the fire that proceeds out of John''s throne as *lightnings and thunderings and voices* (Revelation 4:5). One throne runs through the prophets and the seers of Yashar''el (Israel): the throne of the living Elohim (God). And mark who sits on it here — *him that liveth for ever and ever* (Revelation 4:9), the Father, the formless Most High shown in vision-form. The Lamb does not appear until the chapter that follows, where he comes forward and *took the book out of the right hand of him that sat upon the throne* (Revelation 5:7); the throne-sitter and the Lamb are not collapsed. In chapter 4 it is the Father on the throne, worshipped as Maker, and the seer beholds what Ezekiel and Enoch and Abraham beheld before him.',
       sv.verse_id, ev.verse_id, 'extras', 9075
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1',
       E'The four living creatures full of eyes — lion, calf, man, eagle: the cherubim of Ezekiel (Ezekiel 1, 10)',
       E'In the midst of the throne and round about it John sees *four beasts full of eyes before and behind* (Revelation 4:6) — the living creatures of Ezekiel, the cherubim that bear the throne. Ezekiel saw them come *out of the midst* of the fire: *the likeness of four living creatures... they had the likeness of a man* (Ezekiel 1:5), and he named their four faces — *the face of a man, and the face of a lion, on the right side: and... the face of an ox on the left side... also... the face of an eagle* (Ezekiel 1:10). John distributes among the four what Ezekiel gathered into each: *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7) — the same lion, ox (the calf), man, and eagle. When Ezekiel saw them a second time he knew them by name: *the first face was the face of a cherub, and the second... of a man, and the third... of a lion, and the fourth... of an eagle* (Ezekiel 10:14), *and I knew that they were the cherubims* (Ezekiel 10:20). And the eyes that fill John''s creatures are Ezekiel''s: *their rings were full of eyes round about them four* (Ezekiel 1:18) — *they were full of eyes within* (Revelation 4:8). The restored library beheld the same four beneath the same throne: *under the throne four fiery living creatures singing... each one of them with four faces* (Apocalypse of Abraham 18:3), and named the faces and the wings together — *of a lion, of a man, of an ox, of an eagle... and each had six wings* (Apocalypse of Abraham 18:4) — exactly John''s *four beasts had each of them six wings about him; and they were full of eyes within* (Revelation 4:8). The throne-room of Revelation 4 is the throne-chariot of Ezekiel 1: the same cherubim, the same fourfold face, the same eyes that see every way, the unsleeping bearers of the one throne.',
       sv.verse_id, ev.verse_id, 'extras', 9078
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6',
       E'Holy, holy, holy, Yahuah Elohim (Lord God) Almighty — the thrice-holy of Isaiah 6 (Isaiah 6)',
       E'The four living creatures *rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). This is the cry Isaiah heard about the throne *high and lifted up:* *one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). The thrice-holy of the seraphim is the thrice-holy of the four beasts — one unceasing worship of the One who fills the earth with his glory. And the wings are the same: *above it stood the seraphims: each one had six wings* (Isaiah 6:2), as *the four beasts had each of them six wings about him* (Revelation 4:8). The burning ones who stood above the throne and the eye-filled creatures who circle it are of one order, the worship-bearers of the Most High. The Hebrew library heard it too: Enoch saw four about the throne of glory and heard *the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12), praise that rises *for ever and ever* — *the first voice blesses Yahuah (God) of Spirits for ever and ever* (1 Enoch 39:13), the very note of those who *give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever* (Revelation 4:9). One throne, one fourfold worship, one everlasting *Holy, holy, holy* sounded by the prophets and the seers of Yashar''el (Israel) and now by the living creatures John beholds.',
       sv.verse_id, ev.verse_id, 'extras', 9081
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-sea-of-glass-before-the-throne-exodus-24',
       E'A sea of glass like crystal before the throne — the pavement of sapphire (Exodus 24, Ezekiel 1)',
       E'*And before the throne there was a sea of glass like unto crystal* (Revelation 4:6) — a clear, shining expanse spread out before the One who sits enthroned. The elders of Yashar''el (Israel) saw its likeness at Sinai: when Moses, Aaron, Nadab, Abihu, and the seventy went up, *they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* (Exodus 24:10) — a pavement like clear sky beneath the feet of Elohim (God). And Ezekiel saw the same crystal expanse beneath the throne: *the likeness of the firmament upon the heads of the living creature was as the colour of the terrible crystal, stretched forth over their heads above* (Ezekiel 1:22). The paved work of sapphire under the feet of Elohim (God), the crystal firmament over the cherubim, and the sea of glass before the throne are one shining floor of the heavenly throne-room. What the seventy elders beheld with Moses, and what Ezekiel beheld by Chebar, John now beholds: the clear expanse before the throne of the living Elohim (God), and the four and twenty elders standing where the elders of old once stood and saw and worshipped.',
       sv.verse_id, ev.verse_id, 'free', 9084
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne',
       E'The elders cast their crowns, and the myriads before the throne (1 Enoch 40, Nehemiah 9)',
       E'Round about the throne sit *four and twenty elders... clothed in white raiment; and they had on their heads crowns of gold* (Revelation 4:4); and when the living creatures give glory, *the four and twenty elders fall down before him that sat on the throne, and worship him that liveth for ever and ever, and cast their crowns before the throne* (Revelation 4:10). They lay down their own crowns before the One who alone is worthy. The Hebrew library beheld the same numberless worship: Enoch saw *thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits* (1 Enoch 40:1) — the great host before the throne of glory, of which the enthroned elders are a part. And Nehemiah''s Levites confessed the ground of it all: *thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host... and the host of heaven worshippeth thee* (Nehemiah 9:6). The host that worships the Maker in the Levites'' prayer is the host that gives *glory and honour and thanks to him that sat on the throne* (Revelation 4:9) in the seer''s vision. The elders cast down their crowns because the throne is the throne of the Creator: every crown of gold returns to the One who made the heads that wear them.',
       sv.verse_id, ev.verse_id, 'extras', 9087
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9',
       E'Thou hast created all things — the Maker worshipped (Genesis 1, Nehemiah 9)',
       E'The chapter ends in the song of the elders: *Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). The ground of all this worship is creation itself — the first verse of the Word: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1). He is worthy because he is the Maker; the throne is the throne of the Creator. Nehemiah''s Levites sounded the same confession, naming him Maker and Preserver alike: *thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee* (Nehemiah 9:6). All things were created by him and *for thy pleasure they are and were created* — made by his will and standing by his will. This is the One on the throne in chapter 4: not a co-equal council, but the living Elohim (God) who made and upholds the whole host of heaven and earth, *him that liveth for ever and ever* (Revelation 4:9), worthy of all glory because every created thing came from his hand and is kept by his pleasure.',
       sv.verse_id, ev.verse_id, 'free', 9090
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *upon the likeness of the throne was the likeness as the appearance of a man above upon it* the throne by Chebar that John is caught up to behold, *a throne was set in heaven, and one sat on the throne* (Revelation 4:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:28 — *as the appearance of the bow that is in the cloud... the likeness of the glory of Yahuah (LORD)* the encircling rainbow the prophet saw, *a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 10:1 — *as it were a sapphire stone, as the appearance of the likeness of a throne* the throne over the cherubim, gleaming like the jasper and sardine of *he that sat* (Revelation 4:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 14:15 — *like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* the sapphire throne reaching to heaven Enoch saw, the same precious-stone throne of *he that sat* (Revelation 4:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Apocalypse of Abraham 18:9 — *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire* the throne-chariot Abraham saw, the fire that proceeds from John''s throne as lightnings (Revelation 4:2, 5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='apocalypse-of-abraham' AND tv.book_slug='apocalypse-of-abraham' AND tv.chapter_number=18 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:5 — *the likeness of four living creatures... they had the likeness of a man* the cherubim of the throne-chariot, John''s *four beasts full of eyes before and behind* (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:10 — *the face of a man, and the face of a lion... the face of an ox... the face of an eagle* the four faces John names one by one, lion, calf, man, eagle (Revelation 4:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 10:14 — *the face of a cherub... of a man... of a lion... of an eagle* the second sighting where Ezekiel knows them as cherubim, the same four faces of John''s beasts (Revelation 4:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:18 — *their rings were full of eyes round about them four* the eyes that fill John''s living creatures, *they were full of eyes within* (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Apocalypse of Abraham 18:3 — *under the throne four fiery living creatures singing... each one of them with four faces* the restored library''s four beneath the throne, surrounded by all-seeing ones (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='apocalypse-of-abraham' AND tv.book_slug='apocalypse-of-abraham' AND tv.chapter_number=18 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Apocalypse of Abraham 18:4 — *of a lion, of a man, of an ox, of an eagle... and each had six wings* the four faces and six wings together, exactly John''s six-winged eye-filled beasts (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='apocalypse-of-abraham' AND tv.book_slug='apocalypse-of-abraham' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:3 — *Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* the seraphim''s cry about the throne, the thrice-holy the four beasts take up day and night (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:2 — *the seraphims: each one had six wings* the six wings of the burning ones above the throne, the same six wings of John''s four beasts (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 39:12 — *the voices of those four presences as they uttered praises before Yahuah (God) of glory* the four about the throne of glory whose ceaseless praise Enoch heard (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 39:13 — *the first voice blesses Yahuah (God) of Spirits for ever and ever* praise *for ever and ever,* the note of those who worship *him that liveth for ever and ever* (Revelation 4:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:10 — *under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* the pavement the seventy elders saw beneath Elohim (God) at Sinai, the sea of glass before the throne (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-sea-of-glass-before-the-throne-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:22 — *the firmament... was as the colour of the terrible crystal, stretched forth over their heads above* the crystal expanse beneath the throne over the cherubim, John''s sea of glass like crystal (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-sea-of-glass-before-the-throne-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 40:1 — *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits* the numberless host before the throne of glory, of which the enthroned elders are a part (Revelation 4:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:6 — *the host of heaven worshippeth thee* the host that worships the Maker in the Levites'' confession, giving glory before the throne (Revelation 4:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth* the first verse of the Word, the ground of the elders'' song, *thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:6 — *thou hast made heaven... the earth, and all things that are therein... and thou preservest them all* the Maker and Preserver of all, worthy because *thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_05.sql (S224 Revelation 5) -----
-- =====================================================================
-- S224 minion — REVELATION 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 5 (14 verses) — the sealed scroll and the Lamb.
-- Tag: rv05 (temp view _s224_rv05_lookup).
-- Sort band: floor 9100, step 3 (9100, 9103, 9106, 9109, 9112, 9115 used; under 9125).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation 5 is the throne-room hinge of the whole book — the One who *sat on
-- the throne* (the Father, 5:1,7,13) holds a scroll *written within and on the backside, sealed with
-- seven seals* (5:1), and no creature can open it until *the Lion of the tribe of Juda, the Root of
-- David* (5:5) is shown to be *a Lamb as it had been slain* (5:6). The CHRISTOLOGY is the slain-yet-
-- reigning Formed: Yahusha (Jesus) is the Lion who is the Lamb, the Root of David from whom David
-- sprang, the One who took on flesh and was slain and yet lives to reign. He is DISTINGUISHED FROM
-- *him that sat upon the throne* (the Father) — he *came and took the book out of the right hand* of
-- the One on the throne (5:7) — and yet he receives the SAME worship as the Father (5:13): *Blessing,
-- and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for
-- ever and ever.* The Formed who is Yahuah and has a Father — not a co-equal second person, not the
-- Father himself. His blood *redeemed us to Elohim (God)... out of every kindred, and tongue, and
-- people, and nation* (5:9) and *made us unto our Elohim (God) kings and priests* (5:10) — the Exodus
-- 19:6 covenant vocation restored, the gathered seed made a kingdom of priests, NOT a replacement
-- people. No Trinitarian co-equal-persons grammar; no modalist collapse; the Lamb and the One on the
-- throne are two, and the worship belongs to the One.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   the scroll written within and on the backside, sealed with seven seals; none worthy
--           Tanakh: Ezekiel 2:9-10 (the roll written within and without, lamentations and woe),
--                   Isaiah 29:11 (the vision become as a book that is sealed), Daniel 12:4 (seal the
--                   book even to the time of the end)
--           Extras: none warranted   NT: none warranted (the worthy One enters at v.5)
--   v.5     the Lion of the tribe of Juda, the Root of David, hath prevailed
--           Tanakh: Genesis 49:9 (Yahudah is a lion's whelp), 49:10 (the sceptre shall not depart
--                   until Shiloh come), Isaiah 11:1 (a rod out of the stem of Jesse, a Branch),
--                   Isaiah 11:10 (a root of Jesse, an ensign of the people)
--           Extras: none warranted   NT: none warranted (carried; the Lamb-witness is John 1)
--   v.6     a Lamb as it had been slain, seven horns, seven eyes, the seven Spirits
--           Tanakh: Isaiah 53:7 (brought as a lamb to the slaughter, openeth not his mouth),
--                   Exodus 12:6 (the whole assembly shall kill it — the Passover lamb),
--                   Zechariah 4:10 (the seven; the eyes of Yahuah run to and fro through the earth),
--                   Zechariah 3:9 (upon one stone seven eyes)
--           Extras: none warranted   NT: John 1:29 (Behold the Lamb of Elohim which taketh away sin)
--   v.7-8   the Lamb takes the book from the right hand of him on the throne; harps and odours
--           Tanakh: none warranted (the prayers/odours carried lightly; weight is on the taking)
--           Extras: none warranted   NT: carried into the worthy/worship threads
--   v.9-10  the new song: thou wast slain, hast redeemed us, made us kings and priests
--           Tanakh: Exodus 19:6 (a kingdom of priests, an holy nation), Psalm 33:3 (sing a new
--                   song), Psalm 40:3 (a new song in my mouth, praise unto our Elohim)
--           Extras: none warranted   NT: Revelation 1:6 (made us kings and priests unto Elohim and
--                   his Father), Revelation 1:5 (washed us from our sins in his own blood)
--   v.11-12 ten thousand times ten thousand — the myriads worshipping the Lamb
--           Tanakh: Daniel 7:10 (thousand thousands ministered, ten thousand times ten thousand
--                   stood before him)
--           Extras: 1 Enoch 40:1 (thousands of thousands and myriads of myriads before Yahuah of
--                   Spirits), 1 Enoch 14:21 (the ten-thousand reckonings of the throne-vision)
--           NT: none warranted
--   v.13-14 every creature: blessing to him on the throne AND to the Lamb — the worship of the Formed
--           Tanakh: Daniel 7:14 (dominion, glory, a kingdom, that all should serve him — everlasting)
--           Extras: none warranted   NT: Philippians 2:10 (every knee should bow), Philippians 2:11
--                   (every tongue confess Yahusha HaMashiach is Lord, to the glory of the Father)
--
-- THREADS (slug -> target libraries):
--   9100 revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2          (Tanakh)
--   9103 revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49              (Tanakh)
--   9106 revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53    (Tanakh + NT)
--   9109 revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19 (Tanakh + NT)
--   9112 revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7   (Tanakh + Extras)
--   9115 revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2 (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
  ('canon', 'revelation', 5, 1, 'canon', 'ezekiel', 2, 9, 'free', E'*And when I looked, behold, an hand was sent unto me; and, lo, a roll of a book was therein* (Ezekiel 2:9). John sees the very thing Ezekiel saw, held out from the throne: *And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* (Revelation 5:1). The seer has Ezekiel''s roll in his ear — the scroll handed forth from heaven, the prophetic decree that no man writes and no man may open of himself. What Ezekiel received to eat and to speak, John sees sealed, awaiting the only One found worthy to break it.'),
  ('canon', 'revelation', 5, 1, 'canon', 'ezekiel', 2, 10, 'free', E'*And he spread it before me; and it was written within and without: and there was written therein lamentations, and mourning, and woe* (Ezekiel 2:10). This is the exact shape of John''s scroll: *a book written within and on the backside* (Revelation 5:1) — written on both faces, front and back, the same overflowing decree Ezekiel saw, *written within and without.* The roll crammed full on both sides is the full and finished counsel of Yahuah (LORD), and what it holds is judgment and the working-out of all things; it is no light word, but the sealed sentence the slain Lamb alone can loose.'),
  ('canon', 'revelation', 5, 1, 'canon', 'isaiah', 29, 11, 'free', E'*And the vision of all is become unto you as the words of a book that is sealed, which men deliver to one that is learned, saying, Read this, I pray thee: and he saith, I cannot; for it is sealed* (Isaiah 29:11). Isaiah names the very helplessness John weeps over: a *book that is sealed* that no man can read. *And no man in heaven, nor in earth, neither under the earth, was able to open the book* (Revelation 5:3). The learned cannot, the unlearned cannot; the sealed word stays shut to every creature — until the One the prophets pointed to is found worthy, and the sealing that shut out all flesh is undone by the Lamb.'),
  ('canon', 'revelation', 5, 4, 'canon', 'daniel', 12, 4, 'free', E'*But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased* (Daniel 12:4). Daniel was told to *seal the book, even to the time of the end* — and so it stayed sealed, and John *wept much, because no man was found worthy to open and to read the book* (Revelation 5:4). The grief is the grief of a sealed prophecy with no one to break it. But the sealing was *to the time of the end,* and the time has come: the Lamb who *hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5) is the One for whom Daniel''s scroll waited.'),
  -- thread: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
  ('canon', 'revelation', 5, 5, 'canon', 'genesis', 49, 9, 'free', E'*Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). When the elder says *behold, the Lion of the tribe of Juda... hath prevailed* (Revelation 5:5), he is naming Jacob''s dying blessing over his son — the lion of the tribe of Yahudah (Judah), the royal beast who couches and none dares rouse. The Lion who prevails to open the scroll is the promised one of Yahudah''s line, the Messiah sprung from the kingly tribe, come up *from the prey* having conquered.'),
  ('canon', 'revelation', 5, 5, 'canon', 'genesis', 49, 10, 'free', E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The same blessing carries the sceptre and the gathering: the rule stays in Yahudah (Judah) *until Shiloh come,* and *unto him shall the gathering of the people be.* This is the One who *hath prevailed* (Revelation 5:5) — Shiloh come at last, the rightful King of Yahudah''s line to whom the gathering of the people belongs, the One whose blood *redeemed us to Elohim (God)... out of every kindred, and tongue, and people, and nation* (Revelation 5:9). The Lion who opens the scroll is the King who gathers the seed home.'),
  ('canon', 'revelation', 5, 5, 'canon', 'isaiah', 11, 1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). The elder names him twice — *the Lion of the tribe of Juda, the Root of David* (Revelation 5:5) — and the second title is Isaiah''s: the shoot from Jesse''s stem, David''s father, the Branch from the royal root. He is the rod out of the stem of Jesse, the One in whom *the spirit of Yahuah (LORD)* rests (Isaiah 11:2), the very seven-fold Spirit John sees as *seven eyes... the seven Spirits of Elohim (God)* (Revelation 5:6).'),
  ('canon', 'revelation', 5, 5, 'canon', 'isaiah', 11, 10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious* (Isaiah 11:10). *The Root of David* (Revelation 5:5) is the *root of Jesse* of Isaiah — and mark the title: not merely a branch from the root, but the Root itself, the One from whom David sprang and in whom David''s house stands. He is set up *for an ensign of the people,* the banner the gathered seek, the One whose prevailing opens the scroll and whose redeemed are drawn *out of every kindred, and tongue, and people, and nation* (Revelation 5:9).'),
  -- thread: revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53
  ('canon', 'revelation', 5, 6, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). John looks for the Lion and sees *a Lamb as it had been slain* (Revelation 5:6) — and this is the lamb Isaiah foretold, *brought as a lamb to the slaughter.* The Lion of Yahudah (Judah) prevails not by devouring but by being slain; the conquering King is the silent sacrificial lamb, the suffering servant of Isaiah who *bare the sin of many* (Isaiah 53:12). The slain-yet-standing Lamb is the Lion''s victory.'),
  ('canon', 'revelation', 5, 6, 'canon', 'exodus', 12, 6, 'free', E'*And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6). The *Lamb as it had been slain* (Revelation 5:6) carries the Passover lamb in its body — the lamb *without blemish, a male of the first year* (Exodus 12:5) that the whole congregation killed, whose blood on the door turned aside the destroyer. The slain Lamb in the midst of the throne is the true Passover, by whose blood the gathered are redeemed: *thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9).'),
  ('canon', 'revelation', 5, 6, 'canon', 'zechariah', 4, 10, 'free', E'*For who hath despised the day of small things? for they shall rejoice, and shall see the plummet in the hand of Zerubbabel with those seven; they are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10). The Lamb''s *seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6) are Zechariah''s *eyes of Yahuah (LORD), which run to and fro through the whole earth.* The all-seeing eyes of Yahuah (LORD) himself are the Lamb''s eyes — the Formed bearing what is the Father''s own, the seven-fold Spirit going out into all the earth.'),
  ('canon', 'revelation', 5, 6, 'canon', 'zechariah', 3, 9, 'free', E'*For behold the stone that I have laid before Joshua; upon one stone shall be seven eyes: behold, I will engrave the graving thereof, saith Yahuah Tseva''ot (LORD of hosts), and I will remove the iniquity of that land in one day* (Zechariah 3:9). The *seven eyes* on Zechariah''s engraved stone — beside the promise *I will remove the iniquity of that land in one day* — meet the *seven eyes* of the Lamb (Revelation 5:6) who *wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9). The stone with seven eyes and the iniquity removed in one day foreshadow the slain Lamb who bears the seven Spirits and takes away sin in the one day of his offering.'),
  ('canon', 'revelation', 5, 6, 'canon', 'john', 1, 29, 'free', E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). What the Witness pointed to at the Jordan, the seer beholds in heaven: *Behold the Lamb of Elohim (God)* and *a Lamb as it had been slain* (Revelation 5:6) name one and the same — Yahusha (Jesus), the Lamb of Elohim (God) who takes away sin. The Lamb hailed at his coming is the Lamb enthroned in the midst of the throne, slain and yet standing, the One *who taketh away the sin of the world.*'),
  -- thread: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
  ('canon', 'revelation', 5, 10, 'canon', 'exodus', 19, 6, 'free', E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). The new song says *and hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10) — and this is the Sinai covenant vocation restored: *a kingdom of priests, and an holy nation,* the word Yahuah (LORD) spoke to the children of Yashar''el (Israel) at the mount. The Lamb''s blood does not make a new people in Israel''s place; it brings the covenant people into the priestly kingship they were always called to, *and we shall reign on the earth.*'),
  ('canon', 'revelation', 5, 9, 'canon', 'psalms', 33, 3, 'free', E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3). The four beasts and the elders *sung a new song* (Revelation 5:9) — the very thing the psalm calls for, *sing unto him a new song.* A new song is sung for a new and mighty work of Yahuah (LORD); here the new work is the slain Lamb who *wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9), and the harps of heaven take up the psalm''s summons before the throne.'),
  ('canon', 'revelation', 5, 9, 'canon', 'psalms', 40, 3, 'free', E'*And he hath put a new song in my mouth, even praise unto our Elohim (God): many shall see it, and fear, and shall trust in Yahuah (LORD)* (Psalm 40:3). The *new song* of heaven (Revelation 5:9) is the song the psalmist was given — *a new song in my mouth, even praise unto our Elohim (God).* It is the song of the redeemed, sung by those drawn up out of the pit; and the heavenly choir sings it of the One who *wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9), praise unto our Elohim (God) for the redemption the Lamb has wrought.'),
  ('canon', 'revelation', 5, 10, 'canon', 'revelation', 1, 6, 'free', E'*And hath made us kings and priests unto Elohim (God) and his Father; to him be glory and dominion for ever and ever. Amen* (Revelation 1:6). What the book opened with, the new song now sings: *and hast made us unto our Elohim (God) kings and priests* (Revelation 5:10). And mark how the opening verse distinguishes the Formed from the Father even as it names the gift — the Lamb made us kings and priests *unto Elohim (God) and his Father.* He is the One who has a Father; his blood makes the redeemed a royal priesthood unto the Elohim (God) who is also his Father.'),
  ('canon', 'revelation', 5, 9, 'canon', 'revelation', 1, 5, 'free', E'*And from Yahusha HaMashiach (Jesus Christ), who is the faithful witness, and the first begotten of the dead, and the prince of the kings of the earth. Unto him that loved us, and washed us from our sins in his own blood* (Revelation 1:5). The new song''s *thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9) is the same redemption the book named at the first: *washed us from our sins in his own blood.* The blood of the slain Lamb is the price of the redemption — his own blood poured out, by which the gathered are washed and bought back to Elohim (God).'),
  -- thread: revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7
  ('canon', 'revelation', 5, 11, 'canon', 'daniel', 7, 10, 'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). John''s count of the worshippers is Daniel''s exact number: *the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11). The myriads who stood before the Ancient of days in Daniel''s throne-vision are the myriads round about the throne in John''s — and where Daniel saw *the books were opened,* John sees the sealed book opened by the Lamb. The same heavenly court, the same uncountable host, gathered now to cry *Worthy is the Lamb that was slain* (Revelation 5:12).'),
  ('canon', 'revelation', 5, 11, 'enoch', '1-enoch', 40, 1, 'extras', E'*And after that I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits* (1 Enoch 40:1). The Hebrew library saw the same innumerable host before the throne that John saw: *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits.* John''s *ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11) breathes the same air — the countless angelic court round the throne, lifting praise. Enoch heard their voices bless *Yahuah (God) of Spirits* and bless *the Elect One* beside him (1 Enoch 40:5); John hears them cry *Worthy is the Lamb that was slain* (Revelation 5:12) — the One on the throne and the Elect One, the Father and the slain Lamb, praised together by the myriads.'),
  ('canon', 'revelation', 5, 11, 'enoch', '1-enoch', 14, 21, 'extras', E'*And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 14:21). In the same throne-vision where Enoch saw the mountain *like the throne of Yahuah (God)* (1 Enoch 14:15) and the columns of heavenly fire, the measure *ten thousand* sounds — the very scale John reaches for at the throne: *ten thousand times ten thousand* (Revelation 5:11). The myriad-numbered host of heaven and the ten-thousand reckonings of the throne-vision are the world Revelation 5 stands in: the innumerable court gathered before the One who sits, now lifting its voice to the Lamb.'),
  -- thread: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
  ('canon', 'revelation', 5, 13, 'canon', 'philippians', 2, 10, 'free', E'*That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The whole creation''s worship of the Lamb is Paul''s *every knee should bow... of things in heaven, and things in earth, and things under the earth* — the same threefold sweep: *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). To the slain Lamb, exalted and given the name above every name, all that is bows.'),
  ('canon', 'revelation', 5, 13, 'canon', 'philippians', 2, 11, 'free', E'*And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11). Here is the Christology held exactly: every tongue confesses the Lamb *to the glory of Elohim (God) the Father.* In John''s vision the worship goes *unto him that sitteth upon the throne, and unto the Lamb* (Revelation 5:13) — the Father and the Formed Son, two and distinguished, the Lamb who *came and took the book out of the right hand of him that sat upon the throne* (Revelation 5:7) — and yet the Lamb receives the same blessing and honour and glory and power, for the glory of the exalted Son is the glory of the Father. Worship of the Lamb is not worship of a rival but the Father glorified in him.'),
  ('canon', 'revelation', 5, 12, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The sevenfold acclamation *Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12) is the giving Daniel saw: to the one like the Son of Adam was *given... dominion, and glory, and a kingdom,* that all should serve him, *an everlasting dominion.* The Lamb who receives power and glory and an everlasting reign is the Son of Adam of Daniel''s vision, come to the throne to take what is everlastingly his.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2',
       E'The scroll written within and on the backside, sealed with seven seals (Ezekiel 2, Isaiah 29, Daniel 12)',
       E'John''s vision opens with a book no creature can open: *And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* (Revelation 5:1). Every line of it is drawn from the prophets. The roll itself is Ezekiel''s — *and, lo, a roll of a book was therein* (Ezekiel 2:9), and Ezekiel saw it just as John does: *it was written within and without: and there was written therein lamentations, and mourning, and woe* (Ezekiel 2:10) — a scroll crammed full on both faces, the overflowing decree of Yahuah (LORD). The sealing is Isaiah''s: *the vision of all is become unto you as the words of a book that is sealed, which men deliver to one that is learned, saying, Read this, I pray thee: and he saith, I cannot; for it is sealed* (Isaiah 29:11) — the helplessness John weeps over, *and no man in heaven, nor in earth, neither under the earth, was able to open the book* (Revelation 5:3). The learned cannot, the unlearned cannot; no creature can break it. And the term of the sealing is Daniel''s: *shut up the words, and seal the book, even to the time of the end* (Daniel 12:4). So the book stayed shut, and John *wept much, because no man was found worthy* (Revelation 5:4). But the seal was set *to the time of the end* — and the time has come. *Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5). The prophetic scroll the prophets themselves were told to seal is the scroll the slain Lamb alone is worthy to open.',
       sv.verse_id, ev.verse_id, 'free', 9100
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49',
       E'The Lion of the tribe of Juda, the Root of David, hath prevailed (Genesis 49, Isaiah 11)',
       E'The elder answers John''s weeping with two titles, and both are the prophets'' own: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5). *The Lion of the tribe of Juda* is Jacob''s dying blessing over his fourth son — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9) — and that same blessing names the King who would come of the tribe and the gathering that would be his: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The Lion who prevails is Shiloh come, the rightful King of Yahudah''s (Judah''s) line. *The Root of David* is Isaiah''s — *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), and *in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* (Isaiah 11:10). Mark the title: not merely a branch from the root but *the Root of David* itself — the One from whom David sprang and in whom David''s house stands, the ensign the gathered seek. The Lion who conquers and the Root who is set up for a banner are one: the Messiah of Yahudah''s (Judah''s) line, who *hath prevailed,* and whose blood would draw the redeemed *out of every kindred, and tongue, and people, and nation* (Revelation 5:9), the gathering of the people come home to their King.',
       sv.verse_id, ev.verse_id, 'free', 9103
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53',
       E'A Lamb as it had been slain, with seven horns and seven eyes (Isaiah 53, Exodus 12, Zechariah 3 and 4, John 1)',
       E'John turns to see the Lion and beholds a Lamb — and the whole gospel is in the turning. *And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The Lion of Yahudah (Judah) prevails not by devouring but by being slain. This is Isaiah''s lamb: *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7) — the suffering servant who *bare the sin of many* (Isaiah 53:12). It is the Passover lamb: *the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6), the lamb without blemish whose blood turned aside the destroyer — so the slain Lamb *wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9). The Witness at the Jordan had already pointed to him: *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29) — the Lamb hailed at his coming is the Lamb enthroned, slain and yet standing. And the *seven eyes* are the eyes of Yahuah (LORD) himself: *they are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10), the *seven eyes* engraved upon the one stone beside the promise *I will remove the iniquity of that land in one day* (Zechariah 3:9). The Formed bears what is the Father''s own — the seven-fold Spirit, the all-seeing eyes, sent forth into all the earth. The slain Lamb who carries the eyes of Yahuah (LORD) and takes away the world''s sin is the slain-yet-reigning One: the Lion who is the Lamb.',
       sv.verse_id, ev.verse_id, 'free', 9106
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19',
       E'Thou hast redeemed us and made us kings and priests — the new song (Exodus 19, Psalms 33 and 40, Revelation 1)',
       E'When the Lamb takes the book, heaven breaks into a new song, and its words are the covenant''s own. *And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation; And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:9-10). The *new song* is the song the psalms summon — *sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3) — the song of the redeemed drawn up out of the pit: *he hath put a new song in my mouth, even praise unto our Elohim (God)* (Psalm 40:3). A new song is sung for a new and mighty work, and the work here is the blood of the slain Lamb. And the crown of the song — *made us unto our Elohim (God) kings and priests* — is the Sinai vocation restored: *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6), the word Yahuah (LORD) spoke to the children of Yashar''el (Israel) at the mount. The Lamb''s blood does not make a new people in Israel''s place; it brings the covenant people into the priestly kingship they were always called to. The book named it at the first — *washed us from our sins in his own blood* (Revelation 1:5), and *hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6) — and the new song sings it before the throne. Mark even here the Christology: the redeemed are made kings and priests *unto our Elohim (God),* unto *Elohim (God) and his Father* — the Lamb is the One who has a Father, and his blood makes the gathered a royal priesthood unto the Elohim (God) who is also his Father.',
       sv.verse_id, ev.verse_id, 'free', 9109
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7',
       E'Ten thousand times ten thousand — the myriads before the throne (Daniel 7, 1 Enoch)',
       E'Around the throne John hears a host beyond counting take up the praise of the Lamb: *And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11). The count is Daniel''s, word for word: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). The myriads who stood before the Ancient of days in Daniel''s throne-vision are the myriads round about the throne in John''s — and where Daniel saw *the books were opened,* John has just seen the sealed book opened by the Lamb. The same uncountable court appears in the Hebrew library''s throne-visions: *I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits* (1 Enoch 40:1) — and Enoch heard their voices bless *Yahuah (God) of Spirits* and bless *the Elect One* beside him, the very pattern of Revelation 5, where the One on the throne and the Lamb are praised together. The throne-vision world of *ten thousand* reckonings runs through these texts (1 Enoch 14:21). And the host''s cry is the sevenfold acclamation: *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12). The innumerable court that stood before the Father now lifts its voice to the slain Lamb.',
       sv.verse_id, ev.verse_id, 'extras', 9112
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2',
       E'Worthy is the Lamb, worshipped with him that sat on the throne (Philippians 2, Daniel 7)',
       E'The chapter closes with the worship of the whole creation, and it lands on two seated together: *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). The threefold sweep of *every creature... in heaven, and on the earth, and under the earth* is Paul''s: *that at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). And Paul gives the Christology its exact frame: every tongue confesses the Lamb *to the glory of Elohim (God) the Father* (Philippians 2:11). Here is the whole mystery held without collapse. The Lamb *came and took the book out of the right hand of him that sat upon the throne* (Revelation 5:7) — he is not the One on the throne but receives the book from his hand; the Father and the Formed Son are two, distinguished. And yet the worship goes *unto him that sitteth upon the throne, and unto the Lamb* alike — the same blessing and honour and glory and power, for ever and ever. This is no rival worship and no second god; it is the Father glorified in the exalted Son, the slain Lamb who receives what Daniel saw given to the Son of Adam: *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). *Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12) — the slain-yet-reigning Formed, who is Yahuah (LORD) and has a Father, worshipped with him that sat on the throne while *the four and twenty elders fell down and worshipped him that liveth for ever and ever* (Revelation 5:14).',
       sv.verse_id, ev.verse_id, 'free', 9115
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 2:9 — *a roll of a book was therein* the scroll handed forth from heaven, the prophetic roll John sees in the right hand of him on the throne (Revelation 5:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 2:10 — *it was written within and without* the exact shape of John''s scroll *written within and on the backside*, the overflowing decree of judgment (Revelation 5:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 29:11 — *the words of a book that is sealed... I cannot; for it is sealed* the sealed book no man can read, the helplessness John weeps over (Revelation 5:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:4 — *seal the book, even to the time of the end* the term of the sealing; the book stayed shut till the time came, and the Lamb is the One who prevails to open it (Revelation 5:4-5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp* Jacob''s blessing names the lion of the tribe of Yahudah (Judah), the royal beast the elder hails as having prevailed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *until Shiloh come; and unto him shall the gathering of the people be* the sceptre kept in Yahudah (Judah) for Shiloh, the King who gathers the people, the One who prevailed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:1 — *a rod out of the stem of Jesse, and a Branch shall grow out of his roots* the Branch from David''s royal root, the Root of David the elder names (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:10 — *a root of Jesse, which shall stand for an ensign of the people* the Root of David set up as a banner the gathered seek, his blood drawing them from every nation (Revelation 5:5,9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter... so he openeth not his mouth* the suffering servant''s lamb, the Lion who prevails by being slain (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:6 — *the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* the Passover lamb whose blood turned aside the destroyer, the true Passover by whose blood the gathered are redeemed (Revelation 5:6,9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:10 — *the eyes of Yahuah (LORD), which run to and fro through the whole earth* the seven eyes of the Lamb are the eyes of Yahuah (LORD) himself, the Formed bearing the Father''s own (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 3:9 — *upon one stone shall be seven eyes... I will remove the iniquity of that land in one day* the seven eyes on the engraved stone and the iniquity removed in one day foreshadow the slain Lamb bearing the seven Spirits (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:29 — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* the Lamb hailed at the Jordan is the Lamb enthroned, slain and yet standing (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:6 — *ye shall be unto me a kingdom of priests, and an holy nation* the Sinai covenant vocation restored; the Lamb''s blood brings the covenant people into the priestly kingship they were always called to (Revelation 5:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 33:3 — *Sing unto him a new song; play skilfully with a loud noise* the psalm''s summons taken up by the harps of heaven for the new work of the slain Lamb (Revelation 5:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 40:3 — *he hath put a new song in my mouth, even praise unto our Elohim (God)* the song of the redeemed drawn up out of the pit, sung of the One who redeemed us by his blood (Revelation 5:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:6 — *hath made us kings and priests unto Elohim (God) and his Father* the book''s opening word now sung; the Lamb is the One who has a Father, his blood making the gathered a royal priesthood (Revelation 5:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 1:5 — *washed us from our sins in his own blood* the redemption named at the book''s first; the blood of the slain Lamb is the price by which the gathered are bought back to Elohim (God) (Revelation 5:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* John''s count word for word; the myriads before the Ancient of days, where Daniel saw the books opened and John sees the sealed book opened by the Lamb (Revelation 5:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 40:1 — *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits* the Hebrew library''s innumerable court before the throne, whose voices bless both Yahuah (God) of Spirits and the Elect One beside him (Revelation 5:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 14:21 — *bound them till the time when their guilt should be consummated (even) for ten thousand years* the ten-thousand reckonings of Enoch''s throne-vision, the world Revelation 5''s myriad-numbered host stands in (Revelation 5:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:10 — *every knee should bow, of things in heaven, and things in earth, and things under the earth* the threefold sweep of every creature''s worship of the Lamb, the name above every name (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:11 — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* the Christology held without collapse: the Lamb worshipped to the glory of the Father, two and distinguished, not a rival worship (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... an everlasting dominion* the sevenfold acclamation of the Lamb is the giving Daniel saw to the one like the Son of Adam, come to the throne to take what is everlastingly his (Revelation 5:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session224 — Revelation cross-references complete.'
