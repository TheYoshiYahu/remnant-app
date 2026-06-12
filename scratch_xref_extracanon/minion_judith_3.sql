-- ----- fragment: minion_judith_03.sql (session253 judith 3) -----
-- Source anchor: apocrypha/judith ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt3 (view _session253_jdt3_lookup). Sort band base 60050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-3-call-upon-him-as-god
  ('apocrypha', 'judith', 3, 8, 'canon', 'daniel', 3, 5, 'free', E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The same Babylonian king who fills Judith with the demand for worship is the one who set up the golden image in Daniel.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* The decree that all tongues call upon Nebuchadnezzar as god (Judith 3:8) carries the same death-penalty for refusal that Daniel records.'),
  ('apocrypha', 'judith', 3, 8, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Holofernes'' decree that Nebuchadnezzar alone be called god is the antichrist exalting himself above all that is called Elohim.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'revelation', 13, 8, 'free', E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The aim that all nations worship Nabuchodonosor only (Judith 3:8) is the beast''s universal worship that John foresaw.'),
  -- thread: judith-3-i-will-be-like-the-most-high
  ('apocrypha', 'judith', 3, 8, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The claim that the king alone be called upon as god (Judith 3:8) is Lucifer''s ambition to be like the Most High.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'exodus', 5, 2, 'free', E'Exodus 5:2 — *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go.* Holofernes'' decree to destroy all the gods of the land (Judith 3:8) mirrors Pharaoh''s defiant ignorance of the only true God.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'isaiah', 10, 13, 'free', E'Isaiah 10:13 — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures, and I have put down the inhabitants like a valiant man:* The Assyrian''s self-exalting boast is the same pride driving Nebuchadnezzar''s host to demand worship in Judith 3:8.'),
  -- thread: judith-3-nations-submit
  ('apocrypha', 'judith', 3, 2, 'canon', 'psalms', 2, 2, 'free', E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The nations crying ''we are thy servants'' to Nabuchodonosor (Judith 3:2) are the kings of the earth taking their stand against Yahuah and His anointed.'),
  ('apocrypha', 'judith', 3, 4, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The surrender of cities and inhabitants to the conqueror (Judith 3:4) is the beast''s granted power over every kindred, tongue and nation.'),
  ('apocrypha', 'judith', 3, 1, 'canon', 'psalms', 2, 3, 'free', E'Psalm 2:3 — *Let us break their bands asunder, and cast away their cords from us.* The ambassadors suing for peace and offering total submission (Judith 3:1) belong to the heathen who would cast off Yahuah''s cords for an earthly king.'),
  -- thread: judith-3-cut-down-their-groves
  ('apocrypha', 'judith', 3, 8, 'canon', 'daniel', 6, 7, 'free', E'Daniel 6:7 — *All the presidents of the kingdom, the governors, and the princes, the counsellors, and the captains, have consulted together to establish a royal statute, and to make a firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions.* Holofernes'' decree that worship go to Nebuchadnezzar only (Judith 3:8) is the same statute that forbade petition to any but the king.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'revelation', 14, 9, 'free', E'Revelation 14:9 — *And the third angel followed them, saying with a loud voice, If any man worship the beast and his image, and receive his mark in his forehead, or in his hand,* The coerced worship of Nabuchodonosor in Judith 3:8 ends at the same threshold John names: worship of the beast and its image.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-call-upon-him-as-god',
       E'That all tongues should call upon him as god',
       E'Holofernes tears down the sanctuaries so that the king of Babylon alone may be worshipped: *Yet he did cast down their frontiers, and cut down their groves: for he had decreed to destroy all the gods of the land, that all nations should worship Nabuchodonosor only, and that all tongues and tribes should call upon him as god* (Judith 3:8). This is the antichrist pattern in seed — the kingdom of man demanding the worship owed to Yahuah alone. The same Nebuchadnezzar raised an image and decreed *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5), with the threat: *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* (Daniel 3:6). Paul saw the end of the pattern in the man of sin, *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4), and John saw all the earth bow: *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world* (Revelation 13:8). The tyrant''s claim to deity is never new; it is the serpent''s old lie wearing a crown.',
       sv.verse_id, ev.verse_id, 'extras', 60050
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-i-will-be-like-the-most-high',
       E'I know not Yahuah — the self-deifying tyrant',
       E'The decree to *destroy all the gods of the land, that all nations should worship Nabuchodonosor only* (Judith 3:8) repeats the oldest boast of the kingdom of man — the creature claiming the throne of the Creator. It is Lucifer''s heart laid bare: *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14). It is Pharaoh''s contempt: *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2). And it is Assyria''s swagger, the rod that forgets the hand that wields it: *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures* (Isaiah 10:13). Babylon, Egypt, Assyria, Holofernes — one spirit, one lie, and one God who shares His glory with no man.',
       sv.verse_id, ev.verse_id, 'extras', 60053
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-nations-submit',
       E'Behold, we the servants — the kings of the earth bow to the beast',
       E'The coastland nations lay everything at the tyrant''s feet: *Behold, we the servants of Nabuchodonosor the great king lie before you; use us as shall be good in your sight* (Judith 3:2), surrendering houses, fields, flocks, cities and people alike: *Behold, even our cities and the inhabitants thereof are your servants; come and deal with them as seemeth good to you* (Judith 3:4). They receive the conqueror *with garlands, with dances, and with timbrels* (Judith 3:7) — the world rejoicing under the boot rather than under Yahuah. The Spirit asks why: *Why do the heathen rage, and the people imagine a vain thing?* and answers, *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). John saw the same submission consummated in the beast, *and power was given him over all kindreds, and tongues, and nations* (Revelation 13:7). The nations that worship the kingdom of man have only changed masters; deliverance belongs to Yahuah and to His elect.',
       sv.verse_id, ev.verse_id, 'extras', 60056
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-cut-down-their-groves',
       E'He cut down their groves — the decree against the holy',
       E'*Yet he did cast down their frontiers, and cut down their groves: for he had decreed to destroy all the gods of the land* (Judith 3:8). The tyrant legislates against worship itself, the very pattern Darius was tricked into: a *firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions* (Daniel 6:7). It is the system to be dismantled — the demand that all reverence be channelled to the man on the throne. And John shows where it ends, for the angel warns *If any man worship the beast and his image, and receive his mark in his forehead, or in his hand* (Revelation 14:9), the cup of wrath awaits. To bow to Nebuchadnezzar, to Holofernes, to the beast, is one act; to refuse, with Daniel and the three, is the faith of the saints.',
       sv.verse_id, ev.verse_id, 'extras', 60059
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-3-call-upon-him-as-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The same Babylonian king who fills Judith with the demand for worship is the one who set up the golden image in Daniel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* The decree that all tongues call upon Nebuchadnezzar as god (Judith 3:8) carries the same death-penalty for refusal that Daniel records.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Holofernes'' decree that Nebuchadnezzar alone be called god is the antichrist exalting himself above all that is called Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The aim that all nations worship Nabuchodonosor only (Judith 3:8) is the beast''s universal worship that John foresaw.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-3-i-will-be-like-the-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The claim that the king alone be called upon as god (Judith 3:8) is Lucifer''s ambition to be like the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-i-will-be-like-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 5:2 — *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go.* Holofernes'' decree to destroy all the gods of the land (Judith 3:8) mirrors Pharaoh''s defiant ignorance of the only true God.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-i-will-be-like-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 10:13 — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures, and I have put down the inhabitants like a valiant man:* The Assyrian''s self-exalting boast is the same pride driving Nebuchadnezzar''s host to demand worship in Judith 3:8.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-i-will-be-like-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-3-nations-submit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The nations crying ''we are thy servants'' to Nabuchodonosor (Judith 3:2) are the kings of the earth taking their stand against Yahuah and His anointed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-nations-submit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The surrender of cities and inhabitants to the conqueror (Judith 3:4) is the beast''s granted power over every kindred, tongue and nation.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-nations-submit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 2:3 — *Let us break their bands asunder, and cast away their cords from us.* The ambassadors suing for peace and offering total submission (Judith 3:1) belong to the heathen who would cast off Yahuah''s cords for an earthly king.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-nations-submit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-3-cut-down-their-groves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 6:7 — *All the presidents of the kingdom, the governors, and the princes, the counsellors, and the captains, have consulted together to establish a royal statute, and to make a firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions.* Holofernes'' decree that worship go to Nebuchadnezzar only (Judith 3:8) is the same statute that forbade petition to any but the king.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-cut-down-their-groves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:9 — *And the third angel followed them, saying with a loud voice, If any man worship the beast and his image, and receive his mark in his forehead, or in his hand,* The coerced worship of Nabuchodonosor in Judith 3:8 ends at the same threshold John names: worship of the beast and its image.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-cut-down-their-groves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

