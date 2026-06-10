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
