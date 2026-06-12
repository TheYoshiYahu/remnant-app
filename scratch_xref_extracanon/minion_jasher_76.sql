-- ----- fragment: minion_jasher_76.sql (session252 jasher 76) -----
-- Source anchor: jasher/jasher ch76. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja76 (view _session252_ja76_lookup). Sort band base 56875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja76_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-76-out-of-cush
  ('jasher', 'jasher', 76, 12, 'canon', 'acts', 7, 29, 'free', E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* Stephen frames the same long exile-before-the-call that Jasher fills with the Cush years, Moses a stranger far from his brethren until the appointed time.'),
  -- thread: jasher-76-midian-well
  ('jasher', 'jasher', 76, 13, 'canon', 'exodus', 2, 15, 'free', E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* Jasher''s Moses sits at the same Midian well, fleeing the same Pharaoh.'),
  ('jasher', 'jasher', 76, 15, 'canon', 'exodus', 2, 16, 'free', E'Exodus 2:16 — *Now the priest of Midian had seven daughters: and they came and drew water, and filled the troughs to water their father''s flock.* The seven daughters drawing water for the flock are the very women Jasher 76:14-15 names as Reuel''s seven daughters.'),
  ('jasher', 'jasher', 76, 16, 'canon', 'exodus', 2, 17, 'free', E'Exodus 2:17 — *And the shepherds came and drove them away: but Moses stood up and helped them, and watered their flock.* The same shepherds, the same rescue, the same watered flock as Jasher 76:16.'),
  ('jasher', 'jasher', 76, 19, 'canon', 'exodus', 2, 20, 'free', E'Exodus 2:20 — *And he said unto his daughters, And where is he? why is it that ye have left the man? call him, that he may eat bread.* Reuel''s reproach and summons to eat bread is the same line Jasher 76:19-20 puts in his mouth.'),
  ('jasher', 'jasher', 76, 13, 'jubilees', 'jubilees', 48, 1, 'extras', E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* The live Jubilees apparatus dates the same Midian sojourn Jasher 76:13 begins.'),
  -- thread: jasher-76-zipporah
  ('jasher', 'jasher', 76, 23, 'canon', 'exodus', 2, 21, 'free', E'Exodus 2:21 — *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* Jasher''s Zipporah who sustains Moses with bread and water is the same daughter of Reuel the canon gives him to wife.'),
  -- thread: jasher-76-israel-cry
  ('jasher', 'jasher', 76, 24, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The same severity of hard work over Israel that Jasher 76:24 describes.'),
  ('jasher', 'jasher', 76, 26, 'canon', 'exodus', 2, 23, 'free', E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* Israel''s cry reaching Elohim is the very prayer Jasher 76:26 says Yahuah hearkened to.'),
  ('jasher', 'jasher', 76, 26, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The covenant remembered is why Yahuah hearkens to the people''s prayer in Jasher 76:26.'),
  ('jasher', 'jasher', 76, 24, 'canon', 'hebrews', 11, 25, 'free', E'Hebrews 11:25 — *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season.* Moses'' choice by faith to side with the afflicted people of Jasher 76:24 rather than Egypt''s throne.'),
  -- thread: jasher-76-pharaoh-hardened
  ('jasher', 'jasher', 76, 27, 'canon', 'exodus', 2, 25, 'free', E'Exodus 2:25 — *And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them.* Even as Pharaoh hardens his neck and increases the yoke in Jasher 76:27, Yahuah is already regarding the afflicted seed.'),
  ('jasher', 'jasher', 76, 27, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The embittered lives and increased yoke of Jasher 76:27 are Exodus''s own words for the bondage.'),
  ('jasher', 'jasher', 76, 34, 'jubilees', 'jubilees', 48, 7, 'extras', E'Jubilees 48:7 — *And everything took place according to your words; ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel). And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage.* The bodily plague on Pharaoh in Jasher 76:34 foreshadows the ten covenant-judgments Jubilees records on Egypt.'),
  -- thread: jasher-76-pharaoh-dies
  ('jasher', 'jasher', 76, 59, 'canon', 'exodus', 2, 23, 'free', E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The death of the king of Egypt that Jasher 76:59 narrates is the canon''s own turning-point toward deliverance.'),
  ('jasher', 'jasher', 76, 61, 'canon', 'exodus', 4, 19, 'free', E'Exodus 4:19 — *And Yahuah (LORD) said unto Moses in Midian, Go, return into Egypt: for all the men are dead which sought thy life.* Because Yahuah requited the Pharaoh evil for his evil in Jasher 76:61, the men who sought Moses'' life are dead and the way back to Egypt is opened.'),
  ('jasher', 'jasher', 76, 59, 'canon', 'acts', 7, 30, 'free', E'Acts 7:30 — *And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush.* The death that closes Jasher 76 sets the stage for the burning-bush call Stephen narrates next.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja76_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja76_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-76-out-of-cush',
       E'Moses leaves Cush — the appointed time draws near',
       E'Jasher closes the legendary Cush-kingship: *So Moses went forth from the land of Cush, and went home and ceased to reign over Cush, and Moses was sixty-six years old when he went out of the land of Cush, for the thing was from Yahuah (the Lord), for the period had arrived which he had appointed in the days of old, to bring forth Israel from the affliction of the children of Ham* (Jasher 76:12). The throne of Cush is Jasher''s own expansion with no canon parallel, but the line the text leans on — *for the thing was from Yahuah* and *the period had arrived which he had appointed* — is the canon''s own clock: the deliverer is being driven back toward the people in bondage. Acts measures the same forty-year span before the bush: *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons* (Acts 7:29). It ain''t new — the appointed deliverance is already running on Yahuah''s schedule.',
       sv.verse_id, ev.verse_id, 'extras', 56875
  FROM _session252_ja76_lookup sv, _session252_ja76_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=76 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-76-midian-well',
       E'Moses to Midian — the well, Reuel''s daughters, the shepherds driven off',
       E'Now Jasher rejoins Exodus exactly: *So Moses went to Midian, for he was afraid to return to Egypt on account of Pharaoh, and he went and sat at a well of water in Midian* (Jasher 76:13). The scene is Exodus 2 nearly word for word: *But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well* (Exodus 2:15). The seven daughters, the shepherds, the watered flock — *And they came to the well and drew water to water their father''s flock* (Jasher 76:15) — answer *Now the priest of Midian had seven daughters: and they came and drew water, and filled the troughs to water their father''s flock* (Exodus 2:16); and *So the shepherds of Midian came and drove them away, and Moses rose up and helped them and watered the flock* (Jasher 76:16) answers *And the shepherds came and drove them away: but Moses stood up and helped them, and watered their flock* (Exodus 2:17). Reuel''s question is the same: *And Reuel said to his daughters, And where is he? therefore have you left the man?* (Jasher 76:19) carries *And he said unto his daughters, And where is he? why is it that ye have left the man? call him, that he may eat bread* (Exodus 2:20). Jubilees marks the same sojourn: *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year* (Jubilees 48:1). It ain''t new — every beat is the canon''s own.',
       sv.verse_id, ev.verse_id, 'extras', 56878
  FROM _session252_ja76_lookup sv, _session252_ja76_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=76 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-76-zipporah',
       E'Zipporah — Reuel''s daughter who sustains Moses',
       E'Jasher adds a legendary prison decade but binds it to the canon''s marriage: *And they took and put him into the prison house, and Moses was in prison ten years, and whilst Moses was in the prison house, Zipporah the daughter of Reuel took pity over him, and supported him with bread and water all the time* (Jasher 76:23). Exodus gives the plain canon end of the courtship: *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter* (Exodus 2:21). The prison is Jasher''s own embellishment, but Zipporah, daughter of the Midianite priest, is the canon woman Moses weds — the seed kept, the deliverer''s household formed in exile.',
       sv.verse_id, ev.verse_id, 'extras', 56881
  FROM _session252_ja76_lookup sv, _session252_ja76_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=76 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-76-israel-cry',
       E'Israel''s cry under the bondage reaches Yahuah',
       E'While Moses is in exile, Jasher turns the camera to Egypt: *And all the children of Israel were yet in the land of Egypt serving the Egyptians in all manner of hard work, and the hand of Egypt continued in severity over the children of Israel in those days* (Jasher 76:24). This is Exodus 1''s rigour: *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour* (Exodus 1:14). And their cry rising is Exodus 2: *For Yahuah (the Lord) had hearkened to the prayer of his people the children of Israel, and their cry reached him on account of their hard work* (Jasher 76:26) carries *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage* (Exodus 2:23) and *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24). Hebrews names the faith that joins the deliverer to that suffering people: *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season* (Hebrews 11:25). The covenant remembered, the seed kept — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56884
  FROM _session252_ja76_lookup sv, _session252_ja76_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=76 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-76-pharaoh-hardened',
       E'Pharaoh smitten, yet his heart hardened against Israel',
       E'Jasher gives the old Pharaoh a leprous judgment, but the theology is the canon''s hardening-of-heart: *Still his anger did not turn from them, and the hand of Pharaoh was still stretched out against the children of Israel, and Pharaoh hardened his neck before Yahuah (the Lord), and he increased his yoke over the children of Israel, and embittered their lives with all manner of hard work* (Jasher 76:27). The embittered lives are Exodus 1: *And they made their lives bitter with hard bondage, in morter, and in brick* (Exodus 1:14); and Yahuah''s regard for the afflicted is Exodus 2: *And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them* (Exodus 2:25). The plagues on this Pharaoh''s body — *And Pharaoh was ten years afflicted with that plague, still the heart of Pharaoh was more hardened against the children of Israel* (Jasher 76:34) — foreshadow the ten judgments to come on Egypt''s gods; Jubilees names them: *ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel)* (Jubilees 48:7).',
       sv.verse_id, ev.verse_id, 'extras', 56887
  FROM _session252_ja76_lookup sv, _session252_ja76_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=76 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-76-pharaoh-dies',
       E'The king of Egypt dies — the bar to return is lifted',
       E'Jasher closes with the old Pharaoh''s wretched death and his son Adikam succeeding: *And at the end of three years, the king died, in shame, disgrace, and disgust, and his servants carried him and buried him in the sepulcher of the kings of Egypt in Zoan Mizraim* (Jasher 76:59), *For this evil was from Yahuah (the Lord) to him, for Yahuah (the Lord) had requited him evil for the evil which in his days he had done to Israel* (Jasher 76:61). This is the canon hinge of Exodus 2: *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage* (Exodus 2:23); and it removes the very bar that kept Moses in Midian, which is why the call can come: *And Yahuah (LORD) said unto Moses in Midian, Go, return into Egypt: for all the men are dead which sought thy life* (Exodus 4:19). Acts ties the forty-year exile to the bush that follows: *And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush* (Acts 7:30). It ain''t new — the death of the tyrant is the canon''s own door to the deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 56890
  FROM _session252_ja76_lookup sv, _session252_ja76_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=59
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=76 AND ev.verse_number=62
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-76-out-of-cush
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* Stephen frames the same long exile-before-the-call that Jasher fills with the Cush years, Moses a stranger far from his brethren until the appointed time.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-out-of-cush'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-76-midian-well
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* Jasher''s Moses sits at the same Midian well, fleeing the same Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-midian-well'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:16 — *Now the priest of Midian had seven daughters: and they came and drew water, and filled the troughs to water their father''s flock.* The seven daughters drawing water for the flock are the very women Jasher 76:14-15 names as Reuel''s seven daughters.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-midian-well'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:17 — *And the shepherds came and drove them away: but Moses stood up and helped them, and watered their flock.* The same shepherds, the same rescue, the same watered flock as Jasher 76:16.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-midian-well'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 2:20 — *And he said unto his daughters, And where is he? why is it that ye have left the man? call him, that he may eat bread.* Reuel''s reproach and summons to eat bread is the same line Jasher 76:19-20 puts in his mouth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-midian-well'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* The live Jubilees apparatus dates the same Midian sojourn Jasher 76:13 begins.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-midian-well'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-76-zipporah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:21 — *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* Jasher''s Zipporah who sustains Moses with bread and water is the same daughter of Reuel the canon gives him to wife.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-zipporah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-76-israel-cry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The same severity of hard work over Israel that Jasher 76:24 describes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-israel-cry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* Israel''s cry reaching Elohim is the very prayer Jasher 76:26 says Yahuah hearkened to.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-israel-cry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The covenant remembered is why Yahuah hearkens to the people''s prayer in Jasher 76:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-israel-cry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:25 — *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season.* Moses'' choice by faith to side with the afflicted people of Jasher 76:24 rather than Egypt''s throne.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-israel-cry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-76-pharaoh-hardened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:25 — *And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them.* Even as Pharaoh hardens his neck and increases the yoke in Jasher 76:27, Yahuah is already regarding the afflicted seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-pharaoh-hardened'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The embittered lives and increased yoke of Jasher 76:27 are Exodus''s own words for the bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-pharaoh-hardened'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 48:7 — *And everything took place according to your words; ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel). And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage.* The bodily plague on Pharaoh in Jasher 76:34 foreshadows the ten covenant-judgments Jubilees records on Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-pharaoh-hardened'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=34
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-76-pharaoh-dies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The death of the king of Egypt that Jasher 76:59 narrates is the canon''s own turning-point toward deliverance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-pharaoh-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 4:19 — *And Yahuah (LORD) said unto Moses in Midian, Go, return into Egypt: for all the men are dead which sought thy life.* Because Yahuah requited the Pharaoh evil for his evil in Jasher 76:61, the men who sought Moses'' life are dead and the way back to Egypt is opened.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-pharaoh-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:30 — *And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush.* The death that closes Jasher 76 sets the stage for the burning-bush call Stephen narrates next.'
  FROM cross_reference_threads t, cross_references x, _session252_ja76_lookup sv, _session252_ja76_lookup tv
 WHERE t.slug='jasher-76-pharaoh-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=76 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

