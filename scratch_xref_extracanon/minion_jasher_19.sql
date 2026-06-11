-- ----- fragment: minion_jasher_19.sql (session252 jasher 19) -----
-- Source anchor: jasher/jasher ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja19 (view _session252_ja19_lookup). Sort band base 55450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-19-sodoms-cruelty-to-the-poor
  ('jasher', 'jasher', 19, 8, 'canon', 'ezekiel', 16, 49, 'free', E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* The canon''s own verdict matches Jasher''s portrait — Sodom''s guilt was its refusal to feed the poor it had in abundance (Jasher 19:8).'),
  -- thread: jasher-19-war-of-kings-lot-rescued
  ('jasher', 'jasher', 19, 23, 'canon', 'genesis', 14, 12, 'free', E'Genesis 14:12 — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* The Genesis source of the captivity Jasher records when the kings of Elam took Lot with his property (Jasher 19:23).'),
  ('jasher', 'jasher', 19, 23, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abraham arming to make war is the canon scene Jasher summarizes in his going out against the kings of Elam (Jasher 19:23).'),
  ('jasher', 'jasher', 19, 23, 'canon', 'genesis', 14, 16, 'free', E'Genesis 14:16 — *And he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people.* The recovery Jasher names — Abraham recovered from their hands all the property of Lot and of Sodom (Jasher 19:23).'),
  -- thread: jasher-19-paltith-burned-for-feeding-the-poor
  ('jasher', 'jasher', 19, 35, 'canon', 'genesis', 18, 20, 'free', E'Genesis 18:20 — *And Yahuah (LORD) said, Because the cry of Sodom and Gomorrah is great, and because their sin is very grievous;* Jasher gives that great cry a face — Paltith burned to ashes for feeding the starving (Jasher 19:35).'),
  ('jasher', 'jasher', 19, 27, 'canon', 'ezekiel', 16, 49, 'free', E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* Paltith strengthening the hand of the poor and needy is the very mercy Sodom''s iniquity refused (Jasher 19:27).'),
  -- thread: jasher-19-the-cry-provokes-yahuah
  ('jasher', 'jasher', 19, 44, 'canon', 'jude', 1, 7, 'free', E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The cities whose works provoked Yahuah in Jasher stand in the NT as the set example of judgment (Jasher 19:44).'),
  ('jasher', 'jasher', 19, 44, 'canon', '2-peter', 2, 6, 'free', E'2 Peter 2:6 — *And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly;* the abundance-without-mercy that provoked Yahuah in Jasher is the ungodliness made an ensample (Jasher 19:44).'),
  -- thread: jasher-19-angels-deliver-lot-sodom-destroyed
  ('jasher', 'jasher', 19, 51, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* the Torah source of the brimstone and fire Jasher records raining on the cities (Jasher 19:51).'),
  ('jasher', 'jasher', 19, 53, 'canon', 'genesis', 19, 26, 'free', E'Genesis 19:26 — *But his wife looked back from behind him, and she became a pillar of salt.* Genesis gives the source of Lot''s wife turned to a pillar of salt that Jasher says stands yet in that place (Jasher 19:53).'),
  ('jasher', 'jasher', 19, 51, 'canon', 'luke', 17, 29, 'free', E'Luke 17:29 — *But the same day that Lot went out of Sodom it rained fire and brimstone from heaven, and destroyed them all.* The Messiah makes the fire and brimstone of Jasher''s overthrow the sign of the day of His revealing (Jasher 19:51).'),
  ('jasher', 'jasher', 19, 51, 'jubilees', 'jubilees', 16, 5, 'extras', E'Jubilees 16:5 — *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day, even as lo I have declared to you all their works, that they are wicked and sinners exceedingly, and that they defile themselves and commit fornication in their flesh, and work uncleanness on the earth.* Jubilees narrates the identical fire-and-brimstone overthrow Jasher records, the same patriarchal event from another witness (Jasher 19:51).'),
  -- thread: jasher-19-lot-saved-moab-and-ammon
  ('jasher', 'jasher', 19, 58, 'canon', 'genesis', 19, 37, 'free', E'Genesis 19:37 — *And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day.* The Torah source of the Moab line Jasher records the firstborn bearing in the cave (Jasher 19:58).'),
  ('jasher', 'jasher', 19, 59, 'canon', 'genesis', 19, 38, 'free', E'Genesis 19:38 — *And the younger, she also bare a son, and called his name Ben-ammi: the same is the father of the children of Ammon unto this day.* Genesis names the Ammon line that Jasher calls Benami, father of the children of Ammon (Jasher 19:59).'),
  ('jasher', 'jasher', 19, 57, 'canon', '2-peter', 2, 7, 'free', E'2 Peter 2:7 — *And delivered just Lot, vexed with the filthy conversation of the wicked:* the NT names as righteous the Lot whom Jasher leaves grieving in the cave, delivered from the overthrow (Jasher 19:57).'),
  ('jasher', 'jasher', 19, 57, 'jubilees', 'jubilees', 16, 6, 'extras', E'Jubilees 16:6 — *And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* Jubilees grounds Lot''s deliverance, which Jasher records, in election — Elohim remembered Abraham (Jasher 19:57).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-19-sodoms-cruelty-to-the-poor',
       E'The beds of Sodom — the kingdom of man that would not feed the poor',
       E'Jasher opens the Sodom cycle with the cities'' studied cruelty: *And by desire of their four judges the people of Sodom and Gomorrah had beds erected in the streets of the cities, and if a man came to these places they laid hold of him and brought him to one of their beds, and by force made him to lie in them.* (Jasher 19:3). And the deeper sin — *And when a poor man came to their land they would give him silver and gold, and cause a proclamation in the whole city not to give him a morsel of bread to eat* (Jasher 19:8). This is the kingdom-of-man pattern Jasher sets against the chosen seed: abundance hoarded, the stranger destroyed. The prophets name this very iniquity as Sodom''s: *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* (Ezekiel 16:49). It ain''t new — the canon already weighs Sodom on the scale of how it treated the needy, not only on the sin of the gate.',
       sv.verse_id, ev.verse_id, 'extras', 55450
  FROM _session252_ja19_lookup sv, _session252_ja19_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=19 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-19-war-of-kings-lot-rescued',
       E'The kings of Elam take Lot — Abraham makes war and recovers all',
       E'Jasher compresses the war of the kings into a single verse: *And when the kings of Elam had made war with the kings of Sodom, the kings of Elam captured all the property of Sodom, and they took Lot captive, with his property, and when it was told to Abraham he went and made war with the kings of Elam, and he recovered from their hands all the property of Lot as well as the property of Sodom.* (Jasher 19:23). This is the Genesis war retold — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* (Genesis 14:12) — and Abraham the called seed arming to deliver his kin: *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* (Genesis 14:14), *And he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people.* (Genesis 14:16). Jasher carries the same deliverance the Torah records.',
       sv.verse_id, ev.verse_id, 'extras', 55453
  FROM _session252_ja19_lookup sv, _session252_ja19_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=19 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-19-paltith-burned-for-feeding-the-poor',
       E'Paltith daughter of Lot — burned for the mercy Sodom forbade',
       E'Jasher''s most searing addition: Lot''s own daughter shows the mercy her city outlawed. *And Paltith the daughter of Lot saw this man lying in the streets starved with hunger, and no one would give him any thing to keep him alive, and he was just upon the point of death.* (Jasher 19:26); *And her soul was filled with pity on account of the man, and she fed him secretly with bread for many days, and the soul of this man was revived.* (Jasher 19:27). For this she is killed — *And the people of Sodom and Gomorrah assembled and kindled a fire in the street of the city, and they took the woman and cast her into the fire and she was burned to ashes.* (Jasher 19:35). This is the cry that fills up Sodom''s measure. The Torah records that very outcry reaching heaven — *And Yahuah (LORD) said, Because the cry of Sodom and Gomorrah is great, and because their sin is very grievous* (Genesis 18:20). Jasher gives the cry a face: the righteous within the city judged for keeping the way, Torah-before-Sinai mercy condemned as transgression of Sodom''s law.',
       sv.verse_id, ev.verse_id, 'extras', 55456
  FROM _session252_ja19_lookup sv, _session252_ja19_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=19 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-19-the-cry-provokes-yahuah',
       E'Yahuah provoked — the cry of the abused poor ascends to heaven',
       E'The woman of Admah is anointed with honey and given to the bees, and *her cries ascended to heaven.* (Jasher 19:43); then Jasher names the cause of the judgment exactly: *And Yahuah (the Lord) was provoked at this and at all the works of the cities of Sodom, for they had abundance of food, and had tranquility amongst them, and still would not sustain the poor and the needy, and in those days their evil doings and sins became great before Yahuah (the Lord).* (Jasher 19:44). The judgment of Sodom is the kingdom-of-man''s cities falling, and the NT holds it up as the standing example: *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* (Jude 1:7); *And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly* (2 Peter 2:6). It ain''t new — Sodom is fixed in scripture as the pattern of the judged city.',
       sv.verse_id, ev.verse_id, 'extras', 55459
  FROM _session252_ja19_lookup sv, _session252_ja19_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=43
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=19 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-19-angels-deliver-lot-sodom-destroyed',
       E'The two angels deliver Lot — brimstone and fire on the cities',
       E'Jasher follows the Genesis rescue closely: *And the angels said to Lot, Arise, go forth from this place, you and all belonging to you, lest you be consumed in the iniquity of this city, for Yahuah (the Lord) will destroy this place.* (Jasher 19:48); *Then Yahuah (the Lord) rained upon Sodom and upon Gomorrah and upon all these cities brimstone and fire from Yahuah (the Lord) out of heaven.* (Jasher 19:51); and Lot''s wife — *And when she looked back she became a pillar of salt, and it is yet in that place to this day.* (Jasher 19:53). The Torah is the source quoted beside it: *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24); *But his wife looked back from behind him, and she became a pillar of salt.* (Genesis 19:26). The Messiah seals it as the sign of His day — *But the same day that Lot went out of Sodom it rained fire and brimstone from heaven, and destroyed them all.* (Luke 17:29). And Jubilees narrates the same overthrow: *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day...* (Jubilees 16:5). One event, three witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 55462
  FROM _session252_ja19_lookup sv, _session252_ja19_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=48
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=19 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-19-lot-saved-moab-and-ammon',
       E'Lot delivered for Abraham''s sake — Moab and Ammon from the cave',
       E'Jasher closes with the cave at Adullam and the daughters: *And Lot and his two daughters remained in the cave, and they made their father drink wine, and they lay with him, for they said there was no man upon earth that could raise up seed from them, for they thought that the whole earth was destroyed.* (Jasher 19:57); *And the younger also called her son Benami; he is the father of the children of Ammon to this day.* (Jasher 19:59). The Torah gives the same line of nations: *And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day.* (Genesis 19:37); *And the younger, she also bare a son, and called his name Ben-ammi: the same is the father of the children of Ammon unto this day.* (Genesis 19:38). And Lot was spared only for Abraham''s sake — the NT names him righteous, *And delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7) — while Jubilees ties the deliverance to the covenant seed: *But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* (Jubilees 16:6). Election precedes the rescue: Lot is brought out because Elohim remembered Abraham.',
       sv.verse_id, ev.verse_id, 'extras', 55465
  FROM _session252_ja19_lookup sv, _session252_ja19_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=57
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=19 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-19-sodoms-cruelty-to-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* The canon''s own verdict matches Jasher''s portrait — Sodom''s guilt was its refusal to feed the poor it had in abundance (Jasher 19:8).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-sodoms-cruelty-to-the-poor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-19-war-of-kings-lot-rescued
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:12 — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* The Genesis source of the captivity Jasher records when the kings of Elam took Lot with his property (Jasher 19:23).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abraham arming to make war is the canon scene Jasher summarizes in his going out against the kings of Elam (Jasher 19:23).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:16 — *And he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people.* The recovery Jasher names — Abraham recovered from their hands all the property of Lot and of Sodom (Jasher 19:23).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-19-paltith-burned-for-feeding-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:20 — *And Yahuah (LORD) said, Because the cry of Sodom and Gomorrah is great, and because their sin is very grievous;* Jasher gives that great cry a face — Paltith burned to ashes for feeding the starving (Jasher 19:35).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-paltith-burned-for-feeding-the-poor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 16:49 — *Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy.* Paltith strengthening the hand of the poor and needy is the very mercy Sodom''s iniquity refused (Jasher 19:27).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-paltith-burned-for-feeding-the-poor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-19-the-cry-provokes-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The cities whose works provoked Yahuah in Jasher stand in the NT as the set example of judgment (Jasher 19:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-the-cry-provokes-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:6 — *And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly;* the abundance-without-mercy that provoked Yahuah in Jasher is the ungodliness made an ensample (Jasher 19:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-the-cry-provokes-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-19-angels-deliver-lot-sodom-destroyed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* the Torah source of the brimstone and fire Jasher records raining on the cities (Jasher 19:51).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-angels-deliver-lot-sodom-destroyed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:26 — *But his wife looked back from behind him, and she became a pillar of salt.* Genesis gives the source of Lot''s wife turned to a pillar of salt that Jasher says stands yet in that place (Jasher 19:53).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-angels-deliver-lot-sodom-destroyed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 17:29 — *But the same day that Lot went out of Sodom it rained fire and brimstone from heaven, and destroyed them all.* The Messiah makes the fire and brimstone of Jasher''s overthrow the sign of the day of His revealing (Jasher 19:51).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-angels-deliver-lot-sodom-destroyed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:5 — *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day, even as lo I have declared to you all their works, that they are wicked and sinners exceedingly, and that they defile themselves and commit fornication in their flesh, and work uncleanness on the earth.* Jubilees narrates the identical fire-and-brimstone overthrow Jasher records, the same patriarchal event from another witness (Jasher 19:51).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-angels-deliver-lot-sodom-destroyed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=51
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-19-lot-saved-moab-and-ammon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:37 — *And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day.* The Torah source of the Moab line Jasher records the firstborn bearing in the cave (Jasher 19:58).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-lot-saved-moab-and-ammon'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:38 — *And the younger, she also bare a son, and called his name Ben-ammi: the same is the father of the children of Ammon unto this day.* Genesis names the Ammon line that Jasher calls Benami, father of the children of Ammon (Jasher 19:59).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-lot-saved-moab-and-ammon'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:7 — *And delivered just Lot, vexed with the filthy conversation of the wicked:* the NT names as righteous the Lot whom Jasher leaves grieving in the cave, delivered from the overthrow (Jasher 19:57).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-lot-saved-moab-and-ammon'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:6 — *And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* Jubilees grounds Lot''s deliverance, which Jasher records, in election — Elohim remembered Abraham (Jasher 19:57).'
  FROM cross_reference_threads t, cross_references x, _session252_ja19_lookup sv, _session252_ja19_lookup tv
 WHERE t.slug='jasher-19-lot-saved-moab-and-ammon'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=19 AND sv.verse_number=57
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

