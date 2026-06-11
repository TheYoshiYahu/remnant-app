-- ----- fragment: minion_jasher_10.sql (session252 jasher 10) -----
-- Source anchor: jasher/jasher ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja10 (view _session252_ja10_lookup). Sort band base 55225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-10-peleg-eber-seedline
  ('jasher', 'jasher', 10, 1, 'canon', 'genesis', 10, 25, 'free', E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Jasher 10:1 dates Peleg''s death in Abram''s lifetime; Genesis names him for the very dividing of the earth this chapter recounts.'),
  ('jasher', 'jasher', 10, 1, 'canon', 'genesis', 11, 16, 'free', E'Genesis 11:16 — *And Eber lived four and thirty years, and begat Peleg:* the canon''s lifespan register carrying the seed-line Shem-Eber-Peleg that Jasher 10:1 is counting toward Abram.'),
  ('jasher', 'jasher', 10, 1, 'canon', 'genesis', 11, 17, 'free', E'Genesis 11:17 — *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters.* The chosen line is kept generation by generation, the same chain Jasher 10:1 measures by Peleg''s two hundred and thirty-nine years.'),
  ('jasher', 'jasher', 10, 1, 'jubilees', 'jubilees', 8, 8, 'extras', E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The Jubilees apparatus names Peleg by the identical dividing of the earth Jasher 10:1 stands at the head of.'),
  -- thread: jasher-10-babel-scattered-nations
  ('jasher', 'jasher', 10, 2, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* The very scattering Jasher 10:2 recounts as the sons of men dispersed into the four corners of the earth.'),
  ('jasher', 'jasher', 10, 3, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Genesis names the confusion of tongues that Jasher 10:3 describes as each family according to its language.'),
  ('jasher', 'jasher', 10, 4, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The scattering and city-building of Jasher 10:4 is the Most High bounding the nations around the chosen seed.'),
  ('jasher', 'jasher', 10, 5, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same divine ordering of the nations and their dwellings that Jasher 10:5 narrates after the tower.'),
  ('jasher', 'jasher', 10, 2, 'jubilees', 'jubilees', 10, 25, 'extras', E'Jubilees 10:25 — *For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation.* The Jubilees apparatus seals the same dispersal-into-cities that Jasher 10:2 opens this chapter with.'),
  -- thread: jasher-10-sons-of-japheth
  ('jasher', 'jasher', 10, 7, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The identical roll of Japheth''s seven sons that Jasher 10:7 names according to their generations.'),
  ('jasher', 'jasher', 10, 6, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis records the same division of Japheth''s line into lands and languages that Jasher 10:6 recounts as they built cities where they were scattered.'),
  ('jasher', 'jasher', 10, 7, 'jubilees', 'jubilees', 9, 8, 'extras', E'Jubilees 9:8 — *And the first portion came forth for Gomer to the east from the north side to the river Tînâ; and in the north there came forth for Magog all the inner portions of the north until it reaches to the sea of Mê’at.* The Jubilees apparatus apportions by lot the same sons of Japheth — Gomer and Magog — that Jasher 10:7 lists.'),
  -- thread: jasher-10-sons-of-ham-philistines
  ('jasher', 'jasher', 10, 19, 'canon', 'genesis', 10, 6, 'free', E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham that Jasher 10:19 names according to their generation and cities.'),
  ('jasher', 'jasher', 10, 21, 'canon', 'genesis', 10, 13, 'free', E'Genesis 10:13 — *And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim,* the identical Egyptian families Jasher 10:21 lists as the children of Mitzraim.'),
  ('jasher', 'jasher', 10, 23, 'canon', 'genesis', 10, 14, 'free', E'Genesis 10:14 — *And Pathrusim, and Casluhim, (out of whom came Philistim,) and Caphtorim.* Genesis names the same Philistine origin that Jasher 10:23 records as the Pelishtim going forth from Pathros and Casloch.'),
  ('jasher', 'jasher', 10, 19, 'jubilees', 'jubilees', 9, 1, 'extras', E'Jubilees 9:1 — *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan.* The Jubilees apparatus apportions by lot the same four sons of Ham that Jasher 10:19 names.'),
  -- thread: jasher-10-cities-of-the-plain-sodom
  ('jasher', 'jasher', 10, 25, 'canon', 'genesis', 10, 19, 'free', E'Genesis 10:19 — *And the border of the Canaanites was from Sidon, as thou comest to Gerar, unto Gaza; as thou goest, unto Sodom, and Gomorrah, and Admah, and Zeboim, even unto Lasha.* Genesis sets the Canaanite border at the very four cities of the plain Jasher 10:25 says four men of Ham founded.'),
  ('jasher', 'jasher', 10, 26, 'canon', 'genesis', 14, 2, 'free', E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the same four plain-cities by their kings that Jasher 10:26 records being built and named after their founders.'),
  -- thread: jasher-10-shem-asshur-nineveh
  ('jasher', 'jasher', 10, 31, 'canon', 'genesis', 10, 22, 'free', E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The identical five sons of Shem that Jasher 10:31 names, the father-stock of the chosen line.'),
  ('jasher', 'jasher', 10, 30, 'canon', 'genesis', 10, 21, 'free', E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Genesis marks Shem as father of Eber''s line — the seed Jasher 10:30 traces as it builds cities after the scattering.'),
  ('jasher', 'jasher', 10, 33, 'canon', 'genesis', 10, 11, 'free', E'Genesis 10:11 — *Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah,* the same Asshur founding the same cities — Nineveh, Rehoboth, Calah — that Jasher 10:33 names among Asshur''s four.'),
  ('jasher', 'jasher', 10, 32, 'jubilees', 'jubilees', 9, 3, 'extras', E'Jubilees 9:3 — *And for Asshur came forth the second portion, all the land of Asshur and Nineveh and Shinar and to the border of India, and it ascends and skirts the river.* The Jubilees apparatus apportions Asshur the same Nineveh-and-Shinar territory that Jasher 10:32 says Asshur went forth to build.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-peleg-eber-seedline',
       E'Peleg dies in Abram''s day — the seed-line kept through Eber',
       E'Jasher opens chapter ten on the seed-line clock: *And Peleg the son of Eber died in those days, in the forty-eighth year of the life of Abram son of Terah, and all the days of Peleg were two hundred and thirty-nine years* (Jasher 10:1). The chosen line runs Shem → Arphaxad → Eber → Peleg toward Abram, and Genesis keeps the very same register: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan* (Genesis 10:25). The lifespan-by-lifespan chain that carries the covenant seed is set down in *And Eber lived four and thirty years, and begat Peleg* and *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters* (Genesis 11:16-17). Jubilees names Peleg by the same dividing of the earth: *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8). Election precedes confession; the line is kept and chosen, generation by generation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55225
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-babel-scattered-nations',
       E'Scattered from Babel — the nations divided and bounded',
       E'After the tower, Jasher shows the LORD dispersing mankind across the earth: *And when Yahuah (the Lord) had scattered the sons of men on account of their sin at the tower, behold they spread forth into many divisions, and all the sons of men were dispersed into the four corners of the earth* (Jasher 10:2), so that *all the families became each according to its language, its land, or its city* (Jasher 10:3), and they *built many cities according to their families, in all the places where they went, and throughout the earth where Yahuah (the Lord) had scattered them* (Jasher 10:4). This is Genesis verbatim in its architecture: *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8), *because Yahuah (LORD) did there confound the language of all the earth* (Genesis 11:9). The scattering is no accident but a bounding: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Paul preaches the same to Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). Jubilees seals it: *For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation* (Jubilees 10:25). The kingdom-of-man''s tower is broken; the nations are set in their bounds around the elect seed. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55228
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-sons-of-japheth',
       E'The sons of Japheth divided in their lands',
       E'Jasher expands the table of nations with Japheth''s line settling the isles: *And the sons of Japheth the son of Noah went and built themselves cities in the places where they were scattered... and the sons of Japheth were divided upon the face of the earth into many divisions and languages* (Jasher 10:6), naming *Gomer, Magog, Medai, Javan, Tubal, Meshech and Tiras; these are the children of Japheth according to their generations* (Jasher 10:7). This is Genesis 10 retold: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2), of whom *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). Jubilees apportions the very same sons by lot: *And the first portion came forth for Gomer to the east from the north side to the river Tînâ; and in the north there came forth for Magog all the inner portions of the north until it reaches to the sea of Mê’at* (Jubilees 9:8). The same seventy nations, the same bounds. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55231
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-sons-of-ham-philistines',
       E'The sons of Ham — Mizraim, Canaan, and the Philistines come forth',
       E'Jasher traces Ham''s line: *And the children of Ham were Cush, Mitzraim, Phut and Canaan according to their generation and cities* (Jasher 10:19), then *the children of Mitzraim are the Ludim, Anamim, Lehabim, Naphtuchim, Pathrusim, Casluchim and Caphturim, seven families* (Jasher 10:21), out of whom *from them went forth the Pelishtim* (Jasher 10:23). Genesis sets down the same fathers: *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan* (Genesis 10:6), *And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim* (Genesis 10:13), and the Philistine origin: *And Pathrusim, and Casluhim, (out of whom came Philistim,) and Caphtorim* (Genesis 10:14). Jubilees gives Ham''s same fourfold inheritance: *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan* (Jubilees 9:1). The nations of the world springing from Noah''s sons — the same table, three witnesses deep. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55234
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-cities-of-the-plain-sodom',
       E'Four men of Ham build Sodom and the cities of the plain',
       E'Jasher seeds the coming judgment-story of Sodom: *And four men from the family of Ham went to the land of the plain; these are the names of the four men, Sodom, Gomorrah, Admah and Zeboyim* (Jasher 10:25), who *built themselves four cities in the land of the plain, and they called the names of their cities after their own names* (Jasher 10:26), and *they were fruitful and multiplied greatly and dwelt peaceably* (Jasher 10:27) — the brief peace before the fire. Genesis sets the border of Ham''s Canaan exactly there: *And the border of the Canaanites was from Sidon, as thou comest to Gerar, unto Gaza; as thou goest, unto Sodom, and Gomorrah, and Admah, and Zeboim, even unto Lasha* (Genesis 10:19), and names these same four cities by their kings: *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar* (Genesis 14:2). The cities Jasher founds here are the ones the canon will overthrow — the kingdom-of-man''s prosperity standing under judgment. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55237
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-shem-asshur-nineveh',
       E'The sons of Shem and Asshur''s Nineveh — kept apart from Nimrod''s seat',
       E'Jasher closes with the elect line''s father-stock and Asshur''s cities: *And the sons of Shem were Elam, Ashur, Arpachshad, Lud and Aram* (Jasher 10:31), and *Ashur son of Shem and his children and household went forth at that time... and they built themselves four cities* (Jasher 10:32), namely *Ninevah, Resen, Calach and Rehobother; and the children of Ashur dwell there to this day* (Jasher 10:33). Genesis carries Shem''s same sons, and marks him as the seed-bearer: *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram* (Genesis 10:22), *the father of all the children of Eber* (Genesis 10:21). And Genesis shows Asshur''s cities going forth out of Nimrod''s Shinar — the elect stock settling apart from the kingdom-of-man''s seat: *Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah* (Genesis 10:11). Jubilees apportions Asshur the same northern land: *And for Asshur came forth the second portion, all the land of Asshur and Nineveh and Shinar and to the border of India, and it ascends and skirts the river* (Jubilees 9:3). Shem the father of Eber — the seed kept toward Abraham. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55240
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-10-peleg-eber-seedline
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Jasher 10:1 dates Peleg''s death in Abram''s lifetime; Genesis names him for the very dividing of the earth this chapter recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:16 — *And Eber lived four and thirty years, and begat Peleg:* the canon''s lifespan register carrying the seed-line Shem-Eber-Peleg that Jasher 10:1 is counting toward Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:17 — *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters.* The chosen line is kept generation by generation, the same chain Jasher 10:1 measures by Peleg''s two hundred and thirty-nine years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The Jubilees apparatus names Peleg by the identical dividing of the earth Jasher 10:1 stands at the head of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-babel-scattered-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* The very scattering Jasher 10:2 recounts as the sons of men dispersed into the four corners of the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Genesis names the confusion of tongues that Jasher 10:3 describes as each family according to its language.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The scattering and city-building of Jasher 10:4 is the Most High bounding the nations around the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same divine ordering of the nations and their dwellings that Jasher 10:5 narrates after the tower.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 10:25 — *For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation.* The Jubilees apparatus seals the same dispersal-into-cities that Jasher 10:2 opens this chapter with.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-sons-of-japheth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The identical roll of Japheth''s seven sons that Jasher 10:7 names according to their generations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis records the same division of Japheth''s line into lands and languages that Jasher 10:6 recounts as they built cities where they were scattered.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 9:8 — *And the first portion came forth for Gomer to the east from the north side to the river Tînâ; and in the north there came forth for Magog all the inner portions of the north until it reaches to the sea of Mê’at.* The Jubilees apparatus apportions by lot the same sons of Japheth — Gomer and Magog — that Jasher 10:7 lists.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-sons-of-ham-philistines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham that Jasher 10:19 names according to their generation and cities.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:13 — *And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim,* the identical Egyptian families Jasher 10:21 lists as the children of Mitzraim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:14 — *And Pathrusim, and Casluhim, (out of whom came Philistim,) and Caphtorim.* Genesis names the same Philistine origin that Jasher 10:23 records as the Pelishtim going forth from Pathros and Casloch.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 9:1 — *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan.* The Jubilees apparatus apportions by lot the same four sons of Ham that Jasher 10:19 names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-cities-of-the-plain-sodom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:19 — *And the border of the Canaanites was from Sidon, as thou comest to Gerar, unto Gaza; as thou goest, unto Sodom, and Gomorrah, and Admah, and Zeboim, even unto Lasha.* Genesis sets the Canaanite border at the very four cities of the plain Jasher 10:25 says four men of Ham founded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-cities-of-the-plain-sodom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the same four plain-cities by their kings that Jasher 10:26 records being built and named after their founders.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-cities-of-the-plain-sodom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-shem-asshur-nineveh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The identical five sons of Shem that Jasher 10:31 names, the father-stock of the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Genesis marks Shem as father of Eber''s line — the seed Jasher 10:30 traces as it builds cities after the scattering.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:11 — *Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah,* the same Asshur founding the same cities — Nineveh, Rehoboth, Calah — that Jasher 10:33 names among Asshur''s four.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 9:3 — *And for Asshur came forth the second portion, all the land of Asshur and Nineveh and Shinar and to the border of India, and it ascends and skirts the river.* The Jubilees apparatus apportions Asshur the same Nineveh-and-Shinar territory that Jasher 10:32 says Asshur went forth to build.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=32
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

