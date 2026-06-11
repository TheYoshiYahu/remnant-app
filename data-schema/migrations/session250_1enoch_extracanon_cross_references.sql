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

-- ----- fragment: minion_1enoch_09.sql (session250 1-enoch 9) -----
-- Source anchor: enoch/1-enoch ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en09 (view _session250_en09_lookup). Sort band base 50200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-9-blood-cries-from-the-ground
  ('enoch', '1-enoch', 9, 1, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The lawlessness the watchers see filling the earth in Enoch 9:1 is the very wickedness Genesis names as the cause of the Flood.'),
  ('enoch', '1-enoch', 9, 1, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The blood and lawlessness wrought upon the earth in Enoch 9:1 is Genesis'' earth filled with violence.'),
  ('enoch', '1-enoch', 9, 2, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The voice of crying that reaches the gates of heaven in Enoch 9:2 is the same shed blood that cries from the ground from Abel onward.'),
  ('enoch', '1-enoch', 9, 2, 'jubilees', 'jubilees', 7, 23, 'extras', E'Jubilees 7:23 — *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity.* Jubilees names the same flood-cause Enoch 9:2 mourns: much blood shed, the earth filled with iniquity.'),
  -- thread: 1-enoch-9-throne-of-glory-all-naked-before-him
  ('enoch', '1-enoch', 9, 5, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Enoch 9:5''s all things naked and open in His sight, nothing hidden, is carried verbatim into the apostolic word.'),
  ('enoch', '1-enoch', 9, 5, 'canon', 'proverbs', 15, 11, 'free', E'Proverbs 15:11 — *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* The Most High who seest all things in Enoch 9:5 is the Yahuah before whom even hell and the hidden heart lie open.'),
  ('enoch', '1-enoch', 9, 4, 'canon', 'psalms', 11, 4, 'free', E'Psalm 11:4 — *Yahuah (LORD) is in his holy temple, the LORD’S throne is in heaven: his eyes behold, his eyelids try, the children of men.* The throne of glory standing unto all generations in Enoch 9:4 is the heavenly throne whose eyes try the children of men.'),
  -- thread: 1-enoch-9-azazel-and-shemyaza-the-watchers-named
  ('enoch', '1-enoch', 9, 6, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Azazel and Shemyaza in Enoch 9:6-7 are the sons of Elohim whose descent Genesis records in a single dense verse.'),
  ('enoch', '1-enoch', 9, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the very fate of Shemyaza and his associates from Enoch 9:7: angels who left their estate, chained unto the great judgment.'),
  ('enoch', '1-enoch', 9, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 9:6, holds the sinning Watchers in chains of darkness reserved unto judgment.'),
  -- thread: 1-enoch-9-daughters-of-men-and-the-giants
  ('enoch', '1-enoch', 9, 8, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers going to the daughters of men in Enoch 9:8 is Genesis'' sons of Elohim taking the daughters of men to wife.'),
  ('enoch', '1-enoch', 9, 8, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees joins Enoch 9:8-9: the angels took wives and the women bore giants.'),
  ('enoch', '1-enoch', 9, 8, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the watchers'' fornication of Enoch 9:8 as a chief cause of the Flood.'),
  ('enoch', '1-enoch', 9, 8, 'jasher', 'jasher', 4, 18, 'extras', E'Jasher 4:18 — *and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher records the same defiling of the earth Enoch 9:8 lays at the Watchers'' charge.'),
  ('enoch', '1-enoch', 9, 9, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'The Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the perishing of the very giants the women bore in Enoch 9:9, with Noah''s vessel preserved.'),
  -- thread: 1-enoch-9-souls-of-the-slain-cry-how-long
  ('enoch', '1-enoch', 9, 10, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held.* The souls of the dead crying at the gates of heaven in Enoch 9:10 are John''s souls under the altar awaiting the judgment.'),
  ('enoch', '1-enoch', 9, 10, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The unceasing lamentation of Enoch 9:10 is the same How long? cry of the slain pleading for the judgment of those who dwell on the earth.'),
  ('enoch', '1-enoch', 9, 11, 'apocrypha', 'ecclesiasticus', 16, 7, 'extras', E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* The judgment Enoch 9:11 longs for is the one Ben Sira recalls: the Most High unappeased toward the old giants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-blood-cries-from-the-ground',
       E'Much blood shed, and the voice of crying reaches heaven',
       E'The four watching archangels look down and see the ruin of Genesis 6: *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth* (1 Enoch 9:1), so that *The earth lost through those who dwell upon her! The voice of their crying has reached unto the gates of heaven* (1 Enoch 9:2). This is the canon''s own indictment of the corrupted age — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5); *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11). Blood crying from the ground is older still: *the voice of thy brother’s blood crieth unto me from the ground* (Genesis 4:10), and Jubilees rehearses the same flood-cause — *every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity* (Jubilees 7:23). It ain''t new: the angels'' grief over shed blood is Yahuah''s own grief that *grieved him at his heart* (Genesis 6:6) — the Creator''s order violated, not a law made into a curse.',
       sv.verse_id, ev.verse_id, 'extras', 50200
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-throne-of-glory-all-naked-before-him',
       E'Lord of lords — all things naked and open in His sight',
       E'The angels lift their suit to the formless Most High with a doxology of His order and His all-seeing knowledge: *Lord of lords, Elohim (God) of elohiym, King of kings, and Elohim (God) of the ages, the throne of Thy glory (standeth) unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages!* (1 Enoch 9:4), and *Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight, and Thou seest all things, and nothing can hide itself from Thee* (1 Enoch 9:5). The New Testament puts the same words on the page almost verbatim: *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The Tanakh stands underneath it — *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* (Proverbs 15:11), and *Yahuah (LORD) is in his holy temple, the LORD’S throne is in heaven: his eyes behold, his eyelids try, the children of men* (Psalm 11:4). The Head of Days is the Father, formless on the throne of glory, before whom nothing can hide — this is the One the angels appeal to, not a created power.',
       sv.verse_id, ev.verse_id, 'extras', 50203
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-azazel-and-shemyaza-the-watchers-named',
       E'Azazel and Shemyaza — the Watchers who left their estate',
       E'The angels name the chief offenders: *Thou seest what Azâzêl hath done, who hath taught all unrighteousness on earth and revealed the eternal secrets which were (preserved) in heaven, which men were striving to learn* (1 Enoch 9:6), *And what Shemyaza hath done, to whom Thou hast given authority to bear rule over his associates* (1 Enoch 9:7). These are the Watchers of Genesis 6 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4) — and the apostles carry their fate forward by name: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Their sin is rebellion against the Creator''s order — they revealed the secrets preserved in heaven that were not theirs to give. Here the seed-war begins, the tares first sown among the wheat.',
       sv.verse_id, ev.verse_id, 'extras', 50206
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-daughters-of-men-and-the-giants',
       E'They defiled the daughters of men, and the women bore giants',
       E'The angels recount the act itself: *And they have gone to the daughters of men upon the earth, and have slept with the women, and have defiled themselves, and revealed to them all kinds of sins* (1 Enoch 9:8), *And the women have borne giants, and the whole earth has thereby been filled with blood and unrighteousness* (1 Enoch 9:9). This is Genesis 6 in its own words — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2) — and the parallel extra-canonical witnesses tell the same flood-cause. Jubilees: *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1); and again, *the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose* (Jubilees 7:21). Jasher records the corruption — *Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth* (Jasher 4:18) — and the Wisdom of Solomon remembers the end of the giant-brood: *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (The Wisdom of Solomon 14:6). One transgression of the Creator''s order, witnessed across every shelf of the library.',
       sv.verse_id, ev.verse_id, 'extras', 50209
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-souls-of-the-slain-cry-how-long',
       E'The souls of the dead cry at the gates of heaven',
       E'The angels close their appeal with the cry of the dead: *And now, behold, the souls of those who have died are crying and making their suit to the gates of heaven, and their lamentations have ascended: and cannot cease because of the lawless deeds which are wrought on the earth* (1 Enoch 9:10), *And Thou knowest all things before they come to pass, and Thou seest these things and Thou dost suffer them, and Thou dost not say to us what we are to do to them in regard to these* (1 Enoch 9:11). The Revelation lays the same scene under the altar: *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9), *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The judgment of the giant-age is remembered by the elders of Israel too: *He was not pacified toward the old giants, who fell away in the strength of their foolishness* (Ecclesiasticus 16:7). The cry of the righteous dead ascends and is answered in its appointed time — election and judgment held by the One who knows all things before they come to pass.',
       sv.verse_id, ev.verse_id, 'extras', 50212
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-9-blood-cries-from-the-ground
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The lawlessness the watchers see filling the earth in Enoch 9:1 is the very wickedness Genesis names as the cause of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The blood and lawlessness wrought upon the earth in Enoch 9:1 is Genesis'' earth filled with violence.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The voice of crying that reaches the gates of heaven in Enoch 9:2 is the same shed blood that cries from the ground from Abel onward.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 7:23 — *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity.* Jubilees names the same flood-cause Enoch 9:2 mourns: much blood shed, the earth filled with iniquity.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-throne-of-glory-all-naked-before-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Enoch 9:5''s all things naked and open in His sight, nothing hidden, is carried verbatim into the apostolic word.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-throne-of-glory-all-naked-before-him'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:11 — *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* The Most High who seest all things in Enoch 9:5 is the Yahuah before whom even hell and the hidden heart lie open.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-throne-of-glory-all-naked-before-him'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 11:4 — *Yahuah (LORD) is in his holy temple, the LORD’S throne is in heaven: his eyes behold, his eyelids try, the children of men.* The throne of glory standing unto all generations in Enoch 9:4 is the heavenly throne whose eyes try the children of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-throne-of-glory-all-naked-before-him'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-azazel-and-shemyaza-the-watchers-named
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Azazel and Shemyaza in Enoch 9:6-7 are the sons of Elohim whose descent Genesis records in a single dense verse.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-azazel-and-shemyaza-the-watchers-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the very fate of Shemyaza and his associates from Enoch 9:7: angels who left their estate, chained unto the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-azazel-and-shemyaza-the-watchers-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 9:6, holds the sinning Watchers in chains of darkness reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-azazel-and-shemyaza-the-watchers-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-daughters-of-men-and-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers going to the daughters of men in Enoch 9:8 is Genesis'' sons of Elohim taking the daughters of men to wife.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 5:1 — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees joins Enoch 9:8-9: the angels took wives and the women bore giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the watchers'' fornication of Enoch 9:8 as a chief cause of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 4:18 — *and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher records the same defiling of the earth Enoch 9:8 lays at the Watchers'' charge.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'The Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the perishing of the very giants the women bore in Enoch 9:9, with Noah''s vessel preserved.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-souls-of-the-slain-cry-how-long
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:9 — *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held.* The souls of the dead crying at the gates of heaven in Enoch 9:10 are John''s souls under the altar awaiting the judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-souls-of-the-slain-cry-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The unceasing lamentation of Enoch 9:10 is the same How long? cry of the slain pleading for the judgment of those who dwell on the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-souls-of-the-slain-cry-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* The judgment Enoch 9:11 longs for is the one Ben Sira recalls: the Most High unappeased toward the old giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-souls-of-the-slain-cry-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_10.sql (session250 1-enoch 10) -----
-- Source anchor: enoch/1-enoch ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en10 (view _session250_en10_lookup). Sort band base 50225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-10-noah-warned-flood
  ('enoch', '1-enoch', 10, 2, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The deluge Uriel announces to Noah in 1 Enoch 10:2 is this same resolve of Yahuah to blot out all flesh.'),
  ('enoch', '1-enoch', 10, 3, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* Enoch 10:3 names the reason Noah is told to escape — his seed is preserved through every generation, the elect remnant kept by grace.'),
  ('enoch', '1-enoch', 10, 3, 'canon', 'genesis', 7, 3, 'free', E'Genesis 7:3 — *Of fowls also of the air by sevens, the male and the female; to keep seed alive upon the face of all the earth.* The preserving of Noah''s seed for all generations (1 Enoch 10:3) is the keeping-seed-alive of the ark.'),
  ('enoch', '1-enoch', 10, 3, 'jubilees', 'jubilees', 5, 5, 'extras', E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* Jubilees carries the same Flood-intercession as Enoch 10, sparing Noah alone out of the corrupted earth.'),
  -- thread: 1-enoch-10-azazel-bound-scapegoat
  ('enoch', '1-enoch', 10, 4, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement scapegoat is sent into the same desert where Azazel is bound in 1 Enoch 10:4, the sin-bearer driven out alive.'),
  ('enoch', '1-enoch', 10, 8, 'canon', 'leviticus', 16, 22, 'free', E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* As all sin is ascribed to Azazel and he is sealed in the wilderness (1 Enoch 10:8), so the scapegoat bears all iniquities into a land uninhabited.'),
  ('enoch', '1-enoch', 10, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the very binding of the Watchers Enoch 10:4-6 describes — chained in darkness until the great-day judgement.'),
  ('enoch', '1-enoch', 10, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter, like Enoch 10:6, holds the sinning angels in chains reserved for the fire of the great judgement.'),
  ('enoch', '1-enoch', 10, 5, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host of the high ones shut in the pit until visited matches Azazel covered with rocks and darkness till the day of judgement (1 Enoch 10:5).'),
  -- thread: 1-enoch-10-giants-slay-each-other
  ('enoch', '1-enoch', 10, 9, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The children of the Watchers Gabriel is sent against (1 Enoch 10:9) are these giants born of the sons of Elohim and the daughters of men.'),
  ('enoch', '1-enoch', 10, 10, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The refusal that the giants should have length of days (1 Enoch 10:10) is the LORD shortening flesh''s days against their hope to live five hundred years.'),
  ('enoch', '1-enoch', 10, 9, 'jubilees', 'jubilees', 5, 9, 'extras', E'Jubilees 5:9 — *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* Jubilees tells the same command Gabriel carries in 1 Enoch 10:9 — the giants turned one against another and destroyed.'),
  -- thread: 1-enoch-10-semjaza-bound-abyss
  ('enoch', '1-enoch', 10, 12, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Michael''s binding of Semjaza for seventy generations till the day of judgement (1 Enoch 10:12) is the everlasting chains Jude says hold the fallen angels.'),
  ('enoch', '1-enoch', 10, 13, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The abyss of fire and prison that confines the Watchers in 1 Enoch 10:13 is Peter''s hell of chained darkness reserved unto judgment.'),
  ('enoch', '1-enoch', 10, 13, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The same shut-up-in-the-pit-and-sealed motif of 1 Enoch 10:13 governs the binding of the dragon in the abyss.'),
  ('enoch', '1-enoch', 10, 12, 'jubilees', 'jubilees', 5, 10, 'extras', E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees, like Enoch 10:12, binds the Watchers in the earth''s depths until the great judgement, their sons slain before their eyes.'),
  -- thread: 1-enoch-10-evil-spirits-from-giants
  ('enoch', '1-enoch', 10, 15, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The spirits of the reprobate Michael is sent to destroy (1 Enoch 10:15) are these unclean spirits Yahusha confronts, roaming the dry places without rest.'),
  ('enoch', '1-enoch', 10, 15, 'canon', 'matthew', 12, 45, 'free', E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The wronging of mankind by the Watchers'' spirits (1 Enoch 10:15) continues in these wicked spirits that re-enter and ruin a man.'),
  ('enoch', '1-enoch', 10, 15, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees names the spirits of 1 Enoch 10:15 as the unclean demons that lead astray and destroy mankind after the Flood.'),
  ('enoch', '1-enoch', 10, 15, 'jubilees', 'jubilees', 10, 3, 'extras', E'Jubilees 10:3 — *Elohim (God) of the spirits of all flesh, who have shown mercy to me, And have saved me and my sons from the waters of the flood, And have not caused me to perish as You did the sons of perdition... Let Your grace be lift up upon my sons, And let not wicked spirits rule over them Lest they should destroy them from the earth.* Noah''s prayer answers the wronging of mankind by the reprobate spirits (1 Enoch 10:15), begging that the wicked spirits not rule over the righteous.'),
  -- thread: 1-enoch-10-plant-of-righteousness
  ('enoch', '1-enoch', 10, 16, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The same day that lets the plant of righteousness appear (1 Enoch 10:16) is the day Yahuah punishes the high host above and the kings below.'),
  ('enoch', '1-enoch', 10, 19, 'canon', 'isaiah', 65, 21, 'free', E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines yielding wine in abundance on the cleansed earth (1 Enoch 10:19) match the new-creation vineyards the elect plant and enjoy.'),
  ('enoch', '1-enoch', 10, 17, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The righteous completing their days in peace (1 Enoch 10:17) are Isaiah''s elect, long-lived as a tree, enjoying their own labour.'),
  ('enoch', '1-enoch', 10, 18, 'canon', 'amos', 9, 14, 'free', E'Amos 9:14 — *And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them.* The earth tilled in righteousness and planted with trees (1 Enoch 10:18) is the regathered house of Yashar''el restored to plant and reap in the land.'),
  ('enoch', '1-enoch', 10, 16, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The order of 1 Enoch 10 — the adversary bound, then evil ended and the plant of righteousness appearing (10:16) — is Revelation''s binding of the dragon before the reign of the righteous.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-noah-warned-flood',
       E'Noah warned, the seed preserved — Genesis 6 unfolded',
       E'The archangels'' intercession ends with a command: the Most High sends Uriel to Noah — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* (1 Enoch 10:2) — and *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.''* (1 Enoch 10:3). This is the canon''s own Genesis 6 told from heaven''s side. Yahuah (LORD) had already resolved, *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* (Genesis 6:7), yet *But Noah found grace in the eyes of Yahuah (LORD).* (Genesis 6:8) — and the seed kept alive becomes the covenant line, *to keep seed alive upon the face of all the earth.* (Genesis 7:3). Jubilees tells the same intercession-and-rescue: *But Noah found grace before the eyes of Yahuah (God).* (Jubilees 5:5). Not a new myth — the Flood account the Watchers provoked, the righteous remnant preserved by election, not merit.',
       sv.verse_id, ev.verse_id, 'extras', 50225
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-azazel-bound-scapegoat',
       E'Azazel bound in the desert — the scapegoat and the abyss',
       E'Raphael is commanded against the chief Watcher: *Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4), covered with jagged rocks and darkness (1 Enoch 10:5), *And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6), and to him *ascribe all sin* (1 Enoch 10:8). The Torah''s Day of Atonement carries the same name and the same desert: the lot falls *for the scapegoat* (Leviticus 16:8), the live goat *presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* (Leviticus 16:10), bearing the iniquities *unto a land not inhabited* (Leviticus 16:22) — sin laid on the desert-bound one, exactly as Azazel is bound in the desert and made to bear all sin. The New Testament names the binding plainly: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). And Isaiah sees the cosmic pattern: *Yahuah (LORD) shall punish the host of the high ones that are on high... shut up in the prison, and after many days shall they be visited.* (Isaiah 24:21-22). The Watchers'' rebellion is the seed-war''s root, not a new doctrine — the canon''s own Genesis 6, sealed under the desert until the great judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50228
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-giants-slay-each-other',
       E'The giants destroy one another — the sword sent among the seed',
       E'Gabriel is sent against the offspring of the Watchers: *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy... the children of the Watchers from amongst men... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* (1 Enoch 10:9), and their fathers'' plea for them is refused (1 Enoch 10:10). This is the giants of Genesis: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4) — and the cut-short days are the LORD''s word, *My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* (Genesis 6:3). Jubilees gives the same self-slaughter by the sword: *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* (Jubilees 5:9). The hybrid seed sown against the Creator''s order is unmade — the tares of the seed-war reaping themselves, exactly as Genesis 6 tells it.',
       sv.verse_id, ev.verse_id, 'extras', 50231
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-semjaza-bound-abyss',
       E'Semjaza bound seventy generations — chains until the great judgement',
       E'Michael is sent against the chief Watcher Semjaza and his host: *Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* (1 Enoch 10:11), and after their sons are slain, *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation* (1 Enoch 10:12), *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* (1 Enoch 10:13). The apostles state this binding as settled fact: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Revelation shows the same key, chain, pit, and seal laid on the great adversary: *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand. And he laid hold on the dragon... and bound him a thousand years, And cast him into the bottomless pit, and shut him up, and set a seal upon him* (Revelation 20:1-3). And Isaiah names the host of high ones gathered as prisoners in the pit, *and after many days shall they be visited.* (Isaiah 24:22). The binding is the Torah''s order vindicated — rebellion against the Creator chained until the everlasting judgement, not a curse on the righteous.',
       sv.verse_id, ev.verse_id, 'extras', 50234
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-evil-spirits-from-giants',
       E'The spirits of the reprobate destroyed — the origin of the unclean spirits',
       E'Michael is charged: *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* (1 Enoch 10:15). These spirits of the dead giants are the unclean spirits the Gospels meet — Yahusha (Jesus) names their wandering nature: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* (Matthew 12:43), and their fierce multiplying, *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first.* (Matthew 12:45). Jubilees makes the origin explicit and tells how a tenth were left under Mastema to afflict men: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* (Jubilees 10:1), and Noah pleads, *Let Your grace be lift up upon my sons, And let not wicked spirits rule over them Lest they should destroy them from the earth.* (Jubilees 10:3). The disembodied spirits of the hybrid seed are the demons of the New Testament — the seed-war made plain, the canon''s Genesis 6 carried forward into the Gospels.',
       sv.verse_id, ev.verse_id, 'extras', 50237
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-plant-of-righteousness',
       E'The plant of righteousness — the earth cleansed and restored',
       E'The chapter turns from judgement to restoration: *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* (1 Enoch 10:16), the righteous escaping and living out their days in peace (1 Enoch 10:17), the earth tilled in righteousness, planted with vines yielding wine in abundance (1 Enoch 10:18-19), cleansed from all defilement (1 Enoch 10:20), until *all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me.* (1 Enoch 10:21). The prophets sing the same restored land for the elect remnant: *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them... for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* (Isaiah 65:21-22), and the regathered house of Yashar''el (Israel), *they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them.* (Amos 9:14). The binding-then-cleansing follows Revelation''s order — the adversary chained in the pit (Revelation 20:1-3), then the new heaven and earth. The plant of righteousness is the gathered seed of Israel restored to the land, not a church replacing the tribes — the wheat the seed-war could not choke out, planted in truth and joy for evermore.',
       sv.verse_id, ev.verse_id, 'extras', 50240
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-10-noah-warned-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The deluge Uriel announces to Noah in 1 Enoch 10:2 is this same resolve of Yahuah to blot out all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* Enoch 10:3 names the reason Noah is told to escape — his seed is preserved through every generation, the elect remnant kept by grace.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:3 — *Of fowls also of the air by sevens, the male and the female; to keep seed alive upon the face of all the earth.* The preserving of Noah''s seed for all generations (1 Enoch 10:3) is the keeping-seed-alive of the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* Jubilees carries the same Flood-intercession as Enoch 10, sparing Noah alone out of the corrupted earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-azazel-bound-scapegoat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement scapegoat is sent into the same desert where Azazel is bound in 1 Enoch 10:4, the sin-bearer driven out alive.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* As all sin is ascribed to Azazel and he is sealed in the wilderness (1 Enoch 10:8), so the scapegoat bears all iniquities into a land uninhabited.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the very binding of the Watchers Enoch 10:4-6 describes — chained in darkness until the great-day judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter, like Enoch 10:6, holds the sinning angels in chains reserved for the fire of the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host of the high ones shut in the pit until visited matches Azazel covered with rocks and darkness till the day of judgement (1 Enoch 10:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-giants-slay-each-other
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The children of the Watchers Gabriel is sent against (1 Enoch 10:9) are these giants born of the sons of Elohim and the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-giants-slay-each-other'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The refusal that the giants should have length of days (1 Enoch 10:10) is the LORD shortening flesh''s days against their hope to live five hundred years.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-giants-slay-each-other'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:9 — *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* Jubilees tells the same command Gabriel carries in 1 Enoch 10:9 — the giants turned one against another and destroyed.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-giants-slay-each-other'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-semjaza-bound-abyss
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Michael''s binding of Semjaza for seventy generations till the day of judgement (1 Enoch 10:12) is the everlasting chains Jude says hold the fallen angels.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The abyss of fire and prison that confines the Watchers in 1 Enoch 10:13 is Peter''s hell of chained darkness reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The same shut-up-in-the-pit-and-sealed motif of 1 Enoch 10:13 governs the binding of the dragon in the abyss.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees, like Enoch 10:12, binds the Watchers in the earth''s depths until the great judgement, their sons slain before their eyes.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-evil-spirits-from-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The spirits of the reprobate Michael is sent to destroy (1 Enoch 10:15) are these unclean spirits Yahusha confronts, roaming the dry places without rest.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The wronging of mankind by the Watchers'' spirits (1 Enoch 10:15) continues in these wicked spirits that re-enter and ruin a man.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees names the spirits of 1 Enoch 10:15 as the unclean demons that lead astray and destroy mankind after the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:3 — *Elohim (God) of the spirits of all flesh, who have shown mercy to me, And have saved me and my sons from the waters of the flood, And have not caused me to perish as You did the sons of perdition... Let Your grace be lift up upon my sons, And let not wicked spirits rule over them Lest they should destroy them from the earth.* Noah''s prayer answers the wronging of mankind by the reprobate spirits (1 Enoch 10:15), begging that the wicked spirits not rule over the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-plant-of-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The same day that lets the plant of righteousness appear (1 Enoch 10:16) is the day Yahuah punishes the high host above and the kings below.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines yielding wine in abundance on the cleansed earth (1 Enoch 10:19) match the new-creation vineyards the elect plant and enjoy.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The righteous completing their days in peace (1 Enoch 10:17) are Isaiah''s elect, long-lived as a tree, enjoying their own labour.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 9:14 — *And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them.* The earth tilled in righteousness and planted with trees (1 Enoch 10:18) is the regathered house of Yashar''el restored to plant and reap in the land.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The order of 1 Enoch 10 — the adversary bound, then evil ended and the plant of righteousness appearing (10:16) — is Revelation''s binding of the dragon before the reign of the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_11.sql (session250 1-enoch 11) -----
-- Source anchor: enoch/1-enoch ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en11 (view _session250_en11_lookup). Sort band base 50250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-11-bind-the-watchers
  ('enoch', '1-enoch', 11, 1, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very defilement Michael is sent to punish in Enoch 11:1 — the Watchers who united themselves with women.'),
  ('enoch', '1-enoch', 11, 1, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The shortening of days and the coming flood-judgement of Enoch 11 is the same sentence Yahuah pronounces in Genesis 6.'),
  ('enoch', '1-enoch', 11, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries forward the Watchers bound for judgement that Enoch 11:2 describes, chained until the day that is for ever and ever.'),
  ('enoch', '1-enoch', 11, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter and Enoch 11:2 give the same verdict: the sinning angels are bound fast and reserved unto judgement.'),
  ('enoch', '1-enoch', 11, 2, 'jubilees', 'jubilees', 5, 6, 'extras', E'Jubilees 5:6 — *And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees tells the same binding Michael is commanded to perform in Enoch 11:2, in the depths of the earth.'),
  ('enoch', '1-enoch', 11, 2, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah lifts the binding of the Watchers in Enoch 11:2 to the day of judgement, when the host of the high ones is finally visited.'),
  -- thread: 1-enoch-11-abyss-of-fire-and-the-spirits
  ('enoch', '1-enoch', 11, 3, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The chaining and sealed prison of the abyss in Enoch 11:3 is the same binding John sees laid upon the dragon.'),
  ('enoch', '1-enoch', 11, 3, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The prison in which the rebels are confined in Enoch 11:3 is John''s bottomless pit, shut and sealed until the day of judgement.'),
  ('enoch', '1-enoch', 11, 5, 'jubilees', 'jubilees', 10, 5, 'extras', E'Jubilees 10:5 — *and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* Noah''s prayer asks for exactly what Enoch 11:5 commands — that the reprobate spirits and children of the Watchers be destroyed and bound away from mankind.'),
  ('enoch', '1-enoch', 11, 5, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men.* Enoch''s own earlier command to Gabriel is the twin of the order in Enoch 11:5 to destroy the spirits of the reprobate and the children of the Watchers.'),
  -- thread: 1-enoch-11-plant-of-righteousness-and-abundance
  ('enoch', '1-enoch', 11, 7, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The long life and completed days of the righteous in Enoch 11:7 are Isaiah''s elect whose days are as the days of a tree.'),
  ('enoch', '1-enoch', 11, 9, 'canon', 'isaiah', 65, 21, 'free', E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines planted and the wine in abundance of Enoch 11:9 are Isaiah''s restored people planting vineyards and eating their fruit.'),
  ('enoch', '1-enoch', 11, 9, 'canon', 'amos', 9, 13, 'free', E'Amos 9:13 — *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt.* The thousandfold seed and overflowing wine of Enoch 11:9 is Amos'' day of overtaking harvests and mountains dropping sweet wine.'),
  ('enoch', '1-enoch', 11, 6, 'jubilees', 'jubilees', 5, 11, 'extras', E'Jubilees 5:11 — *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* The plant of righteousness and truth appearing in Enoch 11:6 is Jubilees'' new and righteous nature made for all His works after the flood-judgement.'),
  -- thread: 1-enoch-11-earth-cleansed-all-nations-worship
  ('enoch', '1-enoch', 11, 11, 'canon', 'zephaniah', 3, 9, 'free', E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The all-nations adoration of Enoch 11:11 is Zephaniah''s purified peoples calling on the Name with one consent.'),
  ('enoch', '1-enoch', 11, 11, 'canon', 'zechariah', 14, 9, 'free', E'Zechariah 14:9 — *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* When all nations worship Me in Enoch 11:11, it is Zechariah''s day when Yahuah is king over all the earth and His name is one.'),
  ('enoch', '1-enoch', 11, 11, 'canon', 'psalms', 22, 27, 'free', E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The universal worship of Enoch 11:11 is the Psalm''s ends of the world turning and all the kindreds of the nations worshipping before Him.'),
  ('enoch', '1-enoch', 11, 11, 'canon', 'isaiah', 2, 3, 'free', E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The nations'' worship in Enoch 11:11 is Isaiah''s peoples coming to walk in His paths under the Torah that goes forth from Zion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-bind-the-watchers',
       E'Bind Semjaza and his associates — the chained Watchers of Genesis 6',
       E'Michael is sent to bind the chief of the rebel Watchers: *And Yahuah (God) said to Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation* (1 Enoch 11:1–2). This is not a new story — it is the canon''s own Genesis 6 unfolded. There the sin is named: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and judgement is set: *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). The New Testament knows this exact tradition and treats it as sober history: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Jubilees tells it the same way — *and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them* (Jubilees 5:6) — and Isaiah lifts it to the last day: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high* (Isaiah 24:21). The Watchers'' sin is rebellion against the Creator''s order, and the seed-war runs from here.',
       sv.verse_id, ev.verse_id, 'extras', 50250
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-abyss-of-fire-and-the-spirits',
       E'The abyss of fire and the destruction of the reprobate spirits',
       E'The Watchers and all condemned with them are led to the prison of fire: *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* *And whosoever shall be condemned and destroyed will from thenceforth be bound together with them to the end of all generations.* *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind* (1 Enoch 11:3–5). Revelation paints the same sealed prison and the same final fire: *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand. And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:1–2); *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more* (Revelation 20:3). The spirits of the reprobate — the evil spirits that proceeded from the slain giants — are the canon''s own unclean powers; Jubilees prays that they be locked away from the righteous: *imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant* (Jubilees 10:5). And Enoch''s own command against Gabriel''s targets is the twin of this verse: *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy ... the children of the Watchers from amongst men* (1 Enoch 10:9). This is judgement upon rebellion, not upon the keepers of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 50253
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-plant-of-righteousness-and-abundance',
       E'The plant of righteousness — the earth tilled and full of blessing',
       E'After judgement comes restoration: *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing* (1 Enoch 11:6); *And then shall all the righteous escape, and shall live until they beget thousands of children* (1 Enoch 11:7); *And then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing* (1 Enoch 11:8); *and the vine which they plant thereon shall yield wine in abundance, and as for all the seed which is sown thereon each measure (of it) shall bear a thousand* (1 Enoch 11:9). This is the kingdom-fruitfulness the prophets foresaw — for the righteous are a people, an elect planting, not a self-chosen class. Isaiah promises the same long-lived, vineyard-keeping seed: *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21); *for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands* (Isaiah 65:22); *for they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23). Amos sees the wine overflowing the very mountains: *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt* (Amos 9:13). Jubilees names the renewal at the root: *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway* (Jubilees 5:11). The plant of righteousness is the regathered, covenant-keeping people whom Yahuah replants in the cleansed land.',
       sv.verse_id, ev.verse_id, 'extras', 50256
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-earth-cleansed-all-nations-worship',
       E'The earth cleansed — all nations worship the One Yahuah',
       E'The chapter closes with the whole creation purged and turned to worship: *And cleanse thou the earth from all oppression, and from all unrighteousness, and from all sin: and all the uncleanness that is wrought upon the earth destroy from off the earth* (1 Enoch 11:10); *And all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me* (1 Enoch 11:11); *And the earth shall be cleansed from all defilement, and from all sin, and from all punishment* (1 Enoch 11:12). This is the prophets'' end of the matter — Yahuah alone king and all nations turned to Him. Zephaniah: *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). Zechariah seals the One Name: *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). The Psalm sings the nations bowing: *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee* (Psalm 22:27). And Isaiah shows them flowing up to learn His ways — *and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3): the nations worship by coming under the Torah that goes forth from Zion, not by abolishing it. The cleansing of the earth and the universal worship are one act of the same Yahuah of Spirits.',
       sv.verse_id, ev.verse_id, 'extras', 50259
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-11-bind-the-watchers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very defilement Michael is sent to punish in Enoch 11:1 — the Watchers who united themselves with women.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The shortening of days and the coming flood-judgement of Enoch 11 is the same sentence Yahuah pronounces in Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries forward the Watchers bound for judgement that Enoch 11:2 describes, chained until the day that is for ever and ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter and Enoch 11:2 give the same verdict: the sinning angels are bound fast and reserved unto judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:6 — *And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees tells the same binding Michael is commanded to perform in Enoch 11:2, in the depths of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah lifts the binding of the Watchers in Enoch 11:2 to the day of judgement, when the host of the high ones is finally visited.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-11-abyss-of-fire-and-the-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The chaining and sealed prison of the abyss in Enoch 11:3 is the same binding John sees laid upon the dragon.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The prison in which the rebels are confined in Enoch 11:3 is John''s bottomless pit, shut and sealed until the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:5 — *and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* Noah''s prayer asks for exactly what Enoch 11:5 commands — that the reprobate spirits and children of the Watchers be destroyed and bound away from mankind.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:9 — *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men.* Enoch''s own earlier command to Gabriel is the twin of the order in Enoch 11:5 to destroy the spirits of the reprobate and the children of the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-11-plant-of-righteousness-and-abundance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The long life and completed days of the righteous in Enoch 11:7 are Isaiah''s elect whose days are as the days of a tree.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines planted and the wine in abundance of Enoch 11:9 are Isaiah''s restored people planting vineyards and eating their fruit.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 9:13 — *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt.* The thousandfold seed and overflowing wine of Enoch 11:9 is Amos'' day of overtaking harvests and mountains dropping sweet wine.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:11 — *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* The plant of righteousness and truth appearing in Enoch 11:6 is Jubilees'' new and righteous nature made for all His works after the flood-judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-11-earth-cleansed-all-nations-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The all-nations adoration of Enoch 11:11 is Zephaniah''s purified peoples calling on the Name with one consent.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 14:9 — *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* When all nations worship Me in Enoch 11:11, it is Zechariah''s day when Yahuah is king over all the earth and His name is one.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The universal worship of Enoch 11:11 is the Psalm''s ends of the world turning and all the kindreds of the nations worshipping before Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The nations'' worship in Enoch 11:11 is Isaiah''s peoples coming to walk in His paths under the Torah that goes forth from Zion.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_12.sql (session250 1-enoch 12) -----
-- Source anchor: enoch/1-enoch ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en12 (view _session250_en12_lookup). Sort band base 50275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-12-enoch-hidden-walked-with-god
  ('enoch', '1-enoch', 12, 1, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Torah''s terse note that Enoch was taken is exactly the hiddenness 1 Enoch 12:1 describes — no man knew where he abode.'),
  ('enoch', '1-enoch', 12, 2, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New Testament names the translation that put Enoch''s days among the holy ones (1 Enoch 12:2).'),
  -- thread: 1-enoch-12-scribe-sent-to-watchers-genesis-6
  ('enoch', '1-enoch', 12, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very descent and taking-of-wives that Enoch is sent to confront in 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' leaving the high heaven (1 Enoch 12:4) as settled apostolic doctrine.'),
  ('enoch', '1-enoch', 12, 4, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter likewise grounds his warning in the angels that sinned, the Watchers of 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'enoch', '1-enoch', 15, 3, 'extras', E'1 Enoch 15:3 — *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* Yahuah Himself repeats Enoch''s indictment of 1 Enoch 12:4 when the Watchers'' petition is refused.'),
  ('enoch', '1-enoch', 12, 4, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees recounts the same descent and taking-of-wives that Enoch is sent to declare in 1 Enoch 12:4.'),
  -- thread: 1-enoch-12-great-destruction-on-the-earth
  ('enoch', '1-enoch', 12, 4, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants are the great destruction Enoch lays at the Watchers'' feet in 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The filled-with-violence earth is the very ruin Enoch names in 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'apocrypha', 'ecclesiasticus', 16, 7, 'extras', E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* Ben Sira remembers the giants and the destruction of 1 Enoch 12:4 as proof that Elohim does not relent toward the rebellious.'),
  ('enoch', '1-enoch', 12, 4, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'the Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom ties the perishing of the giants of 1 Enoch 12:4 to the seed preserved in the ark.'),
  -- thread: 1-enoch-12-no-peace-no-forgiveness
  ('enoch', '1-enoch', 12, 5, 'canon', 'isaiah', 57, 21, 'free', E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* Isaiah''s verdict is the very ''no peace'' Enoch pronounces over the Watchers in 1 Enoch 12:5.'),
  ('enoch', '1-enoch', 12, 5, 'canon', 'isaiah', 57, 20, 'free', E'Isaiah 57:20 — *But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt.* The restless, unforgiven wicked of Isaiah picture the Watchers who attain no peace in 1 Enoch 12:5.'),
  ('enoch', '1-enoch', 12, 5, 'enoch', '1-enoch', 13, 1, 'extras', E'1 Enoch 13:1 — *And Enoch went and said: ’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds.* Enoch carries the same ''no peace'' sentence of 1 Enoch 12:5 to Azazel by name.'),
  ('enoch', '1-enoch', 12, 6, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* Yahuah''s own decree spells out the murder of the beloved children the Watchers must watch in 1 Enoch 12:6.'),
  ('enoch', '1-enoch', 12, 6, 'jubilees', 'jubilees', 5, 10, 'extras', E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees confirms the supplication of 1 Enoch 12:6 wins no mercy — the binding holds until the great judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-enoch-hidden-walked-with-god',
       E'Enoch hidden, his days with the holy ones',
       E'The chapter opens after Enoch is taken out of the company of men: *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him. And his activities had to do with the Watchers, and his days were with the holy ones* (1 Enoch 12:1-2). Torah records the same removal in a single line — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — and Messiah''s assembly confesses it as faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). It ain''t new: the canon already says Enoch was hidden and walked among the holy ones; 1 Enoch only tells us what his days among them were for — a scribe of righteousness commissioned to confront the Watchers. The man counted righteous is set apart and kept, election preceding any word he speaks.',
       sv.verse_id, ev.verse_id, 'extras', 50275
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-scribe-sent-to-watchers-genesis-6',
       E'The scribe of righteousness sent to the Watchers who left heaven',
       E'Enoch is given his commission: *’Enoch, thou scribe of righteousness, go, declare to the Watchers of the heaven who have left the high heaven, the holy eternal place, and have defiled themselves with women, and have done as the children of earth do, and have taken unto themselves wives* (1 Enoch 12:3-4). This is the canon''s own Genesis 6 unfolded — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2) — and both apostolic witnesses carry it forward as fact, not myth: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Within Enoch the charge is repeated when Yahuah Himself answers — *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men* (1 Enoch 15:3) — and Jubilees tells the same descent: *the angels of Elohim (God) saw them... and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1). The Watchers'' sin is rebellion against the Creator''s order; the seed-war that scatters tares among the wheat runs from this descent.',
       sv.verse_id, ev.verse_id, 'extras', 50278
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-great-destruction-on-the-earth',
       E'Ye have wrought great destruction on the earth',
       E'Enoch''s word to the Watchers names the ruin they have brought: *Ye have wrought great destruction on the earth* (1 Enoch 12:4). Torah measures that destruction in the giants they sired and the violence that filled the world — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4); *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11). The apocrypha remembers the same giants and the same wrath without softening it: *He was not pacified toward the old giants, who fell away in the strength of their foolishness* (Ecclesiasticus 16:7); *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (the Wisdom of Solomon 14:6). It ain''t new — the destruction Enoch charges is the corrupted, violence-filled earth the whole canon mourns, and the seed preserved in the ark is the line through which righteousness survives the war.',
       sv.verse_id, ev.verse_id, 'extras', 50281
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-no-peace-no-forgiveness',
       E'No peace nor forgiveness for the Watchers',
       E'Enoch''s sentence on the Watchers is final and without remedy: *And ye shall have no peace nor forgiveness of sin: and inasmuch as they delight themselves in their children, The murder of their beloved ones shall they see, and over the destruction of their children shall they lament, and shall make supplication unto eternity, but mercy and peace shall ye not attain* (1 Enoch 12:5-6). The prophets speak the same verdict over the wicked — *But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt. There is no peace, saith my Elohim (God), to the wicked* (Isaiah 57:20-21). Within Enoch the same words fall on Azazel — *’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* (1 Enoch 13:1) — and the murder of the beloved children is decreed by Yahuah to Michael: *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12). Jubilees confirms the petition will not be heard: *and after this they were bound in the depths of the earth for ever, until the day of the great condemnation* (Jubilees 5:10). The covenant order stands — the rebel against the Creator finds no peace, and supplication does not overturn a righteous sentence.',
       sv.verse_id, ev.verse_id, 'extras', 50284
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-12-enoch-hidden-walked-with-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Torah''s terse note that Enoch was taken is exactly the hiddenness 1 Enoch 12:1 describes — no man knew where he abode.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-enoch-hidden-walked-with-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New Testament names the translation that put Enoch''s days among the holy ones (1 Enoch 12:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-enoch-hidden-walked-with-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-12-scribe-sent-to-watchers-genesis-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very descent and taking-of-wives that Enoch is sent to confront in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' leaving the high heaven (1 Enoch 12:4) as settled apostolic doctrine.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter likewise grounds his warning in the angels that sinned, the Watchers of 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 15:3 — *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* Yahuah Himself repeats Enoch''s indictment of 1 Enoch 12:4 when the Watchers'' petition is refused.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees recounts the same descent and taking-of-wives that Enoch is sent to declare in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-12-great-destruction-on-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants are the great destruction Enoch lays at the Watchers'' feet in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The filled-with-violence earth is the very ruin Enoch names in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* Ben Sira remembers the giants and the destruction of 1 Enoch 12:4 as proof that Elohim does not relent toward the rebellious.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'the Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom ties the perishing of the giants of 1 Enoch 12:4 to the seed preserved in the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-12-no-peace-no-forgiveness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* Isaiah''s verdict is the very ''no peace'' Enoch pronounces over the Watchers in 1 Enoch 12:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:20 — *But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt.* The restless, unforgiven wicked of Isaiah picture the Watchers who attain no peace in 1 Enoch 12:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 13:1 — *And Enoch went and said: ’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds.* Enoch carries the same ''no peace'' sentence of 1 Enoch 12:5 to Azazel by name.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* Yahuah''s own decree spells out the murder of the beloved children the Watchers must watch in 1 Enoch 12:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees confirms the supplication of 1 Enoch 12:6 wins no mercy — the binding holds until the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_13.sql (session250 1-enoch 13) -----
-- Source anchor: enoch/1-enoch ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en13 (view _session250_en13_lookup). Sort band base 50300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-13-no-peace-to-the-wicked
  ('enoch', '1-enoch', 13, 1, 'canon', 'isaiah', 48, 22, 'free', E'Isaiah 48:22 — *There is no peace, saith Yahuah (LORD), unto the wicked.* The same standing verdict Enoch pronounces on Azazel in 13:1 — no peace for the one who broke the Creator''s order.'),
  ('enoch', '1-enoch', 13, 1, 'canon', 'isaiah', 57, 21, 'free', E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* The prophet repeats word-for-word the sentence already gone forth against Azazel in 13:1.'),
  ('enoch', '1-enoch', 13, 1, 'enoch', '1-enoch', 12, 5, 'extras', E'1 Enoch 12:5 — *And ye shall have no peace nor forgiveness of sin: and inasmuch as they delight themselves in their children,* — the verdict over all the Watchers that 13:1 now lays specifically on their chief, Azazel.'),
  ('enoch', '1-enoch', 13, 2, 'jubilees', 'jubilees', 5, 16, 'extras', E'Jubilees 5:16 — *He is not one who will regard the person (of any), nor is He one who will receive gifts, if He says that He will execute judgment on each* — why no toleration nor request can be granted to Azazel in 13:2: the Judge accepts no bribe to overturn the sentence.'),
  -- thread: 1-enoch-13-petition-refused-reserved-in-chains
  ('enoch', '1-enoch', 13, 2, 'enoch', '1-enoch', 10, 10, 'extras', E'1 Enoch 10:10 — *And no request that they (i.e. their fathers) make of thee shall be granted unto their fathers on their behalf; for they hope to live an eternal life, and that each one of them will live five hundred years.* The decree that explains why no request is granted to Azazel in 13:2 — the refusal was settled before Enoch ever drafted the petition.'),
  ('enoch', '1-enoch', 13, 5, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The host on high held in prison until the appointed visitation — the same reserved sentence that leaves the Watchers in 13:5 unable to lift their eyes to heaven.'),
  ('enoch', '1-enoch', 13, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the verdict Enoch records in 13:4 — the Watchers'' petition for forgiveness cannot reverse a reservation in chains unto the judgement.'),
  ('enoch', '1-enoch', 13, 4, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter echoes Enoch 13:4 — angels reserved unto judgement, their requested forgiveness withheld.'),
  -- thread: 1-enoch-13-the-arts-he-taught-genesis-six
  ('enoch', '1-enoch', 13, 2, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Watchers'' descent that bred the giants — the very rebellion whose teaching of unrighteousness Enoch arraigns Azazel for in 13:2.'),
  ('enoch', '1-enoch', 13, 2, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth corruption that flowed from the works Azazel taught men in 13:2.'),
  ('enoch', '1-enoch', 13, 2, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* Jubilees describes the spreading corruption that 13:2 charges to the unrighteousness Azazel taught.'),
  ('enoch', '1-enoch', 13, 2, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* Enoch''s own indictment naming Azazel as the source of the unrighteousness he is sentenced for in 13:2.'),
  -- thread: 1-enoch-13-waters-of-dan-dream-of-chastisement
  ('enoch', '1-enoch', 13, 8, 'canon', 'numbers', 12, 6, 'free', E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The Torah''s own rule for prophetic revelation — exactly the vision-and-voice by which Enoch is commissioned to reprimand the sons of heaven in 13:8.'),
  ('enoch', '1-enoch', 13, 7, 'canon', 'job', 33, 15, 'free', E'Job 33:15 — *In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed;* — the very scene of 13:7, Enoch falling asleep over the petition and a dream of chastisement falling upon him.'),
  ('enoch', '1-enoch', 13, 8, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The Creator''s limit on rebellious flesh — the chastisement the night vision of 13:8 confirms against the Watchers and their works.'),
  -- thread: 1-enoch-13-enoch-scribe-reads-petition-before-god
  ('enoch', '1-enoch', 13, 6, 'enoch', '1-enoch', 14, 1, 'extras', E'1 Enoch 14:1 — *The book of the words of righteousness, and of the reproof of the Watchers, who belong to the world, according to that which He, who is blessed and righteous, commanded in the vision.* The heading of the very document Enoch writes out and reads before God in 13:6,10 — a book of reproof, not of pardon.'),
  ('enoch', '1-enoch', 13, 10, 'jubilees', 'jubilees', 5, 10, 'extras', E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Why the petition Enoch reads before God in 13:10 fails — the Watcher-fathers are bound, not forgiven.'),
  ('enoch', '1-enoch', 13, 4, 'canon', 'leviticus', 16, 22, 'free', E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* The Torah''s scapegoat — the same Azazel bound in the desert (1 Enoch 10) — showing iniquity is carried off by the Creator''s appointed judgement, not by the forbearance the Watchers beg for in 13:4.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-no-peace-to-the-wicked',
       E'No peace for Azazel — the sentence that is older than Sinai',
       E'Enoch carries the verdict to the chief of the Watchers: *And Enoch went and said: ’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* (1 Enoch 13:1). This is not Enoch''s invention — it is the standing word of the Creator against rebellion, the same word the prophet hears: *There is no peace, saith Yahuah (LORD), unto the wicked* (Isaiah 48:22), and again, *There is no peace, saith my Elohim (God), to the wicked* (Isaiah 57:21). The sentence here on Azazel is the same one already spoken over all the Watchers a chapter earlier — *And ye shall have no peace nor forgiveness of sin* (1 Enoch 12:5) — and Jubilees confirms there is no buying it back: of the Judge it is written, *He is not one who will regard the person (of any), nor is He one who will receive gifts* (Jubilees 5:16). The Watchers'' sin is rebellion against the Creator''s order; the peace they forfeit is the peace of the covenant they broke. It ain''t new — the no-peace verdict on the rebel runs from Enoch straight through the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 50300
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-petition-refused-reserved-in-chains',
       E'The Watchers'' petition refused — reserved in chains unto judgement',
       E'The trembling Watchers ask Enoch to draft their appeal: *And they besought me to write out for them the record of a petition, that they might have forgiveness* (1 Enoch 13:4) — yet Azazel is told plainly, *And thou shalt not have toleration nor request granted to thee* (1 Enoch 13:2). The refusal was already decreed in the previous chapter: *And no request that they (i.e. their fathers) make of thee shall be granted unto their fathers on their behalf* (1 Enoch 10:10). This is the canon''s own doctrine of the bound Watchers. Isaiah sees the same host shut away and held for the appointed day: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high... And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited* (Isaiah 24:21-22). The apostles carry it forward without softening it: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). No appeal, no parole — the rebels are held, not pardoned. It ain''t new; Jude and Peter are reading Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 50303
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-the-arts-he-taught-genesis-six',
       E'The unrighteousness he taught — Azazel and the corruption of all flesh',
       E'Enoch names the charge: *And thou shalt not have toleration nor request granted to thee, because of the unrighteousness which thou hast taught, and because of all the works of godlessness and unrighteousness and sin which thou hast shown to men* (1 Enoch 13:2). This is the canon''s own Genesis 6 unfolded. The fallen Watchers are the *sons of Elohim (God)* who *came in unto the daughters of men*, and the fruit was the giants and a world drowned in evil: *There were giants in the earth in those days... And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:4-5). Jubilees tells the same story — *And lawlessness increased on the earth and all flesh corrupted its way... and every imagination of the thoughts of all men (was) thus evil continually* (Jubilees 5:2) — and Enoch itself lays the root at Azazel''s feet: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin* (1 Enoch 10:8). The Watchers'' descent and forbidden teaching is the seed sown among the wheat; the seed-war begins here. It ain''t new — Genesis 6 is the headline, Enoch is the full account.',
       sv.verse_id, ev.verse_id, 'extras', 50306
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-waters-of-dan-dream-of-chastisement',
       E'The waters of Dan — the night vision of chastisement',
       E'Enoch withdraws to read the petition and is given a dream: *And I went off and sat down at the waters of Dan, in the land of Dan, to the south of the west of Hermon: I read their petition till I fell asleep. And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* (1 Enoch 13:7-8). This is how Yahuah (God) speaks to His prophets — not a strange new channel but the appointed one: *If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream* (Numbers 12:6). Elihu names the very setting — sleep upon the bed, the night vision, the purpose of chastisement and turning back: *In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed; Then he openeth the ears of men, and sealeth their instruction* (Job 33:15-16). And the verdict the vision confirms is Genesis 6''s own line over flesh that will not turn: *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). It ain''t new — the dream-vision, the reproof of the sons of heaven, the limit set on the rebel: all already in the Torah and the Wisdom books.',
       sv.verse_id, ev.verse_id, 'extras', 50309
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-enoch-scribe-reads-petition-before-god',
       E'Enoch the scribe — the petition read before Yahuah (God), and bearing iniquity away',
       E'Enoch becomes the mediating scribe: *Then I wrote out their petition, and the prayer in regard to their spirits and their deeds individually... that they should have forgiveness and forbearance* (1 Enoch 13:6), and at last *I took their petition and read it before Yahuah (God) of heaven* (1 Enoch 13:10). His commission is the book of reproof itself — *The book of the words of righteousness, and of the reproof of the Watchers, who belong to the world, according to that which He, who is blessed and righteous, commanded in the vision* (1 Enoch 14:1). Yet the appeal cannot stand, for the fathers are kept only as witnesses to their sons'' ruin and then bound: *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways* (Jubilees 5:10). The Torah already pictured how guilt is carried off — not pardoned in place but laid on the head of Azazel and sent away: *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness* (Leviticus 16:22). That scapegoat is the very Azazel of chapter 10, bound in the desert; the sin is removed by judgement, not by a request for forbearance. Torah stands — the way of atonement is the Creator''s, not the rebel''s petition. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50312
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-13-no-peace-to-the-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 48:22 — *There is no peace, saith Yahuah (LORD), unto the wicked.* The same standing verdict Enoch pronounces on Azazel in 13:1 — no peace for the one who broke the Creator''s order.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* The prophet repeats word-for-word the sentence already gone forth against Azazel in 13:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 12:5 — *And ye shall have no peace nor forgiveness of sin: and inasmuch as they delight themselves in their children,* — the verdict over all the Watchers that 13:1 now lays specifically on their chief, Azazel.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:16 — *He is not one who will regard the person (of any), nor is He one who will receive gifts, if He says that He will execute judgment on each* — why no toleration nor request can be granted to Azazel in 13:2: the Judge accepts no bribe to overturn the sentence.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-petition-refused-reserved-in-chains
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:10 — *And no request that they (i.e. their fathers) make of thee shall be granted unto their fathers on their behalf; for they hope to live an eternal life, and that each one of them will live five hundred years.* The decree that explains why no request is granted to Azazel in 13:2 — the refusal was settled before Enoch ever drafted the petition.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The host on high held in prison until the appointed visitation — the same reserved sentence that leaves the Watchers in 13:5 unable to lift their eyes to heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the verdict Enoch records in 13:4 — the Watchers'' petition for forgiveness cannot reverse a reservation in chains unto the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter echoes Enoch 13:4 — angels reserved unto judgement, their requested forgiveness withheld.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-the-arts-he-taught-genesis-six
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Watchers'' descent that bred the giants — the very rebellion whose teaching of unrighteousness Enoch arraigns Azazel for in 13:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth corruption that flowed from the works Azazel taught men in 13:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* Jubilees describes the spreading corruption that 13:2 charges to the unrighteousness Azazel taught.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* Enoch''s own indictment naming Azazel as the source of the unrighteousness he is sentenced for in 13:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-waters-of-dan-dream-of-chastisement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The Torah''s own rule for prophetic revelation — exactly the vision-and-voice by which Enoch is commissioned to reprimand the sons of heaven in 13:8.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-waters-of-dan-dream-of-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 33:15 — *In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed;* — the very scene of 13:7, Enoch falling asleep over the petition and a dream of chastisement falling upon him.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-waters-of-dan-dream-of-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=33 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The Creator''s limit on rebellious flesh — the chastisement the night vision of 13:8 confirms against the Watchers and their works.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-waters-of-dan-dream-of-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-enoch-scribe-reads-petition-before-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:1 — *The book of the words of righteousness, and of the reproof of the Watchers, who belong to the world, according to that which He, who is blessed and righteous, commanded in the vision.* The heading of the very document Enoch writes out and reads before God in 13:6,10 — a book of reproof, not of pardon.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-enoch-scribe-reads-petition-before-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Why the petition Enoch reads before God in 13:10 fails — the Watcher-fathers are bound, not forgiven.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-enoch-scribe-reads-petition-before-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* The Torah''s scapegoat — the same Azazel bound in the desert (1 Enoch 10) — showing iniquity is carried off by the Creator''s appointed judgement, not by the forbearance the Watchers beg for in 13:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-enoch-scribe-reads-petition-before-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_14.sql (session250 1-enoch 14) -----
-- Source anchor: enoch/1-enoch ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en14 (view _session250_en14_lookup). Sort band base 50325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-14-throne-house-of-heaven
  ('enoch', '1-enoch', 14, 15, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* Ezekiel sees the same sapphire throne reaching above the firmament that Enoch sees at the summit of the middle mountain in 14:15.'),
  ('enoch', '1-enoch', 14, 16, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fiery flame is the flaming fire Enoch sees blazing before the throne of Yahuah in 14:16.'),
  ('enoch', '1-enoch', 14, 16, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiery stream from the Head of Days'' throne is the same river of heavenly fire Enoch beholds beyond the throne in 14:16-17.'),
  ('enoch', '1-enoch', 14, 15, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John is carried up in the spirit to the same enthroned glory Enoch is carried up to see in 14:15, the one throne that stands from his vision to John''s.'),
  -- thread: 1-enoch-14-waste-and-horrible-place
  ('enoch', '1-enoch', 14, 18, 'canon', 'genesis', 1, 2, 'free', E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The ''waste and horrible place'' with no firmament and no founded earth is the tohu-and-bohu of creation''s first verse — the un-ordered ground that lies outside the Creator''s order in 14:18.'),
  ('enoch', '1-enoch', 14, 18, 'canon', 'jeremiah', 4, 23, 'free', E'Jeremiah 4:23 — *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light.* Jeremiah sees creation rolled back to formlessness under judgement — the same waste place with no firmament above that Enoch is shown in 14:18.'),
  ('enoch', '1-enoch', 14, 18, 'canon', 'jeremiah', 4, 25, 'free', E'Jeremiah 4:25 — *I beheld, and, lo, there was no man, and all the birds of the heavens were fled.* The fled birds match Enoch''s place where ''there was no water upon it, and no birds'' (14:18) — the desolation that mirrors the place of imprisonment.'),
  -- thread: 1-enoch-14-prison-of-the-stars-host-of-heaven
  ('enoch', '1-enoch', 14, 19, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah''s ''host of the high ones'' is the very ''host of heaven'' Enoch sees imprisoned at the end of heaven and earth in 14:19.'),
  ('enoch', '1-enoch', 14, 21, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The shutting-up in prison until a later visitation is exactly Enoch''s binding of the stars ''till the time when their guilt should be consummated'' in 14:21.'),
  ('enoch', '1-enoch', 14, 19, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' reserved in darkness are Enoch''s transgressing stars shut up in the prison at the end of heaven and earth in 14:19-21.'),
  ('enoch', '1-enoch', 14, 21, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the prisoners as the rebel angels reserved in chains until the judgment — the same binding ''till the time when their guilt should be consummated'' Enoch records in 14:21.'),
  ('enoch', '1-enoch', 14, 21, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter''s angels in chains of darkness reserved unto judgment are Enoch''s stars bound till their guilt is consummated in 14:21 — the canon''s own witness to the bound Watchers of Genesis 6.'),
  ('enoch', '1-enoch', 14, 19, 'enoch', '1-enoch', 21, 11, 'extras', E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s own book, revisiting this same place, names the prison of the stars plainly as the prison of the angels — confirming the ''stars and the host of heaven'' of 14:19 are the fallen Watchers.'),
  -- thread: 1-enoch-14-stars-transgressed-appointed-times
  ('enoch', '1-enoch', 14, 20, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The lights were set under a commandment to keep their appointed seasons; Enoch''s stars ''transgressed the commandment'' by not coming forth at their appointed times (14:20).'),
  ('enoch', '1-enoch', 14, 20, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The stars the Creator made to rule their courses are the very stars that transgressed His commandment in the beginning of their rising in 14:20.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-throne-house-of-heaven',
       E'The throne in the house of heaven — sapphire and flaming fire',
       E'Enoch is carried up and sees the throne-room of the Creator: *And I saw the foundations of the house of heaven, and the pillars of fire, and the pillars of light, and the pillars of ice, and the pillars of snow, and the pillars of hail.* (1 Enoch 14:8), and the middle mountain that *reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15), beyond which he sees *a flaming fire* (1 Enoch 14:16). It ain''t new — the prophets saw the same throne. Ezekiel beheld *the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26) — the very sapphire of Enoch''s vision. Daniel saw the Head of Days enthroned: *his throne was like the fiery flame, and his wheels as burning fire. A fiery stream issued and came forth from before him* (Daniel 7:9-10), the same flaming fire that pours from Enoch''s throne. And John''s Revelation closes the circle: *a throne was set in heaven, and one sat on the throne... and out of the throne proceeded lightnings and thunderings and voices* (Revelation 4:2,5). One throne, one Creator, one order that stands — not a new vision but the one true vision handed down.',
       sv.verse_id, ev.verse_id, 'extras', 50325
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-waste-and-horrible-place',
       E'The waste and horrible place — formless, void, no birds',
       E'Beyond the abyss Enoch is shown the undoing of creation itself: *And beyond that abyss I saw a place which had no firmament of the heaven above, and no firmly founded earth beneath it: there was no water upon it, and no birds, but it was a waste and horrible place.* (1 Enoch 14:18). It ain''t new — this is the tohu-va-bohu of the first verses of Torah, the un-creation behind the work of the six days: *And the earth was without form, and void; and darkness was upon the face of the deep.* (Genesis 1:2). And it is precisely the picture Jeremiah is given of the land under judgement, creation rolled back: *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light... I beheld, and, lo, there was no man, and all the birds of the heavens were fled.* (Jeremiah 4:23,25) — the very ''no birds'' of Enoch''s waste place. The Creator who ordered the deep can leave a place outside His order; that emptiness is the prison-ground for what rebelled against the order. Not new — the oldest warning in the Book.',
       sv.verse_id, ev.verse_id, 'extras', 50328
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-prison-of-the-stars-host-of-heaven',
       E'A prison for the stars and the host of heaven — the bound Watchers',
       E'Enoch sees the prison prepared for the rebels: *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ''This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 14:19), *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.''* (1 Enoch 14:21). These ''stars'' are the fallen Watchers of Genesis 6 — Enoch''s own book names this same prison the prison of the angels (1 Enoch 21:11). It ain''t new: Isaiah saw it — *Yahuah (LORD) shall punish the host of the high ones that are on high... And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:21-22). Jude carries it into the Gospel age, calling the Watchers *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13), and naming their crime: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). Peter says it plainly: *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers'' sin is rebellion against the Creator''s order, and their binding waits a fixed day of judgement — Torah''s order stands, and what broke it is held. The seed-war began here.',
       sv.verse_id, ev.verse_id, 'extras', 50331
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-stars-transgressed-appointed-times',
       E'Stars that came not at their appointed times — breaking the order of the lights',
       E'The charge against the imprisoned stars is that they broke the Creator''s appointed order: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 14:20). It ain''t new — the very fourth-day decree of Torah set the lights in their courses with a command: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14), and *he made the stars also.* (Genesis 1:16). The lights were given a commandment — for signs and seasons (moedim), to keep their times. The transgressing stars are those who would not keep the appointed times the Creator set; their sin, like the Watchers'', is rebellion against His ordered law. The order of the heavens stands as surely as Torah stands; the rebel is bound, not the law.',
       sv.verse_id, ev.verse_id, 'extras', 50334
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=20
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-14-throne-house-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* Ezekiel sees the same sapphire throne reaching above the firmament that Enoch sees at the summit of the middle mountain in 14:15.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fiery flame is the flaming fire Enoch sees blazing before the throne of Yahuah in 14:16.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiery stream from the Head of Days'' throne is the same river of heavenly fire Enoch beholds beyond the throne in 14:16-17.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John is carried up in the spirit to the same enthroned glory Enoch is carried up to see in 14:15, the one throne that stands from his vision to John''s.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-14-waste-and-horrible-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The ''waste and horrible place'' with no firmament and no founded earth is the tohu-and-bohu of creation''s first verse — the un-ordered ground that lies outside the Creator''s order in 14:18.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-waste-and-horrible-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 4:23 — *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light.* Jeremiah sees creation rolled back to formlessness under judgement — the same waste place with no firmament above that Enoch is shown in 14:18.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-waste-and-horrible-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 4:25 — *I beheld, and, lo, there was no man, and all the birds of the heavens were fled.* The fled birds match Enoch''s place where ''there was no water upon it, and no birds'' (14:18) — the desolation that mirrors the place of imprisonment.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-waste-and-horrible-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-14-prison-of-the-stars-host-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah''s ''host of the high ones'' is the very ''host of heaven'' Enoch sees imprisoned at the end of heaven and earth in 14:19.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The shutting-up in prison until a later visitation is exactly Enoch''s binding of the stars ''till the time when their guilt should be consummated'' in 14:21.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' reserved in darkness are Enoch''s transgressing stars shut up in the prison at the end of heaven and earth in 14:19-21.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the prisoners as the rebel angels reserved in chains until the judgment — the same binding ''till the time when their guilt should be consummated'' Enoch records in 14:21.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter''s angels in chains of darkness reserved unto judgment are Enoch''s stars bound till their guilt is consummated in 14:21 — the canon''s own witness to the bound Watchers of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s own book, revisiting this same place, names the prison of the stars plainly as the prison of the angels — confirming the ''stars and the host of heaven'' of 14:19 are the fallen Watchers.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-14-stars-transgressed-appointed-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The lights were set under a commandment to keep their appointed seasons; Enoch''s stars ''transgressed the commandment'' by not coming forth at their appointed times (14:20).'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-stars-transgressed-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The stars the Creator made to rule their courses are the very stars that transgressed His commandment in the beginning of their rising in 14:20.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-stars-transgressed-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_15.sql (session250 1-enoch 15) -----
-- Source anchor: enoch/1-enoch ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en15 (view _session250_en15_lookup). Sort band base 50350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-15-watchers-petition-refused
  ('enoch', '1-enoch', 15, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads back the very refusal of Enoch 15:2 — there is no intercession for the Watchers, only chains reserved unto the great day.'),
  ('enoch', '1-enoch', 15, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 15:2, denies the angels any pardon: not spared, but reserved unto judgment.'),
  ('enoch', '1-enoch', 15, 2, 'jubilees', 'jubilees', 10, 5, 'extras', E'Jubilees 10:5 — *And You know how Your Watchers, the fathers of these spirits, acted in my day: and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* The prayer Heaven answers is Noah''s against the Watchers, never the Watchers'' for themselves — the same refusal Enoch carries in 15:2.'),
  -- thread: 1-enoch-15-left-heaven-defiled-begat-giants
  ('enoch', '1-enoch', 15, 3, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Enoch 15:3 names these ''sons of Elohim'' as the Watchers and turns Moses'' line into a direct charge: ye left heaven and took to yourselves wives.'),
  ('enoch', '1-enoch', 15, 3, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Enoch 15:3 says the Watchers ''begotten'' are Moses'' nephilim — the same offspring, the same crossing of kinds.'),
  ('enoch', '1-enoch', 15, 3, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells Enoch 15:3 in the same words — angels, chosen wives, giants begotten.'),
  ('enoch', '1-enoch', 15, 4, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Noah names the sin Enoch 15:4 condemns — Watchers transgressing ''the law of their ordinances,'' rebellion against the Creator''s appointed order, not law made curse.'),
  -- thread: 1-enoch-15-giants-become-evil-spirits
  ('enoch', '1-enoch', 15, 6, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, earth-bound spirit Yahusha (Jesus) describes is exactly Enoch 15:6''s giant-spirit whose dwelling is on the earth, seeking a body and finding no true home.'),
  ('enoch', '1-enoch', 15, 7, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees shows the spirits of Enoch 15:7 already at work after the Flood — the surviving giant-spirits leading astray and destroying mankind.'),
  ('enoch', '1-enoch', 15, 6, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the proud giants of Enoch 15:6 perishing in the Flood while righteous seed was preserved in the ark.'),
  -- thread: 1-enoch-15-earthbound-spirits-till-the-judgement
  ('enoch', '1-enoch', 15, 11, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The mortality decreed on flesh in Genesis 6:3 is the very death Enoch 15:4-11 traces — the giants ''die and perish,'' and their spirits are loosed until the great judgement.'),
  ('enoch', '1-enoch', 15, 11, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s ''judgment of the great day'' is Enoch 15:11''s ''great judgement in which the age shall be consummated, over the Watchers and the godless.'''),
  ('enoch', '1-enoch', 15, 9, 'enoch', '1-enoch', 16, 4, 'extras', E'1 Enoch 16:4 — *Say to them therefore: “You have no peace.”* The next chapter seals the verdict Enoch 15:9-11 announces: the Watchers and their destroying spirits are granted no peace, only the consummation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-watchers-petition-refused',
       E'Enoch''s commission: the Watchers should not be interceded for',
       E'Enoch, sent up by the trembling Watchers to plead their case, is turned back with the verdict already fixed: *’Fear not, Enoch, thou righteous man and scribe of righteousness: approach hither and hear my voice.* … *You should intercede for men, and not men for you’* (1 Enoch 15:1-2). The petition is refused because these are not weak men but rebels against the Creator''s order, and the apostles preserve the sentence exactly: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and again *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Jubilees voices the counter-prayer Yahuah (God) does answer — not the Watchers'' plea but Noah''s, *and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant* (Jubilees 10:5). It ain''t new: Jude and Peter did not invent the bound-angels doctrine; they were reading the Watchers, and the framework holds — the sin is rebellion against the Maker''s appointed order, and Torah-keeping righteousness (the scribe of righteousness himself) stands on the other side of the judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50350
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-left-heaven-defiled-begat-giants',
       E'The charge: heaven left, women defiled, giants begotten',
       E'The indictment laid on the Watchers is Genesis 6 spoken back to them as accusation: *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* (1 Enoch 15:3), holy spiritual ones who *have lusted after flesh and blood as those also do who die and perish* (1 Enoch 15:4). This is the canon''s own sentence: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them* (Genesis 6:4). Jubilees tells it the same way — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1) — and names the sin precisely: *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness* (Jubilees 7:21). It ain''t new: Genesis 6''s terse ''sons of Elohim'' is unfolded here as the Watchers, and the seed-war — the tares sown among the wheat — has its root in this crossing of the appointed boundary between the spirits of heaven and the children of earth.',
       sv.verse_id, ev.verse_id, 'extras', 50353
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-giants-become-evil-spirits',
       E'The origin of evil spirits from the dead giants',
       E'Here the canon''s demonology is given its root: the slain giants do not simply die — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 15:6), for *Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin* (1 Enoch 15:7). The Gospels assume exactly this homeless, earth-bound spirit: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43) — a disembodied thing wandering the earth seeking a dwelling, just as Enoch describes. Jubilees carries the same teaching forward into Noah''s day: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them* (Jubilees 10:1). And the apocrypha remembers that the giants did perish in the Flood even as their spirits remained: *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel* (Wisdom of Solomon 14:6). It ain''t new: when Yahusha (Jesus) casts out unclean spirits He is acting on the very order Enoch lays down — the demons are the surviving spirits of the nephilim, the bitter fruit of the Watchers'' crossing.',
       sv.verse_id, ev.verse_id, 'extras', 50356
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-earthbound-spirits-till-the-judgement',
       E'Earth-bound spirits afflict mankind until the great judgement',
       E'The spirits of the dead giants are fixed to the earth and given over to torment the living until the consummation: *but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8), and they *afflict, oppress, destroy, attack, do battle, and work destruction on the earth* (1 Enoch 15:9), warring *until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless* (1 Enoch 15:11). The flesh that bred them was already under sentence by Yahuah (LORD): *My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3) — the same mortality Enoch 15:4 names, that the Watchers lusted ''as those also do who die and perish.'' Their final reckoning is the great-day judgement Jude preserves word for word: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). And the sentence Enoch carries back closes the parallel chapter with no pardon: *Say to them therefore: “You have no peace”* (1 Enoch 16:4). It ain''t new — the spirits'' temporary leash and their certain end are one continuous teaching from Genesis 6 through Enoch into Jude; Torah stands, the godless are judged, and the righteous wait out the consummation.',
       sv.verse_id, ev.verse_id, 'extras', 50359
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-15-watchers-petition-refused
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads back the very refusal of Enoch 15:2 — there is no intercession for the Watchers, only chains reserved unto the great day.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 15:2, denies the angels any pardon: not spared, but reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:5 — *And You know how Your Watchers, the fathers of these spirits, acted in my day: and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* The prayer Heaven answers is Noah''s against the Watchers, never the Watchers'' for themselves — the same refusal Enoch carries in 15:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-15-left-heaven-defiled-begat-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Enoch 15:3 names these ''sons of Elohim'' as the Watchers and turns Moses'' line into a direct charge: ye left heaven and took to yourselves wives.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Enoch 15:3 says the Watchers ''begotten'' are Moses'' nephilim — the same offspring, the same crossing of kinds.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells Enoch 15:3 in the same words — angels, chosen wives, giants begotten.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Noah names the sin Enoch 15:4 condemns — Watchers transgressing ''the law of their ordinances,'' rebellion against the Creator''s appointed order, not law made curse.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-15-giants-become-evil-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, earth-bound spirit Yahusha (Jesus) describes is exactly Enoch 15:6''s giant-spirit whose dwelling is on the earth, seeking a body and finding no true home.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-giants-become-evil-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees shows the spirits of Enoch 15:7 already at work after the Flood — the surviving giant-spirits leading astray and destroying mankind.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-giants-become-evil-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the proud giants of Enoch 15:6 perishing in the Flood while righteous seed was preserved in the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-giants-become-evil-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-15-earthbound-spirits-till-the-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The mortality decreed on flesh in Genesis 6:3 is the very death Enoch 15:4-11 traces — the giants ''die and perish,'' and their spirits are loosed until the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-earthbound-spirits-till-the-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s ''judgment of the great day'' is Enoch 15:11''s ''great judgement in which the age shall be consummated, over the Watchers and the godless.'''
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-earthbound-spirits-till-the-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 16:4 — *Say to them therefore: “You have no peace.”* The next chapter seals the verdict Enoch 15:9-11 announces: the Watchers and their destroying spirits are granted no peace, only the consummation.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-earthbound-spirits-till-the-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_16.sql (session250 1-enoch 16) -----
-- Source anchor: enoch/1-enoch ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en16 (view _session250_en16_lookup). Sort band base 50375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-16-watchers-union-genesis-6
  ('enoch', '1-enoch', 16, 2, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers'' "union" with women in Enoch 16:2 is Moses'' sons-of-Elohim taking wives of the daughters of men.'),
  ('enoch', '1-enoch', 16, 2, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The defilement Enoch names in 16:2 is the very union that produced the giants of Genesis 6.'),
  ('enoch', '1-enoch', 16, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' crossing of the heaven-flesh boundary in Enoch 16:2 as angels abandoning their first estate, reserved for judgment.'),
  ('enoch', '1-enoch', 16, 2, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the same union of Enoch 16:2 as the Watchers breaking the law of their ordinances — the beginning of uncleanness on the earth.'),
  -- thread: 1-enoch-16-forbidden-mysteries-corruption
  ('enoch', '1-enoch', 16, 3, 'apocrypha', 'the-wisdom-of-solomon', 14, 12, 'extras', E'the Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The mysteries the Watchers showed to women in Enoch 16:3 are this same devised corruption that ruins life on earth.'),
  ('enoch', '1-enoch', 16, 3, 'apocrypha', 'the-wisdom-of-solomon', 14, 23, 'extras', E'the Wisdom of Solomon 14:23 — *For while they slew their children in sacrifices, or used secret ceremonies, or made revellings of strange rites.* The "secret ceremonies" of Wisdom mirror the destroying mysteries the Watchers passed to women in Enoch 16:3.'),
  ('enoch', '1-enoch', 16, 3, 'canon', '2-peter', 2, 1, 'free', E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* The forbidden teaching of Enoch 16:3 is the same privily-brought ruin Peter warns will work destruction in the last days.'),
  -- thread: 1-enoch-16-origin-evil-spirits-no-rest
  ('enoch', '1-enoch', 16, 1, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, bodiless wanderer Yahusha describes is the giant-spirit Enoch 16 inherits from the slain Watchers'' offspring, hungering without flesh of its own.'),
  ('enoch', '1-enoch', 16, 3, 'canon', 'matthew', 12, 45, 'free', E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The destruction the spirits work in Enoch 16:3 is the same evil-spirit campaign Yahusha says worsens the one it inhabits.'),
  ('enoch', '1-enoch', 16, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter affirms the Watchers'' binding that stands behind Enoch 16''s loosed evil spirits — the fallen ones chained, reserved unto the great judgment.'),
  -- thread: 1-enoch-16-no-peace-petition-refused
  ('enoch', '1-enoch', 16, 4, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The "no peace" verdict of Enoch 16:4 is the closing door of Genesis 6:3 — a fixed term granted, then judgement, with no reprieve for corrupted flesh.'),
  ('enoch', '1-enoch', 16, 4, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* Jude cites Enoch by name; the "no peace" of 16:4 is the near edge of the coming-in-judgement Enoch prophesied.'),
  ('enoch', '1-enoch', 16, 4, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The refused petition of Enoch 16:4 anticipates this executed judgment Jude draws straight from Enoch''s own words.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-watchers-union-genesis-6',
       E'The union the Watchers should never have made',
       E'Enoch''s commission closes by naming the crime once more: *With the spiritual ones have ye had union, with the women have ye defiled yourselves, and with the blood of women have ye lusted, and with the flesh and blood of men have ye drunk wine* (1 Enoch 16:2). This is not a new myth grafted onto Scripture — it is the canon''s own Genesis 6 unfolded. Moses wrote it plainly: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days* (Genesis 6:4). The sin is rebellion against the Creator''s ordered boundaries — heaven''s spiritual ones leaving their estate to mingle with flesh — which is exactly how Jude reads it: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). Jubilees keeps the same testimony, that *the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness* (Jubilees 7:21). One descent, one defilement, witnessed across Genesis, Enoch, Jude, and Jubilees alike.',
       sv.verse_id, ev.verse_id, 'extras', 50375
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-forbidden-mysteries-corruption',
       E'The mysteries that work destruction',
       E'The Watchers did not only defile themselves; they handed down forbidden knowledge: *And these things have ye shown to women, and through these mysteries women and men work much destruction on earth* (1 Enoch 16:3). This is the seed-war sown — corrupting arts taught against the Creator''s order, multiplying ruin. The Wisdom of Solomon traces the same chain, that *the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life* (the Wisdom of Solomon 14:12), and that those who *used secret ceremonies, or made revellings of strange rites* thereby *kept neither lives nor marriages any longer undefiled* (the Wisdom of Solomon 14:23-24). Peter sets the same pattern in the last days: false teachers *who privily shall bring in damnable heresies* (2 Peter 2:1), so that *by reason of whom the way of truth shall be evil spoken of* (2 Peter 2:2). Forbidden mysteries shown to the unguarded are how destruction has always spread — and the Torah still stands as the boundary the rebels crossed.',
       sv.verse_id, ev.verse_id, 'extras', 50378
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-origin-evil-spirits-no-rest',
       E'Evil spirits from the giants, seeking rest',
       E'Chapter 16 follows directly from the judgement just declared, that the slain giants leave behind spirits who *destroy without incurring judgement* until the consummation (1 Enoch 15:11) — disembodied, restless, hungering yet without flesh. Yahusha names exactly these wandering spirits: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43). The dry-place wanderer with no body to dwell in is the giant-spirit of Enoch''s account — and the warning that *the last state of that man is worse than the first* (Matthew 12:45) shows the same campaign of destruction Enoch describes still running. Peter confirms the binding that holds the fallen Watchers behind these spirits: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers chained; their giant-offspring''s spirits loosed for a time — the origin of the evil spirits is not invented by the Gospels but carried into them.',
       sv.verse_id, ev.verse_id, 'extras', 50381
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-no-peace-petition-refused',
       E'"You have no peace" — the petition refused',
       E'Enoch''s commission ends with a verdict, not a reprieve: *Say to them therefore: "You have no peace."* (1 Enoch 16:4). The Watchers had sent Enoch up to intercede for them; the answer comes back that there is no peace for those who broke heaven''s order. Genesis records the same sentence on flesh that has corrupted its way: *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3) — a closing door, a fixed term before judgement. Jude, quoting Enoch the seventh from Adam, declares the verdict''s full reach: *Behold, Yahuah (Lord) cometh with ten thousands of his saints, To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed* (Jude 1:14-15). The refused petition of the Watchers and the announced coming-with-judgement are one continuous word — no peace for the rebel, while the way of righteousness stands open for those who keep it.',
       sv.verse_id, ev.verse_id, 'extras', 50384
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-16-watchers-union-genesis-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers'' "union" with women in Enoch 16:2 is Moses'' sons-of-Elohim taking wives of the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The defilement Enoch names in 16:2 is the very union that produced the giants of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' crossing of the heaven-flesh boundary in Enoch 16:2 as angels abandoning their first estate, reserved for judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the same union of Enoch 16:2 as the Watchers breaking the law of their ordinances — the beginning of uncleanness on the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-16-forbidden-mysteries-corruption
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'the Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The mysteries the Watchers showed to women in Enoch 16:3 are this same devised corruption that ruins life on earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-forbidden-mysteries-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'the Wisdom of Solomon 14:23 — *For while they slew their children in sacrifices, or used secret ceremonies, or made revellings of strange rites.* The "secret ceremonies" of Wisdom mirror the destroying mysteries the Watchers passed to women in Enoch 16:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-forbidden-mysteries-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* The forbidden teaching of Enoch 16:3 is the same privily-brought ruin Peter warns will work destruction in the last days.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-forbidden-mysteries-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-16-origin-evil-spirits-no-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, bodiless wanderer Yahusha describes is the giant-spirit Enoch 16 inherits from the slain Watchers'' offspring, hungering without flesh of its own.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-origin-evil-spirits-no-rest'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The destruction the spirits work in Enoch 16:3 is the same evil-spirit campaign Yahusha says worsens the one it inhabits.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-origin-evil-spirits-no-rest'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter affirms the Watchers'' binding that stands behind Enoch 16''s loosed evil spirits — the fallen ones chained, reserved unto the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-origin-evil-spirits-no-rest'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-16-no-peace-petition-refused
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The "no peace" verdict of Enoch 16:4 is the closing door of Genesis 6:3 — a fixed term granted, then judgement, with no reprieve for corrupted flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-no-peace-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* Jude cites Enoch by name; the "no peace" of 16:4 is the near edge of the coming-in-judgement Enoch prophesied.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-no-peace-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The refused petition of Enoch 16:4 anticipates this executed judgment Jude draws straight from Enoch''s own words.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-no-peace-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_17.sql (session250 1-enoch 17) -----
-- Source anchor: enoch/1-enoch ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en17 (view _session250_en17_lookup). Sort band base 50400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-17-place-of-fire-river-of-fire
  ('enoch', '1-enoch', 17, 1, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The people who appear as flaming fire and then as men (1 Enoch 17:1) are the canon''s own fire-ministers of Yahuah.'),
  ('enoch', '1-enoch', 17, 4, 'canon', 'deuteronomy', 32, 22, 'free', E'Deuteronomy 32:22 — *For a fire is kindled in mine anger, and shall burn unto the lowest hell, and shall consume the earth with her increase, and set on fire the foundations of the mountains.* The river of fire that flows like water (1 Enoch 17:4) is the same kindled fire Moses says burns to the lowest depths.'),
  ('enoch', '1-enoch', 17, 3, 'canon', 'psalms', 18, 14, 'free', E'Psalms 18:14 — *Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them.* The fiery bow, arrows and lightnings Enoch sees stored in the depths (1 Enoch 17:3) are Yahuah''s own weaponry of judgement.'),
  -- thread: 1-enoch-17-great-darkness-waters-of-the-deep
  ('enoch', '1-enoch', 17, 5, 'canon', 'job', 38, 16, 'free', E'Job 38:16 — *Hast thou entered into the springs of the sea? or hast thou walked in the search of the depth?* The place where no flesh walks and the waters of the deep (1 Enoch 17:5-6) are the springs of the sea Yahuah challenges Job to enter.'),
  ('enoch', '1-enoch', 17, 6, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The treasuries of winter''s darkness and the waters of the deep that Enoch sees (1 Enoch 17:6) are the hidden treasures Yahuah keeps from Job.'),
  ('enoch', '1-enoch', 17, 8, 'canon', 'psalms', 104, 2, 'free', E'Psalms 104:2 — *Who coverest thyself with light as with a garment: who stretchest out the heavens like a curtain:* The wisdom by which He ordered all creation and founded the world (1 Enoch 17:8) is the psalm''s God who stretches out the heavens.'),
  -- thread: 1-enoch-17-cornerstone-four-winds-pillars
  ('enoch', '1-enoch', 17, 9, 'canon', 'job', 38, 6, 'free', E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch is shown (1 Enoch 17:9) is the very corner stone Yahuah challenges Job to name.'),
  ('enoch', '1-enoch', 17, 10, 'canon', 'job', 26, 11, 'free', E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* The winds that stand between heaven and earth as the pillars of the heaven (1 Enoch 17:10) are Job''s pillars of heaven that tremble before Yahuah.'),
  ('enoch', '1-enoch', 17, 9, 'canon', 'psalms', 104, 5, 'free', E'Psalms 104:5 — *Who laid the foundations of the earth, that it should not be removed for ever.* The four winds that bear the earth (1 Enoch 17:9) uphold the same unmoveable foundation the psalm ascribes to Yahuah.'),
  -- thread: 1-enoch-17-throne-mountain-of-sapphire
  ('enoch', '1-enoch', 17, 15, 'canon', 'exodus', 24, 10, 'free', E'Exodus 24:10 — *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* The throne-mountain topped with sapphire (1 Enoch 17:15) matches the sapphire pavement the elders saw beneath Yahuah on the mountain.'),
  ('enoch', '1-enoch', 17, 15, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire summit of Enoch''s throne-mountain (1 Enoch 17:15) is the same sapphire throne Ezekiel saw above the firmament.'),
  -- thread: 1-enoch-17-prison-of-the-stars-bound-till-judgement
  ('enoch', '1-enoch', 17, 21, 'enoch', '1-enoch', 21, 7, 'extras', E'1 Enoch 21:7 — *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* Enoch revisits the same prison of the stars later in the journey, repeating the binding-till-judgement of 1 Enoch 17:21 word for word.'),
  ('enoch', '1-enoch', 17, 20, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars are bound because they transgressed the commandment and missed their appointed times (1 Enoch 17:20) — they broke the very decree the psalm says shall not pass.'),
  ('enoch', '1-enoch', 17, 19, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* The prison for the stars and the host of heaven (1 Enoch 17:19) is Jude''s wandering stars reserved to the blackness of darkness.'),
  ('enoch', '1-enoch', 17, 21, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The host bound till their guilt is consummated (1 Enoch 17:21) is Peter''s angels reserved in chains of darkness unto judgement.'),
  ('enoch', '1-enoch', 17, 19, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Enoch''s prison for the host of heaven (1 Enoch 17:19) is Isaiah''s host of the high ones shut up and visited after many days.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-place-of-fire-river-of-fire',
       E'The place of fire and the river of fire',
       E'Enoch''s cosmic journey opens in fire: *And they took me to a place in which people were like flaming fire, and, when they wished, they appeared as men.* (1 Enoch 17:1) — and on to *the river of fire in which the fire flows like water and discharges itself into the great sea towards the west.* (1 Enoch 17:4), with *a fiery bow, arrows and their quiver, a fiery sword and all the lightnings.* (1 Enoch 17:3). It ain''t new. The Tanakh already knows the ministers of Yahuah as fire: *Who maketh his angels spirits; his ministers a flaming fire:* (Psalms 104:4) — the very fire-men Enoch sees. The kindled fire that runs to the depths is Moses'' own warning: *For a fire is kindled in mine anger, and shall burn unto the lowest hell, and shall consume the earth with her increase, and set on fire the foundations of the mountains.* (Deuteronomy 32:22). And the fiery bow and lightnings are the LORD''s arsenal in the psalm: *Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them.* (Psalms 18:14). The Watcher-host has rebelled against the Creator''s order, but the fire and the arrows belong to Yahuah, not to them — the weaponry of judgement is His.',
       sv.verse_id, ev.verse_id, 'extras', 50400
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-great-darkness-waters-of-the-deep',
       E'The great darkness and the waters of the deep',
       E'Enoch passes *to the great darkness, and went to the place where no flesh walks* (1 Enoch 17:5), sees *the place whence all the waters of the deep flow* (1 Enoch 17:6) and *the mouth of the deep* (1 Enoch 17:7), then confesses the design behind it all: *I saw how He has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 17:8). It ain''t new — this is the very tour Yahuah gives Job out of the whirlwind. The place no flesh walks is the door Job never entered: *Hast thou entered into the springs of the sea? or hast thou walked in the search of the depth?* (Job 38:16). The treasuries Enoch keeps seeing are Job''s hidden stores: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* (Job 38:22). And the wisdom that ordered and founded the world is the psalmist''s God who *stretchest out the heavens like a curtain: Who layeth the beams of his chambers in the waters* (Psalms 104:2-3 — quoted of v2). The Creator''s wise ordering stands; the Watchers transgressed it but could not unmake it.',
       sv.verse_id, ev.verse_id, 'extras', 50403
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-cornerstone-four-winds-pillars',
       E'The cornerstone of the earth and the pillars of heaven',
       E'The journey shows Enoch the structure of the world: *And I saw the cornerstone of the earth: then I saw the four winds which bear the earth and the firmament of the heaven.* (1 Enoch 17:9), how *the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 17:10). It ain''t new. Job is asked the same questions from the whirlwind: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* (Job 38:4), and *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* (Job 38:6) — Enoch is shown the very cornerstone Job could not name. The pillars are Job''s too: *The pillars of heaven tremble and are astonished at his reproof.* (Job 26:11). And the unmoveable foundation is the psalm''s: *Who laid the foundations of the earth, that it should not be removed for ever.* (Psalms 104:5). The Creator''s architecture holds the cosmos in place — the same wise order the rebel host could not overthrow.',
       sv.verse_id, ev.verse_id, 'extras', 50406
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-throne-mountain-of-sapphire',
       E'The throne-mountain of sapphire',
       E'Among the seven mountains of precious stones Enoch sees one that towers above the rest: *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 17:15). It ain''t new — the sapphire throne is the canon''s own vision of the place of Yahuah. When the elders of Yashar''el went up the mountain they saw it underfoot: *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* (Exodus 24:10). And Ezekiel, lifted to the firmament, saw the throne itself: *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone* (Ezekiel 1:26). Enoch''s middle mountain is no pagan peak — it is shaped like the sapphire throne the Tanakh already knows, the seat of the Creator whose order the journey everywhere displays.',
       sv.verse_id, ev.verse_id, 'extras', 50409
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-prison-of-the-stars-bound-till-judgement',
       E'The prison of the stars bound till judgement',
       E'Beyond the waste place Enoch sees the prison-house of the rebel host: *I saw there seven stars like great burning mountains... ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 17:19), *the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 17:20), and *He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 17:21). It ain''t new — and Enoch himself sees it again, word for word: *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 21:7). Their crime is breaking the Creator''s fixed order, the decree the psalm says the stars cannot transgress: *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalms 148:6). The NT carries the binding forward as settled doctrine — these are the *wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13), the *angels that sinned... cast... down to hell, and delivered... into chains of darkness, to be reserved unto judgment:* (2 Peter 2:4). Isaiah names the same prison and the same delayed reckoning: *Yahuah (LORD) shall punish the host of the high ones that are on high... they shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:21 — quoted of v21). The host is not destroyed but held — bound till the reckoning, exactly as Revelation binds the dragon (Revelation 20:2). Torah''s order stands; the rebellion against it awaits judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50412
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=19
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-17-place-of-fire-river-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The people who appear as flaming fire and then as men (1 Enoch 17:1) are the canon''s own fire-ministers of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-place-of-fire-river-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:22 — *For a fire is kindled in mine anger, and shall burn unto the lowest hell, and shall consume the earth with her increase, and set on fire the foundations of the mountains.* The river of fire that flows like water (1 Enoch 17:4) is the same kindled fire Moses says burns to the lowest depths.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-place-of-fire-river-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 18:14 — *Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them.* The fiery bow, arrows and lightnings Enoch sees stored in the depths (1 Enoch 17:3) are Yahuah''s own weaponry of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-place-of-fire-river-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-great-darkness-waters-of-the-deep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:16 — *Hast thou entered into the springs of the sea? or hast thou walked in the search of the depth?* The place where no flesh walks and the waters of the deep (1 Enoch 17:5-6) are the springs of the sea Yahuah challenges Job to enter.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-great-darkness-waters-of-the-deep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The treasuries of winter''s darkness and the waters of the deep that Enoch sees (1 Enoch 17:6) are the hidden treasures Yahuah keeps from Job.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-great-darkness-waters-of-the-deep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:2 — *Who coverest thyself with light as with a garment: who stretchest out the heavens like a curtain:* The wisdom by which He ordered all creation and founded the world (1 Enoch 17:8) is the psalm''s God who stretches out the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-great-darkness-waters-of-the-deep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-cornerstone-four-winds-pillars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch is shown (1 Enoch 17:9) is the very corner stone Yahuah challenges Job to name.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-cornerstone-four-winds-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* The winds that stand between heaven and earth as the pillars of the heaven (1 Enoch 17:10) are Job''s pillars of heaven that tremble before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-cornerstone-four-winds-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:5 — *Who laid the foundations of the earth, that it should not be removed for ever.* The four winds that bear the earth (1 Enoch 17:9) uphold the same unmoveable foundation the psalm ascribes to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-cornerstone-four-winds-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-throne-mountain-of-sapphire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:10 — *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* The throne-mountain topped with sapphire (1 Enoch 17:15) matches the sapphire pavement the elders saw beneath Yahuah on the mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-throne-mountain-of-sapphire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire summit of Enoch''s throne-mountain (1 Enoch 17:15) is the same sapphire throne Ezekiel saw above the firmament.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-throne-mountain-of-sapphire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-prison-of-the-stars-bound-till-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:7 — *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* Enoch revisits the same prison of the stars later in the journey, repeating the binding-till-judgement of 1 Enoch 17:21 word for word.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars are bound because they transgressed the commandment and missed their appointed times (1 Enoch 17:20) — they broke the very decree the psalm says shall not pass.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* The prison for the stars and the host of heaven (1 Enoch 17:19) is Jude''s wandering stars reserved to the blackness of darkness.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The host bound till their guilt is consummated (1 Enoch 17:21) is Peter''s angels reserved in chains of darkness unto judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Enoch''s prison for the host of heaven (1 Enoch 17:19) is Isaiah''s host of the high ones shut up and visited after many days.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_18.sql (session250 1-enoch 18) -----
-- Source anchor: enoch/1-enoch ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en18 (view _session250_en18_lookup). Sort band base 50425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-18-treasuries-of-the-winds
  ('enoch', '1-enoch', 18, 1, 'canon', 'jeremiah', 10, 12, 'free', E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The same founding-of-the-world-by-wisdom Enoch sees at 18:1, where He has ordered all creation by His wisdom.'),
  ('enoch', '1-enoch', 18, 1, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah names the very wind-treasuries Enoch is shown at 18:1.'),
  ('enoch', '1-enoch', 18, 1, 'canon', 'proverbs', 8, 28, 'free', E'Proverbs 8:28 — *When he established the clouds above: when he strengthened the fountains of the deep:* Wisdom stands at the founding Enoch tours at 18:1, where the world is ordered by His wisdom.'),
  ('enoch', '1-enoch', 18, 5, 'canon', 'psalms', 104, 3, 'free', E'Psalm 104:3 — *Who layeth the beams of his chambers in the waters: who maketh the clouds his chariot: who walketh upon the wings of the wind:* The same winds that carry the clouds in Enoch 18:5 bear the Creator Himself.'),
  -- thread: 1-enoch-18-cornerstone-and-pillars
  ('enoch', '1-enoch', 18, 2, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Creator''s question to Job is the very founding of the earth Enoch is permitted to see at 18:2.'),
  ('enoch', '1-enoch', 18, 2, 'canon', 'job', 38, 6, 'free', E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch sees at 18:2 is the one the Creator names to Job.'),
  ('enoch', '1-enoch', 18, 2, 'canon', 'job', 38, 7, 'free', E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* At the founding Enoch tours, the stars and the sons of Elohim still kept their order — before the stars of 18:13 transgressed it.'),
  ('enoch', '1-enoch', 18, 3, 'canon', 'proverbs', 8, 29, 'free', E'Proverbs 8:29 — *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth:* The pillars and stations of heaven Enoch sees fixed at 18:3 are the appointed foundations Wisdom witnessed laid.'),
  -- thread: 1-enoch-18-seven-stars-transgressed-their-times
  ('enoch', '1-enoch', 18, 13, 'canon', 'job', 38, 31, 'free', E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The fixed star-order Job cannot command is the very order the seven stars transgressed in Enoch 18:13.'),
  ('enoch', '1-enoch', 18, 13, 'canon', 'job', 38, 33, 'free', E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* The ordinances of heaven the stars broke by not coming forth at their appointed times (Enoch 18:13).'),
  ('enoch', '1-enoch', 18, 13, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s wandering stars, with darkness reserved, are Enoch''s stars that strayed from their appointed times and are bound (18:13-14).'),
  -- thread: 1-enoch-18-prison-of-the-stars-and-host
  ('enoch', '1-enoch', 18, 12, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The host of the high ones Isaiah sees punished is the host of heaven imprisoned in Enoch 18:12.'),
  ('enoch', '1-enoch', 18, 12, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prison-pit, holding the host until they are visited, is Enoch''s prison for the stars and the host of heaven (18:12), bound till their guilt is consummated (18:14).'),
  ('enoch', '1-enoch', 18, 14, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s angels reserved in chains unto judgment are the host Enoch sees bound till their guilt should be consummated (18:14).'),
  ('enoch', '1-enoch', 18, 14, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s reserved angels are the bound host of Enoch 18:14, kept under darkness unto the great-day reckoning.'),
  -- thread: 1-enoch-18-prison-of-the-angels-for-ever
  ('enoch', '1-enoch', 18, 18, 'enoch', '1-enoch', 21, 11, 'extras', E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s second tour names the very same prison of the angels he first reaches at 18:18, fixing it as a station of the cosmic order.'),
  ('enoch', '1-enoch', 18, 18, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The shut-up, sealed pit of John is the prison of the angels Enoch reaches at 18:18 — a holding, kept till the appointed time.'),
  ('enoch', '1-enoch', 18, 18, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The great-day reckoning toward which the imprisoned angels of Enoch 18:18 are held — the books opened, judgment by works.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-treasuries-of-the-winds',
       E'The treasuries of the winds — the world founded by wisdom',
       E'Enoch is shown the storehouses out of which the Creator orders the cosmos: *I saw the treasuries of all the winds: I saw how He has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 18:1). The canon keeps the same chambered winds and the same wisdom-founding. Jeremiah names the very storehouses Enoch saw — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* (Jeremiah 10:12) — *and bringeth forth the wind out of his treasures.* (Jeremiah 10:13). Wisdom herself stands at the founding in *When he established the clouds above: when he strengthened the fountains of the deep:* (Proverbs 8:28), and the winds bear the Creator in *who maketh the clouds his chariot: who walketh upon the wings of the wind:* (Psalm 104:3). This is the Creator''s order, not blind nature: the rebellion of the Watchers and the stars (later in this very chapter) is rebellion against THIS founding wisdom. It ain''t new — the wind-treasuries Enoch toured are the same the prophets and the psalmist confessed.',
       sv.verse_id, ev.verse_id, 'extras', 50425
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-cornerstone-and-pillars',
       E'The cornerstone of the earth and the pillars of heaven',
       E'Enoch is shown the load-bearing structure of the world: *And I saw the cornerstone of the earth: then I saw the four winds which bear the earth and the firmament of the heaven.* (1 Enoch 18:2), *And I saw how the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 18:3). This is the Creator''s catechism to Job, point for point. He demands, *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* (Job 38:4), and asks who laid *the corner stone thereof;* (Job 38:6) — the very cornerstone Enoch is shown — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* (Job 38:7). Wisdom set the same bound: *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth:* (Proverbs 8:29), and the psalmist confesses Him *Who laid the foundations of the earth, that it should not be removed for ever.* (Psalm 104:5). The point stands: the cosmos has a fixed, founded order — and the rebellion the chapter turns to next is a crime against this architecture, not a flaw in it.',
       sv.verse_id, ev.verse_id, 'extras', 50428
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-seven-stars-transgressed-their-times',
       E'The stars that did not come forth at their appointed times',
       E'The angel explains why the seven stars are bound: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 18:13), *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 18:14). Their sin is breaking the Creator''s fixed order — the very ordinances Job is asked whether he can command: *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31), *Canst thou bring forth Mazzaroth in his season? or canst thou guide Arcturus with his sons?* (Job 38:32), *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* (Job 38:33). The lights were appointed to keep their times (the moedim of Genesis 1:14); these refused, and Jude names their kind: *wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). This is the Watcher-pattern carried to the host of heaven — rebellion against the Creator''s order, not a fault in the order — and the ten-thousand-year binding is a held sentence, not annihilation.',
       sv.verse_id, ev.verse_id, 'extras', 50431
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-prison-of-the-stars-and-host',
       E'A prison for the stars and the host of heaven, held to the reckoning',
       E'At the end of heaven and earth Enoch is shown the holding-place of the rebel host: *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 18:12), and they are bound *till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 18:14). Isaiah sees the same host shut in the same pit and held to a later visitation: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Peter and Jude carry the same chains forward: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4), *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). The framework holds throughout: the rebel host is bound, not destroyed — held till the reckoning, just as Sheol holds the dead till they are visited.',
       sv.verse_id, ev.verse_id, 'extras', 50434
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-prison-of-the-angels-for-ever',
       E'The prison of the angels — held till the great day',
       E'Beyond the abyss Enoch comes to a place worse than the first: *And from thence I went to another place, which was still more horrible than the former, and I saw a horrible thing: a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire* (1 Enoch 18:15), and Uriel names it: *This place is the prison of the angels, and here they will be imprisoned for ever.* (1 Enoch 18:18). Enoch will be shown this same prison again — *And he said unto me: This place is the prison of the angels, and here they will be imprisoned for ever.* (1 Enoch 21:11) — confirming it as a fixed station of the cosmic order. Revelation shows the binding-and-holding pattern at the great reckoning: the rebel is *cast into the bottomless pit, and shut up, and set a seal upon him* (Revelation 20:3), and at last *the books were opened* and *the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). The framework stands: the abyss is a holding-prison, not the final sentence — the bound rebel host is kept until the judgment of the great day, the same reckoning that gives back the dead from Sheol.',
       sv.verse_id, ev.verse_id, 'extras', 50437
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-18-treasuries-of-the-winds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The same founding-of-the-world-by-wisdom Enoch sees at 18:1, where He has ordered all creation by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah names the very wind-treasuries Enoch is shown at 18:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:28 — *When he established the clouds above: when he strengthened the fountains of the deep:* Wisdom stands at the founding Enoch tours at 18:1, where the world is ordered by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 104:3 — *Who layeth the beams of his chambers in the waters: who maketh the clouds his chariot: who walketh upon the wings of the wind:* The same winds that carry the clouds in Enoch 18:5 bear the Creator Himself.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-cornerstone-and-pillars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Creator''s question to Job is the very founding of the earth Enoch is permitted to see at 18:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch sees at 18:2 is the one the Creator names to Job.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* At the founding Enoch tours, the stars and the sons of Elohim still kept their order — before the stars of 18:13 transgressed it.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:29 — *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth:* The pillars and stations of heaven Enoch sees fixed at 18:3 are the appointed foundations Wisdom witnessed laid.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-seven-stars-transgressed-their-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The fixed star-order Job cannot command is the very order the seven stars transgressed in Enoch 18:13.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-seven-stars-transgressed-their-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* The ordinances of heaven the stars broke by not coming forth at their appointed times (Enoch 18:13).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-seven-stars-transgressed-their-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s wandering stars, with darkness reserved, are Enoch''s stars that strayed from their appointed times and are bound (18:13-14).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-seven-stars-transgressed-their-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-prison-of-the-stars-and-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The host of the high ones Isaiah sees punished is the host of heaven imprisoned in Enoch 18:12.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prison-pit, holding the host until they are visited, is Enoch''s prison for the stars and the host of heaven (18:12), bound till their guilt is consummated (18:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s angels reserved in chains unto judgment are the host Enoch sees bound till their guilt should be consummated (18:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s reserved angels are the bound host of Enoch 18:14, kept under darkness unto the great-day reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-prison-of-the-angels-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s second tour names the very same prison of the angels he first reaches at 18:18, fixing it as a station of the cosmic order.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The shut-up, sealed pit of John is the prison of the angels Enoch reaches at 18:18 — a holding, kept till the appointed time.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The great-day reckoning toward which the imprisoned angels of Enoch 18:18 are held — the books opened, judgment by works.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_19.sql (session250 1-enoch 19) -----
-- Source anchor: enoch/1-enoch ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en19 (view _session250_en19_lookup). Sort band base 50450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-19-sacrificing-to-demons
  ('enoch', '1-enoch', 19, 1, 'canon', 'deuteronomy', 32, 17, 'free', E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Moses'' Song already names exactly what Enoch sees: men led astray into sacrificing to demons as gods, the very deception the Watchers planted.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'leviticus', 17, 7, 'free', E'Leviticus 17:7 — *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* The Torah forbids the demon-sacrifice Enoch 19:1 blames on the fallen Watchers — the covenant stands against the deception, never as a curse.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'psalms', 106, 37, 'free', E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalmist records how far the spirits'' deception led Yashar''el astray, the same demon-worship Enoch 19:1 traces to the angels who fell.'),
  ('enoch', '1-enoch', 19, 1, 'canon', '1-corinthians', 10, 20, 'free', E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Sha''ul carries Enoch 19:1''s verdict unbroken into the assembly: the idol is nothing, but a demon stands behind it.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same reserved host standing ''till the day of the great judgement'' that Uriel shows Enoch in 19:1.'),
  -- thread: 1-enoch-19-spirits-lead-men-astray
  ('enoch', '1-enoch', 19, 1, 'enoch', '1-enoch', 15, 8, 'extras', E'1 Enoch 15:8 — *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* Enoch''s own earlier vision identifies the form-shifting spirits of 19:1 as the earth-bound evil spirits sprung from the dead giants.'),
  ('enoch', '1-enoch', 19, 1, 'enoch', '1-enoch', 15, 10, 'extras', E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* This is the defiling and leading-astray of mankind that Uriel shows Enoch in 19:1, the same spirits at work.'),
  ('enoch', '1-enoch', 19, 1, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees records the very leading-astray of mankind that Enoch 19:1 foresees, the spirits of the dead giants at their deceiving work.'),
  ('enoch', '1-enoch', 19, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Kepha confirms Enoch 19:1''s frame: the fallen angels stand bound, reserved unto the day of the great judgement.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'revelation', 9, 20, 'free', E'Revelation 9:20 — *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:* The demon-worship the Watchers seeded in Enoch 19:1 persists unrepented to the very end, just before the reckoning closes.'),
  -- thread: 1-enoch-19-women-became-sirens
  ('enoch', '1-enoch', 19, 2, 'enoch', '1-enoch', 16, 3, 'extras', E'1 Enoch 16:3 — *And these things have ye shown to women, and through these mysteries women and men work much destruction on earth.* Enoch''s own word explains why the women of 19:2 become agents of destruction: the Watchers taught them the forbidden mysteries.'),
  ('enoch', '1-enoch', 19, 2, 'canon', 'psalms', 106, 28, 'free', E'Psalms 106:28 — *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* The seductive snare into demon-sacrifice that Enoch 19:2 pictures as sirens is the same trap that drew Yashar''el to Baal-peor and the sacrifices of the dead.'),
  ('enoch', '1-enoch', 19, 2, 'canon', '1-corinthians', 10, 21, 'free', E'1 Corinthians 10:21 — *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* Sha''ul draws the line the siren-song of Enoch 19:2 blurs: there is no fellowship between the Lord''s table and the table of devils.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-19-sacrificing-to-demons',
       E'They sacrificed to demons, not to Elohim',
       E'Uriel shows Enoch the place of the bound rebel host: *And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* (1 Enoch 19:1). This is no innovation of Enoch''s — it is the verdict Moses already sang against a forgetful Yashar''el: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). The Torah even names the place of the cure, the door of the tabernacle, *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* (Leviticus 17:7) — the covenant stands, and the Watchers'' deception is rebellion against the Creator''s own order. The Psalmist records how deep the snare ran: *Yea, they sacrificed their sons and their daughters unto devils,* (Psalms 106:37). Sha''ul carries the same line forward into the assembly, unbroken: *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* (1 Corinthians 10:20). And the bound host stand only *till the day of the great judgement* — the same reserving-until-the-reckoning that the apostles preached: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). It ain''t new: from Sinai to Corinth to the abyss, the demons behind the idols and the day of their end are one testimony.',
       sv.verse_id, ev.verse_id, 'extras', 50450
  FROM _session250_en19_lookup sv, _session250_en19_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-19-spirits-lead-men-astray',
       E'The spirits that lead men astray, held till the reckoning',
       E'Enoch sees that the Watchers'' *spirits assuming many different forms are defiling mankind and shall lead them astray* (1 Enoch 19:1), and Enoch has already been told where those spirits came from: *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* (1 Enoch 15:8) — the disembodied dead of the giants, who *shall rise up against the children of men* (1 Enoch 15:10) until the consummation. Jubilees tells the same history plainly: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* (Jubilees 10:1), a tenth part left under Mastema to work that deception until the judgment. The deceiving spirits and idols persist to the very end, and men still will not turn: *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:* (Revelation 9:20). And the same apostolic frame holds them reserved: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). The seed-war that began on Hermon runs through every page — and it ends not in the spirits'' victory but in their being made an end of.',
       sv.verse_id, ev.verse_id, 'extras', 50453
  FROM _session250_en19_lookup sv, _session250_en19_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-19-women-became-sirens',
       E'The women became sirens — destruction through the mysteries',
       E'Uriel''s vision closes the matter of the wives: *And the women also of the angels who went astray shall become sirens.''* (1 Enoch 19:2). The judgement falls not only on the Watchers but on the corruption channeled through the women they took — Enoch was already shown that *these things have ye shown to women, and through these mysteries women and men work much destruction on earth.* (1 Enoch 16:3). The pattern is woven through the Tanakh: when Yashar''el *joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* (Psalms 106:28), the seduction into demon-sacrifice ran by exactly this snare. Sha''ul names the spirits behind it for the assembly: *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* (1 Corinthians 10:21). The siren is the lie made beautiful — but its singers, like those who taught them, *shall stand, till the day of the great judgement* (1 Enoch 19:1).',
       sv.verse_id, ev.verse_id, 'extras', 50456
  FROM _session250_en19_lookup sv, _session250_en19_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=19 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-19-sacrificing-to-demons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Moses'' Song already names exactly what Enoch sees: men led astray into sacrificing to demons as gods, the very deception the Watchers planted.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:7 — *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* The Torah forbids the demon-sacrifice Enoch 19:1 blames on the fallen Watchers — the covenant stands against the deception, never as a curse.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalmist records how far the spirits'' deception led Yashar''el astray, the same demon-worship Enoch 19:1 traces to the angels who fell.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Sha''ul carries Enoch 19:1''s verdict unbroken into the assembly: the idol is nothing, but a demon stands behind it.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same reserved host standing ''till the day of the great judgement'' that Uriel shows Enoch in 19:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-19-spirits-lead-men-astray
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* Enoch''s own earlier vision identifies the form-shifting spirits of 19:1 as the earth-bound evil spirits sprung from the dead giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* This is the defiling and leading-astray of mankind that Uriel shows Enoch in 19:1, the same spirits at work.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees records the very leading-astray of mankind that Enoch 19:1 foresees, the spirits of the dead giants at their deceiving work.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Kepha confirms Enoch 19:1''s frame: the fallen angels stand bound, reserved unto the day of the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 9:20 — *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:* The demon-worship the Watchers seeded in Enoch 19:1 persists unrepented to the very end, just before the reckoning closes.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-19-women-became-sirens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 16:3 — *And these things have ye shown to women, and through these mysteries women and men work much destruction on earth.* Enoch''s own word explains why the women of 19:2 become agents of destruction: the Watchers taught them the forbidden mysteries.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-women-became-sirens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 106:28 — *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* The seductive snare into demon-sacrifice that Enoch 19:2 pictures as sirens is the same trap that drew Yashar''el to Baal-peor and the sacrifices of the dead.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-women-became-sirens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 10:21 — *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* Sha''ul draws the line the siren-song of Enoch 19:2 blurs: there is no fellowship between the Lord''s table and the table of devils.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-women-became-sirens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_20.sql (session250 1-enoch 20) -----
-- Source anchor: enoch/1-enoch ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en20 (view _session250_en20_lookup). Sort band base 50475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-20-seven-holy-angels-who-watch
  ('enoch', '1-enoch', 20, 1, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Tobit names the same sevenfold company of holy angels that Enoch lists, and names Raphael among them, exactly as 1 Enoch 20:1 introduces the seven who watch.'),
  ('enoch', '1-enoch', 20, 1, 'canon', 'revelation', 8, 2, 'free', E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John sees the same seven standing before the throne that Enoch enumerates in 1 Enoch 20:1.'),
  ('enoch', '1-enoch', 20, 1, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The office of presenting the saints'' prayers — Raphael''s office among the seven — is shown at the altar, matching the watching host of 1 Enoch 20:1.'),
  -- thread: 1-enoch-20-michael-the-chief-prince
  ('enoch', '1-enoch', 20, 5, 'canon', 'daniel', 10, 13, 'free', E'Daniel 10:13 — *But the prince of the kingdom of Persia withstood me one and twenty days: but, lo, Michael, one of the chief princes, came to help me; and I remained there with the kings of Persia.* Daniel''s ''one of the chief princes'' is Enoch''s ''one of the holy and honoured angels'' set over the best part of mankind in 1 Enoch 20:5.'),
  ('enoch', '1-enoch', 20, 5, 'canon', 'daniel', 10, 21, 'free', E'Daniel 10:21 — *But I will shew thee that which is noted in the scripture of truth: and there is none that holdeth with me in these things, but Michael your prince.* Michael is ''your prince'' — set over the covenant people, the best part of mankind of 1 Enoch 20:5.'),
  ('enoch', '1-enoch', 20, 5, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Michael stands for the elect at the judgement, the very office Enoch assigns him over the best part of mankind in 1 Enoch 20:5.'),
  ('enoch', '1-enoch', 20, 5, 'canon', 'revelation', 12, 7, 'free', E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* Michael''s office over chaos in 1 Enoch 20:5 is shown as open war against the dragon and the rebel host.'),
  ('enoch', '1-enoch', 20, 5, 'enoch', '1-enoch', 40, 9, 'extras', E'1 Enoch 40:9 — *And he said unto me: ‘This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.’* Enoch names Michael first again among the archangels, the same honoured prince of 1 Enoch 20:5.'),
  -- thread: 1-enoch-20-gabriel-stands-in-the-presence
  ('enoch', '1-enoch', 20, 7, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel, named among the holy angels in 1 Enoch 20:7, stands in the divine presence in the Gospel exactly as one of Enoch''s seven who watch.'),
  ('enoch', '1-enoch', 20, 7, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The Cherubim over Paradise that Gabriel is set above in 1 Enoch 20:7 are the very Cherubim posted to guard Eden''s tree of life.'),
  ('enoch', '1-enoch', 20, 7, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Paradise Gabriel guards in 1 Enoch 20:7 is restored as the tree of life in the New Jerusalem.'),
  ('enoch', '1-enoch', 20, 7, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The ''paradise of Elohim'' the overcomer inherits is the very Paradise Gabriel is set over in 1 Enoch 20:7.'),
  -- thread: 1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries
  ('enoch', '1-enoch', 20, 4, 'enoch', '1-enoch', 21, 5, 'extras', E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Raguel''s vengeance on the world of the luminaries in 1 Enoch 20:4 is the binding of the transgressing stars Enoch sees imprisoned one chapter later.'),
  ('enoch', '1-enoch', 20, 4, 'enoch', '1-enoch', 21, 6, 'extras', E'1 Enoch 21:6 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* The luminaries Raguel takes vengeance on in 1 Enoch 20:4 are these stars that broke their appointed order.'),
  ('enoch', '1-enoch', 20, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* the ''hell'' here is Tartarus, the very place Uriel is set over in 1 Enoch 20:2 where the rebel angels are held until judgement.'),
  ('enoch', '1-enoch', 20, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The chained host reserved for judgement is held in the Tartarus Uriel oversees in 1 Enoch 20:2.'),
  ('enoch', '1-enoch', 20, 4, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s transgressing luminaries that Raguel takes vengeance on in 1 Enoch 20:4.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-seven-holy-angels-who-watch',
       E'The seven holy angels who watch',
       E'Enoch''s guide names the heavenly host that attends the throne: *And these are the names of the holy angels who watch.* (1 Enoch 20:1) — seven offices set in order under the Creator. The canon shows the same seven standing before Elohim and bearing the prayers of the saints: when Raphael unveils himself to Tobit he says *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15) — the very count Enoch gives, with the very office. John sees that company at the seventh seal: *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* (Revelation 8:2), and the angel at the altar bears *the prayers of all saints upon the golden altar which was before the throne.* (Revelation 8:3) These are watchers who *kept* their estate — the loyal host serving the Creator''s order — in deliberate contrast to the fallen Watchers of chapters 6–16. It ain''t new: the sevenfold attending host is canon, not invention.',
       sv.verse_id, ev.verse_id, 'extras', 50475
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-michael-the-chief-prince',
       E'Michael, set over the best part of mankind',
       E'Of the seven, Enoch singles out one: *Michael, one of the holy and honoured angels, who is set over the best part of mankind and over chaos.* (1 Enoch 20:5) Daniel knows him by name and office — the prince who contends for Yahuah''s covenant people: *but, lo, Michael, one of the chief princes, came to help me* (Daniel 10:13), *there is none that holdeth with me in these things, but Michael your prince* (Daniel 10:21), and at the end *at that time shall Michael stand up, the great prince which standeth for the children of thy people* (Daniel 12:1) — set over the elect, the very ''best part of mankind'' Enoch names. Revelation shows that same prince at war against the rebel host: *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels* (Revelation 12:7). And Enoch himself names Michael again among the four — *This first is Michael, the merciful and long-suffering* (1 Enoch 40:9). This is not a replacement of Israel by another people: Michael stands FOR the children of Daniel''s people, the covenant nation gathered and kept. The honoured prince of the loyal host guards the elect against the dragon''s seed-war until the reckoning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50478
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-gabriel-stands-in-the-presence',
       E'Gabriel, over Paradise and the Cherubim',
       E'Enoch sets one angel over the garden and its guardians: *Gabriel, one of the holy angels, who is over Paradise and the serpents and the Cherubim.* (1 Enoch 20:7) The Cherubim over Paradise are no invention — they were posted at Eden''s gate to guard the way to the tree of life: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24) Gabriel is the same angel who stands in the divine presence and is sent to announce: *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19) Enoch names him a third time among the four: *the third, who is set over all the powers, is Gabriel* (1 Enoch 40:9). The Paradise he guards is not lost but restored — the tree of life returns in the New Jerusalem: *In the midst of the street of it, and on either side of the river, was there the tree of life* (Revelation 22:2); *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). Eden barred is Eden restored. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50481
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries',
       E'Uriel and Raguel — over Tartarus and the transgressing lights',
       E'Two of the seven are set over the place of binding and over the order of the lights: *Uriel, one of the holy angels, who is over the world and over Tartarus.* (1 Enoch 20:2) and *Raguel, one of the holy angels who takes vengeance on the world of the luminaries.* (1 Enoch 20:4) Tartarus is the prison Enoch has already shown — the abyss where the rebel host is bound: *This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven* (1 Enoch 21:5), the stars *which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 21:6) — Raguel''s ''vengeance on the world of the luminaries'' is precisely the binding of the lights that broke their appointed order. The canon names this very prison and this very office of guarding it until the reckoning: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4) — the word rendered ''cast down to hell'' is *tartaroo*, Uriel''s Tartarus — and *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), the *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13). The rebel host is held, not annihilated — bound till judgement, the way Sheol holds the dead till the reckoning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50484
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-20-seven-holy-angels-who-watch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Tobit names the same sevenfold company of holy angels that Enoch lists, and names Raphael among them, exactly as 1 Enoch 20:1 introduces the seven who watch.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-seven-holy-angels-who-watch'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John sees the same seven standing before the throne that Enoch enumerates in 1 Enoch 20:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-seven-holy-angels-who-watch'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The office of presenting the saints'' prayers — Raphael''s office among the seven — is shown at the altar, matching the watching host of 1 Enoch 20:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-seven-holy-angels-who-watch'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-20-michael-the-chief-prince
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 10:13 — *But the prince of the kingdom of Persia withstood me one and twenty days: but, lo, Michael, one of the chief princes, came to help me; and I remained there with the kings of Persia.* Daniel''s ''one of the chief princes'' is Enoch''s ''one of the holy and honoured angels'' set over the best part of mankind in 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:21 — *But I will shew thee that which is noted in the scripture of truth: and there is none that holdeth with me in these things, but Michael your prince.* Michael is ''your prince'' — set over the covenant people, the best part of mankind of 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Michael stands for the elect at the judgement, the very office Enoch assigns him over the best part of mankind in 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* Michael''s office over chaos in 1 Enoch 20:5 is shown as open war against the dragon and the rebel host.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 40:9 — *And he said unto me: ‘This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.’* Enoch names Michael first again among the archangels, the same honoured prince of 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-20-gabriel-stands-in-the-presence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel, named among the holy angels in 1 Enoch 20:7, stands in the divine presence in the Gospel exactly as one of Enoch''s seven who watch.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The Cherubim over Paradise that Gabriel is set above in 1 Enoch 20:7 are the very Cherubim posted to guard Eden''s tree of life.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Paradise Gabriel guards in 1 Enoch 20:7 is restored as the tree of life in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The ''paradise of Elohim'' the overcomer inherits is the very Paradise Gabriel is set over in 1 Enoch 20:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Raguel''s vengeance on the world of the luminaries in 1 Enoch 20:4 is the binding of the transgressing stars Enoch sees imprisoned one chapter later.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 21:6 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* The luminaries Raguel takes vengeance on in 1 Enoch 20:4 are these stars that broke their appointed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* the ''hell'' here is Tartarus, the very place Uriel is set over in 1 Enoch 20:2 where the rebel angels are held until judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The chained host reserved for judgement is held in the Tartarus Uriel oversees in 1 Enoch 20:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s transgressing luminaries that Raguel takes vengeance on in 1 Enoch 20:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_21.sql (session250 1-enoch 21) -----
-- Source anchor: enoch/1-enoch ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en21 (view _session250_en21_lookup). Sort band base 50500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-21-prison-of-the-stars
  ('enoch', '1-enoch', 21, 4, 'enoch', '1-enoch', 18, 12, 'extras', E'1 Enoch 18:12 — *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Enoch''s earlier journey shows the very same seven bound stars and the same prison-of-the-host that he revisits in 21:4-5.'),
  ('enoch', '1-enoch', 21, 5, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah names the same rebel host on high that Enoch sees imprisoned at the end of heaven and earth.'),
  ('enoch', '1-enoch', 21, 6, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The transgressing host is shut in the prison and held for a future visitation — exactly Enoch''s stars bound till their guilt is consummated.'),
  ('enoch', '1-enoch', 21, 6, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s stars that did not come forth at their appointed times, reserved for darkness.'),
  -- thread: 1-enoch-21-stars-out-of-their-appointed-times
  ('enoch', '1-enoch', 21, 6, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude calls the rebels ''wandering stars'' — the same image as Enoch''s stars that transgressed the commandment and did not keep their appointed times.'),
  ('enoch', '1-enoch', 21, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter ties the transgression directly to angels that sinned and are now held in chains till judgement, just as Enoch''s stars are bound for their guilt.'),
  -- thread: 1-enoch-21-prison-of-the-angels-for-ever
  ('enoch', '1-enoch', 21, 10, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude describes precisely the prison of the angels Uriel shows Enoch — reserved in chains for the judgement.'),
  ('enoch', '1-enoch', 21, 10, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter calls this same place the holding of the angels that sinned, cast down and reserved unto judgment — Enoch''s prison of the angels.'),
  ('enoch', '1-enoch', 21, 10, 'enoch', '1-enoch', 19, 1, 'extras', E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The same Uriel who guides Enoch names the term of this prison: the fallen angels stand here till the great judgement.'),
  ('enoch', '1-enoch', 21, 11, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prisoners shut in the pit and held for a later visitation match the angels imprisoned ''for ever'' until their reckoning.'),
  ('enoch', '1-enoch', 21, 11, 'canon', 'revelation', 20, 10, 'free', E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* Revelation names the final destiny that Enoch''s burning, blazing prison foreshadows — the eternal lake at the great judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-21-prison-of-the-stars',
       E'The prison for the stars and the host of heaven',
       E'Enoch is carried to the chaotic place at the edge of creation and shown the bound host: *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.’* (1 Enoch 21:5-7). It ain''t new — Enoch has already seen this very place once before, and the wording is the same: *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 18:12). The prophets carry the identical picture of a rebel host held in custody for the reckoning: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Jude reads the same rebellion onto the false teachers, calling them *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). These are not stray myths but the canon''s own order: the Creator''s command stands, the rebel powers are bound, and the judgement is fixed.',
       sv.verse_id, ev.verse_id, 'extras', 50500
  FROM _session250_en21_lookup sv, _session250_en21_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-21-stars-out-of-their-appointed-times',
       E'The stars that did not come forth at their appointed times',
       E'The charge against the bound stars is precise — they broke the Creator''s appointed order: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 21:6). The lights were set for the order of the seasons from the beginning, and to step out of that order is rebellion against the One who fixed it. So Jude reads the very same transgression onto men who likewise leave their station: *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). The sin here is not law itself but the breaking of the appointed way; the Creator''s command over the times stands, and the host that abandoned its place is held for judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50503
  FROM _session250_en21_lookup sv, _session250_en21_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-21-prison-of-the-angels-for-ever',
       E'The prison of the angels, kept till the eternal judgement',
       E'Enoch passes to a second, more terrible place and Uriel names it plainly: *’This place is the prison of the angels, and here they will be imprisoned for ever.’* (1 Enoch 21:10), set within *a great fire there which burnt and blazed, and the place was cleft as far as the abyss* (1 Enoch 21:8). This is the canon''s own holding-cell for the fallen Watchers. Jude says it of them exactly: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). Peter says the same: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Enoch himself has already heard the term of their imprisonment named by the same angel — *here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* (1 Enoch 19:1). And the end of that custody is the lake fixed in Revelation: *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* (Revelation 20:10). The bound host is real, held now, and reserved for a fixed reckoning — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50506
  FROM _session250_en21_lookup sv, _session250_en21_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-21-prison-of-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 18:12 — *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Enoch''s earlier journey shows the very same seven bound stars and the same prison-of-the-host that he revisits in 21:4-5.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah names the same rebel host on high that Enoch sees imprisoned at the end of heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The transgressing host is shut in the prison and held for a future visitation — exactly Enoch''s stars bound till their guilt is consummated.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s stars that did not come forth at their appointed times, reserved for darkness.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-21-stars-out-of-their-appointed-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude calls the rebels ''wandering stars'' — the same image as Enoch''s stars that transgressed the commandment and did not keep their appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-stars-out-of-their-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter ties the transgression directly to angels that sinned and are now held in chains till judgement, just as Enoch''s stars are bound for their guilt.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-stars-out-of-their-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-21-prison-of-the-angels-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude describes precisely the prison of the angels Uriel shows Enoch — reserved in chains for the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter calls this same place the holding of the angels that sinned, cast down and reserved unto judgment — Enoch''s prison of the angels.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The same Uriel who guides Enoch names the term of this prison: the fallen angels stand here till the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prisoners shut in the pit and held for a later visitation match the angels imprisoned ''for ever'' until their reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* Revelation names the final destiny that Enoch''s burning, blazing prison foreshadows — the eternal lake at the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_22.sql (session250 1-enoch 22) -----
-- Source anchor: enoch/1-enoch ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en22 (view _session250_en22_lookup). Sort band base 50525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-22-prison-of-the-angels
  ('enoch', '1-enoch', 22, 7, 'enoch', '1-enoch', 21, 5, 'extras', E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* The chapter-21 cell Enoch toured is the same prison of the angels named in Enoch 22:7.'),
  ('enoch', '1-enoch', 22, 7, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s chained, reserved angels are Enoch 22:7''s imprisoned host held for the great day.'),
  ('enoch', '1-enoch', 22, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same bound rebel angels Enoch sees imprisoned until the judgement.'),
  ('enoch', '1-enoch', 22, 4, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude keeps Enoch''s very image of the bound seven stars as fallen luminaries reserved in darkness (Enoch 22:4).'),
  -- thread: 1-enoch-22-hollow-places-of-the-dead
  ('enoch', '1-enoch', 22, 10, 'canon', 'luke', 16, 22, 'free', E'Luke 16:22 — *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* the two dead men gathered into one waiting-place match Enoch''s hollow places where all the souls of the children of men assemble.'),
  ('enoch', '1-enoch', 22, 9, 'canon', 'luke', 16, 26, 'free', E'Luke 16:26 — *And beside all this, between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence.* The fixed gulf in Sheol is Enoch''s separated hollow places, the righteous parted from the sinners (Enoch 22:9).'),
  -- thread: 1-enoch-22-abel-makes-his-suit
  ('enoch', '1-enoch', 22, 14, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* Enoch 22:14 names the very spirit whose crying blood Genesis records — Abel''s suit against Cain, still going up to heaven.'),
  ('enoch', '1-enoch', 22, 12, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Hebrews knows Abel''s blood still speaks — the petition Enoch sees the dead making (Enoch 22:12) — and answers it with a better word.'),
  ('enoch', '1-enoch', 22, 12, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' cry for vengeance is Enoch''s suit of the dead going forth to heaven (Enoch 22:12), still awaiting the appointed reckoning.'),
  -- thread: 1-enoch-22-righteous-spring-sinners-apart
  ('enoch', '1-enoch', 22, 16, 'canon', 'luke', 16, 25, 'free', E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Abraham''s divided estates — one comforted, one tormented — are Enoch''s separated hollows, the righteous at the bright spring and the sinner set apart (Enoch 22:16-17).'),
  ('enoch', '1-enoch', 22, 17, 'canon', 'numbers', 16, 30, 'free', E'Numbers 16:30 — *But if Yahuah (LORD) make a new thing, and the earth open her mouth, and swallow them up, with all that appertain unto them, and they go down quick into the pit; then ye shall understand that these men have provoked Yahuah (LORD).* The pit that swallows the rebels is the sinners'' portion Enoch sees set apart for those who provoked the Creator''s order (Enoch 22:17).'),
  ('enoch', '1-enoch', 22, 18, 'canon', 'numbers', 16, 33, 'free', E'Numbers 16:33 — *They, and all that appertained to them, went down alive into the pit, and the earth closed upon them: and they perished from among the congregation.* Korah''s company going down alive into the pit is the sinners shut away in pain till the great day Enoch describes (Enoch 22:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-prison-of-the-angels',
       E'The prison of the angels, reserved unto judgement',
       E'At the ends of the earth Enoch sees the holding-cell of the rebel host: *And there I saw seven stars of the heaven bound together like great mountains and burning with fire* (1 Enoch 22:4), and Uriel tells him, *This place is the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 22:7). This is the same waste place Enoch had just toured a chapter before — *this has become a prison for the stars and the host of heaven* (1 Enoch 21:5) — the Watchers and transgressing stars bound until the reckoning. It ain''t new: the apostles carry the very same picture. Peter writes that *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4), and Jude that *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6) — even keeping Enoch''s image of fallen luminaries, *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13). The rebel host that broke the Creator''s order is bound, not loosed; the binding is custody for the great-day judgement, not annihilation.',
       sv.verse_id, ev.verse_id, 'extras', 50525
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-hollow-places-of-the-dead',
       E'The hollow places where the dead are gathered till judgement',
       E'In the great mountain of the West Enoch finds the waiting-place of all the dead: *’These hollow places have been created for this very purpose, that the spirits of the souls of the dead should assemble therein, yea that all the souls of the children of men should assemble here* (1 Enoch 22:10), and they are held *until the day of their judgement and until their appointed period, till the great judgement comes upon them* (1 Enoch 22:11). The dead are not asleep in nothing nor already at the final verdict — they are gathered, conscious, and waiting. It ain''t new: Yahusha (Jesus) tells the same story. The beggar dies and *was carried by the angels into Abraham''s bosom: the rich man also died, and was buried* (Luke 16:22) — two estates in one holding-place — and between them runs Enoch''s very division: *between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence* (Luke 16:26). Sheol holds the dead apart, each according to his way, until the appointed reckoning; the grave is custody, not the final word.',
       sv.verse_id, ev.verse_id, 'extras', 50528
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-abel-makes-his-suit',
       E'Abel''s spirit still making suit till judgement',
       E'Among the gathered dead one spirit will not be silent: *I saw (the spirits of) the dead making suit, and their petition went forth to heaven* (1 Enoch 22:12), and Raphael names him — *This is the spirit which went forth from Abel, whom his brother Cain slew, and he makes his suit against him till his seed is destroyed from the face of the earth* (1 Enoch 22:14). It ain''t new: this is Genesis pressed open. From the very ground Yahuah (LORD) had already said, *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10) — a cry that does not stop at death but goes up as a suit for justice. The whole book of Hebrews knows that crying blood, setting against it a better word: the new covenant brings *the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). And the cry is not Abel''s alone — under the altar the martyrs make the same suit: *the souls of them that were slain for the word of Elohim (God)... cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:9-10). The blood of the righteous is held in remembrance and pleads from the holding-place until the great day answers it.',
       sv.verse_id, ev.verse_id, 'extras', 50531
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-righteous-spring-sinners-apart',
       E'The bright spring for the righteous, the sinners set apart',
       E'The hollows are not one undivided pit — they are sorted by the way each one walked: *These three have been made that the spirits of the dead might be separated. And such a division has been made (for) the spirits of the righteous, in which there is the bright spring of water* (1 Enoch 22:16), while *Here their spirits shall be set apart in this great pain till the great day of judgement* (1 Enoch 22:18) is the lot of the sinners on whom *judgement has not been executed... in their lifetime* (1 Enoch 22:17). It ain''t new: Abraham draws the same line for the rich man — *Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented* (Luke 16:25): the righteous comforted at the spring, the sinner in pain, divided by the way each kept. And the earth itself has swallowed the rebel living before — when Korah''s company *go down quick into the pit* (Numbers 16:30), they *went down alive into the pit, and the earth closed upon them: and they perished from among the congregation* (Numbers 16:33). The division is not arbitrary; it follows the covenant — the righteous who kept the way are held at the bright spring, the transgressors set apart in pain, all alike awaiting the great day of judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50534
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-22-prison-of-the-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* The chapter-21 cell Enoch toured is the same prison of the angels named in Enoch 22:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s chained, reserved angels are Enoch 22:7''s imprisoned host held for the great day.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same bound rebel angels Enoch sees imprisoned until the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude keeps Enoch''s very image of the bound seven stars as fallen luminaries reserved in darkness (Enoch 22:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-22-hollow-places-of-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:22 — *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* the two dead men gathered into one waiting-place match Enoch''s hollow places where all the souls of the children of men assemble.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-hollow-places-of-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:26 — *And beside all this, between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence.* The fixed gulf in Sheol is Enoch''s separated hollow places, the righteous parted from the sinners (Enoch 22:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-hollow-places-of-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-22-abel-makes-his-suit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* Enoch 22:14 names the very spirit whose crying blood Genesis records — Abel''s suit against Cain, still going up to heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-abel-makes-his-suit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Hebrews knows Abel''s blood still speaks — the petition Enoch sees the dead making (Enoch 22:12) — and answers it with a better word.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-abel-makes-his-suit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' cry for vengeance is Enoch''s suit of the dead going forth to heaven (Enoch 22:12), still awaiting the appointed reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-abel-makes-his-suit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-22-righteous-spring-sinners-apart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Abraham''s divided estates — one comforted, one tormented — are Enoch''s separated hollows, the righteous at the bright spring and the sinner set apart (Enoch 22:16-17).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-righteous-spring-sinners-apart'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:30 — *But if Yahuah (LORD) make a new thing, and the earth open her mouth, and swallow them up, with all that appertain unto them, and they go down quick into the pit; then ye shall understand that these men have provoked Yahuah (LORD).* The pit that swallows the rebels is the sinners'' portion Enoch sees set apart for those who provoked the Creator''s order (Enoch 22:17).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-righteous-spring-sinners-apart'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:33 — *They, and all that appertained to them, went down alive into the pit, and the earth closed upon them: and they perished from among the congregation.* Korah''s company going down alive into the pit is the sinners shut away in pain till the great day Enoch describes (Enoch 22:18).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-righteous-spring-sinners-apart'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_23.sql (session250 1-enoch 23) -----
-- Source anchor: enoch/1-enoch ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en23 (view _session250_en23_lookup). Sort band base 50550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-23-fire-that-feeds-the-sun
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 19, 4, 'free', E'Psalms 19:4 — *Their line is gone out through all the earth, and their words to the end of the world. In them hath he set a tabernacle for the sun,* the same sun for which Yahuah appointed a tabernacle is the one Enoch sees rolled round the whole earth by its surrounding fire.'),
  ('enoch', '1-enoch', 23, 2, 'canon', 'psalms', 19, 5, 'free', E'Psalms 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* the strong man who never tires to run his race is Enoch''s fire that ran without resting and paused not day or night.'),
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 19, 6, 'free', E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* the circuit to the ends of heaven is the very course of fire Enoch is shown at the west of the ends of the earth.'),
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* the fire that surrounds the sun is no rebel flame but a minister of Yahuah, set to its task like His flaming servants.'),
  ('enoch', '1-enoch', 23, 4, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* the sun knowing its going down is exactly the sun Raguel says the fire causes to set upon the whole earth.'),
  -- thread: 1-enoch-23-portals-and-chariots-of-the-lights
  ('enoch', '1-enoch', 23, 6, 'enoch', '1-enoch', 72, 3, 'extras', E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* the Astronomical Book lays down as the first law of the luminaries the very six portals Enoch glimpses here on his journey west.'),
  ('enoch', '1-enoch', 23, 5, 'enoch', '1-enoch', 72, 4, 'extras', E'1 Enoch 72:4 — *And the great one is their leader, the great luminary which is named the Sun, and its chariot on which it ascends is driven by the wind, and its chariot descends with wind.* the chariots running to the right and left of the sun are the wind-driven chariots Uriel names in the law of the luminaries.'),
  -- thread: 1-enoch-23-stars-keep-their-order
  ('enoch', '1-enoch', 23, 8, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the stars that rise and set in their own order keep the appointment Elohim gave the lights on the fourth day, for signs and seasons.'),
  ('enoch', '1-enoch', 23, 8, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* the stars do not change their course because Yahuah established them by a decree that shall not pass.'),
  ('enoch', '1-enoch', 23, 8, 'canon', 'jeremiah', 31, 36, 'free', E'Jeremiah 31:36 — *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* the stars never departing from their course is the sworn pledge that the seed of Yashar''el is never cast off before Yahuah.'),
  ('enoch', '1-enoch', 23, 8, 'enoch', '1-enoch', 75, 15, 'extras', E'1 Enoch 75:15 — *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* the stars that do not change their course do not transgress their commandments but complete their courses according to the law.'),
  ('enoch', '1-enoch', 23, 8, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* the unchanging order of the lights is appointed to mark the sabbaths, feasts, and seasons — the moedim by which the covenant is kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-23-fire-that-feeds-the-sun',
       E'The fire that runs without resting — the luminary''s flaming course',
       E'At the western ends of the earth Enoch sees *And I saw there a burning fire which ran without resting, and paused not from its course day or night but (ran) regularly.* (1 Enoch 23:2), and the angel Raguel names it: *This course of fire which thou hast seen is the fire which surrounds the sun, and which the sun rolls round upon the whole earth, and which the sun sets.* (1 Enoch 23:4). This is no strange revelation — it is the canon''s own ordained sun. Psalm 19 sees the same untiring runner: *In them hath he set a tabernacle for the sun,* (Psalms 19:4), *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* (Psalms 19:5), and *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* (Psalms 19:6) — the very ends-of-the-earth circuit Enoch is shown. Psalm 104 says the flame that surrounds is the servant of Yahuah, who *maketh his angels spirits; his ministers a flaming fire:* (Psalms 104:4) and who *appointed the moon for seasons: the sun knoweth his going down.* (Psalms 104:19). The fire does not burn loose; it serves an appointed course. The Watchers transgressed their order; the sun never does.',
       sv.verse_id, ev.verse_id, 'extras', 50550
  FROM _session250_en23_lookup sv, _session250_en23_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-23-portals-and-chariots-of-the-lights',
       E'The six portals and the chariots of the sun, moon, and stars',
       E'Enoch sees the machinery of the lights: *And I saw chariots in the heaven, running in the world above to the right and to the left of the sun.* (1 Enoch 23:5), and the gates they pass through — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them, and also many other chariots and their leaders.* (1 Enoch 23:6). This is not new even within Enoch — the Astronomical Book sets it down word for word as the *first law of the luminaries:* *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* (1 Enoch 72:3), and there too the great luminary''s *chariot on which it ascends is driven by the wind, and its chariot descends with wind.* (1 Enoch 72:4). The portals and the chariots are the appointed gates through which the lights keep the laws Uriel showed Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 50553
  FROM _session250_en23_lookup sv, _session250_en23_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=23 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-23-stars-keep-their-order',
       E'All the stars rise and set in their order — the decree that shall not pass',
       E'The chapter ends on the great witness of the created order: *And all the stars rise and set in their own order, and they do not change their course.* (1 Enoch 23:8). This is the Creator''s ordinance from the fourth day — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — and Psalm 148 commands these same obedient lights, *Praise ye him, sun and moon: praise him, all ye stars of light.* (Psalms 148:3), because *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalms 148:6). Within Enoch the closing law of the luminaries says it plainly: *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* (1 Enoch 75:15) — the exact mirror of the stars that do not change their course. And Yahuah binds this unbreakable order to the perpetuity of His people: He *giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35), and swears *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* (Jeremiah 31:36). The stars keeping their course is the standing pledge that the elect seed of Israel is never cast off — Torah and covenant stand as surely as the lights.',
       sv.verse_id, ev.verse_id, 'extras', 50556
  FROM _session250_en23_lookup sv, _session250_en23_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=23 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-23-fire-that-feeds-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 19:4 — *Their line is gone out through all the earth, and their words to the end of the world. In them hath he set a tabernacle for the sun,* the same sun for which Yahuah appointed a tabernacle is the one Enoch sees rolled round the whole earth by its surrounding fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* the strong man who never tires to run his race is Enoch''s fire that ran without resting and paused not day or night.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* the circuit to the ends of heaven is the very course of fire Enoch is shown at the west of the ends of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* the fire that surrounds the sun is no rebel flame but a minister of Yahuah, set to its task like His flaming servants.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* the sun knowing its going down is exactly the sun Raguel says the fire causes to set upon the whole earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-fire-that-feeds-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-23-portals-and-chariots-of-the-lights
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals, and the leaders of the stars and those whom they lead: six in the east and six in the west following them closely, and also many other when they are added to the six.* the Astronomical Book lays down as the first law of the luminaries the very six portals Enoch glimpses here on his journey west.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-portals-and-chariots-of-the-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 72:4 — *And the great one is their leader, the great luminary which is named the Sun, and its chariot on which it ascends is driven by the wind, and its chariot descends with wind.* the chariots running to the right and left of the sun are the wind-driven chariots Uriel names in the law of the luminaries.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-portals-and-chariots-of-the-lights'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-23-stars-keep-their-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the stars that rise and set in their own order keep the appointment Elohim gave the lights on the fourth day, for signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* the stars do not change their course because Yahuah established them by a decree that shall not pass.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:36 — *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* the stars never departing from their course is the sworn pledge that the seed of Yashar''el is never cast off before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 75:15 — *And the sun and the moon and the stars serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments, And they complete their courses according to the law.* the stars that do not change their course do not transgress their commandments but complete their courses according to the law.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=75 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* the unchanging order of the lights is appointed to mark the sabbaths, feasts, and seasons — the moedim by which the covenant is kept.'
  FROM cross_reference_threads t, cross_references x, _session250_en23_lookup sv, _session250_en23_lookup tv
 WHERE t.slug='1-enoch-23-stars-keep-their-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1enoch_24.sql (session250 1-enoch 24) -----
-- Source anchor: enoch/1-enoch ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en24 (view _session250_en24_lookup). Sort band base 50575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-24-throne-mountain-of-glory
  ('enoch', '1-enoch', 24, 9, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s fiery seat of the Ancient of days is Enoch''s throne-mountain (24:9), where the Eternal King will sit when He comes down to visit the earth.'),
  ('enoch', '1-enoch', 24, 9, 'canon', 'ezekiel', 28, 14, 'free', E'Ezekiel 28:14 — *Thou art the anointed cherub that covereth; and I have set thee so: thou wast upon the holy mountain of Elohim (God); thou hast walked up and down in the midst of the stones of fire.* Enoch''s throne-mountain (24:9) is the canon''s own holy mountain of Elohim, the Eden-sanctuary from which the covering cherub fell.'),
  ('enoch', '1-enoch', 24, 2, 'canon', 'ezekiel', 28, 13, 'free', E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* The precious, glorious stones of Enoch''s mountains (24:2) are the same Eden-stones that covered the holy mountain.'),
  ('enoch', '1-enoch', 24, 9, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* Jubilees counts Enoch''s throne-mountain (24:9) among Yahuah''s holy places on earth, sanctified in the new creation.'),
  ('enoch', '1-enoch', 24, 3, 'enoch', '1-enoch', 18, 8, 'extras', E'1 Enoch 18:8 — *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch had already seen this central throne-mountain among the seven on his earlier journey, the same height-excelling middle peak resembling the seat of a throne (24:3).'),
  -- thread: 1-enoch-24-fragrant-tree-of-life
  ('enoch', '1-enoch', 24, 4, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The unrivalled fragrant tree Enoch finds (24:4) is Eden''s tree of life, set from the beginning in the midst of the garden.'),
  ('enoch', '1-enoch', 24, 4, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The leaf and wood that *wither not for ever* (24:4) are Ezekiel''s sanctuary-trees whose leaf shall not fade and whose fruit feeds and heals.'),
  ('enoch', '1-enoch', 24, 4, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree Enoch is shown reserved at the holy mountain (24:4) is the tree of life promised to the overcomer in the paradise of Elohim.'),
  ('enoch', '1-enoch', 24, 4, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees the same tree of life with its perpetual fruit and healing leaves (24:4) standing at last in the New Jerusalem.'),
  ('enoch', '1-enoch', 24, 11, 'apocrypha', '2-esdras', 8, 52, 'extras', E'2 Esdras 8:52 — *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom.* 2 Esdras pairs the planted tree of life with the builded city exactly as Enoch''s tree is transplanted to the holy place, the temple of the Eternal King (24:11).'),
  -- thread: 1-enoch-24-tree-reserved-for-the-elect
  ('enoch', '1-enoch', 24, 11, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The right to Enoch''s reserved tree of life (24:11) belongs to those who do Yahuah''s commandments — Torah standing, the elect keeping the way into the holy place.'),
  ('enoch', '1-enoch', 24, 11, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Isaiah measures the elect''s days by a tree, exactly as Enoch''s tree gives *fruit for life to the elect* (24:11).'),
  ('enoch', '1-enoch', 24, 10, 'apocrypha', '2-esdras', 2, 12, 'extras', E'2 Esdras 2:12 — *They shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary.* The tree''s sweet-savour healing laid up for the righteous matches Enoch''s fragrant tree reserved till the great judgement, whose fragrance shall be in their bones (24:10).'),
  -- thread: 1-enoch-24-long-life-no-sorrow
  ('enoch', '1-enoch', 24, 12, 'canon', 'isaiah', 25, 8, 'free', E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The end of all sorrow and torment Enoch promises the elect (24:12) is Isaiah''s swallowing-up of death and wiping of every tear.'),
  ('enoch', '1-enoch', 24, 12, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* John''s restored creation where no sorrow or pain remains is Enoch''s promise that *no sorrow or plague or torment or calamity* shall touch the elect (24:12).'),
  ('enoch', '1-enoch', 24, 12, 'canon', 'revelation', 22, 3, 'free', E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him.* The lifted curse and the throne in the holy place answer Enoch''s long restful life entered into the holy place by the tree (24:12).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-throne-mountain-of-glory',
       E'The throne-mountain: the holy mountain of Elohim and the seat of the Eternal King',
       E'Enoch is led to seven magnificent mountains, and *the seventh mountain was in the midst of them, and it excelled them in height, resembling the seat of a throne: and fragrant trees encircled the mountain* (1 Enoch 24:3) — and Michael unveils what it is: *This high mountain which thou hast seen, whose summit is like the throne of Yahuah (God), is His throne, where the Holy Great One, Yahuah (God) of Glory, the Eternal King, will sit, when He shall come down to visit the earth with goodness* (1 Enoch 24:9). This is not a new picture. Daniel saw the same fiery seat — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And the throne stands on the holy mountain that was Eden''s first sanctuary: *thou wast upon the holy mountain of Elohim (God); thou hast walked up and down in the midst of the stones of fire* (Ezekiel 28:14) — the same Eden-mountain whose covering was *every precious stone... the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created* (Ezekiel 28:13), matching the magnificent stones of Enoch''s mountains. Jubilees names that very mountain among Yahuah''s holy places: *For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth* (Jubilees 4:25). And Enoch had already glimpsed this throne-mountain on his journey: *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 18:8). The mountain is the throne; the King who descends to it is the Creator returning to His holy place — Torah''s order standing, not overturned.',
       sv.verse_id, ev.verse_id, 'extras', 50575
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-fragrant-tree-of-life',
       E'The fragrant tree of life: Eden''s tree at the holy mountain',
       E'At the throne-mountain Enoch finds a tree unlike any other: *And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm* (1 Enoch 24:4). This is Eden''s own tree, planted in the beginning: *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil* (Genesis 2:9). Ezekiel saw it lining the river from the sanctuary, its undying leaf and unfailing fruit: *and by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the leaf thereof for medicine* (Ezekiel 47:12) — the leaves and wood that *wither not for ever.* The Spirit promises the overcomer this very tree at the end: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7); and John sees it standing in the restored city: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The book of 2 Esdras names the same hope — *for to you is paradise opened, the tree of life is planted, the time to come is prepared* (2 Esdras 8:52). One tree, from Eden''s midst to the New Jerusalem; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50578
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-tree-reserved-for-the-elect',
       E'Reserved till the great judgement: the tree given to the righteous and elect',
       E'The tree is sealed until the reckoning: *And as for this fragrant tree no mortal is permitted to touch it till the great judgement... To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King* (1 Enoch 24:10-11). The same gate stands at the end of Scripture: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14) — the right to the tree belongs to those who *do his commandments*, the Torah standing, election issuing in obedience, not obedience earning election. Isaiah measures the elect''s portion by that same tree: *they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands* (Isaiah 65:22) — the fruit that is *for life to the elect.* And 2 Esdras describes its healing virtue laid up for the righteous: *they shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary* (2 Esdras 2:12), the very fragrance Enoch says will be in their bones. The tree is not for the self-selected; it is *given* to a people chosen — the righteous and humble, the elect — after the judgement separates, and transplanted to Yahuah''s holy place.',
       sv.verse_id, ev.verse_id, 'extras', 50581
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-24-long-life-no-sorrow',
       E'Long life and no sorrow: the days of the fathers restored',
       E'Enoch closes with the blessing the tree secures for the elect: *Then shall they rejoice with joy and be glad, and into the holy place shall they enter; and its fragrance shall be in their bones, and they shall live a long life on earth, such as thy fathers lived: and in their days shall no sorrow or plague or torment or calamity touch them* (1 Enoch 24:12). The prophets sang the same end of sorrow: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it* (Isaiah 25:8). John saw it fulfilled in the restored creation: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4) — Enoch''s *no sorrow or plague or torment or calamity.* And the curse that shortened the patriarchs'' years is lifted at the throne where the tree stands: *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* (Revelation 22:3). The long life *such as thy fathers lived* is Eden''s span restored — the same end the whole canon awaits.',
       sv.verse_id, ev.verse_id, 'extras', 50584
  FROM _session250_en24_lookup sv, _session250_en24_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=24 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-24-throne-mountain-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s fiery seat of the Ancient of days is Enoch''s throne-mountain (24:9), where the Eternal King will sit when He comes down to visit the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 28:14 — *Thou art the anointed cherub that covereth; and I have set thee so: thou wast upon the holy mountain of Elohim (God); thou hast walked up and down in the midst of the stones of fire.* Enoch''s throne-mountain (24:9) is the canon''s own holy mountain of Elohim, the Eden-sanctuary from which the covering cherub fell.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* The precious, glorious stones of Enoch''s mountains (24:2) are the same Eden-stones that covered the holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:25 — *For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* Jubilees counts Enoch''s throne-mountain (24:9) among Yahuah''s holy places on earth, sanctified in the new creation.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 18:8 — *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch had already seen this central throne-mountain among the seven on his earlier journey, the same height-excelling middle peak resembling the seat of a throne (24:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-throne-mountain-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-24-fragrant-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The unrivalled fragrant tree Enoch finds (24:4) is Eden''s tree of life, set from the beginning in the midst of the garden.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The leaf and wood that *wither not for ever* (24:4) are Ezekiel''s sanctuary-trees whose leaf shall not fade and whose fruit feeds and heals.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree Enoch is shown reserved at the holy mountain (24:4) is the tree of life promised to the overcomer in the paradise of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees the same tree of life with its perpetual fruit and healing leaves (24:4) standing at last in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 8:52 — *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom.* 2 Esdras pairs the planted tree of life with the builded city exactly as Enoch''s tree is transplanted to the holy place, the temple of the Eternal King (24:11).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-fragrant-tree-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=8 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-24-tree-reserved-for-the-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The right to Enoch''s reserved tree of life (24:11) belongs to those who do Yahuah''s commandments — Torah standing, the elect keeping the way into the holy place.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-tree-reserved-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Isaiah measures the elect''s days by a tree, exactly as Enoch''s tree gives *fruit for life to the elect* (24:11).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-tree-reserved-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 2:12 — *They shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary.* The tree''s sweet-savour healing laid up for the righteous matches Enoch''s fragrant tree reserved till the great judgement, whose fragrance shall be in their bones (24:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-tree-reserved-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-24-long-life-no-sorrow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The end of all sorrow and torment Enoch promises the elect (24:12) is Isaiah''s swallowing-up of death and wiping of every tear.'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-long-life-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* John''s restored creation where no sorrow or pain remains is Enoch''s promise that *no sorrow or plague or torment or calamity* shall touch the elect (24:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-long-life-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him.* The lifted curse and the throne in the holy place answer Enoch''s long restful life entered into the holy place by the tree (24:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en24_lookup sv, _session250_en24_lookup tv
 WHERE t.slug='1-enoch-24-long-life-no-sorrow'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session250 — 1 Enoch cross-references complete.'
