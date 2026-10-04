-- =====================================================================
-- Session 440 — Order of the End: open questions settled, and the Ascension
-- of Isaiah restored to the Ethiopic where Charles altered it (2026-10-03)
-- =====================================================================
-- Yoshi's decisions of 2026-10-03 (S438 open questions 2-6):
--   A. Matthew 25:31-46 (sheep and goats) is the post-harvest sifting of the
--      gathered wheat in the wilderness of the people (Ezekiel 20:35-38) —
--      not a judgment of surviving nations for entry into the reign.
--      Thread 'sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory'
--      keeps its slug and is retitled.
--   B. The saints / holy ones who come with him (Zechariah 14:5; Jude 1:14;
--      1 Enoch 1:9) are the seed of promise gathered and coming with him —
--      not angels, not souls descending from heaven.
--   C. Ezekiel 37 is the first resurrection (graves opened, brought into the
--      land; two houses one nation, David king — the reign). Revelation 11:11
--      borrows Ezekiel's words as a pattern for the great resurrection; it is
--      not the same event. Revelation 11:12 is the first going-up to heaven
--      (John 3:13) — new card Revelation 11:12 -> John 3:13.
--   D. Ascension of Isaiah 4:16 "descend": cautionary note (no other scripture
--      has anyone coming down from the sky with him; the Ethiopic has
--      yəwarrədu, so any insertion predates it), with the heights-of-the-north
--      reading offered as possible, not settled.
--   E. New cards 1 Thessalonians 4:17 -> Ascension of Isaiah 4:17 and 9:9.
--   F. Ascension of Isaiah text: 3:15 "assembly" (Charles: "the Christian
--      Church"); 4:14 "three hundred and thirty-two days" (Charles inserts
--      "one thousand"); 4:15 note on Charles's bracket. Same text written to
--      source-texts/ascension-isaiah/ascension-isaiah-restored.txt and
--      source-texts/parsed/ascension-isaiah.json (.pre-s440 backups).
-- The source migrations that inserted / last corrected each row were
-- corrected in place to the same text (.pre-s440 backups), so a fresh
-- rebuild matches. Ends with a schema_version bump so apps purge caches.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session440_order_of_end_open_questions_and_ascension_isaiah.sql
-- =====================================================================

\echo 'session440 — order-of-end open questions + Ascension of Isaiah starting...'
BEGIN;

CREATE TEMP VIEW _s440_lu AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','apocrypha','pseudepigrapha','apocalypse-of-abraham','ascension-isaiah','adam-eve-conflict');

-- ===== cross-reference notes (A, B, C, D) =====
UPDATE cross_references x SET note = E'*When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31). The net is drawn and *the angels shall come forth, and sever the wicked from among the just* (Matthew 13:49); so the Shepherd-King divides his sheep from the goats. Both are the sorting of what has been gathered: the seed brought out of all nations and sifted before the reign, not the nations judged for entry into it.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31). He comes *in the glory of his Father with his angels; and then he shall reward every man according to his works* (Matthew 16:27). The throne of his glory is where the works are weighed: the gathered seed sifted, the sheep from the goats.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31). The net *gathered of every kind*, and the good were gathered into vessels while the bad were cast away (Matthew 13:47-48). The shepherd''s dividing is the same sorting of the gathered: the seed brought out of all nations, then sifted, the sheep from the goats.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* (Matthew 25:32). *All nations* names where the gathered come from: the seed scattered among all nations is brought out of them, and then sifted. Ezekiel saw the same: *And I will bring you into the wilderness of the people, and there will I plead with you face to face... And I will cause you to pass under the rod, and I will bring you into the bond of the covenant: And I will purge out from among you the rebels, and them that transgress against me* (Ezekiel 20:35, 37-38). The goats are parted from the sheep among the gathered, before the reign — not the nations judged for entry into it.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* (Zechariah 14:16). This is the reign that follows. The nations left alive go up to keep the feast; the sheep of Matthew 25 are not those nations. The King on the throne of his glory first divides his own gathered flock, the sheep from the goats, and the sheep enter the land as a kingdom of priests to the nations who are left.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* (Revelation 20:10). The goats are sent toward *everlasting fire, prepared for the devil and his angels* (Matthew 25:41) — the very lake into which the devil is cast after the little season. The sifting of the gathered comes before the reign; the fire it names is the end that waits for all who are sent away.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Zion arises, and *the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3). The sheep of Matthew 25 are not those nations. They are the gathered seed, sifted at the throne of his glory, who carry the light the nations come to in the reign.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Zion arises, and *the Gentiles shall come to thy light* (Isaiah 60:3). The blessed of the Father who *inherit the kingdom* (Matthew 25:34) are the sheep, the gathered seed sifted from the goats; the nations come to their light in the reign.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Zion arises, and *the Gentiles shall come to thy light* (Isaiah 60:3). The righteous who go *into life eternal* (Matthew 25:46) are the sheep, the gathered seed sifted from the goats; the nations come to their light in the reign.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*For I know their works and their thoughts: it shall come, that I will gather all nations and tongues; and they shall come, and see my glory.* (Isaiah 66:18). The nations come and see his glory in the reign. The inheritance of Matthew 25:34 belongs to the sheep, the gathered seed sifted from the goats — not to the nations who come to see.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*For I know their works and their thoughts: it shall come, that I will gather all nations and tongues; and they shall come, and see my glory.* (Isaiah 66:18). The nations come and see his glory in the reign. The life eternal of Matthew 25:46 belongs to the righteous, the gathered seed sifted from the goats — not to the nations who come to see.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* (Zechariah 14:16). The nations left alive keep the feast in the reign. The blessed who *inherit the kingdom* (Matthew 25:34) are not those nations; they are the gathered seed, sifted from the goats, who enter the land as a kingdom of priests to the nations who are left.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* (Zechariah 14:16). The nations left alive keep the feast in the reign. The righteous of Matthew 25:46 are not those nations; they are the gathered seed, sifted from the goats, who enter the land as a kingdom of priests to the nations who are left.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*For, behold, in those days, and in that time, when I shall bring again the captivity of Yahudah (Judah) and Jerusalem,* (Joel 3:1). Joel''s valley of Jehoshaphat is the Day on the nations gathered against his land — *I will also gather all nations... and will plead with them there for my people* (Joel 3:2): the tares abroad burned first. The inheritance of the sheep is another matter: the gathered seed, sifted from the goats before the reign.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*For, behold, in those days, and in that time, when I shall bring again the captivity of Yahudah (Judah) and Jerusalem,* (Joel 3:1). Joel''s valley of Jehoshaphat is the Day on the nations gathered against his land — *I will also gather all nations... and will plead with them there for my people* (Joel 3:2): the tares abroad burned first. The parting of Matthew 25:46 is among the gathered seed, the goats from the sheep, before the reign.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*For, behold, in those days, and in that time, when I shall bring again the captivity of Yahudah (Judah) and Jerusalem,* (Joel 3:1). Joel''s gathering of the nations is the Day on those who scattered his people — *I will also gather all nations... and will plead with them there for my people* (Joel 3:2). The sheep and the goats are the scattered seed, gathered and sifted.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Then shall the King say unto them on his right hand, Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world:* (Matthew 25:34). At the sifting of the sheep from the goats, the cup of cold water given to *one of these little ones* (Matthew 10:42) becomes the *inasmuch as ye have done it* the King remembers.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* (Revelation 20:11). *These shall go away into everlasting punishment: but the righteous into life eternal* (Matthew 25:46) names where each way ends. The sifting of the gathered comes before the reign; the great white throne comes after it, at the judgment of the dead.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And the nations of them which are saved shall walk in the light of it: and the kings of the earth do bring their glory and honour into it.* (Revelation 21:24). The glory brought into the New Jerusalem belongs to the new heaven and the new earth, after the reign and the judgment of the dead. The kingdom the sheep inherit is not the nations'' portion; the nations walk in its light.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And the nations of them which are saved shall walk in the light of it: and the kings of the earth do bring their glory and honour into it.* (Revelation 21:24). The glory brought into the New Jerusalem belongs to the new heaven and the new earth, after the reign and the judgment of the dead. The righteous of Matthew 25:46 are the sifted seed; the nations walk in the light of the city.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory.* The throne of His glory in Enoch 62:1 is the very throne where Yahusha, the Son of Adam, sits to sift the seed gathered out of all nations, the sheep from the goats.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The ''give to the poor, defend the orphan'' of 2 Esdras 2:20 is the mercy the King counts when he sifts the gathered, the sheep from the goats.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Most High appears on the seat of judgment after the old silence of seven days, when *the earth shall restore those that are asleep in her* (2 Esdras 7:30-32) — the judgment of the dead after the reign. The throne of glory in Matthew 25:31 comes first, at his coming, where the gathered seed are sifted, the sheep from the goats. One King sits at both, with the reign between.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* Esdras''s day of doom is the end of this time, after the reign. Matthew 25:46 names where each way ends — everlasting punishment or life eternal — when the gathered are sifted before the reign; the sentence spoken at the sifting is the end that stands at the day of doom.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The right and the left of the great multitude Abraham beholds are a pattern of the shepherd''s dividing: the seed gathered out of all nations and sifted, the sheep on the right hand and the goats on the left.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The downfall of the idol-followers and the joy of the commandment-keepers in Apocalypse of Abraham 31:3 is the pattern of the Messiah''s separation of the sheep from the goats among the gathered.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two lots that come at the day of judgment (The Rest of Esther 10:11) set the people of Elohim (God) apart from the nations; the shepherd''s dividing goes further, sifting his own flock gathered out of all nations, the sheep from the goats.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31). Joel also sees a sitting: *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about* (Joel 3:12). The valley of Jehoshaphat is the Day on the nations that scattered his people *among the nations, and parted my land* (Joel 3:2) — the tares abroad burned first. The throne of his glory in Matthew 25 is another sitting: the seed gathered out of all nations and sifted, the sheep from the goats. One King judges the scatterers and sifts the scattered.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats* (Matthew 25:32). Joel''s gathering is of the nations against his land: *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land* (Joel 3:2). That is the Day on the scatterers. The shepherd''s dividing in Matthew 25 is among his own — the heritage brought out of the nations and sifted, the goats parted from the sheep (Ezekiel 20:37-38).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* (Matthew 25:36). The King''s sifting measures his gathered flock by the mercy Job swore he kept — *If I have seen any perish for want of clothing... and if he were not warmed with the fleece of my sheep* (Job 31:19-20). What is done to the least is done to the Messiah; Job clothed them already.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='job' AND sv.chapter_number=31 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). The Son of Adam coming in his kingdom comes *with his angels* (Matthew 16:27), and Zechariah names who else comes with him: *all the saints*. The saints are not the angels. They are the seed of promise — the righteous raised and the scattered gathered to him — coming with him into the land.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). *He cometh in the glory of his Father with the holy angels* (Mark 8:38) — and Zechariah''s day of Yahuah adds *all the saints with thee*: the seed of promise gathered to the King and coming with him, beside the angels who attend him. The shame-or-glory hinge of v.38 turns on that coming.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). He comes *in his own glory, and in his Father''s, and of the holy angels* (Luke 9:26); Zechariah sees *all the saints* with him as well — the seed of promise gathered to him and coming with him into the land, not the angels.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* (Jude 1:14). Jude names the prophet and quotes the line that answers *and all the saints with thee* (14:5): Yahuah *cometh with ten thousands of his saints*. The saints are the seed of promise — the righteous raised and the scattered gathered to him, rising up with him and coming with him into the land — not angels, and not souls coming down from heaven. Jude draws the witness from the restored book of Enoch.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* (1 Enoch 1:9). This is the very line Jude quotes, and it answers *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (14:5). The set-apart ones who come with him are the seed of promise, gathered out of all nations and coming with him into the land while the ungodly are judged — not angels, and not souls come down from heaven.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* (1 Enoch 1:9). The Hebrew library named the coming the angels promise — *He cometh with ten thousands of His set-apart ones To execute judgement upon all.* The same-manner return of Acts 1:11 is the coming Jude quoted from Enoch. The set-apart ones with him are the seed of promise, gathered to him and coming with him into the land — not souls come down out of heaven.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* (1 Enoch 1:9). The Hebrew library beheld the very coming Paul proclaims: He *cometh with ten thousands of His set-apart ones To execute judgement... And to destroy all the ungodly.* Paul says *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels, In flaming fire taking vengeance on them that know not Elohim (God)* (2 Thessalonians 1:7-8). The mighty angels attend him; the set-apart ones are another company — the seed of promise, gathered and coming with him into the land (Zechariah 14:5). The judgment to destroy the ungodly is the vengeance on them that obey not the gospel.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names Himself the Son of Adam, the very title 1 Enoch gives the Elect One who proceeds from the Head of Days. The holy angels come with him; Enoch''s *ten thousands of His set-apart ones* are the seed of promise, gathered and coming with him — and on the throne of his glory he sifts the gathered, the sheep from the goats.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). *The chariots of Elohim (God) are twenty thousand, even thousands of angels: Yahuah (Lord) is among them, as in Sinai* (Psalm 68:17): the psalm''s thousands are angels, the chariotry of the coming One. Enoch''s *ten thousands of His set-apart ones* are another company: the seed of promise, gathered and coming with him into the land (Zechariah 14:5). The angels attend him; his saints come with him.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=68 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude names Enoch "the seventh from Adam" exactly as 60:8 does, The ten thousand times ten thousand Enoch sees shaking before the throne in 60:1 are the host of the Most High, the angels; the *ten thousands of his saints* Jude quotes are another company — the seed of promise, gathered and coming with him (Zechariah 14:5).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude''s citation of Enoch sits beside the Lord coming with the armies of the holy ones in Ascension of Isaiah 4:14. The saints who come with him are the seed of promise, gathered and coming with him into the land — *and all the saints with thee* (Zechariah 14:5) — not angels, and not souls come down from heaven.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'thread:two-witnesses-and-the-two-olive-trees | *Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live:* (Ezekiel 37:5). Ezekiel''s valley is the first resurrection: *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12), the two houses made one nation and David king over them (Ezekiel 37:22, 24) — the reign. John borrows Ezekiel''s words as a pattern for another raising: *after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — the great resurrection, after the two witnesses are slain in the little season. One breath of life, two risings, the reign between them.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*So I prophesied as he commanded me, and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army.* (Ezekiel 37:10). John borrows Ezekiel''s words: *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). The words are a pattern, not the same event. Ezekiel''s army is the first resurrection — *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12) — the house raised and brought into the land for the reign. The witnesses stand up at the great resurrection after the reign, when they have been slain in the little season and the voice says *Come up hither* (Revelation 11:12).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). John borrows Ezekiel''s words — *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10) — as a pattern for another raising. Ezekiel''s army is the house of Yashar''el (Israel) brought up out of their graves and into their own land at the first resurrection; the witnesses rise at the great resurrection after the reign. The same Ruach (Spirit) gives life in both; the events are not the same.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). John takes up the words of Ezekiel''s command — *Come from the four winds, O breath, and breathe upon these slain, that they may live* (Ezekiel 37:9) — as a pattern. The slain of Ezekiel''s valley are raised at the first resurrection and brought into the land; the slain witnesses are raised at the great resurrection after the reign. The breath that gives life is one; the two risings are not the same event.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). The Spirit that *entered into me when he spake unto me, and set me upon my feet* (Ezekiel 2:2) — words Ezekiel uses of himself, and again over the valley of bones — John borrows as a pattern for the slain witnesses set on their feet at the great resurrection. It is by the Spirit entering, never by his own strength, that the dust-formed man stands.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* (John 5:28). The Formed Son''s own voice does what the prophet''s word did over the bones — *and the breath came into them, and they lived, and stood up upon their feet* (Ezekiel 37:10). But the hours differ. Ezekiel''s valley is the house of Yashar''el (Israel) raised and brought into the land at the first resurrection; *all that are in the graves* hear his voice at the great resurrection after the reign. One voice raises both.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). The exceeding great army that *stood up upon their feet* (Ezekiel 37:10) is the first resurrection, the righteous house brought into its own land for the reign (Ezekiel 37:12-14). John 5:29 is the great resurrection after it, when all come forth, the good and the evil, to be judged. The same voice raises; the first rising is the early exception.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5). The Father is the giver of breath and life — through Elijah, through Elisha, through Peter in Yahusha''s name, and at his coming over the righteous of His people, when their graves are opened and they are brought into the land (Ezekiel 37:12).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'1 Thessalonians 4:16 — *For Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Isaiah''s text says the saints *will descend and be present in the world* with Yahuah (Lord). A word of caution belongs here. No other scripture has anyone coming down from the sky with him at his coming: Paul has the Lord descend, and the dead in Messiah (Christ) rise first — up out of the grave, not down from heaven. A descent of the saints from heaven cannot stand beside that; it reads like a line carried in from church teaching. The Ethiopic itself has *descend* (yəwarrədu), so if it is an insertion it is older than the Ethiopic, and an earlier Greek or Hebrew text is still awaited. Read another way, the line may fit what the rest of scripture shows. The heights are in the north: *I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13); *Beautiful for situation, the joy of the whole earth, is mount Zion, on the sides of the north, the city of the great King* (Psalm 48:2); and Enoch sets *the garden of righteousness* in the north (1 Enoch 77:3). The gathered seed comes with him out of the north into the land: *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18); *Behold, I will bring them from the north country* (Jeremiah 31:8). A coming down from the heights of the north into the land may be what the line remembers — a possible reading, not a settled one. *Brought up... out of the north country* (Jeremiah 23:8) does not contradict it, for in scripture one goes up to the land from any quarter: *And Abram went up out of Egypt... into the south* (Genesis 13:1); *And Joseph also went up from Galilee... into Judæa* (Luke 2:4).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* John''s white linen of the saints is the garments Isaiah says are stored up on high for the saints in Ascension of Isaiah 4:16 — the righteousness of the saints, their reward kept for them.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* Wisdom of Solomon 3:8 names THE direct wisdom-stream verbal-anchor for the gathered-remnant judging the nations + having dominion + the kingdom-of-Yahuah-reigning-for-ever substance. The framework reads the verse against Matt 25:32''s *and before him shall be gathered all nations: and he shall separate them one from another.* The gathering of Matt 25:32 comes first — the seed brought out of all nations and sifted, the sheep from the goats; then the gathered remnant of the seed of promise (the King''s brethren of Matt 25:40), once sifted, judges the nations in the reign, as Wisdom of Solomon 3:8 had named. The Tanakh-parallel at Daniel 7:22 (*judgment was given to the saints of the most High; and the time came that the saints possessed the kingdom*) and Daniel 7:27 (*the kingdom and dominion ... shall be given to the people of the saints of the most High*) carries the same architecture. The framework reads this in continuity with Red Line #11''s destination-of-the-gathered-remnant-as-priests-to-the-nations during the millennial-reign + per Revelation 5:10 (*and hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth*).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours.* Wisdom of Solomon 5:1 names THE direct wisdom-stream verbal-anchor for the reversal-architecture of the day-of-vindication-of-the-righteous. The framework reads the verse against Matt 25:41''s *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels.* The day Wisdom of Solomon prefigured at the wisdom-stream-register is the day Matt 25 enacts — the righteous stand in great boldness; the ungodly are terrified and confess at vv.42-44 the same way Wisdom of Solomon 5:2-6 had named (*they shall be troubled with terrible fear, and shall be amazed at the strangeness of his salvation* + *therefore have we erred from the way of truth*). The wisdom-stream had named the reversal at the prefiguring-passage centuries before; the King-of-Yashar''el (Israel) walks the operative-substance at the sheep-and-goats-judgment. The framework reads the substance carefully — the everlasting-fire was-substantively-prepared FOR-the-devil-and-his-angels (the Watcher-rebellion the apostle-Yahudah (Jude) walked at Jude 6-7 + the apostle-Kefa (Peter) walked at 2 Peter 2:4 + the apostle-Yochanan (John) walks at Revelation 20:10 + 20:14-15); the goats sent toward it are the unfruitful among the gathered, sifted before the reign — not the nations judged for entry into it.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=41
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end:* (2 Esdras 7:33). The seat of judgment Esdras sees comes after the old silence of seven days (2 Esdras 7:30), at the judgment of the dead after the reign. The throne of glory of Matthew 25:31-32 comes first, at his coming, where the gathered are sifted, the sheep from the goats; and Joel''s valley of Jehoshaphat, where he pleads with the nations *for my people and for my heritage Yashar''el (Israel)* (Joel 3:2), is the Day on the scatterers. One King, two sittings, the reign between them.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*Give of your bread to the hungry, and of your garments to them that are naked; and according to your abundance give alms: and let not your eye be envious, when you give alms.* Tobit 4:16 names THE direct wisdom-stream verbal-anchor for the give-bread-to-the-hungry + give-garments-to-the-naked substance — the substantial-substance the King-of-Yashar''el (Israel) walks at the six-fold-mercy-criterion of Matt 25:35-36. The framework reads the verse against *For I was an hungred, and ye gave me meat ... naked, and ye clothed me.* Tobit 4:16 names the wisdom-stream''s direct verbal-anchor for two of the six-fold-criterion-substance the King-of-Yashar''el (Israel) walks at the sheep-and-goats-judgment. The wisdom-stream had named the substance the substantial Tanakh-prophets walked at Isaiah 58:6-10 (*deal thy bread to the hungry* + *when thou seest the naked, that thou cover him*) + Job 31:16-22 (*If I have seen any perish for want of clothing*) + Proverbs 19:17 (*he that hath pity upon the poor lendeth unto Yahuah (the LORD)*) + Deuteronomy 10:18-19 (*love ye therefore the stranger*). The substantial-substance is NOT the substantial-categorical-charity-program-substance the inherited-Christian-collapse walks; the measure is mercy toward the King''s brethren, the seed of promise, and it is the measure by which the gathered are sifted, the sheep from the goats, before the reign.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=35
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*And he shall humble the countenance of the strong, And shall abase the pride of the mighty, And shall be filled with shame.* 1 Enoch 62:11 names the wisdom-stream articulation of the humbling-of-the-strong + the abasing-of-the-pride-of-the-mighty substance — the substantial-substance the King-of-Yashar''el (Israel) walks at Matt 25:41''s *Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels.* The framework reads the verse in continuity with 1 Enoch 62:12 (*and the countenance of the strong shall be covered with shame, and darkness shall be their dwelling*) — the substantial-substance the wisdom-stream had named at the darkness-as-dwelling architecture is the substantial-substance the King-of-Yashar''el (Israel) walks-out at the everlasting-fire-substance + the outer-darkness-substance of Matt 22:13 + Matt 25:30. The goats sent toward that fire are the unfruitful among the gathered, sifted before the reign; the fire was prepared for the devil and his angels (Jude 6-7 + 2 Peter 2:4 + Revelation 20:10).'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=41
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_references x SET note = E'*In those days the kings and the mighty who possess the earth Shall be seized with great terror, And they shall pray and supplicate ... and they shall not be saved.* 1 Enoch 63:7 names the wisdom-stream articulation of the kings-and-mighty-seized-with-great-terror substance — the substantial-substance the substantial-goats walk-into at the sheep-and-goats-judgment. The framework reads the verse against Matt 25:41''s *Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels* + Matt 25:44''s *Lord, when saw we thee an hungred, or athirst, or a stranger, or naked, or sick, or in prison, and did not minister unto thee?* The substantial-substance the wisdom-stream had named at the prayer-and-supplication-too-late substance is the substantial-substance the goats walk-into the substantial *Lord, when saw we thee* substance at v.44 — the substantial-recognition-comes-too-late, the substantial-shut-door-substance of the substantial-ten-virgins is operative at the sifting of the sheep from the goats also. The framework reads this carefully — the substantial-substance the substantial-cutoff-is-substantial; the substantial-substance the substantial-Universalist-substance the substantial-modern-Christian-and-Hebrew-Roots-Universalism walks is explicitly-ruled-out; the substantial-substance the substantial-everlasting-punishment-substance of v.46 is substantial.'
  FROM _s440_lu sv, _s440_lu tv
 WHERE true
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=41
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=63 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

-- ===== thread member notes =====
UPDATE cross_reference_thread_members m SET member_note = E'*Before him shall be gathered all nations* — the seed gathered out of all the nations where it was scattered, and sifted in the wilderness of the people, the goats from the sheep (Ezekiel 20:35-38).'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Zechariah 14:16 — *every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King* — the nations left alive in the reign that follows; the sheep and the goats are the gathered seed, sifted before it.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Revelation 20:10 — the devil cast into the lake of fire after the little season; the *everlasting fire, prepared for the devil and his angels* (Matthew 25:41) toward which the goats are sent at the sifting.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Isaiah 60:1-3 — Zion arises and the nations come to her light in the reign; the sheep are the gathered seed who carry that light, not the nations.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Joel 3:1-2 — *I will also gather all nations... and will plead with them there for my people* — the Day on the nations that scattered his people; the sheep and the goats are the scattered seed, gathered and sifted.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory.* The throne of His glory in Enoch 62:1 is the very throne where Yahusha, the Son of Adam, sits to sift the seed gathered out of all nations, the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='1-enoch-62-elect-one-throne-of-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The ''give to the poor, defend the orphan'' of 2 Esdras 2:20 is the mercy the King counts when he sifts the gathered, the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Most High appears on the seat of judgment after the old silence of seven days, when *the earth shall restore those that are asleep in her* (2 Esdras 7:30-32) — the judgment of the dead after the reign. The throne of glory in Matthew 25:31 comes first, at his coming, where the gathered seed are sifted, the sheep from the goats. One King sits at both, with the reign between.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* Esdras''s day of doom is the end of this time, after the reign. Matthew 25:46 names where each way ends — everlasting punishment or life eternal — when the gathered are sifted before the reign; the sentence spoken at the sifting is the end that stands at the day of doom.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The right and the left of the great multitude Abraham beholds are a pattern of the shepherd''s dividing: the seed gathered out of all nations and sifted, the sheep on the right hand and the goats on the left.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The downfall of the idol-followers and the joy of the commandment-keepers in Apocalypse of Abraham 31:3 is the pattern of the Messiah''s separation of the sheep from the goats among the gathered.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two lots that come at the day of judgment (The Rest of Esther 10:11) set the people of Elohim (God) apart from the nations; the shepherd''s dividing goes further, sifting his own flock gathered out of all nations, the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='rest-of-esther-10-two-lots-day-of-judgment-feast' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Zechariah 14:5 — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* — the day of Yahuah; the angels attend the King, and the saints with him are the seed of promise gathered to him.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Zechariah 14:5 — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* The saints with him are the seed of promise gathered to him; the holy angels attend him.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'1 Enoch 1:9 — *He cometh with ten thousands of His set-apart ones To execute judgement upon all* the coming Jude quoted — the One taken up returns, and the set-apart ones with him are the seed of promise gathered to him.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'1 Enoch 1:9 — *He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* the library''s same coming; the mighty angels attend him, the set-apart ones are the seed of promise coming with him, and the judgment is the vengeance of 2 Thessalonians 1:7-8.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names Himself the Son of Adam, the very title 1 Enoch gives the Elect One who proceeds from the Head of Days. The holy angels come with him; Enoch''s *ten thousands of His set-apart ones* are the seed of promise, gathered and coming with him — and on the throne of his glory he sifts the gathered, the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='1-enoch-1-cometh-with-ten-thousands' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude names Enoch "the seventh from Adam" exactly as 60:8 does, The ten thousand times ten thousand Enoch sees shaking before the throne in 60:1 are the host of the Most High, the angels; the *ten thousands of his saints* Jude quotes are another company — the seed of promise, gathered and coming with him (Zechariah 14:5).'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='1-enoch-60-son-of-adam-enoch-taken-up' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude''s citation of Enoch sits beside the Lord coming with the armies of the holy ones in Ascension of Isaiah 4:14. The saints who come with him are the seed of promise, gathered and coming with him into the land — *and all the saints with thee* (Zechariah 14:5) — not angels, and not souls come down from heaven.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'*Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live:* (Ezekiel 37:5). Ezekiel''s valley is the first resurrection: *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12), the two houses made one nation and David king over them (Ezekiel 37:22, 24) — the reign. John borrows Ezekiel''s words as a pattern for another raising: *after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — the great resurrection, after the two witnesses are slain in the little season. One breath of life, two risings, the reign between them.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='two-witnesses-and-the-two-olive-trees' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Ezekiel 37:10 — *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* John borrows the words, *stood up upon their feet*, as a pattern: Ezekiel''s raising is the first resurrection, into the land; the witnesses stand at the great resurrection after the reign (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Ezekiel 37:5 — *I will cause breath to enter into you, and ye shall live* — the Father is the giver of breath and life, through Elijah, Elisha, Peter, and at his coming over the righteous of His people.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'1 Thessalonians 4:16 — *Yahusha (Lord) himself shall descend from heaven... and the dead in Messiah (Christ) shall rise first* — no other scripture has anyone coming down from the sky with him, so Isaiah''s *descend* (already in the Ethiopic) reads as an early insertion; or, read with the heights in the north (Psalm 48:2; Isaiah 14:13), as the gathered seed coming with him out of the north into the land (Jeremiah 3:18) — a possible reading, not a settled one.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* John''s white linen of the saints is the garments Isaiah says are stored up on high for the saints in Ascension of Isaiah 4:16 — the righteousness of the saints, their reward kept for them.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Wisdom of Solomon 3:8 — *They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* The righteous judge the nations in the reign that follows, as *the time came that the saints possessed the kingdom* (Daniel 7:22). The gathering of Matthew 25:32 comes first: the seed brought out of all nations and sifted, the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Wisdom of Solomon 5:1 — *Then shall the righteous man stand in great boldness before the face of such as have afflicted him.* THE direct verbal-anchor for the reversal-architecture of the day-of-vindication-of-the-righteous; the substantial-everlasting-fire of Matt 25:41 was-substantively-prepared-FOR-the-devil-and-his-angels per Jude 6-7 + 2 Peter 2:4 + Revelation 20:10 + 20:14-15; the goats sent toward it are the unfruitful among the gathered, sifted before the reign.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=41
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'1 Enoch 62:11 — *He shall humble the countenance of the strong, And shall abase the pride of the mighty.* The humbling-of-the-strong + abasing-of-the-pride-of-the-mighty substance + the darkness-as-dwelling at 62:12 — the substantial-outer-darkness of Matt 22:13 + 25:30 + the everlasting-fire of Matt 25:41. The fire was-substantively-prepared-FOR-the-devil-and-his-angels per Jude 6-7 + 2 Peter 2:4 + Revelation 20:10; the goats sent toward it are the unfruitful among the gathered, sifted before the reign.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=41
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'2 Esdras (4 Ezra) 7:33 — *And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end:* The seat of judgment Esdras sees comes after the old silence of seven days (2 Esdras 7:30), at the judgment of the dead after the reign. The throne of glory of Matthew 25:31-32 comes first, at his coming, where the gathered are sifted, the sheep from the goats. One King, two sittings, the reign between them.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='the-few-saved-many-lost-and-the-post-harvest-sifting-in-2-esdras' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'*When the Son of Adam shall come in his glory... then shall he sit upon the throne of his glory* (Matthew 25:31) — another sitting than the valley of Jehoshaphat: there the nations that scattered his people are judged; on the throne of his glory the seed gathered out of all nations is sifted.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'*before him shall be gathered all nations: and he shall separate them one from another* (Matthew 25:32) — Joel''s valley is the Day on the scatterers; the shepherd''s dividing is among his own, the scattered seed gathered and sifted, the goats from the sheep.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'*Naked, and ye clothed me* (Matthew 25:36) — the King''s measure when he sifts his gathered flock; Job had clothed them already.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='job-31-19-the-poor-the-widow-the-fatherless-the-naked' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='job' AND sv.chapter_number=31 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'★★ *He cometh with ten thousands of His set-apart ones* (1 Enoch 1:9) — 68:17''s thousands are angels, the chariotry of the coming One; Enoch''s set-apart ones are another company, the seed of promise gathered and coming with him (Zechariah 14:5).'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='psalm-68-the-earth-shook-even-sinai-itself' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=68 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'Ezekiel 37:5 — *Behold, I will cause breath to enter into you, and ye shall live* the breath into the dry bones at the first resurrection; John borrows the words as a pattern for the slain witnesses raised at the great resurrection (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'★★★ *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — John borrows Ezekiel 37:10''s words as a pattern: the valley is the first resurrection into the land; the witnesses stand at the great resurrection after the reign.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'★★ *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — takes up *Come from the four winds, O breath* (Ezekiel 37:9) as a pattern; one breath of life, two risings, the reign between them.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'★★ *all that are in the graves shall hear his voice* (John 5:28) — the Son''s voice does what the prophet''s word did over the bones; Ezekiel''s valley is the first resurrection, *all that are in the graves* the great resurrection after the reign.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
UPDATE cross_reference_thread_members m SET member_note = E'*they that have done good, unto the resurrection of life* (John 5:29) — the great resurrection after the reign; the exceeding great army of Ezekiel 37:10 is the first resurrection, the righteous house brought into its land.'
  FROM cross_reference_threads t, cross_references x, _s440_lu sv, _s440_lu tv
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

-- ===== thread titles / summaries =====
UPDATE cross_reference_threads SET title = E'The Sheep Divided From The Goats — The Gathered Sifted At The Throne Of His Glory', summary_md = E'*When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory: And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats: And he shall set the sheep on his right hand, but the goats on the left.* (Matthew 25:31-33). *All nations* names where the gathered come from. The seed was scattered among all the nations, and at his coming it is gathered out of them — and then sifted. Ezekiel saw the sifting and where it happens: *And I will bring you into the wilderness of the people, and there will I plead with you face to face... And I will cause you to pass under the rod, and I will bring you into the bond of the covenant: And I will purge out from among you the rebels, and them that transgress against me: I will bring them forth out of the country where they sojourn, and they shall not enter into the land of Yashar''el (Israel)* (Ezekiel 20:35, 37-38). The goats are parted from the sheep among the gathered, before the reign — not the nations judged for entry into it. The measure is mercy shown to *one of the least of these my brethren* (Matthew 25:40), and the brethren are the seed: *for which cause he is not ashamed to call them brethren* (Hebrews 2:11). The sheep *inherit the kingdom prepared for you from the foundation of the world* (Matthew 25:34) and enter the land as a kingdom of priests to the nations left alive (Zechariah 14:16); the goats are sent toward *everlasting fire, prepared for the devil and his angels* (Matthew 25:41). The warning was always given to the wheat.'
 WHERE slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory';
UPDATE cross_reference_threads SET title = E'The day of vindication of the righteous — Wisdom of Solomon 3 and 5 beside the sifting of the sheep from the goats', summary_md = E'Matt 25:31-46''s sheep-and-goats-judgment-at-the-throne-of-his-glory + the reversal-architecture-of-the-righteous-vindicated-and-the-ungodly-confessing — read against the wisdom-stream''s direct articulation of the day-of-vindication-of-the-righteous + the gathered-remnant-judging-the-nations + the great-boldness-of-the-righteous-before-the-face-of-such-as-have-afflicted-him substance in Wisdom of Solomon 3 and 5. Four moves: Wisdom of Solomon 3:7 names the wisdom-stream verbal-anchor for the day-of-visitation when the righteous shine — the same architecture the apostle-Sha''ul (Paul) walks at 1 Thessalonians 4:13-17 and the prophet-Daniel walked at Daniel 12:3''s *they that be wise shall shine as the brightness of the firmament*; Wisdom of Solomon 3:8 names THE direct verbal-anchor for the *they shall judge the nations, and have dominion over the people* — the gathered remnant of the seed of promise, once sifted, judges the nations in the reign, the same architecture Daniel 7:22, 27 walks (*the saints possessed the kingdom* + *the kingdom and dominion ... shall be given to the people of the saints of the most High*); Wisdom of Solomon 5:5 names the children-of-Yahuah-substance + the lot-among-the-saints substance — the inheritance-prepared-from-the-foundation-of-the-world the King declares at Matt 25:34, in continuity with Red Line #11''s names-written-in-the-Lamb''s-book-from-the-foundation-of-the-world architecture per Revelation 13:8, 17:8; Wisdom of Solomon 5:1 names THE direct verbal-anchor for the reversal-architecture (*then shall the righteous man stand in great boldness before the face of such as have afflicted him*) — the day the wisdom-stream prefigured is the day Matt 25:41 enacts, with the ungodly confessing at vv.42-44 the same way Wisdom of Solomon 5:2-6 had named (*they shall be troubled with terrible fear* + *therefore have we erred from the way of truth*). The framework reads the cluster as the wisdom-stream''s direct corroboration of the reversal-and-vindication-architecture the King-of-Yashar''el (Israel) walks-out at the sheep-and-goats-judgment. The substantial-everlasting-fire of v.41 was-substantively-prepared-FOR-the-devil-and-his-angels per Jude 6-7 + 2 Peter 2:4 + Revelation 20:10 + 20:14-15; the goats sent toward it are the unfruitful among the gathered, sifted before the reign — not the nations judged for entry into it.'
 WHERE slug='the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon';
UPDATE cross_reference_threads SET summary_md = E'Matt 25:31-46''s sifting of the sheep from the goats — the Son-of-Adam-coming-in-his-glory + all-the-holy-angels-with-him + the throne-of-his-glory + all-nations-gathered-before-him + the separation-substance + the everlasting-fire-prepared-for-the-devil-and-his-angels — read against 1 Enoch''s Parables (chapters 46-63) on the Son-of-Adam-on-the-throne-of-his-glory raising-up-the-kings-and-mighty-from-their-seats + putting-them-down-from-their-thrones + the kings-and-mighty-seized-with-great-terror + the secrets-of-the-Most-High-revealed-to-the-Elect-One. Five moves: 1 Enoch 62:5 names the wisdom-stream context for the throne-of-his-glory + the secrets-of-the-Most-High substance + the books-of-the-living-opened-before-him — the substantial-architecture the sheep-and-goats opening at Matt 25:31 walks-into directly; 1 Enoch 62:3 names the substantial-angelic-host-summoned-with-the-Elect-One substance — the substantial-substance Matt 25:31''s *all the holy angels with him* walks, in continuity with Deuteronomy 33:2 + Daniel 7:10 + Zechariah 14:5 + Jude 14-15; 1 Enoch 62:9 names THE direct verbal-anchor for the Son-of-Adam-raising-up-the-kings-and-mighty-from-their-thrones substance (*Shall raise up the kings and the mighty from their seats, And the strong from their thrones*) — the reversal-architecture the sheep-and-goats-judgment walks-out, in continuity with Tehillim (Psalm) 2:9 + Tehillim (Psalm) 110:5-6 + Isaiah 24:21; 1 Enoch 62:11 names the humbling-of-the-strong + the abasing-of-the-pride-of-the-mighty substance + the darkness-as-dwelling architecture — the substantial-outer-darkness-substance of Matt 25:30, 22:13, and the everlasting-fire-substance of Matt 25:41; 1 Enoch 63:7 names the kings-and-mighty-seized-with-great-terror + the prayer-and-supplication-too-late substance — the substantial-substance the goats walk-into at the substantial *Lord, when saw we thee* of Matt 25:44, with the substantial-recognition-coming-too-late and the substantial-cutoff-being-substantial. The framework reads the cluster carefully — this thread sits parallel to the S154 thread `the-son-of-adam-glorified-in-1-enoch-throne-vision-and-parables` (anchored on Matt 17 transfiguration) which carried the glorified-form-substance for the pre-resurrection-foretaste; this thread carries the judgment-of-the-kings-and-mighty-cast-down + reversal architecture for the second-coming + the sheep-and-goats-judgment-at-the-throne-of-his-glory. The substantial-everlasting-fire of v.41 was-substantively-prepared-FOR-the-devil-and-his-angels per Jude 6-7 + 2 Peter 2:4 + Revelation 20:10 + 20:14-15; the goats sent toward it are the unfruitful among the gathered, sifted before the reign; the kings and the mighty who possess the earth (1 Enoch 63:7) fall at the Day with the tares abroad; the substantial-Universalist-substance is explicitly-ruled-out — the substantial-cutoff at the substantial-shut-door + the substantial-everlasting-punishment of v.46 is substantial.'
 WHERE slug='the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables';
UPDATE cross_reference_threads SET summary_md = E'The slain witnesses are raised, and John borrows the words of Ezekiel''s valley of dry bones as a pattern: *And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). Yahuah (LORD) said over the bones, *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5), and *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10) — the very words, *stood up upon their feet.* Ezekiel''s valley is the first resurrection: *these bones are the whole house of Yashar''el (Israel)* (Ezekiel 37:11), the graves opened and the people brought into their own land for the reign. John takes up the words for another raising: the standing witnesses are the righteous rising at the great resurrection, after the reign — the same breath, not the same event. Then the ascent: *And they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud; and their enemies beheld them* (Revelation 11:12). Elijah''s going-up is its pattern — *Elijah went up by a whirlwind into heaven* (2 Kings 2:11) — and the library kept the memory: *Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Sirach 48:9). The same passage names why the prophet was kept: he was *ordained for reproofs in their times... and to restore the tribes of Jacob* (Sirach 48:10). The witnesses, the two houses, Yahudah (Judah) and Yashar''el (Israel), walk in that office, and their *Come up hither* is the catching-up Paul named: *Then we which are alive and remain shall be caught up together with them in the clouds, to meet the Lord in the air: and so shall we ever be with the Lord* (1 Thessalonians 4:17) — after the reign and the little season, at the last trump, when the righteous rise at the great resurrection.'
 WHERE slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37';
UPDATE cross_reference_threads SET summary_md = E'*But the saints will come with Yahuah (Lord) with their garments which are (now) stored up on high in the seventh heaven: with Yahuah (Lord) they will come, whose spirits are clothed, they will descend and be present in the world, and He will strengthen those, who have been found in the body, together with the saints, in the garments of the saints, and Yahuah (Lord) will minister to those who have kept watch in this world.* (Ascension of Isaiah 4:16); and *afterwards they will turn themselves upward in their garments, and their body will be left in the world* (4:17). Paul sets down the order plainly: *For Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The dead rise up out of the grave at his coming. No other scripture has anyone coming down from the sky with him, so Isaiah''s *descend* needs a careful word: as a descent from heaven it cannot stand, and it reads like a line carried in from church teaching — older than the Ethiopic, which itself has *descend*, so an earlier Greek or Hebrew text is still awaited. Read with the heights in the north — *mount Zion, on the sides of the north, the city of the great King* (Psalm 48:2) — it may instead remember the gathered seed coming with him out of the north into the land: *they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18). That is offered as a possible reading, not a settled one. Isaiah''s *afterwards* keeps the distance Paul keeps: after the reign and the little season, *we which are alive and remain shall be caught up together with them in the clouds, to meet Yahusha (Lord) in the air* (1 Thessalonians 4:17) — the going up in the garments of the upper world, the body left behind (Ascension of Isaiah 4:17; 9:9). The garments of white are *the righteousness of saints* (Revelation 19:8).'
 WHERE slug='ascension-isaiah-4-saints-descend-garments';
UPDATE cross_reference_threads SET summary_md = E'*Yahuah (Lord) will come with His angels and with the armies of the holy ones from the seventh heaven with the glory of the seventh heaven, and He will drag Beliar into Gehenna and also his armies* (Ascension of Isaiah 4:14). At his coming the lawless one is destroyed: *the armies which were in heaven followed him upon white horses* (Revelation 19:14), and the beast out of the sea and the false prophet *were cast alive into a lake of fire burning with brimstone* (Revelation 19:20). Paul: *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). Enoch the seventh from Adam said the same — *Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). The saints who come with him are the seed of promise, gathered and coming with him into the land — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5) — not souls come down from heaven; no other scripture has anyone coming down from the sky with him. It ain''t new.'
 WHERE slug='ascension-isaiah-4-Lord-comes-beliar-gehenna';
UPDATE cross_reference_threads SET summary_md = E'Matt 25:34-46''s sheep-and-goats criterion-of-mercy — the six-fold-substance (hungry-fed + thirsty-given-drink + stranger-taken-in + naked-clothed + sick-visited + prisoner-came-unto) + the substantial *Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* + the reverse-six-fold-failure of the substantial-goats — read against the wisdom-stream''s direct articulation of the alms-and-mercy-toward-the-poor-and-stranger as the substance of righteousness in Sirach (Ecclesiasticus) and Tobit. Five moves: Tobit 4:16 names THE direct verbal-anchor for two of the six-fold-criterion (*Give of your bread to the hungry, and of your garments to them that are naked*) — the same substance the substantial Tanakh-prophets walked at Isaiah 58:6-10 + Job 31:16-22 + Deuteronomy 10:18-19 + Proverbs 19:17; Sirach 7:32 names the stretch-your-hand-to-the-poor substance, with 7:34 (*fail not to be with them that weep*) and 7:35 (*be not slow to visit the sick*) walking the same six-fold-substance the King-of-Yashar''el (Israel) walks at the criterion; Sirach 29:9 names the help-the-poor-for-the-commandment''s-sake substance — the substantial-doing-of-mercy-as-the-substantial-doing-of-the-commandment, NOT the substantial-categorical-charity-program-substance the inherited-Christian-collapse walks; Sirach 4:1 names the do-not-defraud-the-poor-and-make-not-the-needy-eyes-to-wait substance — the substantial-substance the reverse-six-fold-failure at Matt 25:42-44 walks-into; Tobit 4:7 names the give-alms + the-face-of-Yahuah-shall-not-be-turned-away substance — the substantial-doing-of-mercy walks the substantial-face-of-Yahuah-toward-the-doer. The framework reads the cluster as the wisdom-stream''s direct corroboration of the criterion-of-mercy substance — the substantial-substance is the substantial-mercy-toward-the-King''s-brethren-during-the-tribulation per Red Line #7''s Three-Categories-architecture; the substantial *my brethren* (Greek *tōn adelphōn mou*) is the gathered-remnant-of-the-twelve-tribes-of-Yashar''el (Israel)-substance the King-of-Yashar''el (Israel) walks-as-the-substantial-seed-of-promise per `kinship-redefinition-kingdom-family` thread at Matt 12:46-50, NOT the categorical-poor-and-vulnerable. The measure of mercy toward the King''s brethren is the measure by which the gathered are sifted, the sheep from the goats, before the reign — not a test the nations pass to enter it.'
 WHERE slug='the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit';
UPDATE cross_reference_threads SET summary_md = E'Joel''s last chapter opens the great assize: *For, behold, in those days, and in that time, when I shall bring again the captivity of Yahudah (Judah) and Jerusalem, I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land* (Joel 3:1-2). Two things happen at once: the scattered covenant people are brought home, and the nations that scattered them are judged. *Whom they have scattered* is the two-house frame — Yahudah in the south and Yashar''el/Ephraim in the north, divided and dispersed, now pleaded for as Yahuah''s own heritage. The same court convenes everywhere in the prophets. Ezekiel sees the latter-day muster: *thou shalt come up against my people of Yashar''el (Israel)... it shall be in the latter days, and I will bring thee against my land* (Ezekiel 38:16), after the regathering — *I have gathered them unto their own land, and have left none of them any more there* (Ezekiel 39:28). Zechariah sets the same scene: *I will gather all nations against Jerusalem to battle... Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:2-3). The nations are gathered as the unclean spirits *gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). The throne of glory is another sitting: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory: And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats* (Matthew 25:31-32) — there the seed gathered out of all nations is sifted, the goats from the sheep. The nations are drawn to the very place of their judgment; the scattered people are gathered home; Yahuah pleads for his heritage. (The lawsuit of vv.3-8 against Tyre, Zidon, Palestine, and the Grecians for selling the children of Yahudah is the measure-for-measure recompence — *I will return your recompence upon your own head* — and his pledge *I will raise them out of the place whither ye have sold them* (3:7) is this same regathering.)'
 WHERE slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered';
UPDATE cross_reference_threads SET summary_md = E'The comfort is yoked to covenant mercy-works: *Do right to the widow, judge for the fatherless, give to the poor, defend the orphan, clothe the naked, Heal the broken and the weak, laugh not a lame man to scorn, defend the maimed, and let the blind man come into the sight of my clearness.* (2 Esdras 2:20-21). This is the very ledger the King keeps when he sifts the gathered, the sheep from the goats — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* (Matthew 25:35) and *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* (Matthew 25:36) — reckoned as done to the King himself — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* (Matthew 25:40). It ain''t new: the mercy-Torah of 2 Esdras 2 is the standard of the throne in Matthew 25.'
 WHERE slug='2-esdras-2-do-right-to-the-widow-and-poor';
UPDATE cross_reference_threads SET summary_md = E'Then the Most High takes the throne and the verdict stands: *And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* (2 Esdras 7:33), *But judgment only shall remain, truth shall stand, and faith shall wax strong* (2 Esdras 7:34) — *But the day of doom shall be the end of this time, and the beginning of the immortality for to come, in which corruption is past* (2 Esdras 7:43). Yahusha is the One on that seat. Before the reign, at his coming, he sits on the throne of his glory to sift the gathered: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31), and the two ways part forever — *And these shall go away into everlasting punishment: but the righteous into life eternal* (Matthew 25:46). The seat Esdras sees after the old silence is the judgment of the dead after the reign, and John saw it: *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11).'
 WHERE slug='2-esdras-7-seat-of-judgment-day-of-doom';
UPDATE cross_reference_threads SET summary_md = E'At the last Abraham sees the multitude divided in two: *And I saw there a great multitude — men and women and children, half of them on the right side of the picture, and half of them on the left side of the picture.* (Apocalypse of Abraham 21:7). It ain''t new — election runs back to Rebekah''s womb, two peoples sundered before they had done good or ill: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). And a dividing stands at his coming too, when the Son of Adam sifts the seed gathered out of all nations: *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* (Matthew 25:32), *And he shall set the sheep on his right hand, but the goats on the left.* (Matthew 25:33). In Abraham''s picture the right hand is the elect of Abraham''s seed and the left the heathen; at the throne of glory the shepherd sifts even his own gathered flock, the sheep from the goats — election precedes confession, and it is not a church replacing Yashar''el but the dividing the Maker fixed from the womb to the judgment.'
 WHERE slug='apocalypse-of-abraham-21-two-peoples-right-left';
UPDATE cross_reference_threads SET summary_md = E'The line is drawn between two peoples by what they chose to do: *"For on them shall they see the righteousness of the Creator — those, namely, who have chosen to do my will, and those who have openly kept my commandments; and they shall rejoice with joy over the downfall of the men who still remain, who have followed the idols and their murders."* (Apocalypse of Abraham 31:3). It ain''t new. Moses set the same two ways before the people: *"See, I have set before thee this day life and good, and death and evil;"* (Deuteronomy 30:15). The Messiah divides his gathered flock the same way: *"And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:"* (Matthew 25:32). Election precedes confession, and Torah stands — the righteous are known by having *openly kept my commandments*, the wicked by following the idols. The keeping of the commandments was never the curse; it is the mark of those who see the righteousness of the Creator.'
 WHERE slug='apocalypse-of-abraham-31-two-peoples-kept-commandments';
UPDATE cross_reference_threads SET summary_md = E'Ben Sira charges: *Make not an hungry soul sorrowful; neither provoke a man in his distress.* (Ecclesiasticus 4:2), and *Reject not the supplication of the afflicted; neither turn away your face from a poor man.* (Ecclesiasticus 4:4). The Messiah will fold this very mercy into the sifting of the gathered, the sheep from the goats: *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* (Matthew 25:35) — done to the least, done to the King. Isaiah had already named it the fast Yahuah chooses: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house?* (Isaiah 58:7), with the promise *Then shall thy light break forth as the morning* (Isaiah 58:8). And James, the closest NT sibling of Sirach, exposes the empty word that feeds no one: *If a brother or sister be naked, and destitute of daily food* (James 2:15), *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:16). It ain''t new.'
 WHERE slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred';
UPDATE cross_reference_threads SET summary_md = E'The dream ends in a sorting and a feast: *Therefore has he made two lots, one for the people of Yahuah (God), and another for all the Gentiles* (The Rest of Esther 10:10) — *And these two lots came at the hour, and time, and day of judgment, before Yahuah (God) among all nations* (The Rest of Esther 10:11). The two lots at the day of judgment set his people apart from the nations; the shepherd''s separation goes further, sifting his own gathered flock: *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* (Matthew 25:32). And the deliverance is fixed as a moed, an appointed time set before Yahuah: *Therefore those days shall be to them in the month Adar, the fourteenth and fifteenth day of the same month, with an assembly, and joy, and with gladness before Yahuah (God)* (The Rest of Esther 10:13). It is feast-keeping in the pattern Torah laid down — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* (Leviticus 23:4) — the month *turned unto them from sorrow to joy, and from mourning into a good day* (Esther 9:22). The lot for the people of Yahuah ends in an assembly of gladness.'
 WHERE slug='rest-of-esther-10-two-lots-day-of-judgment-feast';
UPDATE cross_reference_threads SET summary_md = E'*I was eyes to the blind, and feet was I to the lame* (Job 29:15). Job describes himself as the helper of the helpless, the one who delivered *him that had none to help him* (Job 29:12) — and in this he is the very portrait of the righteous king the psalm sings: *For he shall deliver the needy when he crieth; the poor also, and him that hath no helper* (Psalm 72:12). Yet the portrait reaches further than Job. The Anointed One comes bearing exactly these works: *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives* (Isaiah 61:1), which Yahusha (Jesus) reads over Himself in the synagogue — *recovering of sight to the blind, to set at liberty them that are bruised* (Luke 4:18). And the King will sift his gathered flock by this same standard, counting mercy to the least as done unto Himself: *For I was an hungred, and ye gave me meat... I was a stranger, and ye took me in* (Matthew 25:35). What Job did in his city — eyes to the blind, feet to the lame, a father to the poor — is the pattern the Messiah''s whole ministry consummates and the measure by which all shall be weighed.'
 WHERE slug='job-29-eyes-to-the-blind-feet-to-the-lame-the-servants-works';
UPDATE cross_reference_threads SET summary_md = E'Job''s oath rolls through the whole Torah of mercy: *If I have withheld the poor from their desire, or have caused the eyes of the widow to fail; Or have eaten my morsel myself alone, and the fatherless hath not eaten thereof... If I have seen any perish for want of clothing, or any poor without covering; If his loins have not blessed me, and if he were not warmed with the fleece of my sheep* (Job 31:16-20). This is Deuteronomy lived: *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). It is Isaiah''s true fast: *when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh* (Isaiah 58:7). It is the King''s own measure when he sifts his gathered flock: *Naked, and ye clothed me: I was sick, and ye visited me* (Matthew 25:36) — what is done to the least is done to the Messiah, and Job had clothed them already. The fathers'' wisdom charged the same — *be a father to the fatherless* (Sirach 4:10), *Give of your bread to the hungry, and of your garments to them that are naked* (Tobit 4:16). The Torah''s mercy is not external rule but the inward life of the man who feared Yahuah from his youth.'
 WHERE slug='job-31-19-the-poor-the-widow-the-fatherless-the-naked';
UPDATE cross_reference_threads SET summary_md = E'The psalm remembers the day of fire: *O Elohim (God), when thou wentest forth before thy people, when thou didst march through the wilderness; Selah: The earth shook, the heavens also dropped at the presence of Elohim (God): even Sinai itself was moved at the presence of Elohim (God), the Elohim (God) of Yashar''el (Israel)* (Psalm 68:7-8), and names the host that attends Him: *The chariots of Elohim (God) are twenty thousand, even thousands of angels: Yahuah (Lord) is among them, as in Sinai, in the holy place* (68:17). Exodus shows the mount on fire: *mount Sinai was altogether on a smoke... and the whole mount quaked greatly* (Exodus 19:18). Deborah sings it almost word for word: *The mountains melted from before Yahuah (LORD), even that Sinai* (Judges 5:5). Moses names the myriads and the fiery law: *he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2). The writer to the Hebrews names the unapproachable mount: *the mount that might be touched, and that burned with fire* (Hebrews 12:18), before which even *Moses said, I exceedingly fear and quake* (12:21). And the restored Enoch sees the same coming: *the eternal Elohim (God) will tread upon the earth, (even) on Mount Sinai... from the heaven of heavens* (1 Enoch 1:4); *the high mountains shall be shaken... And shall melt like wax before the flame* (1:6, cf. 68:2); *He cometh with ten thousands of His set-apart ones* (1:9). The thousands of angels of the psalm are the heavenly chariotry that attended the giving of the fiery law; Enoch''s set-apart ones who come with him are another company — the seed of promise, gathered and coming with him into the land (Zechariah 14:5).'
 WHERE slug='psalm-68-the-earth-shook-even-sinai-itself';
UPDATE cross_reference_threads SET summary_md = E'Yahuah (LORD) sets the prophet down *in the midst of the valley which was full of bones* (37:1), *and, lo, they were very dry* (37:2), and asks the question the whole framework hangs on: *Son of Adam, can these bones live? And I answered, O Yahuah (Lord) GOD, thou knowest* (37:3). The answer is the word and the Ruach (Spirit): *Prophesy upon these bones... Behold, I will cause breath to enter into you, and ye shall live* (37:4-5). As the prophet speaks there is *a noise, and behold a shaking, and the bones came together, bone to his bone* (37:7), sinew and flesh and skin come up — *but there was no breath in them* (37:8). Then the second word: *Prophesy unto the wind... Thus saith Adonai Yahuah (the Lord GOD); Come from the four winds, O breath, and breathe upon these slain, that they may live* (37:9), *and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (37:10). This is the first resurrection — *I will open your graves... and bring you into the land of Yashar''el (Israel)* (37:12). John borrows its words as a pattern for another raising, the great resurrection after the reign: *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). And at the last the Formed Son''s own voice raises all the dead: *the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth* (John 5:28-29). The same Ruach is the agent of every resurrection: *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). And Isaiah sang it before Ezekiel saw it: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust* (Isaiah 26:19). Can these bones live? The breath from the four winds — the Spirit of life from Elohim — says yes.'
 WHERE slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live';
UPDATE cross_reference_threads SET summary_md = E'*A cloud received him out of their sight* (Acts 1:9), and two men in white promise *this same Yahusha (Jesus) … shall so come in like manner as ye have seen him go* (Acts 1:11). The cloud is the Formed-one''s own chariot. Daniel saw the same figure on the same clouds — *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13) — the kaph honoring the incarnation: he resembled mortal-man because he took on flesh, while remaining the cloud-rider brought before the Ancient of days to receive the everlasting kingdom. The Revelation names the manner of the return: *behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7). And Zechariah names the place: they watched him go from the mount of Olives (Acts 1:12), and *his feet shall stand in that day upon the mount of Olives* (Zechariah 14:4) — he ascended from Olivet and to Olivet he returns. The Hebrew library already named the coming the angels promise: *behold! He cometh with ten thousands of His set-apart ones, to execute judgement upon all* (1 Enoch 1:9) — the same coming Jude quoted. The One taken up in a cloud returns on the clouds; the set-apart ones who come with him are the seed of promise, gathered to him.'
 WHERE slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds';
UPDATE cross_reference_threads SET summary_md = E'The moment Peter confesses him, Yahusha (Jesus) tells them what the Messiah''s road is: *the Son of Adam must suffer many things, and be rejected of the elders, and of the chief priests, and scribes, and be killed, and after three days rise again* (Mark 8:31). Peter rebukes him for it, and is answered hard: *Get thee behind me, Satan: for thou savourest not the things that be of Elohim (God), but the things that be of men* (8:33). The *must* is not Peter''s to overturn. It was written.\n\nIt was written in Isaiah. *He is despised and rejected of men; a man of sorrows, and acquainted with grief* (Isaiah 53:3) — the rejection by elders and priests is the servant-song unfolding. And the suffering has a purpose Peter cannot yet see: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). To refuse the cross is to refuse the healing.\n\nThen he turns to the crowd: *whosoever will save his life shall lose it... For what shall it profit a man, if he shall gain the whole world, and lose his own soul? Or what shall a man give in exchange for his soul?* (Mark 8:35-37). Psalm 49 had already shut that account: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him: (For the redemption of their soul is precious, and it ceaseth for ever:)* (Psalm 49:7-8). No man can buy back a soul. Only the Son of Adam, poured out, pays what no brother can.\n\nAnd suffering is not the end of him. *Whosoever therefore shall be ashamed of me and of my words... of him also shall the Son of Adam be ashamed, when he cometh in the glory of his Father with the holy angels* (Mark 8:38). Daniel saw that glory given: *one like the Son of Adam came with the clouds of heaven... and there was given him dominion, and glory, and a kingdom* (Daniel 7:13-14) — the *kaph* preserved, he comes in the likeness, and the glory is GIVEN him by the Father. Zechariah saw the coming itself: *and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5) — the day of Yahuah; the angels attend the King, and the saints with him are the seed of promise gathered to him. The One named before creation is the One who suffers and the One who comes in glory: *at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits* (1 Enoch 48:2). First the stripes of Isaiah 53, then the clouds of Daniel 7 — one Formed Son, one road, suffering then glory.'
 WHERE slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14';
UPDATE cross_reference_threads SET summary_md = E'*If any man will come after me, let him deny himself, and take up his cross, and follow me* (16:24) — *whosoever will lose his life for my sake shall find it* (16:25). The same call stands in Luke with the whole walk in view: *let him deny himself, and take up his cross daily, and follow me* (Luke 9:23). And *what shall a man give in exchange for his soul?* (16:26) — the psalm long ago answered that no gain of the world can buy a soul back: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7), *(For the redemption of their soul is precious, and it ceaseth for ever:)* (Psalm 49:8). Then comes the day of reckoning: *the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works* (16:27). That rendering is the Father''s own settled measure — *he that pondereth the heart consider it?... and shall not he render to every man according to his works?* (Proverbs 24:12). And the glory-coming is Daniel''s very vision — *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13): one LIKE the Son of Adam, in the likeness, the comparative kept, the figure not flattened — *and there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* (Daniel 7:14): a kingdom GIVEN him by the Ancient of days, the glory of his Father received from the Father''s hand. The library''s own seer saw him seated to judge — *This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7). And he comes not alone: *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5) — *with his angels* (16:27), and with the saints, the seed of promise gathered to him; the Son of Adam *coming in his kingdom* (16:28).'
 WHERE slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7';
UPDATE cross_reference_threads SET summary_md = E'When Enoch presses the angel to show him the might of the monsters, the answer addresses him by title: *And he said to me: ''Thou son of Adam, herein thou dost seek to know what is hidden''* (1 Enoch 60:10) — and the chapter has just named his own translation: *east of the garden where the elect and righteous dwell, where my great-grandfather was taken up, the seventh from Adam, the first man whom Yahuah (God) of Spirits created* (1 Enoch 60:8). That taking-up is the canon''s own terse witness: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and Jude names him by the same generation: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14) — not the angelic host that quaked before the throne in 60:1, but the seed of promise gathered and coming with him (Zechariah 14:5). Here "son of Adam" falls on Enoch the man, mortal-man seeking hidden things; it is the same title that, in the Parables proper, is borne by the Elect One beside the Head of Days. Daniel keeps the kaph — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13): Daniel sees one *like* the Son of Adam, resembling mortal-man because the Formed Son took on flesh; Enoch''s Parables name that same enthroned One outright. The title''s plain creaturely sense here (Enoch, born of Adam) and its exalted sense there are not to be flattened together.'
 WHERE slug='1-enoch-60-son-of-adam-enoch-taken-up';

-- ===== new cards (C: Revelation 11:12 -> John 3:13; E: 1 Thessalonians 4:17 -> Ascension of Isaiah 4:17, 9:9) =====
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'. Idempotent.
WITH input(src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',11,12, 'canon','john',3,13, 'free', E'*And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* (John 3:13). Until this voice, no man but the Son of Adam had gone up to heaven. Here, after the reign and the little season, the raised witnesses hear *Come up hither. And they ascended up to heaven in a cloud* (Revelation 11:12) — the first time the scriptures show his people going up to heaven, the catching-up Paul named: *caught up together with them in the clouds* (1 Thessalonians 4:17).'),
  ('canon','1-thessalonians',4,17, 'ascension-isaiah','ascension-isaiah',4,17, 'extras', E'*And afterwards they will turn themselves upward in their garments, and their body will be left in the world.* (Ascension of Isaiah 4:17). Isaiah''s *afterwards* keeps the order Paul keeps: *Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahusha (Lord) in the air* (1 Thessalonians 4:17). The going up comes after the reign and the little season, when the voice says *Come up hither* and *they ascended up to heaven in a cloud* (Revelation 11:12). They turn upward in their garments, and the body is left in the world — as it is written, *it is appointed unto men once to die, but after this the judgment* (Hebrews 9:27).'),
  ('canon','1-thessalonians',4,17, 'ascension-isaiah','ascension-isaiah',9,9, 'extras', E'*And there I saw Enoch and all who were with him, stript of the garments of the flesh, and I saw them in their garments of the upper world, and they were like angels, standing there in great glory.* (Ascension of Isaiah 9:9). Those on high are seen *stript of the garments of the flesh* and clothed *in their garments of the upper world* — the garments of 4:17, where the saints *turn themselves upward in their garments, and their body will be left in the world.* So the catching-up Paul names — *caught up together with them in the clouds, to meet Yahusha (Lord) in the air: and so shall we ever be with Yahusha (Lord)* (1 Thessalonians 4:17) — is a going up out of the garments of the flesh into the garments of the upper world, after the reign.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s440_lu sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s440_lu tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== F. Ascension of Isaiah verse text, in place (verses.id unchanged) =====
CREATE TEMP TABLE _s440_verses (ch INT, vn INT, txt TEXT, PRIMARY KEY (ch, vn)) ON COMMIT DROP;
INSERT INTO _s440_verses (ch, vn, txt) VALUES
    (3, 15, E'And the descent of the angel of the assembly (Charles: "the Christian Church"), which is in the heavens, whom He will summon in the last days.'),
    (4, 14, E'And after three hundred and thirty-two days (Charles inserts "one thousand" here: "after one thousand three hundred and thirty-two days"; the Ethiopic reads three hundred and thirty-two) Yahuah (Lord) will come with His angels and with the armies of the holy ones from the seventh heaven with the glory of the seventh heaven, and He will drag Beliar into Gehenna and also his armies.'),
    (4, 15, E'And He will give rest of the godly whom He shall find in the body in this world, and the sun will be ashamed (Charles brackets this as a later addition; it is in every Ethiopic manuscript):');

UPDATE verses v
   SET text = s.txt
  FROM _s440_verses s, chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = s.ch AND v.verse_number = s.vn
   AND c.book_id = b.id    AND b.slug = 'ascension-isaiah'
   AND b.edition_id = e.id AND e.slug = 'ascension-isaiah'
   AND v.text IS DISTINCT FROM s.txt;

-- search_vocabulary: add any new lexemes (additive only; skipped if the table does not exist)
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v
              JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number IN (3, 4)
              JOIN books    b ON b.id = c.book_id    AND b.slug = 'ascension-isaiah'
              JOIN editions e ON e.id = b.edition_id AND e.slug = 'ascension-isaiah'
        $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END
$vocab$;

-- ===== verify =====
DO $verify$
DECLARE wrong INT; nnew INT;
BEGIN
    SELECT count(*) INTO wrong
      FROM _s440_verses s
     WHERE NOT EXISTS (
        SELECT 1 FROM verses v
          JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = s.ch
          JOIN books    b ON b.id = c.book_id    AND b.slug = 'ascension-isaiah'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'ascension-isaiah'
         WHERE v.verse_number = s.vn AND v.text = s.txt);
    IF wrong <> 0 THEN
        RAISE EXCEPTION 'S440: % Ascension of Isaiah verse(s) missing or not updated', wrong;
    END IF;
    SELECT count(*) INTO nnew
      FROM cross_references x, _s440_lu sv, _s440_lu tv
     WHERE x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
       AND ((sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=12 AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13)
         OR (sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17 AND tv.edition_slug='ascension-isaiah' AND tv.chapter_number=4 AND tv.verse_number=17)
         OR (sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17 AND tv.edition_slug='ascension-isaiah' AND tv.chapter_number=9 AND tv.verse_number=9));
    RAISE NOTICE 'S440: Ascension of Isaiah 3:15, 4:14, 4:15 updated; % of 3 new cards present', nnew;
END
$verify$;

-- ===== G. schema_version bump (apps purge caches) =====
UPDATE schema_version
   SET version   = '1.0.0-phase4-session440',
       landed_at = now(),
       notes     = 'Session 440 (2026-10-03) — order-of-the-end open questions settled by Yoshi: Matthew 25 sheep and goats = post-harvest sifting of the gathered (thread retitled); saints/holy ones of Zechariah 14:5, Jude 14, 1 Enoch 1:9 = the seed of promise; Ezekiel 37 = first resurrection, Revelation 11:11 borrows its words; Ascension of Isaiah 4:16 cautionary note; new cards Revelation 11:12 -> John 3:13 and 1 Thessalonians 4:17 -> Ascension of Isaiah 4:17, 9:9; Ascension of Isaiah 3:15, 4:14, 4:15 restored to the Ethiopic. Prior version: 1.0.0-phase4-session439.'
 WHERE id = 1;

COMMIT;
SELECT * FROM schema_version;
\echo 'session440 complete.'
