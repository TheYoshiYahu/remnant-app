-- ----- fragment: minion_jasher_33.sql (session252 jasher 33) -----
-- Source anchor: jasher/jasher ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja33 (view _session252_ja33_lookup). Sort band base 55800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-33-succoth-shalem-shechem
  ('jasher', 'jasher', 33, 1, 'canon', 'genesis', 33, 18, 'free', E'Genesis 33:18 — *And Jacob came to Shalem, a city of Shechem, which is in the land of Canaan, when he came from Padan-aram; and pitched his tent before the city.* Jasher 33:1 is this same arrival at Shechem, resting before the city.'),
  ('jasher', 'jasher', 33, 2, 'canon', 'genesis', 33, 19, 'free', E'Genesis 33:19 — *And he bought a parcel of a field, where he had spread his tent, at the hand of the children of Hamor, Shechem''s father, for an hundred pieces of money.* Jasher 33:2 retells the purchase of the field from the children of Hamor.'),
  ('jasher', 'jasher', 33, 3, 'canon', 'genesis', 33, 17, 'free', E'Genesis 33:17 — *And Jacob journeyed to Succoth, and built him an house, and made booths for his cattle: therefore the name of the place is called Succoth.* Jasher 33:3 names Succoth from the same booths Jacob made for his cattle.'),
  ('jasher', 'jasher', 33, 1, 'jubilees', 'jubilees', 30, 1, 'extras', E'Jubilees 30:1 — *And in the first year of the sixth week he went up to Salem, to the east of Shechem, in peace, in the fourth month.* Jubilees fixes Jacob''s coming to Shalem/Shechem in its calendar, the same scene Jasher 33:1 opens with.'),
  -- thread: jasher-33-dinah-defiled
  ('jasher', 'jasher', 33, 10, 'canon', 'genesis', 34, 3, 'free', E'Genesis 34:3 — *And his soul clave unto Dinah the daughter of Jacob, and he loved the damsel, and spake kindly unto the damsel.* Jasher 33:10''s ''his soul became fixed upon Dinah'' is the same clinging of Shechem''s soul to her.'),
  ('jasher', 'jasher', 33, 11, 'canon', 'genesis', 34, 2, 'free', E'Genesis 34:2 — *And when Shechem the son of Hamor the Hivite, prince of the country, saw her, he took her, and lay with her, and defiled her.* Jasher 33:11 expands the seizing and defiling of Dinah by Shechem the prince.'),
  ('jasher', 'jasher', 33, 6, 'canon', 'genesis', 34, 1, 'free', E'Genesis 34:1 — *And Dinah the daughter of Leah, which she bare unto Jacob, went out to see the daughters of the land.* Jasher 33:6 has Dinah going out to see the daughters of the city, the very going-forth Genesis records.'),
  ('jasher', 'jasher', 33, 11, 'jubilees', 'jubilees', 30, 2, 'extras', E'Jubilees 30:2 — *And there they carried off Dinah, the daughter of Jacob, into the house of Shechem, the son of Hamor, the Hivite, the prince of the land, and he lay with her and defiled her, and she was a little girl, a child of twelve years.* Jubilees, like Jasher 33:11, has Dinah carried into Shechem''s house and defiled.'),
  -- thread: jasher-33-deceit-circumcision-condition
  ('jasher', 'jasher', 33, 29, 'canon', 'genesis', 34, 13, 'free', E'Genesis 34:13 — *And the sons of Jacob answered Shechem and Hamor his father deceitfully, and said, because he had defiled Dinah their sister:* Jasher 33:29 has Simeon and Levi answering Hamor and Shechem deceitfully in the very same words.'),
  ('jasher', 'jasher', 33, 43, 'canon', 'genesis', 34, 14, 'free', E'Genesis 34:14 — *And they said unto them, We cannot do this thing, to give our sister to one that is uncircumcised; for that were a reproach unto us:* Jasher 33:43 echoes that giving the daughter to an uncircumcised man is a disgrace.'),
  ('jasher', 'jasher', 33, 37, 'canon', 'genesis', 34, 15, 'free', E'Genesis 34:15 — *But in this will we consent unto you: If ye will be as we be, that every male of you be circumcised;* Jasher 33:37 is Simeon''s counsel to make them circumcise every male as the condition.'),
  ('jasher', 'jasher', 33, 44, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The pretext in Jasher 33:44 rests on the Torah''s standing separation of the seed from the nations.'),
  -- thread: jasher-33-defilement-judgment-noah
  ('jasher', 'jasher', 33, 21, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Jasher 33:21 grounds the death-verdict in this very charge that Yahuah commanded Noah and his children.'),
  ('jasher', 'jasher', 33, 35, 'canon', 'genesis', 34, 7, 'free', E'Genesis 34:7 — *And the sons of Jacob came out of the field when they heard it: and the men were grieved, and they were very wroth, because he had wrought folly in Yashar''el (Israel) in lying with Jacob''s daughter; which thing ought not to be done.* Jasher 33:35''s ''such vileness shall never be done amongst us'' is this same folly-in-Israel that ought not be done.'),
  ('jasher', 'jasher', 33, 35, 'canon', 'deuteronomy', 22, 21, 'free', E'Deuteronomy 22:21 — *Then they shall bring out the damsel to the door of her father''s house, and the men of her city shall stone her with stones that she die: because she hath wrought folly in Yashar''el (Israel), to play the whore in her father''s house: so shalt thou put evil away from among you.* The Torah names sexual defilement folly in Israel, the same charge the brothers raise in Jasher 33:35.'),
  ('jasher', 'jasher', 33, 34, 'jubilees', 'jubilees', 30, 5, 'extras', E'Jubilees 30:5 — *And thus let it not again be done from henceforth that a daughter of Yashar''el (Israel) be defiled; for judgment is ordained in heaven against them that they should destroy with the sword all the men of the Shechemites because they had wrought shame in Yashar''el (Israel).* Jubilees draws from this scene the same standing judgment Jasher 33:34 invokes against the city.'),
  -- thread: jasher-33-zeal-of-levi-from-yahuah
  ('jasher', 'jasher', 33, 52, 'jubilees', 'jubilees', 30, 6, 'extras', E'Jubilees 30:6 — *And Yahuah (God) delivered them into the hands of the sons of Jacob that they might exterminate them with the sword and execute judgment upon them, and that it might not thus again be done in Yashar''el (Israel) that a virgin of Yashar''el (Israel) should be defiled.* Jubilees names the same hand that Jasher 33:52 names — Yahuah delivering Shechem into the sons of Jacob.'),
  ('jasher', 'jasher', 33, 39, 'jubilees', 'jubilees', 30, 18, 'extras', E'Jubilees 30:18 — *And the seed of Levi was chosen for the priesthood, and to be Levites, that they might minister before Yahuah (God), as we, continually, and that Levi and his sons may be blessed for ever; for he was zealous to execute righteousness and judgment and vengeance on all those who arose against Yashar''el (Israel).* Jubilees reads Levi''s resolve in Jasher 33:39 as the zeal that won him the priesthood.'),
  ('jasher', 'jasher', 33, 52, 'canon', 'genesis', 49, 7, 'free', E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* Jacob''s blessing answers the slaughter of Jasher 33:52 with a curse on the brothers'' fierce anger.'),
  ('jasher', 'jasher', 33, 39, 'canon', 'genesis', 49, 5, 'free', E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The two brothers who resolve to slay the city in Jasher 33:39 are the Simeon and Levi Jacob names together in his blessing.'),
  ('jasher', 'jasher', 33, 52, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The Levitical zeal that Jasher 33:52 calls ''from Yahuah'' is the same zeal Numbers later vindicates in Phinehas of Levi''s house.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-33-succoth-shalem-shechem',
       E'Succoth and the city of Shechem — Jacob comes to Canaan',
       E'Jasher opens where Genesis leaves Jacob: *And in some time after Jacob went away from the borders of the land, and he came to the land of Shalem, that is the city of Shechem, which is in the land of Canaan, and he rested in front of the city* (Jasher 33:1). This is the same arrival the Torah records — *And Jacob came to Shalem, a city of Shechem, which is in the land of Canaan, when he came from Padan-aram; and pitched his tent before the city* (Genesis 33:18). The field he buys is the canon''s field: *And he bought a parcel of the field which was there, from the children of Hamor the people of the land, for five shekels* (Jasher 33:2) beside *And he bought a parcel of a field, where he had spread his tent, at the hand of the children of Hamor, Shechem''s father, for an hundred pieces of money* (Genesis 33:19). And the booths name the place exactly as Genesis does — *therefore he called the name of that place Succoth* (Jasher 33:3); *therefore the name of the place is called Succoth* (Genesis 33:17). Jubilees sets the same scene in its calendar: *And in the first year of the sixth week he went up to Salem, to the east of Shechem, in peace, in the fourth month* (Jubilees 30:1). It ain''t new — Jasher only fills in the canon''s own ground.',
       sv.verse_id, ev.verse_id, 'extras', 55800
  FROM _session252_ja33_lookup sv, _session252_ja33_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=33 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-33-dinah-defiled',
       E'Dinah defiled by Shechem — the seed dishonored',
       E'Dinah goes out to the rejoicing and Shechem''s eye fastens on her: *And Shechem beheld Dinah the daughter of Jacob, and when he looked at her his soul became fixed upon Dinah* (Jasher 33:10), and *he sent and had her taken by force, and Dinah came to the house of Shechem and he seized her forcibly and lay with her and humbled her* (Jasher 33:11). Genesis tells it in fewer words but the same shape — *And Dinah the daughter of Leah, which she bare unto Jacob, went out to see the daughters of the land* (Genesis 34:1), and *when Shechem the son of Hamor the Hivite, prince of the country, saw her, he took her, and lay with her, and defiled her* (Genesis 34:2), and *his soul clave unto Dinah the daughter of Jacob* (Genesis 34:3). Jubilees marks her as a child and names the act a defiling of the seed of Israel — *And there they carried off Dinah, the daughter of Jacob, into the house of Shechem, the son of Hamor, the Hivite, the prince of the land, and he lay with her and defiled her, and she was a little girl, a child of twelve years* (Jubilees 30:2). The covenant daughter is dishonored by the nations; the election is profaned — and that profaning is what the next scenes answer.',
       sv.verse_id, ev.verse_id, 'extras', 55803
  FROM _session252_ja33_lookup sv, _session252_ja33_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=33 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-33-deceit-circumcision-condition',
       E'The deceit of the sons of Jacob — circumcise every male',
       E'The brothers answer with a snare worded as covenant: *And Simeon and Levi answered Hamor and Shechem his son deceitfully, saying, All you have spoken to us we will do for you* (Jasher 33:29), and Simeon frames the condition — *tell them to circumcise every male amongst them as we are circumcised, and if they do not wish to do this, we shall take our daughter from them and go away* (Jasher 33:37). They set the line that the seed will not be given to the uncircumcised — *we cannot do this of which you spoke to us, to give our daughter to an uncircumcised man, for it is a disgrace to us* (Jasher 33:43). Genesis carries the identical deceit and demand — *And the sons of Jacob answered Shechem and Hamor his father deceitfully* (Genesis 34:13); *We cannot do this thing, to give our sister to one that is uncircumcised; for that were a reproach unto us* (Genesis 34:14); *But in this will we consent unto you: If ye will be as we be, that every male of you be circumcised* (Genesis 34:15). Beneath the pretext stands the Torah''s later command against intermarrying with the nations — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3). The separation of the seed is the law spoken before Sinai; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55806
  FROM _session252_ja33_lookup sv, _session252_ja33_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=29
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=33 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-33-defilement-judgment-noah',
       E'Death is due — the Noahide blood-law and folly in Israel',
       E'The sons ground their verdict in a law older than Sinai: *Surely death is due to this man and to his household, because Yahuah Elohim (the Lord God) of the whole earth commanded Noah and his children that man shall never rob, nor commit adultery* (Jasher 33:21), and again *death is due to these wicked ones and to their city, because they transgressed that which Elohim (God) had commanded to Noah and his children and his seed after them* (Jasher 33:34). That command to Noah is the canon''s blood-charge — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6), and *surely your blood of your lives will I require... at the hand of every man''s brother will I require the life of man* (Genesis 9:5). The defiling of Dinah is named the very thing the Torah calls folly in Israel — *for such vileness shall never be done amongst us* (Jasher 33:35), the canon''s *which thing ought not to be done* (Genesis 34:7) and the law''s verdict on the defiled virgin, *because she hath wrought folly in Yashar''el (Israel)... so shalt thou put evil away from among you* (Deuteronomy 22:21). Jubilees draws the same ordinance from this scene — *And thus let it not again be done from henceforth that a daughter of Yashar''el (Israel) be defiled* (Jubilees 30:5).',
       sv.verse_id, ev.verse_id, 'extras', 55809
  FROM _session252_ja33_lookup sv, _session252_ja33_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=33 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-33-zeal-of-levi-from-yahuah',
       E'From Yahuah against Shechem — the zeal of Levi',
       E'The chapter ends naming the slaughter''s author: *for this thing was from Yahuah (the Lord) against the city of Shechem, and from Yahuah (the Lord) was Simeon''s counsel in this matter, in order that Yahuah (the Lord) might deliver the city of Shechem into the hands of Jacob''s two sons* (Jasher 33:52). Jubilees says the same — *And Yahuah (God) delivered them into the hands of the sons of Jacob that they might exterminate them with the sword* (Jubilees 30:6) — and reads the act as Levi''s priestly zeal: *And the seed of Levi was chosen for the priesthood... for he was zealous to execute righteousness and judgment and vengeance on all those who arose against Yashar''el (Israel)* (Jubilees 30:18). Yet the canon holds the harder word in tension: Jacob''s blessing curses the brothers'' wrath — *Simeon and Levi are brethren; instruments of cruelty are in their habitations* (Genesis 49:5), *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel)* (Genesis 49:7). The same zeal that scatters Levi here is the zeal Numbers later vindicates in Phinehas — *while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy* (Numbers 25:11). Election and zeal, judgment and mercy, run together over the defiled seed.',
       sv.verse_id, ev.verse_id, 'extras', 55812
  FROM _session252_ja33_lookup sv, _session252_ja33_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=39
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=33 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-33-succoth-shalem-shechem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 33:18 — *And Jacob came to Shalem, a city of Shechem, which is in the land of Canaan, when he came from Padan-aram; and pitched his tent before the city.* Jasher 33:1 is this same arrival at Shechem, resting before the city.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-succoth-shalem-shechem'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 33:19 — *And he bought a parcel of a field, where he had spread his tent, at the hand of the children of Hamor, Shechem''s father, for an hundred pieces of money.* Jasher 33:2 retells the purchase of the field from the children of Hamor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-succoth-shalem-shechem'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 33:17 — *And Jacob journeyed to Succoth, and built him an house, and made booths for his cattle: therefore the name of the place is called Succoth.* Jasher 33:3 names Succoth from the same booths Jacob made for his cattle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-succoth-shalem-shechem'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 30:1 — *And in the first year of the sixth week he went up to Salem, to the east of Shechem, in peace, in the fourth month.* Jubilees fixes Jacob''s coming to Shalem/Shechem in its calendar, the same scene Jasher 33:1 opens with.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-succoth-shalem-shechem'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-33-dinah-defiled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:3 — *And his soul clave unto Dinah the daughter of Jacob, and he loved the damsel, and spake kindly unto the damsel.* Jasher 33:10''s ''his soul became fixed upon Dinah'' is the same clinging of Shechem''s soul to her.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-dinah-defiled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:2 — *And when Shechem the son of Hamor the Hivite, prince of the country, saw her, he took her, and lay with her, and defiled her.* Jasher 33:11 expands the seizing and defiling of Dinah by Shechem the prince.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-dinah-defiled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 34:1 — *And Dinah the daughter of Leah, which she bare unto Jacob, went out to see the daughters of the land.* Jasher 33:6 has Dinah going out to see the daughters of the city, the very going-forth Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-dinah-defiled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 30:2 — *And there they carried off Dinah, the daughter of Jacob, into the house of Shechem, the son of Hamor, the Hivite, the prince of the land, and he lay with her and defiled her, and she was a little girl, a child of twelve years.* Jubilees, like Jasher 33:11, has Dinah carried into Shechem''s house and defiled.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-dinah-defiled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-33-deceit-circumcision-condition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:13 — *And the sons of Jacob answered Shechem and Hamor his father deceitfully, and said, because he had defiled Dinah their sister:* Jasher 33:29 has Simeon and Levi answering Hamor and Shechem deceitfully in the very same words.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-deceit-circumcision-condition'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:14 — *And they said unto them, We cannot do this thing, to give our sister to one that is uncircumcised; for that were a reproach unto us:* Jasher 33:43 echoes that giving the daughter to an uncircumcised man is a disgrace.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-deceit-circumcision-condition'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 34:15 — *But in this will we consent unto you: If ye will be as we be, that every male of you be circumcised;* Jasher 33:37 is Simeon''s counsel to make them circumcise every male as the condition.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-deceit-circumcision-condition'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The pretext in Jasher 33:44 rests on the Torah''s standing separation of the seed from the nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-deceit-circumcision-condition'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-33-defilement-judgment-noah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Jasher 33:21 grounds the death-verdict in this very charge that Yahuah commanded Noah and his children.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-defilement-judgment-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:7 — *And the sons of Jacob came out of the field when they heard it: and the men were grieved, and they were very wroth, because he had wrought folly in Yashar''el (Israel) in lying with Jacob''s daughter; which thing ought not to be done.* Jasher 33:35''s ''such vileness shall never be done amongst us'' is this same folly-in-Israel that ought not be done.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-defilement-judgment-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 22:21 — *Then they shall bring out the damsel to the door of her father''s house, and the men of her city shall stone her with stones that she die: because she hath wrought folly in Yashar''el (Israel), to play the whore in her father''s house: so shalt thou put evil away from among you.* The Torah names sexual defilement folly in Israel, the same charge the brothers raise in Jasher 33:35.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-defilement-judgment-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 30:5 — *And thus let it not again be done from henceforth that a daughter of Yashar''el (Israel) be defiled; for judgment is ordained in heaven against them that they should destroy with the sword all the men of the Shechemites because they had wrought shame in Yashar''el (Israel).* Jubilees draws from this scene the same standing judgment Jasher 33:34 invokes against the city.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-defilement-judgment-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=34
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-33-zeal-of-levi-from-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 30:6 — *And Yahuah (God) delivered them into the hands of the sons of Jacob that they might exterminate them with the sword and execute judgment upon them, and that it might not thus again be done in Yashar''el (Israel) that a virgin of Yashar''el (Israel) should be defiled.* Jubilees names the same hand that Jasher 33:52 names — Yahuah delivering Shechem into the sons of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-zeal-of-levi-from-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=52
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 30:18 — *And the seed of Levi was chosen for the priesthood, and to be Levites, that they might minister before Yahuah (God), as we, continually, and that Levi and his sons may be blessed for ever; for he was zealous to execute righteousness and judgment and vengeance on all those who arose against Yashar''el (Israel).* Jubilees reads Levi''s resolve in Jasher 33:39 as the zeal that won him the priesthood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-zeal-of-levi-from-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=39
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* Jacob''s blessing answers the slaughter of Jasher 33:52 with a curse on the brothers'' fierce anger.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-zeal-of-levi-from-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The two brothers who resolve to slay the city in Jasher 33:39 are the Simeon and Levi Jacob names together in his blessing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-zeal-of-levi-from-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The Levitical zeal that Jasher 33:52 calls ''from Yahuah'' is the same zeal Numbers later vindicates in Phinehas of Levi''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja33_lookup sv, _session252_ja33_lookup tv
 WHERE t.slug='jasher-33-zeal-of-levi-from-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=33 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

