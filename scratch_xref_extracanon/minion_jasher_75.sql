-- ----- fragment: minion_jasher_75.sql (session252 jasher 75) -----
-- Source anchor: jasher/jasher ch75. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja75 (view _session252_ja75_lookup). Sort band base 56850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja75_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-75-appointed-time
  ('jasher', 'jasher', 75, 2, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* This is the very "period... which he had spoken to Abraham" that the Ephraimites in Jasher 75:2 claimed was completed before its time.'),
  ('jasher', 'jasher', 75, 2, 'canon', 'genesis', 15, 16, 'free', E'Genesis 15:16 — *But in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full.* The exodus is fixed to a fourth-generation reckoning, so the Ephraimites of Jasher 75:1 who marched out in the 180th year ran ahead of the covenant timetable.'),
  ('jasher', 'jasher', 75, 17, 'canon', 'exodus', 12, 41, 'free', E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The true exodus came on the selfsame appointed day, vindicating the verdict of Jasher 75:17 that Ephraim transgressed by going forth before the period had arrived.'),
  ('jasher', 'jasher', 75, 2, 'jubilees', 'jubilees', 14, 13, 'extras', E'Jubilees 14:13 — *And it came to pass, when the sun had set, that an ecstasy fell upon Abram, and lo! an horror of great darkness fell upon him, and it was said to Abram: “Know of a surety that your seed shall be a stranger in a land (that is) not theirs, and they will bring them into bondage, and afflict them four hundred years.* The live Jubilees apparatus carries the same covenant-darkness oracle to Abram that fixes the period Jasher 75:2 says Ephraim wrongly counted complete.'),
  -- thread: jasher-75-trusted-their-strength
  ('jasher', 'jasher', 75, 5, 'canon', 'leviticus', 26, 8, 'free', E'Leviticus 26:8 — *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword.* The Ephraimite boast in Jasher 75:5 that one could pursue a thousand quotes the covenant blessing, but claims it apart from the obedience that secures it.'),
  ('jasher', 'jasher', 75, 5, 'canon', 'deuteronomy', 32, 30, 'free', E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* The Song of Moses shows the very arithmetic of Jasher 75:5 reversed when the Rock sells His people up — which is exactly what befell Ephraim trusting their strength.'),
  ('jasher', 'jasher', 75, 3, 'canon', 'psalms', 33, 16, 'free', E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* This unmasks the false confidence of the valiant men of Jasher 75:3 who trusted to their strength and went out with a mighty hand of their own.'),
  ('jasher', 'jasher', 75, 3, 'canon', 'psalms', 33, 17, 'free', E'Psalms 33:17 — *An horse is a vain thing for safety: neither shall he deliver any by his great strength.* The great strength on which Ephraim leaned in Jasher 75:3 is named a vain thing for safety — deliverance belongs to Yahuah alone.'),
  -- thread: jasher-75-philistine-road-war
  ('jasher', 'jasher', 75, 6, 'canon', 'exodus', 13, 17, 'free', E'Exodus 13:17 — *And it came to pass, when Pharaoh had let the people go, that Elohim (God) led them not through the way of the land of the Philistines, although that was near; for Elohim (God) said, Lest peradventure the people repent when they see war, and they return to Egypt:* This is the canon''s own reason the Philistine road of Jasher 75:6 was deadly — the route toward Gath that destroyed Ephraim is the one Yahuah deliberately steered the true exodus away from.'),
  ('jasher', 'jasher', 75, 15, 'canon', 'exodus', 12, 41, 'free', E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* Yahuah delivered His hosts safely OUT in Exodus, the foil to Jasher 75:15 where He delivered the premature host UP into the hands of the Philistines.'),
  -- thread: jasher-75-ephraim-mourns-beriah
  ('jasher', 'jasher', 75, 16, 'canon', '1-chronicles', 7, 21, 'free', E'1 Chronicles 7:21 — *And Zabad his son, and Shuthelah his son, and Ezer, and Elead, whom the men of Gath that were born in that land slew, because they came down to take away their cattle.* The canon preserves the very slaughter of Jasher 75:16 — the sons of Ephraim cut down by the men of Gath for coming down after their cattle.'),
  ('jasher', 'jasher', 75, 21, 'canon', '1-chronicles', 7, 22, 'free', E'1 Chronicles 7:22 — *And Ephraim their father mourned many days, and his brethren came to comfort him.* This is the same mourning of Jasher 75:21 — word for word the canon records Ephraim mourning many days while his brethren came to console him.'),
  ('jasher', 'jasher', 75, 22, 'canon', '1-chronicles', 7, 23, 'free', E'1 Chronicles 7:23 — *And when he went in to his wife, she conceived, and bare a son, and he called his name Beriah, because it went evil with his house.* The birth and naming of Beriah in Jasher 75:22 is the canon''s own — the wounded seed-line is kept and continued even after the disaster at Gath.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja75_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja75_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-75-appointed-time',
       E'The Ephraimites went out before the time — the period Yahuah spoke to Abraham',
       E'Jasher opens not with Moses but with a forgotten tragedy: *At that time, in the hundred and eightieth year of the Israelites going down into Egypt, there went forth from Egypt valiant men, thirty thousand on foot, from the children of Israel, who were all of the tribe of Joseph, of the children of Ephraim the son of Joseph* (Jasher 75:1), *For they said the period was completed which Yahuah (the Lord) had appointed to the children of Israel in the times of old, which he had spoken to Abraham* (Jasher 75:2). They miscounted the covenant clock and broke out early — and the text names it judgment: *For this evil was from Yahuah (the Lord) against the children of Ephraim, for they transgressed the word of Yahuah (the Lord) in going forth from Egypt, before the period had arrived which Yahuah (the Lord) in the days of old had appointed to Israel* (Jasher 75:17). It ain''t new: the appointed period is the canon''s own oracle to Abram — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13); the deliverance comes on Yahuah''s day, not man''s — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt* (Exodus 12:41). The live Jubilees apparatus carries the same covenant-darkness over Abram (Jubilees 14:13). The election runs on Yahuah''s reckoning; to force the redemption ahead of the appointed time is to step out from under the hand that keeps the seed.',
       sv.verse_id, ev.verse_id, 'extras', 56850
  FROM _session252_ja75_lookup sv, _session252_ja75_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=75 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-75-trusted-their-strength',
       E'They trusted to their strength — one chasing a thousand, reversed',
       E'The men of Ephraim went out armed and confident: *And these men girded themselves, and they put each man his sword at his side, and every man his armor upon him, and they trusted to their strength, and they went out together from Egypt with a mighty hand* (Jasher 75:3); *And these men were very mighty and valiant men, one man could pursue a thousand and two could rout ten thousand, so they trusted to their strength and went together as they were* (Jasher 75:5). That boast is a quotation — but quoted out of covenant. The Torah promises *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword* (Leviticus 26:8), yet only inside obedience; outside it the song warns the arithmetic reverses — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* (Deuteronomy 32:30). The Psalm strips the illusion bare: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalms 33:16). It ain''t new: the might that delivers Israel is never her own arm. Ephraim trusted the strength and not the Strong One, and so the same Yahuah who delivers His hosts delivered them up.',
       sv.verse_id, ev.verse_id, 'extras', 56853
  FROM _session252_ja75_lookup sv, _session252_ja75_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=75 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-75-philistine-road-war',
       E'The way of the Philistines — war near Gath, and Yahuah delivered them up',
       E'The Ephraimites took the short, deadly road: *And they directed their course toward the land of Gath, and they went down and found the shepherds of Gath feeding the cattle of the children of Gath* (Jasher 75:6) — straight into Philistine country and into war. The end is stark: *And these men were engaged in battle with the children of Ephraim, and Yahuah (the Lord) delivered the children of Ephraim into the hands of the Philistines* (Jasher 75:15); *And they smote all the children of Ephraim, all who had gone forth from Egypt, none were remaining but ten men who had run away from the engagement* (Jasher 75:16). It ain''t new: the canon explains precisely why this road was death — *And it came to pass, when Pharaoh had let the people go, that Elohim (God) led them not through the way of the land of the Philistines, although that was near; for Elohim (God) said, Lest peradventure the people repent when they see war, and they return to Egypt* (Exodus 13:17). When the true exodus came under Yahuah''s hand, He turned His people away from the very Philistine war that swallowed Ephraim''s premature host. The same Yahuah who later delivered His hosts out delivered this presumptuous host up.',
       sv.verse_id, ev.verse_id, 'extras', 56856
  FROM _session252_ja75_lookup sv, _session252_ja75_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=75 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-75-ephraim-mourns-beriah',
       E'Ephraim mourned many days — the slain of Gath and the son Beriah',
       E'The chapter closes on a father''s grief: *And of the Philistines also there fell a great many, about twenty thousand men, and their brethren carried them and buried them in their cities* (Jasher 75:18); but Ephraim''s own slain lay unburied — *And the slain of the children of Ephraim remained forsaken in the valley of Gath for many days and years, and were not brought to burial, and the valley was filled with men’s bones* (Jasher 75:19); *And their father Ephraim mourned over them for many days, and his brethren came to console him* (Jasher 75:21); *And he came to his wife and she bare a son, and he called his name Beriah, for she was unfortunate in his house* (Jasher 75:22). This is no mere legend — it ain''t new: the canon itself preserves this exact episode, the only window Scripture gives onto it. *And Zabad his son, and Shuthelah his son, and Ezer, and Elead, whom the men of Gath that were born in that land slew, because they came down to take away their cattle* (1 Chronicles 7:21); *And Ephraim their father mourned many days, and his brethren came to comfort him* (1 Chronicles 7:22); *And when he went in to his wife, she conceived, and bare a son, and he called his name Beriah, because it went evil with his house* (1 Chronicles 7:23). Jasher unfolds the grief the genealogy only names; the seed is wounded but the line is kept — Beriah is born, and the covenant goes on.',
       sv.verse_id, ev.verse_id, 'extras', 56859
  FROM _session252_ja75_lookup sv, _session252_ja75_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=75 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-75-appointed-time
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* This is the very "period... which he had spoken to Abraham" that the Ephraimites in Jasher 75:2 claimed was completed before its time.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-appointed-time'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:16 — *But in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full.* The exodus is fixed to a fourth-generation reckoning, so the Ephraimites of Jasher 75:1 who marched out in the 180th year ran ahead of the covenant timetable.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-appointed-time'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The true exodus came on the selfsame appointed day, vindicating the verdict of Jasher 75:17 that Ephraim transgressed by going forth before the period had arrived.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-appointed-time'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 14:13 — *And it came to pass, when the sun had set, that an ecstasy fell upon Abram, and lo! an horror of great darkness fell upon him, and it was said to Abram: “Know of a surety that your seed shall be a stranger in a land (that is) not theirs, and they will bring them into bondage, and afflict them four hundred years.* The live Jubilees apparatus carries the same covenant-darkness oracle to Abram that fixes the period Jasher 75:2 says Ephraim wrongly counted complete.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-appointed-time'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-75-trusted-their-strength
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:8 — *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword.* The Ephraimite boast in Jasher 75:5 that one could pursue a thousand quotes the covenant blessing, but claims it apart from the obedience that secures it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-trusted-their-strength'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* The Song of Moses shows the very arithmetic of Jasher 75:5 reversed when the Rock sells His people up — which is exactly what befell Ephraim trusting their strength.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-trusted-their-strength'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* This unmasks the false confidence of the valiant men of Jasher 75:3 who trusted to their strength and went out with a mighty hand of their own.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-trusted-their-strength'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 33:17 — *An horse is a vain thing for safety: neither shall he deliver any by his great strength.* The great strength on which Ephraim leaned in Jasher 75:3 is named a vain thing for safety — deliverance belongs to Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-trusted-their-strength'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-75-philistine-road-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 13:17 — *And it came to pass, when Pharaoh had let the people go, that Elohim (God) led them not through the way of the land of the Philistines, although that was near; for Elohim (God) said, Lest peradventure the people repent when they see war, and they return to Egypt:* This is the canon''s own reason the Philistine road of Jasher 75:6 was deadly — the route toward Gath that destroyed Ephraim is the one Yahuah deliberately steered the true exodus away from.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-philistine-road-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* Yahuah delivered His hosts safely OUT in Exodus, the foil to Jasher 75:15 where He delivered the premature host UP into the hands of the Philistines.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-philistine-road-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-75-ephraim-mourns-beriah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Chronicles 7:21 — *And Zabad his son, and Shuthelah his son, and Ezer, and Elead, whom the men of Gath that were born in that land slew, because they came down to take away their cattle.* The canon preserves the very slaughter of Jasher 75:16 — the sons of Ephraim cut down by the men of Gath for coming down after their cattle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-ephraim-mourns-beriah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Chronicles 7:22 — *And Ephraim their father mourned many days, and his brethren came to comfort him.* This is the same mourning of Jasher 75:21 — word for word the canon records Ephraim mourning many days while his brethren came to console him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-ephraim-mourns-beriah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Chronicles 7:23 — *And when he went in to his wife, she conceived, and bare a son, and he called his name Beriah, because it went evil with his house.* The birth and naming of Beriah in Jasher 75:22 is the canon''s own — the wounded seed-line is kept and continued even after the disaster at Gath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja75_lookup sv, _session252_ja75_lookup tv
 WHERE t.slug='jasher-75-ephraim-mourns-beriah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=75 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

