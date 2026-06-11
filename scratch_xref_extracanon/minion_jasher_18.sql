-- ----- fragment: minion_jasher_18.sql (session252 jasher 18) -----
-- Source anchor: jasher/jasher ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja18 (view _session252_ja18_lookup). Sort band base 55425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-18-circumcision-eternal-sign
  ('jasher', 'jasher', 18, 1, 'canon', 'genesis', 17, 13, 'free', E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jasher''s circumcising of the household and those bought with money is Genesis 17''s everlasting-covenant command obeyed.'),
  ('jasher', 'jasher', 18, 2, 'canon', 'genesis', 17, 25, 'free', E'Genesis 17:25 — *And Ishmael his son was thirteen years old, when he was circumcised in the flesh of his foreskin.* Jasher gives Ishmael''s exact age, thirteen, straight from the Genesis source it retells.'),
  ('jasher', 'jasher', 18, 1, 'canon', 'romans', 4, 11, 'free', E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:* Abraham''s obedience in Jasher 18:1 is the sign sealing a righteousness already counted by faith.'),
  ('jasher', 'jasher', 18, 2, 'jubilees', 'jubilees', 15, 30, 'extras', E'Jubilees 15:30 — *For Ishmael and his sons and his brothers and Esau, Yahuah (God) did not cause to approach Him, and he chose them not because they are the children of Abraham, because He knew them, but He chose Yashar''el (Israel) to be His people.* Ishmael is circumcised in the flesh yet the covenant seed runs through the chosen line, as Jubilees declares of this same household.'),
  -- thread: jasher-18-three-visitors-mamre
  ('jasher', 'jasher', 18, 4, 'canon', 'genesis', 18, 1, 'free', E'Genesis 18:1 — *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* Jasher''s appearing at the plain of Mamre with Abraham at the tent door in the sun''s heat is Genesis 18 retold.'),
  ('jasher', 'jasher', 18, 4, 'canon', 'genesis', 18, 2, 'free', E'Genesis 18:2 — *And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground,* the three men, the lifted eyes, the running and bowing of Jasher 18:4 come straight from this verse.'),
  ('jasher', 'jasher', 18, 7, 'canon', 'genesis', 18, 6, 'free', E'Genesis 18:6 — *And Abraham hastened into the tent unto Sarah, and said, Make ready quickly three measures of fine meal, knead it, and make cakes upon the hearth.* Jasher''s instruction to Sarah for three measures of fine meal is this Genesis command word for word.'),
  ('jasher', 'jasher', 18, 9, 'canon', 'genesis', 18, 10, 'free', E'Genesis 18:10 — *And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* The promise in Jasher 18:9 of a return according to the time of life and a son for Sarah is Genesis 18:10.'),
  ('jasher', 'jasher', 18, 4, 'canon', 'hebrews', 13, 2, 'free', E'Hebrews 13:2 — *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares.* Abraham receiving the three ministering angels as travelers in Jasher 18:4 is the very entertaining of angels unawares the apostle commends.'),
  ('jasher', 'jasher', 18, 9, 'jubilees', 'jubilees', 16, 1, 'extras', E'Jubilees 16:1 — *And on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife.* Jubilees narrates the identical Mamre visit and announcement of a son that Jasher 18:9 records.'),
  -- thread: jasher-18-sodom-cities-of-man
  ('jasher', 'jasher', 18, 11, 'canon', 'ezekiel', 16, 49, 'free', E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* Jasher''s catalog of Sodom''s provoking abominations names the same iniquity Ezekiel exposes.'),
  ('jasher', 'jasher', 18, 16, 'canon', 'ezekiel', 16, 49, 'free', E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* The plundering of the stranger''s goods in Jasher 18:16 is exactly the failure to strengthen the hand of the poor and needy.'),
  ('jasher', 'jasher', 18, 11, 'canon', '2-peter', 2, 6, 'free', E'2 Peter 2:6 — *And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly;* the exceeding wickedness of Sodom in Jasher 18:11 is set forth by Peter as the ensample of the ungodly''s end.'),
  ('jasher', 'jasher', 18, 14, 'canon', 'jude', 1, 7, 'free', E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The festival fornication of Jasher 18:14 is the very giving over to fornication Jude marks for eternal fire.'),
  -- thread: jasher-18-sodom-perverse-justice
  ('jasher', 'jasher', 18, 34, 'canon', 'genesis', 19, 9, 'free', E'Genesis 19:9 — *And they said, Stand back. And they said again, This one fellow came in to sojourn, and he will needs be a judge: now will we deal worse with thee, than with them. And they pressed sore upon the man, even Lot, and came near to break the door.* Sodom''s hatred of the sojourner and of right judgment, behind Hedad''s crooked bench in Jasher 18:34, is what Genesis shows turning on Lot.'),
  ('jasher', 'jasher', 18, 41, 'canon', 'luke', 17, 28, 'free', E'Luke 17:28 — *Likewise also as it was in the days of Lot; they did eat, they drank, they bought, they sold, they planted, they builded;* the buying, selling and feasting that crowns Sodom''s robbery of the stranger in Jasher 18 is the days-of-Lot heedlessness Yahusha names before the fire.'),
  ('jasher', 'jasher', 18, 41, 'jubilees', 'jubilees', 16, 5, 'extras', E'Jubilees 16:5 — *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day...* the wickedness Jasher dramatizes in the Hedad tale is what Jubilees says brought fire and brimstone on the whole region of the Jordan.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-18-circumcision-eternal-sign',
       E'The flesh of the foreskin — the eternal sign kept',
       E'Jasher opens with Abraham obeying to the letter: *And Abraham rose and did all that Elohim (God) had ordered him, and he took the men of his household and those bought with his money, and he circumcised them as Yahuah (the Lord) had commanded him* (Jasher 18:1), and *there was not one left whom he did not circumcise, and Abraham and his son Ishmael were circumcised in the flesh of their foreskin; thirteen years old was Ishmael when he was circumcised in the flesh of his foreskin* (Jasher 18:2). This is Genesis retold, not invented: *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant* (Genesis 17:13), and *Ishmael his son was thirteen years old, when he was circumcised in the flesh of his foreskin* (Genesis 17:25). Paul reads the sign rightly — the covenant token sealing a faith Abraham already had: *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe* (Romans 4:11). Jubilees carries the same election that follows in this very scene — the sign marks the chosen seed, not every son of Abraham''s flesh: *For Ishmael and his sons and his brothers and Esau, Yahuah (God) did not cause to approach Him, and he chose them not because they are the children of Abraham, because He knew them, but He chose Yashar''el (Israel) to be His people* (Jubilees 15:30). Torah stands; the sign is everlasting, not abolished — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55425
  FROM _session252_ja18_lookup sv, _session252_ja18_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=18 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-18-three-visitors-mamre',
       E'Three men at the door of Mamre — the promise of a son',
       E'Healing in the heat of the third day, Abraham keeps the way of welcome: *And Yahuah (the Lord) appeared to him in the plain of Mamre, and sent three of his ministering angels to visit him... and he lifted his eyes and saw, and lo three men were coming from a distance, and he rose up and ran to meet them, and he bowed down to them and brought them into his house* (Jasher 18:4); he gives them water for their feet under the tree (Jasher 18:5), runs for a calf tender and good (Jasher 18:6), and bids Sarah *Make ready quickly three measures of fine meal* (Jasher 18:7) — then comes the word: *one of them said to him, I will return to you according to the time of life, and Sarah your wife shall have a son* (Jasher 18:9). This is Genesis 18 told nearly verse for verse: *And Yahuah (LORD) appeared unto him in the plains of Mamre... And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground* (Genesis 18:1-2), *Make ready quickly three measures of fine meal, knead it, and make cakes upon the hearth* (Genesis 18:6), and *I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* (Genesis 18:10). Hebrews names what Abraham did: *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2). Jubilees narrates the very same visit and promise: *And on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife* (Jubilees 16:1). The seed of promise, Isaac, is announced — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55428
  FROM _session252_ja18_lookup sv, _session252_ja18_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=18 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-18-sodom-cities-of-man',
       E'Sodom''s abominations — the kingdom of man''s cities ripe for judgment',
       E'Jasher turns from the chosen seed to the cities of the plain: *In those days all the people of Sodom and Gomorrah, and of the whole five cities, were exceedingly wicked and sinful against Yahuah (the Lord) and they provoked Yahuah (the Lord) with their abominations* (Jasher 18:11). Their festivals were rape and plunder — *in the time of rejoicing they would all rise and lay hold of their neighbor''s wives... and each man saw his wife and daughter in the hands of his neighbor and did not say a word* (Jasher 18:14) — and the stranger who came to trade was stripped bare: *the people of these cities would assemble... and go to the man and take his goods by force* (Jasher 18:16). This is the canon''s Sodom, whose true iniquity Ezekiel names: *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy* (Ezekiel 16:49). Peter sets the cities forth as a warning: *And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly* (2 Peter 2:6), and Jude: *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire* (Jude 1:7). These are the kingdom-of-man''s cities — Nimrod''s pattern of the tyrant city — ripe before Yahuah; the chosen seed dwells apart at Mamre. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55431
  FROM _session252_ja18_lookup sv, _session252_ja18_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=18 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-18-sodom-perverse-justice',
       E'Hedad and the bench of Sodom — justice turned to robbery',
       E'Jasher fills in what the canon only implies of Sodom''s lawlessness: the legend of the traveler robbed of his mantle and cord by Hedad, who calls his theft a dream-interpretation and demands a fee for it (Jasher 18:28-32). When the man seeks redress, the very judge takes the robber''s side — *the judge said to the traveler, This man Hedad tells you truth, for he is famed in the cities for the accurate interpretation of dreams* (Jasher 18:34) — and the bench drives the victim out: *the judge gave orders to his servants, who drove them rashly from the house* (Jasher 18:40), and *the people of Sodom heard them, and they gathered about them and they exclaimed against the stranger, and they drove him rashly from the city* (Jasher 18:41). This is the spirit Genesis records when Sodom turns on Lot for sheltering strangers: *This one fellow came in to sojourn, and he will needs be a judge: now will we deal worse with thee, than with them* (Genesis 19:9) — a city that hates the stranger and the man who would judge righteously. Yahusha sets the days of Lot as the pattern of a world busy with its bargains on the brink of fire: *Likewise also as it was in the days of Lot; they did eat, they drank, they bought, they sold, they planted, they builded* (Luke 17:28). Jubilees pronounces the verdict on this same Jordan-plain wickedness: *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone* (Jubilees 16:5). The kingdom-of-man''s courts rob the sojourner; judgment is at the door — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55434
  FROM _session252_ja18_lookup sv, _session252_ja18_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=33
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=18 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-18-circumcision-eternal-sign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jasher''s circumcising of the household and those bought with money is Genesis 17''s everlasting-covenant command obeyed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-circumcision-eternal-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:25 — *And Ishmael his son was thirteen years old, when he was circumcised in the flesh of his foreskin.* Jasher gives Ishmael''s exact age, thirteen, straight from the Genesis source it retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-circumcision-eternal-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:* Abraham''s obedience in Jasher 18:1 is the sign sealing a righteousness already counted by faith.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-circumcision-eternal-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 15:30 — *For Ishmael and his sons and his brothers and Esau, Yahuah (God) did not cause to approach Him, and he chose them not because they are the children of Abraham, because He knew them, but He chose Yashar''el (Israel) to be His people.* Ishmael is circumcised in the flesh yet the covenant seed runs through the chosen line, as Jubilees declares of this same household.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-circumcision-eternal-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=15 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-18-three-visitors-mamre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:1 — *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* Jasher''s appearing at the plain of Mamre with Abraham at the tent door in the sun''s heat is Genesis 18 retold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-three-visitors-mamre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:2 — *And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground,* the three men, the lifted eyes, the running and bowing of Jasher 18:4 come straight from this verse.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-three-visitors-mamre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 18:6 — *And Abraham hastened into the tent unto Sarah, and said, Make ready quickly three measures of fine meal, knead it, and make cakes upon the hearth.* Jasher''s instruction to Sarah for three measures of fine meal is this Genesis command word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-three-visitors-mamre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 18:10 — *And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* The promise in Jasher 18:9 of a return according to the time of life and a son for Sarah is Genesis 18:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-three-visitors-mamre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 13:2 — *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares.* Abraham receiving the three ministering angels as travelers in Jasher 18:4 is the very entertaining of angels unawares the apostle commends.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-three-visitors-mamre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 16:1 — *And on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife.* Jubilees narrates the identical Mamre visit and announcement of a son that Jasher 18:9 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-three-visitors-mamre'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-18-sodom-cities-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* Jasher''s catalog of Sodom''s provoking abominations names the same iniquity Ezekiel exposes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-cities-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* The plundering of the stranger''s goods in Jasher 18:16 is exactly the failure to strengthen the hand of the poor and needy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-cities-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:6 — *And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly;* the exceeding wickedness of Sodom in Jasher 18:11 is set forth by Peter as the ensample of the ungodly''s end.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-cities-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The festival fornication of Jasher 18:14 is the very giving over to fornication Jude marks for eternal fire.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-cities-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-18-sodom-perverse-justice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:9 — *And they said, Stand back. And they said again, This one fellow came in to sojourn, and he will needs be a judge: now will we deal worse with thee, than with them. And they pressed sore upon the man, even Lot, and came near to break the door.* Sodom''s hatred of the sojourner and of right judgment, behind Hedad''s crooked bench in Jasher 18:34, is what Genesis shows turning on Lot.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-perverse-justice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 17:28 — *Likewise also as it was in the days of Lot; they did eat, they drank, they bought, they sold, they planted, they builded;* the buying, selling and feasting that crowns Sodom''s robbery of the stranger in Jasher 18 is the days-of-Lot heedlessness Yahusha names before the fire.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-perverse-justice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 16:5 — *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day...* the wickedness Jasher dramatizes in the Hedad tale is what Jubilees says brought fire and brimstone on the whole region of the Jordan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja18_lookup sv, _session252_ja18_lookup tv
 WHERE t.slug='jasher-18-sodom-perverse-justice'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=18 AND sv.verse_number=41
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

