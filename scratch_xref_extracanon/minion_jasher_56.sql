-- ----- fragment: minion_jasher_56.sql (session252 jasher 56) -----
-- Source anchor: jasher/jasher ch56. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja56 (view _session252_ja56_lookup). Sort band base 56375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja56_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-56-jacob-dies-the-visitation
  ('jasher', 'jasher', 56, 1, 'canon', 'genesis', 47, 28, 'free', E'Genesis 47:28 — *And Jacob lived in the land of Egypt seventeen years: so the whole age of Jacob was an hundred forty and seven years.* Genesis gives the identical seventeen years and 147-year lifespan that opens Jasher 56:1.'),
  ('jasher', 'jasher', 56, 6, 'canon', 'genesis', 49, 1, 'free', E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* The gathering of the sons to be blessed in Jasher 56:6 is the deathbed assembly of Genesis 49.'),
  ('jasher', 'jasher', 56, 3, 'canon', 'genesis', 49, 29, 'free', E'Genesis 49:29 — *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite,* Jacob''s charge to bury him at Machpelah in Jasher 56:3 is the Genesis charge verbatim in substance.'),
  ('jasher', 'jasher', 56, 22, 'canon', 'genesis', 49, 33, 'free', E'Genesis 49:33 — *And when Jacob had made an end of commanding his sons, he gathered up his feet into the bed, and yielded up the ghost, and was gathered unto his people.* The death scene of Jasher 56:22, feet drawn into the bed and gathered to his people, is Genesis 49:33.'),
  ('jasher', 'jasher', 56, 1, 'jubilees', 'jubilees', 45, 13, 'extras', E'Jubilees 45:13 — *And Yashar''el (Israel) lived in the land of Egypt seventeen years, and all the days which he lived were three jubilees, one hundred and forty-seven years, and he died in the fourth year of the fifth week of the forty-fifth jubilee.* Jubilees keeps the same seventeen years and 147-year total that frames Jasher 56:1, with the deathbed blessing of the sons.'),
  ('jasher', 'jasher', 56, 3, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The visitation Jacob promises in Jasher 56:3 is the same sworn deliverance Joseph repeats in Genesis.'),
  -- thread: jasher-56-judah-the-sceptre
  ('jasher', 'jasher', 56, 8, 'canon', 'genesis', 49, 8, 'free', E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* Jacob''s word that Judah shall reign over his brethren (Jasher 56:8) is the Genesis blessing of dominion over Judah.'),
  ('jasher', 'jasher', 56, 8, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The everlasting reign Jacob gives Judah in Jasher 56:8 is the undeparting sceptre held until Shiloh.'),
  ('jasher', 'jasher', 56, 9, 'canon', 'numbers', 24, 17, 'free', E'Numbers 24:17 — *I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* The battle-ready ruler over his enemies in Jasher 56:9 is the Sceptre Balaam foresaw rising out of Israel.'),
  ('jasher', 'jasher', 56, 8, 'canon', 'hebrews', 7, 14, 'free', E'Hebrews 7:14 — *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* The forever-reign Jacob speaks over Judah in Jasher 56:8 lands on the Lord sprung from Judah.'),
  -- thread: jasher-56-embalming-and-burial-procession
  ('jasher', 'jasher', 56, 29, 'canon', 'genesis', 50, 2, 'free', E'Genesis 50:2 — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel).* Joseph''s command to the doctors to embalm Jacob in Jasher 56:29 is the Genesis embalming verbatim.'),
  ('jasher', 'jasher', 56, 28, 'canon', 'genesis', 50, 3, 'free', E'Genesis 50:3 — *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days.* The seventy days of weeping in Jasher 56:28 are the threescore and ten days the Egyptians mourned in Genesis.'),
  ('jasher', 'jasher', 56, 34, 'canon', 'genesis', 50, 7, 'free', E'Genesis 50:7 — *And Joseph went up to bury his father: and with him went up all the servants of Pharaoh, the elders of his house, and all the elders of the land of Egypt,* The caravan of Pharaoh''s servants and the elders of Egypt going up in Jasher 56:34 is the Genesis burial procession.'),
  ('jasher', 'jasher', 56, 42, 'canon', 'genesis', 50, 10, 'free', E'Genesis 50:10 — *And they came to the threshingfloor of Atad, which is beyond Jordan, and there they mourned with a great and very sore lamentation: and he made a mourning for his father seven days.* The great mourning at the threshing floor of Atad beyond Jordan in Jasher 56:42 is the same Atad lamentation in Genesis.'),
  ('jasher', 'jasher', 56, 66, 'canon', 'genesis', 50, 13, 'free', E'Genesis 50:13 — *For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre.* Jacob buried by his sons in the cave of Machpelah that Abraham bought (Jasher 56:66) is the Genesis burial.'),
  -- thread: jasher-56-esau-contests-the-cave
  ('jasher', 'jasher', 56, 50, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau standing against Jacob''s sons at the cave (Jasher 56:50) plays out the two-nations division spoken from the womb.'),
  ('jasher', 'jasher', 56, 50, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* Esau''s claim on the cave against Jacob (Jasher 56:50) sets the very brothers Malachi distinguishes as loved and not chosen.'),
  ('jasher', 'jasher', 56, 64, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Esau cut down at the cave by Chushim in Jasher 56:64 prefigures Edom cut off for his violence against his brother Jacob.'),
  ('jasher', 'jasher', 56, 65, 'canon', 'hebrews', 11, 21, 'free', E'Hebrews 11:21 — *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff.* The sons burying Jacob by force despite Esau (Jasher 56:65) carries out the faith of the dying Jacob the New Testament honors.'),
  -- thread: jasher-56-joseph-bones-foretold
  ('jasher', 'jasher', 56, 20, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The grievous troubles Jacob foresees in the latter days (Jasher 56:20) are the affliction sworn to Abraham at the covenant of the pieces.'),
  ('jasher', 'jasher', 56, 21, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The deliverance from affliction Jacob promises in Jasher 56:21 answers the new king of Exodus under whom the bondage begins.'),
  ('jasher', 'jasher', 56, 21, 'canon', 'exodus', 13, 19, 'free', E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The servant Yahuah raises to bring them out of Egypt (Jasher 56:21) is Moses, who carries Joseph''s bones at the visitation.'),
  ('jasher', 'jasher', 56, 21, 'canon', 'hebrews', 11, 22, 'free', E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The bringing-out-of-Egypt Jacob foresees in Jasher 56:21 is the very departing Joseph foretold by faith over his bones.'),
  ('jasher', 'jasher', 56, 20, 'jubilees', 'jubilees', 46, 6, 'extras', E'Jubilees 46:6 — *And he made them swear regarding his bones, for he knew that the Egyptians would not again bring forth and bury him in the land of Canaan...* The latter-day troubles and visitation Jacob foretells in Jasher 56:20 are framed in Jubilees by Joseph''s sworn oath over his bones as the affliction nears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja56_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja56_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-56-jacob-dies-the-visitation',
       E'Jacob''s death — the 147 years and the promised visitation',
       E'Jasher closes Jacob''s life exactly where Genesis does: *And Jacob lived in the land of Egypt seventeen years, and the days of Jacob, and the years of his life were a hundred and forty seven years* (Jasher 56:1), and dying he tells his sons, *Behold I die, and the Elohim (God) of your ancestors will visit you, and bring you back to the land, which Yahuah (the Lord) sware to give to you and to your children after you* (Jasher 56:3). Genesis carries the same count to the year — *And Jacob lived in the land of Egypt seventeen years: so the whole age of Jacob was an hundred forty and seven years* (Genesis 47:28) — and the same gathering of the sons, *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days* (Genesis 49:1). The charge to bury him at Machpelah is Genesis 49:29 word for word, *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite,* (Genesis 49:29), and the death itself, *And when Jacob had made an end of commanding his sons, he gathered up his feet into the bed, and yielded up the ghost, and was gathered unto his people* (Genesis 49:33), is what Jasher renders, *and he drew his feet into the bed, he died and was gathered to his people* (Jasher 56:22). Jubilees keeps the very same three-jubilee reckoning — *And Yashar''el (Israel) lived in the land of Egypt seventeen years, and all the days which he lived were three jubilees, one hundred and forty-seven years* (Jubilees 45:13). The visitation Jacob names is the covenant promise Joseph will repeat — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24). It ain''t new: the seed is kept, the oath stands, the visitation is coming.',
       sv.verse_id, ev.verse_id, 'extras', 56375
  FROM _session252_ja56_lookup sv, _session252_ja56_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=56 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-56-judah-the-sceptre',
       E'Judah shall reign — the sceptre to Shiloh',
       E'When Jacob blesses his sons Jasher singles out Judah for the kingship: *And Jacob said to Judah, I know my son that you are a mighty man for your brethren; reign over them, and your sons shall reign over their sons forever* (Jasher 56:8), adding *Only teach your sons the bow and all the weapons of war, in order that they may fight the battles of their brother who will rule over his enemies* (Jasher 56:9). This is Genesis 49''s Shiloh oracle: *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee* (Genesis 49:8), the lion''s whelp, and *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). Balaam saw the same sceptre rising — *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* (Numbers 24:17) — and the New Testament names where it lands: *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood* (Hebrews 7:14). The everlasting reign Jacob speaks over Judah in Jasher 56:8 is the Messianic line kept, the gathering of the people to Shiloh. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56378
  FROM _session252_ja56_lookup sv, _session252_ja56_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=56 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-56-embalming-and-burial-procession',
       E'The embalming and the procession to Machpelah',
       E'Jasher gives the funeral in full: *Joseph commanded his servants the doctors to embalm his father with myrrh and frankincense and all manner of incense and perfume* (Jasher 56:29), the seventy days of weeping (Jasher 56:28), and the great company that *came to the threshing floor of Atad, which was on the other side of Jordan, and they mourned an exceeding great and heavy mourning in that place* (Jasher 56:42). Genesis records the same embalming — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel)* (Genesis 50:2) — the same seventy days, *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days* (Genesis 50:3); the same caravan of Pharaoh''s elders, *And Joseph went up to bury his father: and with him went up all the servants of Pharaoh, the elders of his house, and all the elders of the land of Egypt,* (Genesis 50:7); and the same Atad mourning, *And they came to the threshingfloor of Atad, which is beyond Jordan, and there they mourned with a great and very sore lamentation: and he made a mourning for his father seven days* (Genesis 50:10). The burial lands where Abraham first bought it — *For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre* (Genesis 50:13) — exactly as Jasher 56:66 says. The seven-day mourning that ends Jasher 56:68 is Genesis 50:10. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56381
  FROM _session252_ja56_lookup sv, _session252_ja56_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=56 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-56-esau-contests-the-cave',
       E'Esau contests the cave — Edom set apart from the elect',
       E'Jasher''s legendary expansion brings Esau himself to block the burial: *Esau stood with his sons against Joseph and his brethren as a hindrance in the cave, saying, Jacob shall not be buried in it, for it belongs to us and to our father* (Jasher 56:50). The dispute breaks into battle, and *Chushim the son of Dan... slew Esau with a sword, and he cut off his head* (Jasher 56:64). Genesis foretold the two brothers as two nations divided from the womb — *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23) — and Scripture sets Esau outside the elect line by name: *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau, and laid his mountains and his heritage waste* (Malachi 1:2-3). Obadiah pronounces the same end on Edom''s violence against his brother — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 10). Even Esau''s quarrel cannot keep Jacob from the grave of the fathers; the faith Hebrews names stands — *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff* (Hebrews 11:21). Election precedes the contest: the elder serves the younger, and Edom is set apart from the kept seed.',
       sv.verse_id, ev.verse_id, 'extras', 56384
  FROM _session252_ja56_lookup sv, _session252_ja56_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=50
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=56 AND ev.verse_number=65
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-56-joseph-bones-foretold',
       E'The bondage foretold and the bones to be carried up',
       E'Through the dying Jacob Jasher names the affliction ahead and the deliverer to come: *For I know that many and grievous troubles will befall you in the latter days in the land, yea your children and children''s children, only serve Yahuah (the Lord) and he will save you from all trouble* (Jasher 56:20), and *then will Yahuah (the Lord) raise up to you and your children a servant from amongst your children, and Yahuah (the Lord) will deliver you through his hand from all affliction, and bring you out of Egypt and bring you back to the land of your fathers* (Jasher 56:21). This is the word sworn to Abraham — *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13) — the affliction that begins when *there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8). The deliverer Jacob foresees is the visitation tied to Joseph''s oath: *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25), which Moses keeps — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel)* (Exodus 13:19) — and which Hebrews crowns, *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). Jubilees keeps the same oath over the bones — *And he made them swear regarding his bones, for he knew that the Egyptians would not again bring forth and bury him in the land of Canaan* (Jubilees 46:6). The bondage is foretold, the visitation promised, the seed kept. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56387
  FROM _session252_ja56_lookup sv, _session252_ja56_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=56 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-56-jacob-dies-the-visitation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 47:28 — *And Jacob lived in the land of Egypt seventeen years: so the whole age of Jacob was an hundred forty and seven years.* Genesis gives the identical seventeen years and 147-year lifespan that opens Jasher 56:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-jacob-dies-the-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* The gathering of the sons to be blessed in Jasher 56:6 is the deathbed assembly of Genesis 49.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-jacob-dies-the-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:29 — *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite,* Jacob''s charge to bury him at Machpelah in Jasher 56:3 is the Genesis charge verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-jacob-dies-the-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:33 — *And when Jacob had made an end of commanding his sons, he gathered up his feet into the bed, and yielded up the ghost, and was gathered unto his people.* The death scene of Jasher 56:22, feet drawn into the bed and gathered to his people, is Genesis 49:33.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-jacob-dies-the-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 45:13 — *And Yashar''el (Israel) lived in the land of Egypt seventeen years, and all the days which he lived were three jubilees, one hundred and forty-seven years, and he died in the fourth year of the fifth week of the forty-fifth jubilee.* Jubilees keeps the same seventeen years and 147-year total that frames Jasher 56:1, with the deathbed blessing of the sons.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-jacob-dies-the-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=45 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The visitation Jacob promises in Jasher 56:3 is the same sworn deliverance Joseph repeats in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-jacob-dies-the-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-56-judah-the-sceptre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* Jacob''s word that Judah shall reign over his brethren (Jasher 56:8) is the Genesis blessing of dominion over Judah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-judah-the-sceptre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The everlasting reign Jacob gives Judah in Jasher 56:8 is the undeparting sceptre held until Shiloh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-judah-the-sceptre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* The battle-ready ruler over his enemies in Jasher 56:9 is the Sceptre Balaam foresaw rising out of Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-judah-the-sceptre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:14 — *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* The forever-reign Jacob speaks over Judah in Jasher 56:8 lands on the Lord sprung from Judah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-judah-the-sceptre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-56-embalming-and-burial-procession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:2 — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel).* Joseph''s command to the doctors to embalm Jacob in Jasher 56:29 is the Genesis embalming verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-embalming-and-burial-procession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:3 — *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days.* The seventy days of weeping in Jasher 56:28 are the threescore and ten days the Egyptians mourned in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-embalming-and-burial-procession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:7 — *And Joseph went up to bury his father: and with him went up all the servants of Pharaoh, the elders of his house, and all the elders of the land of Egypt,* The caravan of Pharaoh''s servants and the elders of Egypt going up in Jasher 56:34 is the Genesis burial procession.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-embalming-and-burial-procession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 50:10 — *And they came to the threshingfloor of Atad, which is beyond Jordan, and there they mourned with a great and very sore lamentation: and he made a mourning for his father seven days.* The great mourning at the threshing floor of Atad beyond Jordan in Jasher 56:42 is the same Atad lamentation in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-embalming-and-burial-procession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 50:13 — *For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre.* Jacob buried by his sons in the cave of Machpelah that Abraham bought (Jasher 56:66) is the Genesis burial.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-embalming-and-burial-procession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=66
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-56-esau-contests-the-cave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau standing against Jacob''s sons at the cave (Jasher 56:50) plays out the two-nations division spoken from the womb.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-esau-contests-the-cave'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* Esau''s claim on the cave against Jacob (Jasher 56:50) sets the very brothers Malachi distinguishes as loved and not chosen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-esau-contests-the-cave'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Esau cut down at the cave by Chushim in Jasher 56:64 prefigures Edom cut off for his violence against his brother Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-esau-contests-the-cave'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:21 — *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff.* The sons burying Jacob by force despite Esau (Jasher 56:65) carries out the faith of the dying Jacob the New Testament honors.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-esau-contests-the-cave'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-56-joseph-bones-foretold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The grievous troubles Jacob foresees in the latter days (Jasher 56:20) are the affliction sworn to Abraham at the covenant of the pieces.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-joseph-bones-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The deliverance from affliction Jacob promises in Jasher 56:21 answers the new king of Exodus under whom the bondage begins.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-joseph-bones-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The servant Yahuah raises to bring them out of Egypt (Jasher 56:21) is Moses, who carries Joseph''s bones at the visitation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-joseph-bones-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The bringing-out-of-Egypt Jacob foresees in Jasher 56:21 is the very departing Joseph foretold by faith over his bones.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-joseph-bones-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:6 — *And he made them swear regarding his bones, for he knew that the Egyptians would not again bring forth and bury him in the land of Canaan...* The latter-day troubles and visitation Jacob foretells in Jasher 56:20 are framed in Jubilees by Joseph''s sworn oath over his bones as the affliction nears.'
  FROM cross_reference_threads t, cross_references x, _session252_ja56_lookup sv, _session252_ja56_lookup tv
 WHERE t.slug='jasher-56-joseph-bones-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=56 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

