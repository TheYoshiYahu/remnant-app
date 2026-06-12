-- =====================================================================
-- Session 253 — Tobit FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_tobit_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Tobit cross-references starting...'
BEGIN;

-- ----- fragment: minion_tobit_01.sql (session253 tobit 1) -----
-- Source anchor: apocrypha/tobit ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob1 (view _session253_tob1_lookup). Sort band base 59600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-1-naphtali-captive
  ('apocrypha', 'tobit', 1, 2, 'canon', '2-kings', 17, 6, 'free', E'2 Kings 17:6 — *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.* This is the same Assyrian deportation that swept Tobit of Naphtali into Nineveh in Tobit 1:2.'),
  ('apocrypha', 'tobit', 1, 1, 'canon', '2-kings', 17, 23, 'free', E'2 Kings 17:23 — *Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* Tobit of the tribe of Naphtali in Tobit 1:1 is one of the very exiles this verse buries in the nations.'),
  ('apocrypha', 'tobit', 1, 2, 'canon', 'deuteronomy', 28, 64, 'free', E'Deuteronomy 28:64 — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* Tobit''s captivity in Tobit 1:2 is Moses'' covenant warning come to pass upon the house of Israel.'),
  ('apocrypha', 'tobit', 1, 1, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The scattered tribe of Naphtali named in Tobit 1:1 is exactly the people Yahuah promises to regather, not to replace.'),
  -- thread: tobit-1-calf-vs-jerusalem
  ('apocrypha', 'tobit', 1, 5, 'canon', '1-kings', 12, 28, 'free', E'1 Kings 12:28 — *Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt.* Jeroboam''s calf is the very ''heifer Baal'' Tobit''s tribe sacrificed to in Tobit 1:5.'),
  ('apocrypha', 'tobit', 1, 4, 'canon', 'deuteronomy', 12, 11, 'free', E'Deuteronomy 12:11 — *Then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there; thither shall ye bring all that I command you; your burnt offerings, and your sacrifices, your tithes, and the heave offering of your hand, and all your choice vows which ye vow unto Yahuah (LORD):* This is the one chosen house of Jerusalem from which Naphtali fell in Tobit 1:4.'),
  -- thread: tobit-1-feasts-and-tithes
  ('apocrypha', 'tobit', 1, 7, 'canon', 'deuteronomy', 14, 22, 'free', E'Deuteronomy 14:22 — *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year.* This is the very tithe of increase Tobit faithfully renders in Tobit 1:7.'),
  ('apocrypha', 'tobit', 1, 7, 'canon', 'deuteronomy', 14, 23, 'free', E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* This is the second tenth Tobit carries up and spends every year at Jerusalem in Tobit 1:7.'),
  ('apocrypha', 'tobit', 1, 6, 'canon', 'numbers', 18, 21, 'free', E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* This is the first tenth Tobit gives to the priests, the children of Aaron, at the altar in Tobit 1:6.'),
  ('apocrypha', 'tobit', 1, 8, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The charity-tithe given ''to them to whom it was meet'' in Tobit 1:8 is the same alms-righteousness Tobit later commands his son.'),
  -- thread: tobit-1-kept-from-gentile-bread
  ('apocrypha', 'tobit', 1, 11, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Daniel''s refusal of the king''s defiling food in Babylon is the twin of Tobit keeping himself from the bread of the Gentiles in Tobit 1:11.'),
  -- thread: tobit-1-bread-to-hungry-burial
  ('apocrypha', 'tobit', 1, 16, 'canon', 'isaiah', 58, 7, 'free', E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* This is the fast Yahuah chooses, lived out exactly in Tobit''s bread to the hungry and clothes to the naked in Tobit 1:16-17.'),
  ('apocrypha', 'tobit', 1, 17, 'canon', 'matthew', 25, 35, 'free', E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The King''s reckoning of mercy at the judgment names the very deeds Tobit does for his nation in Tobit 1:17.'),
  ('apocrypha', 'tobit', 1, 16, 'apocrypha', 'tobit', 12, 9, 'extras', E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* Raphael''s word later in the book weighs the worth of the many alms Tobit gives his brothers in Tobit 1:16.'),
  ('apocrypha', 'tobit', 1, 17, 'canon', 'deuteronomy', 21, 23, 'free', E'Deuteronomy 21:23 — *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* Tobit''s secret burial of the slain in Tobit 1:17-18 keeps this very Torah command not to leave a body exposed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-1-naphtali-captive',
       E'Naphtali Carried Away — the Scattered House of Israel',
       E'Tobit names himself at the head of his book: *of the seed of Asael, of the tribe of Nephthali* (Tobit 1:1), and tells how *in the time of Enemessar king of the Assyrians* he *was led captive out of Thisbe... which is called properly Nephthali in Galilee above Aser* (Tobit 1:2). This is the northern ten tribes'' exile — the house of Israel scattered. The Kings record is the same hand: *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6) — the very Medes where Tobit will leave his silver in trust. *So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). Moses had foretold it word for word: *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64). Yet the scattering is never the last word — the two sticks are made one: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Tobit, captive in Nineveh, is the seed of that promised gathering.',
       sv.verse_id, ev.verse_id, 'extras', 59600
  FROM _session253_tob1_lookup sv, _session253_tob1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-1-calf-vs-jerusalem',
       E'The Heifer Baal Against the Chosen House',
       E'Tobit grieves that his own tribe broke from the temple: *all the tribe of Nephthali my father fell from the house of Jerusalem, which was chosen out of all the tribes of Yashar''el (Israel), that all the tribes should sacrifice there* (Tobit 1:4), and *all the tribes which together revolted, and the house of my father Nephthali, sacrificed to the heifer Baal* (Tobit 1:5). That heifer is Jeroboam''s golden calf, set up to keep the north from going up to worship: *Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). But the Torah had named one place only: *Then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there; thither shall ye bring all that I command you; your burnt offerings, and your sacrifices, your tithes* (Deuteronomy 12:11). Tobit holds to the chosen house while his nation runs to the calf — Torah kept while the house of Israel apostatizes.',
       sv.verse_id, ev.verse_id, 'extras', 59603
  FROM _session253_tob1_lookup sv, _session253_tob1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-1-feasts-and-tithes',
       E'The Feasts Kept, the Tithes Paid',
       E'Against the apostasy of his tribe, Tobit alone keeps the Torah: *But I alone went often to Jerusalem at the feasts, as it was ordained to all the people of Yashar''el (Israel) by an everlasting decree, having the firstfruits and tenths of increase, with that which was first shorn; and them gave I at the altar to the priests the children of Aaron* (Tobit 1:6). He keeps the threefold tithe to the letter: *The first tenth part of all increase I gave to the sons of Aaron, who ministered at Jerusalem: another tenth part I sold away, and went, and spent it every year at Jerusalem* (Tobit 1:7), and *the third I gave to them to whom it was meet* (Tobit 1:8). This is pure Torah obedience. The pilgrim-tithe spent at the feast: *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year* (Deuteronomy 14:22), eaten *before Yahuah Elohayka (the LORD thy God), in the place which he shall choose* (Deuteronomy 14:23). The priests'' tenth: *I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance* (Numbers 18:21). And the almsgiving Tobit later teaches his son: *Give alms of your substance; and when you give alms, let not your eye be envious* (Tobit 4:7) — the same hand keeping the same law in exile.',
       sv.verse_id, ev.verse_id, 'extras', 59606
  FROM _session253_tob1_lookup sv, _session253_tob1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-1-kept-from-gentile-bread',
       E'Kept From the Bread of the Gentiles',
       E'In Nineveh the kinsmen of the exile compromise, but Tobit will not: *when we were carried away captives to Nineve, all my brothers and those that were of my kindred did eat of the bread of the Gentiles* (Tobit 1:10), *But I kept myself from eating* (Tobit 1:11), *Because I remembered Yahuah (God) with all my heart* (Tobit 1:12). It is the same resolve another captive of the same scattering would make in a foreign king''s court: *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself* (Daniel 1:8). The covenant table is kept in the heart of the empire — Torah-faithfulness unto exile, never law as curse.',
       sv.verse_id, ev.verse_id, 'extras', 59609
  FROM _session253_tob1_lookup sv, _session253_tob1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-1-bread-to-hungry-burial',
       E'Bread to the Hungry, Burial for the Dead',
       E'Tobit''s righteousness is mercy made flesh: *in the time of Enemessar I gave many alms to my brothers, and gave my bread to the hungry* (Tobit 1:16), *And my clothes to the naked: and if I saw any of my nation dead, or cast about the walls of Nineve, I buried him* (Tobit 1:17), even risking the king''s wrath: *And if the king Sennacherib had slain any... I buried them privily* (Tobit 1:18). The prophet defines the true fast in the very words of Tobit''s mercy: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him* (Isaiah 58:7). The King at the judgment will own these same deeds: *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in* (Matthew 25:35). And Raphael will testify that such alms reach heaven: *For alms does deliver from death, and shall purge away all sin* (Tobit 12:9). Even the burial obeys Torah, which forbids leaving a body exposed: *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day* (Deuteronomy 21:23).',
       sv.verse_id, ev.verse_id, 'extras', 59612
  FROM _session253_tob1_lookup sv, _session253_tob1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-1-naphtali-captive
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 17:6 — *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.* This is the same Assyrian deportation that swept Tobit of Naphtali into Nineveh in Tobit 1:2.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-naphtali-captive'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 17:23 — *Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* Tobit of the tribe of Naphtali in Tobit 1:1 is one of the very exiles this verse buries in the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-naphtali-captive'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 28:64 — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* Tobit''s captivity in Tobit 1:2 is Moses'' covenant warning come to pass upon the house of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-naphtali-captive'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The scattered tribe of Naphtali named in Tobit 1:1 is exactly the people Yahuah promises to regather, not to replace.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-naphtali-captive'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-1-calf-vs-jerusalem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 12:28 — *Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt.* Jeroboam''s calf is the very ''heifer Baal'' Tobit''s tribe sacrificed to in Tobit 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-calf-vs-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 12:11 — *Then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there; thither shall ye bring all that I command you; your burnt offerings, and your sacrifices, your tithes, and the heave offering of your hand, and all your choice vows which ye vow unto Yahuah (LORD):* This is the one chosen house of Jerusalem from which Naphtali fell in Tobit 1:4.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-calf-vs-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-1-feasts-and-tithes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 14:22 — *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year.* This is the very tithe of increase Tobit faithfully renders in Tobit 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-feasts-and-tithes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* This is the second tenth Tobit carries up and spends every year at Jerusalem in Tobit 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-feasts-and-tithes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* This is the first tenth Tobit gives to the priests, the children of Aaron, at the altar in Tobit 1:6.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-feasts-and-tithes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The charity-tithe given ''to them to whom it was meet'' in Tobit 1:8 is the same alms-righteousness Tobit later commands his son.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-feasts-and-tithes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-1-kept-from-gentile-bread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Daniel''s refusal of the king''s defiling food in Babylon is the twin of Tobit keeping himself from the bread of the Gentiles in Tobit 1:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-kept-from-gentile-bread'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-1-bread-to-hungry-burial
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* This is the fast Yahuah chooses, lived out exactly in Tobit''s bread to the hungry and clothes to the naked in Tobit 1:16-17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-bread-to-hungry-burial'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The King''s reckoning of mercy at the judgment names the very deeds Tobit does for his nation in Tobit 1:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-bread-to-hungry-burial'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* Raphael''s word later in the book weighs the worth of the many alms Tobit gives his brothers in Tobit 1:16.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-bread-to-hungry-burial'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 21:23 — *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* Tobit''s secret burial of the slain in Tobit 1:17-18 keeps this very Torah command not to leave a body exposed.'
  FROM cross_reference_threads t, cross_references x, _session253_tob1_lookup sv, _session253_tob1_lookup tv
 WHERE t.slug='tobit-1-bread-to-hungry-burial'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_02.sql (session253 tobit 2) -----
-- Source anchor: apocrypha/tobit ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob2 (view _session253_tob2_lookup). Sort band base 59625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-2-bury-the-dead
  ('apocrypha', 'tobit', 2, 7, 'canon', 'deuteronomy', 21, 23, 'free', E'Deuteronomy 21:23 — *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* Tobit buries before sunset and the same night precisely to keep this command that the land not be defiled by an unburied body.'),
  ('apocrypha', 'tobit', 2, 7, 'canon', 'genesis', 23, 19, 'free', E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* As Abraham labored to bury his own dead in dignity, so Tobit digs a grave for a brother of his nation at his own risk.'),
  ('apocrypha', 'tobit', 2, 8, 'canon', 'matthew', 8, 22, 'free', E'Matthew 8:22 — *But Yahusha (Jesus) said unto him, Follow me; and let the dead bury their dead.* The neighbours mock Tobit''s burying as folly, yet the kindness to the dead he renders is the very faithfulness that following requires.'),
  ('apocrypha', 'tobit', 2, 7, 'apocrypha', 'tobit', 12, 13, 'extras', E'Tobit 12:13 — *And when you did not delay to rise up, and leave your dinner, to go and cover the dead, your good deed was not hid from me: but I was with you.* Raphael reveals that the angel of Yahuah stood beside Tobit in this very burial of chapter 2, his good deed not hid.'),
  -- thread: tobit-2-feasts-turned-to-mourning
  ('apocrypha', 'tobit', 2, 6, 'canon', 'amos', 8, 10, 'free', E'Amos 8:10 — *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* Tobit quotes this prophecy by name, watching his feast of Pentecost turn to mourning over the slain brother in fulfilment of Amos.'),
  ('apocrypha', 'tobit', 2, 1, 'canon', 'deuteronomy', 16, 10, 'free', E'Deuteronomy 16:10 — *And thou shalt keep the feast of weeks unto Yahuah Elohayka (the LORD thy God) with a tribute of a freewill offering of thine hand, which thou shalt give unto Yahuah Elohayka (the LORD thy God), according as Yahuah Elohayka (the LORD thy God) hath blessed thee:* Tobit keeps this same feast of weeks even in the captivity of Nineveh, the appointed time held fast in exile.'),
  -- thread: tobit-2-righteous-struck-blind
  ('apocrypha', 'tobit', 2, 10, 'canon', 'job', 1, 1, 'free', E'Job 1:1 — *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* Tobit, like Job, is a God-fearing and upright man, so his sudden blindness raises the same question of why the righteous suffer.'),
  ('apocrypha', 'tobit', 2, 10, 'canon', 'job', 2, 7, 'free', E'Job 2:7 — *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* As Job''s body was smitten head to foot, so Tobit''s eyes are struck with whiteness — the just man afflicted in the flesh.'),
  -- thread: tobit-2-wifes-reproach
  ('apocrypha', 'tobit', 2, 14, 'canon', 'job', 2, 9, 'free', E'Job 2:9 — *Then said his wife unto him, Dost thou still retain thine integrity? curse Elohim (God), and die.* As Job''s wife reproached him in his suffering, so Anna reproaches Tobit, taunting the alms and righteous deeds that seem to have gained him nothing.'),
  ('apocrypha', 'tobit', 2, 14, 'canon', 'job', 2, 10, 'free', E'Job 2:10 — *But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* Tobit, abashed yet not cursing Yahuah, answers his wife''s reproach with the same steadfastness Job showed his.'),
  -- thread: tobit-2-alms-and-righteous-deeds
  ('apocrypha', 'tobit', 2, 14, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The alms his wife throws in his face are the very practice Tobit will charge upon his son as the way of righteousness.'),
  ('apocrypha', 'tobit', 2, 14, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Though Tobit sits afflicted in darkness, his alms are the treasure that, by the book''s own teaching, delivers from death.'),
  ('apocrypha', 'tobit', 2, 14, 'canon', 'matthew', 6, 4, 'free', E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* Tobit''s hidden alms and righteous deeds, mocked by his wife, are exactly the secret giving the Father sees and openly rewards.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-bury-the-dead',
       E'He Burieth The Dead Again — Kindness To The Slain',
       E'Tobit will not leave a brother''s body in the dust, though it costs him his dinner, his cleanness, and nearly his life: *Therefore I wept: and after the going down of the sun I went and made a grave, and buried him.* (Tobit 2:7) — *But my neighbours mocked me, and said, This man is not yet afraid to be put to death for this matter: who fled away; and yet, lo, he burieth the dead again.* (Tobit 2:8) This is no invention of late piety; it is Torah. The hanged man must not be left out overnight, lest the land be defiled: *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled* (Deuteronomy 21:23). The fathers bought ground at price to bury their own: *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre* (Genesis 23:19). And when one man would let burial delay his discipleship, the Master answered him: *But Yahusha (Jesus) said unto him, Follow me; and let the dead bury their dead.* (Matthew 8:22) — for Tobit''s burying was itself the following. Heaven was watching the whole time: the angel later confessed, *And when you did not delay to rise up, and leave your dinner, to go and cover the dead, your good deed was not hid from me: but I was with you.* (Tobit 12:13) It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59625
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-feasts-turned-to-mourning',
       E'Your Feasts Shall Be Turned Into Mourning — Amos Fulfilled',
       E'Tobit keeps the feast of weeks in exile — *in the feast of Pentecost, which is the holy feast of the seven weeks* (Tobit 2:1) — the very moed Torah commands: *And thou shalt keep the feast of weeks unto Yahuah Elohayka (the LORD thy God) with a tribute of a freewill offering of thine hand* (Deuteronomy 16:10). The Torah is kept in captivity, not abandoned. Yet the good dinner is broken by the news of the slain, and Tobit eats in heaviness, *Remembering that prophecy of Amos, as he said, Your feasts shall be turned into mourning, and all your mirth into lamentation.* (Tobit 2:6) He names the prophet by name — and there it stands: *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* (Amos 8:10) Exile is the prophecy come true; the feast-keeper feels the word of Amos in his own table.',
       sv.verse_id, ev.verse_id, 'extras', 59628
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-righteous-struck-blind',
       E'The Just Man Afflicted — Tobit And Job',
       E'The man who feared Yahuah and buried the dead is rewarded with calamity: *and the sparrows muted warm dung into my eyes, and a whiteness came in my eyes: and I went to the physicians, but they helped me not* (Tobit 2:10). Here is the riddle of Job set in a new key — the upright man stripped of sight as Job was stripped of all. For Job too was named perfect: *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* (Job 1:1) And the affliction fell upon his very body: *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* (Job 2:7) The blindness of Tobit, like the boils of Job, is the suffering of the just — not the wages of sin, but a trial within the hand of Yahuah, who will yet heal by His angel.',
       sv.verse_id, ev.verse_id, 'extras', 59631
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-wifes-reproach',
       E'Where Are Thy Righteous Deeds — The Wife''s Reproach',
       E'When the kid is brought home and Tobit fears it stolen, his wife turns on him in his blindness and poverty: *But she replied upon me, Where are your alms and your righteous deeds? behold, you and all your works are known.* (Tobit 2:14) The sting is Job''s exactly — the afflicted righteous man cut by the one nearest him: *Then said his wife unto him, Dost thou still retain thine integrity? curse Elohim (God), and die.* (Job 2:9) Yet where Job answers and holds fast, *But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* (Job 2:10) — Tobit too is abashed but does not curse Yahuah; he holds to his integrity. The wife''s reproach is the trial within the trial, and the just man bears it.',
       sv.verse_id, ev.verse_id, 'extras', 59634
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-alms-and-righteous-deeds',
       E'Thy Alms And Thy Righteous Deeds — The Treasure Laid Up',
       E'Anna means her words as a taunt — *Where are your alms and your righteous deeds?* (Tobit 2:14) — but they name the very life Tobit has lived and will counsel his son to live: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7) The alms are no empty works; they are treasure laid up: *Because that alms do deliver from death, and suffers not to come into darkness.* (Tobit 4:10) The Master taught the same hidden reward, not paraded before men: *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* (Matthew 6:4) Tobit''s righteous deeds are known — to Yahuah, and to the angel who stood beside him — and they will not go unrewarded.',
       sv.verse_id, ev.verse_id, 'extras', 59637
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-2-bury-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 21:23 — *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* Tobit buries before sunset and the same night precisely to keep this command that the land not be defiled by an unburied body.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* As Abraham labored to bury his own dead in dignity, so Tobit digs a grave for a brother of his nation at his own risk.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 8:22 — *But Yahusha (Jesus) said unto him, Follow me; and let the dead bury their dead.* The neighbours mock Tobit''s burying as folly, yet the kindness to the dead he renders is the very faithfulness that following requires.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:13 — *And when you did not delay to rise up, and leave your dinner, to go and cover the dead, your good deed was not hid from me: but I was with you.* Raphael reveals that the angel of Yahuah stood beside Tobit in this very burial of chapter 2, his good deed not hid.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-feasts-turned-to-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 8:10 — *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* Tobit quotes this prophecy by name, watching his feast of Pentecost turn to mourning over the slain brother in fulfilment of Amos.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 16:10 — *And thou shalt keep the feast of weeks unto Yahuah Elohayka (the LORD thy God) with a tribute of a freewill offering of thine hand, which thou shalt give unto Yahuah Elohayka (the LORD thy God), according as Yahuah Elohayka (the LORD thy God) hath blessed thee:* Tobit keeps this same feast of weeks even in the captivity of Nineveh, the appointed time held fast in exile.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-righteous-struck-blind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:1 — *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* Tobit, like Job, is a God-fearing and upright man, so his sudden blindness raises the same question of why the righteous suffer.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-righteous-struck-blind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 2:7 — *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* As Job''s body was smitten head to foot, so Tobit''s eyes are struck with whiteness — the just man afflicted in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-righteous-struck-blind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-wifes-reproach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 2:9 — *Then said his wife unto him, Dost thou still retain thine integrity? curse Elohim (God), and die.* As Job''s wife reproached him in his suffering, so Anna reproaches Tobit, taunting the alms and righteous deeds that seem to have gained him nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-wifes-reproach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 2:10 — *But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* Tobit, abashed yet not cursing Yahuah, answers his wife''s reproach with the same steadfastness Job showed his.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-wifes-reproach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-alms-and-righteous-deeds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The alms his wife throws in his face are the very practice Tobit will charge upon his son as the way of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-alms-and-righteous-deeds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Though Tobit sits afflicted in darkness, his alms are the treasure that, by the book''s own teaching, delivers from death.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-alms-and-righteous-deeds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* Tobit''s hidden alms and righteous deeds, mocked by his wife, are exactly the secret giving the Father sees and openly rewards.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-alms-and-righteous-deeds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_03.sql (session253 tobit 3) -----
-- Source anchor: apocrypha/tobit ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob3 (view _session253_tob3_lookup). Sort band base 59650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-3-rebuke-me-not
  ('apocrypha', 'tobit', 3, 1, 'canon', 'psalms', 6, 1, 'free', E'Psalm 6:1 — *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure.* Tobit weeping in his sorrow (3:1) takes up David''s opening cry of the chastened afflicted.'),
  ('apocrypha', 'tobit', 3, 6, 'canon', 'psalms', 6, 4, 'free', E'Psalm 6:4 — *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake.* Tobit''s plea to be delivered out of his distress (3:6) is David''s plea for deliverance for mercy''s sake.'),
  ('apocrypha', 'tobit', 3, 6, 'canon', 'psalms', 25, 16, 'free', E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Tobit''s *turn not your face away from me* (3:6) is the obverse of David''s prayer that Yahuah turn toward the desolate.'),
  ('apocrypha', 'tobit', 3, 6, 'canon', 'psalms', 25, 18, 'free', E'Psalm 25:18 — *Look upon mine affliction and my pain; and forgive all my sins.* Tobit, weighed by reproach and sin alike (3:6), asks the same: that Yahuah look on his affliction and forgive.'),
  -- thread: tobit-3-fathers-sins-captivity
  ('apocrypha', 'tobit', 3, 4, 'canon', 'daniel', 9, 11, 'free', E'Daniel 9:11 — *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* Tobit''s *they obeyed not your commandments: wherefore you have delivered us... to captivity* (3:4) is Daniel''s identical reckoning of the exile as the law''s own sworn oath.'),
  ('apocrypha', 'tobit', 3, 3, 'canon', 'lamentations', 5, 7, 'free', E'Lamentations 5:7 — *Our fathers have sinned, and are not; and we have borne their iniquities.* Tobit asks not to be punished for *the sins of my fathers, who have sinned before you* (3:3) — the very weight Lamentations names.'),
  ('apocrypha', 'tobit', 3, 4, 'canon', 'lamentations', 5, 1, 'free', E'Lamentations 5:1 — *Remember, O Yahuah (LORD), what is come upon us: consider, and behold our reproach.* Tobit dispersed *for a proverb of reproach to all the nations* (3:4) prays Lamentations'' own appeal over the reproach of the scattered.'),
  ('apocrypha', 'tobit', 3, 5, 'canon', 'nehemiah', 9, 2, 'free', E'Nehemiah 9:2 — *And the seed of Yashar''el (Israel) separated themselves from all strangers, and stood and confessed their sins, and the iniquities of their fathers.* Tobit''s *we have not kept your commandments* (3:5) is the same confession the returning remnant makes in Nehemiah.'),
  -- thread: tobit-3-just-and-true-judgments
  ('apocrypha', 'tobit', 3, 2, 'canon', 'psalms', 25, 10, 'free', E'Psalm 25:10 — *All the paths of Yahuah (LORD) are mercy and truth unto such as keep his covenant and his testimonies.* Tobit''s *all your ways are mercy and truth* (3:2) quotes the psalter''s verdict on the covenant-keeping God almost word for word.'),
  ('apocrypha', 'tobit', 3, 5, 'canon', 'daniel', 9, 7, 'free', E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day.* Tobit''s *your judgments are many and true: deal with me according to my sins* (3:5) is Daniel''s same self-condemning vindication of Yahuah.'),
  ('apocrypha', 'tobit', 3, 2, 'canon', 'daniel', 9, 14, 'free', E'Daniel 9:14 — *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* Tobit confessing Yahuah *just... in all your works* (3:2) speaks Daniel''s confession that He is righteous in all His works.'),
  -- thread: tobit-3-sarah-reproach-prayer
  ('apocrypha', 'tobit', 3, 12, 'canon', 'psalms', 25, 1, 'free', E'Psalm 25:1 — *Unto thee, O Yahuah (LORD), do I lift up my soul.* Sarah setting *my eyes and my face toward you* (3:12) lifts her soul exactly as the psalmist does in his distress.'),
  ('apocrypha', 'tobit', 3, 12, 'canon', 'psalms', 25, 15, 'free', E'Psalm 25:15 — *Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net.* Sarah''s eyes fixed toward Yahuah (3:12) trust, like David, to be plucked out of the snare that has taken her seven husbands.'),
  ('apocrypha', 'tobit', 3, 13, 'canon', 'psalms', 25, 17, 'free', E'Psalm 25:17 — *The troubles of my heart are enlarged: O bring thou me out of my distresses.* Sarah''s *Take me out of the earth, that I may hear no more the reproach* (3:13) is the same cry to be brought out of an unbearable distress.'),
  -- thread: tobit-3-prayers-heard-raphael-sent
  ('apocrypha', 'tobit', 3, 16, 'canon', 'psalms', 34, 15, 'free', E'Psalm 34:15 — *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* Both prayers *heard before the majesty of the great Yahuah* (3:16) prove the psalm true: His ears are open to the afflicted righteous.'),
  ('apocrypha', 'tobit', 3, 16, 'canon', 'psalms', 34, 17, 'free', E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Tobit and Sarah cry and are heard (3:16) — delivered out of their troubles exactly as the psalm promises.'),
  ('apocrypha', 'tobit', 3, 17, 'canon', 'daniel', 9, 21, 'free', E'Daniel 9:21 — *Yea, whiles I was speaking in prayer, even the man Gabriel, whom I had seen in the vision at the beginning, being caused to fly swiftly, touched me about the time of the evening oblation.* Raphael sent in answer to the prayers (3:17) matches Gabriel dispatched to Daniel in the very act of praying.'),
  ('apocrypha', 'tobit', 3, 17, 'canon', 'luke', 1, 13, 'free', E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The angel sent because the prayer is heard (3:16-17) is the same word Gabriel brings Zacharias at the altar of incense.'),
  ('apocrypha', 'tobit', 3, 17, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* Raphael sent *to bind Asmodeus the evil spirit* (3:17) is the seed-war in miniature — the angel laying hold on and binding the adversary.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-rebuke-me-not',
       E'Rebuke me not in thine anger — the prayer of the afflicted',
       E'Tobit, blind and shamed, weeps and pours out a sufferer''s prayer: *Then I being grieved did weep, and in my sorrow prayed, saying* (Tobit 3:1), *Now therefore deal with me as seemeth best to you, and command my spirit to be taken from me, that I may be dissolved, and become earth: for it is profitable for me to die rather than to live, because I have heard false reproaches, and have much sorrow: command therefore that I may now be delivered out of this distress, and go into the everlasting place: turn not your face away from me* (Tobit 3:6). It is the very voice of the penitential psalms. David groans the same: *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure* (Psalm 6:1), and *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake* (Psalm 6:4). The cry to be remembered in distress is older still: *Look upon mine affliction and my pain; and forgive all my sins* (Psalm 25:18), *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted* (Psalm 25:16). It ain''t new — the exile in Nineveh prays the prayer Israel has always prayed.',
       sv.verse_id, ev.verse_id, 'extras', 59650
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-fathers-sins-captivity',
       E'We have not kept your commandments — confession of the fathers'' sins',
       E'Tobit owns the covenant breach that scattered the house: *Remember me, and look on me, punish me not for my sins and ignorances, and the sins of my fathers, who have sinned before you* (Tobit 3:3), *For they obeyed not your commandments: wherefore you have delivered us for a spoil, and to captivity, and to death, and for a proverb of reproach to all the nations among whom we are dispersed* (Tobit 3:4), *because we have not kept your commandments, neither have walked in truth before you* (Tobit 3:5). This is Daniel''s confession at the same exile: *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him* (Daniel 9:11). It is Lamentations over the burning city: *Our fathers have sinned, and are not; and we have borne their iniquities* (Lamentations 5:7), *Remember, O Yahuah (LORD), what is come upon us: consider, and behold our reproach* (Lamentations 5:1). And it is Nehemiah''s returning remnant: *And the seed of Yashar''el (Israel) separated themselves from all strangers, and stood and confessed their sins, and the iniquities of their fathers* (Nehemiah 9:2). The scattering is the Torah''s own oath at work — not law as curse, but covenant kept faithful — and the same Torah-keeping remnant is gathered home again (Ezekiel 37).',
       sv.verse_id, ev.verse_id, 'extras', 59653
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-just-and-true-judgments',
       E'Just are thy ways — righteous in all his works',
       E'Even in grief Tobit justifies Yahuah: *O Yahuah (God), you are just, and all your works and all your ways are mercy and truth, and you judgest truly and justly for ever* (Tobit 3:2), *And now your judgments are many and true: deal with me according to my sins* (Tobit 3:5). This is the heart of Daniel''s confession — *O Yahuah (LORD), righteousness belongeth unto thee, but unto us confusion of faces* (Daniel 9:7) — and its close: *for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14). It echoes David''s creed of the covenant: *All the paths of Yahuah (LORD) are mercy and truth unto such as keep his covenant and his testimonies* (Psalm 25:10). The afflicted man does not accuse Heaven; he vindicates it.',
       sv.verse_id, ev.verse_id, 'extras', 59656
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-sarah-reproach-prayer',
       E'Take me out of the earth — Sarah''s prayer at the window',
       E'Far off in Ecbatane, Sarah — whose seven husbands Asmodeus the evil spirit had slain — is taunted to death and prays the same prayer toward heaven: *Then she prayed toward the window, and said, Blessed art you, O Yahuah (God), my Elohim (God), and yours holy and glorious name is blessed and honourable for ever: let all your works praise you for ever* (Tobit 3:11), *And now, O Yahuah (God), I set my eyes and my face toward you* (Tobit 3:12), *And say, Take me out of the earth, that I may hear no more the reproach* (Tobit 3:13). Her lifted face is David''s posture: *Unto thee, O Yahuah (LORD), do I lift up my soul* (Psalm 25:1), *Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net* (Psalm 25:15). Her plea to be taken out of her reproach is the psalmist''s: *The troubles of my heart are enlarged: O bring thou me out of my distresses* (Psalm 25:17). Two prayers, one God — Tobit at Nineveh and Sarah at Ecbatane reach the same throne.',
       sv.verse_id, ev.verse_id, 'extras', 59659
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-prayers-heard-raphael-sent',
       E'The prayers were heard — Raphael sent, the demon bound',
       E'Both prayers ascend together and are answered: *So the prayers of them both were heard before the majesty of the great Yahuah (God)* (Tobit 3:16), *And Raphael was sent to heal them both, that is, to scale away the whiteness of Tobit''s eyes, and to give Sara the daughter of Raguel for a wife to Tobias the son of Tobit; and to bind Asmodeus the evil spirit* (Tobit 3:17). The eyes of Yahuah were upon these afflicted righteous all along: *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry* (Psalm 34:15), *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles* (Psalm 34:17). An angel is dispatched at the prayer just as Gabriel comes to Daniel: *Yea, whiles I was speaking in prayer, even the man Gabriel... touched me about the time of the evening oblation* (Daniel 9:21), *At the beginning of thy supplications the commandment came forth, and I am come to shew thee; for thou art greatly beloved* (Daniel 9:23). And the angel''s word to Zacharias is the very tidings of this chapter: *Fear not, Zacharias: for thy prayer is heard* (Luke 1:13). The binding of Asmodeus is the seed-war''s outcome written small — the angel laying hold on the evil spirit prefigures the angel who *bound him a thousand years* (Revelation 20:2).',
       sv.verse_id, ev.verse_id, 'extras', 59662
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-3-rebuke-me-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 6:1 — *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure.* Tobit weeping in his sorrow (3:1) takes up David''s opening cry of the chastened afflicted.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 6:4 — *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake.* Tobit''s plea to be delivered out of his distress (3:6) is David''s plea for deliverance for mercy''s sake.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Tobit''s *turn not your face away from me* (3:6) is the obverse of David''s prayer that Yahuah turn toward the desolate.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 25:18 — *Look upon mine affliction and my pain; and forgive all my sins.* Tobit, weighed by reproach and sin alike (3:6), asks the same: that Yahuah look on his affliction and forgive.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-fathers-sins-captivity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:11 — *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* Tobit''s *they obeyed not your commandments: wherefore you have delivered us... to captivity* (3:4) is Daniel''s identical reckoning of the exile as the law''s own sworn oath.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 5:7 — *Our fathers have sinned, and are not; and we have borne their iniquities.* Tobit asks not to be punished for *the sins of my fathers, who have sinned before you* (3:3) — the very weight Lamentations names.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 5:1 — *Remember, O Yahuah (LORD), what is come upon us: consider, and behold our reproach.* Tobit dispersed *for a proverb of reproach to all the nations* (3:4) prays Lamentations'' own appeal over the reproach of the scattered.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nehemiah 9:2 — *And the seed of Yashar''el (Israel) separated themselves from all strangers, and stood and confessed their sins, and the iniquities of their fathers.* Tobit''s *we have not kept your commandments* (3:5) is the same confession the returning remnant makes in Nehemiah.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-just-and-true-judgments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 25:10 — *All the paths of Yahuah (LORD) are mercy and truth unto such as keep his covenant and his testimonies.* Tobit''s *all your ways are mercy and truth* (3:2) quotes the psalter''s verdict on the covenant-keeping God almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-just-and-true-judgments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day.* Tobit''s *your judgments are many and true: deal with me according to my sins* (3:5) is Daniel''s same self-condemning vindication of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-just-and-true-judgments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:14 — *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* Tobit confessing Yahuah *just... in all your works* (3:2) speaks Daniel''s confession that He is righteous in all His works.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-just-and-true-judgments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-sarah-reproach-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 25:1 — *Unto thee, O Yahuah (LORD), do I lift up my soul.* Sarah setting *my eyes and my face toward you* (3:12) lifts her soul exactly as the psalmist does in his distress.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-sarah-reproach-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 25:15 — *Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net.* Sarah''s eyes fixed toward Yahuah (3:12) trust, like David, to be plucked out of the snare that has taken her seven husbands.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-sarah-reproach-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:17 — *The troubles of my heart are enlarged: O bring thou me out of my distresses.* Sarah''s *Take me out of the earth, that I may hear no more the reproach* (3:13) is the same cry to be brought out of an unbearable distress.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-sarah-reproach-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-prayers-heard-raphael-sent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:15 — *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* Both prayers *heard before the majesty of the great Yahuah* (3:16) prove the psalm true: His ears are open to the afflicted righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Tobit and Sarah cry and are heard (3:16) — delivered out of their troubles exactly as the psalm promises.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:21 — *Yea, whiles I was speaking in prayer, even the man Gabriel, whom I had seen in the vision at the beginning, being caused to fly swiftly, touched me about the time of the evening oblation.* Raphael sent in answer to the prayers (3:17) matches Gabriel dispatched to Daniel in the very act of praying.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The angel sent because the prayer is heard (3:16-17) is the same word Gabriel brings Zacharias at the altar of incense.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* Raphael sent *to bind Asmodeus the evil spirit* (3:17) is the seed-war in miniature — the angel laying hold on and binding the adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_04.sql (session253 tobit 4) -----
-- Source anchor: apocrypha/tobit ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob4 (view _session253_tob4_lookup). Sort band base 59675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-4-alms-deliver-from-death
  ('apocrypha', 'tobit', 4, 10, 'canon', 'proverbs', 10, 2, 'free', E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* The very axiom Tobit hands his son — righteousness (alms) outlasts riches and pulls the giver back from death.'),
  ('apocrypha', 'tobit', 4, 10, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* Proverbs repeats Tobit''s deliverance-from-death word for word, naming the day of necessity Tobit calls ''the day of necessity.'''),
  ('apocrypha', 'tobit', 4, 7, 'canon', 'daniel', 4, 27, 'free', E'Daniel 4:27 — *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity.* Daniel in exile, like Tobit in exile, urges mercy to the poor as the very thing that wards off death''s sentence.'),
  ('apocrypha', 'tobit', 4, 9, 'canon', 'luke', 12, 33, 'free', E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* Yahusha lays up in heaven the same ''good treasure against the day of necessity'' Tobit tells Tobias alms secures.'),
  -- thread: tobit-4-give-alms-of-thy-substance
  ('apocrypha', 'tobit', 4, 7, 'canon', 'luke', 11, 41, 'free', E'Luke 11:41 — *But rather give alms of such things as ye have; and, behold, all things are clean unto you.* Yahusha makes almsgiving the inward cleansing — exactly Tobit''s ''give of thy substance'' that keeps Yahuah''s face turned toward the giver.'),
  ('apocrypha', 'tobit', 4, 16, 'canon', 'luke', 12, 34, 'free', E'Luke 12:34 — *For where your treasure is, there will your heart be also.* Tobit''s unenvious eye toward the poor is the heart already lodged where its treasure is laid up — in mercy, not in hoarding.'),
  ('apocrypha', 'tobit', 4, 16, 'canon', 'leviticus', 19, 10, 'free', E'Leviticus 19:10 — *And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God).* The Torah law of the gleaning corners is the root of Tobit''s ''give of thy bread to the hungry'' — bread and garments owed to the poor.'),
  -- thread: tobit-4-honour-thy-mother
  ('apocrypha', 'tobit', 4, 3, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Fifth Word itself; Tobit charges Tobias to honour his mother ''all the days of thy life,'' the very commandment with promise.'),
  ('apocrypha', 'tobit', 4, 3, 'canon', 'leviticus', 19, 3, 'free', E'Leviticus 19:3 — *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God).* The holiness code that names the mother first matches Tobit''s stress on honouring the mother who bore him through danger.'),
  -- thread: tobit-4-golden-rule-negative
  ('apocrypha', 'tobit', 4, 15, 'canon', 'matthew', 7, 12, 'free', E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* Yahusha''s Golden Rule is Tobit''s ''do that to no man which thou hatest'' turned positive and named the sum of the law and the prophets.'),
  ('apocrypha', 'tobit', 4, 15, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Love-thy-neighbour is the Torah seed of which Tobit''s negative Golden Rule and the Sermon''s positive one are both the flower.'),
  -- thread: tobit-4-labourers-wage
  ('apocrypha', 'tobit', 4, 14, 'canon', 'leviticus', 19, 13, 'free', E'Leviticus 19:13 — *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* The Torah command not to hold a hired man''s wages overnight is precisely Tobit''s ''give him it out of hand.'''),
  ('apocrypha', 'tobit', 4, 14, 'canon', 'deuteronomy', 24, 15, 'free', E'Deuteronomy 24:15 — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* Deuteronomy makes the same-day wage a matter of the poor man''s cry — the law behind Tobit''s urgency.'),
  ('apocrypha', 'tobit', 4, 14, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* James hears the very wage-cry Tobit forestalls — kept-back hire reaching the ears of the Lord of hosts.'),
  -- thread: tobit-4-be-mindful-of-yahuah
  ('apocrypha', 'tobit', 4, 5, 'canon', 'proverbs', 10, 17, 'free', E'Proverbs 10:17 — *He is in the way of life that keepeth instruction: but he that refuseth reproof erreth.* Tobit''s ''do uprightly all thy life long'' is the way of life Proverbs marks out for the one who keeps instruction.'),
  ('apocrypha', 'tobit', 4, 19, 'canon', 'proverbs', 11, 3, 'free', E'Proverbs 11:3 — *The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.* The directed ways Tobit prays for his son are the very guidance Proverbs grants the upright in heart.'),
  ('apocrypha', 'tobit', 4, 19, 'canon', 'deuteronomy', 24, 18, 'free', E'Deuteronomy 24:18 — *But thou shalt remember that thou wast a bondman in Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee thence: therefore I command thee to do this thing.* The ''remember and do my commandments'' refrain that closes Tobit''s charge echoes Moses'' own ground for mercy: remember redemption, therefore keep the command.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-alms-deliver-from-death',
       E'Almsgiving delivers from death',
       E'Tobit''s deathbed wisdom turns on a hinge the whole library shares: *Because that alms do deliver from death, and suffers not to come into darkness.* (Tobit 4:10) — give *of your substance*, *if you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little* (Tobit 4:8), *for you layest up a good treasure for thyself against the day of necessity* (Tobit 4:9). It is no new saying. The Proverbs already twice cut the same channel — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* (Proverbs 10:2) and *Riches profit not in the day of wrath: but righteousness delivereth from death.* (Proverbs 11:4). Daniel pressed it on a king''s conscience — *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity.* (Daniel 4:27). And Yahusha lays up the very treasure Tobit names: *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* (Luke 12:33). One covenant ethic, exile to Sermon.',
       sv.verse_id, ev.verse_id, 'extras', 59675
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-give-alms-of-thy-substance',
       E'Alms of such things as ye have',
       E'Tobit measures the gift by the heart, not the purse: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7) — *Give of your bread to the hungry, and of your garments to them that are naked; and according to your abundance give alms: and let not your eye be envious, when you give alms.* (Tobit 4:16). Yahusha makes the cleansing turn on exactly this — *But rather give alms of such things as ye have; and, behold, all things are clean unto you.* (Luke 11:41) — and binds the heart to the treasure: *For where your treasure is, there will your heart be also.* (Luke 12:34). The ''unenvious eye'' Tobit commands is the Sermon''s ''single eye'' that fills the body with light.',
       sv.verse_id, ev.verse_id, 'extras', 59678
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-honour-thy-mother',
       E'Honour her all the days of thy life',
       E'Before alms, the first commandment with promise: *And when he had called him, he said, My son, when I am dead, bury me; and despise not your mother, but honour her all the days of your life, and do that which shall please her, and grieve her not.* (Tobit 4:3) — *Remember, my son, that she saw many dangers for you, when you were in her womb: and when she is dead, bury her by me in one grave.* (Tobit 4:4). This is the fifth word of Sinai spoken at a deathbed: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12) — and Leviticus sets fearing the mother first: *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God).* (Leviticus 19:3). Torah honoured in exile, never as curse.',
       sv.verse_id, ev.verse_id, 'extras', 59681
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-golden-rule-negative',
       E'Do that to no man which thou hatest',
       E'The Golden Rule in its negative form stands in Tobit''s mouth before ever it stands in the Sermon: *Do that to no man which you hatest: drink not wine to make you drunken: neither let drunkenness go with you in your journey.* (Tobit 4:15). Yahusha turns the same rule to its positive face and seals it as the whole Torah: *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* (Matthew 7:12). Its root is the holiness code itself — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). It ain''t new: the Sermon''s own root runs back through Tobit to Sinai.',
       sv.verse_id, ev.verse_id, 'extras', 59684
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-labourers-wage',
       E'Let not the wages tarry with thee',
       E'Tobit will not let a withheld wage sleep overnight: *Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand: for if you serve Yahuah (God), he will also repay you...* (Tobit 4:14). This is Torah law twice over — *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* (Leviticus 19:13) — and *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* (Deuteronomy 24:15). James hears the same cry against the last days'' rich: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* (James 5:4).',
       sv.verse_id, ev.verse_id, 'extras', 59687
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-be-mindful-of-yahuah',
       E'Be mindful of Yahuah all thy days',
       E'Beneath every charge runs the one root: *My son, be mindful of Yahuah (God), our Elohim (God) all your days, and let not your will be set to sin, or to transgress his commandments: do uprightly all your life long, and follow not the ways of unrighteousness.* (Tobit 4:5) — *Bless Yahuah (God), your Elohim (God) alway, and desire of him that your ways may be directed... now therefore, my son, remember my commandments, neither let them be put out of your mind.* (Tobit 4:19). This is the way of life Proverbs sets against the way of death — *He is in the way of life that keepeth instruction: but he that refuseth reproof erreth.* (Proverbs 10:17) — and the integrity that guides the upright — *The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.* (Proverbs 11:3). To keep Torah in exile is to walk uprightly, not under a curse.',
       sv.verse_id, ev.verse_id, 'extras', 59690
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-4-alms-deliver-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* The very axiom Tobit hands his son — righteousness (alms) outlasts riches and pulls the giver back from death.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* Proverbs repeats Tobit''s deliverance-from-death word for word, naming the day of necessity Tobit calls ''the day of necessity.'''
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:27 — *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity.* Daniel in exile, like Tobit in exile, urges mercy to the poor as the very thing that wards off death''s sentence.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* Yahusha lays up in heaven the same ''good treasure against the day of necessity'' Tobit tells Tobias alms secures.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-give-alms-of-thy-substance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 11:41 — *But rather give alms of such things as ye have; and, behold, all things are clean unto you.* Yahusha makes almsgiving the inward cleansing — exactly Tobit''s ''give of thy substance'' that keeps Yahuah''s face turned toward the giver.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-give-alms-of-thy-substance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:34 — *For where your treasure is, there will your heart be also.* Tobit''s unenvious eye toward the poor is the heart already lodged where its treasure is laid up — in mercy, not in hoarding.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-give-alms-of-thy-substance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:10 — *And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God).* The Torah law of the gleaning corners is the root of Tobit''s ''give of thy bread to the hungry'' — bread and garments owed to the poor.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-give-alms-of-thy-substance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-honour-thy-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Fifth Word itself; Tobit charges Tobias to honour his mother ''all the days of thy life,'' the very commandment with promise.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-honour-thy-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:3 — *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God).* The holiness code that names the mother first matches Tobit''s stress on honouring the mother who bore him through danger.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-honour-thy-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-golden-rule-negative
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* Yahusha''s Golden Rule is Tobit''s ''do that to no man which thou hatest'' turned positive and named the sum of the law and the prophets.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-golden-rule-negative'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Love-thy-neighbour is the Torah seed of which Tobit''s negative Golden Rule and the Sermon''s positive one are both the flower.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-golden-rule-negative'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-labourers-wage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:13 — *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* The Torah command not to hold a hired man''s wages overnight is precisely Tobit''s ''give him it out of hand.'''
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-labourers-wage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 24:15 — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* Deuteronomy makes the same-day wage a matter of the poor man''s cry — the law behind Tobit''s urgency.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-labourers-wage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* James hears the very wage-cry Tobit forestalls — kept-back hire reaching the ears of the Lord of hosts.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-labourers-wage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-be-mindful-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:17 — *He is in the way of life that keepeth instruction: but he that refuseth reproof erreth.* Tobit''s ''do uprightly all thy life long'' is the way of life Proverbs marks out for the one who keeps instruction.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-be-mindful-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:3 — *The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.* The directed ways Tobit prays for his son are the very guidance Proverbs grants the upright in heart.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-be-mindful-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 24:18 — *But thou shalt remember that thou wast a bondman in Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee thence: therefore I command thee to do this thing.* The ''remember and do my commandments'' refrain that closes Tobit''s charge echoes Moses'' own ground for mercy: remember redemption, therefore keep the command.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-be-mindful-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_05.sql (session253 tobit 5) -----
-- Source anchor: apocrypha/tobit ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob5 (view _session253_tob5_lookup). Sort band base 59700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-5-angel-of-the-journey
  ('apocrypha', 'tobit', 5, 16, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel of Yahuah whom Tobit asks to keep his son company on the road to Rages is the same guide Yahuah pledged to send before Israel to keep them in the way.'),
  ('apocrypha', 'tobit', 5, 16, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobit''s prayer that the angel of Yahuah keep Tobias company echoes the psalm''s charge over the traveller''s every way.'),
  ('apocrypha', 'tobit', 5, 6, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* Raphael''s promise to go with Tobias and lead the way is exactly this ministering-spirit office, sent forth to serve the heirs of the covenant.'),
  -- thread: tobit-5-angel-prosper-thy-way
  ('apocrypha', 'tobit', 5, 16, 'canon', 'genesis', 24, 7, 'free', E'Genesis 24:7 — *Yahuah Elohim (The LORD God) of heaven, which took me from my father’s house, and from the land of my kindred, and which spake unto me, and that sware unto me, saying, Unto thy seed will I give this land; he shall send his angel before thee, and thou shalt take a wife unto my son from thence.* Tobit invokes the same God of heaven who sends his angel before a son''s journey to kindred, as Tobias likewise rides toward Sara.'),
  ('apocrypha', 'tobit', 5, 21, 'canon', 'genesis', 24, 40, 'free', E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father’s house:* Tobit''s assurance that the good angel will prosper Tobias''s journey and bring him back safe is word-for-word the hope of Abraham''s servant.'),
  -- thread: tobit-5-firstborn-and-the-tenths
  ('apocrypha', 'tobit', 5, 13, 'canon', 'deuteronomy', 14, 23, 'free', E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* Tobit remembers going up to Jerusalem to offer the tenths of the fruits, the very tithe Torah commands be eaten before Yahuah in the place of his name.'),
  ('apocrypha', 'tobit', 5, 13, 'canon', 'numbers', 18, 15, 'free', E'Numbers 18:15 — *Every thing that openeth the matrix in all flesh, which they bring unto Yahuah (LORD), whether it be of men or beasts, shall be thine: nevertheless the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* The firstborn that Tobit''s kindred faithfully offered is the same firstborn the priestly law dedicates wholly to Yahuah.'),
  ('apocrypha', 'tobit', 5, 13, 'canon', 'exodus', 23, 14, 'free', E'Exodus 23:14 — *Three times thou shalt keep a feast unto me in the year.* The pilgrim-journeys to Jerusalem to worship that Tobit recalls are the thrice-yearly feasts Torah appoints, kept by the faithful remnant in exile-prone days.'),
  -- thread: tobit-5-the-angel-unrecognized
  ('apocrypha', 'tobit', 5, 4, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Raphael, unrecognized and named Azarias, belongs to the same order of angels that stand in the presence of Elohim and are sent forth to households of the faithful.'),
  ('apocrypha', 'tobit', 5, 12, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel who takes the name Azarias (''Yahuah-helps'') to serve Tobias is the ministering spirit Hebrews describes, sent forth to minister for the heirs.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-angel-of-the-journey',
       E'The Angel Sent Before to Keep the Way',
       E'Raphael comes disguised as the kinsman ''Azarias'' to lead Tobias to Rages, and the blind father blesses the setting-out: *To whom the angel said, I will go with you, and I know the way well: for I have lodged with our brother Gabael.* (Tobit 5:6) ... *Then said he to Tobias, Prepare thyself for the journey, and Yahuah (God) send you a good journey... and the angel of Yahuah (God) keep you company.* (Tobit 5:16) This is the oldest covenant promise of the protecting guide of the road. To the wilderness generation it was spoken plainly: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* (Exodus 23:20). The psalm widens it to every faithful traveller: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11). And the apostle names the office for what it is, neither to be worshipped nor feared: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). It ain''t new — the unseen escort of the journey is the same witness from Exodus to the Apocrypha to the writer of Hebrews.',
       sv.verse_id, ev.verse_id, 'extras', 59700
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-angel-prosper-thy-way',
       E'Send His Angel and Prosper Thy Way',
       E'The father commits his son to a guided road: *Go you with this man, and Yahuah (God), which dwells in heaven, prosper your journey, and the angel of Yahuah (God) keep you company.* (Tobit 5:16). This is Abraham''s servant going to Rages-like distance to fetch a wife, and the very same promise carries the errand: *Yahuah Elohim (The LORD God) of heaven... he shall send his angel before thee, and thou shalt take a wife unto my son from thence.* (Genesis 24:7), and again *Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way.* (Genesis 24:40). And the mother is comforted by the same certainty: *For the good angel will keep him company, and his journey shall be prosperous, and he shall return safe.* (Tobit 5:21). The God of heaven sends his angel before the betrothal-journey and prospers the way — it ain''t new, it is Genesis 24 walked again.',
       sv.verse_id, ev.verse_id, 'extras', 59703
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-firstborn-and-the-tenths',
       E'The Firstborn and the Tenths Brought Up to Jerusalem',
       E'Tobit names his kinsman''s good stock by their Torah-faithfulness in exile-bound days: *for I know Ananias and Jonathas, sons of that great Samaias, as we went together to Jerusalem to worship, and offered the firstborn, and the tenths of the fruits; and they were not seduced with the error of our brothers.* (Tobit 5:13). The tithe of the increase is the standing command: *Thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* (Deuteronomy 14:23), and the firstborn redeemed: *the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* (Numbers 18:15). The whole feast-cycle that drew them up to Jerusalem stands behind it: *Three times thou shalt keep a feast unto me in the year.* (Exodus 23:14). Torah kept in the scattering is no curse — it is the seed kept faithful while the rest were seduced.',
       sv.verse_id, ev.verse_id, 'extras', 59706
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-the-angel-unrecognized',
       E'The Angel Unrecognized, Who Will Not Be Worshipped',
       E'The whole scene turns on the disguise: *Therefore when he went to seek a man, he found Raphael that was an angel.* (Tobit 5:4) ... *But he knew not.* (Tobit 5:5). The deliverer walks beside men unrecognized, taking the name Azarias (''Yahuah-helps''). So too the messenger stands ready in the presence of Elohim and is sent to a household unawares: *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19) — the same order of the seven holy angels to which Raphael belongs. And the angel never claims worship, for he is a ministering spirit: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). The helper hidden in a kinsman''s face is the messenger who stands before Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59709
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-5-angel-of-the-journey
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel of Yahuah whom Tobit asks to keep his son company on the road to Rages is the same guide Yahuah pledged to send before Israel to keep them in the way.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-of-the-journey'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobit''s prayer that the angel of Yahuah keep Tobias company echoes the psalm''s charge over the traveller''s every way.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-of-the-journey'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* Raphael''s promise to go with Tobias and lead the way is exactly this ministering-spirit office, sent forth to serve the heirs of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-of-the-journey'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-5-angel-prosper-thy-way
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:7 — *Yahuah Elohim (The LORD God) of heaven, which took me from my father’s house, and from the land of my kindred, and which spake unto me, and that sware unto me, saying, Unto thy seed will I give this land; he shall send his angel before thee, and thou shalt take a wife unto my son from thence.* Tobit invokes the same God of heaven who sends his angel before a son''s journey to kindred, as Tobias likewise rides toward Sara.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-prosper-thy-way'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father’s house:* Tobit''s assurance that the good angel will prosper Tobias''s journey and bring him back safe is word-for-word the hope of Abraham''s servant.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-prosper-thy-way'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-5-firstborn-and-the-tenths
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* Tobit remembers going up to Jerusalem to offer the tenths of the fruits, the very tithe Torah commands be eaten before Yahuah in the place of his name.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-firstborn-and-the-tenths'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:15 — *Every thing that openeth the matrix in all flesh, which they bring unto Yahuah (LORD), whether it be of men or beasts, shall be thine: nevertheless the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* The firstborn that Tobit''s kindred faithfully offered is the same firstborn the priestly law dedicates wholly to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-firstborn-and-the-tenths'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 23:14 — *Three times thou shalt keep a feast unto me in the year.* The pilgrim-journeys to Jerusalem to worship that Tobit recalls are the thrice-yearly feasts Torah appoints, kept by the faithful remnant in exile-prone days.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-firstborn-and-the-tenths'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-5-the-angel-unrecognized
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Raphael, unrecognized and named Azarias, belongs to the same order of angels that stand in the presence of Elohim and are sent forth to households of the faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-the-angel-unrecognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel who takes the name Azarias (''Yahuah-helps'') to serve Tobias is the ministering spirit Hebrews describes, sent forth to minister for the heirs.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-the-angel-unrecognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_06.sql (session253 tobit 6) -----
-- Source anchor: apocrypha/tobit ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob6 (view _session253_tob6_lookup). Sort band base 59725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-6-the-fish-by-the-river
  ('apocrypha', 'tobit', 6, 2, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The fish that leaped up to devour is turned, like Joseph''s harm, into the means of saving life, in Tobit 6:2.'),
  ('apocrypha', 'tobit', 6, 3, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The fish drawn from the river to feed and to heal answers the river whose very waters and fruit are medicine, in Tobit 6:3.'),
  -- thread: tobit-6-gall-for-healing-eyes
  ('apocrypha', 'tobit', 6, 8, 'canon', 'john', 9, 11, 'free', E'John 9:11 — *He answered and said, A man that is called Yahusha made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.* The gall laid up to anoint whitened eyes and give sight prefigures the anointing of clay that opens the blind man''s eyes, in Tobit 6:8.'),
  ('apocrypha', 'tobit', 6, 4, 'canon', 'mark', 16, 18, 'free', E'Mark 16:18 — *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* The heart, liver, and gall kept safely for the recovery of the afflicted answer the laying on of hands by which the sick recover, in Tobit 6:4.'),
  -- thread: tobit-6-smoke-that-drives-the-demon
  ('apocrypha', 'tobit', 6, 17, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The devil that smells the smoke and flees, never to return, is the same enemy that flees before submission to Elohim, in Tobit 6:17.'),
  ('apocrypha', 'tobit', 6, 7, 'canon', 'luke', 8, 29, 'free', E'Luke 8:29 — *(For he had commanded the unclean spirit to come out of the man. For oftentimes it had caught him: and he was kept bound with chains and in fetters; and he brake the bands, and was driven of the devil into the wilderness.)* The evil spirit that troubles and vexes a man or woman until it is driven off answers the unclean spirit cast out at the Master''s command, in Tobit 6:7.'),
  -- thread: tobit-6-kinsmans-right-seed-kept
  ('apocrypha', 'tobit', 6, 12, 'canon', 'numbers', 36, 8, 'free', E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* The right of inheritance that binds Sara to her kinsman Tobias is the very statute keeping a daughter''s inheritance within her father''s tribe, in Tobit 6:12.'),
  ('apocrypha', 'tobit', 6, 11, 'canon', 'deuteronomy', 25, 5, 'free', E'Deuteronomy 25:5 — *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her.* The right of Sara appertaining to Tobias as her near kinsman echoes the kinsman''s duty to raise up the dead man''s name from his own house, in Tobit 6:11.'),
  -- thread: tobit-6-bride-appointed-from-the-beginning
  ('apocrypha', 'tobit', 6, 17, 'canon', 'genesis', 24, 14, 'free', E'Genesis 24:14 — *And let it come to pass, that the damsel to whom I shall say, Let down thy pitcher, I pray thee, that I may drink; and she shall say, Drink, and I will give thy camels drink also: let the same be she that thou hast appointed for thy servant Isaac; and thereby shall I know that thou hast shewed kindness unto my master.* Sara appointed to Tobias from the beginning answers the damsel the servant prays Yahuah has appointed for Isaac, in Tobit 6:17.'),
  ('apocrypha', 'tobit', 6, 17, 'canon', 'genesis', 24, 15, 'free', E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* The appointed bride given that same night without fail mirrors Rebekah appearing before the prayer was even finished, in Tobit 6:17.'),
  ('apocrypha', 'tobit', 6, 12, 'canon', 'proverbs', 19, 14, 'free', E'Proverbs 19:14 — *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* The fair and wise maid joined to her kinsman by the right of inheritance is the very prudent wife that is the LORD''s own gift, in Tobit 6:12.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-the-fish-by-the-river',
       E'The Fish Taken from the River',
       E'By the Tigris a fish leaps up to devour the young man, and the angel turns the threat into provision: *And when the young man went down to wash himself, a fish leaped out of the river, and would have devoured him.* (Tobit 6:2) *Then the angel said to him, Take the fish. And the young man laid hold of the fish, and drew it to land.* (Tobit 6:3) What rose up to destroy is laid hold of and made into food and medicine — the same turning Joseph names, *ye thought evil against me; but Elohim (God) meant it unto good* (Genesis 50:20). The waters that menace become the waters that heal in the prophet''s vision: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12) It ain''t new — the river that healeth runs from Eden to the throne.',
       sv.verse_id, ev.verse_id, 'extras', 59725
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-gall-for-healing-eyes',
       E'The Gall That Opens Blind Eyes',
       E'The angel sets aside the inward parts of the fish for healing: *To whom the angel said, Open the fish, and take the heart and the liver and the gall, and put them up safely.* (Tobit 6:4) *As for the gall, it is good to anoint a man that has whiteness in his eyes, and he shall be healed.* (Tobit 6:8) This stored remedy reaches forward to old Tobit, whose blindness it will cure, and it foreshadows the anointing that opens eyes: *He answered and said, A man that is called Yahusha made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.* (John 9:11) The healing of the body sealed up in the fish is the same mercy the Master pours out, and the same He commits to His own: *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* (Mark 16:18) It ain''t new — Yahuah is the One who healeth.',
       sv.verse_id, ev.verse_id, 'extras', 59728
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-smoke-that-drives-the-demon',
       E'The Smoke That Drives the Demon Away',
       E'The angel teaches that the heart and liver, smoked, expel the tormenting spirit: *And he said to him, Touching the heart and the liver, if a devil or an evil spirit trouble any, we must make a smoke thereof before the man or the woman, and the party shall be no more vexed.* (Tobit 6:7) *And the devil shall smell it, and flee away, and never come again any more* (Tobit 6:17) — yet the smoke is never severed from the prayer that follows it: *but when you shall come to her, rise up both of you, and pray to Yahuah (God) which is merciful* (Tobit 6:17). The fleeing of the demon is the covenant pattern: the unclean spirit cannot stand before submission to Elohim — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) And the bound and vexed are set free at His word: *(For he had commanded the unclean spirit to come out of the man. For oftentimes it had caught him: and he was kept bound with chains and in fetters; and he brake the bands, and was driven of the devil into the wilderness.)* (Luke 8:29) It ain''t new — the powers of darkness flee before Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59731
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-kinsmans-right-seed-kept',
       E'The Kinsman''s Right — The Seed Kept in the Tribe',
       E'The angel claims Sara for Tobias by the law of inheritance within the kindred: *For to you does the right of her appertain, seeing you only art of her kindred.* (Tobit 6:11) *for I know that Raguel cannot marry her to another according to the law of Moses, but he shall be guilty of death, because the right of inheritance does rather appertain to you than to any other.* (Tobit 6:12) This is no novelty but Torah kept in exile — the daughters of an inheritance married within their own tribe so the lot is not removed: *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* (Numbers 36:8) It is the kinsman''s duty to raise up the name that else were cut off: *her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her.* (Deuteronomy 25:5) The scattered house of Israel keeps the seed-line whole even in Media — the inheritance is not lost. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59734
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-bride-appointed-from-the-beginning',
       E'Fear Not — She Is Appointed Unto Thee',
       E'The angel stills Tobias''s dread of death and names Sara the bride ordained for him: *fear not, for she is appointed to you from the beginning; and you shall preserve her, and she shall go with you.* (Tobit 6:17) *And the maid is fair and wise* (Tobit 6:12) — the destined wife, like Rebekah at the well, is shown to be the LORD''s own choosing: *let the same be she that thou hast appointed for thy servant Isaac; and thereby shall I know that thou hast shewed kindness unto my master.* (Genesis 24:14) The bride appointed is not chance but providence answered before the prayer is finished: *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* (Genesis 24:15) And the wise and fair maid is Yahuah''s gift: *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* (Proverbs 19:14) It ain''t new — the appointed bride is given of the LORD.',
       sv.verse_id, ev.verse_id, 'extras', 59737
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-6-the-fish-by-the-river
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The fish that leaped up to devour is turned, like Joseph''s harm, into the means of saving life, in Tobit 6:2.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-the-fish-by-the-river'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The fish drawn from the river to feed and to heal answers the river whose very waters and fruit are medicine, in Tobit 6:3.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-the-fish-by-the-river'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-gall-for-healing-eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 9:11 — *He answered and said, A man that is called Yahusha made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.* The gall laid up to anoint whitened eyes and give sight prefigures the anointing of clay that opens the blind man''s eyes, in Tobit 6:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-gall-for-healing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 16:18 — *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* The heart, liver, and gall kept safely for the recovery of the afflicted answer the laying on of hands by which the sick recover, in Tobit 6:4.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-gall-for-healing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-smoke-that-drives-the-demon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The devil that smells the smoke and flees, never to return, is the same enemy that flees before submission to Elohim, in Tobit 6:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-smoke-that-drives-the-demon'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 8:29 — *(For he had commanded the unclean spirit to come out of the man. For oftentimes it had caught him: and he was kept bound with chains and in fetters; and he brake the bands, and was driven of the devil into the wilderness.)* The evil spirit that troubles and vexes a man or woman until it is driven off answers the unclean spirit cast out at the Master''s command, in Tobit 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-smoke-that-drives-the-demon'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-kinsmans-right-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* The right of inheritance that binds Sara to her kinsman Tobias is the very statute keeping a daughter''s inheritance within her father''s tribe, in Tobit 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-kinsmans-right-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:5 — *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her.* The right of Sara appertaining to Tobias as her near kinsman echoes the kinsman''s duty to raise up the dead man''s name from his own house, in Tobit 6:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-kinsmans-right-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-bride-appointed-from-the-beginning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:14 — *And let it come to pass, that the damsel to whom I shall say, Let down thy pitcher, I pray thee, that I may drink; and she shall say, Drink, and I will give thy camels drink also: let the same be she that thou hast appointed for thy servant Isaac; and thereby shall I know that thou hast shewed kindness unto my master.* Sara appointed to Tobias from the beginning answers the damsel the servant prays Yahuah has appointed for Isaac, in Tobit 6:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-bride-appointed-from-the-beginning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* The appointed bride given that same night without fail mirrors Rebekah appearing before the prayer was even finished, in Tobit 6:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-bride-appointed-from-the-beginning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 19:14 — *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* The fair and wise maid joined to her kinsman by the right of inheritance is the very prudent wife that is the LORD''s own gift, in Tobit 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-bride-appointed-from-the-beginning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_07.sql (session253 tobit 7) -----
-- Source anchor: apocrypha/tobit ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob7 (view _session253_tob7_lookup). Sort band base 59750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-7-kinsman-recognized
  ('apocrypha', 'tobit', 7, 6, 'canon', 'genesis', 29, 13, 'free', E'Genesis 29:13 — *And it came to pass, when Laban heard the tidings of Jacob his sister’s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house. And he told Laban all these things.* Raguel leaping up to kiss and weep over Tobit''s son re-enacts Laban running to embrace his sister''s son Jacob.'),
  ('apocrypha', 'tobit', 7, 7, 'canon', 'genesis', 29, 14, 'free', E'Genesis 29:14 — *And Laban said to him, Surely thou art my bone and my flesh. And he abode with him the space of a month.* Raguel''s blessing — *You are the son of an honest and good man* — names the same bone-and-flesh kinship that binds Tobias into Raguel''s house.'),
  ('apocrypha', 'tobit', 7, 4, 'canon', 'genesis', 29, 5, 'free', E'Genesis 29:5 — *And he said unto them, Know ye Laban the son of Nahor? And they said, We know him.* Raguel''s *Do you know Tobit our kinsman? And they said, We know him* repeats Jacob''s well-side recognition of the kindred verbatim in pattern.'),
  -- thread: tobit-7-wife-of-thine-own-kindred
  ('apocrypha', 'tobit', 7, 12, 'canon', 'genesis', 24, 4, 'free', E'Genesis 24:4 — *But thou shalt go unto my country, and to my kindred, and take a wife unto my son Isaac.* Raguel granting Sara because *you are her cousin* keeps Abraham''s charge to seek the bride from his own kindred, not the nations.'),
  ('apocrypha', 'tobit', 7, 10, 'canon', 'numbers', 36, 6, 'free', E'Numbers 36:6 — *This is the thing which Yahuah (LORD) doth command concerning the daughters of Zelophehad, saying, Let them marry to whom they think best; only to the family of the tribe of their father shall they marry.* Raguel''s *it is meet that you should marry my daughter* obeys the same statute binding an heiress to a man of her father''s tribe.'),
  ('apocrypha', 'tobit', 7, 10, 'canon', 'numbers', 36, 8, 'free', E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* Sara, the only daughter, is given to her cousin so the inheritance of Nephthalim is not removed from the tribe.'),
  ('apocrypha', 'tobit', 7, 9, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The marriage made within the kindred is the obverse of the marriage forbidden with the nations — Tobias seeks Sara precisely because she is of the covenant seed.'),
  -- thread: tobit-7-written-sealed-covenant
  ('apocrypha', 'tobit', 7, 13, 'canon', 'genesis', 24, 51, 'free', E'Genesis 24:51 — *Behold, Rebekah is before thee, take her, and go, and let her be thy master’s son’s wife, as Yahuah (LORD) hath spoken.* Raguel taking Sara by the hand and saying *take her after the law of Moses, and lead her away to your father* echoes Bethuel and Laban giving Rebekah to be Isaac''s wife.'),
  ('apocrypha', 'tobit', 7, 12, 'canon', 'genesis', 24, 50, 'free', E'Genesis 24:50 — *Then Laban and Bethuel answered and said, The thing proceedeth from Yahuah (LORD): we cannot speak unto thee bad or good.* Raguel''s *the merciful Yahuah (God) give you good success in all things* reads the betrothal, like Rebekah''s, as proceeding from Yahuah Himself.'),
  ('apocrypha', 'tobit', 7, 14, 'canon', 'ruth', 4, 10, 'free', E'Ruth 4:10 — *Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren, and from the gate of his place: ye are witnesses this day.* The sealed instrument of covenants in Tobit is the same witnessed marriage-deed by which Boaz, the kinsman, secures the bride and the inheritance.'),
  ('apocrypha', 'tobit', 7, 13, 'canon', 'mark', 10, 7, 'free', E'Mark 10:7 — *For this cause shall a man leave his father and mother, and cleave to his wife;* the bride led away to the bridegroom''s father after the law of Moses is the leaving-and-cleaving the Messiah grounds in the creation order.'),
  -- thread: tobit-7-the-wedding-feast
  ('apocrypha', 'tobit', 7, 15, 'canon', 'genesis', 29, 22, 'free', E'Genesis 29:22 — *And Laban gathered together all the men of the place, and made a feast.* Raguel''s table after the sealed covenant — *Then they began to eat* — is the kinsman''s wedding feast that Laban makes for Jacob and Rachel.'),
  ('apocrypha', 'tobit', 7, 9, 'canon', 'genesis', 24, 54, 'free', E'Genesis 24:54 — *And they did eat and drink, he and the men that were with him, and tarried all night; and they rose up in the morning, and he said, Send me away unto my master.* Raguel''s *Eat and drink, and make merry* matches the betrothal meal at Bethuel''s house before the bride is led home.'),
  -- thread: tobit-7-blessing-of-the-bride
  ('apocrypha', 'tobit', 7, 18, 'canon', 'genesis', 24, 60, 'free', E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Edna''s *Yahuah (God) of heaven and earth give you joy* sends Sara out under the same household blessing pronounced over Rebekah as she leaves for Isaac.'),
  ('apocrypha', 'tobit', 7, 18, 'canon', 'ruth', 4, 11, 'free', E'Ruth 4:11 — *And all the people that were in the gate, and the elders, said, We are witnesses. Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el (Israel): and do thou worthily in Ephratah, and be famous in Beth-lehem:* the blessing turning Sara''s sorrow to joy is the same bridal benediction the gate pronounces over Ruth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-kinsman-recognized',
       E'He ran to meet his kinsman: the welcome at the well-house',
       E'Tobias arrives a stranger and is known by his face: *Then said Raguel to Edna his wife, How like is this young man to Tobit my cousin!* (Tobit 7:2), and when the line is confirmed, *Then Raguel leaped up, and kissed him, and wept* (Tobit 7:6). It ain''t new — this is the patriarchs'' own welcome of the kinsman come from afar. When Jacob comes east to the house of his mother''s brother, *And it came to pass, when Laban heard the tidings of Jacob his sister''s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house* (Genesis 29:13), and the bond is named, *Surely thou art my bone and my flesh* (Genesis 29:14). The mutual recognition at the well — *And he said unto them, Know ye Laban the son of Nahor? And they said, We know him* (Genesis 29:5) — is the very shape of Raguel''s question after Tobit. The scattered house of Yashar''el, captive in Nineveh, still knows its own across the exile.',
       sv.verse_id, ev.verse_id, 'extras', 59750
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-wife-of-thine-own-kindred',
       E'A wife of thine own kindred: the seed kept within the tribe',
       E'Raguel gives Sara because the right is Tobias''s own: *For it is meet that you should marry my daughter* (Tobit 7:10), *for you are her cousin, and she is yours* (Tobit 7:12). It ain''t new — this is the Torah''s own guarding of the inheritance within the tribe. Abraham binds his servant by oath, *thou shalt not take a wife unto my son of the daughters of the Canaanites... But thou shalt go unto my country, and to my kindred, and take a wife unto my son Isaac* (Genesis 24:3-4); the daughters of Zelophehad are commanded, *only to the family of the tribe of their father shall they marry* (Numbers 36:6), *that the children of Yashar''el may enjoy every man the inheritance of his fathers* (Numbers 36:8). The exile has not loosed the covenant of the seed-line; in Nineveh the law of Moses still orders the marriage.',
       sv.verse_id, ev.verse_id, 'extras', 59753
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-written-sealed-covenant',
       E'Took her after the law of Moses: the written and sealed covenant',
       E'The marriage is no mere feeling but a sworn, written deed: Tobias will not eat *till we agree and swear one to another* (Tobit 7:11); Raguel takes Sara by the hand and gives her, *Behold, take her after the law of Moses, and lead her away to your father* (Tobit 7:13); then *took paper, and did write an instrument of covenants, and sealed it* (Tobit 7:14). It ain''t new — this is how Israel binds a marriage covenant. When the bride is asked for, the kindred answer, *The thing proceedeth from Yahuah (LORD)... Behold, Rebekah is before thee, take her, and go* (Genesis 24:50-51). At the gate Boaz makes the kinsman-covenant before witnesses, *to raise up the name of the dead upon his inheritance... ye are witnesses this day* (Ruth 4:10). And the Messiah Himself anchors marriage in the law of Moses and the creation order, *For this cause shall a man leave his father and mother, and cleave to his wife* (Mark 10:7).',
       sv.verse_id, ev.verse_id, 'extras', 59756
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-the-wedding-feast',
       E'Then they began to eat: the kinsman''s wedding feast',
       E'Covenant struck, the table is spread: *And the merciful Yahuah (God) give you good success in all things* (Tobit 7:12), and after the deed is sealed, *Then they began to eat* (Tobit 7:15). It ain''t new — when Jacob''s seven years are fulfilled, *Laban gathered together all the men of the place, and made a feast* (Genesis 29:22); and at the betrothal of Rebekah the kindred *did eat and drink, he and the men that were with him, and tarried all night* (Genesis 24:54). The covenant of the seed is sealed and then celebrated at meat, the same pattern that ripens into the marriage-supper of the Lamb.',
       sv.verse_id, ev.verse_id, 'extras', 59759
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-blessing-of-the-bride',
       E'Be of good comfort, my daughter: the blessing sent with the bride',
       E'Edna sends Sara out under a blessing, not a curse: *Be of good comfort, my daughter; Yahuah (God) of heaven and earth give you joy for this your sorrow* (Tobit 7:18), even as she *received the tears of her daughter* (Tobit 7:17). It ain''t new — this is the mother''s house blessing the bride as she goes. Rebekah is sent with the same word, *Thou art our sister, be thou the mother of thousands of millions* (Genesis 24:60); and at Ruth''s marriage the people pray, *Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el* (Ruth 4:11). The daughter of the scattered house goes out to her husband carrying the blessing of the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 59762
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-7-kinsman-recognized
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:13 — *And it came to pass, when Laban heard the tidings of Jacob his sister’s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house. And he told Laban all these things.* Raguel leaping up to kiss and weep over Tobit''s son re-enacts Laban running to embrace his sister''s son Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-kinsman-recognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:14 — *And Laban said to him, Surely thou art my bone and my flesh. And he abode with him the space of a month.* Raguel''s blessing — *You are the son of an honest and good man* — names the same bone-and-flesh kinship that binds Tobias into Raguel''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-kinsman-recognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:5 — *And he said unto them, Know ye Laban the son of Nahor? And they said, We know him.* Raguel''s *Do you know Tobit our kinsman? And they said, We know him* repeats Jacob''s well-side recognition of the kindred verbatim in pattern.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-kinsman-recognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-wife-of-thine-own-kindred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:4 — *But thou shalt go unto my country, and to my kindred, and take a wife unto my son Isaac.* Raguel granting Sara because *you are her cousin* keeps Abraham''s charge to seek the bride from his own kindred, not the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 36:6 — *This is the thing which Yahuah (LORD) doth command concerning the daughters of Zelophehad, saying, Let them marry to whom they think best; only to the family of the tribe of their father shall they marry.* Raguel''s *it is meet that you should marry my daughter* obeys the same statute binding an heiress to a man of her father''s tribe.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* Sara, the only daughter, is given to her cousin so the inheritance of Nephthalim is not removed from the tribe.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The marriage made within the kindred is the obverse of the marriage forbidden with the nations — Tobias seeks Sara precisely because she is of the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-written-sealed-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:51 — *Behold, Rebekah is before thee, take her, and go, and let her be thy master’s son’s wife, as Yahuah (LORD) hath spoken.* Raguel taking Sara by the hand and saying *take her after the law of Moses, and lead her away to your father* echoes Bethuel and Laban giving Rebekah to be Isaac''s wife.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:50 — *Then Laban and Bethuel answered and said, The thing proceedeth from Yahuah (LORD): we cannot speak unto thee bad or good.* Raguel''s *the merciful Yahuah (God) give you good success in all things* reads the betrothal, like Rebekah''s, as proceeding from Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ruth 4:10 — *Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren, and from the gate of his place: ye are witnesses this day.* The sealed instrument of covenants in Tobit is the same witnessed marriage-deed by which Boaz, the kinsman, secures the bride and the inheritance.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 10:7 — *For this cause shall a man leave his father and mother, and cleave to his wife;* the bride led away to the bridegroom''s father after the law of Moses is the leaving-and-cleaving the Messiah grounds in the creation order.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-the-wedding-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:22 — *And Laban gathered together all the men of the place, and made a feast.* Raguel''s table after the sealed covenant — *Then they began to eat* — is the kinsman''s wedding feast that Laban makes for Jacob and Rachel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-the-wedding-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:54 — *And they did eat and drink, he and the men that were with him, and tarried all night; and they rose up in the morning, and he said, Send me away unto my master.* Raguel''s *Eat and drink, and make merry* matches the betrothal meal at Bethuel''s house before the bride is led home.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-the-wedding-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-blessing-of-the-bride
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Edna''s *Yahuah (God) of heaven and earth give you joy* sends Sara out under the same household blessing pronounced over Rebekah as she leaves for Isaac.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-blessing-of-the-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ruth 4:11 — *And all the people that were in the gate, and the elders, said, We are witnesses. Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el (Israel): and do thou worthily in Ephratah, and be famous in Beth-lehem:* the blessing turning Sara''s sorrow to joy is the same bridal benediction the gate pronounces over Ruth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-blessing-of-the-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_08.sql (session253 tobit 8) -----
-- Source anchor: apocrypha/tobit ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob8 (view _session253_tob8_lookup). Sort band base 59775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-8-the-binding-of-the-enemy
  ('apocrypha', 'tobit', 8, 3, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* the same word over the enemy that Tobit 8:3 sees in small — the angel bound him.'),
  ('apocrypha', 'tobit', 8, 3, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* As the demon is driven to the utmost parts and shut away, so the dragon is sealed in the pit (Tobit 8:3).'),
  ('apocrypha', 'tobit', 8, 3, 'canon', 'matthew', 12, 29, 'free', E'Matthew 12:29 — *Or else how can one enter into a strong man’s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the enemy must come first before the household is freed — Asmodeus bound, the marriage delivered (Tobit 8:3).'),
  ('apocrypha', 'tobit', 8, 3, 'canon', 'luke', 10, 19, 'free', E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The authority that binds and treads the enemy is given to the faithful, as the angel exercised it for Tobias (Tobit 8:3).'),
  -- thread: tobit-8-arise-and-let-us-pray
  ('apocrypha', 'tobit', 8, 4, 'canon', 'ephesians', 5, 3, 'free', E'Ephesians 5:3 — *But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;* the very holiness Tobias guards when he rises to pray rather than to lust (Tobit 8:4).'),
  ('apocrypha', 'tobit', 8, 4, 'canon', 'ephesians', 5, 32, 'free', E'Ephesians 5:32 — *This is a great mystery: but I speak concerning Messiah (Christ) and the church.* The prayer-hallowed marriage of Tobias points beyond itself to the covenant union it figures (Tobit 8:4).'),
  -- thread: tobit-8-thou-madest-adam-and-eve
  ('apocrypha', 'tobit', 8, 6, 'canon', 'genesis', 2, 18, 'free', E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The very word Tobias prays back to Yahuah as the ground of his marriage (Tobit 8:6).'),
  ('apocrypha', 'tobit', 8, 6, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The one-flesh covenant Tobias and Sarah enter is the creation ordinance Tobit 8:6 invokes.'),
  ('apocrypha', 'tobit', 8, 6, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The making of Adam and Eve that Tobit 8:6 recalls as the pattern of his own marriage.'),
  -- thread: tobit-8-not-for-lust-but-uprightly
  ('apocrypha', 'tobit', 8, 7, 'canon', 'malachi', 2, 15, 'free', E'Malachi 2:15 — *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* The godly-seed purpose of marriage is precisely Tobias’s not-for-lust-but-uprightly (Tobit 8:7).'),
  ('apocrypha', 'tobit', 8, 7, 'canon', 'malachi', 2, 14, 'free', E'Malachi 2:14 — *Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* Yahuah is the witness of the marriage covenant Tobias makes openly before him (Tobit 8:7).'),
  ('apocrypha', 'tobit', 8, 7, 'canon', 'ephesians', 5, 25, 'free', E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* the sacrificial, lifelong love that Tobias prays to live out, to grow aged together (Tobit 8:7).'),
  -- thread: tobit-8-let-all-thy-creatures-praise-thee
  ('apocrypha', 'tobit', 8, 5, 'canon', 'psalms', 148, 2, 'free', E'Psalms 148:2 — *Praise ye him, all his angels: praise ye him, all his hosts.* The heavens and creatures Tobias bids bless Yahuah are the very hosts Psalm 148 musters (Tobit 8:5).'),
  ('apocrypha', 'tobit', 8, 5, 'canon', 'psalms', 148, 5, 'free', E'Psalms 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* All creatures praising their Maker is the ground of Tobias’s blessing of the holy and glorious name (Tobit 8:5).'),
  ('apocrypha', 'tobit', 8, 15, 'apocrypha', 'tobit', 13, 18, 'extras', E'Tobit 13:18 — *And all her streets shall say, Alleluia; and they shall praise him, saying, Blessed be Yahuah (God), which has extolled it for ever.* Raguel’s call for saints, angels, and elect to praise forever is taken up in Tobit’s hymn of the regathered Jerusalem (Tobit 8:15).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-the-binding-of-the-enemy',
       E'The angel bound him — the binding of the enemy',
       E'When the smoke of the heart and liver rose, *The which smell when the evil spirit had smelled, he fled into the utmost parts of Egypt, and the angel bound him.* (Tobit 8:3). It ain''t new — the seed-war of Eden runs to its end, and the enemy is not merely cast out but *bound*. John saw the same chain: *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* (Revelation 20:2), and the angel *cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more* (Revelation 20:3). The Messiah teaches that no house is spoiled till the strong man is first tied: *Or else how can one enter into a strong man’s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* (Matthew 12:29). And He hands that authority to the gathered: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* (Luke 10:19). Asmodeus fleeing and bound is a sign of the whole — the dragon shut up, the bridal chamber kept.',
       sv.verse_id, ev.verse_id, 'extras', 59775
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-arise-and-let-us-pray',
       E'Arise, and let us pray — the marriage begun in prayer',
       E'Before the bridal night, Tobias does not turn to lust but to Yahuah: *And after that they were both shut in together, Tobias rose out of the bed, and said, Sister, arise, and let us pray that Yahuah (God) would have pity on us.* (Tobit 8:4). Marriage opened with prayer is the Torah pattern of the holy seed kept clean. Paul gives the same charge to the saints, that uncleanness be not once named among them: *But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;* (Ephesians 5:3). And he weds the one-flesh covenant to a higher mystery: *This is a great mystery: but I speak concerning Messiah (Christ) and the church.* (Ephesians 5:32). The chamber of Tobias and Sarah, hallowed by prayer, is a small window onto the marriage of the Lamb.',
       sv.verse_id, ev.verse_id, 'extras', 59778
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-thou-madest-adam-and-eve',
       E'Thou madest Adam, and gavest him Eve — marriage as the Edenic covenant',
       E'Tobias’s prayer reaches back past the Law to the garden itself: *You madest Adam, and gavest him Eve his wife for an helper and stay: of them came mankind: you have said, It is not good that man should be alone; let us make to him an aid like to himself.* (Tobit 8:6). He is quoting Genesis from memory in exile — the foundation of marriage in the creation ordinance. *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* (Genesis 2:18). And the one-flesh decree: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). At the first, *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). It ain’t new — the wedding at Ecbatana is the wedding of Eden renewed, the holy seed continued.',
       sv.verse_id, ev.verse_id, 'extras', 59781
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-not-for-lust-but-uprightly',
       E'Not for lust but uprightly — the godly seed',
       E'Tobias names his intent before Yahuah: *And now, O Yahuah (God), I take not this my sister for lust but uprightly: therefore mercifully ordain that we may become aged together.* (Tobit 8:7). This is Malachi’s purpose of marriage exactly — covenant faithfulness for the sake of a holy line. *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* (Malachi 2:15), for *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* (Malachi 2:14). Paul charges husbands to that same self-giving love: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* (Ephesians 5:25). To grow old together, not for lust but in truth — this is the seed kept faithful.',
       sv.verse_id, ev.verse_id, 'extras', 59784
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-let-all-thy-creatures-praise-thee',
       E'Let all thy creatures praise thee — the whole creation blesses Yahuah',
       E'Tobias opens his prayer summoning all creation to bless its Maker: *Then began Tobias to say, Blessed art you, O Yahuah (God) of our fathers, and blessed is your holy and glorious name for ever; let the heavens bless you, and all your creatures.* (Tobit 8:5). Raguel answers in kind: *Then Raguel praised Yahuah (God), and said, O Yahuah (God), you are worthy to be praised with all pure and holy praise; therefore let your saints praise you with all your creatures; and let all your angels and your elect praise you for ever.* (Tobit 8:15). This is the song of Psalm 148 — heaven, hosts, and every creature called to one chorus. *Praise ye him, all his angels: praise ye him, all his hosts.* (Psalms 148:2), *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* (Psalms 148:5). The same praise rises in Tobit’s own later song, when the scattered house is gathered home: *And all her streets shall say, Alleluia; and they shall praise him, saying, Blessed be Yahuah (God), which has extolled it for ever.* (Tobit 13:18).',
       sv.verse_id, ev.verse_id, 'extras', 59787
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-8-the-binding-of-the-enemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* the same word over the enemy that Tobit 8:3 sees in small — the angel bound him.'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* As the demon is driven to the utmost parts and shut away, so the dragon is sealed in the pit (Tobit 8:3).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:29 — *Or else how can one enter into a strong man’s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the enemy must come first before the household is freed — Asmodeus bound, the marriage delivered (Tobit 8:3).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The authority that binds and treads the enemy is given to the faithful, as the angel exercised it for Tobias (Tobit 8:3).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-arise-and-let-us-pray
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 5:3 — *But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;* the very holiness Tobias guards when he rises to pray rather than to lust (Tobit 8:4).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-arise-and-let-us-pray'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 5:32 — *This is a great mystery: but I speak concerning Messiah (Christ) and the church.* The prayer-hallowed marriage of Tobias points beyond itself to the covenant union it figures (Tobit 8:4).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-arise-and-let-us-pray'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-thou-madest-adam-and-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The very word Tobias prays back to Yahuah as the ground of his marriage (Tobit 8:6).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-thou-madest-adam-and-eve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The one-flesh covenant Tobias and Sarah enter is the creation ordinance Tobit 8:6 invokes.'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-thou-madest-adam-and-eve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The making of Adam and Eve that Tobit 8:6 recalls as the pattern of his own marriage.'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-thou-madest-adam-and-eve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-not-for-lust-but-uprightly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 2:15 — *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* The godly-seed purpose of marriage is precisely Tobias’s not-for-lust-but-uprightly (Tobit 8:7).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-not-for-lust-but-uprightly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 2:14 — *Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* Yahuah is the witness of the marriage covenant Tobias makes openly before him (Tobit 8:7).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-not-for-lust-but-uprightly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* the sacrificial, lifelong love that Tobias prays to live out, to grow aged together (Tobit 8:7).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-not-for-lust-but-uprightly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-let-all-thy-creatures-praise-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 148:2 — *Praise ye him, all his angels: praise ye him, all his hosts.* The heavens and creatures Tobias bids bless Yahuah are the very hosts Psalm 148 musters (Tobit 8:5).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-let-all-thy-creatures-praise-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* All creatures praising their Maker is the ground of Tobias’s blessing of the holy and glorious name (Tobit 8:5).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-let-all-thy-creatures-praise-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:18 — *And all her streets shall say, Alleluia; and they shall praise him, saying, Blessed be Yahuah (God), which has extolled it for ever.* Raguel’s call for saints, angels, and elect to praise forever is taken up in Tobit’s hymn of the regathered Jerusalem (Tobit 8:15).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-let-all-thy-creatures-praise-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_09.sql (session253 tobit 9) -----
-- Source anchor: apocrypha/tobit ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob9 (view _session253_tob9_lookup). Sort band base 59800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-9-the-errand-entrusted
  ('apocrypha', 'tobit', 9, 2, 'canon', 'genesis', 24, 33, 'free', E'Genesis 24:33 — *And there was set meat before him to eat: but he said, I will not eat, until I have told mine errand. And he said, Speak on.* Abraham''s servant, like Raphael sent for Gabael''s money, holds his commission above his own comfort until the errand is discharged.'),
  ('apocrypha', 'tobit', 9, 4, 'canon', 'genesis', 24, 56, 'free', E'Genesis 24:56 — *And he said unto them, Hinder me not, seeing Yahuah (LORD) hath prospered my way; send me away that I may go to my master.* As Tobias frets that his father counteth the days, the faithful servant likewise refuses delay, pressing home the instant the charge is complete.'),
  ('apocrypha', 'tobit', 9, 2, 'canon', 'matthew', 24, 45, 'free', E'Matthew 24:45 — *Who then is a faithful and wise servant, whom his lord hath made ruler over his household, to give them meat in due season?* Raphael, entrusted with the camels and the money for the wedding, is the very image of the trusted servant set over his lord''s affairs.'),
  ('apocrypha', 'tobit', 9, 5, 'canon', 'matthew', 24, 46, 'free', E'Matthew 24:46 — *Blessed is that servant, whom his lord when he cometh shall find so doing.* Raphael is found doing exactly his charge — lodging with Gabael and receiving the sealed bags — the blessed faithfulness the Master praises.'),
  ('apocrypha', 'tobit', 9, 5, 'apocrypha', 'tobit', 12, 14, 'extras', E'Tobit 12:14 — *And now Yahuah (God) has sent me to heal you and Sara your daughter in law.* The errand-runner of chapter 9 is unveiled three chapters on as the very angel Yahuah sent, carrying the household''s good far beyond a sack of silver.'),
  -- thread: tobit-9-the-angel-sent-and-prospered
  ('apocrypha', 'tobit', 9, 5, 'canon', 'genesis', 24, 40, 'free', E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father''s house:* The sealed bags pass freely to Raphael because the same promised angel goes with him to prosper the errand.'),
  ('apocrypha', 'tobit', 9, 2, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobias''s long journey to Rages is kept safe by the very angel-charge the Psalm promises the trusting traveller.'),
  ('apocrypha', 'tobit', 9, 5, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* The companion who goes out and returns for Tobias is, like Gabriel, an angel sent forth from before the throne.'),
  ('apocrypha', 'tobit', 9, 2, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* The Azarias dispatched to Gabael is later revealed as Raphael himself, one who goes in and out before Yahuah''s glory.'),
  -- thread: tobit-9-the-wedding-and-the-blessed-bride
  ('apocrypha', 'tobit', 9, 3, 'canon', 'genesis', 24, 55, 'free', E'Genesis 24:55 — *And her brother and her mother said, Let the damsel abide with us a few days, at the least ten; after that she shall go.* As Raguel swears Tobias shall not yet depart, so Rebekah''s kin would keep the bride a season before sending her on her way.'),
  ('apocrypha', 'tobit', 9, 6, 'canon', 'genesis', 24, 60, 'free', E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Tobias blessing his wife at the wedding echoes the kindred''s covenant-blessing over Rebekah, the seed of the house carried forward.'),
  ('apocrypha', 'tobit', 9, 6, 'canon', 'genesis', 24, 67, 'free', E'Genesis 24:67 — *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her: and Isaac was comforted after his mother''s death.* The morning union and blessing of Tobias and his wife answers the same pattern — the appointed bride received in love, the covenant household made whole.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-9-the-errand-entrusted',
       E'The Errand Entrusted — the faithful messenger sent to bring the treasure home',
       E'Tobias sends his angel-companion on the long road to recover the family pledge: *Then Tobias called Raphael, and said to him,* (Tobit 9:1) *Brother Azarias, take with you a servant, and two camels, and go to Rages of Media to Gabael, and bring me the money, and bring him to the wedding.* (Tobit 9:2). It ain''t new — this is the old pattern of the trusted servant sent out under oath to fetch what belongs to the house. Abraham''s eldest servant rises for the same errand and will not so much as eat until it is done: *And there was set meat before him to eat: but he said, I will not eat, until I have told mine errand. And he said, Speak on.* (Genesis 24:33), and when his work is finished he presses to return: *And he said unto them, Hinder me not, seeing Yahuah (LORD) hath prospered my way; send me away that I may go to my master.* (Genesis 24:56). The Master Himself names the servant who keeps such a charge: *Who then is a faithful and wise servant, whom his lord hath made ruler over his household, to give them meat in due season?* (Matthew 24:45) — *Blessed is that servant, whom his lord when he cometh shall find so doing.* (Matthew 24:46). And the companion on the road is no mere man: he is the one *Yahuah (God) has sent... to heal you and Sara your daughter in law* (Tobit 12:14), the messenger who carries the household''s good before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 59800
  FROM _session253_tob9_lookup sv, _session253_tob9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-9-the-angel-sent-and-prospered',
       E'The Angel Sent Before — the way made prosperous by an unseen escort',
       E'Raphael goes out and the sealed treasure is freely given into his hand: *So Raphael went out, and lodged with Gabael, and gave him the handwriting: who brought forth bags which were sealed up, and gave them to him.* (Tobit 9:5). The road is smooth because the traveller is no ordinary servant — he is an angel walking as a man. Abraham knew this provision: *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way...* (Genesis 24:40), and the Psalm sings the same guardianship: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11). When such a messenger at last names himself, the word is always the word of one *sent*: in the Gospel, *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19) — even as Raphael will declare, *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15).',
       sv.verse_id, ev.verse_id, 'extras', 59803
  FROM _session253_tob9_lookup sv, _session253_tob9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-9-the-wedding-and-the-blessed-bride',
       E'The Wedding Prolonged — the bride blessed and the feast not cut short',
       E'The errand finished, the messenger brings the kinsman to the marriage and the bridegroom blesses his wife: *And early in the morning they went forth both together, and came to the wedding: and Tobias blessed his wife.* (Tobit 9:6) — for Raguel had pressed the feast: *For Raguel has sworn that I shall not depart.* (Tobit 9:3). It ain''t new — the kindred of Rebekah likewise held the bride a while and then sent her with a blessing: *And her brother and her mother said, Let the damsel abide with us a few days, at the least ten; after that she shall go.* (Genesis 24:55), and they sent her out under the covenant-word of fruitfulness: *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* (Genesis 24:60). The same covenant kindness — the seed kept, the house joined, the bride blessed — runs from the well of Nahor to the wedding of Raguel.',
       sv.verse_id, ev.verse_id, 'extras', 59806
  FROM _session253_tob9_lookup sv, _session253_tob9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-9-the-errand-entrusted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:33 — *And there was set meat before him to eat: but he said, I will not eat, until I have told mine errand. And he said, Speak on.* Abraham''s servant, like Raphael sent for Gabael''s money, holds his commission above his own comfort until the errand is discharged.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:56 — *And he said unto them, Hinder me not, seeing Yahuah (LORD) hath prospered my way; send me away that I may go to my master.* As Tobias frets that his father counteth the days, the faithful servant likewise refuses delay, pressing home the instant the charge is complete.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:45 — *Who then is a faithful and wise servant, whom his lord hath made ruler over his household, to give them meat in due season?* Raphael, entrusted with the camels and the money for the wedding, is the very image of the trusted servant set over his lord''s affairs.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:46 — *Blessed is that servant, whom his lord when he cometh shall find so doing.* Raphael is found doing exactly his charge — lodging with Gabael and receiving the sealed bags — the blessed faithfulness the Master praises.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:14 — *And now Yahuah (God) has sent me to heal you and Sara your daughter in law.* The errand-runner of chapter 9 is unveiled three chapters on as the very angel Yahuah sent, carrying the household''s good far beyond a sack of silver.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-9-the-angel-sent-and-prospered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father''s house:* The sealed bags pass freely to Raphael because the same promised angel goes with him to prosper the errand.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobias''s long journey to Rages is kept safe by the very angel-charge the Psalm promises the trusting traveller.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* The companion who goes out and returns for Tobias is, like Gabriel, an angel sent forth from before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* The Azarias dispatched to Gabael is later revealed as Raphael himself, one who goes in and out before Yahuah''s glory.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-9-the-wedding-and-the-blessed-bride
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:55 — *And her brother and her mother said, Let the damsel abide with us a few days, at the least ten; after that she shall go.* As Raguel swears Tobias shall not yet depart, so Rebekah''s kin would keep the bride a season before sending her on her way.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-wedding-and-the-blessed-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Tobias blessing his wife at the wedding echoes the kindred''s covenant-blessing over Rebekah, the seed of the house carried forward.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-wedding-and-the-blessed-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 24:67 — *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her: and Isaac was comforted after his mother''s death.* The morning union and blessing of Tobias and his wife answers the same pattern — the appointed bride received in love, the covenant household made whole.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-wedding-and-the-blessed-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=67
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_10.sql (session253 tobit 10) -----
-- Source anchor: apocrypha/tobit ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob10 (view _session253_tob10_lookup). Sort band base 59825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-10-mourning-the-delayed-son
  ('apocrypha', 'tobit', 10, 5, 'canon', 'genesis', 37, 34, 'free', E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* As Jacob mourned the son he thought lost, so Anna in Tobit 10:5 mourns Tobias as good as dead, her own eyes'' light gone.'),
  ('apocrypha', 'tobit', 10, 7, 'canon', 'genesis', 37, 35, 'free', E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Anna''s ceaseless nightly weeping in Tobit 10:7 is Jacob''s refusal to be comforted — a parent set on going down to the grave for a son not truly lost.'),
  ('apocrypha', 'tobit', 10, 4, 'canon', 'genesis', 42, 36, 'free', E'Genesis 42:36 — *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me.* When a son delays, the bereaved-feeling father is the same voice that cries in Tobit 10:4, "My son is dead, seeing he stayeth long."'),
  -- thread: tobit-10-the-father-looking-for-the-son
  ('apocrypha', 'tobit', 10, 7, 'canon', 'luke', 15, 20, 'free', E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The parents who "look no more to see" their son in Tobit 10:7 are the watching father of the parable, eyes fixed on the road for the child''s return.'),
  ('apocrypha', 'tobit', 10, 9, 'canon', 'genesis', 42, 38, 'free', E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s dread of mischief "by the way" mirrors the aged parents Tobias hurries home to in Tobit 10:9, lest grief bring down their gray hairs.'),
  -- thread: tobit-10-blessing-at-the-parting
  ('apocrypha', 'tobit', 10, 11, 'canon', 'genesis', 24, 60, 'free', E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* As Rebekah was blessed and sent from her father''s house to her bridegroom, so Raguel blesses Sara and sends the couple away with a prosperous journey in Tobit 10:11.'),
  ('apocrypha', 'tobit', 10, 11, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Raguel''s prayer that the God of heaven give a prosperous journey in Tobit 10:11 echoes the promise spoken over Jacob''s road — kept in all his ways and brought home again.'),
  ('apocrypha', 'tobit', 10, 12, 'canon', 'psalms', 128, 6, 'free', E'Psalms 128:6 — *Yea, thou shalt see thy children’s children, and peace upon Yashar''el (Israel).* Edna''s longing in Tobit 10:12 to see her daughter''s children before she dies is the very blessing of the Torah-faithful house — to see one''s children''s children, and peace upon Israel.'),
  -- thread: tobit-10-honour-father-and-mother
  ('apocrypha', 'tobit', 10, 12, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* Raguel''s charge to honour her parents in Tobit 10:12 is the fifth commandment itself, the covenant word carried into the household of the dispersion.'),
  ('apocrypha', 'tobit', 10, 12, 'canon', 'ephesians', 6, 2, 'free', E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names the very commandment Raguel presses upon his daughter in Tobit 10:12 as the first with promise, binding the apocryphal counsel to the apostolic word.'),
  ('apocrypha', 'tobit', 10, 12, 'canon', 'ephesians', 6, 3, 'free', E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents — long life, well-being — answers Raguel''s hope in Tobit 10:12 to "hear good report of you," the blessing of a household in covenant order.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-mourning-the-delayed-son',
       E'The mother counts the days and bewails her son',
       E'Anna will not be comforted: *Now I care for nothing, my son, since I have let you go, the light of my eyes* (Tobit 10:5), and *she went out every day into the way which they went, and did eat no meat on the daytime, and ceased not whole nights to bewail her son Tobias* (Tobit 10:7). It ain''t new — this is Jacob over Joseph, the patriarch refusing all comfort: *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days* (Genesis 37:34), and *all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning* (Genesis 35). The same father grieves again when a son tarries: *Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away* (Genesis 42:36). The seed kept in exile carries Israel''s oldest sorrow — and its oldest hope of return.',
       sv.verse_id, ev.verse_id, 'extras', 59825
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-the-father-looking-for-the-son',
       E'Let me go, for my father and mother look no more to see me',
       E'Tobias breaks from the wedding feast for the homeward road: *Then Tobias said to Raguel, Let me go, for my father and my mother look no more to see me* (Tobit 10:7), and again *let me go to my father* (Tobit 10:9). The whole feeling is the watching parent on the road, scanning the horizon — which is exactly the heart Yahusha gives the Father in the parable: *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). The son who returns from a far country to a parent who has been watching every day — Tobit''s house already keeps that pattern, the scattered child gathered home.',
       sv.verse_id, ev.verse_id, 'extras', 59828
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-blessing-at-the-parting',
       E'Be the mother of thousands — the bride blessed and sent away',
       E'Raguel sends the couple off with a blessing on the journey: *And he blessed them, and sent them away, saying, Yahuah (God) of heaven give you a prosperous journey, my children* (Tobit 10:11), and Edna prays *grant that I may see your children of my daughter Sara before I die* (Tobit 10:12). It ain''t new — this is the marriage-blessing spoken over Rebekah as she is sent from her father''s house to her bridegroom: *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them* (Genesis 24:60). The same Spirit attends Sara, daughter of the exile: a bride sent forth, blessed for fruitfulness, the seed of Israel kept and multiplied.',
       sv.verse_id, ev.verse_id, 'extras', 59831
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-honour-father-and-mother',
       E'Honour your father and your mother in law',
       E'Raguel''s charge to his daughter is the fifth word of the covenant, spoken straight: *And he said to his daughter, Honour your father and your mother in law, which are now your parents, that I may hear good report of you* (Tobit 10:12). Torah kept in exile is never law-as-curse but the household''s living rule: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). And it is the one commandment Sha''ul names with promise: *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2), *that it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The same commandment, the same promise — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59834
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-10-mourning-the-delayed-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* As Jacob mourned the son he thought lost, so Anna in Tobit 10:5 mourns Tobias as good as dead, her own eyes'' light gone.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-mourning-the-delayed-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Anna''s ceaseless nightly weeping in Tobit 10:7 is Jacob''s refusal to be comforted — a parent set on going down to the grave for a son not truly lost.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-mourning-the-delayed-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:36 — *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me.* When a son delays, the bereaved-feeling father is the same voice that cries in Tobit 10:4, "My son is dead, seeing he stayeth long."'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-mourning-the-delayed-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-10-the-father-looking-for-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The parents who "look no more to see" their son in Tobit 10:7 are the watching father of the parable, eyes fixed on the road for the child''s return.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-the-father-looking-for-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s dread of mischief "by the way" mirrors the aged parents Tobias hurries home to in Tobit 10:9, lest grief bring down their gray hairs.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-the-father-looking-for-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-10-blessing-at-the-parting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* As Rebekah was blessed and sent from her father''s house to her bridegroom, so Raguel blesses Sara and sends the couple away with a prosperous journey in Tobit 10:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-blessing-at-the-parting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Raguel''s prayer that the God of heaven give a prosperous journey in Tobit 10:11 echoes the promise spoken over Jacob''s road — kept in all his ways and brought home again.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-blessing-at-the-parting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 128:6 — *Yea, thou shalt see thy children’s children, and peace upon Yashar''el (Israel).* Edna''s longing in Tobit 10:12 to see her daughter''s children before she dies is the very blessing of the Torah-faithful house — to see one''s children''s children, and peace upon Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-blessing-at-the-parting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-10-honour-father-and-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* Raguel''s charge to honour her parents in Tobit 10:12 is the fifth commandment itself, the covenant word carried into the household of the dispersion.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names the very commandment Raguel presses upon his daughter in Tobit 10:12 as the first with promise, binding the apocryphal counsel to the apostolic word.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents — long life, well-being — answers Raguel''s hope in Tobit 10:12 to "hear good report of you," the blessing of a household in covenant order.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_11.sql (session253 tobit 11) -----
-- Source anchor: apocrypha/tobit ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob11 (view _session253_tob11_lookup). Sort band base 59850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-11-gall-the-blind-see
  ('apocrypha', 'tobit', 11, 7, 'canon', 'isaiah', 35, 5, 'free', E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The prophet''s promise of opened eyes is the very thing Raphael foretells over Tobit in Tobit 11:7.'),
  ('apocrypha', 'tobit', 11, 8, 'canon', 'john', 9, 6, 'free', E'John 9:6 — *When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,* The Messiah anoints blind eyes by hand just as Tobias is told to anoint with the gall in Tobit 11:8.'),
  ('apocrypha', 'tobit', 11, 8, 'canon', 'john', 9, 7, 'free', E'John 9:7 — *And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* The blind man comes seeing after the washing, as Tobit''s whiteness falls away and he sees in Tobit 11:8.'),
  ('apocrypha', 'tobit', 11, 8, 'canon', 'mark', 8, 25, 'free', E'Mark 8:25 — *After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.* The two-stage touch that ends in clear sight mirrors the rubbing and peeling of the whiteness in Tobit 11:8.'),
  -- thread: tobit-11-whiteness-peeled-sight
  ('apocrypha', 'tobit', 11, 13, 'canon', 'psalms', 146, 8, 'free', E'Psalm 146:8 — *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous:* The psalm names Yahuah as the One who opens blind eyes, the true healer behind the gall that peels the whiteness in Tobit 11:13.'),
  ('apocrypha', 'tobit', 11, 11, 'canon', 'isaiah', 35, 5, 'free', E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The son''s striking of the gall on his father''s eyes accomplishes the prophesied opening of the blind in Tobit 11:11.'),
  -- thread: tobit-11-scourged-and-pitied
  ('apocrypha', 'tobit', 11, 15, 'canon', 'job', 5, 18, 'free', E'Job 5:18 — *For he maketh sore, and bindeth up: he woundeth, and his hands make whole.* The same hand that scourged Tobit now takes pity and heals, exactly as Job describes in Tobit 11:15.'),
  ('apocrypha', 'tobit', 11, 15, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* Tobit''s scourging-then-pity is read as a Father''s loving correction, not a curse, in Tobit 11:15.'),
  ('apocrypha', 'tobit', 11, 15, 'canon', 'psalms', 30, 5, 'free', E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* Tobit''s tears turn to joy at the sight of his son, the morning after the night of weeping in Tobit 11:15.'),
  -- thread: tobit-11-ran-fell-on-the-neck
  ('apocrypha', 'tobit', 11, 9, 'canon', 'luke', 15, 20, 'free', E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The father who runs and falls on the returning son''s neck is the very gesture Anna makes over Tobias in Tobit 11:9.'),
  -- thread: tobit-11-gathered-rejoicing-gate
  ('apocrypha', 'tobit', 11, 16, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons and daughters gathered home is the great pattern of which Tobit''s regathered household at the gate is a token in Tobit 11:16.'),
  ('apocrypha', 'tobit', 11, 17, 'canon', 'isaiah', 49, 18, 'free', E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* The gathering joy among all Tobit''s brethren mirrors the regathered children of restored Zion in Tobit 11:17.'),
  ('apocrypha', 'tobit', 11, 17, 'canon', 'psalms', 147, 2, 'free', E'Psalm 147:2 — *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* Yahuah''s gathering of the outcasts of Israel is the larger hope behind the joy among Tobit''s kindred at Nineveh in Tobit 11:17.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-gall-the-blind-see',
       E'The gall on the eyes — the blind shall see',
       E'Raphael''s word over the homecoming is a healing oracle: *Then said Raphael, I know, Tobias, that your father will open his eyes.* (Tobit 11:7) *Therefore anoint you his eyes with the gall, and being pricked with it, he shall rub, and the whiteness shall fall away, and he shall see you.* (Tobit 11:8) The prophets had already sung this hope of opened eyes — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5) — and Yahusha works the very sign Tobias enacts, anointing eyes with His own hand: *When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,* (John 9:6) and bids him *Go, wash in the pool of Siloam... He went his way therefore, and washed, and came seeing.* (John 9:7) At Bethsaida He lays hands twice till sight returns clear — *After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.* (Mark 8:25) It ain''t new: the touch that opens blind eyes runs from Tobit''s gall to the Messiah''s clay.',
       sv.verse_id, ev.verse_id, 'extras', 59850
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-whiteness-peeled-sight',
       E'The whiteness peeled away — Yahuah openeth the eyes of the blind',
       E'The healing is done in the son''s hands: *And took hold of his father: and he strake of the gall on his fathers'' eyes, saying, Be of good hope, my father.* (Tobit 11:11) *And the whiteness pilled away from the corners of his eyes: and when he saw his son, he fell upon his neck.* (Tobit 11:13) Scripture names the One who does this work behind the gall — *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous:* (Psalm 146:8). Tobit, the alms-giving righteous man bowed by his affliction, is lifted up; the gall is the means, but Yahuah is the healer, the prophesied opening of the blind made flesh — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5).',
       sv.verse_id, ev.verse_id, 'extras', 59853
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-scourged-and-pitied',
       E'Scourged, yet taken pity on — the chastening that heals',
       E'Tobit''s blessing reads his blindness as a Father''s discipline now turned to mercy: *And he wept, and said, Blessed art you, O Yahuah (God), and blessed is your name for ever; and blessed are all yours holy angels:* (Tobit 11:14) *For you have scourged, and have taken pity on me: for, behold, I see my son Tobias.* (Tobit 11:15) Job knew the same hand that wounds and binds — *For he maketh sore, and bindeth up: he woundeth, and his hands make whole.* (Job 5:18) — and the Spirit applies it to every son: *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6). This is never law-as-curse but a Father''s love; the night of weeping gives way to morning — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* (Psalm 30:5).',
       sv.verse_id, ev.verse_id, 'extras', 59856
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-ran-fell-on-the-neck',
       E'She ran and fell upon his neck — the embrace of the returned',
       E'The mother''s watching breaks into running joy: *Now Anna sat looking about toward the way for her son.* (Tobit 11:5) *Then Anna ran forth, and fell upon the neck of her son, and said to him, Seeing I have seen you, my son, from henceforth I am content to die. And they wept both.* (Tobit 11:9) The Messiah hangs the homecoming of the lost on this very picture — the father watching the road and running to embrace: *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* (Luke 15:20). Aged Anna''s content-to-die at the sight of her child is the joy of the long-awaited one beheld at last.',
       sv.verse_id, ev.verse_id, 'extras', 59859
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-gathered-rejoicing-gate',
       E'Joy at the gate — the kindred gathered home',
       E'The healed Tobit goes out to the gate and the scattered kindred are gathered in gladness: *Then Tobit went out to meet his daughter in law at the gate of Nineve, rejoicing and praising Yahuah (God): and they which saw him go marvelled, because he had received his sight.* (Tobit 11:16) *...And there was joy among all his brothers which were at Nineve.* (Tobit 11:17) Even in exile at Nineveh the household is regathered — a small token of the great ingathering of the scattered house (Ezekiel 37), never a church supplanting Israel but Israel itself drawn home. *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* (Isaiah 60:4); *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee...* (Isaiah 49:18); for Yahuah Himself *doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* (Psalm 147:2).',
       sv.verse_id, ev.verse_id, 'extras', 59862
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-11-gall-the-blind-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The prophet''s promise of opened eyes is the very thing Raphael foretells over Tobit in Tobit 11:7.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 9:6 — *When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,* The Messiah anoints blind eyes by hand just as Tobias is told to anoint with the gall in Tobit 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 9:7 — *And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* The blind man comes seeing after the washing, as Tobit''s whiteness falls away and he sees in Tobit 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 8:25 — *After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.* The two-stage touch that ends in clear sight mirrors the rubbing and peeling of the whiteness in Tobit 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=8 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-whiteness-peeled-sight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 146:8 — *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous:* The psalm names Yahuah as the One who opens blind eyes, the true healer behind the gall that peels the whiteness in Tobit 11:13.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-whiteness-peeled-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The son''s striking of the gall on his father''s eyes accomplishes the prophesied opening of the blind in Tobit 11:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-whiteness-peeled-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-scourged-and-pitied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 5:18 — *For he maketh sore, and bindeth up: he woundeth, and his hands make whole.* The same hand that scourged Tobit now takes pity and heals, exactly as Job describes in Tobit 11:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-scourged-and-pitied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* Tobit''s scourging-then-pity is read as a Father''s loving correction, not a curse, in Tobit 11:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-scourged-and-pitied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* Tobit''s tears turn to joy at the sight of his son, the morning after the night of weeping in Tobit 11:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-scourged-and-pitied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-ran-fell-on-the-neck
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The father who runs and falls on the returning son''s neck is the very gesture Anna makes over Tobias in Tobit 11:9.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-ran-fell-on-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-gathered-rejoicing-gate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons and daughters gathered home is the great pattern of which Tobit''s regathered household at the gate is a token in Tobit 11:16.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gathered-rejoicing-gate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* The gathering joy among all Tobit''s brethren mirrors the regathered children of restored Zion in Tobit 11:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gathered-rejoicing-gate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 147:2 — *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* Yahuah''s gathering of the outcasts of Israel is the larger hope behind the joy among Tobit''s kindred at Nineveh in Tobit 11:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gathered-rejoicing-gate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_12.sql (session253 tobit 12) -----
-- Source anchor: apocrypha/tobit ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob12 (view _session253_tob12_lookup). Sort band base 59875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-12-seven-holy-angels
  ('apocrypha', 'tobit', 12, 15, 'canon', 'revelation', 8, 2, 'free', E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John beholds the very seven holy angels Raphael names himself among in Tobit 12:15.'),
  ('apocrypha', 'tobit', 12, 15, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* This is the heavenly office Raphael describes in Tobit 12:15 — an angel presenting the prayers of the saints at the throne.'),
  ('apocrypha', 'tobit', 12, 15, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The saints'' prayers rising before the glory of the Holy One is exactly what Raphael did with Tobit''s prayer in Tobit 12:15.'),
  ('apocrypha', 'tobit', 12, 15, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel self-identifies as one who stands before the glory of Elohim, the same station Raphael claims in Tobit 12:15.'),
  -- thread: tobit-12-prayers-remembered
  ('apocrypha', 'tobit', 12, 12, 'canon', 'psalms', 141, 2, 'free', E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* David asks that his prayer rise as incense before Yahuah, which is the very thing Raphael carried out in Tobit 12:12.'),
  ('apocrypha', 'tobit', 12, 12, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The angel bearing the remembrance of prayers up to the throne matches Raphael bringing Tobit''s prayers before the Holy One in Tobit 12:12.'),
  ('apocrypha', 'tobit', 12, 12, 'canon', 'luke', 1, 13, 'free', E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The prayer heard and answered by a sent angel is the pattern Raphael reveals to Tobit in Tobit 12:12.'),
  -- thread: tobit-12-refuses-worship
  ('apocrypha', 'tobit', 12, 18, 'canon', 'revelation', 19, 10, 'free', E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel refusing worship and redirecting it to Elohim is exactly Raphael''s word in Tobit 12:18.'),
  ('apocrypha', 'tobit', 12, 18, 'canon', 'revelation', 22, 9, 'free', E'Revelation 22:9 — *Then saith he unto me, See thou do it not: for I am thy fellowservant, and of thy brethren the prophets, and of them which keep the sayings of this book: worship Elohim (God).* The same fellowservant who declines worship matches Raphael disclaiming any favour of his own in Tobit 12:18.'),
  ('apocrypha', 'tobit', 12, 16, 'canon', 'revelation', 22, 8, 'free', E'Revelation 22:8 — *And I John saw these things, and heard them. And when I had heard and seen, I fell down to worship before the feet of the angel which shewed me these things.* John falling at the angel''s feet mirrors Tobit and Tobias falling on their faces before Raphael in Tobit 12:16.'),
  -- thread: tobit-12-go-up-to-him-that-sent-me
  ('apocrypha', 'tobit', 12, 20, 'canon', 'john', 6, 38, 'free', E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* The posture of doing the will of the One who sent him, and returning to him, is Raphael''s own word in Tobit 12:20.'),
  ('apocrypha', 'tobit', 12, 20, 'canon', 'revelation', 1, 11, 'free', E'Revelation 1:11 — *Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia; unto Ephesus, and unto Smyrna, and unto Pergamos, and unto Thyatira, and unto Sardis, and unto Philadelphia, and unto Laodicea.* The command to write all things in a book is given to John just as Raphael commands Tobit in Tobit 12:20.'),
  ('apocrypha', 'tobit', 12, 18, 'canon', 'john', 6, 38, 'free', E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* Raphael came not of his own favour but by the will of Elohim (Tobit 12:18), the very pattern of the Sent One.'),
  -- thread: tobit-12-alms-fasting-prayer
  ('apocrypha', 'tobit', 12, 8, 'canon', 'matthew', 6, 1, 'free', E'Matthew 6:1 — *Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.* The good of almsgiving Raphael commends in Tobit 12:8 is the same alms Yahusha teaches, done before the Father not before men.'),
  ('apocrypha', 'tobit', 12, 8, 'canon', 'matthew', 6, 6, 'free', E'Matthew 6:6 — *But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.* The prayer Raphael calls good in Tobit 12:8 is the secret prayer Yahusha commends.'),
  ('apocrypha', 'tobit', 12, 8, 'canon', 'matthew', 6, 18, 'free', E'Matthew 6:18 — *That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.* The fasting Raphael joins to prayer and alms in Tobit 12:8 is the secret fasting Yahusha teaches.'),
  -- thread: tobit-12-alms-deliver-from-death
  ('apocrypha', 'tobit', 12, 9, 'canon', 'proverbs', 10, 2, 'free', E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* Solomon''s word that righteousness delivers from death is the very promise Raphael attaches to alms in Tobit 12:9.'),
  ('apocrypha', 'tobit', 12, 9, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* That righteousness, not hoarded gold, delivers from death echoes Raphael''s counsel in Tobit 12:9 that alms is better than laying up gold.'),
  ('apocrypha', 'tobit', 12, 9, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Tobit had already taught his son the lesson Raphael now confirms from heaven in Tobit 12:9.'),
  -- thread: tobit-12-reveal-the-works-of-god
  ('apocrypha', 'tobit', 12, 6, 'canon', 'luke', 1, 46, 'free', E'Luke 1:46 — *And Mary said, My soul doth magnify Yahuah (Lord),* Mary magnifies Yahuah just as Raphael commands the household to magnify and praise him in Tobit 12:6.'),
  ('apocrypha', 'tobit', 12, 6, 'canon', 'luke', 1, 49, 'free', E'Luke 1:49 — *For he that is mighty hath done to me great things; and holy is his name.* Praising Elohim for the great things he has done is the very response Raphael calls for in Tobit 12:6.'),
  ('apocrypha', 'tobit', 12, 14, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* This defines the office of the angel sent to heal Tobit and Sara in Tobit 12:14 — a ministering spirit sent for the heirs of salvation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-seven-holy-angels',
       E'I am Raphael, one of the seven holy angels',
       E'When his work is finished Raphael unveils himself: *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15). It ain''t new — John saw the same seven standing in the heavenly sanctuary: *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* (Revelation 8:2), and another angel *having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* (Revelation 8:3), so that *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* (Revelation 8:4). Gabriel names his own station to Zacharias in the very same words: *I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19). Tobit''s prayers and Sara''s were carried up the same way Tobit himself was told.',
       sv.verse_id, ev.verse_id, 'extras', 59875
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-prayers-remembered',
       E'I brought the remembrance of your prayers before the Holy One',
       E'Raphael testifies that nothing Tobit and Sara prayed fell to the ground: *Now therefore, when you did pray, and Sara your daughter in law, I did bring the remembrance of your prayers before the Holy One: and when you did bury the dead, I was with you likewise.* (Tobit 12:12). David asked for exactly this ministry: *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* (Psalm 141:2). And John saw the angel carry it: *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* (Revelation 8:4). When Zacharias prayed at the altar of incense the answer came by an angel — *Fear not, Zacharias: for thy prayer is heard* (Luke 1:13) — the same pattern: the prayer remembered, the angel sent.',
       sv.verse_id, ev.verse_id, 'extras', 59878
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-refuses-worship',
       E'Not of any favour of mine — worship Elohim alone',
       E'When the two fall on their faces in fear, the angel turns every eye back to Elohim: *For not of any favour of mine, but by the will of our Elohim (God) I came; wherefore praise him for ever.* (Tobit 12:18); *But he said to them, Fear not, for it shall go well with you; praise Yahuah (God) therefore.* (Tobit 12:17). John twice tried to worship the angel and was twice refused in the same breath: *And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* (Revelation 19:10); *Then saith he unto me, See thou do it not: for I am thy fellowservant, and of thy brethren the prophets, and of them which keep the sayings of this book: worship Elohim (God).* (Revelation 22:9). It ain''t new — the holy messenger never takes the worship owed to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'extras', 59881
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-go-up-to-him-that-sent-me',
       E'I go up to him that sent me',
       E'The angel''s parting word is the language of the Sent One: *Now therefore give Yahuah (God) thanks: for I go up to him that sent me; but write all things which are done in a book.* (Tobit 12:20). Yahusha speaks the same posture of the one sent: *For I came down from heaven, not to do mine own will, but the will of him that sent me.* (John 6:38) — and Raphael had already framed his coming the same way, *by the will of our Elohim (God) I came* (Tobit 12:18). And the charge to write it in a book is the charge John received: *Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia...* (Revelation 1:11). What was done in mercy is to be recorded as witness.',
       sv.verse_id, ev.verse_id, 'extras', 59884
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-alms-fasting-prayer',
       E'Prayer is good with fasting and alms',
       E'Raphael''s counsel binds the three together: *Prayer is good with fasting and alms and righteousness. A little with righteousness is better than much with unrighteousness. It is better to give alms than to lay up gold:* (Tobit 12:8). The Sermon on the Mount takes up the same three — alms, prayer, fasting — and guards each against display: *Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.* (Matthew 6:1); *But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.* (Matthew 6:6); *That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.* (Matthew 6:18). It ain''t new — the threefold piety of Tobit is the threefold piety Yahusha taught.',
       sv.verse_id, ev.verse_id, 'extras', 59887
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-alms-deliver-from-death',
       E'Alms doth deliver from death',
       E'Raphael presses the promise further: *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* (Tobit 12:9). The proverb of Solomon says it plainly twice: *Treasures of wickedness profit nothing: but righteousness delivereth from death.* (Proverbs 10:2); *Riches profit not in the day of wrath: but righteousness delivereth from death.* (Proverbs 11:4). And Tobit had taught his own son the same lesson before ever Raphael spoke it: *Because that alms do deliver from death, and suffers not to come into darkness.* (Tobit 4:10). This is no merit-buying — it is the righteousness of the covenant kept, even in exile, that is filled with life.',
       sv.verse_id, ev.verse_id, 'extras', 59890
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-reveal-the-works-of-god',
       E'Honourable to reveal the works of Elohim',
       E'Raphael calls the whole house to testimony: *Then he took them both apart, and said to them, Bless Yahuah (God), praise him, and magnify him, and praise him for the things which he has done to you in the sight of all that live...* (Tobit 12:6), and *It is good to keep close the secret of a king, but it is honourable to reveal the works of Yahuah (God). Do that which is good, and no evil shall touch you.* (Tobit 12:7). Mary''s song does just this — magnifying Yahuah for what he has done: *And Mary said, My soul doth magnify Yahuah (Lord),* (Luke 1:46), *For he that is mighty hath done to me great things; and holy is his name.* (Luke 1:49). And these ministering spirits exist for the heirs of salvation: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14) — exactly what Raphael was to Tobit''s house.',
       sv.verse_id, ev.verse_id, 'extras', 59893
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-12-seven-holy-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John beholds the very seven holy angels Raphael names himself among in Tobit 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* This is the heavenly office Raphael describes in Tobit 12:15 — an angel presenting the prayers of the saints at the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The saints'' prayers rising before the glory of the Holy One is exactly what Raphael did with Tobit''s prayer in Tobit 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel self-identifies as one who stands before the glory of Elohim, the same station Raphael claims in Tobit 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-prayers-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* David asks that his prayer rise as incense before Yahuah, which is the very thing Raphael carried out in Tobit 12:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-prayers-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The angel bearing the remembrance of prayers up to the throne matches Raphael bringing Tobit''s prayers before the Holy One in Tobit 12:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-prayers-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The prayer heard and answered by a sent angel is the pattern Raphael reveals to Tobit in Tobit 12:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-prayers-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-refuses-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel refusing worship and redirecting it to Elohim is exactly Raphael''s word in Tobit 12:18.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-refuses-worship'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:9 — *Then saith he unto me, See thou do it not: for I am thy fellowservant, and of thy brethren the prophets, and of them which keep the sayings of this book: worship Elohim (God).* The same fellowservant who declines worship matches Raphael disclaiming any favour of his own in Tobit 12:18.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-refuses-worship'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:8 — *And I John saw these things, and heard them. And when I had heard and seen, I fell down to worship before the feet of the angel which shewed me these things.* John falling at the angel''s feet mirrors Tobit and Tobias falling on their faces before Raphael in Tobit 12:16.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-refuses-worship'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-go-up-to-him-that-sent-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* The posture of doing the will of the One who sent him, and returning to him, is Raphael''s own word in Tobit 12:20.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-go-up-to-him-that-sent-me'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 1:11 — *Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia; unto Ephesus, and unto Smyrna, and unto Pergamos, and unto Thyatira, and unto Sardis, and unto Philadelphia, and unto Laodicea.* The command to write all things in a book is given to John just as Raphael commands Tobit in Tobit 12:20.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-go-up-to-him-that-sent-me'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* Raphael came not of his own favour but by the will of Elohim (Tobit 12:18), the very pattern of the Sent One.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-go-up-to-him-that-sent-me'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-alms-fasting-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:1 — *Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.* The good of almsgiving Raphael commends in Tobit 12:8 is the same alms Yahusha teaches, done before the Father not before men.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-fasting-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:6 — *But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.* The prayer Raphael calls good in Tobit 12:8 is the secret prayer Yahusha commends.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-fasting-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:18 — *That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.* The fasting Raphael joins to prayer and alms in Tobit 12:8 is the secret fasting Yahusha teaches.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-fasting-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-alms-deliver-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* Solomon''s word that righteousness delivers from death is the very promise Raphael attaches to alms in Tobit 12:9.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* That righteousness, not hoarded gold, delivers from death echoes Raphael''s counsel in Tobit 12:9 that alms is better than laying up gold.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Tobit had already taught his son the lesson Raphael now confirms from heaven in Tobit 12:9.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-reveal-the-works-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:46 — *And Mary said, My soul doth magnify Yahuah (Lord),* Mary magnifies Yahuah just as Raphael commands the household to magnify and praise him in Tobit 12:6.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-reveal-the-works-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:49 — *For he that is mighty hath done to me great things; and holy is his name.* Praising Elohim for the great things he has done is the very response Raphael calls for in Tobit 12:6.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-reveal-the-works-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* This defines the office of the angel sent to heal Tobit and Sara in Tobit 12:14 — a ministering spirit sent for the heirs of salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-reveal-the-works-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_13.sql (session253 tobit 13) -----
-- Source anchor: apocrypha/tobit ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob13 (view _session253_tob13_lookup). Sort band base 59900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-13-scourge-and-mercy
  ('apocrypha', 'tobit', 13, 2, 'canon', 'isaiah', 54, 7, 'free', E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The same brief scourging and the overwhelming mercy of the gathering that Tobit 13:2 sings over the captivity.'),
  ('apocrypha', 'tobit', 13, 2, 'canon', 'ezekiel', 37, 12, 'free', E'Ezekiel 37:12 — *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* Tobit''s "leadeth down to hell, and brings up again" is the very promise of Yahuah who brings His people up out of the grave.'),
  ('apocrypha', 'tobit', 13, 1, 'canon', 'revelation', 19, 6, 'free', E'Revelation 19:6 — *And I heard as it were the voice of a great multitude, and as the voice of many waters, and as the voice of mighty thunderings, saying, Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth.* The blessing of the everlasting kingdom Tobit opens with becomes the great Alleluia of the reigning King.'),
  -- thread: tobit-13-scattered-and-gathered
  ('apocrypha', 'tobit', 13, 5, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Tobit 13:5 sings Moses'' own scatter-then-gather covenant back from the land of captivity.'),
  ('apocrypha', 'tobit', 13, 6, 'canon', 'deuteronomy', 30, 2, 'free', E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul.* The condition Tobit names — turning to Him "with your whole heart, and with your whole mind" — is Deuteronomy''s whole-heart return that opens the gathering.'),
  ('apocrypha', 'tobit', 13, 5, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The gathering out of all nations Tobit 13:5 hopes for is the two-stick regathering of the whole house of Israel.'),
  -- thread: tobit-13-king-of-heaven-all-praise
  ('apocrypha', 'tobit', 13, 8, 'canon', 'psalms', 96, 3, 'free', E'Psalm 96:3 — *Declare his glory among the heathen, his wonders among all people.* Tobit''s "let all men speak, and let all praise him" is the Psalmist''s call to declare Yahuah''s glory among every nation.'),
  ('apocrypha', 'tobit', 13, 7, 'canon', 'psalms', 22, 27, 'free', E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The King of heaven Tobit''s soul praises is the One before whom all the ends of the earth will turn and bow.'),
  ('apocrypha', 'tobit', 13, 7, 'canon', 'psalms', 22, 28, 'free', E'Psalm 22:28 — *For the kingdom is the LORD''S: and he is the governor among the nations.* Tobit''s "King of heaven" reigning over all his greatness is the kingdom that belongs to Yahuah and governs every nation.'),
  -- thread: tobit-13-jerusalem-scourged-then-tabernacle
  ('apocrypha', 'tobit', 13, 9, 'canon', 'isaiah', 54, 11, 'free', E'Isaiah 54:11 — *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires.* The Jerusalem Tobit 13:9 says is scourged then shown mercy is Isaiah''s afflicted city whose very foundations Yahuah re-lays with sapphire.'),
  ('apocrypha', 'tobit', 13, 10, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Tobit''s prayer that the tabernacle be built in Jerusalem again finds its end in Yahuah''s tabernacle dwelling forever with His people.'),
  -- thread: tobit-13-nations-bring-gifts-children-gathered
  ('apocrypha', 'tobit', 13, 11, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The many nations Tobit 13:11 sees coming from far with gifts are Isaiah''s Gentiles and kings streaming to Jerusalem''s risen light.'),
  ('apocrypha', 'tobit', 13, 13, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The "children of the just" gathered together in Tobit 13:13 are Zion''s sons and daughters brought home from afar.'),
  ('apocrypha', 'tobit', 13, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'extras', E'Baruch 5:5 — *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch''s exile-vision of the children gathered home is the very gathering Tobit 13:13 bids the city rejoice over.'),
  -- thread: tobit-13-jewelled-new-jerusalem-alleluia
  ('apocrypha', 'tobit', 13, 16, 'canon', 'revelation', 21, 18, 'free', E'Revelation 21:18 — *And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass.* Tobit''s walls and battlements of pure gold are John''s New Jerusalem, her very wall jewelled and her city pure gold.'),
  ('apocrypha', 'tobit', 13, 16, 'canon', 'isaiah', 54, 12, 'free', E'Isaiah 54:12 — *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones.* The sapphires, emeralds, and carbuncle of Tobit 13:16-17 are Isaiah''s promised gemstone city, gate and border laid in precious stone.'),
  ('apocrypha', 'tobit', 13, 18, 'canon', 'isaiah', 60, 19, 'free', E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The streets of Tobit 13:18 that bless Yahuah "which has extolled it for ever" shine in Isaiah''s city where Yahuah Himself is the everlasting light.'),
  ('apocrypha', 'tobit', 13, 18, 'canon', 'revelation', 19, 1, 'free', E'Revelation 19:1 — *And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God).* The "Alleluia" Tobit 13:18 puts on the streets of the rebuilt city is the very Alleluia of the heavenly multitude before the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-scourge-and-mercy',
       E'He Scourges and Has Mercy; He Brings Down and Brings Up',
       E'Tobit''s song opens with the rhythm of the covenant itself — *For he does scourge, and has mercy: he leadeth down to hell, and brings up again: neither is there any that can avoid his hand* (Tobit 13:2). This is no foreign theology; it is Hannah''s song and the valley of dry bones. Yahuah forsakes for a moment to gather with everlasting kindness — *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7) — and the One who leads down to the grave is the One who opens the graves: *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). The captive exile already confesses the resurrection hope.',
       sv.verse_id, ev.verse_id, 'extras', 59900
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-scattered-and-gathered',
       E'He Scattered Us Among the Nations and Will Gather Us Again',
       E'The heart of the song is the two-house promise spoken from exile — *Confess him before the Gentiles, you children of Yashar''el (Israel): for he has scattered us among them* (Tobit 13:3), *and he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). This is Moses'' own word at the threshold of the land: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). And it is the regathering of the whole house — Judah and Joseph made one stick: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Not a church replacing Israel — the scattered house itself, brought home.',
       sv.verse_id, ev.verse_id, 'extras', 59903
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-king-of-heaven-all-praise',
       E'My Soul Shall Praise the King of Heaven; Let All Men Praise Him',
       E'Tobit lifts the praise beyond Israel to all flesh — *I will extol my Elohim (God), and my soul shall praise the King of heaven, and shall rejoice in his greatness. Let all men speak, and let all praise him for his righteousness* (Tobit 13:7-8). The Psalter swells with the same universal summons: *Declare his glory among the heathen, his wonders among all people* (Psalm 96:3), and the suffering-and-vindicated king''s song ends in the very ingathering of the nations — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee. For the kingdom is the LORD''S: and he is the governor among the nations* (Psalm 22:27-28). The exile''s praise is the world''s destiny.',
       sv.verse_id, ev.verse_id, 'extras', 59906
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-jerusalem-scourged-then-tabernacle',
       E'O Jerusalem, Scourged for Her Children, the Tabernacle Built Again',
       E'The song turns to the holy city herself — *O Jerusalem, the holy city, he will scourge you for your children''s works, and will have mercy again on the sons of the righteous* (Tobit 13:9), *that his tabernacle may be builded in you again with joy* (Tobit 13:10). The afflicted, tempest-tossed city is comforted: *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires* (Isaiah 54:11). And the rebuilt tabernacle is the everlasting dwelling — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The scourged city becomes Yahuah''s own tent.',
       sv.verse_id, ev.verse_id, 'extras', 59909
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-nations-bring-gifts-children-gathered',
       E'Nations from Far with Gifts; the Children of the Just Gathered',
       E'The regathered city draws the nations and her own scattered children — *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven* (Tobit 13:11), and *Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just* (Tobit 13:13). Isaiah saw the same pilgrimage of light: *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3), with sons borne from far: *thy sons shall come from far, and thy daughters shall be nursed at thy side* (Isaiah 60:4). Baruch, Tobit''s exile-sibling, watches the very same homecoming: *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5). It ain''t new — the deuterocanon sings one gathering.',
       sv.verse_id, ev.verse_id, 'extras', 59912
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-jewelled-new-jerusalem-alleluia',
       E'Built with Sapphires and Gold; Her Streets Shall Say Alleluia',
       E'The song crests in the jewelled, rebuilt city — *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16), *And the streets of Jerusalem shall be paved with beryl and carbuncle and stones of Ophir. And all her streets shall say, Alleluia* (Tobit 13:17-18). John sees this very city: *And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass* (Revelation 21:18), her streets of gold and gates of pearl. Isaiah laid her gem foundations long before: *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones* (Isaiah 54:12), and named Yahuah Himself her light: *but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19). And the Alleluia on her streets is heaven''s own song: *And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God)* (Revelation 19:1).',
       sv.verse_id, ev.verse_id, 'extras', 59915
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-13-scourge-and-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The same brief scourging and the overwhelming mercy of the gathering that Tobit 13:2 sings over the captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scourge-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:12 — *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* Tobit''s "leadeth down to hell, and brings up again" is the very promise of Yahuah who brings His people up out of the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scourge-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:6 — *And I heard as it were the voice of a great multitude, and as the voice of many waters, and as the voice of mighty thunderings, saying, Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth.* The blessing of the everlasting kingdom Tobit opens with becomes the great Alleluia of the reigning King.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scourge-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-scattered-and-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Tobit 13:5 sings Moses'' own scatter-then-gather covenant back from the land of captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scattered-and-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul.* The condition Tobit names — turning to Him "with your whole heart, and with your whole mind" — is Deuteronomy''s whole-heart return that opens the gathering.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scattered-and-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The gathering out of all nations Tobit 13:5 hopes for is the two-stick regathering of the whole house of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scattered-and-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-king-of-heaven-all-praise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:3 — *Declare his glory among the heathen, his wonders among all people.* Tobit''s "let all men speak, and let all praise him" is the Psalmist''s call to declare Yahuah''s glory among every nation.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-king-of-heaven-all-praise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The King of heaven Tobit''s soul praises is the One before whom all the ends of the earth will turn and bow.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-king-of-heaven-all-praise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:28 — *For the kingdom is the LORD''S: and he is the governor among the nations.* Tobit''s "King of heaven" reigning over all his greatness is the kingdom that belongs to Yahuah and governs every nation.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-king-of-heaven-all-praise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-jerusalem-scourged-then-tabernacle
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 54:11 — *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires.* The Jerusalem Tobit 13:9 says is scourged then shown mercy is Isaiah''s afflicted city whose very foundations Yahuah re-lays with sapphire.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jerusalem-scourged-then-tabernacle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Tobit''s prayer that the tabernacle be built in Jerusalem again finds its end in Yahuah''s tabernacle dwelling forever with His people.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jerusalem-scourged-then-tabernacle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-nations-bring-gifts-children-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The many nations Tobit 13:11 sees coming from far with gifts are Isaiah''s Gentiles and kings streaming to Jerusalem''s risen light.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-nations-bring-gifts-children-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The "children of the just" gathered together in Tobit 13:13 are Zion''s sons and daughters brought home from afar.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-nations-bring-gifts-children-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 5:5 — *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch''s exile-vision of the children gathered home is the very gathering Tobit 13:13 bids the city rejoice over.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-nations-bring-gifts-children-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-jewelled-new-jerusalem-alleluia
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:18 — *And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass.* Tobit''s walls and battlements of pure gold are John''s New Jerusalem, her very wall jewelled and her city pure gold.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 54:12 — *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones.* The sapphires, emeralds, and carbuncle of Tobit 13:16-17 are Isaiah''s promised gemstone city, gate and border laid in precious stone.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The streets of Tobit 13:18 that bless Yahuah "which has extolled it for ever" shine in Isaiah''s city where Yahuah Himself is the everlasting light.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:1 — *And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God).* The "Alleluia" Tobit 13:18 puts on the streets of the rebuilt city is the very Alleluia of the heavenly multitude before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_tobit_14.sql (session253 tobit 14) -----
-- Source anchor: apocrypha/tobit ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob14 (view _session253_tob14_lookup). Sort band base 59925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-14-nineveh-overthrown
  ('apocrypha', 'tobit', 14, 4, 'canon', 'jonah', 3, 4, 'free', E'Jonah 3:4 — *And Jonah began to enter into the city a day’s journey, and he cried, and said, Yet forty days, and Nineveh shall be overthrown.* This is the very word of Jonas that Tobit 14:4 names and stakes his counsel upon.'),
  ('apocrypha', 'tobit', 14, 4, 'canon', 'nahum', 1, 1, 'free', E'Nahum 1:1 — *The burden of Nineveh. The book of the vision of Nahum the Elkoshite.* A whole prophetic book is the burden against the city Tobit 14:4 says shall be overthrown.'),
  ('apocrypha', 'tobit', 14, 8, 'canon', 'nahum', 3, 7, 'free', E'Nahum 3:7 — *And it shall come to pass, that all they that look upon thee shall flee from thee, and say, Nineveh is laid waste: who will bemoan her? whence shall I seek comforters for thee?* The fulfilment Tobit 14:8 says shall surely come to pass.'),
  -- thread: tobit-14-temple-not-like-first
  ('apocrypha', 'tobit', 14, 5, 'canon', 'haggai', 2, 9, 'free', E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts).* The ''temple, but not like to the first'' of Tobit 14:5 is the very latter house Haggai measures.'),
  ('apocrypha', 'tobit', 14, 5, 'canon', 'ezekiel', 37, 26, 'free', E'Ezekiel 37:26 — *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* The house built ''for ever with a glorious building'' that Tobit 14:5 awaits past the fulfilled age.'),
  ('apocrypha', 'tobit', 14, 4, 'canon', 'ezekiel', 37, 28, 'free', E'Ezekiel 37:28 — *And the heathen shall know that I Yahuah (LORD) do sanctify Yashar''el (Israel), when my sanctuary shall be in the midst of them for evermore.* The desolation Tobit 14:4 names is only ''for a time''; the sanctuary''s end is everlasting.'),
  -- thread: tobit-14-scattered-gathered
  ('apocrypha', 'tobit', 14, 5, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The return ''from all places of their captivity'' of Tobit 14:5 is Ezekiel''s own gathering of the scattered house.'),
  ('apocrypha', 'tobit', 14, 5, 'canon', 'zephaniah', 3, 20, 'free', E'Zephaniah 3:20 — *At that time will I bring you again, even in the time that I gather you: for I will make you a name and a praise among all people of the earth, when I turn back your captivity before your eyes, saith Yahuah (LORD).* The turning back of captivity Tobit 14:5 foresees, spoken to the dispersed by the prophet.'),
  ('apocrypha', 'tobit', 14, 7, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The exalted, regathered people of Tobit 14:7 are Isaiah''s homecoming sons and daughters.'),
  -- thread: tobit-14-nations-bury-idols
  ('apocrypha', 'tobit', 14, 6, 'canon', 'isaiah', 2, 20, 'free', E'Isaiah 2:20 — *In that day a man shall cast his idols of silver, and his idols of gold, which they made each one for himself to worship, to the moles and to the bats.* The very burying of idols Tobit 14:6 foretells of all nations.'),
  ('apocrypha', 'tobit', 14, 6, 'canon', 'zephaniah', 3, 9, 'free', E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The turning of all nations to fear Yahuah truly in Tobit 14:6 is the pure language that calls on His name.'),
  ('apocrypha', 'tobit', 14, 6, 'canon', 'zechariah', 8, 23, 'free', E'Zechariah 8:23 — *Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you.* The nations that turn in Tobit 14:6 lay hold of Israel to find the truth.'),
  -- thread: tobit-14-nations-praise-glorious-jerusalem
  ('apocrypha', 'tobit', 14, 7, 'canon', 'isaiah', 2, 3, 'free', E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The all-nations praise of Tobit 14:7 is Isaiah''s pilgrimage to the house in glorious Jerusalem.'),
  ('apocrypha', 'tobit', 14, 7, 'canon', 'zechariah', 8, 22, 'free', E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The nations that praise Yahuah in Tobit 14:7 come to seek Him in the rebuilt city.'),
  ('apocrypha', 'tobit', 14, 5, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The Jerusalem built gloriously in Tobit 14:5 is Isaiah''s risen city to whose light the gentiles come.'),
  -- thread: tobit-14-keep-the-law
  ('apocrypha', 'tobit', 14, 9, 'canon', 'ezekiel', 37, 24, 'free', E'Ezekiel 37:24 — *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them.* The law-keeping Tobit 14:9 charges his son is the very obedience the regathered house renders under one shepherd.'),
  ('apocrypha', 'tobit', 14, 9, 'canon', 'zechariah', 8, 16, 'free', E'Zechariah 8:16 — *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates.* The ''merciful and just'' walk Tobit 14:9 commands is Zechariah''s plain Torah for the city of truth.'),
  -- thread: tobit-14-alms-deliver-from-death
  ('apocrypha', 'tobit', 14, 11, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The very lesson Tobit 14:11 presses — that righteousness, not riches, delivers.'),
  ('apocrypha', 'tobit', 14, 11, 'canon', 'psalms', 41, 1, 'free', E'Psalms 41:1 — *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble.* The almsgiver who ''considers'' the poor is delivered, as Tobit 14:11 bids his son consider what alms doeth.'),
  ('apocrypha', 'tobit', 14, 11, 'canon', 'matthew', 6, 4, 'free', E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Messiah carries Tobit''s closing charge forward, the secret alms of Tobit 14:11 rewarded by the Father.'),
  ('apocrypha', 'tobit', 14, 10, 'canon', 'acts', 10, 4, 'free', E'Acts 10:4 — *And when he looked on him, he was afraid, and said, What is it, Yahuah (Lord)? And he said unto him, Thy prayers and thine alms are come up for a memorial before Elohim (God).* As alms saved Manasses from the snare in Tobit 14:10, so Cornelius''s alms come up as a memorial before Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-nineveh-overthrown',
       E'Nineveh shall be overthrown — as Jonah spoke',
       E'Tobit''s deathbed faith rests on a prophet''s word already given: *Go into Media my son, for I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4), and again *depart out of Nineve, because that those things which the prophet Jonas spoke shall surely come to pass* (Tobit 14:8). It ain''t new — Jonah had cried it in the streets: *Yet forty days, and Nineveh shall be overthrown* (Jonah 3:4). And Nahum took up the same burden against the bloody city — *The burden of Nineveh* (Nahum 1:1) — until the watchers could only say, *Nineveh is laid waste: who will bemoan her?* (Nahum 3:7). The dying man trusts the prophets because the prophets are Yahuah''s own word that does not fall.',
       sv.verse_id, ev.verse_id, 'extras', 59925
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-temple-not-like-first',
       E'A temple, but not like the first — until the time be fulfilled',
       E'Tobit measures the long arc of exile and return: *Jerusalem shall be desolate, and the house of Yahuah (God) in it shall be burned, and shall be desolate for a time* (Tobit 14:4), *And that again Yahuah (God) will have mercy on them, and bring them again into the land, where they shall build a temple, but not like to the first, until the time of that age be fulfilled* (Tobit 14:5). The second house would indeed rise less in stone yet greater in glory, as Haggai promised the returning builders: *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace* (Haggai 2:9). And the everlasting sanctuary Tobit awaits past ''the time of that age'' is Ezekiel''s covenant of peace: *I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26).',
       sv.verse_id, ev.verse_id, 'extras', 59928
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-scattered-gathered',
       E'Our brothers scattered — gathered again to the land',
       E'Tobit sees both the scattering and the regathering of the whole house: *our brothers shall lie scattered in the earth from that good land* (Tobit 14:4), yet *afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* (Tobit 14:5), and *Yahuah (God) shall exalt his people* (Tobit 14:7). This is no church replacing Israel but the two sticks made one — Ezekiel''s gathering: *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Zephaniah seals it: *At that time will I bring you again, even in the time that I gather you... when I turn back your captivity before your eyes* (Zephaniah 3:20). And Isaiah names the homecoming children: *thy sons shall come from far, and thy daughters shall be nursed at thy side* (Isaiah 60:4).',
       sv.verse_id, ev.verse_id, 'extras', 59931
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-nations-bury-idols',
       E'All nations shall turn and bury their idols',
       E'The dying man''s widest hope: *And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). It ain''t new — Isaiah saw the day the idols themselves are flung away: *In that day a man shall cast his idols of silver, and his idols of gold, which they made each one for himself to worship, to the moles and to the bats* (Isaiah 2:20), *And the idols he shall utterly abolish* (Isaiah 2:18). Zephaniah names the gift that makes the turning possible — a converted tongue: *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). And Zechariah shows the nations laying hold of Israel to find the truth: *ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23).',
       sv.verse_id, ev.verse_id, 'extras', 59934
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-nations-praise-glorious-jerusalem',
       E'All nations shall praise — the glory of the rebuilt city',
       E'Tobit binds the regathered city to a worldwide praise: *build up Jerusalem gloriously, and the house of Yahuah (God) shall be built in it for ever with a glorious building* (Tobit 14:5), *So shall all nations praise Yahuah (God), and his people shall confess Yahuah (God)... and all those which love Yahuah (God) in truth and justice shall rejoice* (Tobit 14:7). This is Isaiah''s pilgrimage of the peoples to the mountain of the house: *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD)... for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). It is the strong nations seeking Him there: *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22). And it is the gentiles streaming to the city''s risen light: *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3).',
       sv.verse_id, ev.verse_id, 'extras', 59937
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-keep-the-law',
       E'Keep the law and the commandments — that it may go well',
       E'Tobit''s first charge to his son is Torah kept in exile, never law-as-curse: *But keep you the law and the commandments, and shew thyself merciful and just, that it may go well with you* (Tobit 14:9). The promised well-being is the deuteronomic blessing carried into the prophets, where the regathered house at last keeps the statutes from the heart: *they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). And the city of truth Tobit''s son is to live toward is built on the same plain obedience: *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates* (Zechariah 8:16).',
       sv.verse_id, ev.verse_id, 'extras', 59940
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-alms-deliver-from-death',
       E'Consider what alms doeth — and how righteousness delivers',
       E'The whole witness of Tobit closes on a single charge: *Manasses gave alms, and escaped the snares of death which they had set for him* (Tobit 14:10), *Wherefore now, my son, consider what alms doeth, and how righteousness does deliver* (Tobit 14:11). It ain''t new — Proverbs had said it in two words: *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4). The Psalter blesses the almsgiver: *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble* (Psalms 41:1). And the Messiah took up Tobit''s very ethic in the Sermon: *But when thou doest alms, let not thy left hand know what thy right hand doeth: That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly* (Matthew 6:3-4) — alms that come up, as Cornelius''s did, *for a memorial before Elohim (God)* (Acts 10:4).',
       sv.verse_id, ev.verse_id, 'extras', 59943
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-14-nineveh-overthrown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jonah 3:4 — *And Jonah began to enter into the city a day’s journey, and he cried, and said, Yet forty days, and Nineveh shall be overthrown.* This is the very word of Jonas that Tobit 14:4 names and stakes his counsel upon.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nineveh-overthrown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nahum 1:1 — *The burden of Nineveh. The book of the vision of Nahum the Elkoshite.* A whole prophetic book is the burden against the city Tobit 14:4 says shall be overthrown.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nineveh-overthrown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nahum 3:7 — *And it shall come to pass, that all they that look upon thee shall flee from thee, and say, Nineveh is laid waste: who will bemoan her? whence shall I seek comforters for thee?* The fulfilment Tobit 14:8 says shall surely come to pass.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nineveh-overthrown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-temple-not-like-first
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts).* The ''temple, but not like to the first'' of Tobit 14:5 is the very latter house Haggai measures.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-temple-not-like-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:26 — *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* The house built ''for ever with a glorious building'' that Tobit 14:5 awaits past the fulfilled age.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-temple-not-like-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:28 — *And the heathen shall know that I Yahuah (LORD) do sanctify Yashar''el (Israel), when my sanctuary shall be in the midst of them for evermore.* The desolation Tobit 14:4 names is only ''for a time''; the sanctuary''s end is everlasting.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-temple-not-like-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-scattered-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The return ''from all places of their captivity'' of Tobit 14:5 is Ezekiel''s own gathering of the scattered house.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-scattered-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 3:20 — *At that time will I bring you again, even in the time that I gather you: for I will make you a name and a praise among all people of the earth, when I turn back your captivity before your eyes, saith Yahuah (LORD).* The turning back of captivity Tobit 14:5 foresees, spoken to the dispersed by the prophet.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-scattered-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The exalted, regathered people of Tobit 14:7 are Isaiah''s homecoming sons and daughters.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-scattered-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-nations-bury-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 2:20 — *In that day a man shall cast his idols of silver, and his idols of gold, which they made each one for himself to worship, to the moles and to the bats.* The very burying of idols Tobit 14:6 foretells of all nations.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-bury-idols'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The turning of all nations to fear Yahuah truly in Tobit 14:6 is the pure language that calls on His name.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-bury-idols'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 8:23 — *Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you.* The nations that turn in Tobit 14:6 lay hold of Israel to find the truth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-bury-idols'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-nations-praise-glorious-jerusalem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The all-nations praise of Tobit 14:7 is Isaiah''s pilgrimage to the house in glorious Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-praise-glorious-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The nations that praise Yahuah in Tobit 14:7 come to seek Him in the rebuilt city.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-praise-glorious-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The Jerusalem built gloriously in Tobit 14:5 is Isaiah''s risen city to whose light the gentiles come.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-praise-glorious-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-keep-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:24 — *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them.* The law-keeping Tobit 14:9 charges his son is the very obedience the regathered house renders under one shepherd.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-keep-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 8:16 — *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates.* The ''merciful and just'' walk Tobit 14:9 commands is Zechariah''s plain Torah for the city of truth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-keep-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-alms-deliver-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The very lesson Tobit 14:11 presses — that righteousness, not riches, delivers.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 41:1 — *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble.* The almsgiver who ''considers'' the poor is delivered, as Tobit 14:11 bids his son consider what alms doeth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Messiah carries Tobit''s closing charge forward, the secret alms of Tobit 14:11 rewarded by the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 10:4 — *And when he looked on him, he was afraid, and said, What is it, Yahuah (Lord)? And he said unto him, Thy prayers and thine alms are come up for a memorial before Elohim (God).* As alms saved Manasses from the snare in Tobit 14:10, so Cornelius''s alms come up as a memorial before Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Tobit cross-references complete.'
