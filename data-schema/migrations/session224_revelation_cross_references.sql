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

-- ----- fragment: minion_revelation_06.sql (S224 Revelation 6) -----
-- =====================================================================
-- S224 minion — REVELATION 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 6 (17 verses) — THE SIX SEALS opened by the Lamb.
-- Tag: rv06 (temp view _s224_rv06_lookup).
-- Sort band: floor 9125, step 3 (9125, 9128, 9131, 9134, 9137 used; under 9150).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation never says "it is written" — it is woven of allusion. Chapter 6 re-speaks
-- Zechariah's horsemen, the Leviticus-26 / Ezekiel-14 covenant judgments, the prophets' "how long,"
-- and the prophets' day-of-Yahuah cosmic-darkness. The seals are the consummation of the covenant
-- story — the same Yahuah (LORD), the same covenant sanctions the prophets named, the same cry of the
-- slain for vindication, the same dreadful day of his wrath — NOT a dispensational escape-clock. The
-- One on the throne (the Father) and the Lamb (the Formed Son) are distinguished throughout (6:16,
-- *the face of him that sitteth on the throne, and... the wrath of the Lamb*); preserved as the pull
-- gives. The slain *for the word of Elohim (God), and for the testimony which they held* (6:9) are the
-- saints whose blood the covenant-God avenges, the same cry as Psalm 79 and Zechariah 1.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every meaningful verse-block):
--   v.1-8   the four horsemen — white/red/black/pale; sword, famine, death, beasts
--           Tanakh: Zechariah 1:8-11 (the red/speckled/white horses sent to walk to and fro),
--                   Zechariah 6:1-6 (the four chariots, the four spirits of the heavens going forth),
--                   Ezekiel 14:21 (the four sore judgments: sword, famine, noisome beast, pestilence),
--                   Leviticus 26:25-26 (the sword avenging the covenant, the broken staff of bread)
--           Extras: none warranted (the horsemen weave is wholly the prophets' chariot-vision)
--           NT:     none warranted (carried into the day-of-Yahuah cosmic thread at v.12)
--   v.9-11  the souls under the altar slain for the word, crying How long, and given rest
--           Tanakh: Psalm 79:5 + 79:10 (How long... the revenging of the blood of thy servants),
--                   Zechariah 1:12 (O Yahuah of hosts, how long wilt thou not have mercy)
--           Extras: 1 Enoch 47:1-4 (the blood of the righteous, the prayer ascending, the books of
--                   the living, the number of the righteous offered), 2 Esdras 4:35-36 (the souls of
--                   the righteous: How long... until the number of seeds is filled)
--           NT:     none warranted
--   v.12-14 the sun black as sackcloth, the moon as blood, the stars falling, heaven as a scroll
--           Tanakh: Joel 2:31 (sun to darkness, moon to blood before the day of Yahuah), Isaiah 13:10
--                   (the stars... shall not give their light, the sun darkened), Isaiah 34:4 (the host
--                   of heaven dissolved, the heavens rolled as a scroll, the fig falling), Ezekiel 32:7
--                   (I will cover the heaven, the stars dark, the sun covered)
--           Extras: none warranted   NT: Matthew 24:29 (the sun darkened, the moon, the stars fall)
--   v.15-16 the kings and bondmen hide; Fall on us, hide us from the face... and the wrath of the Lamb
--           Tanakh: Hosea 10:8 (say to the mountains, Cover us; and to the hills, Fall on us),
--                   Isaiah 2:19 (into the holes of the rocks for fear of Yahuah and the glory of his majesty)
--           Extras: none warranted   NT: none warranted
--   v.17    the great day of his wrath is come; and who shall be able to stand?
--           Tanakh: Joel 2:11 (the day of Yahuah is great and very terrible; who can abide it),
--                   Zephaniah 1:14-15 (the great day of Yahuah... a day of wrath), Malachi 3:2 (who may
--                   abide the day of his coming? who shall stand when he appeareth?)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9125 revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments  (Tanakh)
--   9128 revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79           (Tanakh + Extras)
--   9131 revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34         (Tanakh + NT)
--   9134 revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2               (Tanakh)
--   9137 revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1        (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments
  ('canon', 'revelation', 6, 2, 'canon', 'zechariah', 1, 8, 'free', E'*I saw by night, and behold a man riding upon a red horse, and he stood among the myrtle trees that were in the bottom; and behind him were there red horses, speckled, and white.* (Zechariah 1:8). The seer of the Apocalypse has Zechariah''s night-vision in his ear: when the Lamb opens the seals and *behold a white horse* goes forth (Revelation 6:2), the coloured horses are the prophet''s own — red, speckled, and white, the riders Yahuah (LORD) appoints to walk through the earth. The horsemen of the seals are no new symbol minted out of nowhere; they re-speak the chariot-vision the covenant-God gave Zechariah of the powers he sends out over the nations.'),
  ('canon', 'revelation', 6, 4, 'canon', 'zechariah', 1, 10, 'free', E'*And the man that stood among the myrtle trees answered and said, These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth.* (Zechariah 1:10). The horses of Zechariah are *they whom Yahuah (LORD) hath sent* — they go forth only at his sending. So when the red horse goes out and *power was given to him that sat thereon to take peace from the earth* (Revelation 6:4), the passive *was given* names the same hand: the rider takes peace because the One on the throne loosed him to do it. The seals are opened by the Lamb; the riders ride by grant; nothing goes forth in the earth but that Yahuah (LORD) has sent it.'),
  ('canon', 'revelation', 6, 5, 'canon', 'zechariah', 6, 1, 'free', E'*And I turned, and lifted up mine eyes, and looked, and, behold, there came four chariots out from between two mountains; and the mountains were mountains of brass.* (Zechariah 6:1). Zechariah''s second horse-vision sets out four chariots, and Revelation''s four seals loose four horses — white, red, black, and pale. When the third seal opens and *lo a black horse* appears (Revelation 6:5), it answers the black horses of the second chariot. The fourfold pattern is the prophet''s: four chariots, four spirits, four winds of judgment going out over the whole earth from before its Master.'),
  ('canon', 'revelation', 6, 5, 'canon', 'zechariah', 6, 5, 'free', E'*And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth.* (Zechariah 6:5). The four chariots are *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* — they stand before him and depart at his word. The four horses of the seals go forth on the same authority: *Yahuah (Lord) of all the earth* sends them out, the powers of judgment loosed from before his throne. The black horse with *a pair of balances in his hand* (Revelation 6:5), weighing out bread by measure, rides as one of these heaven-sent spirits, not as a power that has slipped his Master''s hand.'),
  ('canon', 'revelation', 6, 8, 'canon', 'ezekiel', 14, 21, 'free', E'*For thus saith Adonai Yahuah (the Lord GOD); How much more when I send my four sore judgments upon Jerusalem, the sword, and the famine, and the noisome beast, and the pestilence, to cut off from it man and beast?* (Ezekiel 14:21). The pale horse gathers the four into one: *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). These are Ezekiel''s *four sore judgments* — *the sword, and the famine, and the noisome beast, and the pestilence* — the covenant-sanctions Yahuah (LORD) said he would *send.* Death and Hell ride on the warrant of the same God who told Ezekiel these are mine to send; the seal does not invent the judgments, it looses the ones the prophets had already named.'),
  ('canon', 'revelation', 6, 4, 'canon', 'leviticus', 26, 25, 'free', E'*And I will bring a sword upon you, that shall avenge the quarrel of my covenant: and when ye are gathered together within your cities, I will send the pestilence among you; and ye shall be delivered into the hand of the enemy.* (Leviticus 26:25). The great sword given to the red rider (Revelation 6:4) and the famine of the black rider are the covenant''s own sanctions. *I will bring a sword upon you, that shall avenge the quarrel of my covenant* — the sword is not random violence but the covenant-God''s answer to covenant-breaking, and the pestilence rides with it, the very *death* that follows the pale horse. The seals loose the judgments Leviticus 26 had warned would come.'),
  ('canon', 'revelation', 6, 6, 'canon', 'leviticus', 26, 26, 'free', E'*And when I have broken the staff of your bread, ten women shall bake your bread in one oven, and they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied.* (Leviticus 26:26). The black horse''s voice cries *A measure of wheat for a penny, and three measures of barley for a penny* (Revelation 6:6) — bread doled out by weight at a famine-price, a day''s wage for a day''s grain. This is the broken *staff of bread* of the covenant curse: *they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied.* The scarcity the third seal opens is the famine-sanction Leviticus named, measured bread that cannot fill.'),
  -- thread: revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79
  ('canon', 'revelation', 6, 10, 'canon', 'psalms', 79, 5, 'free', E'*How long, Yahuah (LORD)? wilt thou be angry for ever? shall thy jealousy burn like fire?* (Psalm 79:5). The souls under the altar cry the psalmist''s own cry: *How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The slain of Psalm 79, whose blood was *shed like water round about Jerusalem,* asked *how long?* — and the martyrs under the altar take up the same words. The cry is not for private revenge but for the holy and true God to vindicate his covenant and his slain, the prayer the prophets and psalmists had always prayed.'),
  ('canon', 'revelation', 6, 10, 'canon', 'psalms', 79, 10, 'free', E'*Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* (Psalm 79:10). The psalm asks Yahuah (LORD) for *the revenging of the blood of thy servants which is shed* — the exact plea of the souls who cry *dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The blood of the servants crying for vindication is one continuous cry from the psalm to the seal: the covenant-God will not leave the blood of his slain unanswered, nor let the nations say *Where is their Elohim (God)?* for ever.'),
  ('canon', 'revelation', 6, 10, 'canon', 'zechariah', 1, 12, 'free', E'*Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* (Zechariah 1:12). In the same horse-vision Revelation 6 re-speaks, the angel of Yahuah (LORD) cries *how long wilt thou not have mercy* — and the souls under the altar cry *How long, O Yahuah (Lord), holy and true* (Revelation 6:10). The *how long?* of the heavenly intercessor and the *how long?* of the martyrs are the same plea: that the God who has long held back would now arise and vindicate his people and his covenant.'),
  ('canon', 'revelation', 6, 9, 'enoch', '1-enoch', 47, 1, 'extras', E'*And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1). Enoch saw the same altar-scene: the blood of the righteous ascending from the earth before the throne. Under the altar John sees *the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9). The slain do not lie silent — their blood and their prayer go up together before Yahuah (God) of Spirits, the cry of the martyrs reaching the throne, exactly as the Hebrew library had pictured it.'),
  ('canon', 'revelation', 6, 10, 'enoch', '1-enoch', 47, 4, 'extras', E'*And the hearts of the holy were filled with joy; Because the number of the righteous had been offered, And the prayer of the righteous had been heard, And the blood of the righteous been required before Yahuah (God) of Spirits.* (1 Enoch 47:4). Enoch hears the answer the souls under the altar are waiting for: the blood of the righteous *required* — that is, avenged and accounted for — once *the number of the righteous had been offered.* The martyrs cry *dost thou not judge and avenge our blood* (Revelation 6:10), and are told to *rest yet for a little season, until... their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The rest and the full number are the same answer Enoch already records: the blood is required once the number is complete.'),
  ('canon', 'revelation', 6, 11, 'apocrypha', '2-esdras', 4, 35, 'extras', E'*Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* (2 Esdras 4:35). Ezra is shown the very scene of the fifth seal: *the souls of the righteous* in their chambers asking *How long?* — the same cry as the souls under the altar (Revelation 6:10), and the answer is the same as theirs. They are told to *rest yet for a little season, until... their brethren... should be fulfilled* (Revelation 6:11); Ezra is told the reward waits *even when the number of seeds is filled.* The waiting-souls and the appointed number are one teaching across the library.'),
  ('canon', 'revelation', 6, 11, 'apocrypha', '2-esdras', 4, 36, 'extras', E'*And to these things Uriel the archangel gave them answer, and said, Even when the number of seeds is filled in you: for he has weighed the world in the balance.* (2 Esdras 4:36). The answer given to the souls in Esdras is the answer given under the altar: the vindication comes *when the number of seeds is filled.* The martyrs must *rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The filling of the appointed number — the full harvest of the righteous and the martyred — is the hinge on which the judgment turns in both witnesses; the season of rest is measured, not endless.'),
  -- thread: revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34
  ('canon', 'revelation', 6, 12, 'canon', 'joel', 2, 31, 'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). The sixth seal is Joel''s day spoken almost word for word: *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). Joel had said *the sun... into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD).* The seal does not announce a strange new portent; it brings to pass the day-of-Yahuah signs the prophet named, the heavens themselves darkened and bloodied before the dread day breaks.'),
  ('canon', 'revelation', 6, 13, 'canon', 'isaiah', 13, 10, 'free', E'*For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine.* (Isaiah 13:10). Isaiah''s day-of-Yahuah oracle darkens the same lights: *the stars of heaven... shall not give their light: the sun shall be darkened.* So at the sixth seal *the stars of heaven fell unto the earth* (Revelation 6:13). The cosmic darkening that runs through Isaiah''s and Joel''s day-of-Yahuah is gathered into the opening of the seal — the same heavens, the same shaking, the same dread day announced by the prophets.'),
  ('canon', 'revelation', 6, 14, 'canon', 'isaiah', 34, 4, 'free', E'*And all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll: and all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree.* (Isaiah 34:4). Two of Isaiah''s images stand together in one verse of the seal: *the heaven departed as a scroll when it is rolled together* and the stars fell *even as a fig tree casteth her untimely figs* (Revelation 6:13-14). Isaiah had said *the heavens shall be rolled together as a scroll,* their host falling *as a falling fig from the fig tree.* The seer is reading Isaiah''s day-of-Yahuah straight onto the page: the sky rolled up, the stars dropping like late figs in the wind.'),
  ('canon', 'revelation', 6, 12, 'canon', 'ezekiel', 32, 7, 'free', E'*And when I shall put thee out, I will cover the heaven, and make the stars thereof dark; I will cover the sun with a cloud, and the moon shall not give her light.* (Ezekiel 32:7). Ezekiel''s lament over the fall of a great power darkens the very same heavens: *I will cover the heaven, and make the stars thereof dark; I will cover the sun.* At the sixth seal *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). The covenant-God who darkened the heavens over the proud in Ezekiel''s day darkens them again at the seal — the day-of-Yahuah register the prophets share, the lights of heaven veiled when he arises to judge.'),
  ('canon', 'revelation', 6, 12, 'canon', 'matthew', 24, 29, 'free', E'*Immediately after the tribulation of those days shall the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven, and the powers of the heavens shall be shaken:* (Matthew 24:29). The Master himself gathered Joel and Isaiah into one saying: *the sun be darkened... the moon... the stars shall fall from heaven.* The sixth seal speaks his words back — *the sun became black as sackcloth... and the moon became as blood; and the stars of heaven fell unto the earth* (Revelation 6:12-13). The same cosmic signs the prophets foretold and Yahusha (Jesus) re-spoke now open before John; the seal, the olivet-word, and the prophets witness to one dreadful day.'),
  -- thread: revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2
  ('canon', 'revelation', 6, 16, 'canon', 'hosea', 10, 8, 'free', E'*The high places also of Aven, the sin of Yashar''el (Israel), shall be destroyed: the thorn and the thistle shall come up on their altars; and they shall say to the mountains, Cover us; and to the hills, Fall on us.* (Hosea 10:8). The cry of the terrified at the sixth seal is Hosea''s word: they *said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne* (Revelation 6:16). Hosea''s guilty *shall say to the mountains, Cover us; and to the hills, Fall on us* — the men who would sooner be crushed by a mountain than face the throne. The prophet had given the very words the kings and bondmen now scream when the day of wrath breaks.'),
  ('canon', 'revelation', 6, 15, 'canon', 'isaiah', 2, 19, 'free', E'*And they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth.* (Isaiah 2:19). Isaiah saw the proud flee to the rocks: *into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD).* So at the seal *the kings of the earth, and the great men... hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). The great earthquake of the seal is Isaiah''s *when he ariseth to shake terribly the earth* — and the mighty who would not bow now hide in the rocks before the face of the One on the throne and the wrath of the Lamb.'),
  -- thread: revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1
  ('canon', 'revelation', 6, 17, 'canon', 'joel', 2, 11, 'free', E'*And Yahuah (LORD) shall utter his voice before his army: for his camp is very great: for he is strong that executeth his word: for the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). The seal closes with Joel''s own question: *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Joel had asked of *the day of Yahuah (LORD)* — *great and very terrible* — *and who can abide it?* The unanswered question hangs over both: the day of wrath has come, and no power of man, from the kings to the bondmen, can stand against the face of the One who sits on the throne.'),
  ('canon', 'revelation', 6, 17, 'canon', 'zephaniah', 1, 14, 'free', E'*The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly.* (Zephaniah 1:14). The seal''s *great day of his wrath* (Revelation 6:17) is Zephaniah''s *great day of Yahuah (LORD)* — near, hastening, when *the mighty man shall cry there bitterly.* And it is precisely the mighty who cry at the seal: the *great men, and the rich men, and the chief captains, and the mighty men* hiding in the rocks (Revelation 6:15). The prophet named the day and named who would wail in it; the seal brings it to pass.'),
  ('canon', 'revelation', 6, 17, 'canon', 'zephaniah', 1, 15, 'free', E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* (Zephaniah 1:15). Zephaniah calls it outright *a day of wrath* — the very name the seal gives: *the great day of his wrath is come* (Revelation 6:17). The darkness and thick clouds the prophet heaps up are the darkened sun and bloodied moon of the sixth seal; the seal is the day Zephaniah saw, the wrath-day of Yahuah (LORD) breaking on a world that cannot stand before it.'),
  ('canon', 'revelation', 6, 17, 'canon', 'malachi', 3, 2, 'free', E'*But who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire, and like fullers'' soap:* (Malachi 3:2). Malachi asks the seal''s closing question word for word: *who shall stand when he appeareth?* — and the seal answers, *who shall be able to stand?* (Revelation 6:17). The day of his coming, the refiner''s fire, is the day of wrath; none can abide it of themselves. The question the prophet left ringing is the question the seal leaves ringing, and only those refined and held by him will stand when he appears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments',
       E'The four horsemen of the seals — Zechariah''s chariots and the covenant judgments (Zechariah 1 and 6, Ezekiel 14, Leviticus 26)',
       E'When the Lamb opens the first four seals, four horses go forth — *behold a white horse* (Revelation 6:2), *another horse that was red* (6:4), *a black horse* with *a pair of balances* (6:5), and *a pale horse: and his name that sat on him was Death, and Hell followed with him* (6:8). The seer is not minting a new symbol; he has Zechariah''s night-visions in his ear. Zechariah saw *a man riding upon a red horse... and behind him were there red horses, speckled, and white* (Zechariah 1:8), and was told *These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* (Zechariah 1:10) — the horses go forth only at the sending of the covenant-God. And he saw *four chariots* (Zechariah 6:1), named *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (Zechariah 6:5). The fourfold horse-pattern, the colours, the going-forth from before the throne — all of it is the prophet''s. So the passive *power was given* over each rider (6:4, 6:8) names the same hand: nothing rides in the earth but that *Yahuah (Lord) of all the earth* has loosed it. And the judgments themselves are the covenant''s own. The pale horse kills *with sword, and with hunger, and with death, and with the beasts of the earth* (6:8) — Ezekiel''s *four sore judgments... the sword, and the famine, and the noisome beast, and the pestilence* (Ezekiel 14:21), the very things Yahuah (LORD) said *I send.* The great sword given the red rider is the covenant-sword: *I will bring a sword upon you, that shall avenge the quarrel of my covenant* (Leviticus 26:25). The black rider''s cry *A measure of wheat for a penny* (6:6) is the broken staff of bread — *they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* (Leviticus 26:26). The seals do not invent the judgments; they loose the covenant-sanctions the Torah and the prophets had long since named, sent out from before the throne of the Master of all the earth.',
       sv.verse_id, ev.verse_id, 'free', 9125
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79',
       E'The souls under the altar crying How long, and the rest given (Psalm 79, Zechariah 1, 1 Enoch 47, 2 Esdras 4)',
       E'The fifth seal opens on an altar-scene the Hebrew library had already seen. *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held: And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:9-10). The cry is the psalmist''s: *How long, Yahuah (LORD)? wilt thou be angry for ever?* (Psalm 79:5), and the plea for *the revenging of the blood of thy servants which is shed* (Psalm 79:10) — not a cry for private vengeance but for the holy and true God to vindicate his covenant and his slain. It is the angel''s cry in the very horse-vision this chapter re-speaks: *O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy?* (Zechariah 1:12). And the restored library pictures the same altar: *the blood of the righteous from the earth before Yahuah (God) of Spirits* (1 Enoch 47:1), the prayer of the slain ascending — and the answer, that the blood of the righteous is *required* once *the number of the righteous had been offered* (1 Enoch 47:4). So too Ezra: *the souls... of the righteous ask question... saying, How long shall I hope on this fashion?* (2 Esdras 4:35), and are told the reward comes *even when the number of seeds is filled* (2 Esdras 4:36). This is exactly the answer given under the altar: *white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The martyrs are not silenced and not forgotten; they are robed, given rest, and told the day waits only on the filling of the appointed number. The blood will be required; the season is measured, not endless.',
       sv.verse_id, ev.verse_id, 'extras', 9128
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34',
       E'The sun black, the moon as blood, the heaven rolled as a scroll — the day of Yahuah (LORD) (Joel 2, Isaiah 13 and 34, Ezekiel 32, Matthew 24)',
       E'The sixth seal is the prophets'' day-of-Yahuah spoken almost word for word. *The sun became black as sackcloth of hair, and the moon became as blood; And the stars of heaven fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty wind; And the heaven departed as a scroll when it is rolled together* (Revelation 6:12-14). Joel had said it: *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). Isaiah had said it: *the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened* (Isaiah 13:10), and *the heavens shall be rolled together as a scroll: and all their host shall fall down... as a falling fig from the fig tree* (Isaiah 34:4) — the seer reads Isaiah''s scroll and Isaiah''s falling fig straight onto the page. Ezekiel had said it over the fall of a proud power: *I will cover the heaven, and make the stars thereof dark; I will cover the sun* (Ezekiel 32:7). And the Master himself gathered them all into one saying: *the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven, and the powers of the heavens shall be shaken* (Matthew 24:29). The seal does not announce a strange new portent — it brings to pass the cosmic signs Joel, Isaiah, and Ezekiel named and Yahusha (Jesus) re-spoke: the heavens veiled and shaken when Yahuah (LORD) arises to judge, the dreadful day of his coming breaking over the whole earth.',
       sv.verse_id, ev.verse_id, 'free', 9131
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2',
       E'Fall on us, hide us from the face of him on the throne and the wrath of the Lamb (Hosea 10, Isaiah 2)',
       E'When the sixth seal breaks, the great of the earth flee to the rocks, and the words on their lips are the prophets''. *The kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains; And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb* (Revelation 6:15-16). Hosea had given them the cry: the guilty *shall say to the mountains, Cover us; and to the hills, Fall on us* (Hosea 10:8) — men who would sooner be buried under a mountain than face the throne. Isaiah had given them the hiding-place: *they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth* (Isaiah 2:19) — and the great earthquake of the seal is precisely that shaking. Mark what they flee: *the face of him that sitteth on the throne, and... the wrath of the Lamb.* The One on the throne and the Lamb are named together and distinguished — the Father who sits, and the Formed Son whose wrath is now revealed, the slain Lamb who is also the Lion. The proud who would not bow to him now beg the rocks to fall on them rather than meet his face. The prophets put the words in their mouths long before the seal was opened.',
       sv.verse_id, ev.verse_id, 'free', 9134
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1',
       E'The great day of his wrath is come, and who shall be able to stand? (Joel 2, Zephaniah 1, Malachi 3)',
       E'The seal closes on a question the prophets had left ringing for centuries: *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Joel had asked it of the day of Yahuah (LORD): *the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). Zephaniah had named the day by the very name the seal gives it — *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly... the mighty man shall cry there bitterly* (Zephaniah 1:14), *That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). And it is precisely the mighty who cry at the seal, the *great men, and the rich men, and the chief captains, and the mighty men* hiding in the rocks (Revelation 6:15); the darkness Zephaniah heaped up is the darkened sun and bloodied moon of the sixth seal. Malachi had asked the closing question almost word for word: *who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire* (Malachi 3:2). The seal answers his question with the same question — *who shall be able to stand?* No power of man can abide the day of wrath of itself; the refiner''s fire is upon the whole earth, and only those refined and held by him will be left standing when he appears.',
       sv.verse_id, ev.verse_id, 'free', 9137
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 1:8 — *a man riding upon a red horse... and behind him were there red horses, speckled, and white* the night-vision the seer re-speaks; the coloured horses of the seals are the prophet''s own (Revelation 6:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 1:10 — *These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* the horses go forth only at his sending; the rider takes peace because the throne loosed him (Revelation 6:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 6:1 — *there came four chariots out from between two mountains* the fourfold horse-pattern of the seals is the prophet''s four chariots (Revelation 6:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 6:5 — *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* the horses ride from before the throne, sent by the Master of all the earth (Revelation 6:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 14:21 — *my four sore judgments... the sword, and the famine, and the noisome beast, and the pestilence* the pale horse gathers the four covenant-judgments Yahuah (LORD) said he would send (Revelation 6:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 26:25 — *I will bring a sword upon you, that shall avenge the quarrel of my covenant* the red rider''s great sword is the covenant-sword answering covenant-breaking (Revelation 6:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Leviticus 26:26 — *they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* the black rider''s measured famine-bread is the broken staff of bread of the covenant curse (Revelation 6:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:5 — *How long, Yahuah (LORD)? wilt thou be angry for ever?* the psalmist''s cry, the very words of the souls under the altar (Revelation 6:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:10 — *the revenging of the blood of thy servants which is shed* the exact plea of the martyrs, that the covenant-God avenge his slain (Revelation 6:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 1:12 — *O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy* the angel''s how-long in the same horse-vision; one continuous cry with the martyrs'' (Revelation 6:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 47:1 — *the blood of the righteous from the earth before Yahuah (God) of Spirits* the same altar-scene, the blood and prayer of the slain ascending to the throne (Revelation 6:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 47:4 — *the blood of the righteous been required... Because the number of the righteous had been offered* the answer the martyrs await: the blood is avenged once the number is complete (Revelation 6:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 4:35 — *the souls also of the righteous... saying, How long shall I hope on this fashion?* the same waiting-souls asking how long, given the same answer of a measured season (Revelation 6:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Esdras 4:36 — *Even when the number of seeds is filled in you* the vindication waits on the filling of the appointed number, exactly as the martyrs are told to rest until their brethren be fulfilled (Revelation 6:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD)* the sixth seal speaks Joel''s day almost word for word (Revelation 6:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 13:10 — *the stars of heaven... shall not give their light: the sun shall be darkened* Isaiah''s day-of-Yahuah darkening, gathered into the seal as the stars fall (Revelation 6:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 34:4 — *the heavens shall be rolled together as a scroll... as a falling fig from the fig tree* the seer reads Isaiah''s scroll and falling fig straight onto the page (Revelation 6:13-14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 32:7 — *I will cover the heaven, and make the stars thereof dark; I will cover the sun* the covenant-God darkens the heavens over the proud, the same day-of-Yahuah register (Revelation 6:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=32 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 24:29 — *the sun be darkened... the stars shall fall from heaven, and the powers of the heavens shall be shaken* the Master gathered Joel and Isaiah into one saying the seal speaks back (Revelation 6:12-13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 10:8 — *they shall say to the mountains, Cover us; and to the hills, Fall on us* the prophet''s cry on the lips of the terrified at the seal (Revelation 6:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 2:19 — *into the holes of the rocks... for fear of Yahuah (LORD)... when he ariseth to shake terribly the earth* the great earthquake of the seal is Isaiah''s shaking; the proud flee to the rocks (Revelation 6:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:11 — *the day of Yahuah (LORD) is great and very terrible; and who can abide it?* the unanswered question Joel left ringing, now closing the seal (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 1:14 — *The great day of Yahuah (LORD) is near... the mighty man shall cry there bitterly* the prophet names the day and names who would wail; the mighty cry at the seal (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zephaniah 1:15 — *That day is a day of wrath... a day of darkness and gloominess, a day of clouds and thick darkness* the seal''s day of wrath is Zephaniah''s, the darkness of the sixth seal (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:2 — *who may abide the day of his coming? and who shall stand when he appeareth?* the prophet''s question the seal answers with the same question (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_07.sql (S224 Revelation 7) -----
-- =====================================================================
-- S224 minion — REVELATION 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 7 (17 verses) — the 144,000 sealed of all the tribes, and the great
--          multitude no man could number. HIGH-VOICE-RISK BLESSING CHAPTER: the two-house
--          regathering.
-- Tag: rv07 (temp view _s224_rv07_lookup).
-- Sort band: floor 9150, step 3 (9150, 9153, 9156, 9159, 9162, 9165, 9168 used; under 9175).
-- Source is ALWAYS the canon Revelation 7 verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the two-house / regathering of all Yashar'el (Israel)):
-- Revelation 7 is not a symbolic number erasing the tribes, and not a separate gentile church
-- replacing Yashar'el (Israel). It is the consummation of the prophetic gathering: the seal of the
-- living Elohim (God) set in the foreheads of the righteous (7:3 / Ezekiel 9:4, the mark on those
-- who sigh for the abominations; Exodus 12:13, the protecting token of the blood) — then *an
-- hundred and forty and four thousand of all the tribes of the children of Yashar'el (Israel)*
-- named tribe by tribe (7:4-8), Joseph and Manasses standing for the northern house, Dan omitted.
-- This is the two sticks become one in Yahuah's (LORD's) hand — Yahudah (Judah) and Ephraim/Joseph
-- reunited (Ezekiel 37:15-28). Then *a great multitude, which no man could number, of all nations*
-- with white robes and palms (7:9) — the scattered seed of Yashar'el (Israel) gathered home from
-- among the nations (Hosea 1:10, *the number of the children of Yashar'el (Israel) shall be as the
-- sand of the sea... ye are the sons of the living Elohim (God)*; Genesis 13:16, 15:5, the
-- innumerable seed promised), the Sukkot palms of Leviticus 23:40. *He that sitteth on the throne*
-- and *the Lamb* are distinguished — the Father and the Formed Son — and worship goes to the One
-- (7:10-11). The Lamb feeds and leads them to living fountains (7:17 / Ezekiel 34:23, Isaiah 49:10,
-- Psalm 23:1-2); Elohim (God) wipes away all tears (7:17 / Isaiah 25:8) and tabernacles among them
-- (7:15 / Ezekiel 37:26-27). NO dispensational rapture-escape, NO replacement church, NO spiritualized
-- number that erases the paternal-blood tribes.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the four winds held, the seal of the living Elohim in the foreheads
--           Tanakh: Ezekiel 9:4 (set a mark upon the foreheads of the men that sigh), Ezekiel 9:6
--                   (come not near any upon whom is the mark), Exodus 12:13 (the blood a token)
--           Extras: 2 Esdras 2:38 (behold the number of those that be sealed)
--           NT: none warranted (the seal carried into the tribes thread; cf. Rev 14:1 is a later chapter)
--   v.4-8   an hundred and forty and four thousand of all the tribes of Yashar'el
--           Tanakh: Ezekiel 37:16-17 (the two sticks made one), 37:19 (one in mine hand), 37:21
--                   (gather from among the heathen), 37:22 (one nation, no more two), 37:27
--                   (my tabernacle with them)
--           Extras: 2 Esdras 2:38 (the number sealed) carried at v.1-3; the regathering witnessed
--                   by Tobit 13:5 (gather us out of all nations) carried at v.9
--           NT: none warranted (Revelation 14:1 the same 144,000 is a later chapter, not yet built)
--   v.9     a great multitude no man could number, white robes and palms, of all nations
--           Tanakh: Hosea 1:10 (the number as the sand of the sea, ye are the sons of the living
--                   Elohim), Genesis 13:16 (thy seed as the dust), Genesis 15:5 (tell the stars),
--                   Leviticus 23:40 (boughs of palm trees, rejoice before Yahuah)
--           Extras: 2 Esdras 2:42 (a great people whom I could not number), 2:45 (crowned, receive
--                   palms), Tobit 13:5 (gather us out of all nations), Baruch 5:5 (children gathered
--                   from the west to the east)
--           NT: none warranted
--   v.10-12 salvation to our Elohim which sitteth on the throne, and unto the Lamb; worship
--           Tanakh: none warranted (the throne-and-Lamb distinction is internal/Christological;
--                   carried in prose against Rev 4-5)
--           Extras: 2 Esdras 2:47 (It is the Son of Yahuah, whom they have confessed) — the Son
--                   distinguished, crowning the gathered
--           NT: Revelation 5:13 (blessing... unto him that sitteth upon the throne, and unto the
--               Lamb — the Father and the Formed Son distinguished, the same worship)
--   v.13-15 they came out of great tribulation, washed their robes; before the throne, serve in
--           his temple; he that sitteth on the throne shall dwell among them
--           Tanakh: Ezekiel 37:26 (set my sanctuary in the midst of them), 37:27 (my tabernacle
--                   with them, I will be their Elohim)
--           Extras: none warranted   NT: carried in the throne thread
--   v.16-17 the Lamb shall feed them and lead them to living fountains; Elohim shall wipe all tears
--           Tanakh: Ezekiel 34:23 (one shepherd, my servant David, he shall feed them), Isaiah
--                   49:10 (they shall not hunger nor thirst... by the springs of water shall he
--                   guide them), Psalm 23:1-2 (Yahuah Ra'ah... still waters), Isaiah 25:8 (wipe
--                   away tears from off all faces)
--           Extras: none warranted   NT: none warranted (the shepherd-root is the Tanakh weight)
--
-- THREADS (slug -> target libraries):
--   9150 revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9      (Tanakh + Extras)
--   9153 revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37                          (Tanakh + Extras)  [CENTERPIECE]
--   9156 revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1                        (Tanakh + Extras)  [CENTERPIECE]
--   9159 revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23                              (Tanakh + Extras)
--   9162 revelation-7-salvation-to-our-elohim-and-the-lamb-the-throne-and-the-slain-lamb-revelation-5        (Extras + NT)
--   9165 revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34                  (Tanakh)
--   9168 revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25                   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9
  ('canon', 'revelation', 7, 3, 'canon', 'ezekiel', 9, 4, 'free', E'*And Yahuah (LORD) said unto him, Go through the midst of the city, through the midst of Jerusalem, and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof.* (Ezekiel 9:4). This is the very picture the seer re-speaks: *Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3). The mark on the forehead is the old protecting sign — set on the righteous who grieve over the abominations, before the judgment is loosed on the land. The seal of the living Elohim (God) does the same work: it marks out his servants for keeping, so that the four winds are held back until every one of his is sealed.'),
  ('canon', 'revelation', 7, 3, 'canon', 'ezekiel', 9, 6, 'free', E'*Slay utterly old and young, both maids, and little children, and women: but come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house.* (Ezekiel 9:6). The mark divides the kept from the struck: *come not near any man upon whom is the mark.* So the sealing of Revelation 7 stays the destroying winds — *Hurt not the earth... till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3). The seal is no decoration; it is the line the judgment will not cross. They that bear it are passed over, exactly as Ezekiel''s marked were spared while the city fell.'),
  ('canon', 'revelation', 7, 2, 'canon', 'exodus', 12, 13, 'free', E'*And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* (Exodus 12:13). The seal of Revelation 7 stands in the line of the passover token — *another angel ascending from the east, having the seal of the living Elohim (God)* (Revelation 7:2). As the blood on the lintel was a sign that the destroyer should pass over the house, so the seal on the forehead is the sign that the four winds should not touch the servant of Elohim (God). The mark of the Lamb''s blood keeps his people in the night of judgment.'),
  ('canon', 'revelation', 7, 3, 'apocrypha', '2-esdras', 2, 38, 'extras', E'*Arise up and stand, behold the number of those that be sealed in the feast of Yahuah (God);* (2 Esdras 2:38). The Hebrew library carries the same sealed company the seer counts: *till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3), *and I heard the number of them which were sealed* (Revelation 7:4). Esdras is bidden to *behold the number of those that be sealed* — a fixed, counted, kept people, gathered to the feast of Yahuah (God). The sealing and the numbering are one act of keeping in both witnesses: Elohim (God) sets his own apart and counts every one.'),
  -- thread: revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37  [CENTERPIECE]
  ('canon', 'revelation', 7, 4, 'canon', 'ezekiel', 37, 16, 'free', E'*Moreover, thou son of Adam, take thee one stick, and write upon it, For Yahudah (Judah), and for the children of Yashar''el (Israel) his companions: then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions:* (Ezekiel 37:16). Here is the key to the sealed company: *there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4). Ezekiel was given two sticks — one for Yahudah (Judah), one for Joseph the stick of Ephraim, the northern house — the two houses of a divided people. And the list of tribes John hears names Joseph and Manasses standing for the north: this is not a symbolic number erasing the tribes but the two sticks named and gathered, Yahudah (Judah) and Ephraim together.'),
  ('canon', 'revelation', 7, 4, 'canon', 'ezekiel', 37, 17, 'free', E'*And join them one to another into one stick; and they shall become one in thine hand.* (Ezekiel 37:17). The two sticks become one: this is what the sealing of the twelve tribes is — *sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4), the tribes named one by one (Revelation 7:5-8). The number is no spiritualized cipher; it is the whole house made one, Yahudah (Judah) and Joseph joined in the hand of Yahuah (LORD), the two-house people gathered into a single sealed company.'),
  ('canon', 'revelation', 7, 4, 'canon', 'ezekiel', 37, 19, 'free', E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand.* (Ezekiel 37:19). *One in mine hand* — the very thing the sealed 144,000 of all the tribes of Yashar''el (Israel) embodies (Revelation 7:4). Joseph in the hand of Ephraim, joined with Yahudah (Judah), the tribes of Yashar''el (Israel) his fellows: the northern house and the southern made one stick. The seal on the foreheads of all twelve tribes is the seal upon a reunited people, no longer two sticks but one.'),
  ('canon', 'revelation', 7, 4, 'canon', 'ezekiel', 37, 21, 'free', E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). The sealed of all the tribes are the gathered of all the tribes — *I will take the children of Yashar''el (Israel) from among the heathen... and gather them on every side.* So *there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4): the scattered houses taken from among the nations whither they were driven and gathered home. The numbering of the tribes in Revelation 7 is the roll of the regathered, every house accounted for.'),
  ('canon', 'revelation', 7, 4, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). *No more two nations* — this is the end the sealing of the twelve tribes serves (Revelation 7:4). The two-house breach is healed; Yahudah (Judah) and the northern house become one nation under one king. The 144,000 of all the tribes is not the church standing in Yashar''el (Israel)''s place but Yashar''el (Israel) itself made whole, the divided kingdoms gathered into one sealed people.'),
  ('canon', 'revelation', 7, 4, 'apocrypha', '2-esdras', 2, 38, 'extras', E'*Arise up and stand, behold the number of those that be sealed in the feast of Yahuah (God);* (2 Esdras 2:38). *And I heard the number of them which were sealed* (Revelation 7:4). The restored library knows this sealed and numbered company: a counted people, sealed and gathered to the feast of Yahuah (God). The 144,000 of all the tribes of Yashar''el (Israel) is the number Esdras is bidden to behold — the regathered houses, every tribe sealed and reckoned, brought in to keep the feast.'),
  -- thread: revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1  [CENTERPIECE]
  ('canon', 'revelation', 7, 9, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). This is the multitude the seer beholds: *a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues* (Revelation 7:9). They are not a separate people replacing Yashar''el (Israel); they are the scattered seed of Yashar''el (Israel) come home — the Lo-ammi, the *not my people* of the northern exile, now *as the sand of the sea, which cannot be measured nor numbered.* The innumerable multitude of all nations is the dispersed of Ephraim sown among the nations and gathered back, now called *the sons of the living Elohim (God).*'),
  ('canon', 'revelation', 7, 9, 'canon', 'genesis', 13, 16, 'free', E'*And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered.* (Genesis 13:16). The promise to Abraham was a seed beyond counting: *if a man can number the dust of the earth, then shall thy seed also be numbered.* So the multitude of Revelation 7 is *which no man could number* (Revelation 7:9) — the very innumerability the promise spoke. The great multitude of all nations is not a new people but the promised seed of Abraham brought to its full number, the dust of the earth gathered home.'),
  ('canon', 'revelation', 7, 9, 'canon', 'genesis', 15, 5, 'free', E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* (Genesis 15:5). *Tell the stars, if thou be able to number them... so shall thy seed be* — and now the seer sees them, *a great multitude, which no man could number* (Revelation 7:9). What Abraham was bidden to count and could not, the seer beholds gathered before the throne. The uncountable multitude is the uncountable seed; the promise of the stars is kept in the homecoming of the scattered children of Yashar''el (Israel) from among the nations.'),
  ('canon', 'revelation', 7, 9, 'apocrypha', '2-esdras', 2, 42, 'extras', E'*I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs.* (2 Esdras 2:42). The restored library shows the same vision the seer is given: *a great multitude, which no man could number... stood before the throne, and before the Lamb* (Revelation 7:9). Esdras *saw upon the mount Sion a great people, whom I could not number,* praising Yahuah (God) with songs. The uncountable company before the throne in Revelation and the uncountable people on mount Sion in Esdras are one gathered host — the seed of Yashar''el (Israel) come home, raising one song of praise.'),
  ('canon', 'revelation', 7, 9, 'apocrypha', 'tobit', 13, 5, 'extras', E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5). The multitude *of all nations, and kindreds, and people, and tongues* (Revelation 7:9) is exactly the company Tobit prays for: those whom Yahuah (God) *will gather us out of all nations, among whom he has scattered us.* The great multitude is the scattered of Yashar''el (Israel) regathered, mercy following the scourge of exile — not the nations replacing the seed, but the seed gathered home out of every nation where it was driven.'),
  ('canon', 'revelation', 7, 9, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'extras', E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* (Baruch 5:5). The great multitude before the throne (Revelation 7:9) is Jerusalem''s children come back from the dispersion — *behold your children gathered from the west to the east by the word of the Holy One.* Baruch sees the scattered sons returning from every quarter, rejoicing; the seer sees them arrived, white-robed and palm-bearing before the throne. The same homecoming: the children gathered from among the nations, the seed of Yashar''el (Israel) brought back rejoicing.'),
  -- thread: revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23
  ('canon', 'revelation', 7, 9, 'canon', 'leviticus', 23, 40, 'free', E'*And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* (Leviticus 23:40). The palms in the multitude''s hands are the palms of the feast of ingathering: *clothed with white robes, and palms in their hands* (Revelation 7:9). At Sukkot Yashar''el (Israel) took *branches of palm trees* and rejoiced before Yahuah Elohaychem (the LORD your God) — the feast that remembers the wilderness journey and the gathering-in of the harvest. The gathered multitude keeps the great Sukkot, palms in hand, rejoicing before the throne as the harvest of the nations is brought home.'),
  ('canon', 'revelation', 7, 14, 'apocrypha', '2-esdras', 2, 45, 'extras', E'*So he answered and said to me, These be they that have put off the mortal clothing, and put on the immortal, and have confessed the name of Yahuah (God): now are they crowned, and receive palms.* (2 Esdras 2:45). The white-robed palm-bearers of Revelation 7 are named in the restored library: *now are they crowned, and receive palms.* The elder asks *what are these which are arrayed in white robes?* (Revelation 7:13) and answers *these are they which came out of great tribulation, and have washed their robes* (Revelation 7:14). Esdras tells the same: they that *put off the mortal clothing, and put on the immortal,* who *confessed the name of Yahuah (God)* — the same company, robed and palm-bearing, who came through tribulation into glory.'),
  -- thread: revelation-7-salvation-to-our-elohim-and-the-lamb-the-throne-and-the-slain-lamb-revelation-5
  ('canon', 'revelation', 7, 10, 'canon', 'revelation', 5, 13, 'free', E'*And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13). The multitude''s cry echoes the elder vision: *Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* (Revelation 7:10). Mark how the two are named together yet distinguished — *him that sitteth upon the throne, and... the Lamb.* The One on the throne is the Father; the Lamb is the Formed Son, slain and standing. The worship rises to both as to one Elohim (God), the Father and the Lamb, never collapsed and never divided.'),
  ('canon', 'revelation', 7, 10, 'apocrypha', '2-esdras', 2, 47, 'extras', E'*So he answered and said to me, It is the Son of Yahuah (God), whom they have confessed in the world. Then began I greatly to commend them that stood so stiffly for the name of Yahuah (God).* (2 Esdras 2:47). When the multitude cries *Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* (Revelation 7:10), the Lamb is the Son confessed in the world — *It is the Son of Yahuah (God), whom they have confessed.* Esdras sees the same crowning Son in the midst of the numberless people on Sion; the seer sees the Lamb in the midst of the throne. The Father is named, and the Son distinguished beside him — the Formed One whom the gathered confessed and now stand before.'),
  -- thread: revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34
  ('canon', 'revelation', 7, 17, 'canon', 'ezekiel', 34, 23, 'free', E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* (Ezekiel 34:23). The Lamb is also the Shepherd: *the Lamb which is in the midst of the throne shall feed them* (Revelation 7:17). Ezekiel promised *one shepherd... my servant David* who *shall feed them* over the regathered flock — and here he feeds them, the slain Lamb who is the Shepherd-King of the gathered tribes. The one who was led as a lamb now leads as the shepherd, feeding the homecoming multitude as the prophet foretold.'),
  ('canon', 'revelation', 7, 17, 'canon', 'isaiah', 49, 10, 'free', E'*They shall not hunger nor thirst; neither shall the heat nor sun smite them: for he that hath mercy on them shall lead them, even by the springs of water shall he guide them.* (Isaiah 49:10). The seer all but quotes the prophet: *They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat* (Revelation 7:16), *and shall lead them unto living fountains of waters* (Revelation 7:17). Isaiah spoke it of the gathered prisoners brought forth from darkness — *he that hath mercy on them shall lead them... by the springs of water.* The Lamb leads the regathered seed to the living fountains exactly as Isaiah promised mercy would lead the returning exiles home.'),
  ('canon', 'revelation', 7, 17, 'canon', 'psalms', 23, 2, 'free', E'*He maketh me to lie down in green pastures: he leadeth me beside the still waters.* (Psalm 23:2). The shepherd-care of the psalm is fulfilled at the throne: *the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters* (Revelation 7:17). David sang *he leadeth me beside the still waters*; the gathered multitude is led to the *living fountains of waters* by the Lamb who is their shepherd. The shepherd of the twenty-third psalm and the Lamb in the midst of the throne are one — feeding, leading, and giving rest to his flock.'),
  -- thread: revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25
  ('canon', 'revelation', 7, 17, 'canon', 'isaiah', 25, 8, 'free', E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* (Isaiah 25:8). The seer''s last word is the prophet''s promise: *and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). Isaiah foretold the day when *Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* and *the rebuke of his people* is taken away. For the gathered seed who came out of great tribulation, the mourning of exile is ended; Elohim (God) himself wipes away every tear, and the reproach of the scattered is removed.'),
  ('canon', 'revelation', 7, 15, 'canon', 'ezekiel', 37, 27, 'free', E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27). The dwelling of Elohim (God) with the gathered is the same promise sealed to the reunited tribes: *he that sitteth on the throne shall dwell among them* (Revelation 7:15). Ezekiel''s word over the two sticks made one was *my tabernacle also shall be with them... they shall be my people* — and here, before the throne, the One who sits there dwells among the regathered. The tabernacling of Elohim (God) with his people is the end of the two-house gathering: he with them, they his, for ever.'),
  ('canon', 'revelation', 7, 15, 'canon', 'ezekiel', 37, 26, 'free', E'*Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* (Ezekiel 37:26). They *serve him day and night in his temple: and he that sitteth on the throne shall dwell among them* (Revelation 7:15). Ezekiel promised the everlasting covenant of peace and *my sanctuary in the midst of them for evermore* — and the gathered multitude serves in that very sanctuary, the One on the throne dwelling among them. The temple-service of Revelation 7 is the sanctuary set in the midst of the regathered houses, the covenant of peace come to its rest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9',
       E'The four winds held and the seal of the living Elohim (God) in the foreheads (Ezekiel 9)',
       E'Before the judgment falls, the servants of Elohim (God) are marked for keeping. *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth* (Revelation 7:1), and another angel cries, *Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3). This is the old protecting sign of Ezekiel''s vision: *Yahuah (LORD) said unto him, Go through the midst of the city... and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof* (Ezekiel 9:4). The mark divides the kept from the struck — *come not near any man upon whom is the mark* (Ezekiel 9:6) — so the four winds are held back until every servant is sealed. It stands in the line of the passover token, too: *the blood shall be to you for a token upon the houses... and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13). As the blood on the lintel turned the destroyer aside, the seal on the forehead turns the winds aside. And the restored library knows this sealed and counted company: *Arise up and stand, behold the number of those that be sealed in the feast of Yahuah (God)* (2 Esdras 2:38). The sealing and the numbering are one act of keeping: Elohim (God) sets his own apart, counts every one, and holds the judgment until they are safe.',
       sv.verse_id, ev.verse_id, 'extras', 9150
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37',
       E'The twelve tribes sealed — the two-house regathering, the two sticks made one (Ezekiel 37)',
       E'The sealed company is named tribe by tribe, and the naming is the whole point: *And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4) — *Of the tribe of Juda were sealed twelve thousand* (Revelation 7:5), and so through *Joseph* and *Benjamin* (Revelation 7:8), the list naming Joseph and Manasses for the northern house. This is not a symbolic number that spiritualizes away the tribes and leaves a church standing in Yashar''el (Israel)''s place. It is the two-house gathering the prophet enacted with two sticks: *take thee one stick, and write upon it, For Yahudah (Judah), and for the children of Yashar''el (Israel) his companions: then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16), *and join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17). Yahuah (LORD) says it plainly: *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The sealed of all the tribes are the gathered of all the tribes: *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), *and I will make them one nation... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The 144,000 of all the tribes is Yahudah (Judah) and Ephraim/Joseph reunited — the two sticks become one in the hand of Yahuah (LORD), the divided houses sealed into one people. The restored library beholds the same numbered, sealed company gathered to the feast: *behold the number of those that be sealed in the feast of Yahuah (God)* (2 Esdras 2:38). Yashar''el (Israel) is not replaced; Yashar''el (Israel) is made whole.',
       sv.verse_id, ev.verse_id, 'extras', 9153
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1',
       E'A great multitude no man could number — the scattered seed gathered home (Hosea 1)',
       E'After the tribes are sealed, the seer beholds the harvest of the gathering: *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands* (Revelation 7:9). The inherited reading hears a separate gentile church here, distinct from the Yashar''eli (Israelite) 144,000. But the prophet already named this multitude, and named it Yashar''el (Israel): *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The *not my people* — the Lo-ammi of the northern exile — become *the sons of the living Elohim (God)*, and their number becomes *as the sand of the sea, which cannot be measured nor numbered.* That is precisely the multitude *which no man could number.* It is the promise to Abraham come full: *I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16); *tell the stars, if thou be able to number them... so shall thy seed be* (Genesis 15:5). What Abraham could not count, the seer sees gathered before the throne. The restored library beholds the same uncountable host: *I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs* (2 Esdras 2:42); and Tobit prays for exactly this homecoming — *he... will gather us out of all nations, among whom he has scattered us* (Tobit 13:5) — and Baruch sees it arriving: *behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5). The great multitude of all nations is not the nations replacing the seed; it is the seed of Yashar''el (Israel) — the dispersed of Ephraim sown among the nations — gathered home from every nation where it was scattered, the sons of the living Elohim (God) come at last before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 9156
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23',
       E'White robes and palms — the great Sukkot ingathering (Leviticus 23)',
       E'The gathered multitude stands *clothed with white robes, and palms in their hands* (Revelation 7:9), and the palms are the palms of the feast of ingathering. At Sukkot Yashar''el (Israel) was commanded: *ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days* (Leviticus 23:40) — the feast that remembers the wilderness journey and celebrates the gathering-in of the harvest. The regathered seed keeps the great Sukkot, palms in hand, rejoicing before the throne as the harvest of the nations is brought home. And the white robes are explained at the throne: *What are these which are arrayed in white robes? and whence came they?* (Revelation 7:13) — *These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb* (Revelation 7:14). The restored library names the same robed and palm-bearing company: *These be they that have put off the mortal clothing, and put on the immortal, and have confessed the name of Yahuah (God): now are they crowned, and receive palms* (2 Esdras 2:45). The white robes washed in the blood of the Lamb, the palms of the harvest feast — the homecoming of the seed kept as the everlasting Sukkot, rejoicing before Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 9159
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-salvation-to-our-elohim-and-the-lamb-the-throne-and-the-slain-lamb-revelation-5',
       E'Salvation to our Elohim (God) and to the Lamb — the throne and the slain Lamb distinguished (Revelation 5)',
       E'The multitude lifts one cry: *Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* (Revelation 7:10), and all the angels *fell before the throne on their faces, and worshipped Elohim (God)* (Revelation 7:11). Mark how the two are named together yet held distinct — *him that sitteth upon the throne, and... the Lamb.* The One on the throne is the Father, the Formless source; the Lamb is the Formed Son, slain and standing in the midst of the throne. This is the same vision the elders sang: *Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). The worship rises to both as to one Elohim (God) — the Father and the Lamb — never collapsed into one undivided person, never split into two gods. And the Lamb is the Son the gathered confessed: the restored library answers who he is — *It is the Son of Yahuah (God), whom they have confessed in the world* (2 Esdras 2:47), the Son who crowns the numberless people on Sion. The Father is named on the throne; the Son is distinguished beside him, the Formed One whom the regathered seed confessed in the world and now stand before, giving salvation to the One.',
       sv.verse_id, ev.verse_id, 'extras', 9162
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34',
       E'The Lamb shall feed them and lead them to living fountains (Ezekiel 34, Isaiah 49, Psalm 23)',
       E'The slain Lamb is also the Shepherd of the gathered flock: *the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters* (Revelation 7:17). Ezekiel promised the regathered houses one shepherd: *I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The one who was led as a lamb now leads as the shepherd-king. And the seer all but quotes Isaiah''s word over the returning exiles: *They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat* (Revelation 7:16) — *They shall not hunger nor thirst; neither shall the heat nor sun smite them: for he that hath mercy on them shall lead them, even by the springs of water shall he guide them* (Isaiah 49:10). The mercy that leads the gathered prisoners to the springs is the Lamb leading the regathered seed to the *living fountains of waters.* It is the shepherd-care of David''s psalm come to its rest: *He maketh me to lie down in green pastures: he leadeth me beside the still waters* (Psalm 23:2). The shepherd of the twenty-third psalm, the one shepherd of Ezekiel, and the Lamb in the midst of the throne are one — feeding, leading, and giving the living water to his homecoming flock.',
       sv.verse_id, ev.verse_id, 'free', 9165
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25',
       E'Elohim (God) shall wipe away all tears and tabernacle among them (Isaiah 25, Ezekiel 37)',
       E'The vision ends in the dwelling of Elohim (God) with his gathered people and the end of all their mourning. *Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them* (Revelation 7:15). This is the very promise sealed to the reunited tribes over the two sticks made one: *I will make a covenant of peace with them; it shall be an everlasting covenant with them... and will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26); *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). The temple-service of Revelation 7 is the sanctuary set in the midst of the regathered houses — the One on the throne dwelling among them, he with them and they his. And the last word is the prophet''s promise of comfort: *and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17) — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it* (Isaiah 25:8). For the seed who came out of great tribulation, the mourning of exile is over; the reproach of the scattered is taken away, and Elohim (God) himself wipes away every tear. The two-house gathering comes to its rest in the tabernacling of Elohim (God) with his people, for ever.',
       sv.verse_id, ev.verse_id, 'free', 9168
  FROM _s224_rv07_lookup sv, _s224_rv07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 9:4 — *set a mark upon the foreheads of the men that sigh and that cry for all the abominations* the protecting mark on the righteous, re-spoken as the seal in the foreheads of the servants of Elohim (God) (Revelation 7:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 9:6 — *come not near any man upon whom is the mark* the mark divides the kept from the struck, as the seal stays the four winds from the sealed (Revelation 7:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:13 — *the blood shall be to you for a token... and the plague shall not be upon you to destroy you* the passover token that turns the destroyer aside, the line the seal of the living Elohim (God) stands in (Revelation 7:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 2:38 — *behold the number of those that be sealed in the feast of Yahuah (God)* the restored library''s sealed and counted company, the sealing and numbering one act of keeping (Revelation 7:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-four-winds-held-and-the-seal-of-the-living-elohim-in-the-foreheads-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:16 — *one stick... For Yahudah (Judah)... another stick... For Joseph, the stick of Ephraim* the two houses written on two sticks, the key to the tribes named one by one (Revelation 7:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:17 — *they shall become one in thine hand* the two sticks joined, as the 144,000 of all the tribes is the whole house made one (Revelation 7:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:19 — *the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah)... one in mine hand* the northern and southern houses made one stick, the seal upon a reunited people (Revelation 7:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:21 — *I will take the children of Yashar''el (Israel) from among the heathen... and gather them on every side* the sealed of all the tribes are the gathered of all the tribes (Revelation 7:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 37:22 — *no more two nations, neither shall they be divided into two kingdoms any more* the two-house breach healed; the 144,000 is Yashar''el (Israel) made whole, not replaced (Revelation 7:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 2:38 — *behold the number of those that be sealed in the feast of Yahuah (God)* the restored library''s sealed and numbered company, the regathered tribes brought in to the feast (Revelation 7:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-twelve-tribes-sealed-the-two-house-regathering-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 1:10 — *the number of the children of Yashar''el (Israel) shall be as the sand of the sea... ye are the sons of the living Elohim (God)* the Lo-ammi of the exile become the innumerable multitude before the throne (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:16 — *I will make thy seed as the dust of the earth... then shall thy seed also be numbered* the promised seed beyond counting, the innumerability the multitude embodies (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:5 — *tell the stars, if thou be able to number them... so shall thy seed be* what Abraham could not count, the seer beholds gathered before the throne (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 2:42 — *I Esdras saw upon the mount Sion a great people, whom I could not number* the same uncountable host, gathered and praising Yahuah (God) with songs (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 13:5 — *he... will gather us out of all nations, among whom he has scattered us* the multitude of all nations is the scattered seed regathered, mercy after the scourge of exile (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Baruch 5:5 — *behold your children gathered from the west to the east by the word of the Holy One* Jerusalem''s children returning from the dispersion, the multitude arrived before the throne (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-a-great-multitude-no-man-could-number-the-gathered-seed-hosea-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:40 — *boughs of goodly trees, branches of palm trees... and ye shall rejoice before Yahuah Elohaychem (the LORD your God)* the Sukkot palms in the hands of the gathered multitude (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 2:45 — *now are they crowned, and receive palms* the white-robed palm-bearers named: they that confessed the name and came through tribulation (Revelation 7:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-7-salvation-to-our-elohim-and-the-lamb-the-throne-and-the-slain-lamb-revelation-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:13 — *Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb* the Father and the Formed Son named together yet distinguished, the same worship (Revelation 7:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-salvation-to-our-elohim-and-the-lamb-the-throne-and-the-slain-lamb-revelation-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 2:47 — *It is the Son of Yahuah (God), whom they have confessed in the world* the Lamb is the Son distinguished beside the Father, whom the gathered confessed (Revelation 7:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-salvation-to-our-elohim-and-the-lamb-the-throne-and-the-slain-lamb-revelation-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:23 — *I will set up one shepherd over them... even my servant David; he shall feed them* the one shepherd over the regathered flock, the Lamb who feeds them (Revelation 7:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:10 — *They shall not hunger nor thirst... by the springs of water shall he guide them* the mercy that leads the returning exiles to the springs, the Lamb leading the seed to living fountains (Revelation 7:16-17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 23:2 — *He maketh me to lie down in green pastures: he leadeth me beside the still waters* the shepherd-care of David''s psalm, fulfilled as the Lamb leads to living fountains (Revelation 7:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:27 — *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* the dwelling sealed to the reunited tribes, the One on the throne dwelling among them (Revelation 7:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:26 — *will set my sanctuary in the midst of them for evermore* the everlasting covenant of peace, the sanctuary the gathered serve in (Revelation 7:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 25:8 — *Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away* the prophet''s promise of comfort, the mourning of exile ended (Revelation 7:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv07_lookup sv, _s224_rv07_lookup tv
 WHERE t.slug='revelation-7-elohim-shall-wipe-away-all-tears-and-tabernacle-among-them-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_08.sql (S224 Revelation 8) -----
-- =====================================================================
-- S224 minion — REVELATION 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 8 (13 verses) — the seventh seal opened, silence in heaven, the seven
--   trumpets given, the prayers of the saints with incense, the censer cast to the earth, and
--   the first four trumpet-plagues re-speaking the Exodus on a cosmic scale.
-- Tag: rv08 (temp view _s224_rv08_lookup).
-- Sort band: floor 9175, step 3 (9175, 9178, 9181, 9184, 9187, 9190, 9193 used; under 9200).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: The trumpets of Revelation 8 are not a secret-rapture escape-clock; they are
-- the day of Yahuah (LORD) breaking upon the earth in the very words of the Exodus — hail and
-- fire, the waters to blood, the bitter waters, the sun and moon darkened — the same Yahuah who
-- judged Egypt now judging the whole earth, with the prayers of his saints rising as the incense
-- that sets it all in motion. The censer of wrath is filled FROM the altar where the saints'
-- prayers were just offered: the judgment answers the cry of the righteous (the *how long* of the
-- fifth seal, 6:10). The seven trumpets are the priestly silver trumpets of Numbers 10 sounded on
-- a cosmic scale — the assembly gathered, the alarm of war, the memorial before Elohim (God). No
-- Trinitarian grammar surfaces; the One on the throne and the Lamb are distinguished, and the
-- angels minister, they are not worshipped.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     silence in heaven about the space of half an hour
--           Tanakh: Habakkuk 2:20 (let all the earth keep silence before him), Zephaniah 1:7
--                   (hold thy peace at the presence of Adonai Yahuah), Zechariah 2:13 (be silent,
--                   O all flesh, before Yahuah)
--           Extras: none warranted   NT: none warranted (carried in the trumpet thread)
--   v.2,6   the seven angels and the seven trumpets prepared to sound
--           Tanakh: Numbers 10:9 (blow an alarm... ye shall be remembered before Yahuah),
--                   Numbers 10:10 (a memorial before your Elohim), Joel 2:1 (blow the trumpet in
--                   Zion... the day of Yahuah cometh)
--           Extras: none warranted   NT: none warranted
--   v.3-4   the prayers of all saints with much incense ascending before Elohim
--           Tanakh: Psalm 141:2 (let my prayer be set forth before thee as incense), Exodus 30:1
--                   (an altar to burn incense upon), Exodus 30:7 (Aaron shall burn sweet incense)
--           Extras: Tobit 12:15 (Raphael... which present the prayers of the saints), Tobit 12:12
--                   (I did bring the remembrance of your prayers before the Holy One), 1 Enoch
--                   47:1 (ascended the prayer of the righteous... before Yahuah of Spirits),
--                   1 Enoch 99:3 (raise your prayers as a memorial... before the angels)
--           NT: Revelation 5:8 (golden vials full of odours, which are the prayers of saints)
--   v.5     the censer filled with fire of the altar, cast into the earth
--           Tanakh: Ezekiel 10:2 (fill thine hand with coals of fire from between the cherubims,
--                   and scatter them over the city)
--           Extras: none warranted   NT: none warranted
--   v.7-9   hail and fire mingled with blood; the burning mountain; the third of the sea to blood
--           Tanakh: Exodus 9:23 (Yahuah sent thunder and hail, and the fire ran along), Exodus
--                   9:24 (hail, and fire mingled with the hail), Exodus 7:20 (the waters... turned
--                   to blood), Exodus 7:21 (the fish... died), Jeremiah 51:25 (O destroying
--                   mountain... I will make thee a burnt mountain)
--           Extras: none warranted   NT: none warranted
--   v.10-11 the star Wormwood; the third of the waters made bitter
--           Tanakh: Jeremiah 9:15 (I will feed them... with wormwood, and give them water of
--                   gall), Jeremiah 23:15 (I will feed them with wormwood), Exodus 15:23 (the
--                   waters of Marah... they were bitter)
--           Extras: none warranted   NT: none warranted
--   v.12-13 the sun/moon/stars a third darkened; the eagle's threefold Woe
--           Tanakh: Exodus 10:21 (darkness over the land of Egypt), Exodus 10:22 (thick darkness
--                   three days), Joel 2:10 (the sun and the moon shall be dark, and the stars
--                   shall withdraw their shining), Isaiah 13:10 (the stars... shall not give their
--                   light: the sun shall be darkened)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9175 revelation-8-silence-in-heaven-before-yahuah-habakkuk-2                                  (Tanakh)
--   9178 revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10                           (Tanakh)
--   9181 revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30                  (Tanakh + Extras + NT)
--   9184 revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10                            (Tanakh)
--   9187 revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9                (Tanakh)
--   9190 revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15                (Tanakh)
--   9193 revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2                     (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-8-silence-in-heaven-before-yahuah-habakkuk-2
  ('canon', 'revelation', 8, 1, 'canon', 'habakkuk', 2, 20, 'free', E'*But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him.* (Habakkuk 2:20). When the seventh seal is opened *there was silence in heaven about the space of half an hour* (Revelation 8:1) — and the seer is hearing the prophet. The silence is not emptiness but the hush of the whole creation before the One enthroned in his holy temple; heaven itself falls still as the earth is bidden to, for the day of his judgment is about to break. The prayers of the saints are about to be answered, and before the answer comes, all flesh holds its breath.'),
  ('canon', 'revelation', 8, 1, 'canon', 'zephaniah', 1, 7, 'free', E'*Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand: for Yahuah (LORD) hath prepared a sacrifice, he hath bid his guests.* (Zephaniah 1:7). The *silence in heaven* (Revelation 8:1) is the silence Zephaniah commands when the day of Yahuah (LORD) draws near — *hold thy peace at the presence of Adonai Yahuah (the Lord GOD).* The half-hour of stillness is the pause before the trumpets, the held breath of a creation that knows the day of slaughter has been prepared and the guests bidden; the same dread day the prophets named is breaking, and heaven goes quiet before it.'),
  ('canon', 'revelation', 8, 1, 'canon', 'zechariah', 2, 13, 'free', E'*Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation.* (Zechariah 2:13). Zechariah calls *all flesh* to silence because Yahuah (LORD) is *raised up out of his holy habitation* to act — and that is exactly the moment of *silence in heaven* (Revelation 8:1). The seventh seal opens, and before a single trumpet sounds, the silence falls: Yahuah (LORD) is rising up out of his holy place to judge, and the only fitting answer of every creature, in heaven and on earth, is to be still.'),
  -- thread: revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10
  ('canon', 'revelation', 8, 2, 'canon', 'numbers', 10, 9, 'free', E'*And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies.* (Numbers 10:9). The *seven trumpets* given to the seven angels (Revelation 8:2) are the silver trumpets of the wilderness sounded on a cosmic scale. In the camp the alarm-blast was the cry that brought Yashar''el (Israel) to mind before Yahuah Elohaychem (the LORD your God) in the day of battle — *ye shall be remembered* — and so the trumpet-blasts of heaven are the remembrance of the saints'' prayers turned into the alarm of war against the oppressor of the earth.'),
  ('canon', 'revelation', 8, 6, 'canon', 'numbers', 10, 10, 'free', E'*Also in the day of your gladness, and in your solemn days, and in the beginnings of your months, ye shall blow with the trumpets over your burnt offerings, and over the sacrifices of your peace offerings; that they may be to you for a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God).* (Numbers 10:10). When *the seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6), the instrument is the priestly trumpet of Numbers — blown to make *a memorial before your Elohim (God).* The trumpets that once sounded over the offerings of Yashar''el (Israel) now sound the memorial of the saints'' incense-prayers just offered at the golden altar, and the answer to that memorial is the judgment that follows.'),
  ('canon', 'revelation', 8, 6, 'canon', 'joel', 2, 1, 'free', E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* (Joel 2:1). Joel''s trumpet announces *the day of Yahuah (LORD)* — and that is the day the seven angels are *prepared... to sound* (Revelation 8:6). The blast in Zion that made the inhabitants tremble is the same blast taken up by the seven trumpets of heaven; the day Joel saw *nigh at hand* now breaks upon the earth, and the trembling of the land answers the alarm.'),
  -- thread: revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30
  ('canon', 'revelation', 8, 3, 'canon', 'exodus', 30, 1, 'free', E'*And thou shalt make an altar to burn incense upon: of shittim wood shalt thou make it.* (Exodus 30:1). The *golden altar which was before the throne* (Revelation 8:3) is the heavenly pattern of the altar of incense Yahuah (LORD) commanded Moses to make. The angel with the golden censer stands at the very altar the tabernacle copied — the place where the sweet smoke rose before the veil — and there he offers *much incense... with the prayers of all saints,* the earthly furniture of worship shown to be the shadow of a real altar in the presence of Elohim (God).'),
  ('canon', 'revelation', 8, 3, 'canon', 'exodus', 30, 7, 'free', E'*And Aaron shall burn thereon sweet incense every morning: when he dresseth the lamps, he shall burn incense upon it.* (Exodus 30:7). The priest''s daily office — Aaron burning *sweet incense* on the golden altar — is what the angel performs in heaven: *there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar* (Revelation 8:3). The morning and evening incense that ascended in the holy place was always the figure of prayer rising before Yahuah (LORD); here the figure becomes the thing itself, the prayers of the saints carried up in the smoke.'),
  ('canon', 'revelation', 8, 4, 'canon', 'psalms', 141, 2, 'free', E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* (Psalm 141:2). David prayed that his prayer might rise *as incense,* and Revelation shows the prayer and the incense made one: *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). What the psalmist asked for is granted in heaven — the prayers of all the saints go up as the evening sacrifice, set forth before the throne and received.'),
  ('canon', 'revelation', 8, 4, 'apocrypha', 'tobit', 12, 15, 'extras', E'*I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15). The angel at the golden altar who carries the saints'' prayers up before Elohim (God) (Revelation 8:3-4) does the very work Raphael named — *one of the seven holy angels, which present the prayers of the saints.* The seven angels of Revelation 8:2 and the seven holy ones who *go in and out before the glory of the Holy One* are the same heavenly order; the incense rising with the prayers is the presenting of those prayers before the throne.'),
  ('canon', 'revelation', 8, 3, 'apocrypha', 'tobit', 12, 12, 'extras', E'*Now therefore, when you did pray, and Sara your daughter in law, I did bring the remembrance of your prayers before the Holy One: and when you did bury the dead, I was with you likewise.* (Tobit 12:12). Raphael tells how the prayers of the righteous are handled in heaven — *I did bring the remembrance of your prayers before the Holy One* — and that is the angel''s office in Revelation: he offers *the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3). The prayers are not lost in the air; a holy one bears their remembrance up before the presence of Elohim (God), and the answer comes down in the trumpets.'),
  ('canon', 'revelation', 8, 4, 'enoch', '1-enoch', 47, 1, 'extras', E'*And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1). The restored library saw the same ascending prayer that Revelation shows rising in the incense-smoke: *the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). In Enoch the prayer of the righteous and the blood of the righteous go up together before Yahuah (God) of Spirits, and the throne answers in judgment — the very pattern of Revelation 8, where the prayers rise and then the censer of fire is cast to the earth.'),
  ('canon', 'revelation', 8, 4, 'enoch', '1-enoch', 99, 3, 'extras', E'*In those days make ready, ye righteous, to raise your prayers as a memorial, And place them as a testimony before the angels, That they may place the sin of the sinners for a memorial before the Most High.* (1 Enoch 99:3). Enoch bids the righteous *raise your prayers as a memorial... before the angels* — and in Revelation an angel does exactly that, offering the incense *with the prayers of all saints* so that they *ascended up before Elohim (God)* (Revelation 8:4). The prayers are a memorial laid before the Most High, and the same fire-bearing angel who carries them up then casts the fire of the altar to the earth (8:5): the memorial of the righteous becomes the judgment on the sinners.'),
  ('canon', 'revelation', 8, 3, 'canon', 'revelation', 5, 8, 'free', E'*And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* (Revelation 5:8). What the elders held in golden vials at the throne — *odours, which are the prayers of saints* — is now offered at the altar: *much incense, that he should offer it with the prayers of all saints* (Revelation 8:3). The book sealed in chapter 5 and the prayers gathered in golden vials there are taken up here; the incense of the saints'' prayers, stored before the throne, is at last poured out as the seals give way to the trumpets and the day of Yahuah (LORD) begins.'),
  -- thread: revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10
  ('canon', 'revelation', 8, 5, 'canon', 'ezekiel', 10, 2, 'free', E'*And he spake unto the man clothed with linen, and said, Go in between the wheels, even under the cherub, and fill thine hand with coals of fire from between the cherubims, and scatter them over the city. And he went in in my sight.* (Ezekiel 10:2). The angel who *took the censer, and filled it with fire of the altar, and cast it into the earth* (Revelation 8:5) is enacting the vision Ezekiel saw: the man in linen bidden to *fill thine hand with coals of fire from between the cherubims, and scatter them over the city.* The same fire that burned at the altar of prayer is taken as the fire of judgment and flung to the earth, and *there were voices, and thunderings, and lightnings, and an earthquake* — the throne-fire answering the prayers it had just received.'),
  -- thread: revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9
  ('canon', 'revelation', 8, 7, 'canon', 'exodus', 9, 24, 'free', E'*So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* (Exodus 9:24). The first trumpet brings *hail and fire mingled with blood* (Revelation 8:7), and it is the seventh plague of Egypt sounded over the whole earth — *hail, and fire mingled with the hail.* The judgment that fell on Pharaoh''s land *such as there was none like it* now falls on the third part of the earth; the same Yahuah (LORD) who smote Egypt smites the oppressor of his saints, the Exodus enlarged to the day of his wrath.'),
  ('canon', 'revelation', 8, 7, 'canon', 'exodus', 9, 23, 'free', E'*And Moses stretched forth his rod toward heaven: and Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt.* (Exodus 9:23). When the first angel sounded, *there followed hail and fire... and they were cast upon the earth: and the third part of trees was burnt up, and all green grass was burnt up* (Revelation 8:7). Moses stretched his rod and *the fire ran along upon the ground,* burning Egypt''s field; the trumpet does the same to the third part of the earth. The hand that rained hail upon Pharaoh is the hand at work in the trumpet, the plague-pattern unmistakable.'),
  ('canon', 'revelation', 8, 8, 'canon', 'jeremiah', 51, 25, 'free', E'*Behold, I am against thee, O destroying mountain, saith Yahuah (LORD), which destroyest all the earth: and I will stretch out mine hand upon thee, and roll thee down from the rocks, and will make thee a burnt mountain.* (Jeremiah 51:25). The second trumpet casts *as it were a great mountain burning with fire... into the sea* (Revelation 8:8), and Jeremiah had already named the *burnt mountain* — Babylon, the *destroying mountain* Yahuah (LORD) would make a charred ruin and roll down. The mountain that *destroyest all the earth* is itself burned and hurled down; the proud world-power that oppressed Zion becomes the burning mountain cast into the sea, and the third part of the sea becomes blood.'),
  ('canon', 'revelation', 8, 8, 'canon', 'exodus', 7, 20, 'free', E'*And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* (Exodus 7:20). *The third part of the sea became blood* (Revelation 8:8) re-speaks the first plague of Egypt, when the waters of the Nile *were turned to blood.* The judgment Moses called down upon Pharaoh''s river is poured out over the sea of the whole earth; the same Yahuah (LORD) who turned Egypt''s waters to blood turns the third part of the sea, and the Exodus plague becomes the trumpet-plague.'),
  ('canon', 'revelation', 8, 9, 'canon', 'exodus', 7, 21, 'free', E'*And the fish that was in the river died; and the river stank, and the Egyptians could not drink of the water of the river; and there was blood throughout all the land of Egypt.* (Exodus 7:21). At the second trumpet *the third part of the creatures which were in the sea, and had life, died* (Revelation 8:9) — and the blood-plague of Egypt killed the river''s life the same way: *the fish that was in the river died.* The dying of the sea-creatures and the wreck of the ships answer the dying of Egypt''s fish; the waters that turned to blood under Moses turn to blood and death under the trumpet, the plague spread from one river to the third part of the sea.'),
  -- thread: revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15
  ('canon', 'revelation', 8, 11, 'canon', 'jeremiah', 9, 15, 'free', E'*Therefore thus saith Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of Yashar''el (Israel); Behold, I will feed them, even this people, with wormwood, and give them water of gall to drink.* (Jeremiah 9:15). The third trumpet names the fallen star *Wormwood,* and *the third part of the waters became wormwood; and many men died of the waters, because they were made bitter* (Revelation 8:11). Jeremiah had named the judgment of *wormwood* and *water of gall* given to a people who walked after their own heart; the bitter draught the prophet pronounced is poured into the rivers and fountains of the earth, the waters of life turned to a cup of death.'),
  ('canon', 'revelation', 8, 11, 'canon', 'jeremiah', 23, 15, 'free', E'*Therefore thus saith Yahuah Tseva''ot (LORD of hosts) concerning the prophets; Behold, I will feed them with wormwood, and make them drink the water of gall: for from the prophets of Jerusalem is profaneness gone forth into all the land.* (Jeremiah 23:15). Twice Jeremiah pronounced the sentence of *wormwood* and *the water of gall,* here upon the false prophets whose profaneness filled the land — and the third trumpet makes the very name a star: *the name of the star is called Wormwood* (Revelation 8:11). The bitter judgment the prophet spoke against corruption becomes a cosmic plague; the waters made bitter answer the bitterness of those who turned the people from Yahuah (LORD).'),
  ('canon', 'revelation', 8, 11, 'canon', 'exodus', 15, 23, 'free', E'*And when they came to Marah, they could not drink of the waters of Marah, for they were bitter: therefore the name of it was called Marah.* (Exodus 15:23). At Marah the waters were *bitter* and could not be drunk, and the place was named for its bitterness; the third trumpet turns the third part of the waters bitter so that *many men died of the waters, because they were made bitter* (Revelation 8:11). The bitter waters of the wilderness, which Yahuah (LORD) made sweet for his redeemed, become in the day of judgment the bitter waters of death for the inhabiters of the earth — the same sign, the mercy withheld.'),
  -- thread: revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2
  ('canon', 'revelation', 8, 12, 'canon', 'exodus', 10, 22, 'free', E'*And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days:* (Exodus 10:22). The fourth trumpet smites *the third part of the sun... the moon... the stars... so as the third part of them was darkened* (Revelation 8:12), and the ninth plague of Egypt is its root: *thick darkness in all the land of Egypt three days.* The darkness Moses brought over Pharaoh''s land by stretching his hand toward heaven now falls over the lights of heaven themselves; the plague that blinded Egypt is enlarged until the day shines not for a third part of it.'),
  ('canon', 'revelation', 8, 12, 'canon', 'exodus', 10, 21, 'free', E'*And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* (Exodus 10:21). Yahuah (LORD) commanded a *darkness which may be felt* over Egypt, and the fourth trumpet brings a like darkening of *the day* and *the night* (Revelation 8:12). The same word that darkened Pharaoh''s land darkens the sun and moon and stars at the trumpet; the Exodus judgment that fell on the oppressor of Yashar''el (Israel) falls now on the whole earth that oppresses the saints.'),
  ('canon', 'revelation', 8, 12, 'canon', 'joel', 2, 10, 'free', E'*The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining:* (Joel 2:10). Joel saw the day of Yahuah (LORD) darken the heavens — *the sun and the moon shall be dark, and the stars shall withdraw their shining* — and that is the fourth trumpet: *the third part of the sun was smitten, and the third part of the moon, and the third part of the stars* (Revelation 8:12). The darkening Joel announced as the sign of the great and terrible day is the trumpet''s work; the lights of heaven fail as the day of Yahuah (LORD) the prophet foretold breaks upon the earth.'),
  ('canon', 'revelation', 8, 12, 'canon', 'isaiah', 13, 10, 'free', E'*For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine.* (Isaiah 13:10). Isaiah''s oracle of the day of Yahuah (LORD) darkened sun, moon, and stars together — and the fourth trumpet darkens all three: *the third part of the sun... the moon... the stars; so as the third part of them was darkened* (Revelation 8:12). The very lights Isaiah said would not give their light in the day of wrath are smitten at the trumpet, and the eagle''s threefold *Woe, woe, woe* (8:13) follows, the day of Yahuah (LORD) the prophets saw now poured upon the inhabiters of the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-silence-in-heaven-before-yahuah-habakkuk-2',
       E'Silence in heaven about the space of half an hour — let all the earth keep silence before him (Habakkuk 2)',
       E'When the Lamb opens the last seal, the first thing the seer reports is not a sound but its absence: *And when he had opened the seventh seal, there was silence in heaven about the space of half an hour* (Revelation 8:1). This is the hush the prophets command when the day of Yahuah (LORD) draws near. *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20) — the silence is the whole creation stilled before the One enthroned in his holy temple. *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand: for Yahuah (LORD) hath prepared a sacrifice, he hath bid his guests* (Zephaniah 1:7) — the half-hour is the held breath before the day of slaughter the prophet saw prepared. *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13) — heaven goes quiet because Yahuah (LORD) is rising up out of his holy place to act. The prayers of the saints are about to be answered and the trumpets about to sound; before the answer comes, every creature in heaven and on earth falls still. The silence is not emptiness. It is reverence before the day of Yahuah (LORD), the pause before the judgment that the saints have been crying for.',
       sv.verse_id, ev.verse_id, 'free', 9175
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10',
       E'The seven trumpets of the seven angels — the silver trumpets of Numbers blown on a cosmic scale (Numbers 10)',
       E'*And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets* (Revelation 8:2), and *the seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6). These are the silver trumpets of the wilderness raised to a cosmic pitch. Yahuah (LORD) had told Moses their use: *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). The alarm-blast was the cry that brought Yashar''el (Israel) to remembrance before Yahuah Elohaychem (the LORD your God) in the day of battle — and so the trumpets of heaven sound the remembrance of the saints'' prayers turned into the alarm of war against the oppressor of the earth. And the trumpet was blown over the offerings to make *a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God)* (Numbers 10:10) — the very memorial of the incense-prayers just offered at the golden altar. Joel names the day the trumpet announces: *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1). The blast that made the inhabitants of the land tremble is taken up by the seven angels; the day of Yahuah (LORD) Joel saw nigh at hand now breaks upon the earth.',
       sv.verse_id, ev.verse_id, 'free', 9178
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30',
       E'The prayers of all saints with much incense ascending before Elohim (God) (Exodus 30, Tobit 12, 1 Enoch 47)',
       E'Between the silence and the trumpets stands the altar, and at it an angel offers the prayers of the saints. *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne. And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:3-4). This *golden altar which was before the throne* is the heavenly pattern of the altar Moses was commanded to build: *thou shalt make an altar to burn incense upon* (Exodus 30:1), where *Aaron shall burn thereon sweet incense every morning* (Exodus 30:7). The daily incense of the holy place was always the figure of prayer rising before Yahuah (LORD) — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2) — and here the figure becomes the thing itself: the prayers of all the saints carried up in the smoke. The restored library names the very office of the angel who bears them. *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One* (Tobit 12:15); *when you did pray... I did bring the remembrance of your prayers before the Holy One* (Tobit 12:12) — the seven holy ones and the seven angels of Revelation are one order, and they bear the prayers up before the throne. So too Enoch saw the prayer of the righteous ascend: *And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits* (1 Enoch 47:1), and bade them *raise your prayers as a memorial... before the angels* (1 Enoch 99:3) — the very pattern of Revelation 8, where the prayers rise and the throne answers in fire. And what the elders held in golden vials in the throne-room — *golden vials full of odours, which are the prayers of saints* (Revelation 5:8) — is here poured out at the altar. The prayers are not lost in the air; they are stored before the throne, borne up by a holy one, and at last answered, for the same angel who carries them up then casts the fire of the altar to the earth.',
       sv.verse_id, ev.verse_id, 'extras', 9181
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10',
       E'The censer filled with fire of the altar, cast into the earth — the coals scattered over the city (Ezekiel 10)',
       E'The same censer that carried the saints'' prayers up now becomes the vessel of judgment. *And the angel took the censer, and filled it with fire of the altar, and cast it into the earth: and there were voices, and thunderings, and lightnings, and an earthquake* (Revelation 8:5). The seer is watching the vision Ezekiel saw enacted. *And he spake unto the man clothed with linen, and said, Go in between the wheels, even under the cherub, and fill thine hand with coals of fire from between the cherubims, and scatter them over the city. And he went in in my sight* (Ezekiel 10:2). The man in linen was bidden to take fire from between the cherubim and scatter it over the doomed city; the angel of Revelation takes the fire of the altar — the very altar where the prayers were just received — and flings it to the earth. The fire of intercession and the fire of judgment are one fire: the prayers rose, and the answer comes down as thunderings and lightnings and earthquake. The throne-fire answers the cry of the saints, *How long?* (Revelation 6:10), and the day of Yahuah (LORD) begins.',
       sv.verse_id, ev.verse_id, 'free', 9184
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9',
       E'Hail and fire mingled with blood, the burning mountain, the sea to blood — the Exodus plagues enlarged (Exodus 9, Exodus 7, Jeremiah 51)',
       E'The first two trumpets re-speak the plagues of Egypt over the whole earth. *The first angel sounded, and there followed hail and fire mingled with blood, and they were cast upon the earth: and the third part of trees was burnt up, and all green grass was burnt up* (Revelation 8:7) — and this is the seventh plague: *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation* (Exodus 9:24), when *Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground* (Exodus 9:23). The judgment that fell on Pharaoh''s land falls now on the third part of the earth. Then *the second angel sounded, and as it were a great mountain burning with fire was cast into the sea: and the third part of the sea became blood* (Revelation 8:8) — and Jeremiah had named the burning mountain: *Behold, I am against thee, O destroying mountain, saith Yahuah (LORD), which destroyest all the earth... and will make thee a burnt mountain* (Jeremiah 51:25). The proud world-power that oppressed Zion is itself burned and hurled down. And the sea turning to blood re-speaks the first plague: *all the waters that were in the river were turned to blood* (Exodus 7:20), so that *the fish that was in the river died* (Exodus 7:21) — just as now *the third part of the creatures which were in the sea, and had life, died* (Revelation 8:9). The same Yahuah (LORD) who smote Egypt to deliver Yashar''el (Israel) smites the oppressor of his saints; the Exodus is enlarged to the day of his wrath.',
       sv.verse_id, ev.verse_id, 'free', 9187
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15',
       E'The star Wormwood and the waters made bitter — the wormwood of Jeremiah and the bitter waters of Marah (Jeremiah 9, Exodus 15)',
       E'The third trumpet poisons the waters of the earth with a judgment the prophets had named. *And the third angel sounded, and there fell a great star from heaven, burning as it were a lamp, and it fell upon the third part of the rivers, and upon the fountains of waters; And the name of the star is called Wormwood: and the third part of the waters became wormwood; and many men died of the waters, because they were made bitter* (Revelation 8:10-11). The very name is Jeremiah''s sentence: *Behold, I will feed them, even this people, with wormwood, and give them water of gall to drink* (Jeremiah 9:15), spoken against a people who walked after their own heart; and again, *Behold, I will feed them with wormwood, and make them drink the water of gall: for from the prophets of Jerusalem is profaneness gone forth into all the land* (Jeremiah 23:15), against the false prophets who corrupted the people. The bitter draught the prophet pronounced is now a star, and it falls into the rivers and fountains until the waters of life become a cup of death. And behind it stands Marah: *when they came to Marah, they could not drink of the waters of Marah, for they were bitter: therefore the name of it was called Marah* (Exodus 15:23). The bitter waters that Yahuah (LORD) once made sweet for his redeemed become, in the day of judgment, the bitter waters of death for the inhabiters of the earth — the same sign, the mercy withheld.',
       sv.verse_id, ev.verse_id, 'free', 9190
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2',
       E'The sun, moon, and stars a third darkened, and the threefold Woe — the darkness of Egypt and the day of Yahuah (Exodus 10, Joel 2, Isaiah 13)',
       E'The fourth trumpet strikes the lights of heaven, and the eagle cries the threefold woe. *And the fourth angel sounded, and the third part of the sun was smitten, and the third part of the moon, and the third part of the stars; so as the third part of them was darkened, and the day shone not for a third part of it, and the night likewise* (Revelation 8:12). Its root is the ninth plague of Egypt: *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt* (Exodus 10:21), and *there was a thick darkness in all the land of Egypt three days* (Exodus 10:22). The darkness Moses brought over Pharaoh''s land now falls on the sun and moon and stars themselves. And the prophets had foreseen this darkening as the sign of the day of Yahuah (LORD): *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining* (Joel 2:10); *For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine* (Isaiah 13:10). The very lights Joel and Isaiah said would fail in the day of wrath are smitten at the trumpet. Then *I beheld, and heard an angel flying through the midst of heaven, saying with a loud voice, Woe, woe, woe, to the inhabiters of the earth by reason of the other voices of the trumpet of the three angels, which are yet to sound* (Revelation 8:13) — three trumpets are spent, and the threefold woe warns that the worst of the day of Yahuah (LORD) is still to come upon the earth.',
       sv.verse_id, ev.verse_id, 'free', 9193
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-8-silence-in-heaven-before-yahuah-habakkuk-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:20 — *Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* the silence in heaven is the hush of all creation before the One in his holy temple (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 1:7 — *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand* the half-hour silence is the held breath before the day of slaughter the prophet saw prepared (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 2:13 — *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* heaven goes quiet because Yahuah is rising up out of his holy place to judge (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 10:9 — *ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God)* the silver war-alarm of the camp; the trumpets of heaven are the remembrance of the saints turned into the alarm of war (Revelation 8:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 10:10 — *ye shall blow with the trumpets... that they may be to you for a memorial before your Elohim (God)* the priestly trumpet blown over the offerings, now the memorial of the saints'' incense-prayers (Revelation 8:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:1 — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* the blast that made the land tremble; the day Joel saw nigh now breaks at the trumpets (Revelation 8:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 30:1 — *thou shalt make an altar to burn incense upon* the golden altar before the throne is the heavenly pattern the tabernacle copied (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:7 — *Aaron shall burn thereon sweet incense every morning* the priest''s daily office of incense, the figure of prayer rising, now performed by the angel (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* David''s petition granted in heaven, the prayers of the saints rising as the evening sacrifice (Revelation 8:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints* the restored library names the angel''s office: the seven holy ones who bear the prayers before the throne (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:12 — *I did bring the remembrance of your prayers before the Holy One* the prayers borne up, not lost in the air; the angel offers them on the golden altar (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 47:1 — *shall have ascended the prayer of the righteous... before Yahuah (God) of Spirits* Enoch saw the same ascending prayer; the throne answers it in judgment (Revelation 8:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 99:3 — *raise your prayers as a memorial... before the angels* the prayers laid as a memorial before the Most High, the very pattern of the incense-offering (Revelation 8:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Revelation 5:8 — *golden vials full of odours, which are the prayers of saints* the prayers stored before the throne in chapter 5 are now poured out at the altar (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 10:2 — *fill thine hand with coals of fire from between the cherubims, and scatter them over the city* the angel enacts the vision; the fire of the altar of prayer becomes the fire of judgment cast to the earth (Revelation 8:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:24 — *there was hail, and fire mingled with the hail, very grievous* the seventh plague of Egypt; the first trumpet sounds it over the third part of the earth (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:23 — *Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground* Moses stretched his rod and the fire ran over Egypt; the trumpet burns the third part of the earth the same way (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 51:25 — *O destroying mountain... I will make thee a burnt mountain* the burning mountain cast into the sea is the proud world-power burned and hurled down (Revelation 8:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 7:20 — *all the waters that were in the river were turned to blood* the first plague; the third part of the sea becomes blood at the second trumpet (Revelation 8:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 7:21 — *the fish that was in the river died; and the river stank* the blood-plague killed the river''s life; the trumpet kills the third part of the sea-creatures (Revelation 8:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 9:15 — *I will feed them... with wormwood, and give them water of gall to drink* the prophet''s sentence of wormwood becomes a star; the third part of the waters made bitter (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:15 — *I will feed them with wormwood, and make them drink the water of gall* the same sentence against corruption; the star''s very name is Wormwood (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 15:23 — *the waters of Marah... they were bitter* the bitter waters Yahuah once made sweet for his redeemed become the bitter waters of death (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 10:22 — *there was a thick darkness in all the land of Egypt three days* the ninth plague; the fourth trumpet darkens the sun, moon, and stars themselves (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 10:21 — *darkness over the land of Egypt, even darkness which may be felt* the same word that darkened Pharaoh''s land darkens the day and night at the trumpet (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:10 — *the sun and the moon shall be dark, and the stars shall withdraw their shining* the darkening Joel announced as the sign of the day of Yahuah, now the trumpet''s work (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 13:10 — *the stars of heaven... shall not give their light: the sun shall be darkened* the lights Isaiah said would fail in the day of wrath are smitten; the threefold Woe follows (Revelation 8:12-13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_09.sql (S224 Revelation 9) -----
-- =====================================================================
-- S224 minion — REVELATION 9 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 9 (21 verses) — the fifth and sixth trumpets: the fallen star with the key of
--   the bottomless pit and the locusts from the smoke (vv.1-11); the four angels loosed at the
--   Euphrates and the horsemen myriads (vv.13-19); the unrepentant who would not turn from their
--   idols (vv.20-21).
-- Tag: rv09 (temp view _s224_rv09_lookup).
-- Sort band: floor 9200, step 3 (9200, 9203, 9206, 9209, 9212, 9215, 9218 used; under 9225).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation 9 is not a freestanding horror but the Exodus-plagues and the
-- prophetic day-of-Yahuah re-spoken on a cosmic scale, woven entirely out of allusion — the book
-- never says "it is written" yet here re-speaks Genesis 19, Isaiah 14, Joel 1-2, Exodus 10,
-- Ezekiel 9, Genesis 15, Jeremiah 46, and the idol-polemic of the Psalms. The sealed of chapter 7
-- (Ezekiel 9:4, the mark on the foreheads of the faithful) are spared — the covenant frame holds:
-- those marked as Yahuah''s are kept while the plague falls on those without the seal. The chapter
-- ends on the diagnostic that defines the whole book''s unrepentant: they *repented not... that they
-- should not worship devils, and idols of gold* (9:20) — the same charge the Torah and the prophets
-- brought against idolatry (Deuteronomy 32:17, Psalm 115, Psalm 135). The extras (1 Enoch) carry the
-- richest witness to the fallen-star / bound-angels / abyss imagery the seer is re-speaking.
-- Christology / sacred names preserved exactly as the pull renders them (*Elohim (God)*, *Yahuah
-- (LORD)*); no kaph carve-out fires in this chapter.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the fallen star, the key of the pit, the smoke as of a great furnace
--           Tanakh: Genesis 19:28 (the smoke of the country as the smoke of a furnace), Isaiah 14:12
--                   (fallen from heaven, O Lucifer), Isaiah 14:13 (I will exalt my throne above the
--                   stars), Isaiah 14:15 (brought down to hell, to the sides of the pit)
--           Extras: 1 Enoch 18:11 (the abyss, a waste and horrible place), 18:12 (the prison for the
--                   stars and the host of heaven), 18:14 (He bound them), 21:8 (the abyss cleft and
--                   angels), 88:1 (the fallen star bound and cast into the abyss)
--           NT: none warranted (woven internal to the OT/extras root)
--   v.3-4   the locusts out of the smoke; the sealed of Elohim spared
--           Tanakh: Joel 1:4 (the locust eaten), Exodus 10:12 (the locusts over the land), Exodus
--                   10:15 (they covered the face of the whole earth, ate every green thing),
--                   Ezekiel 9:4 (set a mark upon the foreheads — the sealed spared), Ezekiel 9:6
--                   (come not near any man upon whom is the mark)
--           Extras: none warranted (carried in the abyss thread)   NT: none warranted
--   v.5-6   five months torment; men seek death and shall not find it
--           Tanakh: Job 3:21 (long for death, but it cometh not), Jeremiah 8:3 (death shall be
--                   chosen rather than life)
--           Extras: none warranted   NT: none warranted
--   v.7-10  the shapes of the locusts — like horses, like Joel''s army
--           Tanakh: Joel 2:4 (the appearance of them is as horses), Joel 2:5 (like the noise of
--                   chariots), Joel 1:6 (teeth of lions), Joel 2:10 (the earth quake before them)
--           Extras: none warranted   NT: none warranted
--   v.11    their king Abaddon / Apollyon, the angel of the pit
--           Tanakh: Job 26:6 (destruction hath no covering), Job 28:22 (destruction and death),
--                   Proverbs 15:11 (hell and destruction are before Yahuah), Psalm 88:11 (thy
--                   faithfulness in destruction)
--           Extras: 1 Enoch 10:4 (Bind Azazel... cast him into the darkness — the bound angel of the
--                   pit)   NT: none warranted
--   v.13-19 the four angels bound at the Euphrates; the horsemen myriads
--           Tanakh: Genesis 15:18 (the great river, the river Euphrates), Jeremiah 46:10 (the day of
--                   vengeance... by the river Euphrates), Isaiah 5:26 (an ensign to the nations from
--                   far), Isaiah 5:28 (their horses'' hoofs like flint), Isaiah 5:29 (their roaring
--                   like a lion)
--           Extras: none warranted   NT: none warranted
--   v.20-21 the rest repented not of worshipping devils and idols of gold
--           Tanakh: Deuteronomy 32:17 (they sacrificed unto devils, not to Elohim), Psalm 115:4
--                   (their idols are silver and gold), Psalm 115:5 (mouths, but they speak not),
--                   Psalm 135:15 (the idols of the heathen)
--           Extras: 1 Enoch 88:1 carried above; Wisdom 14:8 (that which is made with hands is
--                   cursed), Wisdom 14:27 (the worshipping of idols... the beginning, the cause, and
--                   the end, of all evil)
--           NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9200 revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14  (Tanakh + Extras)
--   9203 revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9                     (Tanakh)
--   9206 revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8                                        (Tanakh)
--   9209 revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2                                  (Tanakh)
--   9212 revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88                      (Tanakh + Extras)
--   9215 revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5          (Tanakh)
--   9218 revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115               (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s224_rv09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14
  ('canon', 'revelation', 9, 2, 'canon', 'genesis', 19, 28, 'free', E'*And he looked toward Sodom and Gomorrah, and toward all the land of the plain, and beheld, and, lo, the smoke of the country went up as the smoke of a furnace.* (Genesis 19:28). When the fifth angel sounds and the star opens the pit, *there arose a smoke out of the pit, as the smoke of a great furnace; and the sun and the air were darkened* (Revelation 9:2). The seer reaches for the oldest image of judgment-smoke in the Torah — Abraham looking out over the overthrow of the cities of the plain and seeing the smoke go up *as the smoke of a furnace.* The pit''s smoke is the smoke of Sodom risen to cosmic scale; the same Yahuah (LORD) who rained fire on the plain looses this judgment from below.'),
  ('canon', 'revelation', 9, 1, 'canon', 'isaiah', 14, 12, 'free', E'*How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12). *I saw a star fall from heaven unto the earth: and to him was given the key of the bottomless pit* (Revelation 9:1). Isaiah''s taunt over the fallen one — *fallen from heaven... cut down to the ground* — is the very fall the seer watches, a star cast down out of the height to the earth. The star is no luminary but a fallen power, and the pit it unlocks is the place to which such a one is brought down.'),
  ('canon', 'revelation', 9, 1, 'canon', 'isaiah', 14, 13, 'free', E'*For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13). The fallen star of *I saw a star fall from heaven unto the earth* (Revelation 9:1) is the one who once said in his heart *I will exalt my throne above the stars of Elohim (God)* — the pride that reached for the height of heaven is answered by the plunge to the pit; the would-be ascender is given instead the key to the abyss beneath.'),
  ('canon', 'revelation', 9, 1, 'canon', 'isaiah', 14, 15, 'free', E'*Yet thou shalt be brought down to hell, to the sides of the pit.* (Isaiah 14:15). The end of the one who said *I will ascend* is the pit: *brought down to hell, to the sides of the pit.* And here the seer sees that very pit unlocked — *to him was given the key of the bottomless pit* (Revelation 9:1). The chamber Isaiah named as the destiny of the fallen is the chamber out of which the smoke and the locusts now rise; the pit is real, and its mouth is opened.'),
  ('canon', 'revelation', 9, 1, 'enoch', '1-enoch', 18, 12, 'extras', E'*This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 18:12). The Hebrew library names the very place the seer sees opened. Enoch is shown a waste and horrible place at the end of heaven and earth — *a prison for the stars and the host of heaven* — and John sees *a star fall from heaven unto the earth: and to him was given the key of the bottomless pit* (Revelation 9:1). The fallen star and the prison-pit of the stars are one architecture across the library; the abyss of Revelation 9 is the prison Enoch walked.'),
  ('canon', 'revelation', 9, 1, 'enoch', '1-enoch', 18, 14, 'extras', E'*And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 18:14). The stars that *transgressed the commandment of Yahuah (God)* were bound till their judgment — and now one such fallen star is loosed to open the pit: *I saw a star fall from heaven unto the earth: and to him was given the key of the bottomless pit* (Revelation 9:1). The binding Enoch saw and the loosing John sees are the two ends of one story; the pit holds the transgressing stars until the appointed hour, and the trumpet sounds that hour.'),
  ('canon', 'revelation', 9, 2, 'enoch', '1-enoch', 21, 8, 'extras', E'*And from thence I proceeded to another place, which was still more horrible than the former, and I saw a horrible thing: a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire.* (1 Enoch 21:8). When the pit is opened *there arose a smoke out of the pit, as the smoke of a great furnace* (Revelation 9:2). Enoch had already seen the abyss cleft and blazing with fire — the furnace-place at the end of the world. The smoke of Revelation''s pit rises from the very fire Enoch was shown, the prison-furnace of the fallen.'),
  ('canon', 'revelation', 9, 1, 'enoch', '1-enoch', 88, 1, 'extras', E'*And I saw one of those four who had come forth first, and he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss: now that abyss was narrow and deep, and horrible and dark.* (1 Enoch 88:1). Here the Hebrew library shows the fallen star itself — *that first star which had fallen from the heaven* — seized, bound, and *cast into an abyss... narrow and deep, and horrible and dark.* John sees the same figure at the mouth of the same chamber: *I saw a star fall from heaven unto the earth: and to him was given the key of the bottomless pit* (Revelation 9:1). The star, the fall, the abyss are one across the witnesses.'),
  -- thread: revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9
  ('canon', 'revelation', 9, 3, 'canon', 'joel', 1, 4, 'free', E'*That which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten; and that which the cankerworm hath left hath the caterpiller eaten.* (Joel 1:4). *And there came out of the smoke locusts upon the earth: and unto them was given power, as the scorpions of the earth have power* (Revelation 9:3). The seer pulls the locust of Joel''s day-of-Yahuah out of the smoke of the pit. Joel''s devouring swarm — wave upon wave stripping the land — is the figure for this plague; the locust that ate the harvest in the prophet''s ear becomes the locust loosed under the fifth trumpet.'),
  ('canon', 'revelation', 9, 3, 'canon', 'exodus', 10, 12, 'free', E'*And Yahuah (LORD) said unto Moses, Stretch out thine hand over the land of Egypt for the locusts, that they may come up upon the land of Egypt, and eat every herb of the land, even all that the hail hath left.* (Exodus 10:12). The locusts of Revelation 9 are the eighth plague returned: *there came out of the smoke locusts upon the earth* (Revelation 9:3). The same Yahuah (LORD) who brought the locusts up over Egypt to eat *every herb of the land* looses the locusts of the trumpet; Revelation re-speaks the plagues of the Exodus on a cosmic stage, the deliverer-judgment of Egypt poured out on the unsealed earth.'),
  ('canon', 'revelation', 9, 4, 'canon', 'exodus', 10, 15, 'free', E'*For they covered the face of the whole earth, so that the land was darkened; and they did eat every herb of the land, and all the fruit of the trees which the hail had left: and there remained not any green thing in the trees, or in the herbs of the field, through all the land of Egypt.* (Exodus 10:15). In Egypt the locusts ate *every herb... not any green thing* remained — and the trumpet-locusts are turned the other way by command: *that they should not hurt the grass of the earth, neither any green thing, neither any tree; but only those men which have not the seal of Elohim (God) in their foreheads* (Revelation 9:4). The plague that stripped the green of Egypt is now forbidden the green and aimed at the unsealed; the Exodus pattern is re-spoken with a covenant turn.'),
  ('canon', 'revelation', 9, 4, 'canon', 'ezekiel', 9, 4, 'free', E'*And Yahuah (LORD) said unto him, Go through the midst of the city, through the midst of Jerusalem, and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof.* (Ezekiel 9:4). The locusts may hurt *only those men which have not the seal of Elohim (God) in their foreheads* (Revelation 9:4). This is Ezekiel''s mark restored — the seal set *upon the foreheads* of the faithful who grieve over abomination, the very sign by which Yahuah (LORD) divides the kept from the smitten. The sealed of chapter 7 are the marked of Ezekiel 9; the plague passes over those who bear the seal of Elohim.'),
  ('canon', 'revelation', 9, 4, 'canon', 'ezekiel', 9, 6, 'free', E'*Slay utterly old and young, both maids, and little children, and women: but come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house.* (Ezekiel 9:6). *Come not near any man upon whom is the mark* — and so the trumpet-locusts are commanded to hurt only those *which have not the seal of Elohim (God) in their foreheads* (Revelation 9:4). The destroyer in Ezekiel''s vision passes by every forehead that bears the mark; the locusts of Revelation pass by every forehead that bears the seal. The same covenant boundary holds: those marked as Yahuah''s are kept.'),
  -- thread: revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8
  ('canon', 'revelation', 9, 6, 'canon', 'job', 3, 21, 'free', E'*Which long for death, but it cometh not; and dig for it more than for hid treasures* (Job 3:21). *And in those days shall men seek death, and shall not find it; and shall desire to die, and death shall flee from them* (Revelation 9:6). Job in his anguish named the very torment of the fifth trumpet — to *long for death, but it cometh not.* The men stung by the scorpion-locusts are brought to Job''s cry: they dig for death and cannot find it, the relief of the grave fleeing from those who seek it.'),
  ('canon', 'revelation', 9, 6, 'canon', 'jeremiah', 8, 3, 'free', E'*And death shall be chosen rather than life by all the residue of them that remain of this evil family, which remain in all the places whither I have driven them, saith Yahuah Tseva''ot (LORD of hosts).* (Jeremiah 8:3). Jeremiah foretold a judgment so bitter that *death shall be chosen rather than life* — and the trumpet brings it: *in those days shall men seek death, and shall not find it; and shall desire to die, and death shall flee from them* (Revelation 9:6). The prophet''s word over the residue driven out for their abominations is the word fulfilled here; men choose death and are denied even that, the torment outlasting the desire to die.'),
  -- thread: revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2
  ('canon', 'revelation', 9, 7, 'canon', 'joel', 2, 4, 'free', E'*The appearance of them is as the appearance of horses; and as horsemen, so shall they run.* (Joel 2:4). *And the shapes of the locusts were like unto horses prepared unto battle* (Revelation 9:7). The seer takes Joel''s own simile for the day-of-Yahuah army — *the appearance of them is as the appearance of horses; and as horsemen, so shall they run.* The locusts John sees are Joel''s locust-army made vision: horse-shaped, battle-ready, the prophet''s figure given crowns and faces and the noise of running war.'),
  ('canon', 'revelation', 9, 9, 'canon', 'joel', 2, 5, 'free', E'*Like the noise of chariots on the tops of mountains shall they leap, like the noise of a flame of fire that devoureth the stubble, as a strong people set in battle array.* (Joel 2:5). *And the sound of their wings was as the sound of chariots of many horses running to battle* (Revelation 9:9). Joel heard the locust-army come *like the noise of chariots on the tops of mountains* — and John hears the same: *the sound of chariots of many horses running to battle.* The wings of the trumpet-locusts roar with the chariot-noise of Joel''s strong people set in battle array.'),
  ('canon', 'revelation', 9, 8, 'canon', 'joel', 1, 6, 'free', E'*For a nation is come up upon my land, strong, and without number, whose teeth are the teeth of a lion, and he hath the cheek teeth of a great lion.* (Joel 1:6). *And they had hair as the hair of women, and their teeth were as the teeth of lions* (Revelation 9:8). Joel named the locust-nation by its lion''s teeth — *whose teeth are the teeth of a lion* — and the seer gives his locusts that same mouth: *their teeth were as the teeth of lions.* The devouring strength of Joel''s strong-and-without-number nation is the strength of the swarm out of the pit.'),
  ('canon', 'revelation', 9, 9, 'canon', 'joel', 2, 10, 'free', E'*The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining.* (Joel 2:10). The locust-army of Revelation runs to battle with breastplates of iron and chariot-thunder (Revelation 9:9), the same advancing host before whom, in Joel, *the earth shall quake... the heavens shall tremble.* Joel''s cosmic dread at the coming of the army — earth quaking, sun and moon darkened — is the air the trumpet-locusts breathe; this is the day-of-Yahuah host the prophet saw, loosed in vision.'),
  -- thread: revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88
  ('canon', 'revelation', 9, 11, 'canon', 'job', 26, 6, 'free', E'*Hell is naked before him, and destruction hath no covering.* (Job 26:6). *And they had a king over them, which is the angel of the bottomless pit, whose name in the Hebrew tongue is Abaddon, but in the Greek tongue hath his name Apollyon* (Revelation 9:11). The Hebrew name of the locust-king, *Abaddon,* is the very word Job uses — *destruction hath no covering* — the place and power of ruin, naked before Yahuah (LORD). The king of the pit bears the name of destruction itself; the abyss has a ruler, and his name is Ruin.'),
  ('canon', 'revelation', 9, 11, 'canon', 'job', 28, 22, 'free', E'*Destruction and death say, We have heard the fame thereof with our ears.* (Job 28:22). The locust-king is named *Abaddon* (Revelation 9:11) — *destruction,* the same Abaddon that Job pairs with death as the deep powers that have only *heard the fame* of wisdom from afar. The angel of the pit is destruction personified, the ruin that stands at the farthest remove from the wisdom and the light of Elohim (God), ruling the abyss out of which the smoke arose.'),
  ('canon', 'revelation', 9, 11, 'canon', 'proverbs', 15, 11, 'free', E'*Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* (Proverbs 15:11). The king of the locusts is *Abaddon* — destruction (Revelation 9:11). Yet even *hell and destruction are before Yahuah (LORD)*: Abaddon is not a rival throne but a chamber laid open before the Most High, and its angel-king is loosed only when the trumpet sounds at Yahuah''s appointed hour. The pit and its ruler stand under the eye of the One before whom destruction itself is naked.'),
  ('canon', 'revelation', 9, 11, 'canon', 'psalms', 88, 11, 'free', E'*Shall thy lovingkindness be declared in the grave? or thy faithfulness in destruction?* (Psalm 88:11). The psalmist names *destruction* — Abaddon — as the lightless place where the praise of Yahuah (LORD) is not heard; and the king of that place is the locust-king *Abaddon* (Revelation 9:11). The angel of the bottomless pit rules the very Abaddon the psalm sets opposite the lovingkindness of Yahuah (LORD): the realm of ruin from which no faithfulness is declared, loosed in judgment under the fifth trumpet.'),
  ('canon', 'revelation', 9, 11, 'enoch', '1-enoch', 10, 4, 'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). The Hebrew library knows the angel bound in the pit. Azazel is *bound hand and foot* and cast into the darkness of a chasm in the desert — the chief of the fallen confined to the abyss until judgment. The locusts of Revelation have *a king over them, which is the angel of the bottomless pit* (Revelation 9:11): the bound angel of the pit Enoch named is the king loosed over the swarm.'),
  -- thread: revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5
  ('canon', 'revelation', 9, 14, 'canon', 'genesis', 15, 18, 'free', E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). The sixth angel is told to *Loose the four angels which are bound in the great river Euphrates* (Revelation 9:14). The Euphrates is the great river of the covenant boundary, named to Abram as the eastern edge of the promised inheritance. The judgment is loosed at the very river that marks the covenant land — the frontier of the promise becomes the gate of the sixth-trumpet host.'),
  ('canon', 'revelation', 9, 15, 'canon', 'jeremiah', 46, 10, 'free', E'*For this is the day of Adonai Yahuah (the Lord GOD) of hosts, a day of vengeance, that he may avenge him of his adversaries: and the sword shall devour, and it shall be satiate and made drunk with their blood: for Adonai Yahuah (the Lord GOD) of hosts hath a sacrifice in the north country by the river Euphrates.* (Jeremiah 46:10). The four angels were loosed *to slay the third part of men* (Revelation 9:15) — a slaughter at the Euphrates that re-speaks Jeremiah''s day of vengeance, when *the sword shall devour... by the river Euphrates.* The great river that was the place of Jeremiah''s sacrifice-of-judgment is the place from which the sixth trumpet looses its killing host.'),
  ('canon', 'revelation', 9, 17, 'canon', 'isaiah', 5, 26, 'free', E'*And he will lift up an ensign to the nations from far, and will hiss unto them from the end of the earth: and, behold, they shall come with speed swiftly* (Isaiah 5:26). The horsemen myriads of the sixth trumpet (Revelation 9:16-17) come as Isaiah''s summoned army comes — Yahuah (LORD) lifting *an ensign to the nations from far,* whistling up a host from the end of the earth to do his judgment. The two hundred thousand thousand horsemen are that distant army loosed; the seer sees Isaiah''s ensign-call answered.'),
  ('canon', 'revelation', 9, 17, 'canon', 'isaiah', 5, 28, 'free', E'*Whose arrows are sharp, and all their bows bent, their horses'' hoofs shall be counted like flint, and their wheels like a whirlwind* (Isaiah 5:28). John sees *the horses in the vision, and them that sat on them* (Revelation 9:17) — the war-host of Isaiah''s oracle, horses with *hoofs... like flint* and wheels *like a whirlwind,* unwearied and swift to judgment. The cavalry of the sixth trumpet is the tireless army Isaiah described, loosed from the Euphrates to slay.'),
  ('canon', 'revelation', 9, 17, 'canon', 'isaiah', 5, 29, 'free', E'*Their roaring shall be like a lion, they shall roar like young lions: yea, they shall roar, and lay hold of the prey, and shall carry it away safe, and none shall deliver it.* (Isaiah 5:29). The heads of the trumpet-horses are *as the heads of lions; and out of their mouths issued fire and smoke and brimstone* (Revelation 9:17). Isaiah''s judgment-army roared *like a lion... and none shall deliver* — and the lion-mouthed horses of Revelation are that roaring host, the prey-seizing army from which there is no deliverance, loosed at the Euphrates.'),
  -- thread: revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115
  ('canon', 'revelation', 9, 20, 'canon', 'deuteronomy', 32, 17, 'free', E'*They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). The unrepentant *repented not of the works of their hands, that they should not worship devils, and idols of gold* (Revelation 9:20). This is the charge of the Song of Moses returned — *they sacrificed unto devils, not to Elohim (God).* The same idolatry that provoked Yahuah (LORD) to jealousy in the wilderness is the idolatry the survivors of the trumpets will not forsake; behind the idols of gold stand the devils, exactly as the Torah named.'),
  ('canon', 'revelation', 9, 20, 'canon', 'psalms', 115, 4, 'free', E'*Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4). The men who survive the plagues will not turn from *idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk* (Revelation 9:20). The seer is quoting the psalm''s own indictment — *their idols are silver and gold, the work of men''s hands* — the made-things that are *the work of men''s hands,* powerless and dead, which the unrepentant still bow to after the trumpets have sounded.'),
  ('canon', 'revelation', 9, 20, 'canon', 'psalms', 115, 5, 'free', E'*They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). John''s indictment of the idols — *which neither can see, nor hear, nor walk* (Revelation 9:20) — is the psalm''s litany of the dead idols: *mouths, but they speak not: eyes have they, but they see not.* The seer re-speaks the Psalter''s mockery of the gods that cannot see or hear or move; the survivors worship what is more lifeless than themselves, and *they that make them are like unto them* (Psalm 115:8).'),
  ('canon', 'revelation', 9, 20, 'canon', 'psalms', 135, 15, 'free', E'*The idols of the heathen are silver and gold, the work of men''s hands.* (Psalm 135:15). Again the Psalter''s charge stands behind the verse: *idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk* (Revelation 9:20). *The idols of the heathen are silver and gold, the work of men''s hands* — dead works that *have ears, but they hear not; neither is there any breath in their mouths* (Psalm 135:17). The unrepentant cling to the breathless gods the Psalms had long since exposed.'),
  ('canon', 'revelation', 9, 20, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'*But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* (Wisdom 14:8). The survivors repent not of *the works of their hands, that they should not worship devils, and idols of gold* (Revelation 9:20). The Hebrew library had already pronounced the verdict: *that which is made with hands is cursed* — both the idol and its maker. The works-of-hands the unrepentant cling to are the cursed made-things of Wisdom''s polemic, the corruptible called god.'),
  ('canon', 'revelation', 9, 21, 'apocrypha', 'the-wisdom-of-solomon', 14, 27, 'extras', E'*For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* (Wisdom 14:27). After the idolatry of verse 20 comes the catalogue: *Neither repented they of their murders, nor of their sorceries, nor of their fornication, nor of their thefts* (Revelation 9:21). Wisdom names exactly this chain — idolatry as *the beginning, the cause, and the end, of all evil,* breeding bloodshed and uncleanness and deceit. The murders and sorceries and fornications the survivors will not forsake are the fruit of the idol-worship they will not forsake, just as the Hebrew library traced.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14',
       E'The fallen star and the key of the bottomless pit, the smoke as of a great furnace (Genesis 19, Isaiah 14, 1 Enoch 18)',
       E'The fifth trumpet opens on a fall and an unlocking: *And the fifth angel sounded, and I saw a star fall from heaven unto the earth: and to him was given the key of the bottomless pit. And he opened the bottomless pit; and there arose a smoke out of the pit, as the smoke of a great furnace; and the sun and the air were darkened by reason of the smoke of the pit* (Revelation 9:1-2). Every image here the seer draws from the older library. The fall is Isaiah''s taunt over the proud one: *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground* (Isaiah 14:12) — the one who said *I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13) and was answered, *Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:15). The star that reached for the height is given instead the key to the depth. And the smoke is Sodom''s smoke: Abraham *looked toward Sodom and Gomorrah... and, lo, the smoke of the country went up as the smoke of a furnace* (Genesis 19:28) — the oldest furnace of judgment in the Torah, now rising from the pit to darken the sun. The Hebrew library names the very chamber unlocked. Enoch was shown a waste place at the end of heaven and earth — *this has become a prison for the stars and the host of heaven* (1 Enoch 18:12) — the transgressing stars *bound... till the time when their guilt should be consummated* (1 Enoch 18:14), an abyss *cleft as far as the abyss, being full of great descending columns of fire* (1 Enoch 21:8). And he saw the fallen star itself seized and *cast into an abyss... narrow and deep, and horrible and dark* (1 Enoch 88:1). The fallen star, the prison-pit, the furnace-fire are one architecture across the witnesses; the trumpet only sounds the appointed hour at which the long-bound mouth is opened.',
       sv.verse_id, ev.verse_id, 'extras', 9200
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9',
       E'The locusts out of the smoke, and the sealed of Elohim (God) spared (Joel 1, Exodus 10, Ezekiel 9)',
       E'Out of the furnace-smoke comes the swarm: *And there came out of the smoke locusts upon the earth: and unto them was given power, as the scorpions of the earth have power. And it was commanded them that they should not hurt the grass of the earth, neither any green thing, neither any tree; but only those men which have not the seal of Elohim (God) in their foreheads* (Revelation 9:3-4). The locust is Joel''s — the devouring wave of the day of Yahuah (LORD): *That which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten* (Joel 1:4). And it is the eighth plague of Egypt returned, when Yahuah (LORD) told Moses to *Stretch out thine hand over the land of Egypt for the locusts... and eat every herb of the land* (Exodus 10:12), so that *there remained not any green thing in the trees, or in the herbs of the field, through all the land of Egypt* (Exodus 10:15). But mark the covenant turn: the trumpet-locusts are forbidden the green and aimed at men — and only at *those men which have not the seal of Elohim (God) in their foreheads.* This is Ezekiel''s mark restored. Yahuah (LORD) sent the man with the inkhorn to *set a mark upon the foreheads of the men that sigh and that cry for all the abominations* (Ezekiel 9:4), and told the destroyers, *come not near any man upon whom is the mark* (Ezekiel 9:6). The sealed of chapter 7 are the marked of Ezekiel 9; the plague divides the kept from the smitten exactly where the seal divides them. Those who bear the seal of Elohim are passed over, as the marked were passed over in the city — the same boundary, held across the whole story of judgment.',
       sv.verse_id, ev.verse_id, 'free', 9203
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8',
       E'Five months'' torment, and men seeking death and not finding it (Job 3, Jeremiah 8)',
       E'The locusts are given a measured cruelty: *And to them it was given that they should not kill them, but that they should be tormented five months: and their torment was as the torment of a scorpion, when he striketh a man. And in those days shall men seek death, and shall not find it; and shall desire to die, and death shall flee from them* (Revelation 9:5-6). This is no new horror but a cry the older library had already uttered. Job, in the depth of his anguish, spoke of those *which long for death, but it cometh not; and dig for it more than for hid treasures* (Job 3:21) — the very torment of the fifth trumpet, to seek the grave and not be granted it. And Jeremiah foretold a judgment so bitter on the residue driven out for their abominations that *death shall be chosen rather than life by all the residue of them that remain of this evil family, which remain in all the places whither I have driven them* (Jeremiah 8:3). The men stung by the scorpion-locusts are brought to Job''s desperation and Jeremiah''s sentence at once: they choose death and are denied even that, the torment outlasting the desire to die. The trumpet does not annihilate; it presses men to the edge where Job and Jeremiah stood, and holds them there for the appointed five months.',
       sv.verse_id, ev.verse_id, 'free', 9206
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2',
       E'The shapes of the locusts, like Joel''s army of horses (Joel 1 and 2)',
       E'The seer describes the swarm shape by shape, and every line is Joel''s locust-army made vision: *And the shapes of the locusts were like unto horses prepared unto battle; and on their heads were as it were crowns like gold, and their faces were as the faces of men. And they had hair as the hair of women, and their teeth were as the teeth of lions... and the sound of their wings was as the sound of chariots of many horses running to battle* (Revelation 9:7-9). Joel had named the day-of-Yahuah army in just these terms: *The appearance of them is as the appearance of horses; and as horsemen, so shall they run* (Joel 2:4); *Like the noise of chariots on the tops of mountains shall they leap... as a strong people set in battle array* (Joel 2:5). The lion''s mouth is Joel''s too — the locust-nation *whose teeth are the teeth of a lion, and he hath the cheek teeth of a great lion* (Joel 1:6). And the dread that goes before the host is the dread of Joel''s day: *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining* (Joel 2:10). The trumpet-locusts are not a fresh invention; they are Joel''s strong and numberless army, horse-shaped and chariot-loud and lion-toothed, the prophet''s vision of the advancing day of Yahuah loosed under the fifth trumpet.',
       sv.verse_id, ev.verse_id, 'free', 9209
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88',
       E'Abaddon, Apollyon — the angel of the bottomless pit (Job 26, Proverbs 15, Psalm 88, 1 Enoch 10)',
       E'The swarm has a sovereign: *And they had a king over them, which is the angel of the bottomless pit, whose name in the Hebrew tongue is Abaddon, but in the Greek tongue hath his name Apollyon* (Revelation 9:11). The Hebrew name is no invention — it is a word the Tanakh already carried for the realm of ruin. Job pairs it with death and the grave: *Hell is naked before him, and destruction hath no covering* (Job 26:6), and *Destruction and death say, We have heard the fame thereof with our ears* (Job 28:22) — Abaddon as the deep power that stands at the farthest remove from wisdom and light. The Proverbs set it under the eye of the Most High: *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* (Proverbs 15:11) — Abaddon is not a rival throne but a chamber laid open before Yahuah (LORD). And the psalmist names it the lightless place where praise is not heard: *Shall thy lovingkindness be declared in the grave? or thy faithfulness in destruction?* (Psalm 88:11). The king of the locusts bears the name of Destruction itself. And the Hebrew library knows the bound angel of that pit: Yahuah (God) said to Raphael, *Bind Azâzêl hand and foot, and cast him into the darkness* (1 Enoch 10:4) — the chief of the fallen confined to a chasm in the desert until judgment. The angel of the bottomless pit Enoch named is the king loosed over the swarm; yet even Abaddon stands before Yahuah, and its king is unbound only at the trumpet''s appointed hour.',
       sv.verse_id, ev.verse_id, 'extras', 9212
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5',
       E'The four angels bound at the great river Euphrates, and the horsemen myriads (Genesis 15, Jeremiah 46, Isaiah 5)',
       E'The sixth trumpet looses a host at a river the covenant had long marked: *Loose the four angels which are bound in the great river Euphrates. And the four angels were loosed, which were prepared for an hour, and a day, and a month, and a year, for to slay the third part of men. And the number of the army of the horsemen were two hundred thousand thousand* (Revelation 9:14-16). The Euphrates is the great river of the promise — *Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18), the eastern boundary sworn to Abram. The judgment is loosed at the very frontier of the covenant land. And the slaughter at that river re-speaks Jeremiah''s day of vengeance: *this is the day of Adonai Yahuah (the Lord GOD) of hosts, a day of vengeance... for Adonai Yahuah (the Lord GOD) of hosts hath a sacrifice in the north country by the river Euphrates* (Jeremiah 46:10). The horsemen themselves — *the heads of the horses were as the heads of lions; and out of their mouths issued fire and smoke and brimstone* (Revelation 9:17) — are Isaiah''s summoned army. Yahuah (LORD) *will lift up an ensign to the nations from far, and will hiss unto them from the end of the earth: and, behold, they shall come with speed swiftly* (Isaiah 5:26); their *horses'' hoofs shall be counted like flint, and their wheels like a whirlwind* (Isaiah 5:28); and *their roaring shall be like a lion... they shall roar, and lay hold of the prey, and shall carry it away safe, and none shall deliver it* (Isaiah 5:29). The myriad cavalry of the sixth trumpet is the tireless, lion-roaring, ensign-summoned host the prophets described, loosed at the covenant river to do the day of vengeance.',
       sv.verse_id, ev.verse_id, 'free', 9215
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115',
       E'They repented not of worshipping devils and idols of gold (Deuteronomy 32, Psalm 115, Psalm 135, Wisdom 14)',
       E'The chapter closes on the diagnostic that defines the unrepentant of the whole book: *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk: Neither repented they of their murders, nor of their sorceries, nor of their fornication, nor of their thefts* (Revelation 9:20-21). This is the charge of the Song of Moses returned. Behind the idols of gold stand the devils, exactly as the Torah named: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not* (Deuteronomy 32:17). And the seer takes up the Psalter''s mockery of the dead made-things: *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4); *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5); *The idols of the heathen are silver and gold, the work of men''s hands* (Psalm 135:15) — the very list John gives, *which neither can see, nor hear, nor walk.* The Hebrew library had pronounced the verdict already: *that which is made with hands is cursed, as well it, as he that made it* (Wisdom 14:8); and *the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil* (Wisdom 14:27). So the catalogue of verse 21 — murders, sorceries, fornication, thefts — is no random list but the fruit of the idol-worship the survivors will not forsake, just as Wisdom traced idolatry as the root that breeds bloodshed and uncleanness. The plagues fall, the third part dies, and still the rest cling to the breathless gods the Torah and the Psalms had long exposed; the trumpets are a summons to repentance the unrepentant refuse.',
       sv.verse_id, ev.verse_id, 'extras', 9218
  FROM _s224_rv09_lookup sv, _s224_rv09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning!* the taunt over the fallen one is the fall the seer watches, a star cast down to the earth (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *I will exalt my throne above the stars of Elohim (God)* the pride that reached for the height is answered by the plunge to the pit (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 14:15 — *Yet thou shalt be brought down to hell, to the sides of the pit* the destiny of the fallen is the pit now unlocked, *the key of the bottomless pit* (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 19:28 — *the smoke of the country went up as the smoke of a furnace* the oldest furnace of judgment in the Torah, the smoke of Sodom risen from the pit (Revelation 9:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 18:12 — *this has become a prison for the stars and the host of heaven* the Hebrew library names the prison-pit of the fallen stars the seer sees opened (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 18:14 — *He was wroth with them, and bound them till the time when their guilt should be consummated* the binding Enoch saw and the loosing John sees are two ends of one story (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 21:8 — *the place was cleft as far as the abyss, being full of great descending columns of fire* the furnace-place from which the smoke of the pit rises (Revelation 9:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Enoch 88:1 — *that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss* the fallen star itself seized and cast into the abyss (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 1:4 — *that which the locust hath left hath the cankerworm eaten* the devouring wave of the day of Yahuah, the locust loosed from the smoke (Revelation 9:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 10:12 — *Stretch out thine hand over the land of Egypt for the locusts* the eighth plague returned, the same Yahuah looses the trumpet-locusts (Revelation 9:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 10:15 — *there remained not any green thing in the trees, or in the herbs of the field* the plague that stripped Egypt''s green is now forbidden the green and aimed at the unsealed (Revelation 9:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 9:4 — *set a mark upon the foreheads of the men that sigh and that cry for all the abominations* the seal of Elohim restored; the marked are spared the plague (Revelation 9:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 9:6 — *come not near any man upon whom is the mark* the destroyer passes by every marked forehead, as the locusts pass by the sealed (Revelation 9:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 3:21 — *Which long for death, but it cometh not; and dig for it more than for hid treasures* Job named the torment of the fifth trumpet, to seek the grave and not find it (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 8:3 — *death shall be chosen rather than life by all the residue... whither I have driven them* the prophet''s sentence on the residue fulfilled; men choose death and are denied it (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:4 — *The appearance of them is as the appearance of horses; and as horsemen, so shall they run* Joel''s own simile for the day-of-Yahuah army, the locusts like horses prepared to battle (Revelation 9:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 1:6 — *whose teeth are the teeth of a lion, and he hath the cheek teeth of a great lion* Joel named the locust-nation by its lion''s teeth, the mouth of the swarm (Revelation 9:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:5 — *Like the noise of chariots on the tops of mountains shall they leap* the chariot-noise of the locust-army, the sound of their wings (Revelation 9:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joel 2:10 — *The earth shall quake before them; the heavens shall tremble* the cosmic dread before Joel''s advancing host, the air the trumpet-locusts breathe (Revelation 9:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 26:6 — *Hell is naked before him, and destruction hath no covering* Abaddon, the very word the king of the pit bears, the realm of ruin naked before Yahuah (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=26 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 28:22 — *Destruction and death say, We have heard the fame thereof with our ears* Abaddon paired with death, the deep power at the farthest remove from wisdom (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 15:11 — *Hell and destruction are before Yahuah (LORD)* Abaddon is no rival throne but a chamber laid open before the Most High (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 88:11 — *or thy faithfulness in destruction?* Abaddon the lightless place where praise is not heard, the realm the king of the pit rules (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=88 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* the bound angel of the pit Enoch named, the king loosed over the swarm (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:18 — *the great river, the river Euphrates* the eastern boundary of the covenant promise, the river where the judgment is loosed (Revelation 9:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 46:10 — *a day of vengeance... by the river Euphrates* the slaughter to slay the third part re-speaks Jeremiah''s day of vengeance at the river (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=46 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 5:26 — *he will lift up an ensign to the nations from far, and will hiss unto them* the horsemen myriads come as Isaiah''s summoned army, the ensign-call answered (Revelation 9:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 5:28 — *their horses'' hoofs shall be counted like flint, and their wheels like a whirlwind* the tireless swift war-host, the cavalry of the sixth trumpet (Revelation 9:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 5:29 — *Their roaring shall be like a lion... and none shall deliver it* the lion-mouthed horses are Isaiah''s roaring, prey-seizing host from which there is no deliverance (Revelation 9:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God)* the charge of the Song of Moses returned; behind the idols of gold stand the devils (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands* the made-things the unrepentant cling to, the seer quoting the psalm''s indictment (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not* the psalm''s litany of dead idols, *which neither can see, nor hear, nor walk* (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 135:15 — *The idols of the heathen are silver and gold, the work of men''s hands* the breathless gods the survivors cling to, exposed by the Psalter (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom 14:8 — *that which is made with hands is cursed, as well it, as he that made it* the Hebrew library''s verdict on the works-of-hands the unrepentant cling to (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom 14:27 — *the worshipping of idols... is the beginning, the cause, and the end, of all evil* idolatry as the root that breeds the murders, sorceries, and fornication of verse 21 (Revelation 9:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv09_lookup sv, _s224_rv09_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_10.sql (S224 Revelation 10) -----
-- =====================================================================
-- S224 minion — REVELATION 10 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 10 (11 verses) — the mighty angel and the little scroll eaten.
-- Tag: rv10 (temp view _s224_rv10_lookup).
-- Sort band: floor 9225, step 3 (9225, 9228, 9231, 9234, 9237, 9240 used; under 9250).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation 10 is the prophet's re-commissioning, woven entirely out of the
-- Tanakh's own commissioning scenes. The mighty angel clothed with a cloud, rainbowed, face as the
-- sun, feet as pillars of fire, is the theophany-glory of Ezekiel's throne-chariot (Ezekiel 1) and
-- the man clothed in linen of Daniel 10, with the Exodus pillar of cloud and fire standing behind.
-- His cry as a lion roaring is Amos's *Yahuah (LORD) will roar from Zion*; the seven thunders sealed
-- up are Daniel's *shut up the words, and seal the book*. The oath — hand lifted to heaven, by *him
-- that liveth for ever and ever, who created heaven... the earth... the sea* — is Moses' *I lift up
-- my hand to heaven, and say, I live for ever* (Deuteronomy 32:40), Daniel's man-clothed-in-linen
-- oath (Daniel 12:7), and the Levites' creation-confession (Nehemiah 9:6). The mystery finished *as
-- he hath declared to his servants the prophets* is Amos 3:7 verbatim in substance. And the little
-- book eaten — sweet as honey in the mouth, bitter in the belly, *thou must prophesy again* — is
-- Ezekiel's scroll eaten (Ezekiel 2:8-3:3) and Jeremiah's *Thy words were found, and I did eat
-- them* (15:16), the prophet re-sent to the nations as Jeremiah was (1:9-10). John is not a new
-- prophet of a new religion but the latest in the one line of Yahuah (LORD)'s servants the prophets,
-- eating the same word and sent to the same nations. The extras breathe the same air: Esdras drinks
-- the fiery cup and his mouth is opened (2 Esdras 14:38-47), the heavenly tablets read and understood
-- (1 Enoch 81:1-2). Christology held as the pull gives: the One sworn by is *him that liveth for ever
-- and ever, who created* — the Father, the Formless source; no Trinitarian grammar surfaces.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the mighty angel: cloud, rainbow, face as the sun, feet as pillars of fire, little book open
--           Tanakh: Ezekiel 1:26-28 (the rainbow-glory above the throne), Daniel 10:5-6 (the man in
--                   linen, face as lightning, feet as polished brass), Exodus 13:21-22 (the pillar of
--                   cloud and pillar of fire)
--           Extras: none warranted (the open-book witness carried at v.8-10)   NT: none warranted
--   v.3-4   the cry as a lion roaring; the seven thunders; seal up and write them not
--           Tanakh: Amos 1:2 (Yahuah will roar from Zion, and utter his voice), Amos 3:8 (the lion
--                   hath roared, who will not fear), Daniel 8:26 (shut thou up the vision), Daniel
--                   12:4 (shut up the words, and seal the book), Daniel 12:9 (the words are closed up
--                   and sealed)
--           Extras: none warranted   NT: none warranted
--   v.5-6   the oath: hand lifted to heaven, by him that liveth for ever, who created heaven, earth, sea
--           Tanakh: Deuteronomy 32:40 (I lift up my hand to heaven, and say, I live for ever),
--                   Daniel 12:7 (the man in linen held up his hands and sware by him that liveth for
--                   ever), Nehemiah 9:6 (thou hast made heaven... the earth... the seas, and all that
--                   is therein)
--           Extras: none warranted   NT: none warranted
--   v.7     the mystery of Elohim finished, as he hath declared to his servants the prophets
--           Tanakh: Amos 3:7 (he revealeth his secret unto his servants the prophets)
--           Extras: 1 Enoch 81:1-2 (the heavenly tablets read and understood — the revealed secret)
--           NT: none warranted (carried in the Tanakh root)
--   v.8-10  take it, and eat it up; sweet as honey in the mouth, bitter in the belly
--           Tanakh: Ezekiel 2:8 (open thy mouth, and eat that I give thee), Ezekiel 3:1 (eat this
--                   roll, and go speak), Ezekiel 3:3 (it was in my mouth as honey for sweetness),
--                   Jeremiah 15:16 (Thy words were found, and I did eat them), Psalm 19:10 (sweeter
--                   also than honey and the honeycomb), Psalm 119:103 (sweeter than honey to my mouth)
--           Extras: 2 Esdras 14:38-41 (Esdras drinks the fiery cup, his mouth opened and shut no more)
--           NT: none warranted
--   v.11    thou must prophesy again before many peoples, and nations, and tongues, and kings
--           Tanakh: Ezekiel 3:4 (go, get thee unto the house of Yashar'el, and speak my words),
--                   Jeremiah 1:9-10 (I have put my words in thy mouth... set thee over the nations)
--           Extras: 2 Esdras 14:45-47 (publish openly... keep the seventy for the wise — re-sent to write)
--           NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9225 revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1   (Tanakh)
--   9228 revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel                     (Tanakh)
--   9231 revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12              (Tanakh)
--   9234 revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3                 (Tanakh + Extras)
--   9237 revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3              (Tanakh + Extras)
--   9240 revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3     (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s224_rv10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1
  ('canon', 'revelation', 10, 1, 'canon', 'ezekiel', 1, 28, 'free', E'*As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* (Ezekiel 1:28). John sees *another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head* (Revelation 10:1). The rainbow set in the cloud is the very sign that crowned the throne-glory in Ezekiel''s vision — *the appearance of the bow that is in the cloud* round about *the glory of Yahuah (LORD).* The seer of the Apocalypse has the throne-chariot of Ezekiel in his eye: the cloud, the bow, the descending brightness are the Tanakh''s own vocabulary for the manifest glory of the Almighty.'),
  ('canon', 'revelation', 10, 1, 'canon', 'daniel', 10, 6, 'free', E'*His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* (Daniel 10:6). The mighty angel''s *face was as it were the sun, and his feet as pillars of fire* (Revelation 10:1). This is the man clothed in linen Daniel saw by the great river — face blazing, feet as burnished brass, voice as a multitude. The same shining messenger that came to Daniel *to make thee understand what shall befall thy people in the latter days* (Daniel 10:14) stands now upon the sea and the earth; the latter-day revelation is one revelation, and its bearer wears the same glory.'),
  ('canon', 'revelation', 10, 1, 'canon', 'exodus', 13, 21, 'free', E'*And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21). The angel comes *clothed with a cloud... and his feet as pillars of fire* (Revelation 10:1). The cloud and the pillar of fire are the Exodus presence — Yahuah (LORD) himself going before his people, the pillar that *he took not away... from before the people* (Exodus 13:22). The deliverer''s glory that led the redeemed out of bondage now stands astride the sea and the land, the same presence overshadowing the new exodus the Apocalypse unfolds.'),
  ('canon', 'revelation', 10, 2, 'canon', 'ezekiel', 1, 26, 'free', E'*And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26). The angel *had in his hand a little book open: and he set his right foot upon the sea, and his left foot on the earth* (Revelation 10:2). The figure astride sea and earth, holding the open book, stands in the lineage of the man-likeness enthroned above the firmament in Ezekiel — the glory that holds dominion over the whole creation. The little book open in his hand is the word about to be given, the throne-glory bending down to commission the prophet.'),
  -- thread: revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel
  ('canon', 'revelation', 10, 3, 'canon', 'amos', 1, 2, 'free', E'*And he said, Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem; and the habitations of the shepherds shall mourn, and the top of Carmel shall wither.* (Amos 1:2). The angel *cried with a loud voice, as when a lion roareth* (Revelation 10:3). The roaring is the prophet''s own opening note: *Yahuah (LORD) will roar from Zion, and utter his voice* — the lion''s cry that announces the day of judgment and the utterance of the divine word. The Apocalypse speaks in Amos''s very idiom: the loud voice that breaks the silence of the vision is the roar of Yahuah (LORD) from his holy hill.'),
  ('canon', 'revelation', 10, 3, 'canon', 'amos', 3, 8, 'free', E'*The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* (Amos 3:8). The angel cries *as when a lion roareth* (Revelation 10:3). Amos binds the lion''s roar to the compulsion of prophecy: when the lion roars, fear takes hold; when Adonai Yahuah (the Lord GOD) speaks, the prophet *can but prophesy.* So the roaring cry of the mighty angel is no empty noise — it is the summons to prophecy, the very compulsion that will lay hold of John in *thou must prophesy again* (Revelation 10:11).'),
  ('canon', 'revelation', 10, 4, 'canon', 'daniel', 12, 4, 'free', E'*But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* (Daniel 12:4). When the seven thunders had uttered their voices, John *was about to write,* and heard a voice from heaven, *Seal up those things which the seven thunders uttered, and write them not* (Revelation 10:4). This is Daniel''s command turned upon John: as Daniel was told to *shut up the words, and seal the book... to the time of the end,* so the thunders are sealed. Not every revelation is to be published; some things Yahuah (LORD) seals until their hour, and the prophet obeys the seal as readily as he obeys the command to speak.'),
  ('canon', 'revelation', 10, 4, 'canon', 'daniel', 12, 9, 'free', E'*And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* (Daniel 12:9). *Seal up those things which the seven thunders uttered, and write them not* (Revelation 10:4). The answer given to Daniel — *the words are closed up and sealed till the time of the end* — is the pattern of the sealed thunders. The Apocalypse, which elsewhere unseals (the scroll of chapter 5, the seals broken one by one), here seals again, showing that the timing of revelation rests wholly in the hand of Yahuah (LORD): what is opened and what is closed up are alike his to appoint.'),
  ('canon', 'revelation', 10, 4, 'canon', 'daniel', 8, 26, 'free', E'*And the vision of the evening and the morning which was told is true: wherefore shut thou up the vision; for it shall be for many days.* (Daniel 8:26). *Seal up those things which the seven thunders uttered, and write them not* (Revelation 10:4). Daniel too was told, after a true vision, *shut thou up the vision; for it shall be for many days.* The sealing is no denial of the word''s truth — the vision *is true* — but a reserving of it for its season. The seven thunders spoke truly, yet their utterance is shut up; the prophet keeps what is given to keep and writes what is given to write.'),
  -- thread: revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12
  ('canon', 'revelation', 10, 5, 'canon', 'deuteronomy', 32, 40, 'free', E'*For I lift up my hand to heaven, and say, I live for ever.* (Deuteronomy 32:40). The angel *lifted up his hand to heaven, and sware by him that liveth for ever and ever* (Revelation 10:5-6). This is the oath-gesture of the Song of Moses, where Yahuah (LORD) himself swears: *I lift up my hand to heaven, and say, I live for ever.* The mighty angel takes up the very posture and the very swearing-formula of the Almighty — the raised hand, the appeal to the One who lives for ever — binding the heavenly oath of Deuteronomy to the consummation the Apocalypse declares.'),
  ('canon', 'revelation', 10, 5, 'canon', 'daniel', 12, 7, 'free', E'*And I heard the man clothed in linen, which was upon the waters of the river, when he held up his right hand and his left hand unto heaven, and sware by him that liveth for ever that it shall be for a time, times, and an half; and when he shall have accomplished to scatter the power of the holy people, all these things shall be finished.* (Daniel 12:7). *And the angel which I saw stand upon the sea and upon the earth lifted up his hand to heaven, and sware by him that liveth for ever and ever* (Revelation 10:5-6). The scene is Daniel''s, re-walked: the man clothed in linen upon the waters, the hand lifted, the oath *by him that liveth for ever,* the declaration that *all these things shall be finished.* John''s angel echoes the same swearing and the same finishing — *the mystery of Elohim (God) should be finished* (Revelation 10:7) answers Daniel''s *all these things shall be finished.*'),
  ('canon', 'revelation', 10, 6, 'canon', 'nehemiah', 9, 6, 'free', E'*Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The angel swears *by him that liveth for ever and ever, who created heaven, and the things that therein are, and the earth, and the things that therein are, and the sea, and the things which are therein* (Revelation 10:6). The threefold creation-confession — heaven, earth, sea, and all therein — is the Levites'' great prayer of return: *thou hast made heaven... the earth... the seas, and all that is therein.* The oath is sworn by the Creator alone, *Yahuah (LORD) alone,* the One whom *the host of heaven worshippeth* — worship and oath alike belonging to the Maker of all.'),
  -- thread: revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3
  ('canon', 'revelation', 10, 7, 'canon', 'amos', 3, 7, 'free', E'*Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets.* (Amos 3:7). *But in the days of the voice of the seventh angel... the mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7). The Apocalypse says plainly what Amos said: the mystery is no secret kept from men but a secret *revealed... unto his servants the prophets.* The finishing of the mystery at the seventh trumpet is the bringing to pass of all that Yahuah (LORD) had long before *declared to his servants the prophets* — the whole prophetic word coming to its consummation, nothing done that was not first revealed.'),
  ('canon', 'revelation', 10, 7, 'enoch', '1-enoch', 81, 1, 'extras', E'*And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* (1 Enoch 81:1). *The mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7). The restored library remembers the prophet shown the heavenly tablets where the appointed things are written — *read what is written thereon, and understand every single fact.* The mystery of Elohim (God) is what stands written in heaven and is unveiled to his servants; the seventh trumpet brings to pass the very things the seer was given to read and understand, the declared secret made finished fact.'),
  ('canon', 'revelation', 10, 7, 'enoch', '1-enoch', 81, 2, 'extras', E'*And I observed everything on the heavenly tablets, And read everything which was written (thereon), And understood everything, And read the book and everything that was written in it, All the works of men.* (1 Enoch 81:2). *The mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7). The heavenly book read and understood — *all the works of men* — is the same revealed secret the Apocalypse calls the mystery now to be finished. What is written on high and shown to the servants of Yahuah (LORD) is exactly what comes to pass; the prophet does not invent the mystery but reads it where it is already written and declares it.'),
  -- thread: revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3
  ('canon', 'revelation', 10, 9, 'canon', 'ezekiel', 2, 8, 'free', E'*But thou, son of Adam, hear what I say unto thee; Be not thou rebellious like that rebellious house: open thy mouth, and eat that I give thee.* (Ezekiel 2:8). The angel says, *Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9). This is Ezekiel''s commission re-enacted: *open thy mouth, and eat that I give thee* — the prophet must take the word into himself before he can speak it. What was set before Ezekiel by the river of Chebar is set before John upon the sea and the earth; the eating of the scroll is the receiving of the word that becomes the prophet''s own.'),
  ('canon', 'revelation', 10, 9, 'canon', 'ezekiel', 3, 1, 'free', E'*Moreover he said unto me, Son of Adam, eat that thou findest; eat this roll, and go speak unto the house of Yashar''el (Israel).* (Ezekiel 3:1). *Take it, and eat it up* (Revelation 10:9), and *thou must prophesy again* (Revelation 10:11). The pattern is exact: *eat this roll, and go speak* — first the eating, then the speaking. The roll Ezekiel ate was written *within and without... lamentations, and mourning, and woe* (Ezekiel 2:10), the bitter word of judgment; and so the little book makes John''s belly bitter even as it is sweet in his mouth. To eat the roll is to be made a prophet of it.'),
  ('canon', 'revelation', 10, 10, 'canon', 'ezekiel', 3, 3, 'free', E'*And he said unto me, Son of Adam, cause thy belly to eat, and fill thy bowels with this roll that I give thee. Then did I eat it; and it was in my mouth as honey for sweetness.* (Ezekiel 3:3). *And I took the little book out of the angel''s hand, and ate it up; and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter.* (Revelation 10:10). The honey-sweetness is Ezekiel''s exact experience: *it was in my mouth as honey for sweetness.* The word of Yahuah (LORD) is sweet to receive — and yet the same word, *lamentations, and mourning, and woe,* turns bitter in the belly of the one sent to deliver it to a rebellious house. Sweet to take in, bitter to carry: the prophet''s lot.'),
  ('canon', 'revelation', 10, 9, 'canon', 'jeremiah', 15, 16, 'free', E'*Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Yahuah Elohim (LORD God) of hosts.* (Jeremiah 15:16). *Take it, and eat it up; and it shall... be in thy mouth sweet as honey* (Revelation 10:9). Jeremiah knew the same eating: *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart.* The sweetness of the eaten word is the joy of the prophet who takes the word of Yahuah (LORD) into his very self — and Jeremiah too knew its bitterness, the strife and contention it made him bear. The little book of the Apocalypse is the same word, eaten by the same kind of man.'),
  ('canon', 'revelation', 10, 10, 'canon', 'psalms', 19, 10, 'free', E'*More to be desired are they than gold, yea, than much fine gold: sweeter also than honey and the honeycomb.* (Psalm 19:10). *It was in my mouth sweet as honey* (Revelation 10:10). The psalm of the law of Yahuah (LORD) names the very sweetness: the words of Yahuah (LORD) are *sweeter also than honey and the honeycomb.* The little book is honey in John''s mouth because it is the word of Yahuah (LORD), and the word of Yahuah (LORD) is sweetness itself to the one who loves it — *the law of Yahuah (LORD) is perfect, converting the soul* (Psalm 19:7), and sweeter than the honeycomb to taste.'),
  ('canon', 'revelation', 10, 10, 'canon', 'psalms', 119, 103, 'free', E'*How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103). *It was in my mouth sweet as honey* (Revelation 10:10). The great psalm of the Torah cries the same delight: *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* The eaten scroll is sweet because it is the word of Yahuah (LORD), and the heart that loves his commandments finds them sweeter than honey in the mouth. The prophet''s eating is the believer''s delight made vision — the word taken in and tasted as the sweetest thing.'),
  ('canon', 'revelation', 10, 10, 'apocrypha', '2-esdras', 14, 40, 'extras', E'*And I took it, and drank: and when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast, for my spirit strengthened my memory* (2 Esdras 14:40). *And I took the little book out of the angel''s hand, and ate it up; and it was in my mouth sweet as honey* (Revelation 10:10). The restored library tells the same taking-in of the word: Esdras is given a full cup *like fire* to drink, and when he had drunk, *my heart uttered understanding, and wisdom grew in my breast,* and *my mouth was opened, and shut no more* (2 Esdras 14:41). To receive the word — whether eaten as a scroll or drunk as a fiery cup — is to be filled with understanding and made able to speak; the prophet is equipped from within for the speaking that follows.'),
  -- thread: revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3
  ('canon', 'revelation', 10, 11, 'canon', 'jeremiah', 1, 9, 'free', E'*Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth.* (Jeremiah 1:9). *And he said unto me, Thou must prophesy again before many peoples, and nations, and tongues, and kings.* (Revelation 10:11). Jeremiah''s call is the pattern: Yahuah (LORD) touches the mouth and puts his words in it. John has eaten the word into his mouth, and now is sent to speak it — the same commissioning, mouth filled with the word of Yahuah (LORD) and sent forth to proclaim it.'),
  ('canon', 'revelation', 10, 11, 'canon', 'jeremiah', 1, 10, 'free', E'*See, I have this day set thee over the nations and over the kingdoms, to root out, and to pull down, and to destroy, and to throw down, to build, and to plant.* (Jeremiah 1:10). *Thou must prophesy again before many peoples, and nations, and tongues, and kings.* (Revelation 10:11). Jeremiah was *set... over the nations and over the kingdoms* — and John is sent *before many peoples, and nations, and tongues, and kings.* The scope is the same: the prophet of Yahuah (LORD) is not sent to one people only but over the nations, his word a word of uprooting and planting among the kingdoms of the earth. The latter prophet stands in the office of the former.'),
  ('canon', 'revelation', 10, 11, 'canon', 'ezekiel', 3, 4, 'free', E'*And he said unto me, Son of Adam, go, get thee unto the house of Yashar''el (Israel), and speak with my words unto them.* (Ezekiel 3:4). *Thou must prophesy again before many peoples, and nations, and tongues, and kings* (Revelation 10:11). Having eaten the roll, Ezekiel is sent: *go... and speak with my words unto them.* So John, having eaten the little book, is sent again to prophesy. The eating was for the sake of the sending; the word taken in is the word given out. The commission of Ezekiel — eat, then go and speak — is the commission of John, now widened to *many peoples, and nations, and tongues, and kings.*'),
  ('canon', 'revelation', 10, 11, 'apocrypha', '2-esdras', 14, 45, 'extras', E'*And it came to pass, when the forty days were filled, that the Highest spoke, saying, The first that you have written publish openly, that the worthy and unworthy may read it* (2 Esdras 14:45). *Thou must prophesy again before many peoples, and nations, and tongues, and kings* (Revelation 10:11). The restored library tells the prophet re-sent to speak and write: Esdras, his mouth opened, is bidden to *publish openly* what is for all and *keep the seventy last* for the wise alone (2 Esdras 14:46) — the same double charge the Apocalypse weaves, where some things are sealed up and others are to be prophesied openly. The prophet of Yahuah (LORD) is sent again with the word, to publish to the many and to seal what must be sealed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1',
       E'The mighty angel clothed with a cloud, the rainbow, and the pillars of fire (Ezekiel 1)',
       E'John sees *another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire* (Revelation 10:1), and *he had in his hand a little book open: and he set his right foot upon the sea, and his left foot on the earth* (Revelation 10:2). Every feature is drawn from the Tanakh''s theophany-glory. The rainbow set in the cloud is the crown of Ezekiel''s throne-vision — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD)* (Ezekiel 1:28) — and the man-likeness enthroned above the firmament, *upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26), is the glory that holds dominion over the whole creation, now bending down with the open book. The blazing face and the feet are the man clothed in linen Daniel saw by the great river — *his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass* (Daniel 10:6) — the same shining messenger that came *to make thee understand what shall befall thy people in the latter days* (Daniel 10:14). And the cloud and the pillar of fire are the Exodus presence itself: *Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light* (Exodus 13:21). The glory that led the redeemed out of bondage now stands astride the sea and the land, the same presence overshadowing the new exodus the Apocalypse unfolds. John is no inventor of strange sights; he sees with Ezekiel''s and Daniel''s and Moses'' eyes, and the mighty angel wears the one unbroken glory of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 9225
  FROM _s224_rv10_lookup sv, _s224_rv10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel',
       E'The cry as a lion roaring and the seven thunders sealed up (Amos and Daniel)',
       E'The angel *cried with a loud voice, as when a lion roareth: and when he had cried, seven thunders uttered their voices* (Revelation 10:3), and then a voice from heaven: *Seal up those things which the seven thunders uttered, and write them not* (Revelation 10:4). The lion''s roar is Amos''s opening note — *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2) — the cry of the Almighty from his holy hill that announces the day of his word. And Amos binds that roar to the very compulsion of prophecy: *The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* (Amos 3:8). So the roaring cry of the mighty angel is the summons to prophecy itself, the compulsion that will lay hold of John in *thou must prophesy again* (Revelation 10:11). But the seven thunders are sealed, and here the Apocalypse takes up Daniel''s charge. As Daniel was told, *shut up the words, and seal the book, even to the time of the end* (Daniel 12:4), and again, *the words are closed up and sealed till the time of the end* (Daniel 12:9), and of a true vision, *shut thou up the vision; for it shall be for many days* (Daniel 8:26) — so John must seal what the thunders spoke. The sealing is no denial of the word''s truth; the vision *is true.* It is the reserving of the word for its appointed season. The same book that unseals the scroll of chapter 5 and breaks the seals one by one here seals again, showing that the timing of revelation rests wholly in the hand of Yahuah (LORD): what is opened and what is closed up are alike his to appoint, and the prophet obeys the seal as readily as the command to speak.',
       sv.verse_id, ev.verse_id, 'free', 9228
  FROM _s224_rv10_lookup sv, _s224_rv10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12',
       E'The angel''s oath by him that liveth for ever, who created heaven, earth, and sea (Deuteronomy 32 and Daniel 12)',
       E'*And the angel which I saw stand upon the sea and upon the earth lifted up his hand to heaven, and sware by him that liveth for ever and ever, who created heaven, and the things that therein are, and the earth, and the things that therein are, and the sea, and the things which are therein, that there should be time no longer* (Revelation 10:5-6). The oath is the Tanakh''s own. The raised hand and the swearing-formula are the Song of Moses, where Yahuah (LORD) himself swears: *For I lift up my hand to heaven, and say, I live for ever* (Deuteronomy 32:40). The whole scene is Daniel''s, re-walked feature by feature: *I heard the man clothed in linen, which was upon the waters of the river, when he held up his right hand and his left hand unto heaven, and sware by him that liveth for ever that it shall be for a time, times, and an half; and when he shall have accomplished to scatter the power of the holy people, all these things shall be finished* (Daniel 12:7) — the figure upon the waters, the lifted hand, the oath *by him that liveth for ever,* and the declaration that *all these things shall be finished,* which John''s next verse answers: *the mystery of Elohim (God) should be finished* (Revelation 10:7). And the One sworn by is named by the threefold creation-confession of the Levites'' great prayer of return: *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee* (Nehemiah 9:6). The oath is sworn by the Creator alone — heaven, earth, sea, and all therein his — the One whom the host of heaven worships. Worship and oath alike belong to the Maker of all, and by him the consummation is sworn.',
       sv.verse_id, ev.verse_id, 'free', 9231
  FROM _s224_rv10_lookup sv, _s224_rv10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3',
       E'The mystery finished, as he hath declared to his servants the prophets (Amos 3)',
       E'*But in the days of the voice of the seventh angel, when he shall begin to sound, the mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7). The Apocalypse says plainly what Amos said long before: the mystery is no secret kept from men but a secret unveiled — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (Amos 3:7). The finishing of the mystery at the seventh trumpet is the bringing to pass of all that Yahuah (LORD) had already *declared to his servants the prophets*: the whole prophetic word coming to its consummation, nothing done in the earth that was not first revealed to the prophets who bore his word. The restored library breathes the same conviction — that the appointed things stand written and are shown to the seer to be read and understood. *Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact* (1 Enoch 81:1); *And I observed everything on the heavenly tablets, And read everything which was written (thereon), And understood everything, And read the book and everything that was written in it, All the works of men* (1 Enoch 81:2). The mystery of Elohim (God) is what stands written on high and is opened to his servants; the seventh trumpet brings to pass the very things the seer was given to read. The prophet does not invent the mystery — he reads it where Yahuah (LORD) has written it and declares it, and at the appointed sound it is finished.',
       sv.verse_id, ev.verse_id, 'extras', 9234
  FROM _s224_rv10_lookup sv, _s224_rv10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3',
       E'Take it, and eat it up — sweet as honey in the mouth, bitter in the belly (Ezekiel 2 and 3)',
       E'*And I went unto the angel, and said unto him, Give me the little book. And he said unto me, Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9), and so it was: *I took the little book out of the angel''s hand, and ate it up; and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10). This is Ezekiel''s commission re-enacted exactly. *Open thy mouth, and eat that I give thee* (Ezekiel 2:8); *eat this roll, and go speak unto the house of Yashar''el (Israel)* (Ezekiel 3:1); *cause thy belly to eat, and fill thy bowels with this roll that I give thee. Then did I eat it; and it was in my mouth as honey for sweetness* (Ezekiel 3:3). The prophet must take the word into himself before he can speak it, and the word of Yahuah (LORD) is honey-sweet to receive — yet Ezekiel''s roll was written *lamentations, and mourning, and woe* (Ezekiel 2:10), and so the same sweet word turns bitter in the belly of the one sent to carry it to a rebellious house. Jeremiah knew the same eating: *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* (Jeremiah 15:16) — and Jeremiah too bore its bitterness, the strife it made him carry. And the sweetness is the believer''s delight in the law of Yahuah (LORD) made vision: *More to be desired are they than gold, yea, than much fine gold: sweeter also than honey and the honeycomb* (Psalm 19:10); *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103). The restored library tells the same taking-in: Esdras is given a fiery cup to drink, and *when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast, for my spirit strengthened my memory* (2 Esdras 14:40), and his mouth was opened and shut no more. Whether eaten as a scroll or drunk as a cup, the word received fills the prophet with understanding and makes him able to speak — sweet to take in, bitter to bear, and the appointed lot of every servant of the word.',
       sv.verse_id, ev.verse_id, 'extras', 9237
  FROM _s224_rv10_lookup sv, _s224_rv10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3',
       E'Thou must prophesy again — the prophet sent to the nations (Jeremiah 1 and Ezekiel 3)',
       E'*And he said unto me, Thou must prophesy again before many peoples, and nations, and tongues, and kings* (Revelation 10:11). The eating was for the sake of the sending: the word taken in is the word given out. Jeremiah''s call is the pattern — *Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (Jeremiah 1:9) — and the scope is the same, the prophet set over the nations: *See, I have this day set thee over the nations and over the kingdoms, to root out, and to pull down, and to destroy, and to throw down, to build, and to plant* (Jeremiah 1:10). John, his mouth filled with the eaten word, is sent *before many peoples, and nations, and tongues, and kings* — over the nations and kingdoms, his word a word of uprooting and planting. And Ezekiel''s commission is the same shape — first eat, then go: *Son of Adam, go, get thee unto the house of Yashar''el (Israel), and speak with my words unto them* (Ezekiel 3:4). The restored library tells the prophet re-sent to speak and write: when his mouth was opened, Esdras was bidden, *The first that you have written publish openly, that the worthy and unworthy may read it* (2 Esdras 14:45), and to *keep the seventy last* for the wise alone (2 Esdras 14:46) — the same double charge the Apocalypse weaves, where some things are sealed up and others prophesied openly. John is not a new prophet of a new religion but the latest in the one line of Yahuah (LORD)''s servants the prophets, eating the same word and sent to the same nations, *that thou mayest prophesy again.*',
       sv.verse_id, ev.verse_id, 'extras', 9240
  FROM _s224_rv10_lookup sv, _s224_rv10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:28 — *the appearance of the bow that is in the cloud in the day of rain... the likeness of the glory of Yahuah (LORD)* the rainbow in the cloud crowning the throne-glory, now upon the angel''s head (Revelation 10:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:6 — *his face as the appearance of lightning, and his eyes as lamps of fire... his feet like in colour to polished brass* the man clothed in linen, the blazing face and feet of the latter-day messenger (Revelation 10:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 13:21 — *Yahuah (LORD) went before them by day in a pillar of a cloud... and by night in a pillar of fire* the Exodus presence, the cloud and pillars of fire now clothing the angel (Revelation 10:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:26 — *upon the likeness of the throne was the likeness as the appearance of a man above upon it* the man-likeness enthroned over the creation, the glory that holds the open book astride sea and earth (Revelation 10:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 1:2 — *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* the lion''s roar of the Almighty from his holy hill, the angel''s loud cry (Revelation 10:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 3:8 — *The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* the roar bound to the compulsion of prophecy, answered in *thou must prophesy again* (Revelation 10:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:4 — *shut up the words, and seal the book, even to the time of the end* Daniel''s sealing charge taken up; the thunders sealed and written not (Revelation 10:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:9 — *the words are closed up and sealed till the time of the end* the word reserved for its season; the Apocalypse seals what it does not yet publish (Revelation 10:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 8:26 — *shut thou up the vision; for it shall be for many days* the true vision sealed for its hour; sealing is no denial of the word''s truth (Revelation 10:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:40 — *For I lift up my hand to heaven, and say, I live for ever* the oath-gesture and swearing-formula of Yahuah (LORD) himself, taken up by the angel (Revelation 10:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:7 — *the man clothed in linen... held up his right hand and his left hand unto heaven, and sware by him that liveth for ever... all these things shall be finished* the scene re-walked; the oath and the finishing John''s v.7 answers (Revelation 10:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 9:6 — *thou hast made heaven... the earth, and all things that are therein, the seas, and all that is therein* the creation-confession naming the One sworn by, Yahuah (LORD) alone, Maker of all (Revelation 10:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 3:7 — *he revealeth his secret unto his servants the prophets* the mystery is the revealed secret; the seventh trumpet finishes what was declared to the prophets (Revelation 10:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 81:1 — *Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact* the appointed things written on high and shown to the seer; the mystery read where it is written (Revelation 10:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 81:2 — *I observed everything on the heavenly tablets, And read everything which was written... And understood everything* the seer reads and understands the heavenly book; what is written there comes to pass (Revelation 10:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-the-mystery-finished-he-revealeth-his-secret-unto-the-prophets-amos-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 2:8 — *open thy mouth, and eat that I give thee* the prophet must take the word into himself before he speaks it; John is given the same charge (Revelation 10:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 3:1 — *eat this roll, and go speak unto the house of Yashar''el (Israel)* first eat, then speak; the roll of *lamentations, and mourning, and woe* that makes the belly bitter (Revelation 10:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 3:3 — *Then did I eat it; and it was in my mouth as honey for sweetness* the exact honey-sweetness of the eaten roll, John''s own experience (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 15:16 — *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* the prophet who ate the word and knew its sweetness and its bitter strife (Revelation 10:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 19:10 — *sweeter also than honey and the honeycomb* the words of Yahuah (LORD) named as honey-sweet; the eaten book is sweet because it is his word (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 119:103 — *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* the believer''s delight in the Torah made vision; the word taken in and tasted (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=103
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Esdras 14:40 — *when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast* Esdras drinks the fiery cup and is filled to speak; the word received equips the prophet from within (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:9 — *Behold, I have put my words in thy mouth* the prophet''s mouth filled with the word of Yahuah (LORD), then sent to speak; John''s eaten word given out (Revelation 10:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 1:10 — *I have this day set thee over the nations and over the kingdoms, to root out... to build, and to plant* the same scope, the prophet over the nations; John sent before peoples, nations, tongues, and kings (Revelation 10:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 3:4 — *go, get thee unto the house of Yashar''el (Israel), and speak with my words unto them* the eat-then-go pattern; the eating was for the sake of the sending (Revelation 10:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 14:45 — *The first that you have written publish openly, that the worthy and unworthy may read it* the prophet re-sent to publish openly and to seal the rest; the same double charge of sealing and prophesying (Revelation 10:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv10_lookup sv, _s224_rv10_lookup tv
 WHERE t.slug='revelation-10-thou-must-prophesy-again-the-prophet-sent-to-the-nations-jeremiah-1-and-ezekiel-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_revelation_11.sql (S224 Revelation 11) -----
-- =====================================================================
-- S224 minion — REVELATION 11 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 11 (19 verses) — the measured temple, the two witnesses, the seventh trumpet.
-- Tag: rv11 (temp view _s224_rv11_lookup).
-- Sort band: floor 9250, step 3 (9250, 9253, 9256, 9259, 9262, 9265, 9268 used; under 9275).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation is the consummation of the covenant story — the same Yahuah (LORD),
-- the same Torah, the same Yashar'el (Israel) brought to restoration; it is woven entirely out of
-- the prophets and never says "it is written." Chapter 11 re-speaks Ezekiel's measured temple, the
-- two olive trees and the lampstand of Zechariah 4, the fire-mouthed prophets Moses and Elijah, the
-- Spirit-breathed slain of Ezekiel 37, and Daniel's everlasting kingdom given to the saints. The
-- temple measured and the witnesses raised are the restoration in figure: the seventh trumpet
-- declares *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah
-- (Christ); and he shall reign for ever and ever* (11:15), and the ark of the testament — the
-- covenant of Sinai — is seen in the opened temple (11:19). Christology: on the throne sits the One
-- worshipped by the elders (*O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to
-- come*, 11:17), and the kingdom is *of our Lord, and of his Messiah (Christ)* — the Father and the
-- Formed Son distinguished, never collapsed and never made co-equal persons. Preserved as the pull
-- gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the reed to measure the temple, the altar, the worshippers; the court given to the nations
--           Tanakh: Ezekiel 40:3 (the measuring reed in the man's hand), Ezekiel 42:20 (the wall to
--                   separate sanctuary from profane), Zechariah 2:1-2 (the measuring line to measure
--                   Jerusalem), Daniel 8:13 (the sanctuary trodden under foot), Isaiah 63:18 (our
--                   adversaries have trodden down thy sanctuary)
--           Extras: 1 Enoch 90:17 (a new house built greater and loftier than the first)
--           NT: none warranted (the temple-restoration root is wholly prophetic)
--   v.3-4   my two witnesses; the two olive trees and the two candlesticks
--           Tanakh: Zechariah 4:3 (two olive trees by the candlestick), Zechariah 4:11 (the two
--                   olive trees on the right and left), Zechariah 4:14 (these are the two anointed
--                   ones that stand by Yahuah (Lord) of the whole earth)
--           Extras: none warranted   NT: none warranted
--   v.5-6   fire from their mouth, power to shut heaven and turn waters to blood — Moses and Elijah
--           Tanakh: Jeremiah 5:14 (I will make my words in thy mouth fire), 1 Kings 17:1 (Elijah:
--                   there shall not be dew nor rain), 2 Kings 1:10 (fire come down and consume),
--                   Exodus 7:17 (smite the waters, turned to blood)
--           Extras: Sirach 48:1 (Elias stood up as fire, his word burned like a lamp), 48:3 (he shut
--                   up the heaven, and three times brought down fire)
--           NT: none warranted (Malachi 4:5 Elijah-return carried in the ascent thread at v.12)
--   v.7-10  the beast from the pit kills them; their bodies in the great city where our Lord crucified
--           Tanakh: Daniel 7:21 (the horn made war with the saints and prevailed), Isaiah 1:9
--                   (we should have been as Sodom), Isaiah 1:10 (ye rulers of Sodom, ye people of
--                   Gomorrah — the great city spiritually called Sodom)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the Spirit of life entered them; they stood on their feet and ascended in a cloud
--           Tanakh: Ezekiel 37:5 (I will cause breath to enter into you, and ye shall live),
--                   Ezekiel 37:10 (the breath came into them, and they stood up upon their feet),
--                   2 Kings 2:11 (Elijah went up by a whirlwind into heaven)
--           Extras: Sirach 48:9 (Elias taken up in a whirlwind of fire), 48:10 (ordained for
--                   reproofs, to turn the heart of the father to the son, and to restore the tribes)
--           NT: none warranted (Malachi 4:5 the Elijah-return woven in prose)
--   v.13    the earthquake, the tenth part fell, seven thousand slain, the remnant gave glory
--           Tanakh: none warranted (the giving-glory motif carried in prose under the trumpet thread)
--           Extras: none warranted   NT: none warranted
--   v.14    the second woe past, the third cometh — narrative hinge
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.15-18 the seventh trumpet; the kingdoms become our Lord's and his Messiah's; he shall reign
--           Tanakh: Daniel 2:44 (Elohim shall set up a kingdom which shall never be destroyed),
--                   Daniel 7:14 (dominion that shall not pass away), Daniel 7:27 (the kingdom given
--                   to the saints, an everlasting kingdom), Psalm 2:8 (the heathen for thine
--                   inheritance), Psalm 2:9 (break them with a rod of iron), Zechariah 14:9 (Yahuah
--                   shall be king over all the earth), Exodus 15:18 (Yahuah shall reign for ever)
--           Extras: none warranted   NT: none warranted
--   v.19    the temple opened, the ark of his testament seen; lightnings and thunderings
--           Tanakh: Exodus 25:21 (put the testimony in the ark), Exodus 25:22 (I will commune with
--                   thee from above the mercy seat), 1 Kings 8:6 (the ark brought into the most holy
--                   place), Exodus 19:16 (thunders and lightnings and a thick cloud upon the mount)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9250 revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40           (Tanakh + Extras)
--   9253 revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4  (Tanakh)
--   9256 revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17    (Tanakh + Extras)
--   9259 revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7    (Tanakh)
--   9262 revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37      (Tanakh + Extras)
--   9265 revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7   (Tanakh)
--   9268 revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25                (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40
  ('canon', 'revelation', 11, 1, 'canon', 'ezekiel', 40, 3, 'free', E'*And he brought me thither, and, behold, there was a man, whose appearance was like the appearance of brass, with a line of flax in his hand, and a measuring reed; and he stood in the gate.* (Ezekiel 40:3). The seer''s reed is Ezekiel''s: *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). The man with the measuring reed who walked the restored temple from gate to gate is the same figure handing John the rod — the measuring is no demolition but a marking-off of what belongs to Yahuah (LORD), the sanctuary set apart and preserved.'),
  ('canon', 'revelation', 11, 1, 'canon', 'ezekiel', 40, 4, 'free', E'*And the man said unto me, Son of Adam, behold with thine eyes, and hear with thine ears, and set thine heart upon all that I shall shew thee; for to the intent that I might shew them unto thee art thou brought hither: declare all that thou seest to the house of Yashar''el (Israel).* (Ezekiel 40:4). As the man charged Ezekiel to measure and *declare all that thou seest to the house of Yashar''el (Israel)*, so the angel charges John to *measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). The measured house is for the restoration of the whole house of Yashar''el (Israel) — the worshippers numbered and kept, the covenant people marked off as Yahuah''s (LORD''s) own.'),
  ('canon', 'revelation', 11, 1, 'canon', 'zechariah', 2, 1, 'free', E'*I lifted up mine eyes again, and looked, and behold a man with a measuring line in his hand.* (Zechariah 2:1). Zechariah too saw the measurer: *Then said I, Whither goest thou? And he said unto me, To measure Jerusalem* (Zechariah 2:2) — and the word that followed was a promise of restoration, Yahuah (LORD) himself *a wall of fire round about, and... the glory in the midst of her.* So when the angel says *Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1), the measuring marks the holy city kept for blessing, even while the outer court is given to the nations.'),
  ('canon', 'revelation', 11, 2, 'canon', 'ezekiel', 42, 20, 'free', E'*He measured it by the four sides: it had a wall round about, five hundred reeds long, and five hundred broad, to make a separation between the sanctuary and the profane place.* (Ezekiel 42:20). Ezekiel''s measuring ended in a wall *to make a separation between the sanctuary and the profane place* — and that is the very line the angel draws: *But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles* (Revelation 11:2). The reed divides the holy from the profane; the temple and the worshippers are measured and kept, the outer court left to those who tread it down.'),
  ('canon', 'revelation', 11, 2, 'canon', 'daniel', 8, 13, 'free', E'*Then I heard one saint speaking, and another saint said unto that certain saint which spake, How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* (Daniel 8:13). Daniel heard the same treading of the holy place — *the sanctuary and the host to be trodden under foot* — and the same *How long?* So the holy city given over: *the holy city shall they tread under foot forty and two months* (Revelation 11:2). The trampling of the sanctuary by the nations is a measured, appointed time, bounded and brief, and the *How long?* is already answered in the kept temple.'),
  ('canon', 'revelation', 11, 2, 'canon', 'isaiah', 63, 18, 'free', E'*The people of thy holiness have possessed it but a little while: our adversaries have trodden down thy sanctuary.* (Isaiah 63:18). Isaiah''s lament is the same grief — *our adversaries have trodden down thy sanctuary.* *The holy city shall they tread under foot forty and two months* (Revelation 11:2). But the treading is *a little while*; the adversaries hold the outer court only for the appointed season, and the prayer of Isaiah for the *tribes of thine inheritance* is the cry the measured temple answers — the sanctuary trodden now, restored at the trumpet.'),
  ('canon', 'revelation', 11, 1, 'enoch', '1-enoch', 90, 17, 'extras', E'*And a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house.* (1 Enoch 90:17). The restored library saw the end of the measuring — not the old house propped up but *a new house... greater and loftier than the first*, into which the Lord of the sheep gathers all his flock. So the angel''s reed to *measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1) marks off the house being built for the regathered: the worshippers numbered now are the sheep brought home into the greater house, the restoration of all Yashar''el (Israel).'),
  -- thread: revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4
  ('canon', 'revelation', 11, 4, 'canon', 'zechariah', 4, 3, 'free', E'*And two olive trees by it, one upon the right side of the bowl, and the other upon the left side thereof.* (Zechariah 4:3). The two witnesses are named straight out of Zechariah''s lampstand vision: *These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4). The two olive trees beside the golden candlestick, feeding it oil, are the figure the seer takes up whole — the witnesses are the olive trees that supply the light, standing before the Elohim (God) of all the earth.'),
  ('canon', 'revelation', 11, 4, 'canon', 'zechariah', 4, 11, 'free', E'*Then answered I, and said unto him, What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* (Zechariah 4:11). The prophet''s own question — *What are these two olive trees?* — is answered in the seer''s declaration: *These are the two olive trees, and the two candlesticks* (Revelation 11:4). Zechariah asked and Revelation tells: the two olive trees are the two witnesses, the anointed who stand before Yahuah (LORD) and carry his light into the dark season of the treading-down.'),
  ('canon', 'revelation', 11, 4, 'canon', 'zechariah', 4, 14, 'free', E'*Then said he, These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth.* (Zechariah 4:14). Here is the heart of it: the two olive trees are *the two anointed ones, that stand by Yahuah (Lord) of the whole earth.* So the two witnesses *are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4). The witnesses stand where Zechariah''s anointed stand — before the Lord of the whole earth — bearing his word *Not by might, nor by power, but by my spirit* (Zechariah 4:6) through the days of their prophecy.'),
  -- thread: revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17
  ('canon', 'revelation', 11, 5, 'canon', 'jeremiah', 5, 14, 'free', E'*Wherefore thus saith Yahuah Elohim (the LORD God) of hosts, Because ye speak this word, behold, I will make my words in thy mouth fire, and this people wood, and it shall devour them.* (Jeremiah 5:14). Yahuah (LORD) put fire in the prophet''s mouth to devour: *I will make my words in thy mouth fire, and this people wood.* So of the witnesses: *if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5). The fire is the prophetic word itself, the word of Yahuah (LORD) that consumes those who would silence his messengers — the same fire Jeremiah carried.'),
  ('canon', 'revelation', 11, 6, 'canon', '1-kings', 17, 1, 'free', E'*And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* (1 Kings 17:1). Elijah shut up the heaven by his word — *there shall not be dew nor rain these years, but according to my word.* So the witnesses *have power to shut heaven, that it rain not in the days of their prophecy* (Revelation 11:6). The witnesses carry Elijah''s very gift; one of the two prophets wears the mantle of the Tishbite who stood before Yahuah (LORD) and held back the rain.'),
  ('canon', 'revelation', 11, 5, 'canon', '2-kings', 1, 10, 'free', E'*And Elijah answered and said to the captain of fifty, If I be a man of Elohim (God), then let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty.* (2 Kings 1:10). Elijah called fire from heaven on those sent to seize him — *let fire come down from heaven, and consume thee and thy fifty.* So of the two witnesses: *if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5). The fire that guarded Elijah from the king''s captains guards the witnesses; none can lay hold on them before their testimony is finished.'),
  ('canon', 'revelation', 11, 6, 'canon', 'exodus', 7, 17, 'free', E'*Thus saith Yahuah (LORD), In this thou shalt know that I am Yahuah (LORD): behold, I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood.* (Exodus 7:17). Moses turned the river to blood — *I will smite with the rod... and they shall be turned to blood.* So the witnesses *have power over waters to turn them to blood, and to smite the earth with all plagues, as often as they will* (Revelation 11:6). The second witness wears the mantle of Moses, who smote Egypt with plagues; together the two prophets carry the gifts of Moses and Elijah, the law and the prophets standing as the two witnesses of Yahuah (LORD).'),
  ('canon', 'revelation', 11, 5, 'apocrypha', 'ecclesiasticus', 48, 1, 'extras', E'*Then stood up Elias the prophet as fire, and his word burned like a lamp.* (Sirach 48:1). The Hebrew library remembered Elijah as fire itself — *Elias the prophet as fire, and his word burned like a lamp.* So of the witnesses: *fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5). The witness whose mouth burns is cast in the mould of the prophet whose very word *burned like a lamp* — and the two candlesticks of verse 4 are these burning lamps, the prophetic word of Yahuah (LORD) made fire.'),
  ('canon', 'revelation', 11, 6, 'apocrypha', 'ecclesiasticus', 48, 3, 'extras', E'*By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* (Sirach 48:3). The library names both gifts the witnesses carry, and joins them in Elijah: *By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* So the witnesses *have power to shut heaven, that it rain not* (Revelation 11:6) and *fire proceedeth out of their mouth* (Revelation 11:5). The shut heaven and the called-down fire are Elijah''s twin signs, and the two prophets of the chapter walk in the power of Elijah and of Moses both.'),
  -- thread: revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7
  ('canon', 'revelation', 11, 7, 'canon', 'daniel', 7, 21, 'free', E'*I beheld, and the same horn made war with the saints, and prevailed against them* (Daniel 7:21). Daniel saw the beast-horn make war on the holy ones and overcome them for a season — *the same horn made war with the saints, and prevailed against them.* So the beast and the witnesses: *the beast that ascendeth out of the bottomless pit shall make war against them, and shall overcome them, and kill them* (Revelation 11:7). It is the same war Daniel saw, the same brief prevailing of the beast — *until the Ancient of days came, and judgment was given to the saints* (Daniel 7:22); the killing is not the end of the story.'),
  ('canon', 'revelation', 11, 8, 'canon', 'isaiah', 1, 9, 'free', E'*Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah.* (Isaiah 1:9). Isaiah named the faithless city Sodom — *we should have been as Sodom.* So the bodies of the witnesses lie *in the street of the great city, which spiritually is called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8). The great city earns the name not by its location but by its deeds: the prophets'' own word made Jerusalem-in-her-rebellion a Sodom, and the seer takes up that very charge.'),
  ('canon', 'revelation', 11, 8, 'canon', 'isaiah', 1, 10, 'free', E'*Hear the word of Yahuah (LORD), ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah.* (Isaiah 1:10). Isaiah called the rulers of the holy city *rulers of Sodom* and her people *people of Gomorrah* — the prophetic name for the covenant city turned harlot. So the city where the witnesses fall is *spiritually... called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8). Sodom for her wickedness, Egypt for her bondage; the same city that slew the prophets and crucified the Lord is named by the prophets'' own measure.'),
  -- thread: revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37
  ('canon', 'revelation', 11, 11, 'canon', 'ezekiel', 37, 5, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5). Ezekiel''s valley of dry bones is the figure of the raised witnesses: *I will cause breath to enter into you, and ye shall live.* So *after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). The same breath that filled the slain in the valley fills the dead witnesses — the resurrection-power of Yahuah (LORD) that raises the whole house of Yashar''el (Israel) from their graves.'),
  ('canon', 'revelation', 11, 11, 'canon', 'ezekiel', 37, 10, 'free', E'*So I prophesied as he commanded me, and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army.* (Ezekiel 37:10). The words are nearly the same: *the breath came into them, and they lived, and stood up upon their feet.* So of the witnesses: *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). And Ezekiel told what the raising meant — *these bones are the whole house of Yashar''el (Israel)* (Ezekiel 37:11), the graves opened and the people brought home; the standing witnesses are a sign of that great regathering resurrection.'),
  ('canon', 'revelation', 11, 12, 'canon', '2-kings', 2, 11, 'free', E'*And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* (2 Kings 2:11). Elijah was taken up alive — *Elijah went up by a whirlwind into heaven.* So the witnesses: *they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud* (Revelation 11:12). The witness who shut the heaven like Elijah ascends as Elijah ascended; the prophet who *was taken up* and was looked for to return (the Elijah of Malachi 4:5, *I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)*) is seen again in the two witnesses caught up.'),
  ('canon', 'revelation', 11, 12, 'apocrypha', 'ecclesiasticus', 48, 9, 'extras', E'*Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Sirach 48:9). The library kept the memory of Elijah''s ascent — *taken up in a whirlwind of fire, and in a chariot of fiery horses.* So the witnesses *ascended up to heaven in a cloud; and their enemies beheld them* (Revelation 11:12). The prophet caught up to heaven is the pattern of the witnesses caught up; and the same passage names why he was kept — *ordained for reproofs in their times... and to restore the tribes of Jacob* (Sirach 48:10), the very restoration the witnesses serve.'),
  ('canon', 'revelation', 11, 11, 'apocrypha', 'ecclesiasticus', 48, 10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob.* (Sirach 48:10). The library names the office of the returning Elijah: *ordained for reproofs in their times... to restore the tribes of Jacob.* So the witnesses prophesy and are raised — *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). Their testimony, like Elijah''s, is for the reproof and the regathering — the turning of hearts and the restoration of the scattered tribes that the whole vision moves toward.'),
  -- thread: revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7
  ('canon', 'revelation', 11, 15, 'canon', 'daniel', 2, 44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). Daniel saw the stone that shatters the image and fills the earth — *a kingdom, which shall never be destroyed... it shall stand for ever.* So at the seventh trumpet: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The everlasting kingdom Daniel foresaw breaking all the kingdoms of men is the kingdom now declared come — *he shall reign for ever and ever.*'),
  ('canon', 'revelation', 11, 15, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the one *like the Son of Adam* who came with the clouds was given *an everlasting dominion, which shall not pass away.* So the seventh trumpet sounds the same: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The kingdom *of his Messiah (Christ)* is the dominion given to the Son of Adam in Daniel — the Formed Son receiving from the Father the everlasting reign over all peoples.'),
  ('canon', 'revelation', 11, 18, 'canon', 'daniel', 7, 27, 'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). Daniel saw the kingdom given *to the people of the saints of the El Elyon (most High)* — and reward for the saints. So at the trumpet the time comes *that thou shouldest give reward unto thy servants the prophets, and to the saints, and them that fear thy name, small and great* (Revelation 11:18). The everlasting kingdom is the saints'' inheritance; the trumpet that crowns the Messiah crowns his people with him.'),
  ('canon', 'revelation', 11, 15, 'canon', 'psalms', 2, 8, 'free', E'*Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession.* (Psalm 2:8). The Father said to his anointed, *Ask of me, and I shall give thee the heathen for thine inheritance.* So *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15). The nations that raged against Yahuah (LORD) and against his anointed are given over to the Messiah as his inheritance — the kingdoms of the world handed to the Son the Psalm sang.'),
  ('canon', 'revelation', 11, 18, 'canon', 'psalms', 2, 9, 'free', E'*Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* (Psalm 2:9). The anointed breaks the raging nations *with a rod of iron.* So when the trumpet sounds, *the nations were angry, and thy wrath is come... and shouldest destroy them which destroy the earth* (Revelation 11:18). The wrath of the nations meets the wrath of Yahuah (LORD); the Messiah who is given the heathen for his inheritance breaks those who destroy the earth, as the Psalm foretold.'),
  ('canon', 'revelation', 11, 15, 'canon', 'zechariah', 14, 9, 'free', E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* (Zechariah 14:9). Zechariah''s day of Yahuah (LORD) ends in his universal reign — *Yahuah (LORD) shall be king over all the earth.* So the seventh trumpet: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The one kingship of Yahuah (LORD) over all the earth is the kingdom now come — *he shall reign for ever and ever* — the whole earth gathered under the one name.'),
  ('canon', 'revelation', 11, 17, 'canon', 'exodus', 15, 18, 'free', E'*Yahuah (LORD) shall reign for ever and ever.* (Exodus 15:18). The song of the sea ended in the cry the trumpet takes up: *Yahuah (LORD) shall reign for ever and ever.* So the elders give thanks: *We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned* (Revelation 11:17), and *he shall reign for ever and ever* (Revelation 11:15). The reign sung at the Red Sea when Yahuah (LORD) delivered his people is the reign declared at the trumpet — the same everlasting kingship, from the exodus to the consummation.'),
  -- thread: revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25
  ('canon', 'revelation', 11, 19, 'canon', 'exodus', 25, 21, 'free', E'*And thou shalt put the mercy seat above upon the ark; and in the ark thou shalt put the testimony that I shall give thee.* (Exodus 25:21). The ark held *the testimony* — the tables of the covenant. So when *the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament* (Revelation 11:19), it is this ark, the chest of the covenant of Sinai. The opened temple reveals not a covenant abolished but the ark of the testimony kept in heaven — the Torah at the heart of the restoration, the covenant still standing.'),
  ('canon', 'revelation', 11, 19, 'canon', 'exodus', 25, 22, 'free', E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony, of all things which I will give thee in commandment unto the children of Yashar''el (Israel).* (Exodus 25:22). From above the ark Yahuah (LORD) met and communed with his people — *from between the two cherubims which are upon the ark of the testimony.* So the heavenly *ark of his testament* is seen (Revelation 11:19): the very place of meeting between Yahuah (LORD) and the children of Yashar''el (Israel), the mercy seat opened to view — the covenant fellowship restored, Yahuah (LORD) communing again with his gathered people.'),
  ('canon', 'revelation', 11, 19, 'canon', '1-kings', 8, 6, 'free', E'*And the priests brought in the ark of the covenant of Yahuah (LORD) unto his place, into the oracle of the house, to the most holy place, even under the wings of the cherubims.* (1 Kings 8:6). When Solomon''s temple was filled, the ark was set in the most holy place and the cloud of glory filled the house. So the heavenly answer: *the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament* (Revelation 11:19). The ark hidden in the inmost shrine of the earthly house is now seen openly in the heavenly temple — the covenant of Yahuah (LORD) brought into full view at the trumpet of his reign.'),
  ('canon', 'revelation', 11, 19, 'canon', 'exodus', 19, 16, 'free', E'*And it came to pass on the third day in the morning, that there were thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet exceeding loud; so that all the people that was in the camp trembled.* (Exodus 19:16). When Yahuah (LORD) came down on Sinai to give the covenant, there were *thunders and lightnings, and a thick cloud... and the voice of the trumpet.* So when the heavenly temple is opened, *there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). The signs that attended the giving of the testimony at Sinai attend the showing of the ark of the testimony in heaven — the same covenant-Elohim (God), the same thunders, from the mountain to the consummation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40',
       E'The reed to measure the temple of Elohim (God), and the altar, and them that worship therein (Ezekiel 40)',
       E'The chapter opens with a measuring: *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). This is Ezekiel''s reed — *behold, there was a man, whose appearance was like the appearance of brass, with a line of flax in his hand, and a measuring reed* (Ezekiel 40:3), who charged the prophet to *behold with thine eyes... and declare all that thou seest to the house of Yashar''el (Israel)* (Ezekiel 40:4). It is Zechariah''s line too — *behold a man with a measuring line in his hand... To measure Jerusalem* (Zechariah 2:1) — and that measuring ended in restoration, Yahuah (LORD) himself a wall of fire and the glory in her midst. The measuring is no demolition; it is a marking-off of what belongs to Yahuah (LORD), a *separation between the sanctuary and the profane place* (Ezekiel 42:20). For the outer court is left out: *But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles: and the holy city shall they tread under foot forty and two months* (Revelation 11:2). Daniel heard the same treading and the same cry — *to give both the sanctuary and the host to be trodden under foot* (Daniel 8:13) — and Isaiah grieved it: *our adversaries have trodden down thy sanctuary* (Isaiah 63:18). But the trampling is measured and brief, *forty and two months*, *a little while*; the temple and the worshippers are kept. And the restored library saw where the measuring leads — *a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house* (1 Enoch 90:17). The worshippers numbered now are the sheep being gathered into the greater house: the measuring of the temple is the marking-off of the regathered Yashar''el (Israel) for the restoration.',
       sv.verse_id, ev.verse_id, 'extras', 9250
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4',
       E'The two witnesses, the two olive trees and the two candlesticks standing before the Elohim (God) of the earth (Zechariah 4)',
       E'The two witnesses are named straight out of Zechariah''s lampstand vision: *And I will give power unto my two witnesses, and they shall prophesy a thousand two hundred and threescore days, clothed in sackcloth. These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:3-4). Zechariah saw the golden candlestick with its seven lamps, and *two olive trees by it, one upon the right side of the bowl, and the other upon the left side thereof* (Zechariah 4:3), feeding it oil. He asked, *What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* (Zechariah 4:11), and the answer is the seer''s own: *These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth* (Zechariah 4:14). The witnesses stand where the anointed stand — before the Lord of the whole earth — and bear his light through the dark season of the treading-down, carrying the word Zechariah heard: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). Two witnesses, for by two the testimony is established; the lamps of Yahuah (LORD) burning in the night, supplied by the oil of his Spirit, prophesying the whole appointed time.',
       sv.verse_id, ev.verse_id, 'free', 9253
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17',
       E'Fire out of their mouth, power to shut heaven and to turn the waters to blood — the gifts of Moses and Elijah (1 Kings 17, Exodus 7)',
       E'The two witnesses carry the gifts of the two greatest prophets — Moses and Elijah, the law and the prophets. *And if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5): this is the word Yahuah (LORD) put in Jeremiah''s mouth — *behold, I will make my words in thy mouth fire, and this people wood, and it shall devour them* (Jeremiah 5:14) — the prophetic word itself made fire. It is Elijah''s fire too, who said to the captains sent to seize him, *let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10). *These have power to shut heaven, that it rain not in the days of their prophecy* (Revelation 11:6) — the very word of the Tishbite: *there shall not be dew nor rain these years, but according to my word* (1 Kings 17:1). *And have power over waters to turn them to blood, and to smite the earth with all plagues, as often as they will* (Revelation 11:6) — the sign of Moses: *I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood* (Exodus 7:17). The Hebrew library kept the memory of Elijah as fire himself — *Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1), who *by the word of Yahuah (God)... shut up the heaven, and also three times brought down fire* (Sirach 48:3). So the two candlesticks burn: the witness whose mouth is fire wears the mantle of Elijah, the witness who smites the waters wears the mantle of Moses, and together they testify in the power of the law and the prophets through the appointed days.',
       sv.verse_id, ev.verse_id, 'extras', 9256
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7',
       E'The beast from the pit makes war and slays them; their bodies in the great city spiritually called Sodom (Daniel 7, Isaiah 1)',
       E'When the testimony is finished, the beast prevails for a season: *And when they shall have finished their testimony, the beast that ascendeth out of the bottomless pit shall make war against them, and shall overcome them, and kill them* (Revelation 11:7). This is the war Daniel saw the beast-horn wage: *the same horn made war with the saints, and prevailed against them* (Daniel 7:21) — but only *until the Ancient of days came, and judgment was given to the saints* (Daniel 7:22); the prevailing is brief and the verdict is sure. The bodies of the witnesses lie unburied *in the street of the great city, which spiritually is called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8), while the peoples gaze and the earth-dwellers make merry over them. The name *Sodom* is the prophets'' own charge against the covenant city in her rebellion: Isaiah cried, *Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah* (Isaiah 1:9), and named her rulers outright — *Hear the word of Yahuah (LORD), ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah* (Isaiah 1:10). Sodom for her wickedness, Egypt for her bondage — the city that slew the prophets and crucified the Lord earns the name not by her place but by her deeds. The witnesses fall where the Master fell; but as with him, the killing is not the end.',
       sv.verse_id, ev.verse_id, 'free', 9259
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37',
       E'The Spirit of life entered them and they stood upon their feet, and ascended in a cloud (Ezekiel 37, 2 Kings 2)',
       E'The slain witnesses are raised, and the raising is Ezekiel''s valley of dry bones: *And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). Yahuah (LORD) said over the bones, *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5), and *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10) — the very words, *stood up upon their feet.* And Ezekiel told what the raising meant: *these bones are the whole house of Yashar''el (Israel)* (Ezekiel 37:11), the graves opened and the people brought home — so the standing witnesses are a sign of that great regathering resurrection. Then the ascent: *And they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud; and their enemies beheld them* (Revelation 11:12). This is Elijah''s going-up — *Elijah went up by a whirlwind into heaven* (2 Kings 2:11) — and the library kept the memory: *Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Sirach 48:9). The same passage names why the prophet was kept: he was *ordained for reproofs in their times... and to restore the tribes of Jacob* (Sirach 48:10) — the Elijah whom Malachi promised would come *before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The witnesses raised and caught up serve that office: the reproof of the rebellious city and the restoration of the scattered tribes, the resurrection-power of Yahuah (LORD) shown in figure before it is shown over all his people.',
       sv.verse_id, ev.verse_id, 'extras', 9262
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7',
       E'The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ) (Daniel 2 and 7, Psalm 2)',
       E'The seventh trumpet sounds the heart of the whole vision: *And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). This is the stone Daniel saw shatter the image of the kingdoms: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). It is the dominion given to the one *like the Son of Adam*: *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14) — the kingdom *of his Messiah (Christ)*, the Formed Son receiving from the Father the everlasting reign. It is Zechariah''s day — *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — and the song of the sea come round at last — *Yahuah (LORD) shall reign for ever and ever* (Exodus 15:18). So the elders fall and give thanks: *We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned* (Revelation 11:17). The Father gave his anointed *the heathen for thine inheritance* (Psalm 2:8) and the rod to *dash them in pieces* (Psalm 2:9); so *the nations were angry, and thy wrath is come... and shouldest destroy them which destroy the earth* (Revelation 11:18), and the reward is given to the saints — for the kingdom *shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27). The trumpet that crowns the Messiah crowns his people with him, and the everlasting reign foretold from the exodus to Daniel is declared come.',
       sv.verse_id, ev.verse_id, 'free', 9265
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25',
       E'The temple of Elohim (God) opened in heaven, and the ark of his testament seen (Exodus 25, 1 Kings 8)',
       E'The chapter closes where the seventh trumpet leads — the covenant brought into full view: *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). The *ark of his testament* is the ark of Sinai, which held *the testimony* — the tables of the covenant: *thou shalt put the mercy seat above upon the ark; and in the ark thou shalt put the testimony that I shall give thee* (Exodus 25:21). It is the place of meeting, where Yahuah (LORD) communed with his people — *there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony... unto the children of Yashar''el (Israel)* (Exodus 25:22). In Solomon''s house the priests *brought in the ark of the covenant of Yahuah (LORD) unto his place, into the oracle of the house, to the most holy place* (1 Kings 8:6), and the glory-cloud filled it. Now the ark hidden in the inmost shrine is seen openly in heaven — the covenant of Yahuah (LORD) not abolished but enthroned, the Torah at the heart of the restoration. And the signs that attended its giving attend its showing: at Sinai there were *thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet* (Exodus 19:16), and so in heaven *there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). The same covenant-Elohim (God), the same thunders, from the mountain to the consummation — the ark of the testimony seen, and the covenant kept.',
       sv.verse_id, ev.verse_id, 'free', 9268
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 40:3 — *a man, whose appearance was like the appearance of brass, with a line of flax in his hand, and a measuring reed* the measurer of the restored temple, the same figure handing John the reed (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 40:4 — *declare all that thou seest to the house of Yashar''el (Israel)* the measured house is for the restoration of the whole house, the worshippers numbered and kept (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=40 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 2:1 — *a man with a measuring line in his hand* the measurer of Jerusalem, whose measuring ended in restoration and the glory in her midst (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 42:20 — *a wall round about... to make a separation between the sanctuary and the profane place* the reed divides holy from profane; the outer court left to the nations (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=42 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 8:13 — *the sanctuary and the host to be trodden under foot* the same treading and the same *How long?*; the holy city trodden a measured time (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 63:18 — *our adversaries have trodden down thy sanctuary* the prophet''s grief over the trampled holy place, the treading that lasts but a little while (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 90:17 — *a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house* the measured worshippers are the regathered sheep, the restoration of all Yashar''el (Israel) (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=90 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 4:3 — *two olive trees by it, one upon the right side of the bowl, and the other upon the left* the olive trees beside the candlestick that feed it oil, named as the two witnesses (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:11 — *What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* the prophet''s own question that Revelation answers (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:14 — *These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth* the heart of it: the witnesses stand where Zechariah''s anointed stand, before the Lord of all the earth (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 5:14 — *I will make my words in thy mouth fire, and this people wood, and it shall devour them* the prophetic word made fire, the fire that proceeds from the witnesses'' mouth (Revelation 11:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 1:10 — *let fire come down from heaven, and consume thee and thy fifty* Elijah''s fire on those sent to seize him, guarding the witnesses till their testimony is done (Revelation 11:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 17:1 — *there shall not be dew nor rain these years, but according to my word* Elijah shutting the heaven, the witnesses'' power to shut heaven that it rain not (Revelation 11:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 7:17 — *I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood* the sign of Moses, the witnesses'' power over waters to turn them to blood (Revelation 11:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:1 — *Then stood up Elias the prophet as fire, and his word burned like a lamp* the library remembered Elijah as fire himself; the two candlesticks are these burning lamps (Revelation 11:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 48:3 — *By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* the library joins Elijah''s twin signs, the shut heaven and the called-down fire (Revelation 11:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:21 — *the same horn made war with the saints, and prevailed against them* the beast''s war on the witnesses, brief, until the Ancient of days gives judgment to the saints (Revelation 11:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:9 — *we should have been as Sodom, and we should have been like unto Gomorrah* the prophet''s name for the faithless city, the great city spiritually called Sodom (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:10 — *ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah* the city named Sodom by her deeds, that slew the prophets and crucified the Lord (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:5 — *Behold, I will cause breath to enter into you, and ye shall live* the breath into the dry bones, the Spirit of life that entered the slain witnesses (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:10 — *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* the same words, *stood up upon their feet*; the raising that is the whole house of Yashar''el (Israel) (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 2:11 — *Elijah went up by a whirlwind into heaven* the prophet caught up alive, the pattern of the witnesses ascending in a cloud (Revelation 11:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 48:9 — *Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* the library''s memory of Elijah''s ascent, the witnesses caught up to heaven in a cloud (Revelation 11:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:10 — *ordained for reproofs in their times... and to restore the tribes of Jacob* the office of the returning Elijah, the reproof and regathering the witnesses serve (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall stand for ever* the stone that shatters the kingdoms and fills the earth, the everlasting kingdom now declared come (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* the dominion given to the Son of Adam, the kingdom of his Messiah (Christ) (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:27 — *the kingdom... shall be given to the people of the saints of the El Elyon (most High)* the everlasting kingdom is the saints'' inheritance; the trumpet rewards the servants and saints (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:8 — *Ask of me, and I shall give thee the heathen for thine inheritance* the nations given to the anointed, the kingdoms become his (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 2:9 — *Thou shalt break them with a rod of iron* the anointed breaks the raging nations; the wrath come on them that destroy the earth (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Zechariah 14:9 — *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* the universal reign of Yahuah (LORD), the kingdom now come (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Exodus 15:18 — *Yahuah (LORD) shall reign for ever and ever* the song of the sea, the reign declared at the trumpet, *he shall reign for ever and ever* (Revelation 11:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:21 — *in the ark thou shalt put the testimony that I shall give thee* the ark held the tables of the covenant; the heavenly ark of his testament is the ark of Sinai (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 25:22 — *there I will meet with thee, and I will commune with thee from above the mercy seat* the ark the place of meeting between Yahuah (LORD) and his people, the covenant fellowship restored (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:6 — *the priests brought in the ark of the covenant of Yahuah (LORD)... to the most holy place* the ark hidden in the inmost shrine, now seen openly in the heavenly temple (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 19:16 — *there were thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet* the signs of Sinai attend the showing of the ark of the testimony in heaven (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session224 — Revelation cross-references complete.'
