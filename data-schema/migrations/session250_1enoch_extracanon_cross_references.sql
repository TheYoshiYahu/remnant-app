-- =====================================================================
-- Session 250 — 1 Enoch FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session250_1enoch_extracanon_cross_references.sql
-- =====================================================================

\echo 'session250 — 1 Enoch cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1enoch_02.sql (session250 1-enoch 2) -----
-- Source anchor: enoch/1-enoch ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en02 (view _session250_en02_lookup). Sort band base 50025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-2-luminaries-appointed-order
  ('enoch', '1-enoch', 2, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries that Enoch watches rising and setting in season are the same fourth-day lights Yahuah appointed for signs and seasons and moedim.'),
  ('enoch', '1-enoch', 2, 1, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* Enoch''s "appointed order" of sun, moon, and stars is exactly the fixed ordinance Jeremiah binds to Yahuah''s name and to the endurance of Yashar''el.'),
  ('enoch', '1-enoch', 2, 1, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The orbits that never change are the Psalmist''s wordless sermon, preaching the Maker to everyone who will "observe."'),
  ('enoch', '1-enoch', 2, 1, 'canon', 'job', 38, 33, 'free', E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* Yahuah''s challenge to Job over the fixed ordinances of heaven is the very lesson Enoch draws — man did not appoint the order he is told to behold.'),
  ('enoch', '1-enoch', 2, 1, 'enoch', '1-enoch', 5, 1, 'extras', E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The same imperative "observe" carries through the exhortation — sky, earth, and tree all rebuke the rebel by their obedience.'),
  -- thread: 1-enoch-2-earth-steadfast-creation-obeys
  ('enoch', '1-enoch', 2, 2, 'canon', 'psalms', 148, 6, 'free', E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* What Enoch calls "how steadfast they are" the Psalmist names a decree that shall not pass — the works of Elohim are fixed by command.'),
  ('enoch', '1-enoch', 2, 2, 'canon', 'jeremiah', 8, 7, 'free', E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* Enoch''s "none of the things upon earth change" becomes Jeremiah''s indictment: creation keeps its appointed times while the covenant people forget theirs.'),
  ('enoch', '1-enoch', 2, 2, 'apocrypha', 'ecclesiasticus', 16, 28, 'extras', E'Sirach 16:28 — *None of them hindereth another, and they shall never disobey his word.* Ben Sira makes Enoch''s point exactly — the works of Elohim keep their ranks and never disobey, which is why their steadfastness testifies against every rebel.'),
  ('enoch', '1-enoch', 2, 2, 'enoch', '1-enoch', 5, 3, 'extras', E'1 Enoch 5:3 — *And behold how the sea and the rivers in like manner accomplish and change not their tasks from His commandments.* Enoch''s own next chapter adds sea and rivers to the unchanging earth, sharpening the exhortation toward the sinners who did change their way.'),
  -- thread: 1-enoch-2-summer-winter-appointed-seasons
  ('enoch', '1-enoch', 2, 3, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Enoch''s "summer and the winter" is Yahuah''s post-Flood oath that the seasons shall not cease — the steadfast order the rest of the book sets against the Watchers'' rebellion.'),
  ('enoch', '1-enoch', 2, 3, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The seasons Enoch tells the reader to behold are appointed by the lights, just as the Psalmist sings of the moon set for the moedim.'),
  ('enoch', '1-enoch', 2, 3, 'canon', 'jeremiah', 5, 24, 'free', E'Jeremiah 5:24 — *Neither say they in their heart, Let us now fear Yahuah Eloheinu (the LORD our God), that giveth rain, both the former and the latter, in his season: he reserveth unto us the appointed weeks of the harvest.* The clouds, dew, and rain that fill Enoch''s earth are Jeremiah''s former and latter rains, given in season by the One whom the people forget to fear.'),
  ('enoch', '1-enoch', 2, 3, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Jubilees spells out what Enoch''s summer and winter imply — the appointed times, feasts, and sabbaths are fixed by the lights, not by men.'),
  ('enoch', '1-enoch', 2, 3, 'apocrypha', 'ecclesiasticus', 43, 6, 'extras', E'Sirach 43:6 — *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* Ben Sira joins Enoch''s seasonal witness: the moon serves in her season as a declaration of times, the calendar God hung in the sky.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-2-luminaries-appointed-order',
       E'The luminaries transgress not their appointed order',
       E'Enoch begins the great exhortation by sending the eye upward: *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1). It ain''t new — this is Genesis 1''s fourth day, where Yahuah set the lights *to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The prophets read the same heavens as a covenant decree: *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35); the Psalmist hears them preach, *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1); and Job is asked, *Knowest thou the ordinances of heaven?* (Job 38:33). Enoch will press the same summons again in the next chapter, *Observe ye how the trees cover themselves with green leaves and bear fruit; wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so* (1 Enoch 5:1). The Watchers transgressed their appointed order; the luminaries never do — the witness against the rebel is the obedient sky.',
       sv.verse_id, ev.verse_id, 'extras', 50025
  FROM _session250_en02_lookup sv, _session250_en02_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-2-earth-steadfast-creation-obeys',
       E'Behold the earth: the works of Elohim change not',
       E'Enoch turns the eye down: *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* (1 Enoch 2:2). The decree that holds them steadfast is the Psalmist''s: *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalm 148:6). Ben Sira says the works keep ranks without rebellion — *None of them hindereth another, and they shall never disobey his word.* (Sirach 16:28) — and the indictment writes itself: the creation never disobeys, but man does. Jeremiah lays the irony bare, *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* (Jeremiah 8:7). Enoch makes the same contrast plain a chapter on, holding up the sea and rivers that *accomplish and change not their tasks from His commandments* (1 Enoch 5:3). Torah stands and the cosmos keeps it — the Watchers'' sin was rebellion against this very order, not a flaw in the order itself.',
       sv.verse_id, ev.verse_id, 'extras', 50028
  FROM _session250_en02_lookup sv, _session250_en02_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-2-summer-winter-appointed-seasons',
       E'Summer and winter: the appointed seasons keep their times',
       E'The exhortation closes on the turning year: *Behold the summer and the winter, how the whole earth is filled with water, and clouds and dew and rain lie upon it.* (1 Enoch 2:3). This is the covenant Yahuah swore after the Flood — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* (Genesis 8:22) — the very judgement Enoch''s book moves toward, yet the seasons it secures roll on undisturbed. The Psalmist ties the rhythm to the lights, *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19), and Jeremiah names the rain that fills the earth as Yahuah''s faithful gift, the One *that giveth rain, both the former and the latter, in his season: he reserveth unto us the appointed weeks of the harvest* (Jeremiah 5:24). The extra-canonical witnesses say the same: the sun and moon were set *for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9), and the moon serves *in her season for a declaration of times, and a sign of the world* (Sirach 43:6). The appointed times are not invented by men or by confession — they are written into the summer and winter, the moedim kept by the lights themselves.',
       sv.verse_id, ev.verse_id, 'extras', 50031
  FROM _session250_en02_lookup sv, _session250_en02_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-2-luminaries-appointed-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries that Enoch watches rising and setting in season are the same fourth-day lights Yahuah appointed for signs and seasons and moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* Enoch''s "appointed order" of sun, moon, and stars is exactly the fixed ordinance Jeremiah binds to Yahuah''s name and to the endurance of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The orbits that never change are the Psalmist''s wordless sermon, preaching the Maker to everyone who will "observe."'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* Yahuah''s challenge to Job over the fixed ordinances of heaven is the very lesson Enoch draws — man did not appoint the order he is told to behold.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The same imperative "observe" carries through the exhortation — sky, earth, and tree all rebuke the rebel by their obedience.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-2-earth-steadfast-creation-obeys
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* What Enoch calls "how steadfast they are" the Psalmist names a decree that shall not pass — the works of Elohim are fixed by command.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* Enoch''s "none of the things upon earth change" becomes Jeremiah''s indictment: creation keeps its appointed times while the covenant people forget theirs.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 16:28 — *None of them hindereth another, and they shall never disobey his word.* Ben Sira makes Enoch''s point exactly — the works of Elohim keep their ranks and never disobey, which is why their steadfastness testifies against every rebel.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 5:3 — *And behold how the sea and the rivers in like manner accomplish and change not their tasks from His commandments.* Enoch''s own next chapter adds sea and rivers to the unchanging earth, sharpening the exhortation toward the sinners who did change their way.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-2-summer-winter-appointed-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Enoch''s "summer and the winter" is Yahuah''s post-Flood oath that the seasons shall not cease — the steadfast order the rest of the book sets against the Watchers'' rebellion.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The seasons Enoch tells the reader to behold are appointed by the lights, just as the Psalmist sings of the moon set for the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 5:24 — *Neither say they in their heart, Let us now fear Yahuah Eloheinu (the LORD our God), that giveth rain, both the former and the latter, in his season: he reserveth unto us the appointed weeks of the harvest.* The clouds, dew, and rain that fill Enoch''s earth are Jeremiah''s former and latter rains, given in season by the One whom the people forget to fear.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Jubilees spells out what Enoch''s summer and winter imply — the appointed times, feasts, and sabbaths are fixed by the lights, not by men.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 43:6 — *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* Ben Sira joins Enoch''s seasonal witness: the moon serves in her season as a declaration of times, the calendar God hung in the sky.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_03.sql (session250 1-enoch 3) -----
-- Source anchor: enoch/1-enoch ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en03 (view _session250_en03_lookup). Sort band base 50050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-3-trees-keep-appointed-seasons
  ('enoch', '1-enoch', 3, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The seasons the trees keep in Enoch 3:1 were ordained at creation, when the lights were set for signs and appointed times.'),
  ('enoch', '1-enoch', 3, 1, 'canon', 'jeremiah', 33, 20, 'free', E'Jeremiah 33:20 — *Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season;* The steadfastness of the winter trees in Enoch 3:1 is Yahuah''s own covenant of the seasons, as sure as His promise to David.'),
  ('enoch', '1-enoch', 3, 1, 'enoch', '1-enoch', 2, 2, 'extras', E'1 Enoch 2:2 — *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* The same call to observe the steadfast order of creation that frames the trees of Enoch 3:1.'),
  ('enoch', '1-enoch', 3, 1, 'enoch', '1-enoch', 5, 1, 'extras', E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The renewal that answers the withered winter trees of Enoch 3:1 — both seasons obey the One who made them so.'),
  -- thread: 1-enoch-3-the-sun-burns-at-his-command
  ('enoch', '1-enoch', 3, 2, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The summer sun of Enoch 3:2 burns within its appointed course, knowing its rising and its setting.'),
  ('enoch', '1-enoch', 3, 2, 'apocrypha', 'ecclesiasticus', 43, 3, 'extras', E'Ecclesiasticus 43:3 — *At noon it parcheth the country, and who can abide the burning heat thereof?* The very heat that drives men to shade and shelter in Enoch 3:2, named by the same sapiential witness.'),
  ('enoch', '1-enoch', 3, 2, 'apocrypha', 'ecclesiasticus', 43, 5, 'extras', E'Ecclesiasticus 43:5 — *Great is Yahuah (God) that made it; and at his commandment runs hastily.* The burning sun of Enoch 3:2 obeys a command — it runs at the bidding of the One who made it.'),
  ('enoch', '1-enoch', 3, 2, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The sun whose heat Enoch observes in 3:2 was appointed to rule the days and mark the moedim.'),
  -- thread: 1-enoch-3-creation-obeys-but-you-have-not
  ('enoch', '1-enoch', 3, 2, 'canon', 'jeremiah', 8, 7, 'free', E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* The same indictment Enoch 3 implies: nature keeps its appointed order while the people forsake the way.'),
  ('enoch', '1-enoch', 3, 1, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The trees and sun of Enoch 3 preach the Creator''s glory wordlessly, as the heavens do here.'),
  ('enoch', '1-enoch', 3, 1, 'enoch', '1-enoch', 2, 1, 'extras', E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* The heavenly witness paired with the earthly trees of Enoch 3 — both transgress not their appointed order.'),
  ('enoch', '1-enoch', 3, 2, 'enoch', '1-enoch', 5, 4, 'extras', E'1 Enoch 5:4 — *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace.* The indictment toward which the steadfast trees and sun of Enoch 3 are building: creation kept the commandments; you did not.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-3-trees-keep-appointed-seasons',
       E'The trees keep their appointed seasons',
       E'Enoch points to the winter forest as a witness that creation obeys the order set for it: *Observe and see how (in the winter) all the trees seem as though they had withered and shed all their leaves, except fourteen trees, which do not lose their foliage but retain the old foliage from two to three years till the new comes.* (1 Enoch 3:1). This is the same lesson he draws from the unchanging luminaries — *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* (1 Enoch 2:2) — and again from the green of returning spring: *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* (1 Enoch 5:1). The order itself was fixed at the beginning, when the lights were appointed for the seasons: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14). Yahuah binds that order to His covenant so firmly that to break the seasons would be to break His faithfulness to David: *Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season;* (Jeremiah 33:20). The Watchers will transgress this Creator''s order; the trees never do.',
       sv.verse_id, ev.verse_id, 'extras', 50050
  FROM _session250_en03_lookup sv, _session250_en03_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-3-the-sun-burns-at-his-command',
       E'The summer sun burns under its appointed dominion',
       E'Enoch turns from winter to the heat of summer, again to show creation under command: *And again, observe the days of summer how the sun is above the earth over against it. And you seek shade and shelter by reason of the heat of the sun, and the earth also is burning with growing heat, and so you cannot tread on the earth, or on a rock by reason of its heat.* (1 Enoch 3:2). The Psalmist sees the same sun ruling its appointed round: *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19). The wisdom of the apocrypha describes that very midday scorching: *At noon it parcheth the country, and who can abide the burning heat thereof?* (Ecclesiasticus 43:3), and confesses Who set it running: *Great is Yahuah (God) that made it; and at his commandment runs hastily.* (Ecclesiasticus 43:5). Jubilees grounds the sun''s dominion in the fourth-day decree, where it is appointed to rule and to mark the feasts: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* (Jubilees 2:9). The sun''s burning is no terror without order — it keeps the law the Creator gave it, the same law the Watchers will abandon.',
       sv.verse_id, ev.verse_id, 'extras', 50053
  FROM _session250_en03_lookup sv, _session250_en03_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-3-creation-obeys-but-you-have-not',
       E'Creation keeps its order — but you have not',
       E'The whole point of the winter trees and the summer sun is an indictment: every part of creation holds to the order given it, so that man''s rebellion stands exposed. Enoch lays the charge bare a chapter later: *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace.* (1 Enoch 5:4). The luminaries he sets beside the trees *transgress not against their appointed order* — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1). The prophet draws the identical contrast from the birds that keep their seasons while the people forsake the way: *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* (Jeremiah 8:7). And the heavens themselves preach this without a word: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1). The trees of Enoch 3 testify that the Creator''s order — His Torah — stands; the judgement to come falls on those who, unlike the trees, would not keep it.',
       sv.verse_id, ev.verse_id, 'extras', 50056
  FROM _session250_en03_lookup sv, _session250_en03_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-3-trees-keep-appointed-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The seasons the trees keep in Enoch 3:1 were ordained at creation, when the lights were set for signs and appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:20 — *Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season;* The steadfastness of the winter trees in Enoch 3:1 is Yahuah''s own covenant of the seasons, as sure as His promise to David.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 2:2 — *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* The same call to observe the steadfast order of creation that frames the trees of Enoch 3:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The renewal that answers the withered winter trees of Enoch 3:1 — both seasons obey the One who made them so.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-3-the-sun-burns-at-his-command
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The summer sun of Enoch 3:2 burns within its appointed course, knowing its rising and its setting.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 43:3 — *At noon it parcheth the country, and who can abide the burning heat thereof?* The very heat that drives men to shade and shelter in Enoch 3:2, named by the same sapiential witness.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 43:5 — *Great is Yahuah (God) that made it; and at his commandment runs hastily.* The burning sun of Enoch 3:2 obeys a command — it runs at the bidding of the One who made it.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The sun whose heat Enoch observes in 3:2 was appointed to rule the days and mark the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-3-creation-obeys-but-you-have-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* The same indictment Enoch 3 implies: nature keeps its appointed order while the people forsake the way.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The trees and sun of Enoch 3 preach the Creator''s glory wordlessly, as the heavens do here.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* The heavenly witness paired with the earthly trees of Enoch 3 — both transgress not their appointed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 5:4 — *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace.* The indictment toward which the steadfast trees and sun of Enoch 3 are building: creation kept the commandments; you did not.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_04.sql (session250 1-enoch 4) -----
-- Source anchor: enoch/1-enoch ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en04 (view _session250_en04_lookup). Sort band base 50075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-4-sun-ordained-course
  ('enoch', '1-enoch', 4, 1, 'canon', 'psalms', 19, 6, 'free', E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The very heat of the sun that Enoch tells you to feel is the wordless witness the psalm names — from its fixed circuit nothing on earth is hid from its heat.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch''s sun standing ''above the earth over against it'' is no accident of nature but an appointed luminary that knows its course, exactly as the psalm declares.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The summer-sun Enoch observes was set in the firmament on the fourth day for signs and seasons — the moedim — so that observing it is reading the Creator''s appointed times.'),
  ('enoch', '1-enoch', 4, 1, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Enoch''s burning summer-sun is the same fourth-day sign that Jubilees binds to the feasts and the calendar — the appointed times stand in the lights themselves.'),
  -- thread: 1-enoch-4-summer-winter-covenant
  ('enoch', '1-enoch', 4, 1, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The unfailing summer-heat Enoch tells you to observe is the standing post-Flood covenant — the seasons return because Yahuah (God) swore they would.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The steadfast heat of Enoch''s summer is the appointed ordinance of heaven on which Yahuah (God) stakes His covenant with the scattered seed of Yashar''el (Israel) — the order man is to heed but does not.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'matthew', 5, 45, 'free', E'Matthew 5:45 — *That ye may be the children of your Father which is in heaven: for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust.* The sun whose heat Enoch makes you feel is the Father''s own daily mercy that Yahusha (Jesus) names — the ordained light witnessing to all alike.'),
  ('enoch', '1-enoch', 4, 1, 'canon', 'acts', 14, 17, 'free', E'Acts 14:17 — *Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.* Enoch''s burning summer is one of the ''fruitful seasons'' Sha''ul calls God''s standing witness — the ordered heat itself testifies of the Creator to every nation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-4-sun-ordained-course',
       E'The Sun in His Ordained Course — Observe and Know His Works',
       E'*And again, observe ye the days of summer how the sun is above the earth over against it. And you seek shade and shelter by reason of the heat of the sun, and the earth also burns with growing heat, and so you cannot tread on the earth, or on a rock by reason of its heat.* (1 Enoch 4:1) The same heat Enoch tells you to feel on your own skin is the witness the Tanakh sings: *In them hath he set a tabernacle for the sun, Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race. His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* (Psalm 19:6) The sun does not wander — *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19) — because Yahuah (God) set it on the fourth day for exactly this: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). 1 Enoch''s own kinsman-book says the same of that fourth-day light: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9). Enoch''s burning summer is not idle weather-watching: it is the appointed luminary keeping the moedim by the Creator''s order, the same Torah-ordered calendar — it ain''t new. The lights were never given to be worshipped, but to keep the times He set; the wise heed them, and through them recognize Him.',
       sv.verse_id, ev.verse_id, 'extras', 50075
  FROM _session250_en04_lookup sv, _session250_en04_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-4-summer-winter-covenant',
       E'Summer and Heat Shall Not Cease — Creation Keeps Its Appointed Order',
       E'Enoch bids you mark the steadfastness of summer''s heat: *And again, observe ye the days of summer how the sun is above the earth over against it. And you seek shade and shelter by reason of the heat of the sun, and the earth also burns with growing heat* (1 Enoch 4:1). That reliable return of heat is itself a covenant kept. After the Flood Yahuah (God) swore: *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22). The ordered turning of the seasons is the very pledge Yahuah (God) names as more sure than His promise to the seed of Yashar''el (Israel): *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — so steadfast a heat and cold that He stakes the regathering of the scattered house on it. The Son who came in flesh, Yahusha (Jesus), points to the same daily mercy: *for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust* (Matthew 5:45); and Sha''ul preaches it to the nations as God''s standing witness: *he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness* (Acts 14:17). Enoch''s point in this whole section is the rebuke that follows: the sun, the seasons, the heat — all keep the appointed order they were given, while man alone breaks the covenant. Creation''s obedience condemns rebellion; the way of the righteous is to keep, as the heavens keep.',
       sv.verse_id, ev.verse_id, 'extras', 50078
  FROM _session250_en04_lookup sv, _session250_en04_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-4-sun-ordained-course
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The very heat of the sun that Enoch tells you to feel is the wordless witness the psalm names — from its fixed circuit nothing on earth is hid from its heat.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch''s sun standing ''above the earth over against it'' is no accident of nature but an appointed luminary that knows its course, exactly as the psalm declares.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The summer-sun Enoch observes was set in the firmament on the fourth day for signs and seasons — the moedim — so that observing it is reading the Creator''s appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Enoch''s burning summer-sun is the same fourth-day sign that Jubilees binds to the feasts and the calendar — the appointed times stand in the lights themselves.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-sun-ordained-course'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-4-summer-winter-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The unfailing summer-heat Enoch tells you to observe is the standing post-Flood covenant — the seasons return because Yahuah (God) swore they would.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The steadfast heat of Enoch''s summer is the appointed ordinance of heaven on which Yahuah (God) stakes His covenant with the scattered seed of Yashar''el (Israel) — the order man is to heed but does not.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:45 — *That ye may be the children of your Father which is in heaven: for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust.* The sun whose heat Enoch makes you feel is the Father''s own daily mercy that Yahusha (Jesus) names — the ordained light witnessing to all alike.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 14:17 — *Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.* Enoch''s burning summer is one of the ''fruitful seasons'' Sha''ul calls God''s standing witness — the ordered heat itself testifies of the Creator to every nation.'
  FROM cross_reference_threads t, cross_references x, _session250_en04_lookup sv, _session250_en04_lookup tv
 WHERE t.slug='1-enoch-4-summer-winter-covenant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=14 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_05.sql (session250 1-enoch 5) -----
-- Source anchor: enoch/1-enoch ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en05 (view _session250_en05_lookup). Sort band base 50100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-5-ordinances-that-change-not
  ('enoch', '1-enoch', 5, 3, 'canon', 'jeremiah', 5, 22, 'free', E'Jeremiah 5:22 — *Fear ye not me? saith Yahuah (LORD): will ye not tremble at my presence, which have placed the sand for the bound of the sea by a perpetual decree, that it cannot pass it: and though the waves thereof toss themselves, yet can they not prevail; though they roar, yet can they not pass over it?* The very sea and rivers that Enoch says change not their tasks are here held up by Yahuah as the bound that cannot pass His decree.'),
  ('enoch', '1-enoch', 5, 2, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* the same unbroken ordering of the works "from year to year for ever" is the surety Yahuah pledges for His covenant with His people.'),
  ('enoch', '1-enoch', 5, 2, 'canon', 'psalms', 148, 6, 'free', E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* Enoch''s "according as Elohim (God) hath ordained so is it done" is this decree that the heavens cannot overstep.'),
  ('enoch', '1-enoch', 5, 1, 'apocrypha', 'ecclesiasticus', 16, 28, 'extras', E'Ecclesiasticus 16:28 — *None of them hindereth another, and they shall never disobey his word.* Sirach makes the obedient creation the exact mirror Enoch holds up: the works never disobey, so the hard-hearted man stands self-condemned.'),
  ('enoch', '1-enoch', 5, 2, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The tasks that "change not" are the appointed times themselves — the lights keep the moedim Yahuah ordained.'),
  -- thread: 1-enoch-5-hard-hearted-find-no-peace
  ('enoch', '1-enoch', 5, 4, 'canon', 'jeremiah', 5, 3, 'free', E'Jeremiah 5:3 — *O Yahuah (LORD), are not thine eyes upon the truth? thou hast stricken them, but they have not grieved; thou hast consumed them, but they have refused to receive correction: they have made their faces harder than a rock; they have refused to return.* Enoch''s "ye hard-hearted" who speak hard words is Jeremiah''s people whose faces are harder than rock.'),
  ('enoch', '1-enoch', 5, 4, 'canon', 'isaiah', 48, 22, 'free', E'Isaiah 48:22 — *There is no peace, saith Yahuah (LORD), unto the wicked.* Enoch''s verdict on the hard-hearted, "ye shall find no peace," is the prophet''s standing sentence on the wicked.'),
  ('enoch', '1-enoch', 5, 4, 'canon', 'isaiah', 57, 21, 'free', E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* The same refrain doubled — the no-peace pronounced over those who turned away from the commandments.'),
  -- thread: 1-enoch-5-elect-granted-light-godless-too-late
  ('enoch', '1-enoch', 5, 7, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The "light shall appear unto them" of the elect is the risen glory called over the regathered people of Yahuah.'),
  ('enoch', '1-enoch', 5, 7, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The peace and light granted to the elect rise as the Sun of righteousness on those who fear His name.'),
  ('enoch', '1-enoch', 5, 6, 'apocrypha', 'the-wisdom-of-solomon', 2, 12, 'extras', E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* These are Enoch''s godless who curse and imprecate by the righteous, plotting against the man whose keeping of the law reproves them.'),
  ('enoch', '1-enoch', 5, 7, 'apocrypha', 'the-wisdom-of-solomon', 5, 6, 'extras', E'Wisdom of Solomon 5:6 — *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* The light that appears unto the elect is the very light the godless confess, too late, never shined on them.'),
  -- thread: 1-enoch-5-he-cometh-with-ten-thousands
  ('enoch', '1-enoch', 5, 8, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* the New Testament names Enoch and quotes this very verse — proof the apparatus is no new thing but canon''s own citation.'),
  ('enoch', '1-enoch', 5, 8, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The convicting of all flesh for ungodly works and hard words is Jude''s near-verbatim echo of Enoch 5:8.'),
  ('enoch', '1-enoch', 5, 8, 'canon', 'deuteronomy', 33, 2, 'free', E'Deuteronomy 33:2 — *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* The Judge who comes with ten thousands is the same who came to Sinai with the fiery law — Torah and judgement issue from one hand.'),
  ('enoch', '1-enoch', 5, 8, 'enoch', '1-enoch', 1, 9, 'extras', E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* Enoch frames his prophecy with this advent twice over, and it is 1:9 that Jude quotes by name.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-5-ordinances-that-change-not',
       E'The Works That Change Not Their Tasks',
       E'Enoch turns the reader to the obedient creation as a witness against the disobedient: *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so* (1 Enoch 5:1), and *all His works go on thus from year to year for ever... but according as Elohim (God) hath ordained so is it done* (1 Enoch 5:2), even the sea and rivers that *accomplish and change not their tasks from His commandments* (1 Enoch 5:3). The Tanakh sets the same fixed decree before us: Yahuah *placed the sand for the bound of the sea by a perpetual decree, that it cannot pass it* (Jeremiah 5:22), and binds His covenant with Yashar''el (Israel) to that same order — *If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25). The Psalm hears the command spoken: *for he commanded, and they were created. He hath also stablished them for ever and ever: he hath made a decree which shall not pass* (Psalm 148:5-6). The extra-canonical witnesses say it plainest of all — *None of them hindereth another, and they shall never disobey his word* (Ecclesiasticus 16:28) — and Jubilees grounds the lights themselves in the appointed times: *Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years* (Jubilees 2:9). Torah stands: the same Creator who fixed the seasons fixed the commandments, and the creation that keeps its order shames the man who will not keep his.',
       sv.verse_id, ev.verse_id, 'extras', 50100
  FROM _session250_en05_lookup sv, _session250_en05_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-5-hard-hearted-find-no-peace',
       E'Hard Words, Hard Hearts, No Peace',
       E'Against the creation that never disobeys, Enoch sets the rebel: *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace* (1 Enoch 5:4). The sin is not weakness but the deliberate breaking of the commandments — the Watchers'' same rebellion against the Creator''s order, now in human mouths. Jeremiah indicts exactly this hardness: *they have made their faces harder than a rock; they have refused to return* (Jeremiah 5:3). And the verdict "ye shall find no peace" is the very sentence the prophets pronounce twice over: *There is no peace, saith Yahuah (LORD), unto the wicked* (Isaiah 48:22) and again *There is no peace, saith my Elohim (God), to the wicked* (Isaiah 57:21). Torah is never the curse here; the curse is for forsaking it. The man who will not do the commandments has cut himself off from the peace the creation keeps.',
       sv.verse_id, ev.verse_id, 'extras', 50103
  FROM _session250_en05_lookup sv, _session250_en05_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-5-elect-granted-light-godless-too-late',
       E'Light for the Elect, the Godless Cursed by Their Own Name',
       E'Enoch divides the two ends. The rebels'' names become *an eternal execration unto all the righteous, and by you shall the godless be cursed* (1 Enoch 5:6), while *to the righteous and holy He will grant peace, and He will protect the elect, and compassion shall be upon them; and they shall all belong to Elohim (God)... and light shall appear unto them, and He will make peace with them* (1 Enoch 5:7). This is election before confession — "the elect" are protected as a people already His, not a class that selects itself. The Tanakh promise of light to the gathered ones answers it: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1), and to those who fear His name *shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). The Wisdom of Solomon dramatizes both halves in one scene — first the godless plotting against the righteous man (*Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings* — Wisdom 2:12), then their late and useless confession when they see his vindication: *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* (Wisdom 5:6). The very light Enoch says appears unto the elect is the light the godless confess, too late, never shined on them.',
       sv.verse_id, ev.verse_id, 'extras', 50106
  FROM _session250_en05_lookup sv, _session250_en05_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-5-he-cometh-with-ten-thousands',
       E'He Cometh With Ten Thousands of His Set-Apart Ones',
       E'Chapter 5 closes on the theophany of judgement: *And behold! He cometh with ten thousands of His set-apart ones to execute judgement upon all, and to destroy all the ungodly: and to convict all flesh of all the works of their ungodliness which they have ungodly committed, and of all the hard things which ungodly sinners have spoken against Him* (1 Enoch 5:8). It Ain''t New — Jude lifts this line almost word for word and names its author: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints, To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him* (Jude 1:14-15). The same coming-with-myriads stands at Sinai in the Torah: *Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2) — the Lawgiver and the Judge are one. And Enoch himself has already spoken this verse once, almost identically: *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all* (1 Enoch 1:9), framing the whole Book of Watchers with the advent of the One who judges the Watchers'' rebellion and all who spoke hard words against Him.',
       sv.verse_id, ev.verse_id, 'extras', 50109
  FROM _session250_en05_lookup sv, _session250_en05_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-5-ordinances-that-change-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 5:22 — *Fear ye not me? saith Yahuah (LORD): will ye not tremble at my presence, which have placed the sand for the bound of the sea by a perpetual decree, that it cannot pass it: and though the waves thereof toss themselves, yet can they not prevail; though they roar, yet can they not pass over it?* The very sea and rivers that Enoch says change not their tasks are here held up by Yahuah as the bound that cannot pass His decree.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-ordinances-that-change-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* the same unbroken ordering of the works "from year to year for ever" is the surety Yahuah pledges for His covenant with His people.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-ordinances-that-change-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* Enoch''s "according as Elohim (God) hath ordained so is it done" is this decree that the heavens cannot overstep.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-ordinances-that-change-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 16:28 — *None of them hindereth another, and they shall never disobey his word.* Sirach makes the obedient creation the exact mirror Enoch holds up: the works never disobey, so the hard-hearted man stands self-condemned.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-ordinances-that-change-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The tasks that "change not" are the appointed times themselves — the lights keep the moedim Yahuah ordained.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-ordinances-that-change-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-5-hard-hearted-find-no-peace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 5:3 — *O Yahuah (LORD), are not thine eyes upon the truth? thou hast stricken them, but they have not grieved; thou hast consumed them, but they have refused to receive correction: they have made their faces harder than a rock; they have refused to return.* Enoch''s "ye hard-hearted" who speak hard words is Jeremiah''s people whose faces are harder than rock.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-hard-hearted-find-no-peace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 48:22 — *There is no peace, saith Yahuah (LORD), unto the wicked.* Enoch''s verdict on the hard-hearted, "ye shall find no peace," is the prophet''s standing sentence on the wicked.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-hard-hearted-find-no-peace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* The same refrain doubled — the no-peace pronounced over those who turned away from the commandments.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-hard-hearted-find-no-peace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-5-elect-granted-light-godless-too-late
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The "light shall appear unto them" of the elect is the risen glory called over the regathered people of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-elect-granted-light-godless-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The peace and light granted to the elect rise as the Sun of righteousness on those who fear His name.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-elect-granted-light-godless-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* These are Enoch''s godless who curse and imprecate by the righteous, plotting against the man whose keeping of the law reproves them.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-elect-granted-light-godless-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:6 — *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* The light that appears unto the elect is the very light the godless confess, too late, never shined on them.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-elect-granted-light-godless-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-5-he-cometh-with-ten-thousands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* the New Testament names Enoch and quotes this very verse — proof the apparatus is no new thing but canon''s own citation.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-he-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The convicting of all flesh for ungodly works and hard words is Jude''s near-verbatim echo of Enoch 5:8.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-he-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 33:2 — *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* The Judge who comes with ten thousands is the same who came to Sinai with the fiery law — Torah and judgement issue from one hand.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-he-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* Enoch frames his prophecy with this advent twice over, and it is 1:9 that Jude quotes by name.'
  FROM cross_reference_threads t, cross_references x, _session250_en05_lookup sv, _session250_en05_lookup tv
 WHERE t.slug='1-enoch-5-he-cometh-with-ten-thousands'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_06.sql (session250 1-enoch 6) -----
-- Source anchor: enoch/1-enoch ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en06 (view _session250_en06_lookup). Sort band base 50125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-6-sons-of-god-daughters-of-men
  ('enoch', '1-enoch', 6, 2, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Moses'' "sons of Elohim" who saw and took are Enoch''s angels who "saw and lusted" at 6:2 — the very same descent.'),
  ('enoch', '1-enoch', 6, 1, 'canon', 'genesis', 6, 1, 'free', E'Genesis 6:1 — *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them,* which is verbatim the setting of Enoch 6:1, "when the children of men had multiplied... were born unto them beautiful and comely daughters."'),
  ('enoch', '1-enoch', 6, 2, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees retells Enoch 6:2 almost word-for-word and names the offspring as giants.'),
  ('enoch', '1-enoch', 6, 2, 'jasher', 'jasher', 4, 18, 'extras', E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher echoes the taking of wives "according to their choice" of Enoch 6:2 and adds the forbidden mixing taught in the aftermath.'),
  ('enoch', '1-enoch', 6, 2, 'enoch', '1-enoch', 7, 1, 'extras', E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The plan announced at 6:2 is carried out here, with the forbidden arts that follow the union.'),
  -- thread: 1-enoch-6-oath-on-hermon-bound-for-judgement
  ('enoch', '1-enoch', 6, 6, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s angels who "left their own habitation" are precisely the heavenly Watchers who descended on Hermon in Enoch 6:6, now reserved for judgement.'),
  ('enoch', '1-enoch', 6, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s "angels that sinned" cast into chains are the descended Watchers of Enoch 6, bound for the great-day judgement.'),
  ('enoch', '1-enoch', 6, 4, 'enoch', '1-enoch', 10, 11, 'extras', E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The oath of 6:4 is answered four chapters later by the command to bind Shemyaza and his fellows.'),
  -- thread: 1-enoch-6-days-of-jared-and-the-giants
  ('enoch', '1-enoch', 6, 6, 'canon', 'genesis', 5, 18, 'free', E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Moses'' Jared is Enoch''s own father, so "the days of Yered (Jared)" in Enoch 6:6 dates the descent to the generation of the seventh from Adam.'),
  ('enoch', '1-enoch', 6, 6, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The descent of the two hundred in Enoch 6:6 is exactly the union Genesis says produced the giants of renown.'),
  ('enoch', '1-enoch', 6, 6, 'canon', 'numbers', 13, 33, 'free', E'Numbers 13:33 — *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* The giant-seed begun by the Watchers'' descent in Enoch 6 reappears in the land as the sons of Anak.'),
  ('enoch', '1-enoch', 6, 6, 'canon', 'matthew', 24, 37, 'free', E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Yahusha makes the days the Watchers corrupted in Enoch 6 the very type of the last days before the Son of Adam comes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-6-sons-of-god-daughters-of-men',
       E'The Watchers take wives — Genesis 6 in long form',
       E'1 Enoch opens the seed-war exactly where Moses set it: *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* (1 Enoch 6:2) is the same descent Genesis records — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2) — and the same that Jubilees retells word-for-word: *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1). Jasher names the mechanism — *their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice* (Jasher 4:18) — and the next chapter of Enoch shows what the union produced and taught: *they taught them charms and enchantments, and the cutting of roots* (1 Enoch 7:1). This is not myth grafted onto Scripture; it is the canon''s own Genesis 6:1-4 unfolded. It ain''t new — the Watchers'' rebellion against the Creator''s order is the root of the tares sown among the wheat.',
       sv.verse_id, ev.verse_id, 'extras', 50125
  FROM _session250_en06_lookup sv, _session250_en06_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-6-oath-on-hermon-bound-for-judgement',
       E'The oath on Hermon and the chains of darkness',
       E'The two hundred bound themselves by an oath before they descended: *Let us all swear an oath, and all bind ourselves by mutual imprecations not to abandon this plan but to do this thing* (1 Enoch 6:4), and they swore upon the summit and *they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it* (1 Enoch 6:6). The New Testament knows this fall precisely and reads it as covenant rebellion against the Creator''s order: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and Peter the same — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Enoch himself records the sentence that answers their oath: *Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them* (1 Enoch 10:11). The Watchers who swore on Hermon are the angels Jude and Peter reserve in chains — Torah''s order stands, and the judgement is for breaking it.',
       sv.verse_id, ev.verse_id, 'extras', 50128
  FROM _session250_en06_lookup sv, _session250_en06_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-6-days-of-jared-and-the-giants',
       E'In the days of Yered — and the giants of renown',
       E'Enoch dates the descent precisely: the two hundred *descended in the days of Yered (Jared) on the summit of Mount Hermon* (1 Enoch 6:6) — and Moses'' genealogy fixes Jared as the father of Enoch himself: *And Jared lived an hundred sixty and two years, and he begat Enoch* (Genesis 5:18), so the seventh from Adam is an eyewitness generation to the fall. What the unions produced is no Enochic invention; Genesis says it plainly: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4), and the giant-seed survives the Flood in Canaan — *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* (Numbers 13:33). Yahusha seals the type for the last days: *But as the days of Noe were, so shall also the coming of the Son of Adam be.* (Matthew 24:37). The dating, the giants, the warning — it ain''t new; the canon carried it the whole way.',
       sv.verse_id, ev.verse_id, 'extras', 50131
  FROM _session250_en06_lookup sv, _session250_en06_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-6-sons-of-god-daughters-of-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Moses'' "sons of Elohim" who saw and took are Enoch''s angels who "saw and lusted" at 6:2 — the very same descent.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:1 — *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them,* which is verbatim the setting of Enoch 6:1, "when the children of men had multiplied... were born unto them beautiful and comely daughters."'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees retells Enoch 6:2 almost word-for-word and names the offspring as giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher echoes the taking of wives "according to their choice" of Enoch 6:2 and adds the forbidden mixing taught in the aftermath.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The plan announced at 6:2 is carried out here, with the forbidden arts that follow the union.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-6-oath-on-hermon-bound-for-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s angels who "left their own habitation" are precisely the heavenly Watchers who descended on Hermon in Enoch 6:6, now reserved for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-oath-on-hermon-bound-for-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s "angels that sinned" cast into chains are the descended Watchers of Enoch 6, bound for the great-day judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-oath-on-hermon-bound-for-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The oath of 6:4 is answered four chapters later by the command to bind Shemyaza and his fellows.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-oath-on-hermon-bound-for-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-6-days-of-jared-and-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Moses'' Jared is Enoch''s own father, so "the days of Yered (Jared)" in Enoch 6:6 dates the descent to the generation of the seventh from Adam.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The descent of the two hundred in Enoch 6:6 is exactly the union Genesis says produced the giants of renown.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 13:33 — *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* The giant-seed begun by the Watchers'' descent in Enoch 6 reappears in the land as the sons of Anak.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Yahusha makes the days the Watchers corrupted in Enoch 6 the very type of the last days before the Son of Adam comes.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_07.sql (session250 1-enoch 7) -----
-- Source anchor: enoch/1-enoch ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en07 (view _session250_en07_lookup). Sort band base 50150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-7-watchers-took-wives
  ('enoch', '1-enoch', 7, 1, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The canon''s own account of the same Watchers taking wives that 1 Enoch 7:1 narrates.'),
  ('enoch', '1-enoch', 7, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' descent of 1 Enoch 7:1 as rebellion against the Creator''s assigned order, reserved for judgment.'),
  ('enoch', '1-enoch', 7, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter carries the same binding of the fallen Watchers whose sin begins in 1 Enoch 7:1.'),
  ('enoch', '1-enoch', 7, 1, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the identical descent and union that opens 1 Enoch 7:1.'),
  ('enoch', '1-enoch', 7, 1, 'jasher', 'jasher', 4, 18, 'extras', E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher remembers both the seizing of wives and the taught, corrupting arts of 1 Enoch 7:1.'),
  -- thread: 1-enoch-7-giants-born
  ('enoch', '1-enoch', 7, 2, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Torah''s own witness to the giants born of the Watchers, exactly as 1 Enoch 7:2.'),
  ('enoch', '1-enoch', 7, 2, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* Jubilees names the giant brood born of the same union 1 Enoch 7:2 records, and their mutual slaughter.'),
  -- thread: 1-enoch-7-devouring-and-blood
  ('enoch', '1-enoch', 7, 4, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood-drinking of 1 Enoch 7:4 is the exact corruption the Creator forbids to the renewed post-flood earth.'),
  ('enoch', '1-enoch', 7, 4, 'canon', 'leviticus', 17, 14, 'free', E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* The Torah''s standing blood statute marks the very line the giants of 1 Enoch 7:4 crossed when they devoured flesh and drank blood.'),
  ('enoch', '1-enoch', 7, 4, 'jubilees', 'jubilees', 7, 24, 'extras', E'Jubilees 7:24 — *And after this they sinned against the beasts and birds, and all that moves and walks on the earth: and much blood was shed on the earth, and every imagination and desire of men imagined vanity and evil continually.* Jubilees records the same sinning against beasts and birds and the much blood shed that 1 Enoch 7:3-4 describes.'),
  -- thread: 1-enoch-7-earth-accuses
  ('enoch', '1-enoch', 7, 5, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The Torah''s verdict on the same generation whose lawlessness makes the earth itself lay accusation in 1 Enoch 7:5.'),
  ('enoch', '1-enoch', 7, 5, 'enoch', '1-enoch', 9, 1, 'extras', E'1 Enoch 9:1 — *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth.* Enoch''s own next chapter answers the earth''s accusation of 7:5 as heaven looks down and sees the bloodshed.'),
  ('enoch', '1-enoch', 7, 5, 'jubilees', 'jubilees', 7, 25, 'extras', E'Jubilees 7:25 — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed in the midst of the earth He destroyed everything.* Jubilees names the shed blood as the very ground of the judgment the earth''s accusation in 1 Enoch 7:5 calls for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-watchers-took-wives',
       E'The Watchers Took Wives and Taught Forbidden Arts',
       E'1 Enoch opens the corruption plainly: *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* (1 Enoch 7:1) It ain''t new — this is the canon''s own Genesis 6: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2) Jubilees tells the same descent — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1) — and Jasher remembers the taught arts and the forced unions, *the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord)* (Jasher 4:18). The New Testament names these same beings and their crime as rebellion against the Creator''s order, not mere weakness: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) The Watchers'' sin is leaving the estate the Creator assigned them and corrupting His order; the Torah and its keepers stand on the other side of that line.',
       sv.verse_id, ev.verse_id, 'extras', 50150
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-giants-born',
       E'And They Bare Great Giants',
       E'From the forbidden union come the giants: *And they became pregnant, and they bare great giants, whose height was three thousand ells.* (1 Enoch 7:2) The Torah records the same offspring of the same union: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4) Jubilees names the brood and their mutual slaughter — *And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* (Jubilees 7:21) This is the head of the seed-war: a counterfeit line sown into the earth alongside Adam''s, which the canon will trace forward to the tares among the wheat. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50153
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-devouring-and-blood',
       E'Devouring Flesh and Drinking Blood',
       E'The giants consume everything, then mankind itself turns predator: *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind. And they began to sin against birds, and beasts, and reptiles, and fish, and to devour one another’s flesh, and drink the blood.* (1 Enoch 7:3-4) Jubilees tells the same cascade of bloodshed against the creatures — *And after this they sinned against the beasts and birds, and all that moves and walks on the earth: and much blood was shed on the earth, and every imagination and desire of men imagined vanity and evil continually.* (Jubilees 7:24) The drinking of blood is the precise thing the Creator forbids to Noah''s renewed earth: *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4) — and the Torah seals it as a standing statute, *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh* (Leviticus 17:14). The Watchers'' world is precisely the order the law later forbids; the law does not curse — it draws the line the giants crossed.',
       sv.verse_id, ev.verse_id, 'extras', 50156
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-earth-accuses',
       E'The Earth Lays Accusation',
       E'The chapter ends with creation itself crying out: *Then the earth laid accusation against the lawless ones.* (1 Enoch 7:5) The very next chapter answers it from heaven — *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth.* (1 Enoch 9:1) The Torah''s own verdict on this generation is the same: *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* (Genesis 6:11) And Jubilees names the bloodshed as the very ground of the Creator''s destroying judgment — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed in the midst of the earth He destroyed everything.* (Jubilees 7:25) The accusation is not arbitrary wrath: it is the covenant order vindicating itself against rebellion.',
       sv.verse_id, ev.verse_id, 'extras', 50159
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-7-watchers-took-wives
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The canon''s own account of the same Watchers taking wives that 1 Enoch 7:1 narrates.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' descent of 1 Enoch 7:1 as rebellion against the Creator''s assigned order, reserved for judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter carries the same binding of the fallen Watchers whose sin begins in 1 Enoch 7:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the identical descent and union that opens 1 Enoch 7:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher remembers both the seizing of wives and the taught, corrupting arts of 1 Enoch 7:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-7-giants-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Torah''s own witness to the giants born of the Watchers, exactly as 1 Enoch 7:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-giants-born'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 7:21 — *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* Jubilees names the giant brood born of the same union 1 Enoch 7:2 records, and their mutual slaughter.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-giants-born'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-7-devouring-and-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood-drinking of 1 Enoch 7:4 is the exact corruption the Creator forbids to the renewed post-flood earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-devouring-and-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* The Torah''s standing blood statute marks the very line the giants of 1 Enoch 7:4 crossed when they devoured flesh and drank blood.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-devouring-and-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:24 — *And after this they sinned against the beasts and birds, and all that moves and walks on the earth: and much blood was shed on the earth, and every imagination and desire of men imagined vanity and evil continually.* Jubilees records the same sinning against beasts and birds and the much blood shed that 1 Enoch 7:3-4 describes.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-devouring-and-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-7-earth-accuses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The Torah''s verdict on the same generation whose lawlessness makes the earth itself lay accusation in 1 Enoch 7:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-earth-accuses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 9:1 — *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth.* Enoch''s own next chapter answers the earth''s accusation of 7:5 as heaven looks down and sees the bloodshed.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-earth-accuses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:25 — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed in the midst of the earth He destroyed everything.* Jubilees names the shed blood as the very ground of the judgment the earth''s accusation in 1 Enoch 7:5 calls for.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-earth-accuses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_08.sql (session250 1-enoch 8) -----
-- Source anchor: enoch/1-enoch ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en08 (view _session250_en08_lookup). Sort band base 50175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-8-azazel-craft-and-adornment
  ('enoch', '1-enoch', 8, 1, 'canon', '2-kings', 9, 30, 'free', E'2 Kings 9:30 — *And when Jehu was come to Jezreel, Jezebel heard of it; and she painted her face, and tired her head, and looked out at a window.* The painting of the face and the beautifying of the eyelids that Azâzêl taught in 1 Enoch 8:1 becomes the mark of the harlot-queen at the window.'),
  ('enoch', '1-enoch', 8, 1, 'canon', 'jeremiah', 4, 30, 'free', E'Jeremiah 4:30 — *And when thou art spoiled, what wilt thou do? Though thou clothest thyself with crimson, though thou deckest thee with ornaments of gold, though thou rentest thy face with painting, in vain shalt thou make thyself fair; thy lovers will despise thee, they will seek thy life.* The ornaments of gold and the painting of the face that the Watcher taught in 1 Enoch 8:1 cannot save the spoiled city.'),
  ('enoch', '1-enoch', 8, 1, 'canon', 'ezekiel', 23, 40, 'free', E'Ezekiel 23:40 — *And furthermore, that ye have sent for men to come from far, unto whom a messenger was sent; and, lo, they came: for whom thou didst wash thyself, paintedst thy eyes, and deckedst thyself with ornaments,* — the painted eyes and the ornaments Azâzêl handed down in 1 Enoch 8:1 are here the dress of covenant-breaking adultery.'),
  ('enoch', '1-enoch', 8, 1, 'apocrypha', 'the-wisdom-of-solomon', 14, 12, 'extras', E'The Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The costly stones and colouring tinctures Azâzêl taught in 1 Enoch 8:1 are the very craft Wisdom names as the beginning of spiritual fornication.'),
  -- thread: 1-enoch-8-forbidden-arts-divination
  ('enoch', '1-enoch', 8, 2, 'canon', 'deuteronomy', 18, 10, 'free', E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* — Torah forbids by name the enchantments and observing-of-times that Semjâzâ and his fellows teach in 1 Enoch 8:2.'),
  ('enoch', '1-enoch', 8, 2, 'canon', 'jeremiah', 10, 2, 'free', E'Jeremiah 10:2 — *Thus saith Yahuah (LORD), Learn not the way of the heathen, and be not dismayed at the signs of heaven; for the heathen are dismayed at them.* The astrology and the signs of the sun and moon that the Watchers teach in 1 Enoch 8:2 are exactly the signs of heaven the prophet warns Yashar''el not to learn.'),
  ('enoch', '1-enoch', 8, 2, 'jubilees', 'jubilees', 8, 3, 'extras', E'Jubilees 8:3 — *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven.* Jubilees traces the very star-lore of 1 Enoch 8:2 to a surviving Watcher-tablet that re-corrupted men after the Flood.'),
  -- thread: 1-enoch-8-watchers-corruption-of-flesh
  ('enoch', '1-enoch', 8, 2, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The much godlessness and corruption of all ways in 1 Enoch 8:2 is the very wickedness Genesis names as the cause of the Flood.'),
  ('enoch', '1-enoch', 8, 2, 'canon', 'genesis', 6, 12, 'free', E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* The becoming-corrupt-in-all-their-ways of 1 Enoch 8:2 is Genesis''s all flesh corrupting its way.'),
  ('enoch', '1-enoch', 8, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries the Watchers of 1 Enoch 8 forward by name — the rebel angels reserved in chains for judgement.'),
  ('enoch', '1-enoch', 8, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter binds the sinning angels of 1 Enoch 8 to their chains of darkness, reserved for the day of judgement.'),
  ('enoch', '1-enoch', 8, 1, 'enoch', '1-enoch', 7, 1, 'extras', E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The teaching of forbidden arts that erupts in 1 Enoch 8:1-2 began in the previous chapter with the Watchers'' defiling descent.'),
  -- thread: 1-enoch-8-cry-went-up-to-heaven
  ('enoch', '1-enoch', 8, 2, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The cry of those perishing that goes up to heaven in 1 Enoch 8:2 is the same cry of innocent blood that the LORD hears from the ground.'),
  ('enoch', '1-enoch', 8, 2, 'canon', 'exodus', 2, 23, 'free', E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The cry going up to heaven in 1 Enoch 8:2 is the same cry of the oppressed that comes up unto Elohim and moves Him to deliver.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-azazel-craft-and-adornment',
       E'Azâzêl''s forbidden craft — weapons, metals, and painted eyes',
       E'Enoch names the first teacher of war and vanity: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* (1 Enoch 8:1). This is no neutral arts-and-crafts; it is rebellion against the Creator''s order — the instruments of bloodshed and the apparatus of seduction handed down together. The Tanakh remembers the painted eye as the harlot''s mark: Jezebel *painted her face, and tired her head, and looked out at a window* (2 Kings 9:30); the prophet rebukes the city that *rentest thy face with painting* (Jeremiah 4:30); and Oholibah for whom men came when *thou didst wash thyself, paintedst thy eyes, and deckedst thyself with ornaments* (Ezekiel 23:40). The Wisdom of Solomon traces the worship of the work of hands back to this same fount, *the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life* (The Wisdom of Solomon 14:12) — the antimony, the costly stones, the colouring tinctures of Enoch 8:1 are the seedbed of that fornication. Torah stands: the abomination is the rebellion, not the metal — the same hands that could have built the tabernacle were taught instead to forge the sword.',
       sv.verse_id, ev.verse_id, 'extras', 50175
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-forbidden-arts-divination',
       E'Enchantments, root-cuttings, and the reading of the heavens',
       E'The roll of the Watchers'' schools is the roll of every forbidden art Torah will later forbid by name: *Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon.* (1 Enoch 8:2). The covenant draws the line straight through this list: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10) — the enchanter and the observer of times are the disciples of Semjâzâ and the star-readers. The prophet sets the sign-reading apart from the fear of the Creator: *Thus saith Yahuah (LORD), Learn not the way of the heathen, and be not dismayed at the signs of heaven; for the heathen are dismayed at them.* (Jeremiah 10:2). And Jubilees remembers this exact lore as the Watchers'' own surviving tablet: *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven.* (Jubilees 8:3) — the astrology, the signs of the sun, the course of the moon of Enoch 8:2 carried down on a carved rock. It ain''t new: what Enoch names, Moses forbids and Jubilees traces.',
       sv.verse_id, ev.verse_id, 'extras', 50178
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-watchers-corruption-of-flesh',
       E'Much godlessness — the Watchers'' rebellion and Genesis 6',
       E'Enoch sums the fruit of the descent: *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* (1 Enoch 8:2). This is the canon''s own Genesis 6 read from the inside — the same corruption the LORD will judge in the Flood: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* (Genesis 6:5), for *all flesh had corrupted his way upon the earth* (Genesis 6:12). The New Testament carries the Watchers forward unbroken: Jude remembers *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and Peter that *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Enoch''s own previous chapter set the scene the apostles inherit: *And all the others together with them took unto themselves wives... and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* (1 Enoch 7:1). The seed-war — tares sown among the wheat — runs from this rebellion against the Creator''s order; the sin is the Watchers'' lawlessness, and the Flood is the judgement for breaking the covenant of creation.',
       sv.verse_id, ev.verse_id, 'extras', 50181
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-cry-went-up-to-heaven',
       E'And their cry went up to heaven',
       E'The chapter ends with the voice of the devoured: *And as men perished, they cried, and their cry went up to heaven.* (1 Enoch 8:2). This cry is the canon''s recurring witness that the blood of the oppressed is heard above. From the first murder: *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* (Genesis 4:10) — Abel''s blood cries from the very earth the giants defiled. And in the bondage of Egypt the same ascent: *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* (Exodus 2:23) — the cry that comes up unto Elohim is the cry that will be answered with deliverance and judgement. So here, the cry of those perishing under the Watchers'' violence rises to heaven, and the next chapters of Enoch will show the holy angels carrying that cry before the Most High. The victims, not the systems, are heard; the dismantling that follows is of the rebellion, and the gathering of the righteous is the answer to the cry.',
       sv.verse_id, ev.verse_id, 'extras', 50184
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-8-azazel-craft-and-adornment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 9:30 — *And when Jehu was come to Jezreel, Jezebel heard of it; and she painted her face, and tired her head, and looked out at a window.* The painting of the face and the beautifying of the eyelids that Azâzêl taught in 1 Enoch 8:1 becomes the mark of the harlot-queen at the window.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=9 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 4:30 — *And when thou art spoiled, what wilt thou do? Though thou clothest thyself with crimson, though thou deckest thee with ornaments of gold, though thou rentest thy face with painting, in vain shalt thou make thyself fair; thy lovers will despise thee, they will seek thy life.* The ornaments of gold and the painting of the face that the Watcher taught in 1 Enoch 8:1 cannot save the spoiled city.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 23:40 — *And furthermore, that ye have sent for men to come from far, unto whom a messenger was sent; and, lo, they came: for whom thou didst wash thyself, paintedst thy eyes, and deckedst thyself with ornaments,* — the painted eyes and the ornaments Azâzêl handed down in 1 Enoch 8:1 are here the dress of covenant-breaking adultery.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The costly stones and colouring tinctures Azâzêl taught in 1 Enoch 8:1 are the very craft Wisdom names as the beginning of spiritual fornication.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-8-forbidden-arts-divination
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* — Torah forbids by name the enchantments and observing-of-times that Semjâzâ and his fellows teach in 1 Enoch 8:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-forbidden-arts-divination'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:2 — *Thus saith Yahuah (LORD), Learn not the way of the heathen, and be not dismayed at the signs of heaven; for the heathen are dismayed at them.* The astrology and the signs of the sun and moon that the Watchers teach in 1 Enoch 8:2 are exactly the signs of heaven the prophet warns Yashar''el not to learn.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-forbidden-arts-divination'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 8:3 — *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven.* Jubilees traces the very star-lore of 1 Enoch 8:2 to a surviving Watcher-tablet that re-corrupted men after the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-forbidden-arts-divination'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-8-watchers-corruption-of-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The much godlessness and corruption of all ways in 1 Enoch 8:2 is the very wickedness Genesis names as the cause of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* The becoming-corrupt-in-all-their-ways of 1 Enoch 8:2 is Genesis''s all flesh corrupting its way.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries the Watchers of 1 Enoch 8 forward by name — the rebel angels reserved in chains for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter binds the sinning angels of 1 Enoch 8 to their chains of darkness, reserved for the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The teaching of forbidden arts that erupts in 1 Enoch 8:1-2 began in the previous chapter with the Watchers'' defiling descent.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-8-cry-went-up-to-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The cry of those perishing that goes up to heaven in 1 Enoch 8:2 is the same cry of innocent blood that the LORD hears from the ground.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-cry-went-up-to-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The cry going up to heaven in 1 Enoch 8:2 is the same cry of the oppressed that comes up unto Elohim and moves Him to deliver.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-cry-went-up-to-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session250 — 1 Enoch cross-references complete.'
