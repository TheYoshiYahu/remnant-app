-- ----- fragment: minion_jasher_80.sql (session252 jasher 80) -----
-- Source anchor: jasher/jasher ch80. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja80 (view _session252_ja80_lookup). Sort band base 56975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja80_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-80-let-my-people-go
  ('jasher', 'jasher', 80, 1, 'canon', 'exodus', 7, 16, 'free', E'Exodus 7:16 — *And thou shalt say unto him, Yahuah Elohim (The LORD God) of the Hebrews hath sent me unto thee, saying, Let my people go, that they may serve me in the wilderness: and, behold, hitherto thou wouldest not hear.* The same charge Jasher 80:1 retells — Moses sent again to bring Israel out.'),
  ('jasher', 'jasher', 80, 2, 'canon', 'exodus', 7, 17, 'free', E'Exodus 7:17 — *Thus saith Yahuah (LORD), In this thou shalt know that I am Yahuah (LORD): behold, I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood.* Pharaoh''s refusal to hearken to the voice of Yahuah in Jasher 80:2 is the refusal to know the Name.'),
  ('jasher', 'jasher', 80, 2, 'jubilees', 'jubilees', 48, 4, 'extras', E'Jubilees 48:4 — *And I delivered you out of his hand, and you did perform the signs and wonders which you were sent to perform in Egypt against Pharaoh, and against all his house, and against his servants and his people.* Jubilees names the same sending against Pharaoh and his subjects that Jasher 80:2 records.'),
  -- thread: jasher-80-blood-frogs-lice
  ('jasher', 'jasher', 80, 3, 'canon', 'exodus', 7, 19, 'free', E'Exodus 7:19 — *And Yahuah (LORD) spake unto Moses, Say unto Aaron, Take thy rod, and stretch out thine hand upon the waters of Egypt, upon their streams, upon their rivers, and upon their ponds, and upon all their pools of water, that they may become blood; and that there may be blood throughout all the land of Egypt, both in vessels of wood, and in vessels of stone.* The blood-by-the-hand-of-Aaron of Jasher 80:3 is Exodus'' own first plague.'),
  ('jasher', 'jasher', 80, 6, 'canon', 'exodus', 8, 3, 'free', E'Exodus 8:3 — *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed, and into the house of thy servants, and upon thy people, and into thine ovens, and into thy kneadingtroughs:* The frogs filling the Egyptians'' houses in Jasher 80:6 match Exodus'' second plague.'),
  ('jasher', 'jasher', 80, 10, 'canon', 'exodus', 8, 16, 'free', E'Exodus 8:16 — *And Yahuah (LORD) said unto Moses, Say unto Aaron, Stretch out thy rod, and smite the dust of the land, that it may become lice throughout all the land of Egypt.* The dust turned to lice in Jasher 80:10 is Exodus'' third plague.'),
  ('jasher', 'jasher', 80, 6, 'canon', 'psalms', 105, 30, 'free', E'Psalm 105:30 — *Their land brought forth frogs in abundance, in the chambers of their kings.* The Psalmist recites the same frog-plague Jasher 80:6 narrates.'),
  -- thread: jasher-80-swarms-pestilence-boils
  ('jasher', 'jasher', 80, 13, 'canon', 'exodus', 8, 22, 'free', E'Exodus 8:22 — *And I will sever in that day the land of Goshen, in which my people dwell, that no swarms of flies shall be there; to the end thou mayest know that I am Yahuah (LORD) in the midst of the earth.* The swarms loosed on all Egypt in Jasher 80:13 are Exodus'' swarm-plague, with Goshen kept apart.'),
  ('jasher', 'jasher', 80, 26, 'canon', 'exodus', 9, 4, 'free', E'Exodus 9:4 — *And Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt: and there shall nothing die of all that is the children''s of Yashar''el (Israel).* Jasher 80:26''s Goshen herds untouched while Egypt''s perish is Exodus'' own severing — election kept.'),
  ('jasher', 'jasher', 80, 27, 'canon', 'exodus', 9, 9, 'free', E'Exodus 9:9 — *And it shall become small dust in all the land of Egypt, and shall be a boil breaking forth with blains upon man, and upon beast, throughout all the land of Egypt.* The burning inflammation bursting the Egyptians'' skin in Jasher 80:27 is the plague of boils.'),
  ('jasher', 'jasher', 80, 24, 'jubilees', 'jubilees', 48, 5, 'extras', E'Jubilees 48:5 — *And Yahuah (God) executed a great vengeance on them for Yashar''el''s (Israel''s) sake, and smote them through (the plagues of) blood and frogs, lice and dog-flies, and malignant boils breaking forth in blains; and their cattle by death; and by hail-stones, thereby He destroyed everything that grew for them; and by locusts which devoured the residue which had been left by the hail, and by darkness; and (by the death) of the first-born of men and animals, and on all their idols Yahuah (God) took vengeance and burned them with fire.* Jubilees catalogs the same plague-sequence — pestilence on the cattle included — that Jasher 80:24-27 narrates.'),
  -- thread: jasher-80-hail-locusts-darkness
  ('jasher', 'jasher', 80, 31, 'canon', 'exodus', 9, 24, 'free', E'Exodus 9:24 — *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* The mingling fire amidst the hail of Jasher 80:31 is Exodus'' seventh plague exactly.'),
  ('jasher', 'jasher', 80, 35, 'canon', 'exodus', 10, 19, 'free', E'Exodus 10:19 — *And Yahuah (LORD) turned a mighty strong west wind, which took away the locusts, and cast them into the Red sea; there remained not one locust in all the coasts of Egypt.* The sea-wind thrusting the locusts into the Red Sea in Jasher 80:35 is Exodus'' own ending of the locust-plague.'),
  ('jasher', 'jasher', 80, 36, 'canon', 'exodus', 10, 22, 'free', E'Exodus 10:22 — *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days:* The three days of darkness over Egypt and Pathros in Jasher 80:36 is the ninth plague.'),
  ('jasher', 'jasher', 80, 30, 'canon', 'psalms', 78, 47, 'free', E'Psalm 78:47 — *He destroyed their vines with hail, and their sycomore trees with frost.* The hail smiting the Egyptians'' vines and fruit trees in Jasher 80:30 is the judgment Asaph rehearses.'),
  -- thread: jasher-80-passover-firstborn
  ('jasher', 'jasher', 80, 41, 'canon', 'exodus', 12, 13, 'free', E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The ''make your Passover... I will pass over you'' of Jasher 80:41 is the very ordinance of Exodus 12.'),
  ('jasher', 'jasher', 80, 41, 'canon', 'exodus', 12, 14, 'free', E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* Torah stands — the feast Jasher 80:41 commands Israel to celebrate is kept for ever.'),
  ('jasher', 'jasher', 80, 43, 'canon', 'exodus', 12, 29, 'free', E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* The midnight smiting of the firstborn in Jasher 80:43 is Exodus'' tenth plague word for word.'),
  ('jasher', 'jasher', 80, 44, 'canon', 'exodus', 12, 30, 'free', E'Exodus 12:30 — *And Pharaoh rose up in the night, he, and all his servants, and all the Egyptians; and there was a great cry in Egypt; for there was not a house where there was not one dead.* Pharaoh rising and the houseless-of-the-living of Jasher 80:44 is Exodus'' great cry.'),
  ('jasher', 'jasher', 80, 41, 'jubilees', 'jubilees', 49, 3, 'extras', E'Jubilees 49:3 — *And this is the sign which Yahuah (God) gave them: Into every house on the lintels of which they saw the blood of a lamb of the first year, into (that) house they should not enter to slay, but should pass by (it), that all those should be saved that were in the house because the sign of the blood was on its lintels.* Jubilees keeps the same blood-sign Passover Jasher 80:41 commands.'),
  -- thread: jasher-80-judgment-on-the-gods
  ('jasher', 'jasher', 80, 51, 'canon', 'exodus', 12, 12, 'free', E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The ten plagues Moses counts in Jasher 80:51 are Yahuah''s judgment on the gods of Egypt.'),
  ('jasher', 'jasher', 80, 51, 'canon', 'numbers', 33, 4, 'free', E'Numbers 33:4 — *For the Egyptians buried all their firstborn, which Yahuah (LORD) had smitten among them: upon their gods also Yahuah (LORD) executed judgments.* The same verdict on Egypt''s gods stands behind the ten plagues of Jasher 80:51.'),
  ('jasher', 'jasher', 80, 51, 'jubilees', 'jubilees', 48, 7, 'extras', E'Jubilees 48:7 — *And everything took place according to your words; ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel). And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage.* Jubilees counts the same ten judgments Moses tallies in Jasher 80:51.'),
  -- thread: jasher-80-exodus-with-josephs-bones
  ('jasher', 'jasher', 80, 61, 'canon', 'exodus', 12, 36, 'free', E'Exodus 12:36 — *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* The vessels of silver and gold and the stripping of Egypt in Jasher 80:61 is Exodus'' spoiling.'),
  ('jasher', 'jasher', 80, 62, 'canon', 'exodus', 13, 19, 'free', E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* Moses bringing up Joseph''s coffin in Jasher 80:62 is the keeping of this oath.'),
  ('jasher', 'jasher', 80, 62, 'canon', 'genesis', 50, 25, 'free', E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The deathbed oath Moses fulfills in Jasher 80:62 was sworn here, generations before.'),
  ('jasher', 'jasher', 80, 59, 'canon', 'psalms', 105, 37, 'free', E'Psalm 105:37 — *He brought them forth also with silver and gold: and there was not one feeble person among their tribes.* The great riches by which Israel goes forth in Jasher 80:59 is the Psalmist''s same departure with silver and gold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja80_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja80_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-let-my-people-go',
       E'Let My People Go — Pharaoh Will Not Hearken',
       E'Jasher opens the deliverance with the demand and the hardened heart: *And at the end of two years, Yahuah (the Lord) again sent Moses to Pharaoh to bring forth the children of Israel, and to send them out of the land of Egypt.* (Jasher 80:1) — *And Moses went and came to the house of Pharaoh, and he spoke to him the words of Yahuah (the Lord) who had sent him, but Pharaoh would not hearken to the voice of Yahuah (the Lord), and Elohim (God) roused his might in Egypt upon Pharaoh and his subjects, and Elohim smote Pharaoh and his people with very great and sore plagues.* (Jasher 80:2). It ain''t new — Exodus carries the same word and the same refusal: *And thou shalt say unto him, Yahuah Elohim (The LORD God) of the Hebrews hath sent me unto thee, saying, Let my people go, that they may serve me in the wilderness: and, behold, hitherto thou wouldest not hear.* (Exodus 7:16). The Name itself is the issue Pharaoh would not bow to: *Thus saith Yahuah (LORD), In this thou shalt know that I am Yahuah (LORD)* (Exodus 7:17). Jubilees tells the very same sending and signs: *And I delivered you out of his hand, and you did perform the signs and wonders which you were sent to perform in Egypt against Pharaoh, and against all his house, and against his servants and his people.* (Jubilees 48:4).',
       sv.verse_id, ev.verse_id, 'extras', 56975
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-blood-frogs-lice',
       E'Blood, Frogs, and Lice — the First Plagues',
       E'Jasher walks the plagues in order. The waters become blood: *And Yahuah (the Lord) sent by the hand of Aaron and turned all the waters of Egypt into blood, with all their streams and rivers.* (Jasher 80:3). Then the frogs: *And Yahuah (the Lord) sent again and caused all their waters to bring forth frogs, and all the frogs came into the houses of the Egyptians.* (Jasher 80:6). Then the lice: *And he sent and smote their dust to lice, and the lice became in Egypt to the height of two cubits upon the earth.* (Jasher 80:10). Each is the Exodus account amplified: *Take thy rod, and stretch out thine hand upon the waters of Egypt... that they may become blood* (Exodus 7:19); *the river shall bring forth frogs abundantly, which shall go up and come into thine house* (Exodus 8:3); *smite the dust of the land, that it may become lice* (Exodus 8:16). The Psalmist sings the same judgments back: *He turned their waters into blood, and slew their fish. Their land brought forth frogs in abundance, in the chambers of their kings.* (Psalm 105:29-30).',
       sv.verse_id, ev.verse_id, 'extras', 56978
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-swarms-pestilence-boils',
       E'Swarms, Pestilence, and Boils — Goshen Severed',
       E'The wild swarms come: *And Yahuah (the Lord) sent all kinds of beasts of the field into Egypt, and they came and destroyed all Egypt, man and beast, and trees, and all things that were in Egypt.* (Jasher 80:13). Then the murrain on the cattle, with Israel''s flocks kept whole: *And there remained of the cattle of the Egyptians only one in ten, and of the cattle belonging to Israel in Goshen not one died.* (Jasher 80:26). Then the boils: *And Elohim sent a burning inflammation in the flesh of the Egyptians, which burst their skins, and it became a severe itch in all the Egyptians from the soles of their feet to the crowns of their heads.* (Jasher 80:27). Exodus carries the swarms severed at Goshen — *I will sever in that day the land of Goshen, in which my people dwell, that no swarms of flies shall be there* (Exodus 8:22) — the murrain — *Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt* (Exodus 9:4) — and the boil: *a boil breaking forth with blains upon man, and upon beast* (Exodus 9:9). Jubilees lists the whole sequence in one breath: *and smote them through (the plagues of) blood and frogs, lice and dog-flies, and malignant boils breaking forth in blains; and their cattle by death* (Jubilees 48:5).',
       sv.verse_id, ev.verse_id, 'extras', 56981
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-hail-locusts-darkness',
       E'Hail, Locusts, and Three Days of Darkness',
       E'The hail with fire mingled: *And Yahuah (the Lord) sent a very heavy hail, which smote their vines and broke their fruit trees and dried them up that they fell upon them.* (Jasher 80:30) — *Also every green herb became dry and perished, for a mingling fire descended amidst the hail, therefore the hail and the fire consumed all things.* (Jasher 80:31). Then the locusts, swept into the Red Sea: *And Yahuah (the Lord) turned a mighty wind of the sea which took away all the locusts, even those that were salted, and thrust them into the Red Sea; not one locust remained within the boundaries of Egypt.* (Jasher 80:35). Then the darkness: *And Elohim sent darkness upon Egypt, that the whole land of Egypt and Pathros became dark for three days, so that a man could not see his hand when he lifted it to his mouth.* (Jasher 80:36). Exodus carries each: *fire mingled with the hail, very grievous* (Exodus 9:24); the west wind *took away the locusts, and cast them into the Red sea; there remained not one locust in all the coasts of Egypt* (Exodus 10:19); and *a thick darkness in all the land of Egypt three days* (Exodus 10:22).',
       sv.verse_id, ev.verse_id, 'extras', 56984
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-passover-firstborn',
       E'Keep the Passover — the Firstborn Smitten',
       E'Jasher gives the Passover command and the night of the tenth plague: *And the days of darkness passed away, and Yahuah (the Lord) sent Moses and Aaron to the children of Israel, saying, Celebrate your feast and make your Passover, for behold I come in the midst of the night amongst all the Egyptians, and I will smite all their first born, from the first born of a man to the first born of a beast, and when I see your Passover, I will pass over you.* (Jasher 80:41) — then *And it came to pass in the middle of the night, that Yahuah (the Lord) went forth in the midst of Egypt, and smote all the first born of the Egyptians, from the first born of man to the first born of beast.* (Jasher 80:43), and *for there was not a house in which there was not a corpse.* (Jasher 80:44). It ain''t new — this is the ordinance kept forever: *when I see the blood, I will pass over you* (Exodus 12:13); *at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt* (Exodus 12:29); *for there was not a house where there was not one dead* (Exodus 12:30). Torah stands — the feast is eternal: *ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). Jubilees keeps the same Passover sign: *Into every house on the lintels of which they saw the blood of a lamb of the first year, into (that) house they should not enter to slay, but should pass by (it)* (Jubilees 49:3).',
       sv.verse_id, ev.verse_id, 'extras', 56987
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=41
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-judgment-on-the-gods',
       E'Judgment on the Gods of Egypt',
       E'Jasher counts the full tally as Moses speaks it to Bathia: *And Moses said to her, Surely ten plagues did Yahuah (the Lord) bring upon Egypt; did any evil accrue to you from any of them? did one of them affect you? and she said, No.* (Jasher 80:51). The plagues were not random calamity but Yahuah''s verdict on Egypt''s idols and her gods. Exodus names the target: *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* (Exodus 12:12). Numbers seals it at the burying of the firstborn: *upon their gods also Yahuah (LORD) executed judgments* (Numbers 33:4). And Jubilees says the same — the idols themselves were burned: *and on all their idols Yahuah (God) took vengeance and burned them with fire.* (Jubilees 48:5). Ten great judgments, Jubilees counts them too: *ten great and terrible judgments came on the land of Egypt* (Jubilees 48:7).',
       sv.verse_id, ev.verse_id, 'extras', 56990
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=51
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-80-exodus-with-josephs-bones',
       E'The Covenant Oath, the Spoiling, and Joseph''s Bones',
       E'Pharaoh at last drives them out, and the riches flow according to the ancient oath: *And all the Egyptians sent the Israelites forth, with great riches, sheep and oxen and precious things, according to the oath of Yahuah (the Lord) between him and our Father Abraham.* (Jasher 80:59) — *And the children of Israel asked of the Egyptians, vessels of silver, and vessels of gold, and garments, and the children of Israel stripped the Egyptians.* (Jasher 80:61). And Moses keeps the deathbed oath of Joseph: *And Moses hastened and rose up and went to the river of Egypt, and brought up from from there the coffin of Joseph and took it with him.* (Jasher 80:62). The covenant kept is the spine — Exodus carries the spoiling — *they borrowed of the Egyptians jewels of silver, and jewels of gold, and raiment... And they spoiled the Egyptians* (Exodus 12:35-36) — and the bones — *And Moses took the bones of Joseph with him* (Exodus 13:19), the oath first sworn in Genesis: *Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). The seed kept, the promise to Abraham remembered.',
       sv.verse_id, ev.verse_id, 'extras', 56993
  FROM _session252_ja80_lookup sv, _session252_ja80_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=59
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=80 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-80-let-my-people-go
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:16 — *And thou shalt say unto him, Yahuah Elohim (The LORD God) of the Hebrews hath sent me unto thee, saying, Let my people go, that they may serve me in the wilderness: and, behold, hitherto thou wouldest not hear.* The same charge Jasher 80:1 retells — Moses sent again to bring Israel out.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 7:17 — *Thus saith Yahuah (LORD), In this thou shalt know that I am Yahuah (LORD): behold, I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood.* Pharaoh''s refusal to hearken to the voice of Yahuah in Jasher 80:2 is the refusal to know the Name.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 48:4 — *And I delivered you out of his hand, and you did perform the signs and wonders which you were sent to perform in Egypt against Pharaoh, and against all his house, and against his servants and his people.* Jubilees names the same sending against Pharaoh and his subjects that Jasher 80:2 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-80-blood-frogs-lice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:19 — *And Yahuah (LORD) spake unto Moses, Say unto Aaron, Take thy rod, and stretch out thine hand upon the waters of Egypt, upon their streams, upon their rivers, and upon their ponds, and upon all their pools of water, that they may become blood; and that there may be blood throughout all the land of Egypt, both in vessels of wood, and in vessels of stone.* The blood-by-the-hand-of-Aaron of Jasher 80:3 is Exodus'' own first plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-blood-frogs-lice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 8:3 — *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed, and into the house of thy servants, and upon thy people, and into thine ovens, and into thy kneadingtroughs:* The frogs filling the Egyptians'' houses in Jasher 80:6 match Exodus'' second plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-blood-frogs-lice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 8:16 — *And Yahuah (LORD) said unto Moses, Say unto Aaron, Stretch out thy rod, and smite the dust of the land, that it may become lice throughout all the land of Egypt.* The dust turned to lice in Jasher 80:10 is Exodus'' third plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-blood-frogs-lice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 105:30 — *Their land brought forth frogs in abundance, in the chambers of their kings.* The Psalmist recites the same frog-plague Jasher 80:6 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-blood-frogs-lice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-80-swarms-pestilence-boils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 8:22 — *And I will sever in that day the land of Goshen, in which my people dwell, that no swarms of flies shall be there; to the end thou mayest know that I am Yahuah (LORD) in the midst of the earth.* The swarms loosed on all Egypt in Jasher 80:13 are Exodus'' swarm-plague, with Goshen kept apart.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-swarms-pestilence-boils'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:4 — *And Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt: and there shall nothing die of all that is the children''s of Yashar''el (Israel).* Jasher 80:26''s Goshen herds untouched while Egypt''s perish is Exodus'' own severing — election kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-swarms-pestilence-boils'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 9:9 — *And it shall become small dust in all the land of Egypt, and shall be a boil breaking forth with blains upon man, and upon beast, throughout all the land of Egypt.* The burning inflammation bursting the Egyptians'' skin in Jasher 80:27 is the plague of boils.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-swarms-pestilence-boils'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:5 — *And Yahuah (God) executed a great vengeance on them for Yashar''el''s (Israel''s) sake, and smote them through (the plagues of) blood and frogs, lice and dog-flies, and malignant boils breaking forth in blains; and their cattle by death; and by hail-stones, thereby He destroyed everything that grew for them; and by locusts which devoured the residue which had been left by the hail, and by darkness; and (by the death) of the first-born of men and animals, and on all their idols Yahuah (God) took vengeance and burned them with fire.* Jubilees catalogs the same plague-sequence — pestilence on the cattle included — that Jasher 80:24-27 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-swarms-pestilence-boils'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=24
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-80-hail-locusts-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:24 — *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* The mingling fire amidst the hail of Jasher 80:31 is Exodus'' seventh plague exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-hail-locusts-darkness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 10:19 — *And Yahuah (LORD) turned a mighty strong west wind, which took away the locusts, and cast them into the Red sea; there remained not one locust in all the coasts of Egypt.* The sea-wind thrusting the locusts into the Red Sea in Jasher 80:35 is Exodus'' own ending of the locust-plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-hail-locusts-darkness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 10:22 — *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days:* The three days of darkness over Egypt and Pathros in Jasher 80:36 is the ninth plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-hail-locusts-darkness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 78:47 — *He destroyed their vines with hail, and their sycomore trees with frost.* The hail smiting the Egyptians'' vines and fruit trees in Jasher 80:30 is the judgment Asaph rehearses.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-hail-locusts-darkness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-80-passover-firstborn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The ''make your Passover... I will pass over you'' of Jasher 80:41 is the very ordinance of Exodus 12.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-passover-firstborn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* Torah stands — the feast Jasher 80:41 commands Israel to celebrate is kept for ever.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-passover-firstborn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* The midnight smiting of the firstborn in Jasher 80:43 is Exodus'' tenth plague word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-passover-firstborn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:30 — *And Pharaoh rose up in the night, he, and all his servants, and all the Egyptians; and there was a great cry in Egypt; for there was not a house where there was not one dead.* Pharaoh rising and the houseless-of-the-living of Jasher 80:44 is Exodus'' great cry.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-passover-firstborn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 49:3 — *And this is the sign which Yahuah (God) gave them: Into every house on the lintels of which they saw the blood of a lamb of the first year, into (that) house they should not enter to slay, but should pass by (it), that all those should be saved that were in the house because the sign of the blood was on its lintels.* Jubilees keeps the same blood-sign Passover Jasher 80:41 commands.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-passover-firstborn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=41
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-80-judgment-on-the-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The ten plagues Moses counts in Jasher 80:51 are Yahuah''s judgment on the gods of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-judgment-on-the-gods'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 33:4 — *For the Egyptians buried all their firstborn, which Yahuah (LORD) had smitten among them: upon their gods also Yahuah (LORD) executed judgments.* The same verdict on Egypt''s gods stands behind the ten plagues of Jasher 80:51.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-judgment-on-the-gods'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 48:7 — *And everything took place according to your words; ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel). And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage.* Jubilees counts the same ten judgments Moses tallies in Jasher 80:51.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-judgment-on-the-gods'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=51
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-80-exodus-with-josephs-bones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:36 — *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* The vessels of silver and gold and the stripping of Egypt in Jasher 80:61 is Exodus'' spoiling.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-exodus-with-josephs-bones'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* Moses bringing up Joseph''s coffin in Jasher 80:62 is the keeping of this oath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-exodus-with-josephs-bones'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The deathbed oath Moses fulfills in Jasher 80:62 was sworn here, generations before.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-exodus-with-josephs-bones'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 105:37 — *He brought them forth also with silver and gold: and there was not one feeble person among their tribes.* The great riches by which Israel goes forth in Jasher 80:59 is the Psalmist''s same departure with silver and gold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja80_lookup sv, _session252_ja80_lookup tv
 WHERE t.slug='jasher-80-exodus-with-josephs-bones'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=80 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

