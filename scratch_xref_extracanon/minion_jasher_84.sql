-- ----- fragment: minion_jasher_84.sql (session252 jasher 84) -----
-- Source anchor: jasher/jasher ch84. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja84 (view _session252_ja84_lookup). Sort band base 57075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja84_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-84-korah-swallowed
  ('jasher', 'jasher', 84, 1, 'canon', 'numbers', 16, 1, 'free', E'Numbers 16:1 — *Now Korah, the son of Izhar, the son of Kohath, the son of Levi, and Dathan and Abiram, the sons of Eliab, and On, the son of Peleth, sons of Reuben, took men:* the canon names the same Korah of the line of Levi who, in Jasher 84:1, rose up and quarreled with Moses and Aaron.'),
  ('jasher', 'jasher', 84, 2, 'canon', 'numbers', 16, 32, 'free', E'Numbers 16:32 — *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* the exact judgment Jasher 84:2 retells: the earth opening its mouth to swallow Korah''s men with their houses and all belonging to them.'),
  ('jasher', 'jasher', 84, 2, 'canon', 'numbers', 16, 33, 'free', E'Numbers 16:33 — *They, and all that appertained to them, went down alive into the pit, and the earth closed upon them: and they perished from among the congregation.* completes the swallowing of Jasher 84:2, the earth closing over Korah''s house.'),
  ('jasher', 'jasher', 84, 1, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* the NT names the gainsaying of Core (Korah) of Jasher 84:1 as the pattern of rebellion, binding it to the very Balaam who appears later in this chapter.'),
  -- thread: jasher-84-esau-mount-seir
  ('jasher', 'jasher', 84, 4, 'canon', 'deuteronomy', 2, 5, 'free', E'Deuteronomy 2:5 — *Meddle not with them; for I will not give you of their land, no, not so much as a foot breadth; because I have given mount Seir unto Esau for a possession.* the same command Jasher 84:4 carries: not the sole of a foot of Esau''s land, for Mount Seir is Esau''s inheritance.'),
  ('jasher', 'jasher', 84, 6, 'canon', 'deuteronomy', 2, 6, 'free', E'Deuteronomy 2:6 — *Ye shall buy meat of them for money, that ye may eat; and ye shall also buy water of them for money, that ye may drink.* the exact provision of Jasher 84:6: buy food and water of Esau for money rather than fight them.'),
  ('jasher', 'jasher', 84, 4, 'canon', 'deuteronomy', 2, 4, 'free', E'Deuteronomy 2:4 — *And command thou the people, saying, Ye are to pass through the coast of your brethren the children of Esau, which dwell in Seir; and they shall be afraid of you: take ye good heed unto yourselves therefore:* the canon''s framing of Esau as brethren whose coast Israel passes, matching the brotherly restraint of Jasher 84:4-6.'),
  ('jasher', 'jasher', 84, 4, 'canon', 'joshua', 24, 4, 'free', E'Joshua 24:4 — *And I gave unto Isaac Jacob and Esau: and I gave unto Esau mount Seir, to possess it; but Jacob and his children went down into Egypt.* Joshua''s covenant rehearsal grounds Jasher 84:4 in the election: Esau''s portion is Mount Seir, while Jacob''s seed is the chosen line carried down into Egypt and out.'),
  -- thread: jasher-84-sihon-moab
  ('jasher', 'jasher', 84, 14, 'canon', 'deuteronomy', 2, 30, 'free', E'Deuteronomy 2:30 — *But Sihon king of Heshbon would not let us pass by him: for Yahuah Elohayka (the LORD thy God) hardened his spirit, and made his heart obstinate, that he might deliver him into thy hand, as appeareth this day.* the canon''s hardening of Sihon matches Jasher 84:14, where Yahuah smote the heart of Sihon and sent him to war.'),
  ('jasher', 'jasher', 84, 18, 'canon', 'numbers', 21, 26, 'free', E'Numbers 21:26 — *For Heshbon was the city of Sihon the king of the Amorites, who had fought against the former king of Moab, and taken all his land out of his hand, even unto Arnon.* the same Heshbon Jasher 84:18 says Sihon took from Moab to make his own.'),
  ('jasher', 'jasher', 84, 19, 'canon', 'numbers', 21, 27, 'free', E'Numbers 21:27 — *Wherefore they that speak in proverbs say, Come into Heshbon, let the city of Sihon be built and prepared:* the very proverb Jasher 84:19 places in the mouths of the parable-speakers Beor and Balaam.'),
  ('jasher', 'jasher', 84, 20, 'canon', 'numbers', 21, 29, 'free', E'Numbers 21:29 — *Woe to thee, Moab! thou art undone, O people of Chemosh: he hath given his sons that escaped, and his daughters, into captivity unto Sihon king of the Amorites.* the same lament over Moab and the people of Chemosh that Jasher 84:20 utters as ''Woe to you Moab! you are lost, O people of Kemosh!'''),
  -- thread: jasher-84-balaam-way
  ('jasher', 'jasher', 84, 16, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* the canon''s Balaam of Pethor and Mesopotamia, the same diviner Jasher 84:16 brings from Pethor to curse.'),
  ('jasher', 'jasher', 84, 15, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* the NT names the very greed Jasher 84:15,22 shows: Balaam hired and paid silver and gold to curse a people.'),
  ('jasher', 'jasher', 84, 22, 'canon', 'numbers', 31, 8, 'free', E'Numbers 31:8 — *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword.* the end of the Balaam who took Sihon''s silver and gold in Jasher 84:22 — slain by the sword for his hire.'),
  -- thread: jasher-84-miriam-edom-refusal
  ('jasher', 'jasher', 84, 24, 'canon', 'numbers', 20, 1, 'free', E'Numbers 20:1 — *Then came the children of Yashar''el (Israel), even the whole congregation, into the desert of Zin in the first month: and the people abode in Kadesh; and Miriam died there, and was buried there.* the same first-month arrival at Kadesh and the death and burial of Miriam that Jasher 84:24 records.'),
  ('jasher', 'jasher', 84, 26, 'canon', 'numbers', 20, 18, 'free', E'Numbers 20:18 — *And Edom said unto him, Thou shalt not pass by me, lest I come out against thee with the sword.* Edom''s refusal of passage in Jasher 84:26, the same king going out against Israel.'),
  ('jasher', 'jasher', 84, 27, 'canon', 'numbers', 20, 21, 'free', E'Numbers 20:21 — *Thus Edom refused to give Yashar''el (Israel) passage through his border: wherefore Yashar''el (Israel) turned away from him.* Israel turning away rather than fighting Esau, exactly as Jasher 84:27 says the Israelites removed from them and fought not against them.'),
  -- thread: jasher-84-aaron-mount-hor
  ('jasher', 'jasher', 84, 30, 'canon', 'numbers', 20, 24, 'free', E'Numbers 20:24 — *Aaron shall be gathered unto his people: for he shall not enter into the land which I have given unto the children of Yashar''el (Israel), because ye rebelled against my word at the water of Meribah.* the same word of Yahuah in Jasher 84:30 that Aaron shall die and not come to the land given to Israel.'),
  ('jasher', 'jasher', 84, 31, 'canon', 'numbers', 33, 38, 'free', E'Numbers 33:38 — *And Aaron the priest went up into mount Hor at the commandment of Yahuah (LORD), and died there, in the fortieth year after the children of Yashar''el (Israel) were come out of the land of Egypt, in the first day of the fifth month.* the itinerary fixes the same fortieth year, fifth month, first day that Jasher 84:31 gives for Aaron''s ascent of Mount Hor.'),
  ('jasher', 'jasher', 84, 32, 'canon', 'numbers', 33, 39, 'free', E'Numbers 33:39 — *And Aaron was an hundred and twenty and three years old when he died in mount Hor.* the exact age, one hundred and twenty-three, that Jasher 84:32 records for Aaron at his death on Mount Hor.'),
  ('jasher', 'jasher', 84, 30, 'canon', 'numbers', 20, 28, 'free', E'Numbers 20:28 — *And Moses stripped Aaron of his garments, and put them upon Eleazar his son; and Aaron died there in the top of the mount: and Moses and Eleazar came down from the mount.* the canon adds the passing of the priestly garments to Eleazar at the death Jasher 84:30-32 narrates on Mount Hor.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja84_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja84_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-84-korah-swallowed',
       E'Korah''s rebellion — the earth opens its mouth',
       E'Jasher opens the wilderness account with the great gainsaying: *At that time Korah the son of Jetzer the son of Kehath the son of Levi, took many men of the children of Israel, and they rose up and quarreled with Moses and Aaron and the whole congregation* (Jasher 84:1), and *Yahuah (the Lord) was angry with them, and the earth opened its mouth, and swallowed them up, with their houses and all belonging to them, and all the men belonging to Korah* (Jasher 84:2). It ain''t new — this is Numbers told back to us. Numbers names the same Levite: *Now Korah, the son of Izhar, the son of Kohath, the son of Levi, and Dathan and Abiram... took men* (Numbers 16:1), and the ground answers exactly as Jasher says: *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods* (Numbers 16:32), *they... went down alive into the pit, and the earth closed upon them: and they perished from among the congregation* (Numbers 16:33). The New Testament keeps the same warning, binding Korah''s revolt to Balaam (who comes later in this very chapter): *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 1:11). The rebellion against the appointed mediators is judgment, not a new gospel.',
       sv.verse_id, ev.verse_id, 'extras', 57075
  FROM _session252_ja84_lookup sv, _session252_ja84_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=84 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-84-esau-mount-seir',
       E'Esau spared — Mount Seir given for an inheritance',
       E'Israel is forbidden to war on Esau: *At that time Yahuah (the Lord) said to Moses, Provoke not a war against the children of Esau, for I will not give to you of any thing belonging to them, as much as the sole of the foot could tread upon, for I have given Mount Seir for an inheritance to Esau* (Jasher 84:4), and *you may buy food of them for money and eat it, and you may buy water of them for money and drink it* (Jasher 84:6). This is Deuteronomy almost word for word: *Meddle not with them; for I will not give you of their land, no, not so much as a foot breadth; because I have given mount Seir unto Esau for a possession* (Deuteronomy 2:5), *Ye shall buy meat of them for money, that ye may eat; and ye shall also buy water of them for money, that ye may drink* (Deuteronomy 2:6). The election runs underneath: the seed-line is Jacob''s, yet Esau too has his given portion, as Joshua rehearses the covenant history — *And I gave unto Isaac Jacob and Esau: and I gave unto Esau mount Seir, to possess it; but Jacob and his children went down into Egypt* (Joshua 24:4). The brother-nation is kept; the chosen seed presses on toward its own inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 57078
  FROM _session252_ja84_lookup sv, _session252_ja84_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=84 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-84-sihon-moab',
       E'Sihon smites Moab — the proverb of Heshbon',
       E'Yahuah turns Sihon against Moab: *And in the thirty-sixth year of the children of Israel''s departing from Egypt Yahuah (the Lord) smote the heart of Sihon, king of the Amorites, and he waged war, and went forth to fight against the children of Moab* (Jasher 84:14); Sihon takes Heshbon (Jasher 84:18), and *Therefore the parable speakers Beor and Balaam his son uttered these words, saying, Come to Heshbon, the city of Sihon will be built and established* (Jasher 84:19), *Woe to you Moab! you are lost, O people of Kemosh!* (Jasher 84:20). The canon hardens Sihon''s heart the same way: *But Sihon king of Heshbon would not let us pass by him: for Yahuah Elohayka (the LORD thy God) hardened his spirit, and made his heart obstinate, that he might deliver him into thy hand* (Deuteronomy 2:30). And Numbers preserves the very proverb Jasher attributes to Balaam: *Wherefore they that speak in proverbs say, Come into Heshbon, let the city of Sihon be built and prepared:* (Numbers 21:27), *Woe to thee, Moab! thou art undone, O people of Chemosh: he hath given his sons that escaped, and his daughters, into captivity unto Sihon king of the Amorites* (Numbers 21:29). It ain''t new — Jasher only tells us whose mouth the proverb came from.',
       sv.verse_id, ev.verse_id, 'extras', 57081
  FROM _session252_ja84_lookup sv, _session252_ja84_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=84 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-84-balaam-way',
       E'Balaam the curser-for-hire — the way of Balaam',
       E'Sihon hires the diviners to curse Moab: *And Sihon sent messengers to Beor the son of Janeas, the son of Balaam, counsellor to the king of Egypt, and to Balaam his son, to curse Moab, in order that it might be delivered into the hand of Sihon* (Jasher 84:15), and afterward *Sihon gave numerous presents of silver and gold to Beor and Balaam his son, and he dismissed them, and they went to Mesopotamia to their home and country* (Jasher 84:22). The canon knows this Balaam of Pethor and his hire: *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him... Behold, there is a people come out from Egypt* (Numbers 22:5). The New Testament names his sin precisely as Jasher portrays it — a prophet bought to curse: *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15); and his end is recorded too: *Balaam also the son of Beor they slew with the sword* (Numbers 31:8). The wages of unrighteousness — silver and gold for a curse — is the way that perishes.',
       sv.verse_id, ev.verse_id, 'extras', 57084
  FROM _session252_ja84_lookup sv, _session252_ja84_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=84 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-84-miriam-edom-refusal',
       E'Miriam dies at Kadesh — Edom refuses passage',
       E'The fortieth year arrives with a death and a refusal: *So the whole congregation came to the wilderness of Sin in the first month of the fortieth year from their departure from Egypt, and the children of Israel dwelt there in Kadesh, of the wilderness of Sin, and Miriam died there and she was buried there* (Jasher 84:24). Then Edom shuts the road: *And Edom said to him, You shall not pass through my country, and Edom went forth to meet the children of Israel with a mighty people* (Jasher 84:26). Numbers records the same arrival and the same grave: *Then came the children of Yashar''el (Israel), even the whole congregation, into the desert of Zin in the first month: and the people abode in Kadesh; and Miriam died there, and was buried there* (Numbers 20:1). And Edom''s refusal stands word-near: *And Edom said unto him, Thou shalt not pass by me, lest I come out against thee with the sword* (Numbers 20:18), *Thus Edom refused to give Yashar''el (Israel) passage through his border: wherefore Yashar''el (Israel) turned away from him* (Numbers 20:21). Israel turns aside rather than war on the brother-nation — the restraint commanded back in 84:4 still holding.',
       sv.verse_id, ev.verse_id, 'extras', 57087
  FROM _session252_ja84_lookup sv, _session252_ja84_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=84 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-84-aaron-mount-hor',
       E'Aaron dies on Mount Hor — the priest gathered',
       E'The book of Jasher closes its wilderness account with the death of the high priest: *At that time Yahuah (the Lord) said to Moses, Tell your brother Aaron that he shall die there, for he shall not come to the land which I have given to the children of Israel* (Jasher 84:30); *And Aaron went up, at the command of Yahuah (the Lord), to Mount Hor, in the fortieth year, in the fifth month, in the first day of the month* (Jasher 84:31); *And Aaron was one hundred and twenty-three years old when he died in Mount Hor* (Jasher 84:32). Numbers gives the command and the stripping of the priestly garments: *Aaron shall be gathered unto his people: for he shall not enter into the land which I have given unto the children of Yashar''el (Israel)* (Numbers 20:24), and *Moses stripped Aaron of his garments, and put them upon Eleazar his son; and Aaron died there in the top of the mount* (Numbers 20:28). And the itinerary of Numbers 33 fixes the very year, month, day, and age Jasher gives: *And Aaron the priest went up into mount Hor at the commandment of Yahuah (LORD), and died there, in the fortieth year after the children of Yashar''el (Israel) were come out of the land of Egypt, in the first day of the fifth month* (Numbers 33:38), *And Aaron was an hundred and twenty and three years old when he died in mount Hor* (Numbers 33:39). It ain''t new — Jasher and the Torah agree to the day and the year.',
       sv.verse_id, ev.verse_id, 'extras', 57090
  FROM _session252_ja84_lookup sv, _session252_ja84_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=84 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-84-korah-swallowed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:1 — *Now Korah, the son of Izhar, the son of Kohath, the son of Levi, and Dathan and Abiram, the sons of Eliab, and On, the son of Peleth, sons of Reuben, took men:* the canon names the same Korah of the line of Levi who, in Jasher 84:1, rose up and quarreled with Moses and Aaron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-korah-swallowed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:32 — *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* the exact judgment Jasher 84:2 retells: the earth opening its mouth to swallow Korah''s men with their houses and all belonging to them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-korah-swallowed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:33 — *They, and all that appertained to them, went down alive into the pit, and the earth closed upon them: and they perished from among the congregation.* completes the swallowing of Jasher 84:2, the earth closing over Korah''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-korah-swallowed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* the NT names the gainsaying of Core (Korah) of Jasher 84:1 as the pattern of rebellion, binding it to the very Balaam who appears later in this chapter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-korah-swallowed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-84-esau-mount-seir
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 2:5 — *Meddle not with them; for I will not give you of their land, no, not so much as a foot breadth; because I have given mount Seir unto Esau for a possession.* the same command Jasher 84:4 carries: not the sole of a foot of Esau''s land, for Mount Seir is Esau''s inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-esau-mount-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 2:6 — *Ye shall buy meat of them for money, that ye may eat; and ye shall also buy water of them for money, that ye may drink.* the exact provision of Jasher 84:6: buy food and water of Esau for money rather than fight them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-esau-mount-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 2:4 — *And command thou the people, saying, Ye are to pass through the coast of your brethren the children of Esau, which dwell in Seir; and they shall be afraid of you: take ye good heed unto yourselves therefore:* the canon''s framing of Esau as brethren whose coast Israel passes, matching the brotherly restraint of Jasher 84:4-6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-esau-mount-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:4 — *And I gave unto Isaac Jacob and Esau: and I gave unto Esau mount Seir, to possess it; but Jacob and his children went down into Egypt.* Joshua''s covenant rehearsal grounds Jasher 84:4 in the election: Esau''s portion is Mount Seir, while Jacob''s seed is the chosen line carried down into Egypt and out.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-esau-mount-seir'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-84-sihon-moab
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 2:30 — *But Sihon king of Heshbon would not let us pass by him: for Yahuah Elohayka (the LORD thy God) hardened his spirit, and made his heart obstinate, that he might deliver him into thy hand, as appeareth this day.* the canon''s hardening of Sihon matches Jasher 84:14, where Yahuah smote the heart of Sihon and sent him to war.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-sihon-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:26 — *For Heshbon was the city of Sihon the king of the Amorites, who had fought against the former king of Moab, and taken all his land out of his hand, even unto Arnon.* the same Heshbon Jasher 84:18 says Sihon took from Moab to make his own.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-sihon-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 21:27 — *Wherefore they that speak in proverbs say, Come into Heshbon, let the city of Sihon be built and prepared:* the very proverb Jasher 84:19 places in the mouths of the parable-speakers Beor and Balaam.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-sihon-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 21:29 — *Woe to thee, Moab! thou art undone, O people of Chemosh: he hath given his sons that escaped, and his daughters, into captivity unto Sihon king of the Amorites.* the same lament over Moab and the people of Chemosh that Jasher 84:20 utters as ''Woe to you Moab! you are lost, O people of Kemosh!'''
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-sihon-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-84-balaam-way
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* the canon''s Balaam of Pethor and Mesopotamia, the same diviner Jasher 84:16 brings from Pethor to curse.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-balaam-way'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* the NT names the very greed Jasher 84:15,22 shows: Balaam hired and paid silver and gold to curse a people.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-balaam-way'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 31:8 — *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword.* the end of the Balaam who took Sihon''s silver and gold in Jasher 84:22 — slain by the sword for his hire.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-balaam-way'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-84-miriam-edom-refusal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 20:1 — *Then came the children of Yashar''el (Israel), even the whole congregation, into the desert of Zin in the first month: and the people abode in Kadesh; and Miriam died there, and was buried there.* the same first-month arrival at Kadesh and the death and burial of Miriam that Jasher 84:24 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-miriam-edom-refusal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 20:18 — *And Edom said unto him, Thou shalt not pass by me, lest I come out against thee with the sword.* Edom''s refusal of passage in Jasher 84:26, the same king going out against Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-miriam-edom-refusal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 20:21 — *Thus Edom refused to give Yashar''el (Israel) passage through his border: wherefore Yashar''el (Israel) turned away from him.* Israel turning away rather than fighting Esau, exactly as Jasher 84:27 says the Israelites removed from them and fought not against them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-miriam-edom-refusal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-84-aaron-mount-hor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 20:24 — *Aaron shall be gathered unto his people: for he shall not enter into the land which I have given unto the children of Yashar''el (Israel), because ye rebelled against my word at the water of Meribah.* the same word of Yahuah in Jasher 84:30 that Aaron shall die and not come to the land given to Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-aaron-mount-hor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 33:38 — *And Aaron the priest went up into mount Hor at the commandment of Yahuah (LORD), and died there, in the fortieth year after the children of Yashar''el (Israel) were come out of the land of Egypt, in the first day of the fifth month.* the itinerary fixes the same fortieth year, fifth month, first day that Jasher 84:31 gives for Aaron''s ascent of Mount Hor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-aaron-mount-hor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 33:39 — *And Aaron was an hundred and twenty and three years old when he died in mount Hor.* the exact age, one hundred and twenty-three, that Jasher 84:32 records for Aaron at his death on Mount Hor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-aaron-mount-hor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 20:28 — *And Moses stripped Aaron of his garments, and put them upon Eleazar his son; and Aaron died there in the top of the mount: and Moses and Eleazar came down from the mount.* the canon adds the passing of the priestly garments to Eleazar at the death Jasher 84:30-32 narrates on Mount Hor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja84_lookup sv, _session252_ja84_lookup tv
 WHERE t.slug='jasher-84-aaron-mount-hor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=84 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

