-- ----- fragment: minion_jubilees_09.sql (session251 jubilees 9) -----
-- Source anchor: jubilees/jubilees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju09 (view _session251_ju09_lookup). Sort band base 53200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-9-division-table-of-nations
  ('jubilees', 'jubilees', 9, 1, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The same three sons of Noah whose portions Jubilees 9 is dividing by lot.'),
  ('jubilees', 'jubilees', 9, 1, 'canon', 'genesis', 10, 6, 'free', E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The very sons among whom Jubilees 9:1 says Ham divided his portion — Cush, Mizraim, Put, Canaan.'),
  ('jubilees', 'jubilees', 9, 6, 'canon', 'genesis', 10, 32, 'free', E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* Genesis seals its table of nations with the very division Jubilees 9 is narrating by lot.'),
  ('jubilees', 'jubilees', 9, 1, 'jubilees', 'jubilees', 8, 8, 'extras', E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The division Jubilees 9 details was begun and named one chapter earlier.'),
  -- thread: jubilees-9-isles-divided-by-tongue
  ('jubilees', 'jubilees', 9, 9, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth whose island-portions Jubilees 9:8-12 distributes by lot.'),
  ('jubilees', 'jubilees', 9, 10, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis already assigns the isles and coastlands to Japheth''s line, exactly as Jubilees 9:9-10 gives Madai and Javan the islands.'),
  -- thread: jubilees-9-most-high-set-the-bounds
  ('jubilees', 'jubilees', 9, 14, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The very dividing of the nations'' inheritance by lot that Jubilees 9:14 records, credited in the Torah to the Most High Himself.'),
  ('jubilees', 'jubilees', 9, 14, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Out of all the portions divided in Jubilees 9, the Most High keeps one lot for Himself — Jacob, the elect seed.'),
  ('jubilees', 'jubilees', 9, 15, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul tells idolatrous Athens what Jubilees 9 enacts: the nations'' boundaries are Yahuah''s appointment, not chance.'),
  -- thread: jubilees-9-oath-curse-day-of-judgment
  ('jubilees', 'jubilees', 9, 14, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The post-flood covenant of accountability behind the curse Noah lays on whoever seizes another''s portion in Jubilees 9:14.'),
  ('jubilees', 'jubilees', 9, 15, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The same appointed day of judgment by fire that Jubilees 9:15 names — the reckoning the bound Watchers of the live Enoch apparatus await.'),
  ('jubilees', 'jubilees', 9, 15, 'canon', 'acts', 17, 31, 'free', E'Acts 17:31 — *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead.* Paul names the very day of judgment Jubilees 9:15 swears the oath toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-division-table-of-nations',
       E'The portions of the sons of Ham, Shem and Japheth — the table of nations',
       E'Jubilees opens the chapter by parcelling the earth among Noah''s grandsons: *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan* (Jubilees 9:1), and likewise *And Sherri also divided amongst his sons, and the first portion came forth for Elam and his sons* (Jubilees 9:2) and *And Japheth also divided the land of his inheritance amongst his sons* (Jubilees 9:6). This is not a new genealogy — it is the SAME roster Genesis already laid down: *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1), and where Jubilees gives Cush and Mizraim and Canaan to Ham, Genesis answers *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan* (Genesis 10:6). The whole earth carved up by lot here closes the way Genesis closes its table: *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). The division itself began in the prior chapter, when Peleg was named for it — *the children of Noah began to divide the earth amongst themselves* (Jubilees 8:8). It ain''t new: Jubilees is reading you Genesis 10 from the inside.',
       sv.verse_id, ev.verse_id, 'extras', 53200
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-isles-divided-by-tongue',
       E'The islands and coasts apportioned — divided in their lands, after their tongues',
       E'Japheth''s sons receive the sea-board and the islands: *And for Madai came forth as his portion that he should possess from the west of his two brothers to the islands, and to the coasts of the islands* (Jubilees 9:9), *And for Javan came forth the fourth portion every island and the islands which are towards the border of Lud* (Jubilees 9:10), and *And for Tiras there came forth the seventh portion, four great islands in the midst of the sea* (Jubilees 9:12). Genesis had already filed this exact picture under Japheth: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2), and then summed their inheritance as the coastlands of the nations — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). The seven sons of Japheth, the islands, the dividing — Jubilees 9 is simply walking the reader verse-by-verse through Genesis 10. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53203
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-most-high-set-the-bounds',
       E'The bounds set by the Most High — the inheritance of the nations divided',
       E'When the sons of Noah divide the earth and bind it for ever — *And they all said, "So be it; so be it," for themselves and their sons for ever throughout their generations* (Jubilees 9:15) — Jubilees is showing the human side of a division the Torah credits to Yahuah Himself. Moses sings it: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — and out of all those portions Yahuah reserves one for Himself: *For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). Paul preaches the same architecture to the idolaters at Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The lots Noah''s sons cast in Jubilees 9 are the Most High''s bounds — election and the nations'' borders set together. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53206
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-oath-curse-day-of-judgment',
       E'The oath, the curse on the land-seizer, and the day of judgment by sword and fire',
       E'Noah binds the division with an oath and a curse: *and he bound them all by an oath, imprecating a curse on every one that sought to seize the portion which had not fallen (to him) by his lot* (Jubilees 9:14), and the sons ratify it to the end of the age — *for themselves and their sons for ever throughout their generations till the day of judgment, on which Yahuah Elohim (the LORD God) shall judge them with a sword and with fire, for all the unclean wickedness of their errors* (Jubilees 9:15). The curse-on-the-bloodguilty reaches back to the covenant Yahuah cut with Noah''s house after the flood: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). The appointed day of judgment by fire is the same day the bound Watchers await in the live 1 Enoch apparatus — *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6) — and the day Paul proclaims to Athens: *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31). The oath, the curse, the appointed fire — all already written. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53209
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-9-division-table-of-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The same three sons of Noah whose portions Jubilees 9 is dividing by lot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The very sons among whom Jubilees 9:1 says Ham divided his portion — Cush, Mizraim, Put, Canaan.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* Genesis seals its table of nations with the very division Jubilees 9 is narrating by lot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The division Jubilees 9 details was begun and named one chapter earlier.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-9-isles-divided-by-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth whose island-portions Jubilees 9:8-12 distributes by lot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-isles-divided-by-tongue'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis already assigns the isles and coastlands to Japheth''s line, exactly as Jubilees 9:9-10 gives Madai and Javan the islands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-isles-divided-by-tongue'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-9-most-high-set-the-bounds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The very dividing of the nations'' inheritance by lot that Jubilees 9:14 records, credited in the Torah to the Most High Himself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-most-high-set-the-bounds'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Out of all the portions divided in Jubilees 9, the Most High keeps one lot for Himself — Jacob, the elect seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-most-high-set-the-bounds'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul tells idolatrous Athens what Jubilees 9 enacts: the nations'' boundaries are Yahuah''s appointment, not chance.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-most-high-set-the-bounds'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-9-oath-curse-day-of-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The post-flood covenant of accountability behind the curse Noah lays on whoever seizes another''s portion in Jubilees 9:14.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-oath-curse-day-of-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The same appointed day of judgment by fire that Jubilees 9:15 names — the reckoning the bound Watchers of the live Enoch apparatus await.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-oath-curse-day-of-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:31 — *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead.* Paul names the very day of judgment Jubilees 9:15 swears the oath toward.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-oath-curse-day-of-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

