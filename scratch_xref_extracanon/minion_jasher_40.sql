-- ----- fragment: minion_jasher_40.sql (session252 jasher 40) -----
-- Source anchor: jasher/jasher ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja40 (view _session252_ja40_lookup). Sort band base 55975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-40-yahuah-confusion-bethchorin
  ('jasher', 'jasher', 40, 5, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* As at the Red Sea, the sons of Jacob cry to the Name and Yahuah Himself routs Bethchorin while they hold their place (Jasher 40:5).'),
  ('jasher', 'jasher', 40, 5, 'canon', 'judges', 7, 22, 'free', E'Judges 7:22 — *And the three hundred blew the trumpets, and Yahuah (LORD) set every man''s sword against his fellow, even throughout all the host: and the host fled to Beth-shittah in Zererath, and to the border of Abel-meholah, unto Tabbath.* The same hand that turned Midian''s swords inward sets the men of Bethchorin smiting each other in the dark (Jasher 40:5).'),
  ('jasher', 'jasher', 40, 7, 'canon', '2-chronicles', 20, 23, 'free', E'2 Chronicles 20:23 — *For the children of Ammon and Moab stood up against the inhabitants of mount Seir, utterly to slay and destroy them: and when they had made an end of the inhabitants of Seir, every one helped to destroy another.* Jehoshaphat''s enemies, like the Chorinites who fought the whole night one man with his brother, destroy themselves once Yahuah sends confusion among them (Jasher 40:7).'),
  -- thread: jasher-40-terror-of-elohim-on-the-cities
  ('jasher', 'jasher', 40, 21, 'canon', 'genesis', 35, 5, 'free', E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The very dread Genesis names is what Jasher shows spreading over all the land so none dares pursue or attack Jacob''s sons (Jasher 40:21).'),
  ('jasher', 'jasher', 40, 10, 'canon', 'exodus', 23, 27, 'free', E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The Canaanites and those beyond Jordan, seized with fear that the same will be done to them, are living out the promise Yahuah later seals for the conquest (Jasher 40:10).'),
  -- thread: jasher-40-few-in-number-elect
  ('jasher', 'jasher', 40, 45, 'canon', 'genesis', 34, 30, 'free', E'Genesis 34:30 — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house.* The dread Jacob spoke after Shechem is exactly the war Jasher 40 narrates — yet the few are not destroyed but feared, no man able to stand before them (Jasher 40:45).'),
  ('jasher', 'jasher', 40, 36, 'canon', 'deuteronomy', 7, 7, 'free', E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people.* That Jacob''s sons send out only sixty-two men against twenty-one kings shows the chosen line preserved while few — the election Moses names (Jasher 40:36).'),
  -- thread: jasher-40-canaanite-kings-sue-for-peace
  ('jasher', 'jasher', 40, 22, 'canon', 'joshua', 9, 1, 'free', E'Joshua 9:1 — *And it came to pass, when all the kings which were on this side Jordan, in the hills, and in the valleys, and in all the coasts of the great sea over against Lebanon, the Hittite, and the Amorite, the Canaanite, the Perizzite, the Hivite, and the Jebusite, heard thereof.* The same roll of Canaanite kings that musters before Joshua is already mustering before Jacob''s sons, hearing of their power and afraid for their lives (Jasher 40:22).'),
  ('jasher', 'jasher', 40, 46, 'canon', 'joshua', 9, 15, 'free', E'Joshua 9:15 — *And Joshua made peace with them, and made a league with them, to let them live: and the princes of the congregation sware unto them.* As Joshua''s generation swears a league of peace with frightened Canaanites, so the sons of Jacob form a covenant of peace and truth at the kings'' plea (Jasher 40:46).'),
  ('jasher', 'jasher', 40, 22, 'canon', 'joshua', 9, 2, 'free', E'Joshua 9:2 — *That they gathered themselves together, to fight with Joshua and with Yashar''el (Israel), with one accord.* The seven and then twenty-one kings who assemble over Jacob''s sons foreshadow the one-accord gathering of Canaan''s kings in Joshua''s day (Jasher 40:22).'),
  -- thread: jasher-40-jubilees-amorite-wars-self-link
  ('jasher', 'jasher', 40, 22, 'jubilees', 'jubilees', 34, 2, 'extras', E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees narrates the identical war — the seven kings against Jacob''s sons that Jasher draws out into the Bethchorin campaign and the kings'' surrender (Jasher 40:22).'),
  ('jasher', 'jasher', 40, 48, 'jubilees', 'jubilees', 34, 8, 'extras', E'Jubilees 34:8 — *And he prevailed over them, and imposed tribute on them that they should pay him tribute, five fruit products of their land, and he built Rôbêl and Tamnâtârês.* The same imposed tribute Jasher records when the sons of Jacob make the Canaanite kings tributary from that day forward (Jasher 40:48).'),
  ('jasher', 'jasher', 40, 52, 'jubilees', 'jubilees', 34, 9, 'extras', E'Jubilees 34:9 — *And he returned in peace, and made peace with them, and they became his servants, until the day that he and his sons went down into Egypt.* Jubilees seals the war with the same lasting peace and servitude that Jasher carries until Israel inherits Canaan (Jasher 40:52).'),
  ('jasher', 'jasher', 40, 19, 'canon', 'genesis', 33, 19, 'free', E'Genesis 33:19 — *And he bought a parcel of a field, where he had spread his tent, at the hand of the children of Hamor, Shechem''s father, for an hundred pieces of money.* The portion of field where Jacob and his sons camp with all the spoil is the very parcel Genesis records him buying from Hamor at Shechem (Jasher 40:19).'),
  ('jasher', 'jasher', 40, 19, 'canon', 'genesis', 48, 22, 'free', E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s deathbed grant of the Shechem portion won from the Amorite is the very war Jasher 40 narrates at length around that field (Jasher 40:19).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-40-yahuah-confusion-bethchorin',
       E'Yahuah sets every man''s sword against his fellow',
       E'When the mighty men of Bethchorin press them in the dark, the sons of Jacob do not trust their own arm: *And all the sons of Jacob were afraid of those men, as they were not accustomed to fight in the dark, and they were greatly confounded, and the sons of Jacob cried to Yahuah (the Lord), saying, Give help to us O Yahuah (O Lord), deliver us that we may not die by the hands of these uncircumcised men* (Jasher 40:4). The answer is not reinforcements but a spirit of perverseness: *And Yahuah (the Lord) hearkened to the voice of the sons of Jacob, and Yahuah (the Lord) caused great terror and confusion to seize the people of Bethchorin, and they fought amongst themselves the one with the other in the darkness of night, and smote each other in great numbers* (Jasher 40:5). It ain''t new — this is the canon''s own war-pattern, where Yahuah fights and the enemy turns the sword on itself. *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14); *And the three hundred blew the trumpets, and Yahuah (LORD) set every man''s sword against his fellow, even throughout all the host* (Judges 7:22); *every one helped to destroy another* (2 Chronicles 20:23). The chosen seed cries the Name and the battle is the LORD''s.',
       sv.verse_id, ev.verse_id, 'extras', 55975
  FROM _session252_ja40_lookup sv, _session252_ja40_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=40 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-40-terror-of-elohim-on-the-cities',
       E'The terror of Elohim upon the surrounding cities',
       E'After the slaughter, the whole land looks on in dread: *And the inhabitants of the land observed them from afar, and all the inhabitants of the land were afraid of the sons of Jacob who had done this thing, for no king from the days of old had ever done the like* (Jasher 40:21). Even the far nations across the Jordan tremble: *And all the inhabitants of the cities of the Canaanites, and all those who were on the other side of the Jordan, were greatly afraid of the sons of Jacob, for they said, Behold the same will be done to us as was done to those cities, for who can stand against their mighty strength?* (Jasher 40:10). This is Genesis 35 unfolded — the supernatural dread that protected the same sons after the Shechem affair, now spread over a whole war. *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob* (Genesis 35:5); the promise stands, *I will send my fear before thee, and will destroy all the people to whom thou shalt come* (Exodus 23:27). The fear of the nations is the LORD''s hedge around the elect line.',
       sv.verse_id, ev.verse_id, 'extras', 55978
  FROM _session252_ja40_lookup sv, _session252_ja40_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=40 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-40-few-in-number-elect',
       E'Few in number, yet none can stand before them',
       E'Jacob feared exactly this war when his sons first drew the sword at Shechem: *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house* (Genesis 34:30). Jasher answers the fear — the few are kept. The kings marvel: *We have heard all that you did to the kings of the Amorites with your sword and exceedingly mighty arm, so that no man could stand up before you* (Jasher 40:45), and Jacob''s sons, knowing the enemy few, do not even all go out: *in the morning the sons of Jacob rose up and chose sixty two of their men, and ten of the sons of Jacob went with them* (Jasher 40:36). This is the election Torah confesses — chosen not for greatness but kept by the Name. *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7). The seed is small and the seed is sure.',
       sv.verse_id, ev.verse_id, 'extras', 55981
  FROM _session252_ja40_lookup sv, _session252_ja40_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=36
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=40 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-40-canaanite-kings-sue-for-peace',
       E'The kings of Canaan gather and beg a covenant of peace',
       E'The whole league of Canaan, terrified, sends word to assemble and submit: *And the seven kings of the Canaanites resolved to make peace with the sons of Jacob, for they were greatly afraid of their lives, on account of the sons of Jacob* (Jasher 40:22). They come and plead: *So we have come to you to form a treaty of peace between us, and now therefore contract with us a covenant of peace and truth, that you will not meddle with us, inasmuch as we have not meddled with you* (Jasher 40:46), and Jacob''s sons grant it and make them tributary (Jasher 40:48). This is the canon''s own scene of Canaan''s kings reacting to Israel — and the very league Joshua later faces. *And it came to pass, when all the kings which were on this side Jordan... the Hittite, and the Amorite, the Canaanite, the Perizzite, the Hivite, and the Jebusite, heard thereof* (Joshua 9:1); *That they gathered themselves together, to fight with Joshua and with Yashar''el (Israel), with one accord* (Joshua 9:2); and as with the sons of Jacob, so with Joshua: *And Joshua made peace with them, and made a league with them, to let them live* (Joshua 9:15). It ain''t new — the kings of Canaan have always sued for peace before the elect.',
       sv.verse_id, ev.verse_id, 'extras', 55984
  FROM _session252_ja40_lookup sv, _session252_ja40_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=40 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-40-jubilees-amorite-wars-self-link',
       E'The seven Amorite kings, the tribute, the field at Shechem',
       E'Jasher 40 closes the war the same way the canon and Jubilees do — tribute imposed and a lasting peace: *And the sons of Jacob swore to them that they would not meddle with them, and all the kings of the Canaanites swore also to them, and the sons of Jacob made them tributary from that day forward* (Jasher 40:48); *And there was peace from that day forward between the sons of Jacob and the kings of the Canaanites, until the children of Israel came to inherit the land of Canaan* (Jasher 40:52). The whole campaign is staged from the parcel Jacob bought at Shechem: *And Jacob and his sons and their servants remained on that night and the next day in the portion of the field which Jacob had purchased from Hamor for five shekels* (Jasher 40:19). Jubilees tells the identical event — the same seven Amorite kings, the same tribute, the same peace. *And the seven kings of the Amorites assembled themselves together against them, to slay them* (Jubilees 34:2); *And he prevailed over them, and imposed tribute on them that they should pay him tribute* (Jubilees 34:8); *And he returned in peace, and made peace with them, and they became his servants, until the day that he and his sons went down into Egypt* (Jubilees 34:9). And the canon names the very ground: *And he bought a parcel of a field, where he had spread his tent, at the hand of the children of Hamor, Shechem''s father* (Genesis 33:19) — the field Jacob bequeaths as won *out of the hand of the Amorite with my sword and with my bow* (Genesis 48:22). Three witnesses, one war: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55987
  FROM _session252_ja40_lookup sv, _session252_ja40_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=40 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-40-yahuah-confusion-bethchorin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* As at the Red Sea, the sons of Jacob cry to the Name and Yahuah Himself routs Bethchorin while they hold their place (Jasher 40:5).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-yahuah-confusion-bethchorin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 7:22 — *And the three hundred blew the trumpets, and Yahuah (LORD) set every man''s sword against his fellow, even throughout all the host: and the host fled to Beth-shittah in Zererath, and to the border of Abel-meholah, unto Tabbath.* The same hand that turned Midian''s swords inward sets the men of Bethchorin smiting each other in the dark (Jasher 40:5).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-yahuah-confusion-bethchorin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 20:23 — *For the children of Ammon and Moab stood up against the inhabitants of mount Seir, utterly to slay and destroy them: and when they had made an end of the inhabitants of Seir, every one helped to destroy another.* Jehoshaphat''s enemies, like the Chorinites who fought the whole night one man with his brother, destroy themselves once Yahuah sends confusion among them (Jasher 40:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-yahuah-confusion-bethchorin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-40-terror-of-elohim-on-the-cities
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The very dread Genesis names is what Jasher shows spreading over all the land so none dares pursue or attack Jacob''s sons (Jasher 40:21).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-terror-of-elohim-on-the-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The Canaanites and those beyond Jordan, seized with fear that the same will be done to them, are living out the promise Yahuah later seals for the conquest (Jasher 40:10).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-terror-of-elohim-on-the-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-40-few-in-number-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:30 — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house.* The dread Jacob spoke after Shechem is exactly the war Jasher 40 narrates — yet the few are not destroyed but feared, no man able to stand before them (Jasher 40:45).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-few-in-number-elect'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people.* That Jacob''s sons send out only sixty-two men against twenty-one kings shows the chosen line preserved while few — the election Moses names (Jasher 40:36).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-few-in-number-elect'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-40-canaanite-kings-sue-for-peace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 9:1 — *And it came to pass, when all the kings which were on this side Jordan, in the hills, and in the valleys, and in all the coasts of the great sea over against Lebanon, the Hittite, and the Amorite, the Canaanite, the Perizzite, the Hivite, and the Jebusite, heard thereof.* The same roll of Canaanite kings that musters before Joshua is already mustering before Jacob''s sons, hearing of their power and afraid for their lives (Jasher 40:22).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-canaanite-kings-sue-for-peace'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 9:15 — *And Joshua made peace with them, and made a league with them, to let them live: and the princes of the congregation sware unto them.* As Joshua''s generation swears a league of peace with frightened Canaanites, so the sons of Jacob form a covenant of peace and truth at the kings'' plea (Jasher 40:46).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-canaanite-kings-sue-for-peace'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 9:2 — *That they gathered themselves together, to fight with Joshua and with Yashar''el (Israel), with one accord.* The seven and then twenty-one kings who assemble over Jacob''s sons foreshadow the one-accord gathering of Canaan''s kings in Joshua''s day (Jasher 40:22).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-canaanite-kings-sue-for-peace'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-40-jubilees-amorite-wars-self-link
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees narrates the identical war — the seven kings against Jacob''s sons that Jasher draws out into the Bethchorin campaign and the kings'' surrender (Jasher 40:22).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-jubilees-amorite-wars-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=22
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 34:8 — *And he prevailed over them, and imposed tribute on them that they should pay him tribute, five fruit products of their land, and he built Rôbêl and Tamnâtârês.* The same imposed tribute Jasher records when the sons of Jacob make the Canaanite kings tributary from that day forward (Jasher 40:48).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-jubilees-amorite-wars-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=48
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 34:9 — *And he returned in peace, and made peace with them, and they became his servants, until the day that he and his sons went down into Egypt.* Jubilees seals the war with the same lasting peace and servitude that Jasher carries until Israel inherits Canaan (Jasher 40:52).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-jubilees-amorite-wars-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=52
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 33:19 — *And he bought a parcel of a field, where he had spread his tent, at the hand of the children of Hamor, Shechem''s father, for an hundred pieces of money.* The portion of field where Jacob and his sons camp with all the spoil is the very parcel Genesis records him buying from Hamor at Shechem (Jasher 40:19).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-jubilees-amorite-wars-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s deathbed grant of the Shechem portion won from the Amorite is the very war Jasher 40 narrates at length around that field (Jasher 40:19).'
  FROM cross_reference_threads t, cross_references x, _session252_ja40_lookup sv, _session252_ja40_lookup tv
 WHERE t.slug='jasher-40-jubilees-amorite-wars-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=40 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

