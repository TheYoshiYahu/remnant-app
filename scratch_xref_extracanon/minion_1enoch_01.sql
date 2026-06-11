-- ----- fragment: minion_1enoch_01.sql (session250 1-enoch 1) -----
-- Source anchor: enoch/1-enoch ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en01 (view _session250_en01_lookup). Sort band base 50000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-1-sinai-theophany
  ('enoch', '1-enoch', 1, 4, 'canon', 'deuteronomy', 33, 2, 'free', E'Deuteronomy 33:2 — *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* Moses'' blessing fixes Enoch''s Sinai-coming to the giving of the fiery law, so the One who treads upon Sinai comes to uphold His covenant, not to cancel it.'),
  ('enoch', '1-enoch', 1, 3, 'canon', 'micah', 1, 3, 'free', E'Micah 1:3 — *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* Micah echoes Enoch almost word for word: the Holy Great One comes forth from His dwelling and treads upon the earth.'),
  ('enoch', '1-enoch', 1, 4, 'canon', 'isaiah', 64, 1, 'free', E'Isaiah 64:1 — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence,* Isaiah prays for the very descent Enoch foresees — the Eternal Elohim coming down in the strength of His might from the heaven of heavens.'),
  ('enoch', '1-enoch', 1, 4, 'jubilees', 'jubilees', 1, 2, 'extras', E'Jubilees 1:2 — *And Moses went up into the mount of Elohim (God), and the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days.* Jubilees plants the same glory on the same mountain, confirming that Enoch''s theophany and Israel''s Sinai are one event seen twice.'),
  -- thread: 1-enoch-1-mountains-melt-like-wax
  ('enoch', '1-enoch', 1, 6, 'canon', 'micah', 1, 4, 'free', E'Micah 1:4 — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* Micah''s mountains melting as wax before the fire is Enoch 1:6 verbatim in image, sealing the shared theophany tradition.'),
  ('enoch', '1-enoch', 1, 6, 'canon', 'isaiah', 64, 2, 'free', E'Isaiah 64:2 — *As when the melting fire burneth, the fire causeth the waters to boil, to make thy name known to thine adversaries, that the nations may tremble at thy presence!* Isaiah''s melting fire that makes the nations tremble matches the fear and trembling that seize the earth in Enoch 1:5-6.'),
  ('enoch', '1-enoch', 1, 6, 'canon', 'psalms', 50, 3, 'free', E'Psalm 50:3 — *Our Elohim (God) shall come, and shall not keep silence: a fire shall devour before him, and it shall be very tempestuous round about him.* The devouring fire and tempest before the coming Elohim are the same flame that melts Enoch''s mountains.'),
  -- thread: 1-enoch-1-cometh-with-ten-thousands
  ('enoch', '1-enoch', 1, 9, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude quotes Enoch 1:9 by name, putting this book''s prophecy directly into the apostolic witness.'),
  ('enoch', '1-enoch', 1, 9, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* Jude completes the quotation, matching Enoch''s judgement upon all and the hard things ungodly sinners have spoken against Him almost word for word.'),
  ('enoch', '1-enoch', 1, 9, 'canon', 'zechariah', 14, 5, 'free', E'Zechariah 14:5 — *And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* Zechariah''s Day of Yahuah, when He comes with all the saints, is the same coming-with-the-set-apart-ones Enoch announces.'),
  ('enoch', '1-enoch', 1, 9, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names Himself the Son of Adam coming with His holy ones to judge — the very title and scene 1 Enoch gives the Elect One who proceeds from the Head of Days.'),
  ('enoch', '1-enoch', 1, 9, 'canon', 'revelation', 1, 7, 'free', E'Revelation 1:7 — *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* John''s ''Behold, he cometh'' answers Enoch''s ''And behold! He cometh,'' closing the canon on the prophecy Enoch opened.'),
  -- thread: 1-enoch-1-elect-and-righteous-spared
  ('enoch', '1-enoch', 1, 8, 'apocrypha', 'the-wisdom-of-solomon', 3, 9, 'extras', E'The Wisdom of Solomon 3:9 — *They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* Wisdom''s ''grace and mercy is to his saints... his elect'' is exactly Enoch''s mercy upon the protected elect, a people held before judgement.'),
  ('enoch', '1-enoch', 1, 1, 'canon', 'isaiah', 26, 20, 'free', E'Isaiah 26:20 — *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast.* Isaiah hides the chosen people through the wrath, the same sparing of the elect in the day of tribulation that Enoch''s blessing secures.'),
  ('enoch', '1-enoch', 1, 8, 'canon', 'deuteronomy', 33, 3, 'free', E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* Moses sets the saints in Yahuah''s hand at Sinai — the same belonging-to-Elohim that Enoch promises the protected elect.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-1-sinai-theophany',
       E'He treads upon Sinai — the same coming the Torah and the prophets saw',
       E'Enoch opens with a theophany already engraved in the Torah: *And the eternal Elohim (God) will tread upon the earth, (even) on Mount Sinai, [And appear from His camp] And appear in the strength of His might from the heaven of heavens.* (1 Enoch 1:4). This is not a new revelation — Moses sang it as his parting blessing: *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* (Deuteronomy 33:2) — the very Sinai, the very ten-thousands, the very fiery law that Enoch''s coming One brings, so the judgement vindicates the covenant rather than abolishing it. The prophets carried the same picture forward: *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* (Micah 1:3), and Isaiah''s longing, *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence,* (Isaiah 64:1). And Jubilees sets the same glory on the same mountain: *And Moses went up into the mount of Elohim (God), and the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days.* (Jubilees 1:2). It ain''t new — Enoch saw the coming Yahuah of Sinai before Moses ascended it.',
       sv.verse_id, ev.verse_id, 'extras', 50000
  FROM _session250_en01_lookup sv, _session250_en01_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-1-mountains-melt-like-wax',
       E'The high mountains melt like wax before the flame',
       E'When the Eternal appears, creation itself gives way: *And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame* (1 Enoch 1:6). The prophets use the identical figure — Micah saw it of the same descent: *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* (Micah 1:4); Isaiah pleaded for it: *As when the melting fire burneth, the fire causeth the waters to boil, to make thy name known to thine adversaries, that the nations may tremble at thy presence!* (Isaiah 64:2); and the Psalmist proclaimed the consuming approach: *Our Elohim (God) shall come, and shall not keep silence: a fire shall devour before him, and it shall be very tempestuous round about him.* (Psalm 50:3). One image, three witnesses, and Enoch among them — the wax-before-the-flame is the canon''s own shorthand for the Day, not a stray Enochic invention.',
       sv.verse_id, ev.verse_id, 'extras', 50003
  FROM _session250_en01_lookup sv, _session250_en01_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-1-cometh-with-ten-thousands',
       E'He cometh with ten thousands of His set-apart ones — quoted in Jude',
       E'The chapter''s climax is the verse Jude lifts straight into the New Testament: *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly...* (1 Enoch 1:9). Jude names Enoch and quotes him outright: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* (Jude 1:14), continuing, *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* (Jude 1:15) — proof on the page that the apostles read Enoch as prophecy. The same coming-with-the-holy-ones runs through Moses'' *he came with ten thousands of saints* (Deuteronomy 33:2) and Zechariah''s *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). And the One who comes is the named Son of Adam: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31) — Yahusha takes the very title 1 Enoch gives the Elect One, the Formed Son who proceeds from the Head of Days. Revelation seals the picture: *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* (Revelation 1:7). It ain''t new — Enoch preached the Second Coming, and the whole canon answered Amen.',
       sv.verse_id, ev.verse_id, 'extras', 50006
  FROM _session250_en01_lookup sv, _session250_en01_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-1-elect-and-righteous-spared',
       E'The blessing of the elect — peace and mercy for the chosen before the Day',
       E'Enoch''s whole oracle is framed for one people, named before the storm: *The words of the blessing of Enoch, wherewith he blessed the elect and righteous, who will be living in the day of tribulation, when all the wicked and godless are to be removed.* (1 Enoch 1:1). In the day He treads the earth, *with the righteous He will make peace. And will protect the elect, And mercy shall be upon them. And they shall all belong to Elohim (God)...* (1 Enoch 1:8) — election precedes the tribulation, not confession after it; the elect are a people already in His hand. Wisdom names the same elect under the same care: *They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* (The Wisdom of Solomon 3:9). Isaiah is told to hide that people through the indignation: *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast.* (Isaiah 26:20). And Moses already held that people in the divine hand at Sinai: *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* (Deuteronomy 33:3). It ain''t new — the protected, chosen, Torah-keeping remnant of Enoch 1 is the same elect Israel the Torah and the prophets guard.',
       sv.verse_id, ev.verse_id, 'extras', 50009
  FROM _session250_en01_lookup sv, _session250_en01_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-1-sinai-theophany
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:2 — *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* Moses'' blessing fixes Enoch''s Sinai-coming to the giving of the fiery law, so the One who treads upon Sinai comes to uphold His covenant, not to cancel it.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-sinai-theophany'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 1:3 — *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* Micah echoes Enoch almost word for word: the Holy Great One comes forth from His dwelling and treads upon the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-sinai-theophany'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 64:1 — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence,* Isaiah prays for the very descent Enoch foresees — the Eternal Elohim coming down in the strength of His might from the heaven of heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-sinai-theophany'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:2 — *And Moses went up into the mount of Elohim (God), and the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days.* Jubilees plants the same glory on the same mountain, confirming that Enoch''s theophany and Israel''s Sinai are one event seen twice.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-sinai-theophany'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-1-mountains-melt-like-wax
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 1:4 — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* Micah''s mountains melting as wax before the fire is Enoch 1:6 verbatim in image, sealing the shared theophany tradition.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-mountains-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 64:2 — *As when the melting fire burneth, the fire causeth the waters to boil, to make thy name known to thine adversaries, that the nations may tremble at thy presence!* Isaiah''s melting fire that makes the nations tremble matches the fear and trembling that seize the earth in Enoch 1:5-6.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-mountains-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 50:3 — *Our Elohim (God) shall come, and shall not keep silence: a fire shall devour before him, and it shall be very tempestuous round about him.* The devouring fire and tempest before the coming Elohim are the same flame that melts Enoch''s mountains.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-mountains-melt-like-wax'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-1-cometh-with-ten-thousands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude quotes Enoch 1:9 by name, putting this book''s prophecy directly into the apostolic witness.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* Jude completes the quotation, matching Enoch''s judgement upon all and the hard things ungodly sinners have spoken against Him almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 14:5 — *And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* Zechariah''s Day of Yahuah, when He comes with all the saints, is the same coming-with-the-set-apart-ones Enoch announces.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names Himself the Son of Adam coming with His holy ones to judge — the very title and scene 1 Enoch gives the Elect One who proceeds from the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 1:7 — *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* John''s ''Behold, he cometh'' answers Enoch''s ''And behold! He cometh,'' closing the canon on the prophecy Enoch opened.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-1-elect-and-righteous-spared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'The Wisdom of Solomon 3:9 — *They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* Wisdom''s ''grace and mercy is to his saints... his elect'' is exactly Enoch''s mercy upon the protected elect, a people held before judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-elect-and-righteous-spared'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 26:20 — *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast.* Isaiah hides the chosen people through the wrath, the same sparing of the elect in the day of tribulation that Enoch''s blessing secures.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-elect-and-righteous-spared'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* Moses sets the saints in Yahuah''s hand at Sinai — the same belonging-to-Elohim that Enoch promises the protected elect.'
  FROM cross_reference_threads t, cross_references x, _session250_en01_lookup sv, _session250_en01_lookup tv
 WHERE t.slug='1-enoch-1-elect-and-righteous-spared'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

