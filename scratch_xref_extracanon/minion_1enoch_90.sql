-- ----- fragment: minion_1enoch_90.sql (session250 1-enoch 90) -----
-- Source anchor: enoch/1-enoch ch90. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en90 (view _session250_en90_lookup). Sort band base 52225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en90_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-90-the-great-horn-raised
  ('enoch', '1-enoch', 90, 3, 'apocrypha', '1-maccabees', 2, 1, 'extras', E'1 Maccabees 2:1 — *In those days arose Mattathias the son of John, the son of Simeon, a priest of the sons of Joarib, from Jerusalem, and dwelt in Modin.* The great horn that cries aloud to the sheep is read first against the Maccabean priest-line raised up to rally a scattered Israel.'),
  ('enoch', '1-enoch', 90, 1, 'apocrypha', '1-maccabees', 2, 66, 'extras', E'1 Maccabees 2:66 — *As for Judas Maccabeus, he has been mighty and strong, even from his youth up: let him be your captain, and fight the battle of the people.* The horn that grows great and butts the beasts down matches the mighty captain raised to fight the people''s battle.'),
  ('enoch', '1-enoch', 90, 4, 'canon', 'jeremiah', 23, 5, 'free', E'Jeremiah 23:5 — *Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* The Lord of the sheep rejoicing over the horn points beyond the Maccabees to the righteous Branch raised to David.'),
  -- thread: 1-enoch-90-lord-empowers-the-horn
  ('enoch', '1-enoch', 90, 7, 'canon', 'ezekiel', 34, 23, 'free', E'Ezekiel 34:23 — *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* The Lord of the sheep empowering the horn is His setting up the one Davidic shepherd over the flock.'),
  ('enoch', '1-enoch', 90, 10, 'canon', 'john', 10, 16, 'free', E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The scattered sheep gathering to the horn is the two-house ingathering into one fold under one shepherd.'),
  ('enoch', '1-enoch', 90, 11, 'canon', 'john', 10, 11, 'free', E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep.* The Lord of the sheep rejoicing over horn and flock together is the good shepherd who lays down his life for his own.'),
  -- thread: 1-enoch-90-books-opened-judgment
  ('enoch', '1-enoch', 90, 12, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Lord of the sheep opening the books is the Ancient of days seated for judgment.'),
  ('enoch', '1-enoch', 90, 12, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Enoch''s opened books of the living and of the sinners are Daniel''s set judgment with the books opened.'),
  ('enoch', '1-enoch', 90, 12, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books of the living opened in Enoch are the book of life at the white-throne judgment.'),
  -- thread: 1-enoch-90-stars-shepherds-judged
  ('enoch', '1-enoch', 90, 16, 'canon', 'jeremiah', 23, 1, 'free', E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* The shepherds who had not fed the sheep, cast into the abyss, are the pastors woed for destroying and scattering the flock.'),
  ('enoch', '1-enoch', 90, 16, 'canon', 'jeremiah', 23, 2, 'free', E'Jeremiah 23:2 — *Therefore thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) against the pastors that feed my people; Ye have scattered my flock, and driven them away, and have not visited them: behold, I will visit upon you the evil of your doings, saith Yahuah (LORD).* The judged shepherds are visited for scattering and not visiting the flock.'),
  ('enoch', '1-enoch', 90, 16, 'canon', 'zechariah', 11, 17, 'free', E'Zechariah 11:17 — *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye: his arm shall be clean dried up, and his right eye shall be utterly darkened.* The faithless shepherds cast into the fiery abyss answer the woe on the idol shepherd who leaves the flock.'),
  ('enoch', '1-enoch', 90, 15, 'canon', 'revelation', 20, 10, 'free', E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* The transgressing stars bound and cast into the fiery abyss are the deceiving powers consigned to the lake of fire.'),
  -- thread: 1-enoch-90-new-house-greater
  ('enoch', '1-enoch', 90, 17, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The new house greater and loftier than the first is the holy city, new Jerusalem, coming down from heaven.'),
  ('enoch', '1-enoch', 90, 19, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* The sheep returned to His house is the tabernacle of God dwelling with His people.'),
  ('enoch', '1-enoch', 90, 17, 'canon', 'ezekiel', 37, 26, 'free', E'Ezekiel 37:26 — *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* All the sheep brought into the new house is the everlasting sanctuary set in the midst of the regathered nation.'),
  ('enoch', '1-enoch', 90, 17, 'canon', 'micah', 4, 1, 'free', E'Micah 4:1 — *But in the last days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be established in the top of the mountains, and it shall be exalted above the hills; and people shall flow unto it.* The new house built greater and loftier is the mountain of the house exalted in the last days.'),
  -- thread: 1-enoch-90-eyes-opened-gathering
  ('enoch', '1-enoch', 90, 10, 'canon', 'isaiah', 35, 5, 'free', E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The blinded sheep recovered and gathering to the horn is the promised opening of the eyes of the blind.'),
  ('enoch', '1-enoch', 90, 10, 'canon', 'isaiah', 29, 18, 'free', E'Isaiah 29:18 — *And in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity, and out of darkness.* The sheep''s awakening to the great horn is the day the blind see out of darkness.'),
  ('enoch', '1-enoch', 90, 18, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The gathering of the recovered flock is the regathering of scattered Israel from the heathen into their land.'),
  ('enoch', '1-enoch', 90, 10, 'canon', 'hosea', 1, 11, 'free', E'Hosea 1:11 — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* The sheep gathering to the one horn is the two houses, Judah and Israel, gathered under one head.'),
  -- thread: 1-enoch-90-white-bull-messiah
  ('enoch', '1-enoch', 90, 20, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The great white bull born at the end is the same dominion-bearer Daniel sees as one like the Son of Adam, the Formed One who took on flesh (note the kaph-comparative, like).'),
  ('enoch', '1-enoch', 90, 20, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* All the beasts and birds fearing the white bull and petitioning him is the dominion given to the Son of Adam that all nations should serve.'),
  ('enoch', '1-enoch', 90, 21, 'canon', 'isaiah', 11, 6, 'free', E'Isaiah 11:6 — *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* The transformation of all generations into white bulls is the restored peace where wolf and lamb dwell together.'),
  ('enoch', '1-enoch', 90, 21, 'canon', 'isaiah', 65, 25, 'free', E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* The whole flock made white bulls is the new-creation peace where lion and lamb feed together and none hurt in the holy mountain.'),
  ('enoch', '1-enoch', 90, 20, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The great white bull crowning the seed-line restores the dominion first given to Adam in God''s image.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en90_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en90_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-the-great-horn-raised',
       E'The great horn raised — the deliverer who gathers the scattered sheep',
       E'The vision''s climax opens with the deliverer raised up: *And I saw till that horn grew great, and the Lord of the sheep rejoiced over it, and it began to butt the beasts with its horns, and to cast them down, and to trample upon them.* (1 Enoch 90:1), and *And that great horn cried aloud to the sheep, and the sheep began to gather together to it.* (1 Enoch 90:3). The horn is the Maccabean/Messianic champion through whom the Lord of the sheep rallies the flock — the historical figure first seen in *In those days arose Mattathias the son of John, the son of Simeon, a priest of the sons of Joarib, from Jerusalem, and dwelt in Modin.* (1 Maccabees 2:1) and *As for Judas Maccabeus, he has been mighty and strong, even from his youth up: let him be your captain, and fight the battle of the people.* (1 Maccabees 2:66) — yet the horn that *gathers* the sheep reaches past the Maccabees to the promised Branch: *Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* (Jeremiah 23:5). Israel is the flock, the beasts the oppressing nations; the horn does not replace the sheep but recovers them for the Lord who owns them.',
       sv.verse_id, ev.verse_id, 'extras', 52225
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-lord-empowers-the-horn',
       E'The Lord of the sheep empowers the horn — David my servant, the one shepherd',
       E'When the beasts and birds tear the scattered sheep and the Lord is silent (90:5-6), He then acts: *And the Lord of the sheep called that great horn, and it came to Him, and He gave it power to cast down the beasts and the birds.* (1 Enoch 90:7), so that *the sheep gathered together to that great horn, and they began to rejoice.* (1 Enoch 90:10). This is the Lord setting His own appointed shepherd over the flock — *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* (Ezekiel 34:23) — the one shepherd who gathers the divided houses into a single flock: *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16), the very voice who *giveth his life for the sheep* — *I am the good shepherd: the good shepherd giveth his life for the sheep.* (John 10:11). The horn has no power of its own; the Lord of the sheep gives it — the Formed One ordered under the Father, sent to recover His scattered people, never a new flock supplanting the old.',
       sv.verse_id, ev.verse_id, 'extras', 52228
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-books-opened-judgment',
       E'The books of the living opened — the thrones, the books, the fiery abyss',
       E'The judgement-seat is set: *And after that I saw in the vision that the Lord of the sheep opened the books of the living, and the books of the sinners were opened.* (1 Enoch 90:12), and *And the Lord of the sheep took the staff of His wrath, and cast it upon the earth, and the earth began to quake.* (1 Enoch 90:13). This is Daniel''s throne-room exactly: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9) and *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). John sees the same opened books at the last assize: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). Enoch''s *books of the living* are the canon''s book of life — election written before the deeds are judged.',
       sv.verse_id, ev.verse_id, 'extras', 52231
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-stars-shepherds-judged',
       E'The fallen stars and the seventy shepherds judged — the false shepherds reckoned',
       E'The oppressors are thrown down in order — first the nations, then the Watchers, then the faithless overseers: *And the stars which had transgressed were bound and cast into the same abyss.* (1 Enoch 90:15), and *And the shepherds (corrupt leaders) who had not fed the sheep were judged, and cast into the same fiery abyss with the beasts.* (1 Enoch 90:16). The transgressing stars are the Watchers bound for judgement; the shepherds are the appointed-but-faithless overseers of the exile who destroyed more than they were charged to — the false shepherds the prophets indict: *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* (Jeremiah 23:1) and *Therefore thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) against the pastors that feed my people; Ye have scattered my flock, and driven them away, and have not visited them: behold, I will visit upon you the evil of your doings, saith Yahuah (LORD).* (Jeremiah 23:2), and the worthless shepherd of Zechariah: *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye: his arm shall be clean dried up, and his right eye shall be utterly darkened.* (Zechariah 11:17). The shepherds are systems of misrule judged — not the sheep, who are gathered.',
       sv.verse_id, ev.verse_id, 'extras', 52234
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=14
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-new-house-greater',
       E'The new house, greater and loftier — the New Jerusalem, the mountain of the house',
       E'The old house is folded up and a greater one raised, and the whole flock brought home: *And a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house.* (1 Enoch 90:17), and *And the Lord of the sheep rejoiced with great joy because they were all good and had returned to His house.* (1 Enoch 90:19). This is the New Jerusalem descending and the tabernacle dwelling with the gathered people: *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:2) and *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* (Revelation 21:3); the house exalted in the last days: *But in the last days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be established in the top of the mountains, and it shall be exalted above the hills; and people shall flow unto it.* (Micah 4:1). And the Lord sets His sanctuary in their midst for ever — the two houses made one nation: *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* (Ezekiel 37:26). The new house is not a church replacing Israel; it is the regathered twelve tribes brought home to the everlasting sanctuary.',
       sv.verse_id, ev.verse_id, 'extras', 52237
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=17
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-eyes-opened-gathering',
       E'The eyes opened, the sheep gathered — the awakening of the scattered houses',
       E'Through the long vision the sheep had been blinded and scattered to the beasts; now the flock is recovered and rejoices: *And the sheep gathered together to that great horn, and they began to rejoice.* (1 Enoch 90:10), and all the nations come and fear the Lord of the sheep: *And I saw till all the beasts and the birds and the wild animals were gathered, and they all feared the Lord of the sheep, and they began to praise Him.* (1 Enoch 90:18). The opened eyes and the recovered flock are the prophets'' promised awakening: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5) and *And in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity, and out of darkness.* (Isaiah 29:18). The scattering reverses into the two-house ingathering: *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21), the divided houses appointing one head: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* (Hosea 1:11). This is the awakening and return happening now — never a replacement of Israel.',
       sv.verse_id, ev.verse_id, 'extras', 52240
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-90-white-bull-messiah',
       E'The great white bull born — the Messiah and all transformed into white bulls',
       E'The vision ends with the birth of the great white bull and the transformation of the whole flock: *And I saw till a white bull was born, with large horns, and all the beasts of the field and all the birds of the air feared him and made petition to him all the time.* (1 Enoch 90:20), and *And I saw till all their generations were transformed, and they all became white bulls; and the first among them became a lamb, and that lamb became a great animal and had great black horns on its head.* (1 Enoch 90:21). In the allegory the white bull is Adam''s righteous seed-line; this great white bull born at the end is the Messiah, the Formed Son — the one to whom dominion is given, who in flesh resembled mortal man: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13) — note the kaph, *one like the Son of Adam*: Daniel sees a figure resembling mortal-man because the Formed One took on flesh, while Enoch''s bull names that same dominion-bearer to whom *was given dominion, and glory, and a kingdom* (Daniel 7:14). All the generations becoming white bulls is the restored, regathered people made righteous, dwelling where the wolf and the lamb are at peace: *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* (Isaiah 11:6) and *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* (Isaiah 65:25). The white bull is the same Formed Son named elsewhere as the Son of Adam; I do not force the title here, keeping him as the Formed Son the figure plainly is.',
       sv.verse_id, ev.verse_id, 'extras', 52243
  FROM _session250_en90_lookup sv, _session250_en90_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=20
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=90 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-90-the-great-horn-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 2:1 — *In those days arose Mattathias the son of John, the son of Simeon, a priest of the sons of Joarib, from Jerusalem, and dwelt in Modin.* The great horn that cries aloud to the sheep is read first against the Maccabean priest-line raised up to rally a scattered Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-the-great-horn-raised'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 2:66 — *As for Judas Maccabeus, he has been mighty and strong, even from his youth up: let him be your captain, and fight the battle of the people.* The horn that grows great and butts the beasts down matches the mighty captain raised to fight the people''s battle.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-the-great-horn-raised'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=66
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 23:5 — *Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* The Lord of the sheep rejoicing over the horn points beyond the Maccabees to the righteous Branch raised to David.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-the-great-horn-raised'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-90-lord-empowers-the-horn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:23 — *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* The Lord of the sheep empowering the horn is His setting up the one Davidic shepherd over the flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-lord-empowers-the-horn'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The scattered sheep gathering to the horn is the two-house ingathering into one fold under one shepherd.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-lord-empowers-the-horn'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep.* The Lord of the sheep rejoicing over horn and flock together is the good shepherd who lays down his life for his own.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-lord-empowers-the-horn'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-90-books-opened-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Lord of the sheep opening the books is the Ancient of days seated for judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-books-opened-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Enoch''s opened books of the living and of the sinners are Daniel''s set judgment with the books opened.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-books-opened-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books of the living opened in Enoch are the book of life at the white-throne judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-books-opened-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-90-stars-shepherds-judged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* The shepherds who had not fed the sheep, cast into the abyss, are the pastors woed for destroying and scattering the flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-stars-shepherds-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:2 — *Therefore thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) against the pastors that feed my people; Ye have scattered my flock, and driven them away, and have not visited them: behold, I will visit upon you the evil of your doings, saith Yahuah (LORD).* The judged shepherds are visited for scattering and not visiting the flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-stars-shepherds-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 11:17 — *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye: his arm shall be clean dried up, and his right eye shall be utterly darkened.* The faithless shepherds cast into the fiery abyss answer the woe on the idol shepherd who leaves the flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-stars-shepherds-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* The transgressing stars bound and cast into the fiery abyss are the deceiving powers consigned to the lake of fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-stars-shepherds-judged'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-90-new-house-greater
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The new house greater and loftier than the first is the holy city, new Jerusalem, coming down from heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-new-house-greater'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* The sheep returned to His house is the tabernacle of God dwelling with His people.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-new-house-greater'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:26 — *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* All the sheep brought into the new house is the everlasting sanctuary set in the midst of the regathered nation.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-new-house-greater'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 4:1 — *But in the last days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be established in the top of the mountains, and it shall be exalted above the hills; and people shall flow unto it.* The new house built greater and loftier is the mountain of the house exalted in the last days.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-new-house-greater'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-90-eyes-opened-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The blinded sheep recovered and gathering to the horn is the promised opening of the eyes of the blind.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-eyes-opened-gathering'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 29:18 — *And in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity, and out of darkness.* The sheep''s awakening to the great horn is the day the blind see out of darkness.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-eyes-opened-gathering'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The gathering of the recovered flock is the regathering of scattered Israel from the heathen into their land.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-eyes-opened-gathering'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 1:11 — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* The sheep gathering to the one horn is the two houses, Judah and Israel, gathered under one head.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-eyes-opened-gathering'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-90-white-bull-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The great white bull born at the end is the same dominion-bearer Daniel sees as one like the Son of Adam, the Formed One who took on flesh (note the kaph-comparative, like).'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* All the beasts and birds fearing the white bull and petitioning him is the dominion given to the Son of Adam that all nations should serve.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:6 — *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* The transformation of all generations into white bulls is the restored peace where wolf and lamb dwell together.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* The whole flock made white bulls is the new-creation peace where lion and lamb feed together and none hurt in the holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The great white bull crowning the seed-line restores the dominion first given to Adam in God''s image.'
  FROM cross_reference_threads t, cross_references x, _session250_en90_lookup sv, _session250_en90_lookup tv
 WHERE t.slug='1-enoch-90-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=90 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

