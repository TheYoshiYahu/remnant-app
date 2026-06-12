-- ----- fragment: minion_jasher_89.sql (session252 jasher 89) -----
-- Source anchor: jasher/jasher ch89. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja89 (view _session252_ja89_lookup). Sort band base 57200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja89_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-89-sun-and-moon-stood-still
  ('jasher', 'jasher', 89, 8, 'canon', 'joshua', 10, 12, 'free', E'Joshua 10:12 — *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon.* This is the very command behind Jasher 89:8''s ''the sun and moon stood still in heaven.'''),
  ('jasher', 'jasher', 89, 8, 'canon', 'joshua', 10, 13, 'free', E'Joshua 10:13 — *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* The canon names THIS book by name — Jasher 89:8 is the passage Scripture points the reader to find.'),
  ('jasher', 'jasher', 89, 8, 'canon', 'joshua', 10, 14, 'free', E'Joshua 10:14 — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* The standing of the sun confirms what Joshua''s song confesses in Jasher 89:8, that Yahuah Himself stood in wrath against the oppressors.'),
  ('jasher', 'jasher', 89, 1, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The song of Joshua in Jasher 89:1 carries forward the song of Moses at the sea — the deliverance song is the song of the fathers, it ain''t new.'),
  ('jasher', 'jasher', 89, 5, 'canon', 'exodus', 15, 2, 'free', E'Exodus 15:2 — *Yahuah (LORD) is my strength and song, and he is become my salvation: he is my Elohim (God), and I will prepare him an habitation; my father''s Elohim (God), and I will exalt him.* Joshua''s confession ''we said you are our Elohim (God), for you were our shelter and strong tower'' (Jasher 89:5) is the same praise Moses sang.'),
  -- thread: jasher-89-trees-by-the-waters-chaff
  ('jasher', 'jasher', 89, 22, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* Joshua''s ''your beloved shall be like trees planted by the waters'' (Jasher 89:22) is the psalm''s image of the kept, planted seed.'),
  ('jasher', 'jasher', 89, 22, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* Joshua''s ''the wicked shall be like chaff driven by the wind'' (Jasher 89:22) is word-for-word the psalm''s verdict on the oppressor''s kingdom.'),
  -- thread: jasher-89-five-kings-cave-feet-on-necks
  ('jasher', 'jasher', 89, 24, 'canon', 'joshua', 10, 16, 'free', E'Joshua 10:16 — *But these five kings fled, and hid themselves in a cave at Makkedah.* The canon names Makkedah for the very cave Jasher 89:24 reports the five kings fleeing to.'),
  ('jasher', 'jasher', 89, 27, 'canon', 'joshua', 10, 24, 'free', E'Joshua 10:24 — *that Joshua called for all the men of Yashar''el (Israel), and said unto the captains of the men of war which went with him, Come near, put your feet upon the necks of these kings. And they came near, and put their feet upon the necks of them.* This is the scene Jasher 89:27 retells, the feet on the necks of the conquered kings.'),
  ('jasher', 'jasher', 89, 27, 'canon', 'joshua', 10, 25, 'free', E'Joshua 10:25 — *And Joshua said unto them, Fear not, nor be dismayed, be strong and of good courage: for thus shall Yahuah (LORD) do to all your enemies against whom ye fight.* Joshua''s word ''So shall Yahuah (the Lord) do to all your enemies'' in Jasher 89:27 is the canon''s own promise.'),
  ('jasher', 'jasher', 89, 28, 'canon', 'joshua', 10, 27, 'free', E'Joshua 10:27 — *And it came to pass at the time of the going down of the sun, that Joshua commanded, and they took them down off the trees, and cast them into the cave wherein they had been hid, and laid great stones in the cave''s mouth, which remain until this very day.* The great stones at the cave''s mouth in Jasher 89:28 match the canon''s sealing of the cave.'),
  -- thread: jasher-89-southern-campaign-cities
  ('jasher', 'jasher', 89, 29, 'canon', 'joshua', 10, 28, 'free', E'Joshua 10:28 — *And that day Joshua took Makkedah, and smote it with the edge of the sword, and the king thereof he utterly destroyed, them, and all the souls that were therein; he let none remain: and he did to the king of Makkedah as he did unto the king of Jericho.* The taking of Makkedah in Jasher 89:29 carries the canon''s southern campaign verse for verse.'),
  ('jasher', 'jasher', 89, 32, 'canon', 'joshua', 10, 5, 'free', E'Joshua 10:5 — *Therefore the five kings of the Amorites, the king of Jerusalem, the king of Hebron, the king of Jarmuth, the king of Lachish, the king of Eglon, gathered themselves together, and went up, they and all their hosts, and encamped before Gibeon, and made war against it.* Lachish, which Jasher 89:32 has Joshua besiege, is among the Amorite coalition the canon names.'),
  ('jasher', 'jasher', 89, 37, 'canon', 'joshua', 10, 14, 'free', E'Joshua 10:14 — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* Jasher 89:37''s ''for Yahuah (the Lord) had fought for Israel'' is the canon''s own confession over the whole campaign.'),
  -- thread: jasher-89-northern-campaign-merom-hazor
  ('jasher', 'jasher', 89, 41, 'canon', 'joshua', 11, 5, 'free', E'Joshua 11:5 — *And when all these kings were met together, they came and pitched together at the waters of Merom, to fight against Yashar''el (Israel).* The gathering at the waters of Merom in Jasher 89:41 is the canon''s northern coalition scene.'),
  ('jasher', 'jasher', 89, 42, 'canon', 'joshua', 11, 6, 'free', E'Joshua 11:6 — *And Yahuah (LORD) said unto Joshua, Be not afraid because of them: for to morrow about this time will I deliver them up all slain before Yashar''el (Israel): thou shalt hough their horses, and burn their chariots with fire.* Yahuah''s assurance in Jasher 89:42 is the canon''s word almost verbatim, down to the houghing of horses.'),
  ('jasher', 'jasher', 89, 39, 'canon', 'joshua', 11, 1, 'free', E'Joshua 11:1 — *And it came to pass, when Jabin king of Hazor had heard those things, that he sent to Jobab king of Madon, and to the king of Shimron, and to the king of Achshaph,* Jabin king of Chazor sending out the call in Jasher 89:39 is the canon''s own muster of the northern kings.'),
  ('jasher', 'jasher', 89, 50, 'canon', 'joshua', 11, 15, 'free', E'Joshua 11:15 — *As Yahuah (LORD) commanded Moses his servant, so did Moses command Joshua, and so did Joshua; he left nothing undone of all that Yahuah (LORD) commanded Moses.* Jasher 89:50''s ''they failed not in anything'' carries the canon''s testimony that the word commanded to Moses was wholly kept.'),
  -- thread: jasher-89-thirty-one-kings-inheritance-land-rested
  ('jasher', 'jasher', 89, 51, 'canon', 'joshua', 12, 24, 'free', E'Joshua 12:24 — *The king of Tirzah, one: all the kings thirty and one.* The ''thirty and one kings'' of Jasher 89:51 is the canon''s exact closing tally of the conquered kings.'),
  ('jasher', 'jasher', 89, 52, 'canon', 'joshua', 12, 6, 'free', E'Joshua 12:6 — *Them did Moses the servant of Yahuah (LORD) and the children of Yashar''el (Israel) smite: and Moses the servant of Yahuah (LORD) gave it for a possession unto the Reubenites, and the Gadites, and the half tribe of Manasseh.* Jasher 89:52''s Transjordan inheritance for Reuben, Gad, and half Manasseh is the canon''s own division by Moses.'),
  ('jasher', 'jasher', 89, 54, 'canon', 'joshua', 11, 23, 'free', E'Joshua 11:23 — *So Joshua took the whole land, according to all that Yahuah (LORD) said unto Moses; and Joshua gave it for an inheritance unto Yashar''el (Israel) according to their divisions by their tribes. And the land rested from war.* Jasher 89:54''s land grown tranquil from battle is the canon''s ''the land rested from war'' — the seed at rest in its inheritance.'),
  ('jasher', 'jasher', 89, 52, 'canon', 'deuteronomy', 34, 4, 'free', E'Deuteronomy 34:4 — *And Yahuah (LORD) said unto him, This is the land which I sware unto Abraham, unto Isaac, and unto Jacob, saying, I will give it unto thy seed: I have caused thee to see it with thine eyes, but thou shalt not go over thither.* The inheritance Moses parcels in Jasher 89:52 is the land Yahuah sware to the fathers'' seed — the covenant promise kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja89_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja89_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-89-sun-and-moon-stood-still',
       E'The song of Joshua and the sun and moon stood still — ''is not this written in the book of Jasher?''',
       E'Jasher opens its final chapter with the song Joshua sang on the day of the great victory: *Then spoke Joshua this song, on the day that Yahuah (the Lord) had given the Amorites into the hand of Joshua and the children of Israel, and he said in the sight of all Israel,* (Jasher 89:1), and at its heart stands the wonder the canon itself names this very book to confirm: *The sun and moon stood still in heaven, and you did stand in your wrath against our oppressors and did command your judgments over them.* (Jasher 89:8). Come and see — this is the scene Scripture sends you HERE to read: *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* (Joshua 10:13). The canon''s own naming of ''the book of Jasher'' lands on this chapter. It ain''t new — the deliverance song is the song of the fathers; as Moses sang at the sea, *I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* (Exodus 15:1), so Joshua sings, *My goodness and my fortress, my high tower, I will sing a new song to you* (Jasher 89:3). Yahuah is the strength of the salvation, the man of war who fights for His seed.',
       sv.verse_id, ev.verse_id, 'extras', 57200
  FROM _session252_ja89_lookup sv, _session252_ja89_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=89 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-89-trees-by-the-waters-chaff',
       E'The wicked like chaff, the beloved like trees planted by the waters',
       E'Joshua''s song closes on the two ways: *Thus shall all your enemies perish O Yahuah (O Lord), and the wicked shall be like chaff driven by the wind, and your beloved shall be like trees planted by the waters.* (Jasher 89:22). It ain''t new — this is the opening psalm''s own picture of the righteous and the ungodly, the wheat and the tares of the seed-war. Come and see: *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3), while *The ungodly are not so: but are like the chaff which the wind driveth away.* (Psalm 1:4). The beloved seed is kept and planted; the kingdom of the oppressor is scattered.',
       sv.verse_id, ev.verse_id, 'extras', 57203
  FROM _session252_ja89_lookup sv, _session252_ja89_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=89 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-89-five-kings-cave-feet-on-necks',
       E'The five kings hidden in the cave and the feet upon their necks',
       E'Jasher retells, scene for scene, the canon''s account of the five Amorite kings: *And the five kings fled alone on foot from battle, and hid themselves in a cave, and Joshua sought for them in the field of battle, and did not find them.* (Jasher 89:24), and then the charge to the captains: *And Joshua called to all Israel and said to the officers of battle, Place your feet upon the necks of these kings, and Joshua said, So shall Yahuah (the Lord) do to all your enemies.* (Jasher 89:27). Come and see the source it carries: *But these five kings fled, and hid themselves in a cave at Makkedah.* (Joshua 10:16); *that Joshua called for all the men of Yashar''el (Israel), and said unto the captains of the men of war which went with him, Come near, put your feet upon the necks of these kings. And they came near, and put their feet upon the necks of them.* (Joshua 10:24); *for thus shall Yahuah (LORD) do to all your enemies against whom ye fight.* (Joshua 10:25). And the great stones sealed at the cave''s mouth match the canon exactly — *And Joshua commanded afterward that they should slay the kings and cast them into the cave, and to put great stones at the mouth of the cave.* (Jasher 89:28) beside *and laid great stones in the cave''s mouth, which remain until this very day.* (Joshua 10:27). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57206
  FROM _session252_ja89_lookup sv, _session252_ja89_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=89 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-89-southern-campaign-cities',
       E'The southern campaign — Makkedah, Libnah, Lachish, Eglon, Hebron, Debir',
       E'Jasher marches city by city through the conquest of the south: *And Joshua went afterward with all the people that were with him on that day to Makkedah, and he smote it with the edge of the sword.* (Jasher 89:29); *And from there he passed on to Lachish to fight against it, and Horam king of Gaza went up to assist the men of Lachish, and Joshua smote him and his people until there was none left to him.* (Jasher 89:32); and the summary line, *And Joshua smote all the kings of the Amorites from Kadesh-barnea to Azah, and he took their country at once, for Yahuah (the Lord) had fought for Israel.* (Jasher 89:37). Come and see the canon retold here: *And that day Joshua took Makkedah, and smote it with the edge of the sword, and the king thereof he utterly destroyed, them, and all the souls that were therein; he let none remain: and he did to the king of Makkedah as he did unto the king of Jericho.* (Joshua 10:28). The pattern is one — done to each as to Jericho — for Yahuah fought for His seed. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57209
  FROM _session252_ja89_lookup sv, _session252_ja89_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=29
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=89 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-89-northern-campaign-merom-hazor',
       E'The northern coalition at the waters of Merom — Jabin of Hazor',
       E'Jasher turns north to the great coalition gathered against Israel: *And all these kings hearkened to the words of Jabin, king of Chazor, and they went forth with all their camps, seventeen kings, and their people were as numerous as the sand on the sea shore, together with horses and chariots innumerable, and they came and pitched together at the waters of Merom, and they were met together to fight against Israel.* (Jasher 89:41), and Yahuah''s word of assurance: *And Yahuah (the Lord) said to Joshua, Fear them not, for tomorrow about this time I will deliver them up all slain before you, you shall hough their horses and burn their chariots with fire.* (Jasher 89:42). Come and see the canon retold almost word for word: *And when all these kings were met together, they came and pitched together at the waters of Merom, to fight against Yashar''el (Israel).* (Joshua 11:5); *And Yahuah (LORD) said unto Joshua, Be not afraid because of them: for to morrow about this time will I deliver them up all slain before Yashar''el (Israel): thou shalt hough their horses, and burn their chariots with fire.* (Joshua 11:6). And the obedience that fails not — *As Yahuah (the Lord) had commanded Moses so did Joshua and all Israel, they failed not in anything.* (Jasher 89:50) — matches *he left nothing undone of all that Yahuah (LORD) commanded Moses.* (Joshua 11:15). Torah stands; the word commanded to Moses is kept. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57212
  FROM _session252_ja89_lookup sv, _session252_ja89_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=39
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=89 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-89-thirty-one-kings-inheritance-land-rested',
       E'Thirty and one kings smitten, the land divided to the tribes, and rest from war',
       E'Jasher closes the whole book on the tally and the inheritance: *So Joshua and all the children of Israel smote the whole land of Canaan as Yahuah (the Lord) had commanded them, and smote all their kings, being thirty and one kings, and the children of Israel took their whole country.* (Jasher 89:51), with the Transjordan already given by Moses — *Besides the kingdoms of Sihon and Og which are on the other side Jordan, of which Moses had smitten many cities, and Moses gave them to the Reubenites and the Gadites and to half the tribe of Manasseh.* (Jasher 89:52) — and the west given to the rest of the tribes (Jasher 89:53), and at last the land at rest: *and the land became tranquil from battle throughout the cities of the Amorites and the Canaanites.* (Jasher 89:54). Come and see the canon''s own count and rest: *The king of Tirzah, one: all the kings thirty and one.* (Joshua 12:24); *Them did Moses the servant of Yahuah (LORD) and the children of Yashar''el (Israel) smite: and Moses the servant of Yahuah (LORD) gave it for a possession unto the Reubenites, and the Gadites, and the half tribe of Manasseh.* (Joshua 12:6); *So Joshua took the whole land, according to all that Yahuah (LORD) said unto Moses; and Joshua gave it for an inheritance unto Yashar''el (Israel) according to their divisions by their tribes. And the land rested from war.* (Joshua 11:23). The twelve-tribe covenant people receive their inheritance — the seed kept, the promise to the fathers come to rest. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57215
  FROM _session252_ja89_lookup sv, _session252_ja89_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=51
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=89 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-89-sun-and-moon-stood-still
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 10:12 — *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon.* This is the very command behind Jasher 89:8''s ''the sun and moon stood still in heaven.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-sun-and-moon-stood-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 10:13 — *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* The canon names THIS book by name — Jasher 89:8 is the passage Scripture points the reader to find.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-sun-and-moon-stood-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 10:14 — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* The standing of the sun confirms what Joshua''s song confesses in Jasher 89:8, that Yahuah Himself stood in wrath against the oppressors.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-sun-and-moon-stood-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The song of Joshua in Jasher 89:1 carries forward the song of Moses at the sea — the deliverance song is the song of the fathers, it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-sun-and-moon-stood-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 15:2 — *Yahuah (LORD) is my strength and song, and he is become my salvation: he is my Elohim (God), and I will prepare him an habitation; my father''s Elohim (God), and I will exalt him.* Joshua''s confession ''we said you are our Elohim (God), for you were our shelter and strong tower'' (Jasher 89:5) is the same praise Moses sang.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-sun-and-moon-stood-still'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-89-trees-by-the-waters-chaff
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* Joshua''s ''your beloved shall be like trees planted by the waters'' (Jasher 89:22) is the psalm''s image of the kept, planted seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-trees-by-the-waters-chaff'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* Joshua''s ''the wicked shall be like chaff driven by the wind'' (Jasher 89:22) is word-for-word the psalm''s verdict on the oppressor''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-trees-by-the-waters-chaff'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-89-five-kings-cave-feet-on-necks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 10:16 — *But these five kings fled, and hid themselves in a cave at Makkedah.* The canon names Makkedah for the very cave Jasher 89:24 reports the five kings fleeing to.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-five-kings-cave-feet-on-necks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 10:24 — *that Joshua called for all the men of Yashar''el (Israel), and said unto the captains of the men of war which went with him, Come near, put your feet upon the necks of these kings. And they came near, and put their feet upon the necks of them.* This is the scene Jasher 89:27 retells, the feet on the necks of the conquered kings.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-five-kings-cave-feet-on-necks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 10:25 — *And Joshua said unto them, Fear not, nor be dismayed, be strong and of good courage: for thus shall Yahuah (LORD) do to all your enemies against whom ye fight.* Joshua''s word ''So shall Yahuah (the Lord) do to all your enemies'' in Jasher 89:27 is the canon''s own promise.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-five-kings-cave-feet-on-necks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 10:27 — *And it came to pass at the time of the going down of the sun, that Joshua commanded, and they took them down off the trees, and cast them into the cave wherein they had been hid, and laid great stones in the cave''s mouth, which remain until this very day.* The great stones at the cave''s mouth in Jasher 89:28 match the canon''s sealing of the cave.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-five-kings-cave-feet-on-necks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-89-southern-campaign-cities
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 10:28 — *And that day Joshua took Makkedah, and smote it with the edge of the sword, and the king thereof he utterly destroyed, them, and all the souls that were therein; he let none remain: and he did to the king of Makkedah as he did unto the king of Jericho.* The taking of Makkedah in Jasher 89:29 carries the canon''s southern campaign verse for verse.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-southern-campaign-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 10:5 — *Therefore the five kings of the Amorites, the king of Jerusalem, the king of Hebron, the king of Jarmuth, the king of Lachish, the king of Eglon, gathered themselves together, and went up, they and all their hosts, and encamped before Gibeon, and made war against it.* Lachish, which Jasher 89:32 has Joshua besiege, is among the Amorite coalition the canon names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-southern-campaign-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 10:14 — *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel).* Jasher 89:37''s ''for Yahuah (the Lord) had fought for Israel'' is the canon''s own confession over the whole campaign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-southern-campaign-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-89-northern-campaign-merom-hazor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 11:5 — *And when all these kings were met together, they came and pitched together at the waters of Merom, to fight against Yashar''el (Israel).* The gathering at the waters of Merom in Jasher 89:41 is the canon''s northern coalition scene.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-northern-campaign-merom-hazor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 11:6 — *And Yahuah (LORD) said unto Joshua, Be not afraid because of them: for to morrow about this time will I deliver them up all slain before Yashar''el (Israel): thou shalt hough their horses, and burn their chariots with fire.* Yahuah''s assurance in Jasher 89:42 is the canon''s word almost verbatim, down to the houghing of horses.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-northern-campaign-merom-hazor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 11:1 — *And it came to pass, when Jabin king of Hazor had heard those things, that he sent to Jobab king of Madon, and to the king of Shimron, and to the king of Achshaph,* Jabin king of Chazor sending out the call in Jasher 89:39 is the canon''s own muster of the northern kings.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-northern-campaign-merom-hazor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 11:15 — *As Yahuah (LORD) commanded Moses his servant, so did Moses command Joshua, and so did Joshua; he left nothing undone of all that Yahuah (LORD) commanded Moses.* Jasher 89:50''s ''they failed not in anything'' carries the canon''s testimony that the word commanded to Moses was wholly kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-northern-campaign-merom-hazor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-89-thirty-one-kings-inheritance-land-rested
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 12:24 — *The king of Tirzah, one: all the kings thirty and one.* The ''thirty and one kings'' of Jasher 89:51 is the canon''s exact closing tally of the conquered kings.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-thirty-one-kings-inheritance-land-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 12:6 — *Them did Moses the servant of Yahuah (LORD) and the children of Yashar''el (Israel) smite: and Moses the servant of Yahuah (LORD) gave it for a possession unto the Reubenites, and the Gadites, and the half tribe of Manasseh.* Jasher 89:52''s Transjordan inheritance for Reuben, Gad, and half Manasseh is the canon''s own division by Moses.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-thirty-one-kings-inheritance-land-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 11:23 — *So Joshua took the whole land, according to all that Yahuah (LORD) said unto Moses; and Joshua gave it for an inheritance unto Yashar''el (Israel) according to their divisions by their tribes. And the land rested from war.* Jasher 89:54''s land grown tranquil from battle is the canon''s ''the land rested from war'' — the seed at rest in its inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-thirty-one-kings-inheritance-land-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 34:4 — *And Yahuah (LORD) said unto him, This is the land which I sware unto Abraham, unto Isaac, and unto Jacob, saying, I will give it unto thy seed: I have caused thee to see it with thine eyes, but thou shalt not go over thither.* The inheritance Moses parcels in Jasher 89:52 is the land Yahuah sware to the fathers'' seed — the covenant promise kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja89_lookup sv, _session252_ja89_lookup tv
 WHERE t.slug='jasher-89-thirty-one-kings-inheritance-land-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=89 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

