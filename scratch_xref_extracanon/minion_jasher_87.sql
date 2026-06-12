-- ----- fragment: minion_jasher_87.sql (session252 jasher 87) -----
-- Source anchor: jasher/jasher ch87. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja87 (view _session252_ja87_lookup). Sort band base 57150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja87_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-87-joshua-commissioned
  ('jasher', 'jasher', 87, 1, 'canon', 'deuteronomy', 31, 14, 'free', E'Deuteronomy 31:14 — *And Yahuah (LORD) said unto Moses, Behold, thy days approach that thou must die: call Joshua, and present yourselves in the tabernacle of the congregation, that I may give him a charge. And Moses and Joshua went, and presented themselves in the tabernacle of the congregation.* Jasher 87:1 retells the same end-of-days summons of Joshua into the tabernacle verbatim.'),
  ('jasher', 'jasher', 87, 2, 'canon', 'deuteronomy', 31, 15, 'free', E'Deuteronomy 31:15 — *And Yahuah (LORD) appeared in the tabernacle in a pillar of a cloud: and the pillar of the cloud stood over the door of the tabernacle.* Jasher 87:2 carries the identical theophany at the tabernacle door.'),
  ('jasher', 'jasher', 87, 3, 'canon', 'joshua', 1, 6, 'free', E'Joshua 1:6 — *Be strong and of a good courage: for unto this people shalt thou divide for an inheritance the land, which I sware unto their fathers to give them.* Yahuah''s charge in Jasher 87:3 is the LORD''s own commissioning of Joshua to bring Israel into the sworn inheritance.'),
  ('jasher', 'jasher', 87, 3, 'canon', 'numbers', 27, 18, 'free', E'Numbers 27:18 — *And Yahuah (LORD) said unto Moses, Take thee Joshua the son of Nun, a man in whom is the spirit, and lay thine hand upon him.* Jasher 87:1-3 follows the Numbers naming of Joshua son of Nun as Moses'' appointed successor.'),
  -- thread: jasher-87-moses-charges-joshua
  ('jasher', 'jasher', 87, 4, 'canon', 'deuteronomy', 31, 7, 'free', E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* Jasher 87:4 is Moses'' same spoken charge that Joshua will make Israel inherit the land.'),
  ('jasher', 'jasher', 87, 4, 'canon', 'deuteronomy', 31, 8, 'free', E'Deuteronomy 31:8 — *And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed.* Jasher 87:4 keeps the very pledge — he will not leave nor forsake — set on Joshua.'),
  ('jasher', 'jasher', 87, 4, 'canon', 'joshua', 1, 5, 'free', E'Joshua 1:5 — *There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee.* Yahuah confirms to Joshua the same unfailing presence Moses promised in Jasher 87:4.'),
  ('jasher', 'jasher', 87, 4, 'canon', 'hebrews', 13, 5, 'free', E'Hebrews 13:5 — *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* The New Covenant carries forward the very I-will-not-forsake-thee promise spoken in Jasher 87:4.'),
  -- thread: jasher-87-torah-stands
  ('jasher', 'jasher', 87, 6, 'canon', 'deuteronomy', 4, 2, 'free', E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* Jasher 87:6''s command to observe all the words of this law carries the Torah-stands posture — neither added to nor diminished.'),
  ('jasher', 'jasher', 87, 6, 'canon', 'deuteronomy', 5, 32, 'free', E'Deuteronomy 5:32 — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* Jasher 87:6 repeats the very turn-not-to-the-right-or-left refrain of Moses'' charge to keep the way.'),
  ('jasher', 'jasher', 87, 7, 'canon', 'deuteronomy', 6, 1, 'free', E'Deuteronomy 6:1 — *Now these are the commandments, the statutes, and the judgments, which Yahuah Elohaychem (the LORD your God) commanded to teach you, that ye might do them in the land whither ye go to possess it.* Jasher 87:7''s teaching of statutes and judgments to do in the land is Moses'' Deuteronomic instruction itself.'),
  ('jasher', 'jasher', 87, 8, 'canon', 'joshua', 1, 8, 'free', E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* Jasher 87:8 names the same written book of the law given by Moses'' hand that Joshua is charged to keep.'),
  -- thread: jasher-87-death-of-moses
  ('jasher', 'jasher', 87, 9, 'canon', 'deuteronomy', 32, 49, 'free', E'Deuteronomy 32:49 — *Get thee up into this mountain Abarim, unto mount Nebo, which is in the land of Moab, that is over against Jericho; and behold the land of Canaan, which I give unto the children of Yashar''el (Israel) for a possession.* Jasher 87:9 carries Yahuah''s same command to go up to Mount Abarim and die there.'),
  ('jasher', 'jasher', 87, 9, 'canon', 'deuteronomy', 32, 50, 'free', E'Deuteronomy 32:50 — *And die in the mount whither thou goest up, and be gathered unto thy people; as Aaron thy brother died in mount Hor, and was gathered unto his people.* Jasher 87:9 keeps the very gathered-to-your-people-as-Aaron wording.'),
  ('jasher', 'jasher', 87, 10, 'canon', 'deuteronomy', 34, 5, 'free', E'Deuteronomy 34:5 — *So Moses the servant of Yahuah (LORD) died there in the land of Moab, according to the word of Yahuah (LORD).* Jasher 87:10 retells the death of Moses in Moab by the order of Yahuah.'),
  ('jasher', 'jasher', 87, 11, 'canon', 'deuteronomy', 34, 8, 'free', E'Deuteronomy 34:8 — *And the children of Yashar''el (Israel) wept for Moses in the plains of Moab thirty days: so the days of weeping and mourning for Moses were ended.* Jasher 87:11 carries the identical thirty-days mourning that closes the Torah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja87_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja87_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-87-joshua-commissioned',
       E'Joshua charged in the tabernacle — be strong and courageous',
       E'Jasher''s final chapter carries the canon''s own handing-over of the staff. *At that time Yahuah (the Lord) said to Moses, Behold your days are approaching to an end, take now Joshua the son of Nun your servant and place him in the tabernacle, and I will command him, and Moses did so* (Jasher 87:1) — word for word the scene Moses recorded: *And Yahuah (LORD) said unto Moses, Behold, thy days approach that thou must die: call Joshua, and present yourselves in the tabernacle of the congregation, that I may give him a charge. And Moses and Joshua went, and presented themselves in the tabernacle of the congregation* (Deuteronomy 31:14). The glory comes down exactly as written — *And Yahuah (the Lord) appeared in the tabernacle in a pillar of cloud, and the pillar of cloud stood at the entrance of the tabernacle* (Jasher 87:2) beside *And Yahuah (LORD) appeared in the tabernacle in a pillar of a cloud: and the pillar of the cloud stood over the door of the tabernacle* (Deuteronomy 31:15). The charge itself — *Be strong and courageous, for you shall bring the children of Israel to the land which I swore to give them, and I will be with you* (Jasher 87:3) — is the LORD''s own commission of Joshua: *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee* (Joshua 1:7). The succession runs back to Numbers, where the man-in-whom-is-the-spirit is named and laid hands upon, that the congregation be not as sheep without a shepherd. It ain''t new — the covenant seed is led into the inheritance Yahuah swore to the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 57150
  FROM _session252_ja87_lookup sv, _session252_ja87_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=87 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-87-moses-charges-joshua',
       E'Moses to Joshua — he will not leave you nor forsake you',
       E'Now Moses repeats the charge in his own mouth: *And Moses said to Joshua, Be strong and courageous, for you will make the children of Israel inherit the land, and Yahuah (the Lord) will be with you, he will not leave you nor forsake you, be not afraid nor disheartened* (Jasher 87:4). This is Deuteronomy''s farewell word, kept down to the promise of presence — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7), and *And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed* (Deuteronomy 31:8). The same unbroken pledge — *he will not fail thee, nor forsake thee* — is set on Joshua himself by Yahuah: *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5). The New Covenant carries the very promise forward to every heir of the seed: *for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). It ain''t new — the faithfulness that led Israel into the land is the faithfulness held out still.',
       sv.verse_id, ev.verse_id, 'extras', 57153
  FROM _session252_ja87_lookup sv, _session252_ja87_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=87 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-87-torah-stands',
       E'Observe all the words of this law — Torah stands, written by Moses'' hand',
       E'Moses'' last work is to fix the Torah on the nation. *And Moses called to all the children of Israel and said to them, You have seen all the good which Yahuah your Elohim (the Lord your God) has done for you in the wilderness* (Jasher 87:5); *Now therefore observe all the words of this law, and walk in the way of Yahuah your Elohim, turn not from the way which Yahuah (the Lord) has commanded you, either to the right or to the left* (Jasher 87:6). This is Deuteronomy''s own posture — the law is the way of life, neither added to nor taken from: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you* (Deuteronomy 4:2), and the not-turning-aside refrain, *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32). Moses then teaches and writes it: *And Moses taught the children of Israel statutes and judgments and laws to do in the land as Yahuah (the Lord) had commanded him* (Jasher 87:7); *behold they are written upon the book of the law of Elohim (God) which he gave to the children of Israel by the hand of Moses* (Jasher 87:8) — the very book the LORD charges Joshua to keep in his mouth: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night* (Joshua 1:8). It ain''t new, and it does not pass — the Torah given before the land is the Torah that abides.',
       sv.verse_id, ev.verse_id, 'extras', 57156
  FROM _session252_ja87_lookup sv, _session252_ja87_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=87 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-87-death-of-moses',
       E'Up to Mount Abarim — the death of Moses, gathered to his people',
       E'The book of Jasher closes on the death of the servant of Yahuah. *And Moses finished commanding the children of Israel, and Yahuah (the Lord) said to him, saying, Go up to the Mount Abarim and die there, and be gathered to your people as Aaron your brother was gathered* (Jasher 87:9) — the very word of Deuteronomy: *Get thee up into this mountain Abarim, unto mount Nebo, which is in the land of Moab, that is over against Jericho; and behold the land of Canaan, which I give unto the children of Yashar''el (Israel) for a possession* (Deuteronomy 32:49), *And die in the mount whither thou goest up, and be gathered unto thy people; as Aaron thy brother died in mount Hor, and was gathered unto his people* (Deuteronomy 32:50). Then the passing: *And Moses went up as Yahuah (the Lord) had commanded him, and he died there in the land of Moab by the order of Yahuah (the Lord), in the fortieth year from the Israelites going forth from the land of Egypt* (Jasher 87:10) beside *So Moses the servant of Yahuah (LORD) died there in the land of Moab, according to the word of Yahuah (LORD)* (Deuteronomy 34:5). And the nation mourns — *And the children of Israel wept for Moses in the plains of Moab for thirty days, and the days of weeping and mourning for Moses were completed* (Jasher 87:11) — word for word with *And the children of Yashar''el (Israel) wept for Moses in the plains of Moab thirty days: so the days of weeping and mourning for Moses were ended* (Deuteronomy 34:8). It ain''t new — Jasher ends exactly where the Torah ends, the faithful servant gathered to his people, the seed kept and brought to the border of the land.',
       sv.verse_id, ev.verse_id, 'extras', 57159
  FROM _session252_ja87_lookup sv, _session252_ja87_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=87 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-87-joshua-commissioned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:14 — *And Yahuah (LORD) said unto Moses, Behold, thy days approach that thou must die: call Joshua, and present yourselves in the tabernacle of the congregation, that I may give him a charge. And Moses and Joshua went, and presented themselves in the tabernacle of the congregation.* Jasher 87:1 retells the same end-of-days summons of Joshua into the tabernacle verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:15 — *And Yahuah (LORD) appeared in the tabernacle in a pillar of a cloud: and the pillar of the cloud stood over the door of the tabernacle.* Jasher 87:2 carries the identical theophany at the tabernacle door.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 1:6 — *Be strong and of a good courage: for unto this people shalt thou divide for an inheritance the land, which I sware unto their fathers to give them.* Yahuah''s charge in Jasher 87:3 is the LORD''s own commissioning of Joshua to bring Israel into the sworn inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 27:18 — *And Yahuah (LORD) said unto Moses, Take thee Joshua the son of Nun, a man in whom is the spirit, and lay thine hand upon him.* Jasher 87:1-3 follows the Numbers naming of Joshua son of Nun as Moses'' appointed successor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-87-moses-charges-joshua
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* Jasher 87:4 is Moses'' same spoken charge that Joshua will make Israel inherit the land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-moses-charges-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:8 — *And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed.* Jasher 87:4 keeps the very pledge — he will not leave nor forsake — set on Joshua.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-moses-charges-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 1:5 — *There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee.* Yahuah confirms to Joshua the same unfailing presence Moses promised in Jasher 87:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-moses-charges-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 13:5 — *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* The New Covenant carries forward the very I-will-not-forsake-thee promise spoken in Jasher 87:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-moses-charges-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-87-torah-stands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* Jasher 87:6''s command to observe all the words of this law carries the Torah-stands posture — neither added to nor diminished.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-torah-stands'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:32 — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* Jasher 87:6 repeats the very turn-not-to-the-right-or-left refrain of Moses'' charge to keep the way.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-torah-stands'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 6:1 — *Now these are the commandments, the statutes, and the judgments, which Yahuah Elohaychem (the LORD your God) commanded to teach you, that ye might do them in the land whither ye go to possess it.* Jasher 87:7''s teaching of statutes and judgments to do in the land is Moses'' Deuteronomic instruction itself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-torah-stands'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* Jasher 87:8 names the same written book of the law given by Moses'' hand that Joshua is charged to keep.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-torah-stands'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-87-death-of-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:49 — *Get thee up into this mountain Abarim, unto mount Nebo, which is in the land of Moab, that is over against Jericho; and behold the land of Canaan, which I give unto the children of Yashar''el (Israel) for a possession.* Jasher 87:9 carries Yahuah''s same command to go up to Mount Abarim and die there.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-death-of-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:50 — *And die in the mount whither thou goest up, and be gathered unto thy people; as Aaron thy brother died in mount Hor, and was gathered unto his people.* Jasher 87:9 keeps the very gathered-to-your-people-as-Aaron wording.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-death-of-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 34:5 — *So Moses the servant of Yahuah (LORD) died there in the land of Moab, according to the word of Yahuah (LORD).* Jasher 87:10 retells the death of Moses in Moab by the order of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-death-of-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 34:8 — *And the children of Yashar''el (Israel) wept for Moses in the plains of Moab thirty days: so the days of weeping and mourning for Moses were ended.* Jasher 87:11 carries the identical thirty-days mourning that closes the Torah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja87_lookup sv, _session252_ja87_lookup tv
 WHERE t.slug='jasher-87-death-of-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=87 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

