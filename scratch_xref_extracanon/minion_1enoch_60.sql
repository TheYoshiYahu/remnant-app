-- ----- fragment: minion_1enoch_60.sql (session250 1-enoch 60) -----
-- Source anchor: enoch/1-enoch ch60. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en60 (view _session250_en60_lookup). Sort band base 51475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en60_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-60-leviathan-behemoth-divided
  ('enoch', '1-enoch', 60, 8, 'canon', 'job', 40, 15, 'free', E'Job 40:15 — *Behold now behemoth, which I made with thee; he eateth grass as an ox.* The same male land-monster Enoch sets in the wilderness of Dûdâîn is the beast Yahuah names to Job as His own handiwork.'),
  ('enoch', '1-enoch', 60, 8, 'canon', 'job', 40, 19, 'free', E'Job 40:19 — *He is the chief of the ways of Elohim (God): he that made him can make his sword to approach unto him.* Behemoth is a creature under the Creator''s sword, matching Enoch''s monster reserved for the day of parting and judgement.'),
  ('enoch', '1-enoch', 60, 7, 'canon', 'job', 41, 1, 'free', E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The female sea-monster of the abyss in Enoch 60:7 is the very Leviathan Yahuah holds out to Job as beyond all human mastery.'),
  ('enoch', '1-enoch', 60, 7, 'canon', 'psalms', 74, 14, 'free', E'Psalm 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* Enoch''s parting of the monsters "to become food" (60:9) echoes the Psalm where Leviathan is given as meat at Yahuah''s victory.'),
  ('enoch', '1-enoch', 60, 7, 'canon', 'isaiah', 27, 1, 'free', E'Isaiah 27:1 — *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea.* Enoch''s sea-monster is bound for that same day of reckoning when Yahuah slays the dragon of the deep.'),
  ('enoch', '1-enoch', 60, 7, 'apocrypha', '2-esdras', 6, 50, 'extras', E'2 Esdras 6:50 — *And did separate the one from the other: for the seventh part, namely, where the water was gathered together, might not hold them both.* The parallel apocalypse keeps the identical Creation-ordinance of dividing the two monsters, sea from dry land, that Enoch 60:7-8 assumes.'),
  -- thread: 1-enoch-60-head-of-days-throne-of-glory
  ('enoch', '1-enoch', 60, 2, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Enoch''s Head of Days seated on the throne of His glory is Daniel''s Ancient of days — the formless Father enthroned.'),
  ('enoch', '1-enoch', 60, 1, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Daniel numbers the throng exactly as Enoch does — a thousand thousands and ten thousand times ten thousand — the same court convened for judgement.'),
  ('enoch', '1-enoch', 60, 5, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people... and at that time thy people shall be delivered, every one that shall be found written in the book.* The Michael who raises Enoch and unfolds the day of judgement (60:4-6) is Daniel''s great prince who stands up for the elect when the books decide.'),
  -- thread: 1-enoch-60-son-of-adam-enoch-taken-up
  ('enoch', '1-enoch', 60, 8, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The "my great-grandfather was taken up" of Enoch 60:8 is the canon''s own account of Enoch''s translation, the seventh from Adam removed by Elohim.'),
  ('enoch', '1-enoch', 60, 8, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude names Enoch "the seventh from Adam" exactly as 60:8 does, and quotes the very ten-thousands-host that Enoch numbers shaking before the throne in 60:1.'),
  ('enoch', '1-enoch', 60, 10, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph — one *like* the Son of Adam, resembling mortal-man because the Formed Son took on flesh — while the title falls plainly on Enoch the mortal in 60:10; the same words, two senses not to be collapsed.'),
  -- thread: 1-enoch-60-secrets-of-winds-thunder-dew
  ('enoch', '1-enoch', 60, 13, 'enoch', '1-enoch', 41, 3, 'extras', E'1 Enoch 41:3 — *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* Enoch''s earlier vision states 60:13 almost verbatim — the same storehouse-secrets shown twice across the book.'),
  ('enoch', '1-enoch', 60, 14, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* Yahuah''s challenge to Job names the very chamber of hail Enoch is shown in 60:14 — the hidden treasuries of the sky.'),
  ('enoch', '1-enoch', 60, 13, 'canon', 'job', 38, 25, 'free', E'Job 38:25 — *Who hath divided a watercourse for the overflowing of waters, or a way for the lightning of thunder;* the dividing of the lightning-and-thunder paths in 60:13 is Yahuah''s own ordering of the storm in His answer to Job.'),
  ('enoch', '1-enoch', 60, 13, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The Psalm names the wind-treasuries and lightning-for-rain that Enoch sees divided in their closed chambers in 60:13-14.'),
  ('enoch', '1-enoch', 60, 14, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The prophet confesses the same wind-out-of-the-treasuries order that the angel shows Enoch in the closed chambers of 60:14.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en60_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en60_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-60-leviathan-behemoth-divided',
       E'Leviathan and Behemoth — the two monsters parted',
       E'The Book-of-Noah fragment lodged in Enoch''s frame divides the two primal monsters: *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters* (1 Enoch 60:7), and *But the male is named Behemoth, who occupies with his breast a waste wilderness named †Dûdâîn†, east of the garden where the elect and righteous dwell* (1 Enoch 60:8). This is no novelty — it is the canon''s own pair. Yahuah parades Behemoth before Job: *Behold now behemoth, which I made with thee; he eateth grass as an ox* (Job 40:15), *He is the chief of the ways of Elohim (God): he that made him can make his sword to approach unto him* (Job 40:19); and Leviathan: *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* (Job 41:1). The Psalmist sings the same dividing hand — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness* (Psalm 74:14), *There go the ships: there is that leviathan, whom thou hast made to play therein* (Psalm 104:26) — and Isaiah seals the end of the sea-dragon: *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea* (Isaiah 27:1). The apocalyptic apocrypha keeps the very same separation, sea from dry land: *Then did you ordain two living creatures, the one you calledst Enoch, and the other Leviathan; And did separate the one from the other* (2 Esdras 6:49-50). The Creator''s order stands; the monsters are His, parted and held until the day of judgement.',
       sv.verse_id, ev.verse_id, 'extras', 51475
  FROM _session250_en60_lookup sv, _session250_en60_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=60 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-60-head-of-days-throne-of-glory',
       E'The great quaking and the Head of Days on His throne',
       E'The fragment opens in the throne-room with heaven itself shaking: *I saw how a mighty quaking made the heaven of heavens to quake, and the host of the Most High, and the angels, a thousand thousands and ten thousand times ten thousand, were disquieted with a great disquiet* (1 Enoch 60:1), and then *the Head of Days sat on the throne of His glory, and the angels and the righteous stood around Him* (1 Enoch 60:2). This is Daniel''s vision, named: the Head of Days is the formless Father, the Ancient of days — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool* (Daniel 7:9) — and Daniel counts the very host Enoch counts: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). The quaking is the prelude to the judgement Michael explains: *He hath been merciful and long-suffering... And when the day, and the power, and the punishment, and the judgement come, which Yahuah (God) of Spirits hath prepared for those who worship not the righteous law* (1 Enoch 60:5-6) — the day of mercy ending, the covenant for the elect and the inquisition for sinners. Torah stands; the judgement falls on those who deny the righteous law, not on the law itself.',
       sv.verse_id, ev.verse_id, 'extras', 51478
  FROM _session250_en60_lookup sv, _session250_en60_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=60 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-60-son-of-adam-enoch-taken-up',
       E'"Thou son of Adam" — the seventh from Adam taken up',
       E'When Enoch presses the angel to show him the might of the monsters, the answer addresses him by title: *And he said to me: ''Thou son of Adam, herein thou dost seek to know what is hidden''* (1 Enoch 60:10) — and the chapter has just named his own translation: *east of the garden where the elect and righteous dwell, where my great-grandfather was taken up, the seventh from Adam, the first man whom Yahuah (God) of Spirits created* (1 Enoch 60:8). That taking-up is the canon''s own terse witness: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and Jude names him by the same generation: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14) — the very ten-thousands-host that quaked before the throne in 60:1. Here "son of Adam" falls on Enoch the man, mortal-man seeking hidden things; it is the same title that, in the Parables proper, is borne by the Elect One beside the Head of Days. Daniel keeps the kaph — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13): Daniel sees one *like* the Son of Adam, resembling mortal-man because the Formed Son took on flesh; Enoch''s Parables name that same enthroned One outright. The title''s plain creaturely sense here (Enoch, born of Adam) and its exalted sense there are not to be flattened together.',
       sv.verse_id, ev.verse_id, 'extras', 51481
  FROM _session250_en60_lookup sv, _session250_en60_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=60 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-60-secrets-of-winds-thunder-dew',
       E'The secret chambers of the winds, thunder, and dew',
       E'The angel unveils the storehouses of the cosmos: *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth* (1 Enoch 60:13), and *closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds* (1 Enoch 60:14). Enoch himself records this same revelation earlier almost word for word: *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew* (1 Enoch 41:3). The canon keeps these very treasuries: Yahuah challenges Job — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail* (Job 38:22), *Who hath divided a watercourse for the overflowing of waters, or a way for the lightning of thunder* (Job 38:25) — and the Psalmist and prophet name the wind-chambers outright: *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries* (Psalm 135:7); *he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures* (Jeremiah 10:13). The hidden order Enoch is shown is the Creator''s order the whole canon confesses.',
       sv.verse_id, ev.verse_id, 'extras', 51484
  FROM _session250_en60_lookup sv, _session250_en60_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=60 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-60-leviathan-behemoth-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 40:15 — *Behold now behemoth, which I made with thee; he eateth grass as an ox.* The same male land-monster Enoch sets in the wilderness of Dûdâîn is the beast Yahuah names to Job as His own handiwork.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-leviathan-behemoth-divided'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=40 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 40:19 — *He is the chief of the ways of Elohim (God): he that made him can make his sword to approach unto him.* Behemoth is a creature under the Creator''s sword, matching Enoch''s monster reserved for the day of parting and judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-leviathan-behemoth-divided'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=40 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The female sea-monster of the abyss in Enoch 60:7 is the very Leviathan Yahuah holds out to Job as beyond all human mastery.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-leviathan-behemoth-divided'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* Enoch''s parting of the monsters "to become food" (60:9) echoes the Psalm where Leviathan is given as meat at Yahuah''s victory.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-leviathan-behemoth-divided'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 27:1 — *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea.* Enoch''s sea-monster is bound for that same day of reckoning when Yahuah slays the dragon of the deep.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-leviathan-behemoth-divided'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 6:50 — *And did separate the one from the other: for the seventh part, namely, where the water was gathered together, might not hold them both.* The parallel apocalypse keeps the identical Creation-ordinance of dividing the two monsters, sea from dry land, that Enoch 60:7-8 assumes.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-leviathan-behemoth-divided'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=6 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-60-head-of-days-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Enoch''s Head of Days seated on the throne of His glory is Daniel''s Ancient of days — the formless Father enthroned.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-head-of-days-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Daniel numbers the throng exactly as Enoch does — a thousand thousands and ten thousand times ten thousand — the same court convened for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-head-of-days-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people... and at that time thy people shall be delivered, every one that shall be found written in the book.* The Michael who raises Enoch and unfolds the day of judgement (60:4-6) is Daniel''s great prince who stands up for the elect when the books decide.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-head-of-days-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-60-son-of-adam-enoch-taken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The "my great-grandfather was taken up" of Enoch 60:8 is the canon''s own account of Enoch''s translation, the seventh from Adam removed by Elohim.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-son-of-adam-enoch-taken-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude names Enoch "the seventh from Adam" exactly as 60:8 does, and quotes the very ten-thousands-host that Enoch numbers shaking before the throne in 60:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-son-of-adam-enoch-taken-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph — one *like* the Son of Adam, resembling mortal-man because the Formed Son took on flesh — while the title falls plainly on Enoch the mortal in 60:10; the same words, two senses not to be collapsed.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-son-of-adam-enoch-taken-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-60-secrets-of-winds-thunder-dew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 41:3 — *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* Enoch''s earlier vision states 60:13 almost verbatim — the same storehouse-secrets shown twice across the book.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-secrets-of-winds-thunder-dew'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=41 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* Yahuah''s challenge to Job names the very chamber of hail Enoch is shown in 60:14 — the hidden treasuries of the sky.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-secrets-of-winds-thunder-dew'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:25 — *Who hath divided a watercourse for the overflowing of waters, or a way for the lightning of thunder;* the dividing of the lightning-and-thunder paths in 60:13 is Yahuah''s own ordering of the storm in His answer to Job.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-secrets-of-winds-thunder-dew'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The Psalm names the wind-treasuries and lightning-for-rain that Enoch sees divided in their closed chambers in 60:13-14.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-secrets-of-winds-thunder-dew'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The prophet confesses the same wind-out-of-the-treasuries order that the angel shows Enoch in the closed chambers of 60:14.'
  FROM cross_reference_threads t, cross_references x, _session250_en60_lookup sv, _session250_en60_lookup tv
 WHERE t.slug='1-enoch-60-secrets-of-winds-thunder-dew'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=60 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

