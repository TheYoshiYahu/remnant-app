-- ----- fragment: minion_2esdras_13.sql (session253 2-esdras 13) -----
-- Source anchor: apocrypha/2-esdras ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd13 (view _session253_2esd13_lookup). Sort band base 63300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-13-man-from-the-sea-with-the-clouds
  ('apocrypha', '2-esdras', 13, 3, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Ezra''s Man waxing strong with the thousands of heaven is Daniel''s Son of Adam coming with the clouds, before whom all things tremble.'),
  ('apocrypha', '2-esdras', 13, 32, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* When the Son is declared as the man ascending, the everlasting kingdom Daniel saw given to the Son of Adam is his.'),
  ('apocrypha', '2-esdras', 13, 26, 'canon', 'psalms', 2, 7, 'free', E'Psalms 2:7 — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The One whom the Highest has kept a great season to deliver his creature is the begotten Son of the decree.'),
  -- thread: 2-esdras-13-breath-of-his-mouth-slays-the-wicked
  ('apocrypha', '2-esdras', 13, 10, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The blast of fire and flaming breath from the Man''s mouth is Isaiah''s Branch slaying the wicked with the breath of his lips.'),
  ('apocrypha', '2-esdras', 13, 38, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming.* The Son destroying the wicked without labour by the law like fire is the Lord consuming the Wicked with the spirit of his mouth.'),
  ('apocrypha', '2-esdras', 13, 9, 'canon', 'revelation', 19, 15, 'free', E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The Man who holds no instrument of war is John''s rider whose sword proceeds from his mouth to smite the nations.'),
  -- thread: 2-esdras-13-mount-zion-built-without-hands
  ('apocrypha', '2-esdras', 13, 35, 'canon', 'psalms', 2, 6, 'free', E'Psalms 2:6 — *Yet have I set my king upon my holy hill of Zion.* The Son standing on the top of mount Sion is the King the Father sets upon his holy hill.'),
  ('apocrypha', '2-esdras', 13, 36, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* Zion shewed to all men, prepared and builded without hands, is where John''s innumerable multitude stands before the Lamb.'),
  -- thread: 2-esdras-13-ten-tribes-arzareth-two-house-gathering
  ('apocrypha', '2-esdras', 13, 47, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The ten tribes carried beyond the river and now beginning to come are the remnant Yahuah recovers a second time from Assyria.'),
  ('apocrypha', '2-esdras', 13, 47, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The peaceable multitude returning with peace is the outcasts of Israel and the dispersed of Judah assembled from the four corners.'),
  ('apocrypha', '2-esdras', 13, 40, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* The ten tribes led captive by Assyria are the divided kingdom Ezekiel sees made one nation under one king.'),
  ('apocrypha', '2-esdras', 13, 39, 'canon', 'hosea', 1, 11, 'free', E'Hosea 1:11 — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* The peaceable multitude gathered to the Son is Judah and Israel gathered together under one head.'),
  ('apocrypha', '2-esdras', 13, 47, 'canon', 'jeremiah', 31, 8, 'free', E'Jeremiah 31:8 — *Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame, the woman with child and her that travaileth with child together: a great company shall return thither.* The Highest staying the stream so the tribes may pass through is the great company Yahuah brings home from the north country.'),
  -- thread: 2-esdras-13-remnant-defended-israel-not-cast-away
  ('apocrypha', '2-esdras', 13, 49, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The Son defending his people that remain is Paul''s witness that Elohim has not cast away his people.'),
  ('apocrypha', '2-esdras', 13, 48, 'canon', 'hosea', 1, 10, 'free', E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* Those found within his borders, defended in that day, are the once-disowned reclaimed as sons of the living Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-man-from-the-sea-with-the-clouds',
       E'The Man from the sea, coming with the clouds',
       E'Ezra sees the likeness of a Man rise from the deep and ride the heavens: *And, lo, there arose a wind from the sea, that it moved all the waves thereof* (2 Esdras 13:2), and *I beheld, and, lo, that man waxed strong with the thousands of heaven: and when he turned his countenance to look, all the things trembled that were seen under him* (2 Esdras 13:3). The angel names him plainly — *then shall my Son be declared, whom you sawest as a man ascending* (2 Esdras 13:32). This is no allegory of a nation; 4 Ezra''s own messianism beholds the Son of Adam Daniel saw: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). And to him the everlasting kingdom is given — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The Father has long kept him hidden, to be revealed in his time: *The same is he whom Yahuah (God) the Highest has kept a great season, which by his own self shall deliver his creature: and he shall order them that are left behind* (2 Esdras 13:26) — *Thou art my Son; this day have I begotten thee* (Psalms 2:7). Come and see: the Man from the sea is Yahusha, the Son of Adam coming with the clouds.',
       sv.verse_id, ev.verse_id, 'extras', 63300
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-breath-of-his-mouth-slays-the-wicked',
       E'No sword, but the breath of his mouth',
       E'The gathered armies of the nations storm the Man to subdue him, yet he lifts no weapon: *as he saw the violence of the multitude that came, he neither lifted up his hand, nor held sword, nor any instrument of war* (2 Esdras 13:9), *But only I saw that he sent out of his mouth as it had been a blast of fire, and out of his lips a flaming breath, and out of his tongue he cast out sparks and tempests* (2 Esdras 13:10). The angel reads it as judgment by the word — *he shall destroy them without labour by the law which is like to fire* (2 Esdras 13:38). This is the Branch of Jesse who needs no army: *with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). Paul saw the same Wicked undone — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). And John saw the rider whose only weapon is the word — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15). Come and see: the system of man is not broken by man''s sword but by the breath of his mouth.',
       sv.verse_id, ev.verse_id, 'extras', 63303
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-mount-zion-built-without-hands',
       E'Standing on Zion, the hill graven without hands',
       E'The Man flies up to a mountain he himself has graved — *he had graved himself a great mountain, and flew up upon it* (2 Esdras 13:6) — and the angel sets the Son there in the last day: *But he shall stand upon the top of the mount Sion. And Sion shall come, and shall be shewed to all men, being prepared and builded, like as you sawest the hill graven without hands* (2 Esdras 13:35-36). This is the King set on the holy hill, the inheritance promised to the Son — *Yet have I set my king upon my holy hill of Zion* (Psalms 2:6). John saw the Lamb stand on that very mount with the firstfruits, and the gathered host that no man could number standing before the throne — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands* (Revelation 7:9). Come and see: the hill built without hands is Zion prepared from before, where the Son gathers his own.',
       sv.verse_id, ev.verse_id, 'extras', 63306
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-ten-tribes-arzareth-two-house-gathering',
       E'The ten tribes of Arzareth and the two-house gathering',
       E'The peaceable multitude the Son gathers are named: *Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40) — into the far country *called Arsareth* (2 Esdras 13:45), kept until *the latter time; and now when they shall begin to come, The Highest shall stay the springs of the stream again, that they may go through* (2 Esdras 13:46-47). This is not a new people supplanting the old; it is the lost house of Israel coming home. Isaiah named the day — *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria* (Isaiah 11:11), and *shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). Ezekiel saw the two sticks made one — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:22). Hosea saw both houses under one head — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). And Jeremiah saw the Shepherd lead them home — *Behold, I will bring them from the north country, and gather them from the coasts of the earth... a great company shall return thither* (Jeremiah 31:8). Come and see: Arzareth''s return is the regathering of the whole house — Israel is not cast away (Romans 11:1).',
       sv.verse_id, ev.verse_id, 'extras', 63309
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-remnant-defended-israel-not-cast-away',
       E'He defends the remnant that remain',
       E'When the Son consumes the warring nations, he does not abolish his people but shelters them: *Now when he destroys the multitude of the nations that are gathered together, he shall defend his people that remain* (2 Esdras 13:49). The ones kept are *they that are found within my borders* (2 Esdras 13:48) — the faithful remnant, not a replacement. Paul guards exactly this: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The unfaithful generation forfeits, but election precedes confession, and even those once Lo-ammi are reclaimed — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea... in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Come and see: the day of deliverance defends the remnant of both houses; Israel is never cast away.',
       sv.verse_id, ev.verse_id, 'extras', 63312
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-13-man-from-the-sea-with-the-clouds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Ezra''s Man waxing strong with the thousands of heaven is Daniel''s Son of Adam coming with the clouds, before whom all things tremble.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-man-from-the-sea-with-the-clouds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* When the Son is declared as the man ascending, the everlasting kingdom Daniel saw given to the Son of Adam is his.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-man-from-the-sea-with-the-clouds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 2:7 — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The One whom the Highest has kept a great season to deliver his creature is the begotten Son of the decree.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-man-from-the-sea-with-the-clouds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-breath-of-his-mouth-slays-the-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The blast of fire and flaming breath from the Man''s mouth is Isaiah''s Branch slaying the wicked with the breath of his lips.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-breath-of-his-mouth-slays-the-wicked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming.* The Son destroying the wicked without labour by the law like fire is the Lord consuming the Wicked with the spirit of his mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-breath-of-his-mouth-slays-the-wicked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The Man who holds no instrument of war is John''s rider whose sword proceeds from his mouth to smite the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-breath-of-his-mouth-slays-the-wicked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-mount-zion-built-without-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 2:6 — *Yet have I set my king upon my holy hill of Zion.* The Son standing on the top of mount Sion is the King the Father sets upon his holy hill.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-mount-zion-built-without-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* Zion shewed to all men, prepared and builded without hands, is where John''s innumerable multitude stands before the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-mount-zion-built-without-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-ten-tribes-arzareth-two-house-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The ten tribes carried beyond the river and now beginning to come are the remnant Yahuah recovers a second time from Assyria.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The peaceable multitude returning with peace is the outcasts of Israel and the dispersed of Judah assembled from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* The ten tribes led captive by Assyria are the divided kingdom Ezekiel sees made one nation under one king.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 1:11 — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* The peaceable multitude gathered to the Son is Judah and Israel gathered together under one head.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 31:8 — *Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame, the woman with child and her that travaileth with child together: a great company shall return thither.* The Highest staying the stream so the tribes may pass through is the great company Yahuah brings home from the north country.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-remnant-defended-israel-not-cast-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The Son defending his people that remain is Paul''s witness that Elohim has not cast away his people.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-remnant-defended-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* Those found within his borders, defended in that day, are the once-disowned reclaimed as sons of the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-remnant-defended-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

