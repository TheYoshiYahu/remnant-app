-- ----- fragment: minion_jasher_83.sql (session252 jasher 83) -----
-- Source anchor: jasher/jasher ch83. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja83 (view _session252_ja83_lookup). Sort band base 57050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja83_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-83-tabernacle-reared-eighth-day
  ('jasher', 'jasher', 83, 4, 'canon', 'exodus', 40, 17, 'free', E'Exodus 40:17 — *And it came to pass in the first month in the second year, on the first day of the month, that the tabernacle was reared up.* Jasher 83:4 dates the rearing of the sanctuary to that very first day of the first month in the second year.'),
  ('jasher', 'jasher', 83, 1, 'canon', 'exodus', 40, 16, 'free', E'Exodus 40:16 — *Thus did Moses: according to all that Yahuah (LORD) commanded him, so did he.* Jasher 83:1 says Moses anointed Aaron and his sons and did to them as Yahuah had commanded — the same exact obedience Exodus records.'),
  ('jasher', 'jasher', 83, 5, 'canon', 'leviticus', 9, 24, 'free', E'Leviticus 9:24 — *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces.* When Aaron and his sons brought the burnt and sin offerings in Jasher 83:5, this is the fire that fell to seal the dedication.'),
  -- thread: jasher-83-nadab-abihu-strange-fire
  ('jasher', 'jasher', 83, 6, 'canon', 'leviticus', 10, 1, 'free', E'Leviticus 10:1 — *And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not.* Jasher 83:6 retells the same strange fire the two sons brought that Yahuah had not commanded.'),
  ('jasher', 'jasher', 83, 6, 'canon', 'leviticus', 10, 2, 'free', E'Leviticus 10:2 — *And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD).* Jasher 83:6''s fire going forth and consuming Nadab and Abihu is this judgment exactly.'),
  -- thread: jasher-83-princes-dedication-passover
  ('jasher', 'jasher', 83, 7, 'canon', 'numbers', 7, 11, 'free', E'Numbers 7:11 — *And Yahuah (LORD) said unto Moses, They shall offer their offering, each prince on his day, for the dedicating of the altar.* Jasher 83:7-8''s prince-a-day dedication of the altar over twelve days is this very ordinance.'),
  ('jasher', 'jasher', 83, 8, 'canon', 'numbers', 7, 12, 'free', E'Numbers 7:12 — *And he that offered his offering the first day was Nahshon the son of Amminadab, of the tribe of Yahudah (Judah):* the twelve-tribe dedication Jasher 83:8 numbers begins with the prince of Judah, the chosen seed-line leading.'),
  ('jasher', 'jasher', 83, 16, 'canon', 'exodus', 12, 6, 'free', E'Exodus 12:6 — *And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening.* Jasher 83:16 keeps the Passover in its season on the fourteenth, exactly as commanded.'),
  -- thread: jasher-83-numbering-wilderness-sinai
  ('jasher', 'jasher', 83, 17, 'canon', 'numbers', 1, 1, 'free', E'Numbers 1:1 — *And Yahuah (LORD) spake unto Moses in the wilderness of Sinai, in the tabernacle of the congregation, on the first day of the second month, in the second year after they were come out of the land of Egypt, saying,* Jasher 83:17 dates the command to number to that same first day of the second month.'),
  ('jasher', 'jasher', 83, 18, 'canon', 'numbers', 1, 3, 'free', E'Numbers 1:3 — *From twenty years old and upward, all that are able to go forth to war in Yashar''el (Israel): thou and Aaron shall number them by their armies.* Jasher 83:18 numbers the males from twenty years old and upward, Moses and Aaron and the twelve princes — the muster for war.'),
  ('jasher', 'jasher', 83, 20, 'canon', 'numbers', 1, 46, 'free', E'Numbers 1:46 — *Even all they that were numbered were six hundred thousand and three thousand and five hundred and fifty.* Jasher 83:20 reports the identical total, six hundred and three thousand, five hundred and fifty.'),
  -- thread: jasher-83-cloud-quail-kibroth
  ('jasher', 'jasher', 83, 25, 'canon', 'numbers', 10, 11, 'free', E'Numbers 10:11 — *And it came to pass on the twentieth day of the second month, in the second year, that the cloud was taken up from off the tabernacle of the testimony.* Jasher 83:25 sets the cloud''s lifting on the twentieth day of the month, the same departure-signal.'),
  ('jasher', 'jasher', 83, 26, 'canon', 'numbers', 11, 4, 'free', E'Numbers 11:4 — *And the mixt multitude that was among them fell a lusting: and the children of Yashar''el (Israel) also wept again, and said, Who shall give us flesh to eat?* Jasher 83:26 has the people provoke Yahuah by asking for meat to eat — the same craving.'),
  ('jasher', 'jasher', 83, 28, 'canon', 'numbers', 11, 33, 'free', E'Numbers 11:33 — *And while the flesh was yet between their teeth, ere it was chewed, the wrath of Yahuah (LORD) was kindled against the people, and Yahuah (LORD) smote the people with a very great plague.* Jasher 83:28''s great slaughter after the meat is this very plague.'),
  ('jasher', 'jasher', 83, 29, 'canon', 'numbers', 11, 34, 'free', E'Numbers 11:34 — *And he called the name of that place Kibroth-hattaavah: because there they buried the people that lusted.* Jasher 83:29 names the place Kebroth Hattaavah for the same cause — there they buried the people that lusted flesh.'),
  ('jasher', 'jasher', 83, 28, 'canon', 'psalms', 78, 31, 'free', E'Psalms 78:31 — *The wrath of Elohim (God) came upon them, and slew the fattest of them, and smote down the chosen men of Yashar''el (Israel).* The psalmist remembers the same slaughter for the lust that Jasher 83:28 narrates.'),
  -- thread: jasher-83-miriam-leprous
  ('jasher', 'jasher', 83, 31, 'canon', 'numbers', 12, 10, 'free', E'Numbers 12:10 — *And the cloud departed from off the tabernacle; and, behold, Miriam became leprous, white as snow: and Aaron looked upon Miriam, and, behold, she was leprous.* Jasher 83:31''s Miriam made leprous, white as snow, on account of Moses is this very judgment.'),
  -- thread: jasher-83-spies-forty-years
  ('jasher', 'jasher', 83, 34, 'canon', 'numbers', 13, 2, 'free', E'Numbers 13:2 — *Send thou men, that they may search the land of Canaan, which I give unto the children of Yashar''el (Israel): of every tribe of their fathers shall ye send a man, every one a ruler among them.* Jasher 83:34''s command to send twelve men, one to a tribe, to explore Canaan is this very charge.'),
  ('jasher', 'jasher', 83, 36, 'canon', 'numbers', 13, 32, 'free', E'Numbers 13:32 — *And they brought up an evil report of the land which they had searched unto the children of Yashar''el (Israel), saying, The land, through which we have gone to search it, is a land that eateth up the inhabitants thereof; and all the people that we saw in it are men of a great stature.* Jasher 83:36''s ten men and their evil report of a land that consumes its inhabitants is the same.'),
  ('jasher', 'jasher', 83, 38, 'canon', 'numbers', 14, 8, 'free', E'Numbers 14:8 — *If Yahuah (LORD) delight in us, then he will bring us into this land, and give it us; a land which floweth with milk and honey.* Joshua and Caleb''s plea in Jasher 83:38 is word for word the faithful witness Numbers records.'),
  ('jasher', 'jasher', 83, 41, 'canon', 'numbers', 14, 30, 'free', E'Numbers 14:30 — *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein, save Caleb the son of Jephunneh, and Joshua the son of Nun.* Jasher 83:41 swears that none of the wicked generation shall see the land excepting Caleb and Joshua — the same oath.'),
  ('jasher', 'jasher', 83, 42, 'canon', 'numbers', 14, 33, 'free', E'Numbers 14:33 — *And your children shall wander in the wilderness forty years, and bear your whoredoms, until your carcases be wasted in the wilderness.* Jasher 83:42''s forty years of wandering until that wicked generation perishes is this sentence.'),
  ('jasher', 'jasher', 83, 42, 'canon', 'hebrews', 3, 17, 'free', E'Hebrews 3:17 — *But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* The NT reads the forty-year sentence of Jasher 83:42 as the warning to the gathered seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja83_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja83_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-tabernacle-reared-eighth-day',
       E'The sanctuary reared, the priests consecrated, the eighth day',
       E'Jasher closes the book at the foot of Sinai with the priesthood installed: *And in the twelfth month, in the twenty-third day of the month, Moses took Aaron and his sons, and he dressed them in their garments, and anointed them and did to them as Yahuah (the Lord) had commanded him, and Moses brought up all the offerings which Yahuah (the Lord) had on that day commanded him* (Jasher 83:1), and after the seven-day consecration, *And on the eighth day, being the first day of the first month, in the second year from the Israelites’ departure from Egypt, Moses erected the sanctuary, and Moses put up all the furniture of the tabernacle and all the furniture of the sanctuary, and he did all that Yahuah (the Lord) had commanded him* (Jasher 83:4). It ain''t new — this is Exodus 40 to the letter: *And it came to pass in the first month in the second year, on the first day of the month, that the tabernacle was reared up* (Exodus 40:17), Moses doing *according to all that Yahuah (LORD) commanded him* (Exodus 40:16). And when the offerings were complete the glory broke out as in Leviticus 9 — *And Moses and Aaron went into the tabernacle of the congregation, and came out, and blessed the people: and the glory of Yahuah (LORD) appeared unto all the people* (Leviticus 9:23) — *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces* (Leviticus 9:24). The fathers kept the ordained way; the worship was given, not invented.',
       sv.verse_id, ev.verse_id, 'extras', 57050
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-nadab-abihu-strange-fire',
       E'Nadab and Abihu and the strange fire',
       E'On the very day of glory the judgment falls: *On that day the two sons of Aaron, Nadab and Abihu, took strange fire and brought it before Yahuah (the Lord) who had not commanded them, and a fire went forth from before Yahuah (the Lord), and consumed them, and they died before Yahuah (the Lord) on that day* (Jasher 83:6). Word for word it is Leviticus 10 — *And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1), and *And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD)* (Leviticus 10:2). The same fire that consumed the offering in acceptance consumes the will-worship that Yahuah did not command. Torah stands: the way of worship is given, not improvised.',
       sv.verse_id, ev.verse_id, 'extras', 57053
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-princes-dedication-passover',
       E'The princes'' offerings and the second Passover',
       E'The twelve tribes dedicate the altar prince by prince: *Then on the day when Moses had completed to erect the sanctuary, the princes of the children of Israel began to bring their offerings before Yahuah (the Lord) for the dedication of the altar* (Jasher 83:7), *a prince each day for twelve days* (Jasher 83:8). This is the twelve-tribe covenant people, each house bringing its inheritance-gift — Numbers 7: *And Yahuah (LORD) said unto Moses, They shall offer their offering, each prince on his day, for the dedicating of the altar* (Numbers 7:11), beginning with Judah''s prince (Numbers 7:12). Then the feast is kept in its season: *And it was after this, in the thirteenth day of the month, that Moses commanded the children of Israel to observe the Passover* (Jasher 83:15), *as Yahuah (the Lord) had commanded Moses* (Jasher 83:16) — the appointed time the fathers kept, *And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6). It ain''t new — the feast stands; the seed keeps the way.',
       sv.verse_id, ev.verse_id, 'extras', 57056
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-numbering-wilderness-sinai',
       E'The numbering of the tribes in the wilderness of Sinai',
       E'Yahuah commands the census of the host: *And in the second month, on the first day of it, Yahuah (the Lord) spoke to Moses, saying, Number the heads of all the males of the children of Israel from twenty years old and upward* (Jasher 83:17-18), and the total was *six hundred and three thousand, five hundred and fifty* (Jasher 83:20), *But the children of Levi were not numbered amongst their brethren the children of Israel* (Jasher 83:21). This is the opening of the book of Numbers — *And Yahuah (LORD) spake unto Moses in the wilderness of Sinai... on the first day of the second month, in the second year after they were come out of the land of Egypt* (Numbers 1:1), the muster *From twenty years old and upward, all that are able to go forth to war* (Numbers 1:3), the very tally *Even all they that were numbered were six hundred thousand and three thousand and five hundred and fifty* (Numbers 1:46). The twelve-tribe army of Yahuah, counted by the houses of their fathers — the covenant nation forming.',
       sv.verse_id, ev.verse_id, 'extras', 57059
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-cloud-quail-kibroth',
       E'The cloud lifts; the lusting and the graves of craving',
       E'The journey begins when the cloud rises: *And on the twentieth day of the month, the cloud was taken away from the tabernacle of testimony* (Jasher 83:25), and the host moves *and the cloud rested upon the wilderness of Paran* (Jasher 83:26) — Numbers 10: *And it came to pass on the twentieth day of the second month, in the second year, that the cloud was taken up from off the tabernacle of the testimony* (Numbers 10:11), *and the cloud rested in the wilderness of Paran* (Numbers 10:12). But the people lust for flesh, and the anger of Yahuah is kindled — Jasher 83:26-29 — exactly as Numbers records: *And the mixt multitude that was among them fell a lusting: and the children of Yashar''el (Israel) also wept again, and said, Who shall give us flesh to eat?* (Numbers 11:4), and *while the flesh was yet between their teeth... Yahuah (LORD) smote the people with a very great plague* (Numbers 11:33), so *he called the name of that place Kibroth-hattaavah: because there they buried the people that lusted* (Numbers 11:34). Jasher 83:29 names it Kebroth Hattaavah for the same reason. The Spirit later marks it as the warning: *Now these things were our examples, to the intent we should not lust after evil things, as they also lusted* (1 Corinthians 10:6).',
       sv.verse_id, ev.verse_id, 'extras', 57062
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-miriam-leprous',
       E'Miriam struck leprous at Hazeroth',
       E'At Hazeroth the judgment touches Moses'' own house: *And whilst the children of Israel were in Hazeroth, the anger of Yahuah (the Lord) was kindled against Miriam on account of Moses, and she became leprous, white as snow* (Jasher 83:31), *And she was confined without the camp for seven days, until she had been received again after her leprosy* (Jasher 83:32). It is Numbers 12 unchanged: *And the cloud departed from off the tabernacle; and, behold, Miriam became leprous, white as snow: and Aaron looked upon Miriam, and, behold, she was leprous* (Numbers 12:10). The same scene, the same seven days outside the camp — Jasher carries the canon''s account.',
       sv.verse_id, ev.verse_id, 'extras', 57065
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=31
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-83-spies-forty-years',
       E'The twelve spies, the evil report, and the forty years',
       E'The book ends with the spies and the sentence of the wilderness: *Yahuah (the Lord) spoke to Moses to send twelve men from the children of Israel, one man to a tribe, to go and explore the land of Canaan* (Jasher 83:34) — Numbers 13: *Send thou men, that they may search the land of Canaan... of every tribe of their fathers shall ye send a man* (Numbers 13:2). Ten bring the evil report, *a land that consumes its inhabitants* (Jasher 83:36) — *a land that eateth up the inhabitants thereof* (Numbers 13:32) — but Joshua and Caleb hold fast: *The land is exceedingly good. If Yahuah (the Lord) delight in us, then he will bring us to this land and give it to us, for it is a land flowing with milk and honey* (Jasher 83:37-38), the very words of Numbers 14:7-8: *If Yahuah (LORD) delight in us, then he will bring us into this land, and give it us; a land which floweth with milk and honey* (Numbers 14:8). So the oath falls — Jasher 83:41-42 — *Doubtless ye shall not come into the land... save Caleb the son of Jephunneh, and Joshua the son of Nun* (Numbers 14:30), *And your children shall wander in the wilderness forty years* (Numbers 14:33). The election holds: the seed is kept even under judgment, the children inherit. The Spirit reads it the same: *But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17). And Jasher''s last line turns them back toward the sea — *they afterward proceeded to the wilderness by the way of the Red Sea* (Jasher 83:43).',
       sv.verse_id, ev.verse_id, 'extras', 57068
  FROM _session252_ja83_lookup sv, _session252_ja83_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=34
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=83 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-83-tabernacle-reared-eighth-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 40:17 — *And it came to pass in the first month in the second year, on the first day of the month, that the tabernacle was reared up.* Jasher 83:4 dates the rearing of the sanctuary to that very first day of the first month in the second year.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-tabernacle-reared-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 40:16 — *Thus did Moses: according to all that Yahuah (LORD) commanded him, so did he.* Jasher 83:1 says Moses anointed Aaron and his sons and did to them as Yahuah had commanded — the same exact obedience Exodus records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-tabernacle-reared-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 9:24 — *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces.* When Aaron and his sons brought the burnt and sin offerings in Jasher 83:5, this is the fire that fell to seal the dedication.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-tabernacle-reared-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-83-nadab-abihu-strange-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 10:1 — *And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not.* Jasher 83:6 retells the same strange fire the two sons brought that Yahuah had not commanded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-nadab-abihu-strange-fire'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 10:2 — *And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD).* Jasher 83:6''s fire going forth and consuming Nadab and Abihu is this judgment exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-nadab-abihu-strange-fire'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-83-princes-dedication-passover
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 7:11 — *And Yahuah (LORD) said unto Moses, They shall offer their offering, each prince on his day, for the dedicating of the altar.* Jasher 83:7-8''s prince-a-day dedication of the altar over twelve days is this very ordinance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-princes-dedication-passover'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 7:12 — *And he that offered his offering the first day was Nahshon the son of Amminadab, of the tribe of Yahudah (Judah):* the twelve-tribe dedication Jasher 83:8 numbers begins with the prince of Judah, the chosen seed-line leading.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-princes-dedication-passover'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:6 — *And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening.* Jasher 83:16 keeps the Passover in its season on the fourteenth, exactly as commanded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-princes-dedication-passover'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-83-numbering-wilderness-sinai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 1:1 — *And Yahuah (LORD) spake unto Moses in the wilderness of Sinai, in the tabernacle of the congregation, on the first day of the second month, in the second year after they were come out of the land of Egypt, saying,* Jasher 83:17 dates the command to number to that same first day of the second month.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-numbering-wilderness-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 1:3 — *From twenty years old and upward, all that are able to go forth to war in Yashar''el (Israel): thou and Aaron shall number them by their armies.* Jasher 83:18 numbers the males from twenty years old and upward, Moses and Aaron and the twelve princes — the muster for war.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-numbering-wilderness-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 1:46 — *Even all they that were numbered were six hundred thousand and three thousand and five hundred and fifty.* Jasher 83:20 reports the identical total, six hundred and three thousand, five hundred and fifty.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-numbering-wilderness-sinai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-83-cloud-quail-kibroth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 10:11 — *And it came to pass on the twentieth day of the second month, in the second year, that the cloud was taken up from off the tabernacle of the testimony.* Jasher 83:25 sets the cloud''s lifting on the twentieth day of the month, the same departure-signal.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-cloud-quail-kibroth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:4 — *And the mixt multitude that was among them fell a lusting: and the children of Yashar''el (Israel) also wept again, and said, Who shall give us flesh to eat?* Jasher 83:26 has the people provoke Yahuah by asking for meat to eat — the same craving.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-cloud-quail-kibroth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 11:33 — *And while the flesh was yet between their teeth, ere it was chewed, the wrath of Yahuah (LORD) was kindled against the people, and Yahuah (LORD) smote the people with a very great plague.* Jasher 83:28''s great slaughter after the meat is this very plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-cloud-quail-kibroth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 11:34 — *And he called the name of that place Kibroth-hattaavah: because there they buried the people that lusted.* Jasher 83:29 names the place Kebroth Hattaavah for the same cause — there they buried the people that lusted flesh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-cloud-quail-kibroth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 78:31 — *The wrath of Elohim (God) came upon them, and slew the fattest of them, and smote down the chosen men of Yashar''el (Israel).* The psalmist remembers the same slaughter for the lust that Jasher 83:28 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-cloud-quail-kibroth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-83-miriam-leprous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 12:10 — *And the cloud departed from off the tabernacle; and, behold, Miriam became leprous, white as snow: and Aaron looked upon Miriam, and, behold, she was leprous.* Jasher 83:31''s Miriam made leprous, white as snow, on account of Moses is this very judgment.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-miriam-leprous'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-83-spies-forty-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 13:2 — *Send thou men, that they may search the land of Canaan, which I give unto the children of Yashar''el (Israel): of every tribe of their fathers shall ye send a man, every one a ruler among them.* Jasher 83:34''s command to send twelve men, one to a tribe, to explore Canaan is this very charge.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-spies-forty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 13:32 — *And they brought up an evil report of the land which they had searched unto the children of Yashar''el (Israel), saying, The land, through which we have gone to search it, is a land that eateth up the inhabitants thereof; and all the people that we saw in it are men of a great stature.* Jasher 83:36''s ten men and their evil report of a land that consumes its inhabitants is the same.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-spies-forty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 14:8 — *If Yahuah (LORD) delight in us, then he will bring us into this land, and give it us; a land which floweth with milk and honey.* Joshua and Caleb''s plea in Jasher 83:38 is word for word the faithful witness Numbers records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-spies-forty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 14:30 — *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein, save Caleb the son of Jephunneh, and Joshua the son of Nun.* Jasher 83:41 swears that none of the wicked generation shall see the land excepting Caleb and Joshua — the same oath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-spies-forty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 14:33 — *And your children shall wander in the wilderness forty years, and bear your whoredoms, until your carcases be wasted in the wilderness.* Jasher 83:42''s forty years of wandering until that wicked generation perishes is this sentence.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-spies-forty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hebrews 3:17 — *But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* The NT reads the forty-year sentence of Jasher 83:42 as the warning to the gathered seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja83_lookup sv, _session252_ja83_lookup tv
 WHERE t.slug='jasher-83-spies-forty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=83 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

