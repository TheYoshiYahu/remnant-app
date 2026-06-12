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

