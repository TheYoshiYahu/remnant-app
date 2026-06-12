-- ----- fragment: minion_jasher_90.sql (session252 jasher 90) -----
-- Source anchor: jasher/jasher ch90. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja90 (view _session252_ja90_lookup). Sort band base 57225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja90_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-90-land-divided-by-lot
  ('jasher', 'jasher', 90, 13, 'canon', 'joshua', 13, 1, 'free', E'Joshua 13:1 — *Now Joshua was old and stricken in years; and Yahuah (LORD) said unto him, Thou art old and stricken in years, and there remaineth yet very much land to be possessed.* The canon''s own opening of the land-division charge that Jasher 90:13 retells verbatim.'),
  ('jasher', 'jasher', 90, 14, 'canon', 'joshua', 13, 7, 'free', E'Joshua 13:7 — *Now therefore divide this land for an inheritance unto the nine tribes, and the half tribe of Manasseh,* The exact command to divide for the nine tribes and half-Manasseh that Joshua rises to obey in Jasher 90:14.'),
  ('jasher', 'jasher', 90, 23, 'canon', 'joshua', 14, 1, 'free', E'Joshua 14:1 — *And these are the countries which the children of Yashar''el (Israel) inherited in the land of Canaan, which Eleazar the priest, and Joshua the son of Nun, and the heads of the fathers of the tribes of the children of Yashar''el (Israel), distributed for inheritance to them.* The same Eleazar-Joshua-tribal-heads portioning by lot that Jasher 90:23 records at Shiloh.'),
  ('jasher', 'jasher', 90, 19, 'canon', 'joshua', 14, 2, 'free', E'Joshua 14:2 — *By lot was their inheritance, as Yahuah (LORD) commanded by the hand of Moses, for the nine tribes, and for the half tribe.* The lot-divided inheritance commanded by the hand of Moses that Jasher 90:19 echoes.'),
  -- thread: jasher-90-caleb-hebron
  ('jasher', 'jasher', 90, 17, 'canon', 'joshua', 14, 13, 'free', E'Joshua 14:13 — *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance.* The same gift of Hebron to Caleb that Jasher 90:17 records as one portion above his brethren.'),
  ('jasher', 'jasher', 90, 18, 'canon', 'joshua', 14, 14, 'free', E'Joshua 14:14 — *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel).* The canon''s ''unto this day'' that Jasher 90:18 carries word for word, adding the reason: Caleb wholly followed Yahuah.'),
  -- thread: jasher-90-levi-no-inheritance
  ('jasher', 'jasher', 90, 16, 'canon', 'joshua', 13, 14, 'free', E'Joshua 13:14 — *Only unto the tribe of Levi he gave none inheritance; the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance, as he said unto them.* The same Levite exception — Yahuah''s offerings as their portion — that Jasher 90:16 carries.'),
  ('jasher', 'jasher', 90, 16, 'canon', 'numbers', 18, 23, 'free', E'Numbers 18:23 — *But the Levites shall do the service of the tabernacle of the congregation, and they shall bear their iniquity: it shall be a statute for ever throughout your generations, that among the children of Yashar''el (Israel) they have no inheritance.* The Torah statute given by the hand of Moses that Jasher 90:16 says was ''spoken of them by the hand of Moses.'''),
  -- thread: jasher-90-rest-from-enemies
  ('jasher', 'jasher', 90, 24, 'canon', 'joshua', 21, 43, 'free', E'Joshua 21:43 — *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein.* The sworn-to-the-fathers land-gift that Jasher 90:24 restates as Yahuah giving and Israel possessing.'),
  ('jasher', 'jasher', 90, 25, 'canon', 'joshua', 21, 44, 'free', E'Joshua 21:44 — *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand.* The rest-from-enemies, no-man-stood promise that Jasher 90:25 amplifies into ''not one thing failed of all the good.'''),
  -- thread: jasher-90-joshua-farewell-covenant
  ('jasher', 'jasher', 90, 34, 'canon', 'joshua', 23, 6, 'free', E'Joshua 23:6 — *Be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left;* Joshua''s same charge — keep the law of Moses, turn not right or left — that Jasher 90:34 carries.'),
  ('jasher', 'jasher', 90, 34, 'canon', 'deuteronomy', 5, 32, 'free', E'Deuteronomy 5:32 — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* Moses'' original ''turn not right or left'' Torah standard that Joshua repeats in Jasher 90:34 — the law standing, not new.'),
  ('jasher', 'jasher', 90, 36, 'canon', 'joshua', 24, 24, 'free', E'Joshua 24:24 — *And the people said unto Joshua, Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey.* The people''s covenant answer that Jasher 90:36 expands to ''all our days ... and our seed for ever.'''),
  ('jasher', 'jasher', 90, 33, 'canon', 'deuteronomy', 31, 6, 'free', E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* The ''strengthen yourselves'' charge whose root is Moses'' farewell, echoed in Joshua''s own farewell at Jasher 90:33.'),
  -- thread: jasher-90-bones-of-the-twelve
  ('jasher', 'jasher', 90, 45, 'canon', 'joshua', 24, 32, 'free', E'Joshua 24:32 — *And the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem, in a parcel of ground which Jacob bought of the sons of Hamor the father of Shechem for an hundred pieces of silver: and it became the inheritance of the children of Joseph.* The exact Shechem burial of Joseph''s bones in Jacob''s purchased field that Jasher 90:45 records.'),
  ('jasher', 'jasher', 90, 38, 'canon', 'genesis', 50, 25, 'free', E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The oath that made Israel carry the coffins up from Egypt, fulfilled in the burial of Jasher 90:38.'),
  ('jasher', 'jasher', 90, 38, 'canon', 'exodus', 13, 19, 'free', E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The Exodus moment Israel took up the bones from Egypt — ''which they had brought up from Egypt'' in Jasher 90:38.'),
  ('jasher', 'jasher', 90, 38, 'jubilees', 'jubilees', 46, 9, 'extras', E'Jubilees 46:9 — *the children of Yashar''el (Israel) brought forth all the bones of the children of Jacob save the bones of Joseph, and they buried them in the field in the double cave in the mountain.* The same burying of the bones of the twelve sons of Jacob that Jasher 90:38 narrates — the live Jubilees apparatus self-link.'),
  -- thread: jasher-90-death-of-joshua
  ('jasher', 'jasher', 90, 47, 'canon', 'joshua', 24, 29, 'free', E'Joshua 24:29 — *And it came to pass after these things, that Joshua the son of Nun, the servant of Yahuah (LORD), died, being an hundred and ten years old.* The death of Joshua at a hundred and ten that Jasher 90:47 records word for word.'),
  ('jasher', 'jasher', 90, 49, 'canon', 'joshua', 24, 30, 'free', E'Joshua 24:30 — *And they buried him in the border of his inheritance in Timnath-serah, which is in mount Ephraim, on the north side of the hill of Gaash.* The same burial in Timnath-serah in Mount Ephraim that Jasher 90:49 carries.'),
  ('jasher', 'jasher', 90, 47, 'canon', 'joshua', 24, 31, 'free', E'Joshua 24:31 — *And Yashar''el (Israel) served Yahuah (LORD) all the days of Joshua, and all the days of the elders that overlived Joshua, and which had known all the works of Yahuah (LORD), that he had done for Yashar''el (Israel).* The ''Israel served Yahuah all the days of his life'' note that Jasher 90:47 closes on.'),
  ('jasher', 'jasher', 90, 47, 'canon', 'judges', 2, 8, 'free', E'Judges 2:8 — *And Joshua the son of Nun, the servant of Yahuah (LORD), died, being an hundred and ten years old.* The canon picking the seed-line up where Jasher 90:47 lays it down — the same servant, the same age.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja90_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja90_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-land-divided-by-lot',
       E'The land divided for an inheritance — Joshua portions it by lot',
       E'Jasher closes the book with the conquest finished and the land carved out: *And Yahuah (the Lord) said to Joshua, You are old, advanced in life, and a great part of the land remains to be possessed.* (Jasher 90:13). This is the canon''s own scene, word for word — *Now Joshua was old and stricken in years; and Yahuah (LORD) said unto him, Thou art old and stricken in years, and there remaineth yet very much land to be possessed.* (Joshua 13:1). Joshua does as he is told — *Now therefore divide this land for an inheritance to the nine tribes and to the half tribe of Manasseh, and Joshua rose up and did as Yahuah (the Lord) had spoken to him.* (Jasher 90:14) — exactly the charge of *Now therefore divide this land for an inheritance unto the nine tribes, and the half tribe of Manasseh,* (Joshua 13:7). The portioning is done by Eleazar and Joshua and the tribal heads — *These are the inheritances which Elazer the priest and Joshua the son of Nun and the heads of the fathers of the tribes portioned out to the children of Israel by lot in Shiloh* (Jasher 90:23) — the very list of *And these are the countries which the children of Yashar''el (Israel) inherited in the land of Canaan, which Eleazar the priest, and Joshua the son of Nun, and the heads of the fathers of the tribes of the children of Yashar''el (Israel), distributed for inheritance to them.* (Joshua 14:1). The twelve-tribe covenant people take their tribal inheritance — the gathering kept; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57225
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-caleb-hebron',
       E'Hebron given to Caleb — one portion above his brethren',
       E'Jasher singles out Caleb just as the canon does: *And Joshua gave Mount Hebron to Caleb the son of Jephuneh, one portion above his brethren, as Yahuah (the Lord) had spoken through Moses.* (Jasher 90:17), so that *Therefore Hebron became an inheritance to Caleb and his children to this day.* (Jasher 90:18). The source reads the same — *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance.* (Joshua 14:13) — and gives the reason Jasher leaves implicit: *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel).* (Joshua 14:14). The faithful man inherits the city of the giants — the seed kept by faithfulness, not displaced.',
       sv.verse_id, ev.verse_id, 'extras', 57228
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-levi-no-inheritance',
       E'Levi has no inheritance — Yahuah''s offerings are their portion',
       E'Jasher keeps the priestly law intact: *But to the tribe at Levi he gave no inheritance, the offerings of Yahuah (the Lord) are their inheritance as Yahuah (the Lord) had spoken of them by the hand of Moses.* (Jasher 90:16), and the people give the Levites cities out of their own portions — *And the children of Israel gave cities to the Levites from their own inheritance, and suburbs for their cattle, and property, as Yahuah (the Lord) had commanded Moses* (Jasher 90:20). The canon says it the same way — *Only unto the tribe of Levi he gave none inheritance; the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance, as he said unto them.* (Joshua 13:14) — grounded in the Torah statute *But the Levites shall do the service of the tabernacle of the congregation, and they shall bear their iniquity: it shall be a statute for ever throughout your generations, that among the children of Yashar''el (Israel) they have no inheritance.* (Numbers 18:23). Torah-before-the-conquest still standing; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57231
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-rest-from-enemies',
       E'Yahuah gives rest — not one thing failed of all the good He spoke',
       E'Jasher seals the conquest with the canon''s oath-keeping refrain: *And Yahuah (the Lord) gave the land to the Israelites, and they possessed it as Yahuah (the Lord) had spoken to them, and as Yahuah (the Lord) had sworn to their ancestors.* (Jasher 90:24), *And Yahuah (the Lord) gave to the Israelites rest from all their enemies around them, and no man stood up against them ... and not one thing failed of all the good which Yahuah (the Lord) had spoken to the children of Israel, yea Yahuah (the Lord) performed every thing.* (Jasher 90:25). The source says it twice over — *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein.* (Joshua 21:43) and *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand.* (Joshua 21:44). The covenant sworn to Abraham, Isaac, and Jacob comes to pass — the seed delivered into the land, election kept.',
       sv.verse_id, ev.verse_id, 'extras', 57234
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-joshua-farewell-covenant',
       E'Joshua''s farewell — keep the law of Moses, cleave to Yahuah',
       E'Joshua''s last charge in Jasher is the canon''s covenant at Shechem: *Now therefore strengthen yourselves to keep and to do all the words of the law of Moses, not to deviate from it to the right or to the left ... but you shall cleave to Yahuah your Elohim (the Lord your God), as you have done to this day.* (Jasher 90:34); the people answer *We will serve Yahuah our Elohim (the Lord our God) all our days, we and our children, and our children''s children, and our seed for ever.* (Jasher 90:36), and *Joshua made a covenant with the people on that day* (Jasher 90:37). The source reads the same — *Be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left;* (Joshua 23:6) — and the people''s answer *And the people said unto Joshua, Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey.* (Joshua 24:24). The Torah-not-curse standard runs straight from Moses — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* (Deuteronomy 5:32). Torah stands; the covenant eternal — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57237
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=33
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-bones-of-the-twelve',
       E'The bones of the twelve sons of Jacob buried in the land',
       E'Jasher records a burial the canon only names in passing: *they buried the coffins of the tribes of their ancestors, which they had brought up from Egypt ... the twelve sons of Jacob did the children of Israel bury, each man in the possession of his children.* (Jasher 90:38), and *the bones of Joseph they buried in Shechem, in the part of the field which Jacob had purchased from Hamor, and which became to Joseph for an inheritance.* (Jasher 90:45). The canon carries Joseph''s oath that drives it — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* (Genesis 50:25) — Moses honoring it at the Exodus, *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* (Exodus 13:19) — and the burial itself, *And the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem, in a parcel of ground which Jacob bought of the sons of Hamor the father of Shechem for an hundred pieces of silver* (Joshua 24:32). Jubilees narrates the same carrying-up of all twelve — *the children of Yashar''el (Israel) brought forth all the bones of the children of Jacob save the bones of Joseph, and they buried them in the field in the double cave in the mountain.* (Jubilees 46:9). The same scene, three witnesses; the seed gathered home even in death.',
       sv.verse_id, ev.verse_id, 'extras', 57240
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=38
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-90-death-of-joshua',
       E'The death of Joshua — buried in Timnath-serach in Mount Ephraim',
       E'Jasher ends the book at the grave of the conqueror: *And at the end of two years, Joshua the son of Nun died, one hundred and ten years old ... and Israel served Yahuah (the Lord) all the days of his life.* (Jasher 90:47), and *the children of Israel buried Joshua in the border of his inheritance, in Timnath-serach, which was given to him in Mount Ephraim.* (Jasher 90:49). The canon closes Joshua the same way — *And it came to pass after these things, that Joshua the son of Nun, the servant of Yahuah (LORD), died, being an hundred and ten years old.* (Joshua 24:29), *And they buried him in the border of his inheritance in Timnath-serah, which is in mount Ephraim* (Joshua 24:30), *And Yashar''el (Israel) served Yahuah (LORD) all the days of Joshua* (Joshua 24:31) — and Judges picks the thread up, *And Joshua the son of Nun, the servant of Yahuah (LORD), died, being an hundred and ten years old.* (Judges 2:8). The same servant, the same age, the same hill in Ephraim — Jasher hands the seed-line off to the canon and falls silent; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57243
  FROM _session252_ja90_lookup sv, _session252_ja90_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=47
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=90 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-90-land-divided-by-lot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 13:1 — *Now Joshua was old and stricken in years; and Yahuah (LORD) said unto him, Thou art old and stricken in years, and there remaineth yet very much land to be possessed.* The canon''s own opening of the land-division charge that Jasher 90:13 retells verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-land-divided-by-lot'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 13:7 — *Now therefore divide this land for an inheritance unto the nine tribes, and the half tribe of Manasseh,* The exact command to divide for the nine tribes and half-Manasseh that Joshua rises to obey in Jasher 90:14.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-land-divided-by-lot'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 14:1 — *And these are the countries which the children of Yashar''el (Israel) inherited in the land of Canaan, which Eleazar the priest, and Joshua the son of Nun, and the heads of the fathers of the tribes of the children of Yashar''el (Israel), distributed for inheritance to them.* The same Eleazar-Joshua-tribal-heads portioning by lot that Jasher 90:23 records at Shiloh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-land-divided-by-lot'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 14:2 — *By lot was their inheritance, as Yahuah (LORD) commanded by the hand of Moses, for the nine tribes, and for the half tribe.* The lot-divided inheritance commanded by the hand of Moses that Jasher 90:19 echoes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-land-divided-by-lot'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-90-caleb-hebron
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 14:13 — *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance.* The same gift of Hebron to Caleb that Jasher 90:17 records as one portion above his brethren.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-caleb-hebron'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 14:14 — *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel).* The canon''s ''unto this day'' that Jasher 90:18 carries word for word, adding the reason: Caleb wholly followed Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-caleb-hebron'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-90-levi-no-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 13:14 — *Only unto the tribe of Levi he gave none inheritance; the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance, as he said unto them.* The same Levite exception — Yahuah''s offerings as their portion — that Jasher 90:16 carries.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-levi-no-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:23 — *But the Levites shall do the service of the tabernacle of the congregation, and they shall bear their iniquity: it shall be a statute for ever throughout your generations, that among the children of Yashar''el (Israel) they have no inheritance.* The Torah statute given by the hand of Moses that Jasher 90:16 says was ''spoken of them by the hand of Moses.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-levi-no-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-90-rest-from-enemies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 21:43 — *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein.* The sworn-to-the-fathers land-gift that Jasher 90:24 restates as Yahuah giving and Israel possessing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-rest-from-enemies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 21:44 — *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand.* The rest-from-enemies, no-man-stood promise that Jasher 90:25 amplifies into ''not one thing failed of all the good.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-rest-from-enemies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-90-joshua-farewell-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 23:6 — *Be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left;* Joshua''s same charge — keep the law of Moses, turn not right or left — that Jasher 90:34 carries.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-joshua-farewell-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:32 — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* Moses'' original ''turn not right or left'' Torah standard that Joshua repeats in Jasher 90:34 — the law standing, not new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-joshua-farewell-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:24 — *And the people said unto Joshua, Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey.* The people''s covenant answer that Jasher 90:36 expands to ''all our days ... and our seed for ever.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-joshua-farewell-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* The ''strengthen yourselves'' charge whose root is Moses'' farewell, echoed in Joshua''s own farewell at Jasher 90:33.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-joshua-farewell-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-90-bones-of-the-twelve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:32 — *And the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem, in a parcel of ground which Jacob bought of the sons of Hamor the father of Shechem for an hundred pieces of silver: and it became the inheritance of the children of Joseph.* The exact Shechem burial of Joseph''s bones in Jacob''s purchased field that Jasher 90:45 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-bones-of-the-twelve'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The oath that made Israel carry the coffins up from Egypt, fulfilled in the burial of Jasher 90:38.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-bones-of-the-twelve'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The Exodus moment Israel took up the bones from Egypt — ''which they had brought up from Egypt'' in Jasher 90:38.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-bones-of-the-twelve'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:9 — *the children of Yashar''el (Israel) brought forth all the bones of the children of Jacob save the bones of Joseph, and they buried them in the field in the double cave in the mountain.* The same burying of the bones of the twelve sons of Jacob that Jasher 90:38 narrates — the live Jubilees apparatus self-link.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-bones-of-the-twelve'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=38
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-90-death-of-joshua
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:29 — *And it came to pass after these things, that Joshua the son of Nun, the servant of Yahuah (LORD), died, being an hundred and ten years old.* The death of Joshua at a hundred and ten that Jasher 90:47 records word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-death-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:30 — *And they buried him in the border of his inheritance in Timnath-serah, which is in mount Ephraim, on the north side of the hill of Gaash.* The same burial in Timnath-serah in Mount Ephraim that Jasher 90:49 carries.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-death-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:31 — *And Yashar''el (Israel) served Yahuah (LORD) all the days of Joshua, and all the days of the elders that overlived Joshua, and which had known all the works of Yahuah (LORD), that he had done for Yashar''el (Israel).* The ''Israel served Yahuah all the days of his life'' note that Jasher 90:47 closes on.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-death-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judges 2:8 — *And Joshua the son of Nun, the servant of Yahuah (LORD), died, being an hundred and ten years old.* The canon picking the seed-line up where Jasher 90:47 lays it down — the same servant, the same age.'
  FROM cross_reference_threads t, cross_references x, _session252_ja90_lookup sv, _session252_ja90_lookup tv
 WHERE t.slug='jasher-90-death-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=90 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

