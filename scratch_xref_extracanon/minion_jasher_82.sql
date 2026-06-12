-- ----- fragment: minion_jasher_82.sql (session252 jasher 82) -----
-- Source anchor: jasher/jasher ch82. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja82 (view _session252_ja82_lookup). Sort band base 57025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja82_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-82-jethro-comes-to-sinai
  ('jasher', 'jasher', 82, 1, 'canon', 'exodus', 18, 5, 'free', E'Exodus 18:5 — *And Jethro, Moses'' father in law, came with his sons and his wife unto Moses into the wilderness, where he encamped at the mount of Elohim (God):* the same encampment at Sinai that Jasher 82:1 dates to the third month from Egypt.'),
  ('jasher', 'jasher', 82, 2, 'canon', 'exodus', 18, 1, 'free', E'Exodus 18:1 — *When Jethro, the priest of Midian, Moses'' father in law, heard of all that Elohim (God) had done for Moses, and for Yashar''el (Israel) his people, and that Yahuah (LORD) had brought Yashar''el (Israel) out of Egypt;* Jasher''s Reuel comes for the very reason the canon gives — he heard of the wonders of Yahuah.'),
  ('jasher', 'jasher', 82, 4, 'canon', 'exodus', 18, 7, 'free', E'Exodus 18:7 — *And Moses went out to meet his father in law, and did obeisance, and kissed him; and they asked each other of their welfare; and they came into the tent.* the honored welcome that Jasher 82:4 renders as Moses going forth with great honor and all Israel with him.'),
  ('jasher', 'jasher', 82, 5, 'canon', 'exodus', 18, 11, 'free', E'Exodus 18:11 — *Now I know that Yahuah (LORD) is greater than all gods: for in the thing wherein they dealt proudly he was above them.* the Midianite''s confession that Jasher 82:5 sums as Reuel knowing Yahuah from that day forward.'),
  -- thread: jasher-82-ten-commandments-sinai
  ('jasher', 'jasher', 82, 6, 'canon', 'exodus', 20, 1, 'free', E'Exodus 20:1 — *And Elohim (God) spake all these words, saying,* the very giving of the ten commandments that Jasher 82:6 dates to the sixth day of the third month.'),
  ('jasher', 'jasher', 82, 6, 'canon', 'exodus', 20, 2, 'free', E'Exodus 20:2 — *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage.* the first word of the covenant grounding the law in the deliverance Jasher 82:6 names.'),
  ('jasher', 'jasher', 82, 8, 'canon', 'exodus', 19, 18, 'free', E'Exodus 19:18 — *And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* the descent in fire that Jasher 82:8 calls the glory of Yahuah resting upon Mount Sinai.'),
  ('jasher', 'jasher', 82, 6, 'jubilees', 'jubilees', 1, 1, 'extras', E'Jubilees 1:1 — *...as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law and of the commandment... in the first year of the exodus... in the third month... “Come up to Me on the Mount, and I will give you two tables of stone of the law and of the commandment, which I have written, that you may teach them.”* Jubilees tells the same third-month Sinai giving Jasher 82:6 records.'),
  -- thread: jasher-82-forty-days-tables-of-stone
  ('jasher', 'jasher', 82, 9, 'canon', 'exodus', 24, 18, 'free', E'Exodus 24:18 — *And Moses went into the midst of the cloud, and gat him up into the mount: and Moses was in the mount forty days and forty nights.* the same ascent into the cloud and forty-day stay that Jasher 82:8-9 narrates.'),
  ('jasher', 'jasher', 82, 9, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* the same fast Jasher 82:9 records — no bread, no water, forty days.'),
  ('jasher', 'jasher', 82, 11, 'canon', 'exodus', 31, 18, 'free', E'Exodus 31:18 — *And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* the tables written by the finger of Elohim that Jasher 82:11 hands to Moses at the forty days'' end.'),
  ('jasher', 'jasher', 82, 9, 'jubilees', 'jubilees', 1, 4, 'extras', E'Jubilees 1:4 — *And Moses was on the Mount forty days and forty nights, and Elohim (God) taught him the earlier and the later history of the division of all the days of the law and of the testimony.* the same forty days of instruction Jasher 82:9 gives as statutes and judgments to teach Israel.'),
  -- thread: jasher-82-golden-calf
  ('jasher', 'jasher', 82, 12, 'canon', 'exodus', 32, 1, 'free', E'Exodus 32:1 — *And when the people saw that Moses delayed to come down out of the mount, the people gathered themselves together unto Aaron, and said unto him, Up, make us gods, which shall go before us; for as for this Moses, the man that brought us up out of the land of Egypt, we wot not what is become of him.* the very demand Jasher 82:12-13 puts in the people''s mouths.'),
  ('jasher', 'jasher', 82, 15, 'canon', 'exodus', 32, 7, 'free', E'Exodus 32:7 — *And Yahuah (LORD) said unto Moses, Go, get thee down; for thy people, which thou broughtest out of the land of Egypt, have corrupted themselves:* the word from the mount that Jasher 82:15 gives almost word for word.'),
  ('jasher', 'jasher', 82, 18, 'canon', 'exodus', 32, 19, 'free', E'Exodus 32:19 — *And it came to pass, as soon as he came nigh unto the camp, that he saw the calf, and the dancing: and Moses'' anger waxed hot, and he cast the tables out of his hands, and brake them beneath the mount.* the broken tablets of Jasher 82:18.'),
  ('jasher', 'jasher', 82, 20, 'canon', 'exodus', 32, 28, 'free', E'Exodus 32:28 — *And the children of Levi did according to the word of Moses: and there fell of the people that day about three thousand men.* the three thousand who fell, matching Jasher 82:20.'),
  ('jasher', 'jasher', 82, 14, 'canon', 'acts', 7, 41, 'free', E'Acts 7:41 — *And they made a calf in those days, and offered sacrifice unto the idol, and rejoiced in the works of their own hands.* Stephen names the same molten calf Aaron makes in Jasher 82:14 as the camp''s idolatry.'),
  -- thread: jasher-82-second-tablets-atonement
  ('jasher', 'jasher', 82, 24, 'canon', 'exodus', 34, 1, 'free', E'Exodus 34:1 — *And Yahuah (LORD) said unto Moses, Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest.* the command to hew the second tablets that Jasher 82:24 records.'),
  ('jasher', 'jasher', 82, 26, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* the second forty days Jasher 82:26 gives as Moses remaining yet with Yahuah.'),
  ('jasher', 'jasher', 82, 25, 'canon', '2-corinthians', 3, 3, 'free', E'2 Corinthians 3:3 — *Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart.* the same ten-commandment writing of Jasher 82:25 carried to the heart — it ain''t new.'),
  -- thread: jasher-82-sanctuary-pattern
  ('jasher', 'jasher', 82, 27, 'canon', 'exodus', 25, 8, 'free', E'Exodus 25:8 — *And let them make me a sanctuary; that I may dwell among them.* the command to build the dwelling that Jasher 82:27 gives, that the Name might rest in it.'),
  ('jasher', 'jasher', 82, 27, 'canon', 'exodus', 25, 9, 'free', E'Exodus 25:9 — *According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it.* the likeness of the sanctuary and its vessels that Yahuah shows Moses in Jasher 82:27.'),
  ('jasher', 'jasher', 82, 32, 'canon', 'exodus', 35, 21, 'free', E'Exodus 35:21 — *And they came, every one whose heart stirred him up, and every one whom his spirit made willing, and they brought the LORD''S offering to the work of the tabernacle of the congregation, and for all his service, and for the holy garments.* the freewill offering Jasher 82:32 gives as the people rising up like one man.'),
  ('jasher', 'jasher', 82, 37, 'canon', 'exodus', 39, 43, 'free', E'Exodus 39:43 — *And Moses did look upon all the work, and, behold, they had done it as Yahuah (LORD) had commanded, even so had they done it: and Moses blessed them.* Moses'' blessing of the finished work, word for word with Jasher 82:37.'),
  ('jasher', 'jasher', 82, 27, 'canon', 'hebrews', 8, 5, 'free', E'Hebrews 8:5 — *Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.* reads the very pattern Yahuah shows Moses in Jasher 82:27 as the shadow of the heavenly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja82_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja82_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-82-jethro-comes-to-sinai',
       E'Reuel the Midianite comes to the mount of Elohim',
       E'Jasher opens the Sinai chapter with the father-in-law''s arrival: *And the children of Israel proceeded from Rephidim and they encamped in the wilderness of Sinai, in the third month from their going forth from Egypt.* (Jasher 82:1), and *At that time came Reuel the Midianite, the father-in-law of Moses, with Zipporah his daughter and her two sons, for he had heard of the wonders of Yahuah (the Lord) which he had done to Israel, that he had delivered them from the hand of Egypt.* (Jasher 82:2). This is Exodus 18 told over — the canon names him Jethro and gives the same cause: *When Jethro, the priest of Midian, Moses'' father in law, heard of all that Elohim (God) had done for Moses, and for Yashar''el (Israel) his people, and that Yahuah (LORD) had brought Yashar''el (Israel) out of Egypt;* (Exodus 18:1). Jasher 82:4 (*And Moses went forth to meet his father-in-law with great honor, and all Israel was with him.*) matches *And Moses went out to meet his father in law, and did obeisance, and kissed him; and they asked each other of their welfare; and they came into the tent.* (Exodus 18:7), and the Midianite''s confession in Jasher 82:5 (*Reuel knew Yahuah (the Lord) from that day forward*) echoes the priest''s own word: *Now I know that Yahuah (LORD) is greater than all gods: for in the thing wherein they dealt proudly he was above them.* (Exodus 18:11). The nations come and see — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57025
  FROM _session252_ja82_lookup sv, _session252_ja82_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=82 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-82-ten-commandments-sinai',
       E'The ten commandments on Mount Sinai',
       E'The covenant is given: *And in the third month from the children of Israel''s departure from Egypt, on the sixth day of it, Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai.* (Jasher 82:6), heard by the whole nation — *And all Israel heard all these commandments, and all Israel rejoiced exceedingly in Yahuah (the Lord) on that day.* (Jasher 82:7). The canon stands behind it whole: the descent in fire — *And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* (Exodus 19:18) — and the words themselves: *And Elohim (God) spake all these words, saying,* (Exodus 20:1) / *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage.* (Exodus 20:2). Torah is given to a delivered people, not as a curse but as the covenant they rejoiced in — it ain''t new. Jubilees narrates the same Sinai ascent in the same third month, the same two tables: *as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law... in the third month, on the sixteenth day of the month, that Elohim (God) spake to Moses, saying: “Come up to Me on the Mount, and I will give you two tables of stone of the law and of the commandment, which I have written, that you may teach them.”* (Jubilees 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 57028
  FROM _session252_ja82_lookup sv, _session252_ja82_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=82 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-82-forty-days-tables-of-stone',
       E'Moses forty days on the mount; the tables written by the finger of Elohim',
       E'Moses ascends into the cloud and the glory: *And the glory of Yahuah (the Lord) rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud and ascended the mountain.* (Jasher 82:8); *And Moses was upon the mount forty days and forty nights; he ate no bread and drank no water, and Yahuah (the Lord) instructed him in the statutes and judgments in order to teach the children of Israel.* (Jasher 82:9); and the tables are inscribed — *And at the end of forty days and forty nights, when Yahuah (the Lord) had finished speaking to Moses on Mount Sinai, then Yahuah (the Lord) gave to Moses the tablets of stone, written with the finger of Elohim.* (Jasher 82:11). The canon gives every beat: the calling out of the cloud — *And Moses went into the midst of the cloud, and gat him up into the mount: and Moses was in the mount forty days and forty nights.* (Exodus 24:18) — the fast — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water...* (Exodus 34:28) — and the finger of Elohim: *And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* (Exodus 31:18). Jubilees keeps the same forty days and the cloud of six days: *And Moses was on the Mount forty days and forty nights, and Elohim (God) taught him the earlier and the later history...* (Jubilees 1:4).',
       sv.verse_id, ev.verse_id, 'extras', 57031
  FROM _session252_ja82_lookup sv, _session252_ja82_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=82 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-82-golden-calf',
       E'The golden calf and the broken tablets',
       E'While Moses tarries, the people fall: *And when the children of Israel saw that Moses tarried to come down from the mount, they gathered round Aaron, and said, As for this man Moses we know not what has become of him.* (Jasher 82:12); *Now therefore rise up, make to us a god who shall go before us, so that you shall not die.* (Jasher 82:13); and Aaron yields — *And Aaron was greatly afraid of the people, and he ordered them to bring him gold and he made it into a molten calf for the people.* (Jasher 82:14). This is Exodus 32 verbatim in motion: *And when the people saw that Moses delayed to come down out of the mount, the people gathered themselves together unto Aaron, and said unto him, Up, make us gods, which shall go before us; for as for this Moses, the man that brought us up out of the land of Egypt, we wot not what is become of him.* (Exodus 32:1). Yahuah''s word to Moses (Jasher 82:15-16) matches *And Yahuah (LORD) said unto Moses, Go, get thee down; for thy people, which thou broughtest out of the land of Egypt, have corrupted themselves:* (Exodus 32:7); Moses breaks the tablets and grinds the calf (Jasher 82:18-19) as in *...he saw the calf, and the dancing: and Moses'' anger waxed hot, and he cast the tables out of his hands, and brake them beneath the mount.* (Exodus 32:19); and the three thousand fall — *And there died of the people by the swords of each other about three thousand men who had made the calf.* (Jasher 82:20) / *And the children of Levi did according to the word of Moses: and there fell of the people that day about three thousand men.* (Exodus 32:28). Stephen names the same sin in the assembly''s own history: *And they made a calf in those days, and offered sacrifice unto the idol, and rejoiced in the works of their own hands.* (Acts 7:41) — the host-of-heaven idolatry of the kingdom of man breaking into the camp; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57034
  FROM _session252_ja82_lookup sv, _session252_ja82_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=82 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-82-second-tablets-atonement',
       E'Moses intercedes; the second tablets hewn and written',
       E'Moses returns to make atonement: *And on the morrow Moses said to the people, I will go up to Yahuah (the Lord), peradventure I may make atonement for your sins which you have sinned to Yahuah (the Lord).* (Jasher 82:21), and the second tables are commanded — *Then spoke Yahuah (the Lord) to Moses to hew two stone tablets and to bring them up to Yahuah (the Lord), who would write upon them the ten commandments.* (Jasher 82:24) — hewn and inscribed: *Now Moses did so, and he came down and hewed the two tablets and went up to Mount Sinai to Yahuah (the Lord), and Yahuah (the Lord) wrote the ten commandments upon the tablets.* (Jasher 82:25). The canon gives the same command and the same forty-day re-ascent: *And Yahuah (LORD) said unto Moses, Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest.* (Exodus 34:1) / *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* (Exodus 34:28). The covenant is restored, not replaced — the law endures; and the NT carries the figure forward, the writing now on living tablets: *...written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart.* (2 Corinthians 3:3).',
       sv.verse_id, ev.verse_id, 'extras', 57037
  FROM _session252_ja82_lookup sv, _session252_ja82_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=82 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-82-sanctuary-pattern',
       E'The sanctuary made after the pattern shown on the mount',
       E'The chapter closes building the dwelling: *And Yahuah (the Lord) commanded him respecting the children of Israel that they should make a sanctuary for Yahuah (the Lord), that his name might rest in it, and Yahuah (the Lord) showed him the likeness of the sanctuary and the likeness of all its vessels.* (Jasher 82:27); the people offer freely — *And the people rose up like one man and they made generous offerings to the sanctuary of Yahuah (the Lord), and each man brought the offering of Yahuah (the Lord) for the work of the sanctuary, and for all its service.* (Jasher 82:32) — and Moses blesses the finished work: *And Moses saw the work, and behold they did it as Yahuah (the Lord) had commanded him, so Moses blessed them.* (Jasher 82:37). The canon gives the command and the pattern: *And let them make me a sanctuary; that I may dwell among them.* (Exodus 25:8) / *According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it.* (Exodus 25:9); the willing-hearted offering — *And they came, every one whose heart stirred him up, and every one whom his spirit made willing, and they brought the LORD''S offering to the work of the tabernacle of the congregation, and for all his service, and for the holy garments.* (Exodus 35:21); and Moses'' blessing of the work: *And Moses did look upon all the work, and, behold, they had done it as Yahuah (LORD) had commanded, even so had they done it: and Moses blessed them.* (Exodus 39:43). The pattern is a shadow of the heavenly, as Hebrews reads it: *...as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.* (Hebrews 8:5).',
       sv.verse_id, ev.verse_id, 'extras', 57040
  FROM _session252_ja82_lookup sv, _session252_ja82_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=82 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-82-jethro-comes-to-sinai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 18:5 — *And Jethro, Moses'' father in law, came with his sons and his wife unto Moses into the wilderness, where he encamped at the mount of Elohim (God):* the same encampment at Sinai that Jasher 82:1 dates to the third month from Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-jethro-comes-to-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 18:1 — *When Jethro, the priest of Midian, Moses'' father in law, heard of all that Elohim (God) had done for Moses, and for Yashar''el (Israel) his people, and that Yahuah (LORD) had brought Yashar''el (Israel) out of Egypt;* Jasher''s Reuel comes for the very reason the canon gives — he heard of the wonders of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-jethro-comes-to-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 18:7 — *And Moses went out to meet his father in law, and did obeisance, and kissed him; and they asked each other of their welfare; and they came into the tent.* the honored welcome that Jasher 82:4 renders as Moses going forth with great honor and all Israel with him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-jethro-comes-to-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 18:11 — *Now I know that Yahuah (LORD) is greater than all gods: for in the thing wherein they dealt proudly he was above them.* the Midianite''s confession that Jasher 82:5 sums as Reuel knowing Yahuah from that day forward.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-jethro-comes-to-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-82-ten-commandments-sinai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:1 — *And Elohim (God) spake all these words, saying,* the very giving of the ten commandments that Jasher 82:6 dates to the sixth day of the third month.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-ten-commandments-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:2 — *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage.* the first word of the covenant grounding the law in the deliverance Jasher 82:6 names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-ten-commandments-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 19:18 — *And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* the descent in fire that Jasher 82:8 calls the glory of Yahuah resting upon Mount Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-ten-commandments-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:1 — *...as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law and of the commandment... in the first year of the exodus... in the third month... “Come up to Me on the Mount, and I will give you two tables of stone of the law and of the commandment, which I have written, that you may teach them.”* Jubilees tells the same third-month Sinai giving Jasher 82:6 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-ten-commandments-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-82-forty-days-tables-of-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:18 — *And Moses went into the midst of the cloud, and gat him up into the mount: and Moses was in the mount forty days and forty nights.* the same ascent into the cloud and forty-day stay that Jasher 82:8-9 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-forty-days-tables-of-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* the same fast Jasher 82:9 records — no bread, no water, forty days.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-forty-days-tables-of-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 31:18 — *And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* the tables written by the finger of Elohim that Jasher 82:11 hands to Moses at the forty days'' end.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-forty-days-tables-of-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:4 — *And Moses was on the Mount forty days and forty nights, and Elohim (God) taught him the earlier and the later history of the division of all the days of the law and of the testimony.* the same forty days of instruction Jasher 82:9 gives as statutes and judgments to teach Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-forty-days-tables-of-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-82-golden-calf
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:1 — *And when the people saw that Moses delayed to come down out of the mount, the people gathered themselves together unto Aaron, and said unto him, Up, make us gods, which shall go before us; for as for this Moses, the man that brought us up out of the land of Egypt, we wot not what is become of him.* the very demand Jasher 82:12-13 puts in the people''s mouths.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-golden-calf'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 32:7 — *And Yahuah (LORD) said unto Moses, Go, get thee down; for thy people, which thou broughtest out of the land of Egypt, have corrupted themselves:* the word from the mount that Jasher 82:15 gives almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-golden-calf'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 32:19 — *And it came to pass, as soon as he came nigh unto the camp, that he saw the calf, and the dancing: and Moses'' anger waxed hot, and he cast the tables out of his hands, and brake them beneath the mount.* the broken tablets of Jasher 82:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-golden-calf'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 32:28 — *And the children of Levi did according to the word of Moses: and there fell of the people that day about three thousand men.* the three thousand who fell, matching Jasher 82:20.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-golden-calf'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 7:41 — *And they made a calf in those days, and offered sacrifice unto the idol, and rejoiced in the works of their own hands.* Stephen names the same molten calf Aaron makes in Jasher 82:14 as the camp''s idolatry.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-golden-calf'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-82-second-tablets-atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:1 — *And Yahuah (LORD) said unto Moses, Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest.* the command to hew the second tablets that Jasher 82:24 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-second-tablets-atonement'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* the second forty days Jasher 82:26 gives as Moses remaining yet with Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-second-tablets-atonement'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 3:3 — *Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart.* the same ten-commandment writing of Jasher 82:25 carried to the heart — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-second-tablets-atonement'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-82-sanctuary-pattern
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:8 — *And let them make me a sanctuary; that I may dwell among them.* the command to build the dwelling that Jasher 82:27 gives, that the Name might rest in it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-sanctuary-pattern'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 25:9 — *According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it.* the likeness of the sanctuary and its vessels that Yahuah shows Moses in Jasher 82:27.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-sanctuary-pattern'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 35:21 — *And they came, every one whose heart stirred him up, and every one whom his spirit made willing, and they brought the LORD''S offering to the work of the tabernacle of the congregation, and for all his service, and for the holy garments.* the freewill offering Jasher 82:32 gives as the people rising up like one man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-sanctuary-pattern'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=35 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 39:43 — *And Moses did look upon all the work, and, behold, they had done it as Yahuah (LORD) had commanded, even so had they done it: and Moses blessed them.* Moses'' blessing of the finished work, word for word with Jasher 82:37.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-sanctuary-pattern'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=39 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 8:5 — *Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.* reads the very pattern Yahuah shows Moses in Jasher 82:27 as the shadow of the heavenly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja82_lookup sv, _session252_ja82_lookup tv
 WHERE t.slug='jasher-82-sanctuary-pattern'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=82 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

