-- ----- fragment: minion_jasher_71.sql (session252 jasher 71) -----
-- Source anchor: jasher/jasher ch71. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja71 (view _session252_ja71_lookup). Sort band base 56750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja71_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-71-slays-the-egyptian
  ('jasher', 'jasher', 71, 1, 'canon', 'exodus', 2, 11, 'free', E'Exodus 2:11 — *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren.* The same going-out to see his kin''s burdens that Jasher 71:1 sets at Goshen.'),
  ('jasher', 'jasher', 71, 3, 'canon', 'exodus', 2, 12, 'free', E'Exodus 2:12 — *And he looked this way and that way, and when he saw that there was no man, he slew the Egyptian, and hid him in the sand.* Word for word the deed of Jasher 71:3 — he saw no man, smote the Egyptian, hid him in the sand.'),
  ('jasher', 'jasher', 71, 3, 'canon', 'acts', 7, 24, 'free', E'Acts 7:24 — *And seeing one of them suffer wrong, he defended him, and avenged him that was oppressed, and smote the Egyptian.* Stephen retells Jasher 71:3 as Moses delivering the oppressed Hebrew from his smiter.'),
  ('jasher', 'jasher', 71, 1, 'canon', 'hebrews', 11, 24, 'free', E'Hebrews 11:24 — *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter.* The faith that drives Jasher''s Moses out of the king''s house and down to his brethren''s burdens (Jasher 71:1).'),
  ('jasher', 'jasher', 71, 3, 'jubilees', 'jubilees', 47, 10, 'extras', E'Jubilees 47:10 — *And you were three weeks of years at court until the time when you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand.* Jubilees carries the identical scene that Jasher 71:1-3 expands.'),
  -- thread: jasher-71-who-made-thee-judge
  ('jasher', 'jasher', 71, 7, 'canon', 'exodus', 2, 13, 'free', E'Exodus 2:13 — *And when he went out the second day, behold, two men of the Hebrews strove together: and he said to him that did the wrong, Wherefore smitest thou thy fellow?* The second-day quarrel of Jasher 71:7, the same reproof to the wrongdoer.'),
  ('jasher', 'jasher', 71, 8, 'canon', 'exodus', 2, 14, 'free', E'Exodus 2:14 — *And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* Almost verbatim the retort and Moses'' fear of Jasher 71:8.'),
  ('jasher', 'jasher', 71, 8, 'canon', 'acts', 7, 27, 'free', E'Acts 7:27 — *But he that did his neighbour wrong thrust him away, saying, Who made thee a ruler and a judge over us?* Stephen''s witness to the rejection Jasher 71:8 records — the deliverer refused by his own.'),
  ('jasher', 'jasher', 71, 8, 'jubilees', 'jubilees', 47, 11, 'extras', E'Jubilees 47:11 — *And on the second day you did find two of the children of Yashar''el (Israel) striving together, and you did say to him who was doing the wrong: "Why do you smite your brother? And he was angry and indignant, and said “Who made you a prince and a judge over us? Thinkest you to kill me as you killedst the Egyptian yesterday?” And you did fear and flee on account of these words.* Jubilees gives the same exchange and the flight that follows Jasher 71:8.'),
  -- thread: jasher-71-pharaoh-seeks-to-slay-moses
  ('jasher', 'jasher', 71, 9, 'canon', 'exodus', 2, 15, 'free', E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* The threat Jasher 71:9 records — Pharaoh hears and seeks Moses'' life — with the flight that Jasher 71:11 frames as an angel-led exit.'),
  ('jasher', 'jasher', 71, 11, 'canon', 'acts', 7, 29, 'free', E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* Moses brought out beyond Egypt''s borders in Jasher 71:11 becomes the stranger in Midian.'),
  ('jasher', 'jasher', 71, 11, 'canon', 'hebrews', 11, 27, 'free', E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* The departure from Egypt in Jasher 71:11 read as faith that does not fear Pharaoh''s wrath.'),
  ('jasher', 'jasher', 71, 11, 'jubilees', 'jubilees', 48, 1, 'extras', E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* Jubilees marks the same departure out of Egypt to Midian that Jasher 71:11 narrates.'),
  -- thread: jasher-71-aaron-cast-away-idols-of-egypt
  ('jasher', 'jasher', 71, 13, 'canon', 'ezekiel', 20, 7, 'free', E'Ezekiel 20:7 — *Then said I unto them, Cast ye away every man the abominations of his eyes, and defile not yourselves with the idols of Egypt: I am Yahuah Elohaychem (the LORD your God).* Nearly verbatim the prophetic call Aaron speaks in Jasher 71:13 — throw away the abominations of the eyes and the idols of Egypt.'),
  ('jasher', 'jasher', 71, 14, 'canon', 'ezekiel', 20, 8, 'free', E'Ezekiel 20:8 — *But they rebelled against me, and would not hearken unto me: they did not every man cast away the abominations of their eyes, neither did they forsake the idols of Egypt: then I said, I will pour out my fury upon them, to accomplish my anger against them in the midst of the land of Egypt.* The very rebellion of Jasher 71:14 — they rebelled and would not hearken.'),
  ('jasher', 'jasher', 71, 13, 'canon', 'acts', 7, 42, 'free', E'Acts 7:42 — *Then Elohim (God) turned, and gave them up to worship the host of heaven; as it is written in the book of the prophets, O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* The same Egypt-bred idolatry Aaron warns against in Jasher 71:13, carried on into the wilderness.'),
  -- thread: jasher-71-covenant-bondage-remembered
  ('jasher', 'jasher', 71, 15, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The same covenant-remembrance with the three patriarchs that stays the LORD''s hand in Jasher 71:15.'),
  ('jasher', 'jasher', 71, 16, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The severe crushing and oppression of Jasher 71:16, named in mortar and brick.'),
  ('jasher', 'jasher', 71, 16, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The bondage of Jasher 71:16 was foretold to Abraham — the affliction is no accident but the covenant word standing.'),
  ('jasher', 'jasher', 71, 16, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen repeats the foretold bondage that Jasher 71:16 shows pressing hardest before deliverance.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja71_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja71_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-71-slays-the-egyptian',
       E'Moses goes out to his brethren and slays the Egyptian',
       E'Jasher 71 opens with the grown Moses going down to his enslaved kin: *And when Moses was eighteen years old, he desired to see his father and mother and he went to them to Goshen, and when Moses had come near Goshen, he came to the place where the children of Israel were engaged in work, and he observed their burdens, and he saw an Egyptian smiting one of his Hebrew brethren* (Jasher 71:1), and *when he saw there was no man there he smote the Egyptian and hid him in the sand, and delivered the Hebrew from the hand of him that smote him* (Jasher 71:3). It ain''t new — this is the Exodus scene itself: *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren* (Exodus 2:11), *and when he saw that there was no man, he slew the Egyptian, and hid him in the sand* (Exodus 2:12). Stephen reads the same act as the deliverer''s hand reached out: *And seeing one of them suffer wrong, he defended him, and avenged him that was oppressed, and smote the Egyptian* (Acts 7:24). The faith behind it is named in Hebrews — Moses *refused to be called the son of Pharaoh''s daughter* (Hebrews 11:24), the chosen seed turning from the kingdom-of-man to his own afflicted people. Jubilees narrates the very same: *you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand* (Jubilees 47:10).',
       sv.verse_id, ev.verse_id, 'extras', 56750
  FROM _session252_ja71_lookup sv, _session252_ja71_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=71 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-71-who-made-thee-judge',
       E'The second day: who set thee for a prince and judge',
       E'On the second day the rejection of the deliverer is spoken aloud: *And on the second day Moses went forth to his brethren, and saw, and behold two men were quarreling, and he said to the wicked one, Why dost you smite your neighbor?* (Jasher 71:7), and the man throws it back — *Who has set you for a prince and judge over us? dost you think to slay me as you did slay the Egyptian? and Moses was afraid and he said, Surely the thing is known?* (Jasher 71:8). The Exodus source matches: *And when he went out the second day, behold, two men of the Hebrews strove together: and he said to him that did the wrong, Wherefore smitest thou thy fellow?* (Exodus 2:13), *And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known* (Exodus 2:14). Stephen weighs the words: they refused the very ruler God was raising — *But he that did his neighbour wrong thrust him away, saying, Who made thee a ruler and a judge over us?* (Acts 7:27). Jubilees tells it the same: *Who made you a prince and a judge over us? Thinkest you to kill me as you killedst the Egyptian yesterday? And you did fear and flee on account of these words* (Jubilees 47:11). The deliverer rejected by his own — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56753
  FROM _session252_ja71_lookup sv, _session252_ja71_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=71 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-71-pharaoh-seeks-to-slay-moses',
       E'Pharaoh seeks Moses'' life; he is brought out of Egypt',
       E'The kingdom-of-man moves to kill the chosen man: *And Pharaoh heard of this affair, and he ordered Moses to be slain, so Elohim (God) sent his angel* (Jasher 71:9), and *the angel of Yahuah (the Lord) took hold of the right hand of Moses, and brought him forth from Egypt, and placed him from without the borders of Egypt, a distance of forty days'' journey* (Jasher 71:11). The canon names the same threat and flight plainly: *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well* (Exodus 2:15). Stephen: *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons* (Acts 7:29). Hebrews reads the flight as faith, not cowardice — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible* (Hebrews 11:27). Where Jasher dresses the rescue with an angel, the pattern is the old one: Pharaoh, like Nimrod and Herod after, seeks to slay the chosen child and the LORD preserves him. Jubilees sets the same departure: *you did depart and dwell in the land of Midian* (Jubilees 48:1).',
       sv.verse_id, ev.verse_id, 'extras', 56756
  FROM _session252_ja71_lookup sv, _session252_ja71_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=71 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-71-aaron-cast-away-idols-of-egypt',
       E'Aaron prophesies: cast away the idols of Egypt',
       E'With Moses gone, Aaron carries the word: *And Aaron his brother alone remained in the land of Egypt, and he prophesied to the children of Israel, saying, Thus says Yahuah Elohim (the Lord God) of your ancestors, Throw away, each man, the abominations of his eyes, and do not defile yourselves with the idols of Egypt* (Jasher 71:13), but *the children of Israel rebelled and would not hearken to Aaron at that time* (Jasher 71:14). It ain''t new — Ezekiel records this very call and rebellion in Egypt almost word for word: *Then said I unto them, Cast ye away every man the abominations of his eyes, and defile not yourselves with the idols of Egypt: I am Yahuah Elohaychem (the LORD your God)* (Ezekiel 20:7), *But they rebelled against me, and would not hearken unto me: they did not every man cast away the abominations of their eyes, neither did they forsake the idols of Egypt* (Ezekiel 20:8). Torah-before-Sinai: the fathers were called to put away Egypt''s host-of-heaven idolatry and keep the way of their ancestors'' God — the same idolatry Stephen says they later carried into the wilderness (*gave them up to worship the host of heaven*, Acts 7:42).',
       sv.verse_id, ev.verse_id, 'extras', 56759
  FROM _session252_ja71_lookup sv, _session252_ja71_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=71 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-71-covenant-bondage-remembered',
       E'The covenant remembered; the bondage foretold to Abraham',
       E'The chapter closes on the covenant holding fast under deepening bondage: *And Yahuah (the Lord) thought to destroy them, were it not that Yahuah (the Lord) remembered the covenant which he had made with Abraham, Isaac and Jacob* (Jasher 71:15); *In those days the hand of Pharaoh continued to be severe against the children of Israel, and he crushed and oppressed them until the time when Elohim sent forth his word and took notice of them* (Jasher 71:16). The Exodus source says it the same: *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24), the bondage being *hard bondage, in morter, and in brick* (Exodus 1:14). And it was no surprise — it was foretold to Abraham generations before: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13), which Stephen repeats — *that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). The covenant kept the seed alive in Egypt; election precedes deliverance. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56762
  FROM _session252_ja71_lookup sv, _session252_ja71_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=71 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-71-slays-the-egyptian
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:11 — *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren.* The same going-out to see his kin''s burdens that Jasher 71:1 sets at Goshen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-slays-the-egyptian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:12 — *And he looked this way and that way, and when he saw that there was no man, he slew the Egyptian, and hid him in the sand.* Word for word the deed of Jasher 71:3 — he saw no man, smote the Egyptian, hid him in the sand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-slays-the-egyptian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:24 — *And seeing one of them suffer wrong, he defended him, and avenged him that was oppressed, and smote the Egyptian.* Stephen retells Jasher 71:3 as Moses delivering the oppressed Hebrew from his smiter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-slays-the-egyptian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:24 — *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter.* The faith that drives Jasher''s Moses out of the king''s house and down to his brethren''s burdens (Jasher 71:1).'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-slays-the-egyptian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 47:10 — *And you were three weeks of years at court until the time when you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand.* Jubilees carries the identical scene that Jasher 71:1-3 expands.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-slays-the-egyptian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-71-who-made-thee-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:13 — *And when he went out the second day, behold, two men of the Hebrews strove together: and he said to him that did the wrong, Wherefore smitest thou thy fellow?* The second-day quarrel of Jasher 71:7, the same reproof to the wrongdoer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-who-made-thee-judge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:14 — *And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* Almost verbatim the retort and Moses'' fear of Jasher 71:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-who-made-thee-judge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:27 — *But he that did his neighbour wrong thrust him away, saying, Who made thee a ruler and a judge over us?* Stephen''s witness to the rejection Jasher 71:8 records — the deliverer refused by his own.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-who-made-thee-judge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 47:11 — *And on the second day you did find two of the children of Yashar''el (Israel) striving together, and you did say to him who was doing the wrong: "Why do you smite your brother? And he was angry and indignant, and said “Who made you a prince and a judge over us? Thinkest you to kill me as you killedst the Egyptian yesterday?” And you did fear and flee on account of these words.* Jubilees gives the same exchange and the flight that follows Jasher 71:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-who-made-thee-judge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-71-pharaoh-seeks-to-slay-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* The threat Jasher 71:9 records — Pharaoh hears and seeks Moses'' life — with the flight that Jasher 71:11 frames as an angel-led exit.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-pharaoh-seeks-to-slay-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* Moses brought out beyond Egypt''s borders in Jasher 71:11 becomes the stranger in Midian.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-pharaoh-seeks-to-slay-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* The departure from Egypt in Jasher 71:11 read as faith that does not fear Pharaoh''s wrath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-pharaoh-seeks-to-slay-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* Jubilees marks the same departure out of Egypt to Midian that Jasher 71:11 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-pharaoh-seeks-to-slay-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-71-aaron-cast-away-idols-of-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 20:7 — *Then said I unto them, Cast ye away every man the abominations of his eyes, and defile not yourselves with the idols of Egypt: I am Yahuah Elohaychem (the LORD your God).* Nearly verbatim the prophetic call Aaron speaks in Jasher 71:13 — throw away the abominations of the eyes and the idols of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-aaron-cast-away-idols-of-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 20:8 — *But they rebelled against me, and would not hearken unto me: they did not every man cast away the abominations of their eyes, neither did they forsake the idols of Egypt: then I said, I will pour out my fury upon them, to accomplish my anger against them in the midst of the land of Egypt.* The very rebellion of Jasher 71:14 — they rebelled and would not hearken.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-aaron-cast-away-idols-of-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:42 — *Then Elohim (God) turned, and gave them up to worship the host of heaven; as it is written in the book of the prophets, O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* The same Egypt-bred idolatry Aaron warns against in Jasher 71:13, carried on into the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-aaron-cast-away-idols-of-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-71-covenant-bondage-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The same covenant-remembrance with the three patriarchs that stays the LORD''s hand in Jasher 71:15.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-covenant-bondage-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The severe crushing and oppression of Jasher 71:16, named in mortar and brick.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-covenant-bondage-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The bondage of Jasher 71:16 was foretold to Abraham — the affliction is no accident but the covenant word standing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-covenant-bondage-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen repeats the foretold bondage that Jasher 71:16 shows pressing hardest before deliverance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja71_lookup sv, _session252_ja71_lookup tv
 WHERE t.slug='jasher-71-covenant-bondage-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=71 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

