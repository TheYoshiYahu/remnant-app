-- ----- fragment: minion_jasher_88.sql (session252 jasher 88) -----
-- Source anchor: jasher/jasher ch88. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja88 (view _session252_ja88_lookup). Sort band base 57175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja88_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-88-joshua-commissioned
  ('jasher', 'jasher', 88, 1, 'canon', 'joshua', 1, 1, 'free', E'Joshua 1:1 — *Now after the death of Moses the servant of Yahuah (LORD) it came to pass, that Yahuah (LORD) spake unto Joshua the son of Nun, Moses’ minister, saying,* The canon''s Joshua opens on the very line Jasher 88:1 carries — after Moses'' death, Yahuah speaks to Joshua son of Nun.'),
  ('jasher', 'jasher', 88, 2, 'canon', 'joshua', 1, 2, 'free', E'Joshua 1:2 — *Moses my servant is dead; now therefore arise, go over this Jordan, thou, and all this people, unto the land which I do give to them, even to the children of Yashar''el (Israel).* The command to rise and pass the Jordan to inherit the land in Jasher 88:2 is Joshua 1:2 verbatim in substance.'),
  ('jasher', 'jasher', 88, 3, 'canon', 'deuteronomy', 11, 24, 'free', E'Deuteronomy 11:24 — *Every place whereon the soles of your feet shall tread shall be yours: from the wilderness and Lebanon, from the river, the river Euphrates, even unto the uttermost sea shall your coast be.* The sole-of-the-foot boundary to Lebanon and the river of Perath in Jasher 88:3 is the inheritance-word Moses already gave.'),
  ('jasher', 'jasher', 88, 3, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The land Joshua now enters in Jasher 88:3 is the very ground covenanted to Abraham''s seed generations earlier — kept promise, not new.'),
  ('jasher', 'jasher', 88, 4, 'canon', 'joshua', 1, 7, 'free', E'Joshua 1:7 — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest.* Jasher 88:4''s charge to keep all the law and turn neither right nor left holds the Torah standing under Joshua — it ain''t new.'),
  -- thread: jasher-88-jordan-passover-manna
  ('jasher', 'jasher', 88, 9, 'canon', 'joshua', 3, 1, 'free', E'Joshua 3:1 — *And Joshua rose early in the morning; and they removed from Shittim, and came to Jordan, he and all the children of Yashar''el (Israel), and lodged there before they passed over.* The journey from Shittim to the Jordan in Jasher 88:9 is the canon''s own staging of the crossing.'),
  ('jasher', 'jasher', 88, 10, 'canon', 'joshua', 4, 19, 'free', E'Joshua 4:19 — *And the people came up out of Jordan on the tenth day of the first month, and encamped in Gilgal, in the east border of Jericho.* The tenth-day-of-the-first-month encampment at Gilgal in Jasher 88:10 matches the canon to the day and the place.'),
  ('jasher', 'jasher', 88, 11, 'canon', 'joshua', 5, 10, 'free', E'Joshua 5:10 — *And the children of Yashar''el (Israel) encamped in Gilgal, and kept the passover on the fourteenth day of the month at even in the plains of Jericho.* Jasher 88:11''s Passover at Gilgal on the fourteenth is the same appointed time the canon records — Torah''s feast kept in the land.'),
  ('jasher', 'jasher', 88, 11, 'canon', 'exodus', 12, 25, 'free', E'Exodus 12:25 — *And it shall come to pass, when ye be come to the land which Yahuah (LORD) will give you, according as he hath promised, that ye shall keep this service.* The Passover Jasher 88:11 keeps at Gilgal is the very service Moses commanded them to hold once they entered the land — it ain''t new.'),
  ('jasher', 'jasher', 88, 12, 'canon', 'joshua', 5, 12, 'free', E'Joshua 5:12 — *And the manna ceased on the morrow after they had eaten of the old corn of the land; neither had the children of Yashar''el (Israel) manna any more; but they did eat of the fruit of the land of Canaan that year.* The manna ceasing on the morrow of the Passover in Jasher 88:12 is the canon''s note that the wilderness provision ended as the land''s produce began.'),
  ('jasher', 'jasher', 88, 12, 'canon', 'exodus', 16, 35, 'free', E'Exodus 16:35 — *And the children of Yashar''el (Israel) did eat manna forty years, until they came to a land inhabited; they did eat manna, until they came unto the borders of the land of Canaan.* The manna that ceases in Jasher 88:12 closes the forty-year provision Exodus 16:35 foretold would last until they reached Canaan''s borders.'),
  -- thread: jasher-88-jericho-falls
  ('jasher', 'jasher', 88, 14, 'canon', 'joshua', 6, 2, 'free', E'Joshua 6:2 — *And Yahuah (LORD) said unto Joshua, See, I have given into thine hand Jericho, and the king thereof, and the mighty men of valour.* Jasher 88:14''s word that Jericho is given into Joshua''s hand, compassed six days, is the canon''s own commission for the city''s fall.'),
  ('jasher', 'jasher', 88, 15, 'canon', 'joshua', 6, 5, 'free', E'Joshua 6:5 — *And it shall come to pass, that when they make a long blast with the ram’s horn, and when ye hear the sound of the trumpet, all the people shall shout with a great shout; and the wall of the city shall fall down flat, and the people shall ascend up every man straight before him.* The trumpet-blast and great shout that topple the wall in Jasher 88:15 are the canon''s exact instruction.'),
  ('jasher', 'jasher', 88, 20, 'canon', 'joshua', 6, 19, 'free', E'Joshua 6:19 — *But all the silver, and gold, and vessels of brass and iron, are consecrated unto Yahuah (LORD): they shall come into the treasury of Yahuah (LORD).* The silver, gold, brass and iron consecrated to Yahuah''s treasury in Jasher 88:20 is the canon''s ban on Jericho''s spoil.'),
  ('jasher', 'jasher', 88, 21, 'canon', 'joshua', 6, 20, 'free', E'Joshua 6:20 — *So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* Jasher 88:21''s shout and falling walls are the canon''s deliverance of Jericho, man by man straight before him.'),
  ('jasher', 'jasher', 88, 23, 'canon', 'joshua', 6, 26, 'free', E'Joshua 6:26 — *And Joshua adjured them at that time, saying, Cursed be the man before Yahuah (LORD), that riseth up and buildeth this city Jericho: he shall lay the foundation thereof in his firstborn, and in his youngest son shall he set up the gates of it.* Joshua''s oath against the rebuilder of Jericho in Jasher 88:23 is the canon''s curse, firstborn-foundation and all.'),
  -- thread: jasher-88-achan-and-ai
  ('jasher', 'jasher', 88, 24, 'canon', 'joshua', 7, 1, 'free', E'Joshua 7:1 — *But the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi, the son of Zabdi, the son of Zerah, of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel).* Jasher 88:24 names Achan''s whole lineage and the kindled anger exactly as the canon does.'),
  ('jasher', 'jasher', 88, 28, 'canon', 'joshua', 7, 5, 'free', E'Joshua 7:5 — *And the men of Ai smote of them about thirty and six men: for they chased them from before the gate even unto Shebarim, and smote them in the going down: wherefore the hearts of the people melted, and became as water.* The thirty-six men of Israel slain at Ai in Jasher 88:28 is the canon''s count of the first defeat.'),
  ('jasher', 'jasher', 88, 33, 'canon', 'joshua', 7, 16, 'free', E'Joshua 7:16 — *So Joshua rose up early in the morning, and brought Yashar''el (Israel) by their tribes; and the tribe of Yahudah (Judah) was taken:* Jasher 88:33''s taking of the tribe of Judah by the Urim matches the canon''s sifting that exposed Achan.'),
  ('jasher', 'jasher', 88, 34, 'canon', 'joshua', 7, 21, 'free', E'Joshua 7:21 — *When I saw among the spoils a goodly Babylonish garment, and two hundred shekels of silver, and a wedge of gold of fifty shekels weight, then I coveted them, and took them; and, behold, they are hid in the earth in the midst of my tent, and the silver under it.* Achan''s confession of the garment, two hundred shekels, and the fifty-shekel wedge of gold in Jasher 88:34 is the canon''s word for word.'),
  ('jasher', 'jasher', 88, 37, 'canon', 'joshua', 7, 26, 'free', E'Joshua 7:26 — *And they raised over him a great heap of stones unto this day. So Yahuah (LORD) turned from the fierceness of his anger. Wherefore the name of that place was called, The valley of Achor, unto this day.* The heap of stones, the appeased anger, and the naming of the valley of Achor in Jasher 88:37 are the canon''s close of the Achan account.'),
  -- thread: jasher-88-gibeon-covenant
  ('jasher', 'jasher', 88, 50, 'canon', 'joshua', 9, 4, 'free', E'Joshua 9:4 — *They did work wilily, and went and made as if they had been ambassadors, and took old sacks upon their asses, and wine bottles, old, and rent, and bound up;* Gibeon''s cunning approach as men from a distant land in Jasher 88:50 is the canon''s account of their guile.'),
  ('jasher', 'jasher', 88, 51, 'canon', 'joshua', 9, 15, 'free', E'Joshua 9:15 — *And Joshua made peace with them, and made a league with them, to let them live: and the princes of the congregation sware unto them.* The covenant of peace and the princes'' oath in Jasher 88:51 are the canon''s league with Gibeon.'),
  ('jasher', 'jasher', 88, 52, 'canon', 'joshua', 9, 18, 'free', E'Joshua 9:18 — *And the children of Yashar''el (Israel) smote them not, because the princes of the congregation had sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel). And all the congregation murmured against the princes.* Jasher 88:52''s sparing of Gibeon because of the oath by Yahuah holds the sworn Name binding, as the canon does.'),
  ('jasher', 'jasher', 88, 54, 'canon', 'joshua', 9, 21, 'free', E'Joshua 9:21 — *And the princes said unto them, Let them live; but let them be hewers of wood and drawers of water unto all the congregation; as the princes had promised them.* Gibeon''s appointment to hew wood and draw water for the tribes in Jasher 88:54 is the canon''s sentence on the spared people.'),
  -- thread: jasher-88-sun-stands-still
  ('jasher', 'jasher', 88, 55, 'canon', 'joshua', 10, 3, 'free', E'Joshua 10:3 — *Wherefore Adoni-zedek king of Jerusalem sent unto Hoham king of Hebron, and unto Piram king of Jarmuth, and unto Japhia king of Lachish, and unto Debir king of Eglon, saying,* The five Amorite kings Adonizedek gathers in Jasher 88:55 are named exactly as in the canon''s muster against Gibeon.'),
  ('jasher', 'jasher', 88, 61, 'canon', 'joshua', 10, 11, 'free', E'Joshua 10:11 — *And it came to pass, as they fled from before Yashar''el (Israel), and were in the going down to Beth-horon, that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword.* The hailstones from heaven killing more than the sword in Jasher 88:61 are the canon''s account of Yahuah fighting for Israel.'),
  ('jasher', 'jasher', 88, 63, 'canon', 'joshua', 10, 12, 'free', E'Joshua 10:12 — *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon.* Joshua''s command to the sun over Gibeon and the moon in Ajalon in Jasher 88:63 is the canon''s words spoken in the sight of Israel.'),
  ('jasher', 'jasher', 88, 64, 'canon', 'joshua', 10, 13, 'free', E'Joshua 10:13 — *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* The canon itself credits this very sun-standing-still to the book of Jasher — and Jasher 88:64 records exactly that wonder, the sun and moon halting a whole day.'),
  ('jasher', 'jasher', 88, 65, 'canon', 'joshua', 10, 14, 'free', E'Joshua 10:14 — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* Jasher 88:65 closes the whole book on the canon''s own line — no day like it, for Yahuah fought for Israel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja88_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja88_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-88-joshua-commissioned',
       E'After Moses — Joshua charged to cross and inherit the land',
       E'Jasher closes its whole book where the canon''s Joshua opens: *And it was after the death of Moses that Yahuah (the Lord) said to Joshua the son of Nun, saying,* (Jasher 88:1) — *Rise up and pass the Jordan to the land which I have given to the children of Israel, and you shall make the children of Israel inherit the land.* (Jasher 88:2). The retelling sits word-for-word beside Joshua 1: *Now after the death of Moses the servant of Yahuah (LORD) it came to pass, that Yahuah (LORD) spake unto Joshua the son of Nun, Moses’ minister, saying,* (Joshua 1:1). The boundary Jasher names — *from the wilderness of Lebanon to the great river the river of Perath* (Jasher 88:3) — is the inheritance-word given to Moses (*Every place whereon the soles of your feet shall tread shall be yours: from the wilderness and Lebanon, from the river, the river Euphrates, even unto the uttermost sea shall your coast be.* (Deuteronomy 11:24)) and the covenant cut with Abraham generations before (*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* (Genesis 15:18)). The land is not new conquest but kept promise to the chosen seed — it ain''t new. And the charge holds the Torah fast: *only be strong and of good courage to observe all the law which Moses commanded you, turn not from the way either to the right or to the left* (Jasher 88:4), echoing *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee* (Joshua 1:7).',
       sv.verse_id, ev.verse_id, 'extras', 57175
  FROM _session252_ja88_lookup sv, _session252_ja88_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=88 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-88-jordan-passover-manna',
       E'Jordan crossed, the Passover kept, the manna ceased',
       E'Jasher narrates the entry: *And Joshua rose up in the morning and all Israel with him, and they journeyed from Shittim, and Joshua and all Israel with him passed the Jordan* (Jasher 88:9) — the same march the canon records: *And Joshua rose early in the morning; and they removed from Shittim, and came to Jordan, he and all the children of Yashar''el (Israel), and lodged there before they passed over.* (Joshua 3:1). The people *went up from Jordan on the tenth day of the first month, and they encamped in Gilgal* (Jasher 88:10) — *And the people came up out of Jordan on the tenth day of the first month, and encamped in Gilgal, in the east border of Jericho.* (Joshua 4:19). At Gilgal they kept the feast: *And the children of Israel kept the Passover in Gilgal, in the plains of Jericho, on the fourteenth day at the month, as it is written in the law of Moses.* (Jasher 88:11) — Torah-keeping in the land, the appointed time held (*And the children of Yashar''el (Israel) encamped in Gilgal, and kept the passover on the fourteenth day of the month at even in the plains of Jericho.* (Joshua 5:10)), the feast Moses had charged them to keep when they came in (*And it shall come to pass, when ye be come to the land which Yahuah (LORD) will give you, according as he hath promised, that ye shall keep this service.* (Exodus 12:25)). Then the wilderness bread stops: *the manna ceased at that time on the morrow of the Passover... and they ate of the produce of the land of Canaan* (Jasher 88:12) — *And the manna ceased on the morrow after they had eaten of the old corn of the land* (Joshua 5:12), closing the forty years of manna (*And the children of Yashar''el (Israel) did eat manna forty years, until they came to a land inhabited* (Exodus 16:35)).',
       sv.verse_id, ev.verse_id, 'extras', 57178
  FROM _session252_ja88_lookup sv, _session252_ja88_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=88 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-88-jericho-falls',
       E'Jericho compassed — the trumpets, the shout, the walls fall',
       E'The first city falls by the Name, not the siege-ram: *And it was in the second month, on the first day of the month, that Yahuah (the Lord) said to Joshua, Rise up, behold I have given Jericho into your hand... all your fighting men shall go round the city, once each day, thus shall you do for six days.* (Jasher 88:14) — the canon''s *And Yahuah (LORD) said unto Joshua, See, I have given into thine hand Jericho, and the king thereof, and the mighty men of valour.* (Joshua 6:2) with its six-day compassing. Jasher carries the trumpet-and-shout: *And the priests shall blow upon trumpets, and when you shall hear the sound of the trumpet, all the people shall give a great shouting, that the walls of the city shall fall down* (Jasher 88:15) — *that when they make a long blast with the ram’s horn... all the people shall shout with a great shout; and the wall of the city shall fall down flat* (Joshua 6:5). And the deliverance comes: *And the people blew upon trumpets and made a great shouting, and the walls of Jericho fell down* (Jasher 88:21) — *the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* (Joshua 6:20). The ban on the spoil (*all the silver and gold and brass and iron shall be consecrated to Yahuah (the Lord)* (Jasher 88:20); *But all the silver, and gold, and vessels of brass and iron, are consecrated unto Yahuah (LORD)* (Joshua 6:19)) and Joshua''s curse on the rebuilder (*Cursed be the man who builds Jericho; he shall lay the foundation of it in his first-born* (Jasher 88:23); *Cursed be the man before Yahuah (LORD), that riseth up and buildeth this city Jericho: he shall lay the foundation thereof in his firstborn* (Joshua 6:26)) close the scene — the canon''s account, retold.',
       sv.verse_id, ev.verse_id, 'extras', 57181
  FROM _session252_ja88_lookup sv, _session252_ja88_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=88 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-88-achan-and-ai',
       E'Achan''s accursed thing and the taking of Ai',
       E'The sin in the camp follows hard on the victory: *And Achan the son of Carmi, the son of Zabdi, the son of Zerah, son of Judah, dealt treacherously in the accursed thing, and he took of the accursed thing and hid it in the tent, and the anger of Yahuah (the Lord) was kindled against Israel.* (Jasher 88:24) — verbatim the canon: *But the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi, the son of Zabdi, the son of Zerah, of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel).* (Joshua 7:1). Ai then routs Israel (*the men of Ai smote thirty-six men of Israel* (Jasher 88:28); *the men of Ai smote of them about thirty and six men* (Joshua 7:5)), Joshua falls on his face (*he tore his garments and fell upon his face to the ground before Yahuah (the Lord)* (Jasher 88:29); *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD)* (Joshua 7:6)), the Urim takes Judah and Achan (Jasher 88:33; *the tribe of Yahudah (Judah) was taken* (Joshua 7:16)), Achan confesses the *goodly garment of Shinar and two hundred shekels of silver, and a wedge of gold of fifty shekels weight* (Jasher 88:34; *a goodly Babylonish garment, and two hundred shekels of silver, and a wedge of gold of fifty shekels weight* (Joshua 7:21)), and is stoned in the valley of Achor (Jasher 88:36-37; Joshua 7:24-26). Then Ai is taken by ambush (Jasher 88:38-48; Joshua 8) — the canon''s account carried whole.',
       sv.verse_id, ev.verse_id, 'extras', 57184
  FROM _session252_ja88_lookup sv, _session252_ja88_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=88 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-88-gibeon-covenant',
       E'Gibeon''s guile — the covenant sworn by Yahuah',
       E'Where Jericho and Ai were destroyed, Gibeon is spared by an oath: *Only the inhabitants of Gibeon were greatly afraid of fighting against the Israelites lest they should perish, so they acted cunningly, and they came to Joshua and to all Israel, and said to them, We have come from a distant land, now therefore make a covenant with us.* (Jasher 88:50) — the canon''s *And when the inhabitants of Gibeon heard what Joshua had done unto Jericho and to Ai, They did work wilily, and went and made as if they had been ambassadors* (Joshua 9:3-4). Israel is over-reached and swears (*the children of Israel made a covenant with them, and they made peace with them, and the princes of the congregation swore to them* (Jasher 88:51); *And Joshua made peace with them, and made a league with them, to let them live: and the princes of the congregation sware unto them.* (Joshua 9:15)). The oath holds even when the deceit is found — *the children of Israel slew them not; for they had sworn to them by Yahuah (the Lord), and they became hewers of wood and drawers of water* (Jasher 88:52) — *And the children of Yashar''el (Israel) smote them not, because the princes of the congregation had sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 9:18). The sworn Name binds Israel; covenant is not lightly broken — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57187
  FROM _session252_ja88_lookup sv, _session252_ja88_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=50
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=88 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-88-sun-stands-still',
       E'The five kings, the hailstones, and the sun standing still',
       E'Jasher''s book ends on the sign the canon itself credits to Jasher. Adonizedek gathers the five Amorite kings against Gibeon (*And when Adonizedek king of Jerusalem heard all that the children of Israel had done... he sent to Hoham king of Hebron and to Piram king at Jarmuth, and to Japhia king of Lachish and to Deber king of Eglon, saying,* (Jasher 88:55)) — *Wherefore Adoni-zedek king of Jerusalem sent unto Hoham king of Hebron, and unto Piram king of Jarmuth, and unto Japhia king of Lachish, and unto Debir king of Eglon, saying,* (Joshua 10:3). Yahuah fights: *whilst they were fleeing, Yahuah (the Lord) sent upon them hailstones from heaven, and more of them died by the hailstones, than by the slaughter of the children of Israel.* (Jasher 88:61) — *that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword.* (Joshua 10:11). Then Joshua''s word halts the heavens: *Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon, until the nation shall have revenged itself upon its enemies.* (Jasher 88:63) — and here the canon names this very book: *Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon... Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* (Joshua 10:12-13). Jasher answers: *Yahuah (the Lord) hearkened to the voice of Joshua, and the sun stood still in the midst of the heavens... and the moon also stood still and hastened not to go down a whole day. And there was no day like that, before it or after it, that Yahuah (the Lord) hearkened to the voice of a man, for Yahuah (the Lord) fought for Israel.* (Jasher 88:64-65) — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* (Joshua 10:14). The book of the Upright closes on the line the canon quotes from it — Yahuah fought for Israel, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57190
  FROM _session252_ja88_lookup sv, _session252_ja88_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=55
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=88 AND ev.verse_number=65
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-88-joshua-commissioned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:1 — *Now after the death of Moses the servant of Yahuah (LORD) it came to pass, that Yahuah (LORD) spake unto Joshua the son of Nun, Moses’ minister, saying,* The canon''s Joshua opens on the very line Jasher 88:1 carries — after Moses'' death, Yahuah speaks to Joshua son of Nun.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:2 — *Moses my servant is dead; now therefore arise, go over this Jordan, thou, and all this people, unto the land which I do give to them, even to the children of Yashar''el (Israel).* The command to rise and pass the Jordan to inherit the land in Jasher 88:2 is Joshua 1:2 verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 11:24 — *Every place whereon the soles of your feet shall tread shall be yours: from the wilderness and Lebanon, from the river, the river Euphrates, even unto the uttermost sea shall your coast be.* The sole-of-the-foot boundary to Lebanon and the river of Perath in Jasher 88:3 is the inheritance-word Moses already gave.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The land Joshua now enters in Jasher 88:3 is the very ground covenanted to Abraham''s seed generations earlier — kept promise, not new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joshua 1:7 — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest.* Jasher 88:4''s charge to keep all the law and turn neither right nor left holds the Torah standing under Joshua — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-joshua-commissioned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-88-jordan-passover-manna
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 3:1 — *And Joshua rose early in the morning; and they removed from Shittim, and came to Jordan, he and all the children of Yashar''el (Israel), and lodged there before they passed over.* The journey from Shittim to the Jordan in Jasher 88:9 is the canon''s own staging of the crossing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jordan-passover-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 4:19 — *And the people came up out of Jordan on the tenth day of the first month, and encamped in Gilgal, in the east border of Jericho.* The tenth-day-of-the-first-month encampment at Gilgal in Jasher 88:10 matches the canon to the day and the place.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jordan-passover-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 5:10 — *And the children of Yashar''el (Israel) encamped in Gilgal, and kept the passover on the fourteenth day of the month at even in the plains of Jericho.* Jasher 88:11''s Passover at Gilgal on the fourteenth is the same appointed time the canon records — Torah''s feast kept in the land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jordan-passover-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:25 — *And it shall come to pass, when ye be come to the land which Yahuah (LORD) will give you, according as he hath promised, that ye shall keep this service.* The Passover Jasher 88:11 keeps at Gilgal is the very service Moses commanded them to hold once they entered the land — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jordan-passover-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joshua 5:12 — *And the manna ceased on the morrow after they had eaten of the old corn of the land; neither had the children of Yashar''el (Israel) manna any more; but they did eat of the fruit of the land of Canaan that year.* The manna ceasing on the morrow of the Passover in Jasher 88:12 is the canon''s note that the wilderness provision ended as the land''s produce began.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jordan-passover-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Exodus 16:35 — *And the children of Yashar''el (Israel) did eat manna forty years, until they came to a land inhabited; they did eat manna, until they came unto the borders of the land of Canaan.* The manna that ceases in Jasher 88:12 closes the forty-year provision Exodus 16:35 foretold would last until they reached Canaan''s borders.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jordan-passover-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-88-jericho-falls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 6:2 — *And Yahuah (LORD) said unto Joshua, See, I have given into thine hand Jericho, and the king thereof, and the mighty men of valour.* Jasher 88:14''s word that Jericho is given into Joshua''s hand, compassed six days, is the canon''s own commission for the city''s fall.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jericho-falls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 6:5 — *And it shall come to pass, that when they make a long blast with the ram’s horn, and when ye hear the sound of the trumpet, all the people shall shout with a great shout; and the wall of the city shall fall down flat, and the people shall ascend up every man straight before him.* The trumpet-blast and great shout that topple the wall in Jasher 88:15 are the canon''s exact instruction.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jericho-falls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 6:19 — *But all the silver, and gold, and vessels of brass and iron, are consecrated unto Yahuah (LORD): they shall come into the treasury of Yahuah (LORD).* The silver, gold, brass and iron consecrated to Yahuah''s treasury in Jasher 88:20 is the canon''s ban on Jericho''s spoil.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jericho-falls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 6:20 — *So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* Jasher 88:21''s shout and falling walls are the canon''s deliverance of Jericho, man by man straight before him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jericho-falls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joshua 6:26 — *And Joshua adjured them at that time, saying, Cursed be the man before Yahuah (LORD), that riseth up and buildeth this city Jericho: he shall lay the foundation thereof in his firstborn, and in his youngest son shall he set up the gates of it.* Joshua''s oath against the rebuilder of Jericho in Jasher 88:23 is the canon''s curse, firstborn-foundation and all.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-jericho-falls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-88-achan-and-ai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 7:1 — *But the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi, the son of Zabdi, the son of Zerah, of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel).* Jasher 88:24 names Achan''s whole lineage and the kindled anger exactly as the canon does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-achan-and-ai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 7:5 — *And the men of Ai smote of them about thirty and six men: for they chased them from before the gate even unto Shebarim, and smote them in the going down: wherefore the hearts of the people melted, and became as water.* The thirty-six men of Israel slain at Ai in Jasher 88:28 is the canon''s count of the first defeat.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-achan-and-ai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 7:16 — *So Joshua rose up early in the morning, and brought Yashar''el (Israel) by their tribes; and the tribe of Yahudah (Judah) was taken:* Jasher 88:33''s taking of the tribe of Judah by the Urim matches the canon''s sifting that exposed Achan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-achan-and-ai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 7:21 — *When I saw among the spoils a goodly Babylonish garment, and two hundred shekels of silver, and a wedge of gold of fifty shekels weight, then I coveted them, and took them; and, behold, they are hid in the earth in the midst of my tent, and the silver under it.* Achan''s confession of the garment, two hundred shekels, and the fifty-shekel wedge of gold in Jasher 88:34 is the canon''s word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-achan-and-ai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joshua 7:26 — *And they raised over him a great heap of stones unto this day. So Yahuah (LORD) turned from the fierceness of his anger. Wherefore the name of that place was called, The valley of Achor, unto this day.* The heap of stones, the appeased anger, and the naming of the valley of Achor in Jasher 88:37 are the canon''s close of the Achan account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-achan-and-ai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-88-gibeon-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 9:4 — *They did work wilily, and went and made as if they had been ambassadors, and took old sacks upon their asses, and wine bottles, old, and rent, and bound up;* Gibeon''s cunning approach as men from a distant land in Jasher 88:50 is the canon''s account of their guile.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-gibeon-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 9:15 — *And Joshua made peace with them, and made a league with them, to let them live: and the princes of the congregation sware unto them.* The covenant of peace and the princes'' oath in Jasher 88:51 are the canon''s league with Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-gibeon-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 9:18 — *And the children of Yashar''el (Israel) smote them not, because the princes of the congregation had sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel). And all the congregation murmured against the princes.* Jasher 88:52''s sparing of Gibeon because of the oath by Yahuah holds the sworn Name binding, as the canon does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-gibeon-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 9:21 — *And the princes said unto them, Let them live; but let them be hewers of wood and drawers of water unto all the congregation; as the princes had promised them.* Gibeon''s appointment to hew wood and draw water for the tribes in Jasher 88:54 is the canon''s sentence on the spared people.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-gibeon-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-88-sun-stands-still
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 10:3 — *Wherefore Adoni-zedek king of Jerusalem sent unto Hoham king of Hebron, and unto Piram king of Jarmuth, and unto Japhia king of Lachish, and unto Debir king of Eglon, saying,* The five Amorite kings Adonizedek gathers in Jasher 88:55 are named exactly as in the canon''s muster against Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-sun-stands-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 10:11 — *And it came to pass, as they fled from before Yashar''el (Israel), and were in the going down to Beth-horon, that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword.* The hailstones from heaven killing more than the sword in Jasher 88:61 are the canon''s account of Yahuah fighting for Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-sun-stands-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 10:12 — *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon.* Joshua''s command to the sun over Gibeon and the moon in Ajalon in Jasher 88:63 is the canon''s words spoken in the sight of Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-sun-stands-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 10:13 — *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* The canon itself credits this very sun-standing-still to the book of Jasher — and Jasher 88:64 records exactly that wonder, the sun and moon halting a whole day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-sun-stands-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joshua 10:14 — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* Jasher 88:65 closes the whole book on the canon''s own line — no day like it, for Yahuah fought for Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja88_lookup sv, _session252_ja88_lookup tv
 WHERE t.slug='jasher-88-sun-stands-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=88 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

