-- ----- fragment: minion_jasher_07.sql (session252 jasher 7) -----
-- Source anchor: jasher/jasher ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja07 (view _session252_ja07_lookup). Sort band base 55150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-7-three-sons-of-noah
  ('jasher', 'jasher', 7, 1, 'canon', 'genesis', 9, 18, 'free', E'Genesis 9:18 — *And the sons of Noah, that went forth of the ark, were Shem, and Ham, and Japheth: and Ham is the father of Canaan.* The same three brothers Jasher names are the three who came out of the ark in the canon.'),
  ('jasher', 'jasher', 7, 1, 'canon', 'genesis', 9, 19, 'free', E'Genesis 9:19 — *These are the three sons of Noah: and of them was the whole earth overspread.* Jasher 7''s whole genealogy of the nations is the unfolding of this one verse — from the three, all the earth.'),
  ('jasher', 'jasher', 7, 1, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* Jasher 7:1 is the same heading to the table of nations, the children born after the flood.'),
  ('jasher', 'jasher', 7, 1, 'jubilees', 'jubilees', 8, 10, 'extras', E'Jubilees 8:10 — *And it came to pass in the beginning of the thirty-third jubilee that they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each, in the first year in the first week, when one of us, who had been sent, was with them.* The live Jubilees apparatus tells the same three-way division of the earth among Noah''s sons.'),
  -- thread: jasher-7-sons-of-japheth
  ('jasher', 'jasher', 7, 2, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth Jasher 7:2 names, in the same order.'),
  ('jasher', 'jasher', 7, 3, 'canon', 'genesis', 10, 3, 'free', E'Genesis 10:3 — *And the sons of Gomer; Ashkenaz, and Riphath, and Togarmah.* Jasher 7:3''s Askinaz, Rephath and Tegarmah are these same three sons of Gomer.'),
  ('jasher', 'jasher', 7, 6, 'canon', 'genesis', 10, 4, 'free', E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* Jasher 7:6''s sons of Javan match the canon''s line of Javan exactly.'),
  ('jasher', 'jasher', 7, 9, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Jasher closing the families of Japheth with their numbers is the same dividing-into-nations the canon records here.'),
  -- thread: jasher-7-sons-of-ham
  ('jasher', 'jasher', 7, 10, 'canon', 'genesis', 10, 6, 'free', E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham Jasher 7:10 names — Cush, Mitzraim, Phut and Canaan.'),
  ('jasher', 'jasher', 7, 10, 'canon', 'genesis', 10, 7, 'free', E'Genesis 10:7 — *And the sons of Cush; Seba, and Havilah, and Sabtah, and Raamah, and Sabtecha: and the sons of Raamah; Sheba, and Dedan.* Jasher 7:10''s house of Cush, down to Raama''s sons Sheba and Dedan, is the canon''s line of Cush.'),
  ('jasher', 'jasher', 7, 13, 'canon', 'genesis', 10, 15, 'free', E'Genesis 10:15 — *And Canaan begat Sidon his firstborn, and Heth.* Jasher 7:13 opens Canaan''s sons with the same Zidon and Heth the canon names first.'),
  ('jasher', 'jasher', 7, 13, 'canon', 'genesis', 10, 17, 'free', E'Genesis 10:17 — *And the Hivite, and the Arkite, and the Sinite.* Jasher 7:13''s Hivi, Arkee and Seni are these same Canaanite families of the table of nations.'),
  -- thread: jasher-7-sons-of-shem-seed-line
  ('jasher', 'jasher', 7, 15, 'canon', 'genesis', 10, 22, 'free', E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The same five sons of Shem Jasher 7:15 names — Elam, Ashur, Arpachshad, Lud and Aram.'),
  ('jasher', 'jasher', 7, 17, 'canon', 'genesis', 10, 23, 'free', E'Genesis 10:23 — *And the children of Aram; Uz, and Hul, and Gether, and Mash.* Jasher 7:17''s sons of Aram — Uz, Chul, Gather and Mash — are the canon''s line of Aram.'),
  ('jasher', 'jasher', 7, 15, 'canon', 'genesis', 10, 21, 'free', E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Jasher narrowing to Shem''s house marks the chosen seed-line — Shem the father of the children of Eber, through whom the promise runs.'),
  -- thread: jasher-7-peleg-the-earth-divided
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 25, 'free', E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan.* Jasher 7:18 gives the same Peleg, so named because in his days the earth was divided.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 32, 'free', E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The whole genealogy of Jasher 7 is the dividing of the nations after the flood the canon seals here.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dividing in Peleg''s day was the Most High apportioning the nations their inheritance.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul preaches the same truth Jasher 7 narrates — one blood, the bounds of the nations'' habitation set.'),
  ('jasher', 'jasher', 7, 18, 'jubilees', 'jubilees', 8, 8, 'extras', E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The live Jubilees apparatus names the same Peleg born when the earth was divided.'),
  -- thread: jasher-7-nimrod-shinar-kingdom-of-man
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher 7:18''s Nimrod, son of Cush, grown mighty in the earth, is the very figure the canon introduces here.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher 7:18 names Nimrod''s city Shinar and his great kingdom — the canon''s land of Shinar, the beginning of his rebel rule.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 11, 1, 'free', E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jasher 7:18''s earth of one tongue gathered under Nimrod is the Babel generation of one language.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'micah', 5, 6, 'free', E'Micah 5:6 — *And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land, and when he treadeth within our borders.* The prophet still calls the kingdom-of-man Nimrod built ''the land of Nimrod'' — the rebel power undone in the deliverance.'),
  ('jasher', 'jasher', 7, 18, 'jubilees', 'jubilees', 10, 19, 'extras', E'Jubilees 10:19 — *For they departed from the land of Ararat eastward to Shinar; for in his days they built the city and the tower, saying, "Go to, let us ascend thereby into heaven."* The live Jubilees apparatus tells the same city and tower at Shinar that Jasher 7:18 narrates under Nimrod.'),
  -- thread: jasher-7-garments-enoch-terah-abram
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Jasher 7:18''s Enoch ''taken up to Elohim'' is the canon''s Enoch whom God took.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The witness names the same translation Jasher 7:18 recalls when Enoch was taken up and passed the garments on.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 11, 26, 'free', E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran.* Jasher 7:18 records the same Terah, seventy years old, begetting Abram — the called seed entering the story.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abram born to Terah inside Nimrod''s idolatrous Shinar is the seed called out from fathers who served other gods.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-three-sons-of-noah',
       E'The sons of Noah, of them the whole earth overspread',
       E'Jasher opens the post-Flood world with the three brothers: *And these are the names of the sons of Noah: Japheth, Ham and Shem; and children were born to them after the flood, for they had taken wives before the flood* (Jasher 7:1). It ain''t new — Genesis says the same, naming the three who went out of the ark: *And the sons of Noah, that went forth of the ark, were Shem, and Ham, and Japheth: and Ham is the father of Canaan* (Genesis 9:18), and from them *of them was the whole earth overspread* (Genesis 9:19). The table of nations begins identically: *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1). The same generations are told in the Jubilees apparatus now live beside this, where Noah divides the whole earth among these three sons (Jubilees 8:10). The chosen seed runs forward from this household.',
       sv.verse_id, ev.verse_id, 'extras', 55150
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-sons-of-japheth',
       E'The sons of Japheth, the isles of the nations',
       E'Jasher names the seven sons of Japheth: *These are the sons of Japheth; Gomer, Magog, Madai, Javan, Tubal, Meshech, and Tiras, seven sons* (Jasher 7:2), with Gomer''s line — *And the sons of Gomer were Askinaz, Rephath and Tegarmah* (Jasher 7:3) — and Javan''s — *And the sons of Javan were Elisha, Tarshish, Chittim and Dudonim* (Jasher 7:6). It ain''t new: the canon''s table of nations lists the same names. *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2); *And the sons of Gomer; Ashkenaz, and Riphath, and Togarmah* (Genesis 10:3); *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim* (Genesis 10:4). From these the nations spread — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). Jasher simply adds the count of men and a few extra names; the spine is Genesis 10.',
       sv.verse_id, ev.verse_id, 'extras', 55153
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-sons-of-ham',
       E'The sons of Ham, Cush and Canaan',
       E'Jasher lists Ham''s four sons and their houses: *And these are the sons of Ham; Cush, Mitzraim, Phut and Canaan, four sons; and the sons of Cush were Seba, Havilah, Sabta, Raama and Satecha, and the sons of Raama were Sheba and Dedan* (Jasher 7:10), and Canaan''s many sons — *And the sons of Canaan were Zidon, Heth, Amori, Gergashi, Hivi, Arkee, Seni, Arodi, Zimodi and Chamothi* (Jasher 7:13). It ain''t new. The canon names the same fathers: *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan* (Genesis 10:6); *And the sons of Cush; Seba, and Havilah, and Sabtah, and Raamah, and Sabtecha: and the sons of Raamah; Sheba, and Dedan* (Genesis 10:7); and Canaan''s line — *And Canaan begat Sidon his firstborn, and Heth* (Genesis 10:15) — through *the Hivite, and the Arkite, and the Sinite* (Genesis 10:17). Jasher''s spelling differs, but Zidon, Heth, the Amorite, Girgashite, Hivite, Arkite, Sinite are the canon''s Canaanite families spread abroad.',
       sv.verse_id, ev.verse_id, 'extras', 55156
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-sons-of-shem-seed-line',
       E'The sons of Shem — the chosen seed-line kept',
       E'The genealogy narrows toward the elect line: *And these are the sons of Shem; Elam, Ashur, Arpachshad, Lud and Aram, five sons* (Jasher 7:15), and Aram''s house — *and the sons of Aram were Uz, Chul, Gather and Mash* (Jasher 7:17). It ain''t new: *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram* (Genesis 10:22); *And the children of Aram; Uz, and Hul, and Gether, and Mash* (Genesis 10:23). The canon marks Shem as the father of the covenant line — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born* (Genesis 10:21). This is election traced generation by generation: through Shem and Arpachshad the chosen seed runs on toward Eber, Peleg, and Abram, kept and named long before any confession — the line that bears the promise.',
       sv.verse_id, ev.verse_id, 'extras', 55159
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-peleg-the-earth-divided',
       E'Peleg — the nations divided in their lands and tongues',
       E'Within the long verse 18 Jasher records the dividing: Eber''s two sons, *the name of one was Peleg, for in his days the sons of men were divided, and in the latter days, the earth was divided* (Jasher 7:18). It ain''t new: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan* (Genesis 10:25), and the whole table closes — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). This dividing was no accident but the Most High''s own apportioning: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8), which the apostle preaches still — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The live Jubilees apparatus names the same Peleg and the same dividing (Jubilees 8:8) and binds the nations by an oath of their inheritance (Jubilees 9:14).',
       sv.verse_id, ev.verse_id, 'extras', 55162
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-nimrod-shinar-kingdom-of-man',
       E'Nimrod — the mighty hunter, Shinar, the kingdom of man',
       E'Inside verse 18 the rebel king arises: Cush *had begotten Nimrod... and when Nimrod was twenty years old he put on those garments. And Nimrod became strong when he put on the garments... and he was a mighty hunter in the earth* (Jasher 7:18), who built Shinar, reigned over all the sons of Noah, *and all the earth was of one tongue and words of union, but Nimrod did not go in the ways of Yahuah (the Lord)... And he made gods of wood and stone, and he bowed down to them* (Jasher 7:18). It ain''t new: *And Cush begat Nimrod: he began to be a mighty one in the earth. He was a mighty hunter before Yahuah (LORD)* (Genesis 10:8-9), *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10). Jasher''s one-tongued earth gathering to Nimrod''s city is the Babel scene: *And the whole earth was of one language, and of one speech* (Genesis 11:1); *let us build us a city and a tower... lest we be scattered abroad* (Genesis 11:4); *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth* (Genesis 11:8). The live Jubilees apparatus tells the same tower at Shinar and its overthrow (Jubilees 10:19-22). Nimrod is the kingdom-of-man pattern Scripture still names against — *the land of Nimrod* (Micah 5:6).',
       sv.verse_id, ev.verse_id, 'extras', 55165
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-garments-enoch-terah-abram',
       E'Adam''s garments, Enoch translated, and the birth of Abram',
       E'Verse 18 carries two threads the chosen line will need. First the garments: *the garments of skin which Elohim made for Adam and his wife... were given to Enoch, the son of Jared, and when Enoch was taken up to Elohim, he gave them to Methuselah, his son* (Jasher 7:18). Enoch''s being taken up is the canon''s own — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), which the witness names as translation by faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5). The same Enoch-translated event is woven heavily in Jasher 3 and the live 1 Enoch and Jubilees apparatus. Then the elect line surfaces against Nimrod''s kingdom: *Terah was seventy years old when he begat him, and Terah called the name of his son that was born to him Abram* (Jasher 7:18). It ain''t new: *And Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). And the canon remembers Terah served other gods — *even Terah, the father of Abraham... and they served other gods* (Joshua 24:2) — out of which the called seed Abram is taken: the wheat among the tares of Nimrod''s Babel.',
       sv.verse_id, ev.verse_id, 'extras', 55168
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-7-three-sons-of-noah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:18 — *And the sons of Noah, that went forth of the ark, were Shem, and Ham, and Japheth: and Ham is the father of Canaan.* The same three brothers Jasher names are the three who came out of the ark in the canon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:19 — *These are the three sons of Noah: and of them was the whole earth overspread.* Jasher 7''s whole genealogy of the nations is the unfolding of this one verse — from the three, all the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* Jasher 7:1 is the same heading to the table of nations, the children born after the flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 8:10 — *And it came to pass in the beginning of the thirty-third jubilee that they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each, in the first year in the first week, when one of us, who had been sent, was with them.* The live Jubilees apparatus tells the same three-way division of the earth among Noah''s sons.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-sons-of-japheth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth Jasher 7:2 names, in the same order.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:3 — *And the sons of Gomer; Ashkenaz, and Riphath, and Togarmah.* Jasher 7:3''s Askinaz, Rephath and Tegarmah are these same three sons of Gomer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* Jasher 7:6''s sons of Javan match the canon''s line of Javan exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Jasher closing the families of Japheth with their numbers is the same dividing-into-nations the canon records here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-sons-of-ham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham Jasher 7:10 names — Cush, Mitzraim, Phut and Canaan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:7 — *And the sons of Cush; Seba, and Havilah, and Sabtah, and Raamah, and Sabtecha: and the sons of Raamah; Sheba, and Dedan.* Jasher 7:10''s house of Cush, down to Raama''s sons Sheba and Dedan, is the canon''s line of Cush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:15 — *And Canaan begat Sidon his firstborn, and Heth.* Jasher 7:13 opens Canaan''s sons with the same Zidon and Heth the canon names first.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 10:17 — *And the Hivite, and the Arkite, and the Sinite.* Jasher 7:13''s Hivi, Arkee and Seni are these same Canaanite families of the table of nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-sons-of-shem-seed-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The same five sons of Shem Jasher 7:15 names — Elam, Ashur, Arpachshad, Lud and Aram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-shem-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:23 — *And the children of Aram; Uz, and Hul, and Gether, and Mash.* Jasher 7:17''s sons of Aram — Uz, Chul, Gather and Mash — are the canon''s line of Aram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-shem-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Jasher narrowing to Shem''s house marks the chosen seed-line — Shem the father of the children of Eber, through whom the promise runs.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-shem-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-peleg-the-earth-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan.* Jasher 7:18 gives the same Peleg, so named because in his days the earth was divided.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The whole genealogy of Jasher 7 is the dividing of the nations after the flood the canon seals here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dividing in Peleg''s day was the Most High apportioning the nations their inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul preaches the same truth Jasher 7 narrates — one blood, the bounds of the nations'' habitation set.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The live Jubilees apparatus names the same Peleg born when the earth was divided.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-nimrod-shinar-kingdom-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher 7:18''s Nimrod, son of Cush, grown mighty in the earth, is the very figure the canon introduces here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher 7:18 names Nimrod''s city Shinar and his great kingdom — the canon''s land of Shinar, the beginning of his rebel rule.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jasher 7:18''s earth of one tongue gathered under Nimrod is the Babel generation of one language.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 5:6 — *And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land, and when he treadeth within our borders.* The prophet still calls the kingdom-of-man Nimrod built ''the land of Nimrod'' — the rebel power undone in the deliverance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 10:19 — *For they departed from the land of Ararat eastward to Shinar; for in his days they built the city and the tower, saying, "Go to, let us ascend thereby into heaven."* The live Jubilees apparatus tells the same city and tower at Shinar that Jasher 7:18 narrates under Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-garments-enoch-terah-abram
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Jasher 7:18''s Enoch ''taken up to Elohim'' is the canon''s Enoch whom God took.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The witness names the same translation Jasher 7:18 recalls when Enoch was taken up and passed the garments on.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran.* Jasher 7:18 records the same Terah, seventy years old, begetting Abram — the called seed entering the story.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abram born to Terah inside Nimrod''s idolatrous Shinar is the seed called out from fathers who served other gods.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

