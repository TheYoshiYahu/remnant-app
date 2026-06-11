-- ----- fragment: minion_jubilees_47.sql (session251 jubilees 47) -----
-- Source anchor: jubilees/jubilees ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju47 (view _session251_ju47_lookup). Sort band base 54150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-47-river-decree-tribulation
  ('jubilees', 'jubilees', 47, 2, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Jubilees 47:2 retells Pharaoh''s drowning-decree verbatim from the Exodus source it is unfolding.'),
  ('jubilees', 'jubilees', 47, 3, 'canon', 'exodus', 2, 2, 'free', E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* The three-month hiding of the goodly child in Jubilees 47:3 is the Exodus 2 birth-narrative it quotes.'),
  ('jubilees', 'jubilees', 47, 2, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen preaches the same casting-out of the male children that Jubilees 47:2 records.'),
  ('jubilees', 'jubilees', 47, 3, 'canon', 'hebrews', 11, 23, 'free', E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* Jochebed''s three-month hiding in Jubilees 47:3 is the faith that defied Pharaoh''s commandment.'),
  ('jubilees', 'jubilees', 47, 2, 'jasher', 'jasher', 67, 52, 'extras', E'Jasher 67:52 — *And Pharaoh called to all his servants, saying, Go now and seek throughout the land of Goshen where the children of Israel are, and see that every son born to the Hebrews shall be cast into the river, but every daughter you shall let live.* Jasher preserves the same river-decree Jubilees 47:2 reports.'),
  -- thread: jubilees-47-ark-of-bulrushes-drawn-out
  ('jubilees', 'jubilees', 47, 4, 'canon', 'exodus', 2, 3, 'free', E'Exodus 2:3 — *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink.* The pitch-daubed ark in the flags of Jubilees 47:4 is the Exodus ark of bulrushes itself.'),
  ('jubilees', 'jubilees', 47, 5, 'canon', 'exodus', 2, 5, 'free', E'Exodus 2:5 — *And the daughter of Pharaoh came down to wash herself at the river; and her maidens walked along by the river''s side; and when she saw the ark among the flags, she sent her maid to fetch it.* Tharmuth bathing and sending for the ark in Jubilees 47:5 is Pharaoh''s daughter in Exodus 2:5.'),
  ('jubilees', 'jubilees', 47, 6, 'canon', 'exodus', 2, 6, 'free', E'Exodus 2:6 — *And when she had opened it, she saw the child: and, behold, the babe wept. And she had compassion on him, and said, This is one of the Hebrews'' children.* Her compassion on the crying babe in Jubilees 47:6 matches Exodus 2:6 exactly.'),
  ('jubilees', 'jubilees', 47, 6, 'canon', 'acts', 7, 21, 'free', E'Acts 7:21 — *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* Stephen condenses the drawing-out and adoption that Jubilees 47:5-6 narrates in detail.'),
  ('jubilees', 'jubilees', 47, 4, 'jasher', 'jasher', 68, 13, 'extras', E'Jasher 68:13 — *And the woman hastened to take away her son before the officers came, and she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink.* Jasher preserves the same pitch-daubed ark in the flags that Jubilees 47:4 describes.'),
  -- thread: jubilees-47-nursed-by-his-own-mother
  ('jubilees', 'jubilees', 47, 8, 'canon', 'exodus', 2, 9, 'free', E'Exodus 2:9 — *And Pharaoh''s daughter said unto her, Take this child away, and nurse it for me, and I will give thee thy wages. And the woman took the child, and nursed it.* The wages paid to Jochebed to nurse her own son in Jubilees 47:8 is Exodus 2:9 word for word.'),
  ('jubilees', 'jubilees', 47, 9, 'canon', 'exodus', 2, 10, 'free', E'Exodus 2:10 — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* Jubilees 47:9, the grown child brought to Pharaoh''s daughter to become her son, is the close of the Exodus 2:10 drawing-out.'),
  -- thread: jubilees-47-moses-grown-learned-refused-court
  ('jubilees', 'jubilees', 47, 9, 'canon', 'acts', 7, 22, 'free', E'Acts 7:22 — *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* The royal-court education and Amram''s teaching of writing in Jubilees 47:9 is the wisdom Stephen credits to Moses.'),
  ('jubilees', 'jubilees', 47, 9, 'canon', 'hebrews', 11, 24, 'free', E'Hebrews 11:24 — *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter.* The boy made son of Pharaoh''s daughter in Jubilees 47:9 is the very title Hebrews says the grown Moses refused by faith.'),
  ('jubilees', 'jubilees', 47, 9, 'canon', 'hebrews', 11, 26, 'free', E'Hebrews 11:26 — *Esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt: for he had respect unto the recompence of the reward.* The royal court Moses enters in Jubilees 47:9 is the Egyptian treasure he later counted less than the reproach of Messiah.'),
  -- thread: jubilees-47-slays-egyptian-flees-midian
  ('jubilees', 'jubilees', 47, 10, 'canon', 'exodus', 2, 12, 'free', E'Exodus 2:12 — *And he looked this way and that way, and when he saw that there was no man, he slew the Egyptian, and hid him in the sand.* The slaying of the Egyptian and hiding him in the sand in Jubilees 47:10 is Exodus 2:12 itself.'),
  ('jubilees', 'jubilees', 47, 11, 'canon', 'exodus', 2, 14, 'free', E'Exodus 2:14 — *And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* The rebuke and the fearful flight in Jubilees 47:11 quote Exodus 2:14 nearly verbatim.'),
  ('jubilees', 'jubilees', 47, 11, 'canon', 'acts', 7, 25, 'free', E'Acts 7:25 — *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not.* The brother who turns on Moses in Jubilees 47:11 is Stephen''s portrait of the deliverer rejected by his own.'),
  ('jubilees', 'jubilees', 47, 11, 'canon', 'hebrews', 11, 27, 'free', E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* The flight from Pharaoh''s wrath in Jubilees 47:11 is the faith Hebrews credits to Moses'' forsaking of Egypt.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-47-river-decree-tribulation',
       E'The time of tribulation — every male child cast into the river',
       E'Jubilees turns from Joseph to the deliverer''s hour: *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river. And they cast them in for seven months until the day that you were born. And your mother hid you for three months, and they told regarding her* (Jubilees 47:2-3). This is Exodus 1 word for word — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive* (Exodus 1:22) — and the goodly child hidden three months: *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months* (Exodus 2:2). Stephen preaches the same dragnet — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live* (Acts 7:19) — and Hebrews names the parents'' faith that defied it: *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment* (Hebrews 11:23). Jasher remembers the very edict: *And Pharaoh called to all his servants, saying, Go now and seek throughout the land of Goshen where the children of Israel are, and see that every son born to the Hebrews shall be cast into the river, but every daughter you shall let live* (Jasher 67:52). The same satan that warred on the seed in Genesis now hunts the deliverer — the seed kept through the slaughter. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54150
  FROM _session251_ju47_lookup sv, _session251_ju47_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=47 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-47-ark-of-bulrushes-drawn-out',
       E'The ark of bulrushes — drawn out by Pharaoh''s daughter',
       E'*And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river, and she placed you in it seven days, and your mother came by night and suckled you, and by day Miriam, your sister, guarded you from the birds* (Jubilees 47:4). The Exodus source is the same ark and the same pitch: *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink* (Exodus 2:3). Pharaoh''s own daughter draws him out — *And the daughter of Pharaoh came down to wash herself at the river... and when she saw the ark among the flags, she sent her maid to fetch it. And when she had opened it, she saw the child: and, behold, the babe wept. And she had compassion on him, and said, This is one of the Hebrews'' children* (Exodus 2:5-6) — exactly Jubilees 47:5-6, *she heard your voice crying... she took you out of the ark, and she had compassion on you.* Stephen sums it: *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son* (Acts 7:21). Jasher remembers the identical ark: *And the woman hastened to take away her son before the officers came, and she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink* (Jasher 68:13). The deliverer is hidden in an ark on the waters of death and drawn out alive — the same God who shut Noah in the ark draws Moses out of the river.',
       sv.verse_id, ev.verse_id, 'extras', 54153
  FROM _session251_ju47_lookup sv, _session251_ju47_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=47 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-47-nursed-by-his-own-mother',
       E'Jochebed nursed her own son — and was paid wages for it',
       E'Providence turns Pharaoh''s house into Jochebed''s: *And she went and called your mother Jochebed, and she gave her wages, and she nursed you* (Jubilees 47:8). Exodus tells the same overturning — the mother is hired to raise her own child: *And Pharaoh''s daughter said unto her, Take this child away, and nurse it for me, and I will give thee thy wages. And the woman took the child, and nursed it* (Exodus 2:9). And the naming follows: *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water* (Exodus 2:10). The one decreed for the river is drawn out of it, returned to his own mother''s arms, and named for the deliverance — the deliverer preserved by the very court that sought his death.',
       sv.verse_id, ev.verse_id, 'extras', 54156
  FROM _session251_ju47_lookup sv, _session251_ju47_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=47 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-47-moses-grown-learned-refused-court',
       E'Moses grown — learned in the court, yet refusing it',
       E'*And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court* (Jubilees 47:9). Stephen''s Moses is the same court-schooled man: *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds* (Acts 7:22). But Hebrews names the refusal at the heart of it — the deliverer would not keep the title the river-court gave him: *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter; choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season* (Hebrews 11:24-25), *esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt: for he had respect unto the recompence of the reward* (Hebrews 11:26). The reproach of Messiah was already in view at the cradle: the rejected-then-exalted deliverer chooses his afflicted brethren over Egypt''s throne.',
       sv.verse_id, ev.verse_id, 'extras', 54159
  FROM _session251_ju47_lookup sv, _session251_ju47_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=47 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-47-slays-egyptian-flees-midian',
       E'He slew the Egyptian, and fled — the deliverer not yet received',
       E'*And you were three weeks of years at court until the time when you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand* (Jubilees 47:10). Exodus tells it the same: *And he spied an Egyptian smiting an Hebrew, one of his brethren... and he slew the Egyptian, and hid him in the sand* (Exodus 2:11-12). The next day the rebuke comes — *And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared* (Exodus 2:14) — exactly Jubilees 47:11, *Who made you a prince and a judge over us?... And you did fear and flee.* Stephen draws out the deliverer rejected by his own: *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not* (Acts 7:25). And Hebrews names the faith of the flight: *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible* (Hebrews 11:27). The deliverer is refused before he delivers — God meant it for good, and Midian becomes the waiting-place until the bush.',
       sv.verse_id, ev.verse_id, 'extras', 54162
  FROM _session251_ju47_lookup sv, _session251_ju47_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=47 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-47-river-decree-tribulation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Jubilees 47:2 retells Pharaoh''s drowning-decree verbatim from the Exodus source it is unfolding.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-river-decree-tribulation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* The three-month hiding of the goodly child in Jubilees 47:3 is the Exodus 2 birth-narrative it quotes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-river-decree-tribulation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen preaches the same casting-out of the male children that Jubilees 47:2 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-river-decree-tribulation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* Jochebed''s three-month hiding in Jubilees 47:3 is the faith that defied Pharaoh''s commandment.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-river-decree-tribulation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 67:52 — *And Pharaoh called to all his servants, saying, Go now and seek throughout the land of Goshen where the children of Israel are, and see that every son born to the Hebrews shall be cast into the river, but every daughter you shall let live.* Jasher preserves the same river-decree Jubilees 47:2 reports.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-river-decree-tribulation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=67 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-47-ark-of-bulrushes-drawn-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:3 — *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink.* The pitch-daubed ark in the flags of Jubilees 47:4 is the Exodus ark of bulrushes itself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-ark-of-bulrushes-drawn-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:5 — *And the daughter of Pharaoh came down to wash herself at the river; and her maidens walked along by the river''s side; and when she saw the ark among the flags, she sent her maid to fetch it.* Tharmuth bathing and sending for the ark in Jubilees 47:5 is Pharaoh''s daughter in Exodus 2:5.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-ark-of-bulrushes-drawn-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:6 — *And when she had opened it, she saw the child: and, behold, the babe wept. And she had compassion on him, and said, This is one of the Hebrews'' children.* Her compassion on the crying babe in Jubilees 47:6 matches Exodus 2:6 exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-ark-of-bulrushes-drawn-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:21 — *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* Stephen condenses the drawing-out and adoption that Jubilees 47:5-6 narrates in detail.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-ark-of-bulrushes-drawn-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 68:13 — *And the woman hastened to take away her son before the officers came, and she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink.* Jasher preserves the same pitch-daubed ark in the flags that Jubilees 47:4 describes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-ark-of-bulrushes-drawn-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=68 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-47-nursed-by-his-own-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:9 — *And Pharaoh''s daughter said unto her, Take this child away, and nurse it for me, and I will give thee thy wages. And the woman took the child, and nursed it.* The wages paid to Jochebed to nurse her own son in Jubilees 47:8 is Exodus 2:9 word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-nursed-by-his-own-mother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:10 — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* Jubilees 47:9, the grown child brought to Pharaoh''s daughter to become her son, is the close of the Exodus 2:10 drawing-out.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-nursed-by-his-own-mother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-47-moses-grown-learned-refused-court
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:22 — *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* The royal-court education and Amram''s teaching of writing in Jubilees 47:9 is the wisdom Stephen credits to Moses.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-moses-grown-learned-refused-court'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:24 — *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter.* The boy made son of Pharaoh''s daughter in Jubilees 47:9 is the very title Hebrews says the grown Moses refused by faith.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-moses-grown-learned-refused-court'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:26 — *Esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt: for he had respect unto the recompence of the reward.* The royal court Moses enters in Jubilees 47:9 is the Egyptian treasure he later counted less than the reproach of Messiah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-moses-grown-learned-refused-court'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-47-slays-egyptian-flees-midian
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:12 — *And he looked this way and that way, and when he saw that there was no man, he slew the Egyptian, and hid him in the sand.* The slaying of the Egyptian and hiding him in the sand in Jubilees 47:10 is Exodus 2:12 itself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-slays-egyptian-flees-midian'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:14 — *And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* The rebuke and the fearful flight in Jubilees 47:11 quote Exodus 2:14 nearly verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-slays-egyptian-flees-midian'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:25 — *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not.* The brother who turns on Moses in Jubilees 47:11 is Stephen''s portrait of the deliverer rejected by his own.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-slays-egyptian-flees-midian'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* The flight from Pharaoh''s wrath in Jubilees 47:11 is the faith Hebrews credits to Moses'' forsaking of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju47_lookup sv, _session251_ju47_lookup tv
 WHERE t.slug='jubilees-47-slays-egyptian-flees-midian'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=47 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

