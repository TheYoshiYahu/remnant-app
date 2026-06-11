-- ----- fragment: minion_1enoch_52.sql (session250 1-enoch 52) -----
-- Source anchor: enoch/1-enoch ch52. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en52 (view _session250_en52_lookup). Sort band base 51275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-52-metals-melt-like-wax
  ('enoch', '1-enoch', 52, 2, 'canon', 'daniel', 2, 35, 'free', E'Daniel 2:35 — *Then was the iron, the clay, the brass, the silver, and the gold, broken to pieces together, and became like the chaff of the summer threshingfloors; and the wind carried them away, that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth.* Daniel''s image is built of the very metals Enoch names as mountains, and both are broken before the kingdom that fills the earth.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'daniel', 2, 44, 'free', E'Daniel 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* The Elect One before whose feet the metals melt is the everlasting stone-kingdom that consumes the kingdoms of metal.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'micah', 1, 4, 'free', E'Micah 1:4 — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* Micah''s mountains melting like wax and running like poured waters is Enoch''s exact image of the metal mountains dissolving before the Elect One.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'psalms', 97, 5, 'free', E'Psalm 97:5 — *The hills melted like wax at the presence of Yahuah (LORD), at the presence of Yahuah (Lord) of the whole earth.* The hills melting like wax at Yahuah''s presence is the same theophany Enoch sees worked through the Elect One before whom the metals go powerless.'),
  -- thread: 1-enoch-52-not-by-might
  ('enoch', '1-enoch', 52, 3, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The metals going powerless before the Elect One''s feet enacts Zechariah''s word: the kingdom comes not by might or power but by the Spirit.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'zechariah', 4, 7, 'free', E'Zechariah 4:7 — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain: and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it.* Enoch''s metal mountains melting to powerlessness is Zechariah''s great mountain leveled to a plain before the chosen one.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Elect One unmakes the powers not by force but by His word, exactly as Isaiah''s Branch slays the wicked with the breath of His lips.'),
  -- thread: 1-enoch-52-stone-kingdom-without-hands
  ('enoch', '1-enoch', 52, 3, 'canon', 'daniel', 2, 34, 'free', E'Daniel 2:34 — *Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces.* The stone cut without hands that smites the metal image is Daniel''s form of the Elect One before whose feet Enoch''s metal mountains become powerless.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'daniel', 2, 45, 'free', E'Daniel 2:45 — *Forasmuch as thou sawest that the stone was cut out of the mountain without hands, and that it brake in pieces the iron, the brass, the clay, the silver, and the gold; the great Elohim (God) hath made known to the king what shall come to pass hereafter: and the dream is certain, and the interpretation thereof sure.* The stone breaking iron, brass, clay, silver, and gold is the same dissolution of empire''s metals that Enoch shows before the Elect One.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel beholds one LIKE the Son of Adam (the kaph: he resembles mortal-man having taken on flesh) coming to the Ancient of days, while 1 Enoch names that same Elect One before whom the metal kingdoms melt.'),
  ('enoch', '1-enoch', 52, 3, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The everlasting indestructible kingdom given to the Son of Adam is the stone-kingdom that outlasts the metal mountains Enoch sees go powerless.'),
  -- thread: 1-enoch-52-valley-of-the-elect
  ('enoch', '1-enoch', 52, 6, 'canon', 'zechariah', 4, 7, 'free', E'Zechariah 4:7 — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain: and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it.* The mountains made into a deep, wide, smooth valley to hold the elect is Zechariah''s great mountain flattened to a plain before the chosen one.'),
  ('enoch', '1-enoch', 52, 4, 'enoch', '1-enoch', 53, 1, 'extras', E'1 Enoch 53:1 — *There mine eyes saw a deep valley with open mouths, And all who dwell on the dry ground and the sea and the islands shall bring gifts and offerings and acknowledgments to Him.* The very next vision shows the same deep valley, now open-mouthed for judgment, the continuation of the leveled mountains of chapter 52.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-52-metals-melt-like-wax',
       E'The six mountains of metal melt before the Elect One',
       E'Enoch is borne west and shown the secret things of heaven that shall be: *There mine eyes saw all the secret things of heaven that shall be, a mountain of iron, and a mountain of copper, and a mountain of silver, and a mountain of gold, and a mountain of soft metal, and a mountain of lead.* (1 Enoch 52:2). These are no mere ores but the metals of empire — and *all these things shall be in the presence of the Elect One As wax before the fire, And as the water which comes down from above upon those mountains, And they shall become powerless before his feet.* (1 Enoch 52:3). The same metals stand in Nebuchadnezzar''s image, and the same fate overtakes them: *Then was the iron, the clay, the brass, the silver, and the gold, broken to pieces together, and became like the chaff of the summer threshingfloors; and the wind carried them away, that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth.* (Daniel 2:35). The mountains-of-metal that melt are Daniel''s kingdoms of metal that shatter; the Elect One before whom they go powerless is the stone-kingdom that stands forever — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). Enoch tells you the melting; the prophets tell you the cause — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* (Micah 1:4), and *The hills melted like wax at the presence of Yahuah (LORD), at the presence of Yahuah (Lord) of the whole earth.* (Psalm 97:5). No power of empire, no weight of gold or iron, stands by might before the Formed Son.',
       sv.verse_id, ev.verse_id, 'extras', 51275
  FROM _session250_en52_lookup sv, _session250_en52_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=52 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-52-not-by-might',
       E'Not by might — the great mountain becomes a plain',
       E'When the metals *shall become powerless before his feet* (1 Enoch 52:3), Enoch declares the central principle of the Elect One''s reign: the kingdoms of force do not avail. Zechariah names the same law to Zerubbabel — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6) — and then watches the mountain itself flatten: *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain: and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it.* (Zechariah 4:7). Enoch''s mountains of metal melting to powerlessness are Zechariah''s great mountain becoming a plain. And the One who does it judges not by armies but by the breath of His mouth — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). The Elect One is the Formed Son on whom the Spirit rests; the metal of empire is undone not by counter-force but by His presence.',
       sv.verse_id, ev.verse_id, 'extras', 51278
  FROM _session250_en52_lookup sv, _session250_en52_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=52 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-52-stone-kingdom-without-hands',
       E'The stone cut without hands — the kingdom that does not avail by metal',
       E'The angel interprets the vision for Enoch: the secret of the metals is that no earthly substance shall avail in the day of the Elect One. Daniel had already been told the same secret with the same stone: *Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces.* (Daniel 2:34), and then *the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35). The interpretation seals it — *Forasmuch as thou sawest that the stone was cut out of the mountain without hands, and that it brake in pieces the iron, the brass, the clay, the silver, and the gold; the great Elohim (God) hath made known to the king what shall come to pass hereafter: and the dream is certain, and the interpretation thereof sure.* (Daniel 2:45). What Daniel sees as a stone-not-cut-by-hands breaking the metals, Enoch sees as the Elect One before whom the same metals melt. The kingdom that stands is the One given everlasting dominion — and Daniel sees him *like* a mortal-man while Enoch names him: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). Keep the kaph: Daniel beholds *one like the Son of Adam* — he resembles mortal-man because the Formed Son took on flesh — while 1 Enoch names that same Elect One outright. To him *was given dominion, and glory, and a kingdom* (Daniel 7:14), the stone-kingdom that the metals of empire cannot outlast.',
       sv.verse_id, ev.verse_id, 'extras', 51281
  FROM _session250_en52_lookup sv, _session250_en52_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=52 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-52-valley-of-the-elect',
       E'The mountains made a valley — the place of the elect',
       E'After the metals melt, the vision turns to ground made level: *And in that place mine eyes saw how they made these mountains into a deep valley, And the valley was very deep, wide and smooth.* (1 Enoch 52:4), *And then that valley shall be filled with their elect and beloved, And the days of their lives shall be at an end, And the days of their leading astray shall not thenceforward be reckoned.* (1 Enoch 52:6). The mountains of empire are pulled down precisely to make room for His elect — the days of being led astray are no longer reckoned, election standing over the people. The leveling answers Zechariah''s word that the great mountain becomes a plain — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain: and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it.* (Zechariah 4:7) — and the next chapter shows the same valley as the bottomless receptacle of judgment for the mighty: *There mine eyes saw a deep valley with open mouths, And all who dwell on the dry ground and the sea and the islands shall bring gifts and offerings and acknowledgments to Him.* (1 Enoch 53:1). One valley, two faces: filled with the beloved here, never-filled with the doom of the kings there.',
       sv.verse_id, ev.verse_id, 'extras', 51284
  FROM _session250_en52_lookup sv, _session250_en52_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=52 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-52-metals-melt-like-wax
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:35 — *Then was the iron, the clay, the brass, the silver, and the gold, broken to pieces together, and became like the chaff of the summer threshingfloors; and the wind carried them away, that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth.* Daniel''s image is built of the very metals Enoch names as mountains, and both are broken before the kingdom that fills the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-metals-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* The Elect One before whose feet the metals melt is the everlasting stone-kingdom that consumes the kingdoms of metal.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-metals-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Micah 1:4 — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* Micah''s mountains melting like wax and running like poured waters is Enoch''s exact image of the metal mountains dissolving before the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-metals-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 97:5 — *The hills melted like wax at the presence of Yahuah (LORD), at the presence of Yahuah (Lord) of the whole earth.* The hills melting like wax at Yahuah''s presence is the same theophany Enoch sees worked through the Elect One before whom the metals go powerless.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-metals-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=97 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-52-not-by-might
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The metals going powerless before the Elect One''s feet enacts Zechariah''s word: the kingdom comes not by might or power but by the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-not-by-might'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:7 — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain: and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it.* Enoch''s metal mountains melting to powerlessness is Zechariah''s great mountain leveled to a plain before the chosen one.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-not-by-might'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Elect One unmakes the powers not by force but by His word, exactly as Isaiah''s Branch slays the wicked with the breath of His lips.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-not-by-might'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-52-stone-kingdom-without-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:34 — *Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces.* The stone cut without hands that smites the metal image is Daniel''s form of the Elect One before whose feet Enoch''s metal mountains become powerless.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-stone-kingdom-without-hands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:45 — *Forasmuch as thou sawest that the stone was cut out of the mountain without hands, and that it brake in pieces the iron, the brass, the clay, the silver, and the gold; the great Elohim (God) hath made known to the king what shall come to pass hereafter: and the dream is certain, and the interpretation thereof sure.* The stone breaking iron, brass, clay, silver, and gold is the same dissolution of empire''s metals that Enoch shows before the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-stone-kingdom-without-hands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel beholds one LIKE the Son of Adam (the kaph: he resembles mortal-man having taken on flesh) coming to the Ancient of days, while 1 Enoch names that same Elect One before whom the metal kingdoms melt.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-stone-kingdom-without-hands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The everlasting indestructible kingdom given to the Son of Adam is the stone-kingdom that outlasts the metal mountains Enoch sees go powerless.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-stone-kingdom-without-hands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-52-valley-of-the-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 4:7 — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain: and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it.* The mountains made into a deep, wide, smooth valley to hold the elect is Zechariah''s great mountain flattened to a plain before the chosen one.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-valley-of-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 53:1 — *There mine eyes saw a deep valley with open mouths, And all who dwell on the dry ground and the sea and the islands shall bring gifts and offerings and acknowledgments to Him.* The very next vision shows the same deep valley, now open-mouthed for judgment, the continuation of the leveled mountains of chapter 52.'
  FROM cross_reference_threads t, cross_references x, _session250_en52_lookup sv, _session250_en52_lookup tv
 WHERE t.slug='1-enoch-52-valley-of-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=52 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=53 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

