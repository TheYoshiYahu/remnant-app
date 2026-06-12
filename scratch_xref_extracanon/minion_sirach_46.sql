-- ----- fragment: minion_ecclesiasticus_46.sql (session253 ecclesiasticus 46) -----
-- Source anchor: apocrypha/ecclesiasticus ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir46 (view _session253_sir46_lookup). Sort band base 59425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-46-joshua-successor-of-moses
  ('apocrypha', 'ecclesiasticus', 46, 1, 'canon', 'joshua', 1, 1, 'free', E'Joshua 1:1 — *Now after the death of Moses the servant of Yahuah (LORD) it came to pass, that Yahuah (LORD) spake unto Joshua the son of Nun, Moses'' minister, saying,* The Tanakh names the same successor of Moses whom Sirach 46:1 praises, Joshua son of Nun, not the Messiah.'),
  ('apocrypha', 'ecclesiasticus', 46, 1, 'canon', 'joshua', 1, 6, 'free', E'Joshua 1:6 — *Be strong and of a good courage: for unto this people shalt thou divide for an inheritance the land, which I sware unto their fathers to give them.* This is the charge to set Israel in the inheritance that Sirach 46:1 says Joshua was made great to accomplish.'),
  ('apocrypha', 'ecclesiasticus', 46, 2, 'canon', 'hebrews', 11, 30, 'free', E'Hebrews 11:30 — *By faith the walls of Jericho fell down, after they were compassed about seven days.* The valiant wars and lifted sword of Sirach 46:2 are counted by the apostle as the works of faith under Joshua.'),
  -- thread: sirach-46-sun-stood-still
  ('apocrypha', 'ecclesiasticus', 46, 4, 'canon', 'joshua', 10, 12, 'free', E'Joshua 10:12 — *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon.* This is the prayer behind Sirach 46:4''s sun going back and one day as long as two.'),
  ('apocrypha', 'ecclesiasticus', 46, 6, 'canon', 'joshua', 10, 11, 'free', E'Joshua 10:11 — *And it came to pass, as they fled from before Yashar''el (Israel), and were in the going down to Beth-horon, that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword.* The hailstones at the descent of Beth-horon in Sirach 46:6 are the very stones from heaven named here.'),
  ('apocrypha', 'ecclesiasticus', 46, 4, 'jasher', 'jasher', 88, 63, 'extras', E'Jasher 88:63 — *And when they were smiting, the day was declining toward evening, and Joshua said in the sight of all the people, Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon, until the nation shall have revenged itself upon its enemies.* The book Joshua cites preserves the same stayed sun that Sirach 46:4 marvels over.'),
  ('apocrypha', 'ecclesiasticus', 46, 6, 'jasher', 'jasher', 88, 61, 'extras', E'Jasher 88:61 — *And whilst they were fleeing, Yahuah (the Lord) sent upon them hailstones from heaven, and more of them died by the hailstones, than by the slaughter of the children of Israel.* Jasher confirms the hailstones of mighty power that Sirach 46:6 sets in the descent of Beth-horon.'),
  -- thread: sirach-46-he-followed-the-mighty-one
  ('apocrypha', 'ecclesiasticus', 46, 6, 'canon', 'joshua', 1, 9, 'free', E'Joshua 1:9 — *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* To fight in the sight of Yahuah and follow the Mighty One (Sirach 46:6) is to keep this opening charge.'),
  ('apocrypha', 'ecclesiasticus', 46, 6, 'jasher', 'jasher', 88, 60, 'extras', E'Jasher 88:60 — *And Yahuah (the Lord) confounded them before the children at Israel, who smote them with a terrible slaughter in Gibeon, and pursued them along the way that goes up to Beth Horon to Makkedah, and they fled from before the children of Israel.* Jasher names the descent of Beth-horon where Sirach 46:6 says Joshua destroyed them that resisted.'),
  -- thread: sirach-46-joshua-and-caleb-faithful-spies
  ('apocrypha', 'ecclesiasticus', 46, 7, 'canon', 'numbers', 14, 6, 'free', E'Numbers 14:6 — *And Joshua the son of Nun, and Caleb the son of Jephunneh, which were of them that searched the land, rent their clothes:* These are the two who withstood the congregation in Sirach 46:7, named together as the faithful spies.'),
  ('apocrypha', 'ecclesiasticus', 46, 8, 'canon', 'numbers', 14, 8, 'free', E'Numbers 14:8 — *If Yahuah (LORD) delight in us, then he will bring us into this land, and give it us; a land which floweth with milk and honey.* This is the very plea to enter the land flowing with milk and honey that Sirach 46:8 says the two were preserved to reach.'),
  -- thread: sirach-46-caleb-wholly-followed
  ('apocrypha', 'ecclesiasticus', 46, 9, 'canon', 'numbers', 14, 24, 'free', E'Numbers 14:24 — *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it.* This is the promise that Caleb''s seed would obtain the heritage, exactly as Sirach 46:9 records.'),
  ('apocrypha', 'ecclesiasticus', 46, 9, 'canon', 'joshua', 14, 13, 'free', E'Joshua 14:13 — *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance.* Caleb entering the high places of the land in his old age (Sirach 46:9) is fulfilled in the gift of Hebron.'),
  ('apocrypha', 'ecclesiasticus', 46, 10, 'canon', 'joshua', 14, 14, 'free', E'Joshua 14:14 — *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel).* This names the very reason Sirach 46:10 commends, that it is good to follow Yahuah.'),
  -- thread: sirach-46-the-judges-hearts-turned-not
  ('apocrypha', 'ecclesiasticus', 46, 11, 'canon', 'judges', 2, 16, 'free', E'Judges 2:16 — *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them.* These are the judges whose memory Sirach 46:11 blesses, the deliverers Yahuah raised up.'),
  ('apocrypha', 'ecclesiasticus', 46, 11, 'canon', 'hebrews', 11, 32, 'free', E'Hebrews 11:32 — *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets:* The apostle''s roll of judges and Samuel runs parallel to Ben Sira''s blessing of the judges in Sirach 46:11.'),
  -- thread: sirach-46-samuel-prophet-established-kingdom
  ('apocrypha', 'ecclesiasticus', 46, 15, 'canon', '1-samuel', 3, 20, 'free', E'1 Samuel 3:20 — *And all Yashar''el (Israel) from Dan even to Beer-sheba knew that Samuel was established to be a prophet of Yahuah (LORD).* This confirms the true and faithful prophet that Sirach 46:15 says was known to be faithful in vision.'),
  ('apocrypha', 'ecclesiasticus', 46, 16, 'canon', '1-samuel', 7, 9, 'free', E'1 Samuel 7:9 — *And Samuel took a sucking lamb, and offered it for a burnt offering wholly unto Yahuah (LORD): and Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him.* This is the very sucking lamb and the cry to Yahuah that Sirach 46:16 records.'),
  ('apocrypha', 'ecclesiasticus', 46, 17, 'canon', '1-samuel', 12, 18, 'free', E'1 Samuel 12:18 — *So Samuel called unto Yahuah (LORD); and Yahuah (LORD) sent thunder and rain that day: and all the people greatly feared Yahuah (LORD) and Samuel.* The thunder Yahuah made to be heard from heaven in Sirach 46:17 is this answer to Samuel''s call.'),
  ('apocrypha', 'ecclesiasticus', 46, 19, 'canon', '1-samuel', 12, 3, 'free', E'1 Samuel 12:3 — *Behold, here I am: witness against me before Yahuah (LORD), and before his anointed: whose ox have I taken? or whose ass have I taken? or whom have I defrauded? whom have I oppressed? or of whose hand have I received any bribe to blind mine eyes therewith? and I will restore it you.* This is Samuel''s protestation of innocence before Yahuah and his anointed that Sirach 46:19 recalls.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-joshua-successor-of-moses',
       E'Joshua son of Nun, successor of Moses, made great for the saving of the elect',
       E'Ben Sira opens the next age with the captain who carried the inheritance over Jordan: *Jesus the son a Nave was valiant in the wars, and was the successor of Moses in prophecies, who according to his name was made great for the saving of the elect of Yahuah (God), and taking vengeance of the enemies that rose up against them, that he might set Yashar''el (Israel) in their inheritance* (Sirach 46:1) — the "Jesus" here is Yehoshua, Joshua son of Nun, NOT the Messiah. The Tanakh hands him the same commission on the very threshold: *Now after the death of Moses the servant of Yahuah (LORD) it came to pass, that Yahuah (LORD) spake unto Joshua the son of Nun, Moses'' minister, saying,* (Joshua 1:1), and the charge *Be strong and of a good courage: for unto this people shalt thou divide for an inheritance the land, which I sware unto their fathers to give them* (Joshua 1:6). When he lifted up his hands and stretched out his sword against the cities (Sirach 46:2), it was no arm of flesh but covenant power — *Who before him so stood to it? for Yahuah (God) himself brought his enemies to him* (Sirach 46:3). The faith-roll names that same conquest: *By faith the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30). It ain''t new — Ben Sira is simply reading the same scroll of the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 59425
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-sun-stood-still',
       E'The sun went back, one day as long as two, hailstones at Beth-horon',
       E'Ben Sira remembers the day the heavens themselves halted for the captain: *Did not the sun go back by his means? and was not one day as long as two?* (Sirach 46:4), *He called upon the most high Yahuah (God), when the enemies pressed upon him on every side; and the great Yahuah (God) heard him* (Sirach 46:5), *And with hailstones of mighty power he made the battle to fall violently upon the nations, and in the descent of Beth-horon he destroyed them that resisted* (Sirach 46:6). The Tanakh records the very prayer: *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon* (Joshua 10:12), and the hailstones too: *And it came to pass, as they fled from before Yashar''el (Israel), and were in the going down to Beth-horon, that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah* (Joshua 10:11). And the scroll Joshua himself cited — the book of Jasher — tells the very same wonder: *And when they were smiting, the day was declining toward evening, and Joshua said in the sight of all the people, Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon, until the nation shall have revenged itself upon its enemies* (Jasher 88:63). Three witnesses, one stopped sun — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59428
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-he-followed-the-mighty-one',
       E'He fought in the sight of Yahuah and followed the Mighty One',
       E'Ben Sira seals the conquest portrait with the secret of Joshua''s strength: *And with hailstones of mighty power he made the battle to fall violently upon the nations, and in the descent of Beth-horon he destroyed them that resisted, that the nations might know all their strength, because he fought in the sight of Yahuah (God), and he followed the Mighty One* (Sirach 46:6). To follow the Mighty One fully is the same charge Joshua received at the start: *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). And the book of Jasher names the rout at Gibeon down the Beth-horon road: *And Yahuah (the Lord) confounded them before the children at Israel, who smote them with a terrible slaughter in Gibeon, and pursued them along the way that goes up to Beth Horon to Makkedah, and they fled from before the children of Israel* (Jasher 88:60). The captain conquered because he followed — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59431
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-joshua-and-caleb-faithful-spies',
       E'Joshua and Caleb withstood the congregation, two of six hundred thousand preserved',
       E'Before the conquest, Ben Sira recalls the two faithful spies who stood against a faithless camp: *In the time of Moses also he did a work of mercy, he and Caleb the son of Jephunne, in that they withstood the congregation, and withheld the people from sin, and appeased the wicked murmuring* (Sirach 46:7), *And of six hundred thousand people on foot, they two were preserved to bring them in to the heritage, even to the land that floweth with milk and honey* (Sirach 46:8). The Tanakh shows the two rending their clothes before the mob: *And Joshua the son of Nun, and Caleb the son of Jephunneh, which were of them that searched the land, rent their clothes* (Numbers 14:6), pleading *If Yahuah (LORD) delight in us, then he will bring us into this land, and give it us; a land which floweth with milk and honey* (Numbers 14:8). Of all that generation only these two crossed over — the seed kept faithful while the rest fell. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59434
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-caleb-wholly-followed',
       E'Caleb''s strength to old age, his seed obtained the heritage — wholly following Yahuah',
       E'Ben Sira gives Caleb his own crown for unwavering loyalty: *Yahuah (God) gave strength also to Caleb, which remained with him to his old age: so that he entered upon the high places of the land, and his seed obtained it for an heritage* (Sirach 46:9), *That all the children of Yashar''el (Israel) might see that it is good to follow Yahuah (God)* (Sirach 46:10). The Tanakh''s word over Caleb is the same: *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). And in his old age the inheritance came, just as Ben Sira says: *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance* (Joshua 14:13), *because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 14:14). To follow Yahuah fully is good and is rewarded with the heritage — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59437
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-the-judges-hearts-turned-not',
       E'The judges whose heart went not a whoring — let their memory be blessed',
       E'Ben Sira passes a blessing over the deliverers of the next age: *And concerning the judges, every one by name, whose heart went not a whoring, nor departed from Yahuah (God), let their memory be blessed* (Sirach 46:11), *Let their bones flourish out of their place, and let the name of them that were honoured be continued upon their children* (Sirach 46:12). The book of Judges records the raising up of these very deliverers: *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). The apostle gathers them into the cloud of witnesses by name: *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets* (Hebrews 11:32). The faithful judges are remembered in three scrolls alike — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59440
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-46-samuel-prophet-established-kingdom',
       E'Samuel the prophet — established the kingdom, called on Yahuah, the sucking lamb and the thunder',
       E'Ben Sira crowns the chapter with Samuel, prophet and kingmaker: *Samuel, the prophet of Yahuah (God), beloved of his Elohim (God), established a kingdom, and anointed princes over his people* (Sirach 46:13), *By his faithfulness he was found a true prophet, and by his word he was known to be faithful in vision* (Sirach 46:15). The Tanakh confirms the true prophet: *And all Yashar''el (Israel) from Dan even to Beer-sheba knew that Samuel was established to be a prophet of Yahuah (LORD)* (1 Samuel 3:20). Ben Sira''s *He called upon the mighty Yahuah (God), when his enemies pressed upon him on every side, when he offered the sucking lamb* (Sirach 46:16) is the very scene at Mizpeh: *And Samuel took a sucking lamb, and offered it for a burnt offering wholly unto Yahuah (LORD): and Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him* (1 Samuel 7:9). And the thunder that answered him (Sirach 46:17) — *So Samuel called unto Yahuah (LORD); and Yahuah (LORD) sent thunder and rain that day: and all the people greatly feared Yahuah (LORD) and Samuel* (1 Samuel 12:18). His farewell witness before Yahuah and his anointed (Sirach 46:19) is the integrity of 1 Samuel 12:3. It ain''t new — the prophet''s whole life is in the scroll.',
       sv.verse_id, ev.verse_id, 'extras', 59443
  FROM _session253_sir46_lookup sv, _session253_sir46_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=46 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-46-joshua-successor-of-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:1 — *Now after the death of Moses the servant of Yahuah (LORD) it came to pass, that Yahuah (LORD) spake unto Joshua the son of Nun, Moses'' minister, saying,* The Tanakh names the same successor of Moses whom Sirach 46:1 praises, Joshua son of Nun, not the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-joshua-successor-of-moses'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:6 — *Be strong and of a good courage: for unto this people shalt thou divide for an inheritance the land, which I sware unto their fathers to give them.* This is the charge to set Israel in the inheritance that Sirach 46:1 says Joshua was made great to accomplish.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-joshua-successor-of-moses'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:30 — *By faith the walls of Jericho fell down, after they were compassed about seven days.* The valiant wars and lifted sword of Sirach 46:2 are counted by the apostle as the works of faith under Joshua.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-joshua-successor-of-moses'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-46-sun-stood-still
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 10:12 — *Then spake Joshua to Yahuah (LORD) in the day when Yahuah (LORD) delivered up the Amorites before the children of Yashar''el (Israel), and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon.* This is the prayer behind Sirach 46:4''s sun going back and one day as long as two.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-sun-stood-still'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 10:11 — *And it came to pass, as they fled from before Yashar''el (Israel), and were in the going down to Beth-horon, that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword.* The hailstones at the descent of Beth-horon in Sirach 46:6 are the very stones from heaven named here.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-sun-stood-still'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 88:63 — *And when they were smiting, the day was declining toward evening, and Joshua said in the sight of all the people, Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon, until the nation shall have revenged itself upon its enemies.* The book Joshua cites preserves the same stayed sun that Sirach 46:4 marvels over.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-sun-stood-still'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 88:61 — *And whilst they were fleeing, Yahuah (the Lord) sent upon them hailstones from heaven, and more of them died by the hailstones, than by the slaughter of the children of Israel.* Jasher confirms the hailstones of mighty power that Sirach 46:6 sets in the descent of Beth-horon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-sun-stood-still'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=61
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-46-he-followed-the-mighty-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:9 — *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* To fight in the sight of Yahuah and follow the Mighty One (Sirach 46:6) is to keep this opening charge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-he-followed-the-mighty-one'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jasher 88:60 — *And Yahuah (the Lord) confounded them before the children at Israel, who smote them with a terrible slaughter in Gibeon, and pursued them along the way that goes up to Beth Horon to Makkedah, and they fled from before the children of Israel.* Jasher names the descent of Beth-horon where Sirach 46:6 says Joshua destroyed them that resisted.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-he-followed-the-mighty-one'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-46-joshua-and-caleb-faithful-spies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 14:6 — *And Joshua the son of Nun, and Caleb the son of Jephunneh, which were of them that searched the land, rent their clothes:* These are the two who withstood the congregation in Sirach 46:7, named together as the faithful spies.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-joshua-and-caleb-faithful-spies'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 14:8 — *If Yahuah (LORD) delight in us, then he will bring us into this land, and give it us; a land which floweth with milk and honey.* This is the very plea to enter the land flowing with milk and honey that Sirach 46:8 says the two were preserved to reach.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-joshua-and-caleb-faithful-spies'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-46-caleb-wholly-followed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 14:24 — *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it.* This is the promise that Caleb''s seed would obtain the heritage, exactly as Sirach 46:9 records.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-caleb-wholly-followed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 14:13 — *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance.* Caleb entering the high places of the land in his old age (Sirach 46:9) is fulfilled in the gift of Hebron.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-caleb-wholly-followed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 14:14 — *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel).* This names the very reason Sirach 46:10 commends, that it is good to follow Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-caleb-wholly-followed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-46-the-judges-hearts-turned-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 2:16 — *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them.* These are the judges whose memory Sirach 46:11 blesses, the deliverers Yahuah raised up.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-the-judges-hearts-turned-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:32 — *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets:* The apostle''s roll of judges and Samuel runs parallel to Ben Sira''s blessing of the judges in Sirach 46:11.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-the-judges-hearts-turned-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-46-samuel-prophet-established-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 3:20 — *And all Yashar''el (Israel) from Dan even to Beer-sheba knew that Samuel was established to be a prophet of Yahuah (LORD).* This confirms the true and faithful prophet that Sirach 46:15 says was known to be faithful in vision.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-samuel-prophet-established-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 7:9 — *And Samuel took a sucking lamb, and offered it for a burnt offering wholly unto Yahuah (LORD): and Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him.* This is the very sucking lamb and the cry to Yahuah that Sirach 46:16 records.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-samuel-prophet-established-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 12:18 — *So Samuel called unto Yahuah (LORD); and Yahuah (LORD) sent thunder and rain that day: and all the people greatly feared Yahuah (LORD) and Samuel.* The thunder Yahuah made to be heard from heaven in Sirach 46:17 is this answer to Samuel''s call.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-samuel-prophet-established-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Samuel 12:3 — *Behold, here I am: witness against me before Yahuah (LORD), and before his anointed: whose ox have I taken? or whose ass have I taken? or whom have I defrauded? whom have I oppressed? or of whose hand have I received any bribe to blind mine eyes therewith? and I will restore it you.* This is Samuel''s protestation of innocence before Yahuah and his anointed that Sirach 46:19 recalls.'
  FROM cross_reference_threads t, cross_references x, _session253_sir46_lookup sv, _session253_sir46_lookup tv
 WHERE t.slug='sirach-46-samuel-prophet-established-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=46 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

