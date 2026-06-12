-- ----- fragment: minion_thewisdomofsolomon_13.sql (session253 the-wisdom-of-solomon 13) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis13 (view _session253_wis13_lookup). Sort band base 58300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-13-creator-known-from-creation
  ('apocrypha', 'the-wisdom-of-solomon', 13, 1, 'canon', 'romans', 1, 21, 'free', E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Paul''s *became vain* is Wisdom 13:1''s *vain are all men by nature, who are ignorant of Yahuah (God)* — the same failure to acknowledge the workmaster.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 5, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Romans quotes Wisdom 13:5 — the maker *proportionably seen* in the beauty of the creatures, leaving the idolater without excuse.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 5, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The same creation-preaching that Wisdom 13:5 makes the ground of the idolater''s guilt.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 4, 'canon', 'job', 12, 7, 'free', E'Job 12:7 — *But ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee:* Even the creatures testify to him that made them, the very inference Wisdom 13:4 demands — to understand the mightier one by his power and virtue.'),
  -- thread: wisdom-13-godhead-not-like-gold
  ('apocrypha', 'the-wisdom-of-solomon', 13, 6, 'canon', 'acts', 17, 27, 'free', E'Acts 17:27 — *That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us:* Paul names the very groping after God that Wisdom 13:6 calls the lesser error — men *seeking Yahuah (God), and desirous to find him.*'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 9, 'canon', 'acts', 17, 29, 'free', E'Acts 17:29 — *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* The answer to Wisdom 13:9''s reproach — those able to *aim at the world* should have found its God, not graven him in gold and stone.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 9, 'canon', 'romans', 1, 25, 'free', E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* The unpardonable swap of Wisdom 13:8-9 — serving the creature, having failed to find the Creator thereof.'),
  -- thread: wisdom-13-carpenter-carves-a-god
  ('apocrypha', 'the-wisdom-of-solomon', 13, 13, 'canon', 'isaiah', 44, 13, 'free', E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s carpenter is Wisdom 13:13''s — carving the leftover wood *to the image of a man.*'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 12, 'canon', 'isaiah', 44, 16, 'free', E'Isaiah 44:16 — *He burneth part thereof in the fire; with part thereof he eateth flesh; he roasteth roast, and is satisfied: yea, he warmeth himself, and saith, Aha, I am warm, I have seen the fire:* The same refuse Wisdom 13:12 burns *to dress his meat* — and the residue becomes a god.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 11, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Jeremiah''s felled tree is Wisdom 13:11''s carpenter *that felleth timber* — the vain custom of carving gods from the forest.'),
  -- thread: wisdom-13-prayer-to-the-dead-thing
  ('apocrypha', 'the-wisdom-of-solomon', 13, 10, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The very *gold and silver... the works of men''s hands* that Wisdom 13:10 calls a dead hope.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 17, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The lifeless idol Wisdom 13:17 prays to — speaking *to that which has no life.*'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 18, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* The next breath of the same polemic — the dead thing of Wisdom 13:18, *that which is weak... that which is dead*, named cursed along with its maker.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-creator-known-from-creation',
       E'The workmaster known from the works',
       E'Wisdom opens the idolatry polemic exactly where Paul will stand: *Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1), for *by the greatness and beauty of the creatures proportionably the maker of them is seen* (Wisdom of Solomon 13:5). This is the very seam Romans quarries — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20), and then *when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations* (Romans 1:21) — Paul''s *vain* is Wisdom''s *vain*. The witness is older still: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1), and even the dumb creatures preach it — *ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee* (Job 12:7). It ain''t new: the Creator has always been legible in the creation, and the works indict the man who reads them and stops short of the workmaster.',
       sv.verse_id, ev.verse_id, 'extras', 58300
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-godhead-not-like-gold',
       E'We ought not to think the Godhead like gold',
       E'Wisdom is generous toward the seeking pagan and severe toward the settled one: *for they perhaps err, seeking Yahuah (God), and desirous to find him* (Wisdom of Solomon 13:6), *because the things are beautiful that are seen* (Wisdom of Solomon 13:7) — yet *neither are they to be pardoned* (Wisdom of Solomon 13:8), *for if they were able to know so much, that they could aim at the world; how did they not sooner find out Yahuah (God) thereof?* (Wisdom of Solomon 13:9). Paul preaches the identical mercy-and-summons on Mars'' hill: the Creator *that made the world and all things therein* set men *that they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27) — but the seeking forbids the carving: *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). The fall, both in Wisdom and in Romans, is the swap — men *changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen* (Romans 1:25). To see the world and miss its Maker is the one error that cannot be pardoned.',
       sv.verse_id, ev.verse_id, 'extras', 58303
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-carpenter-carves-a-god',
       E'The carpenter carves a god from the refuse wood',
       E'Wisdom''s carpenter is Isaiah''s carpenter, retold: he *felleth timber* and makes *a vessel thereof fit for the service of man''s life* (Wisdom of Solomon 13:11), spends *the refuse of his work to dress his meat* (Wisdom of Solomon 13:12), and then *taking the very refuse... being a crooked piece of wood, and full of knots, has carved it diligently, when he had nothing else to do... and fashioned it to the image of a man* (Wisdom of Solomon 13:13). He fastens it lest it fall, *knowing that it was unable to help itself; for it is an image, and has need of help* (Wisdom of Solomon 13:16). Isaiah drew the same picture centuries before: *The carpenter stretcheth out his rule... and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house* (Isaiah 44:13); *He heweth him down cedars* (Isaiah 44:14), and *He burneth part thereof in the fire; with part thereof he eateth flesh* (Isaiah 44:16) — half for warmth and bread, half worshipped. Jeremiah names the absurdity flatly: *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3). It ain''t new — Wisdom is simply preaching Isaiah''s and Jeremiah''s woodpile: the part you burn and the part you bow to came off the same crooked log.',
       sv.verse_id, ev.verse_id, 'extras', 58306
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-prayer-to-the-dead-thing',
       E'Prayer to that which has no life',
       E'The polemic ends in the pity of it — *miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver... and resemblances of beasts, or a stone good for nothing* (Wisdom of Solomon 13:10). Having nailed the idol fast, the maker *makes he prayer for his goods, for his wife and children, and is not ashamed to speak to that which has no life* (Wisdom of Solomon 13:17): *For health he calls upon that which is weak: for life prayeth to that which is dead* (Wisdom of Solomon 13:18). The Psalmist sang this scorn long before — *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4); *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). And Wisdom itself doubles down in the next chapter, the self-same library: *that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god* (Wisdom of Solomon 14:8). To beg life of a dead thing is the headwater Romans will trace to all the rest — the creature served in the Creator''s place.',
       sv.verse_id, ev.verse_id, 'extras', 58309
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-13-creator-known-from-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Paul''s *became vain* is Wisdom 13:1''s *vain are all men by nature, who are ignorant of Yahuah (God)* — the same failure to acknowledge the workmaster.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Romans quotes Wisdom 13:5 — the maker *proportionably seen* in the beauty of the creatures, leaving the idolater without excuse.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The same creation-preaching that Wisdom 13:5 makes the ground of the idolater''s guilt.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 12:7 — *But ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee:* Even the creatures testify to him that made them, the very inference Wisdom 13:4 demands — to understand the mightier one by his power and virtue.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-13-godhead-not-like-gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 17:27 — *That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us:* Paul names the very groping after God that Wisdom 13:6 calls the lesser error — men *seeking Yahuah (God), and desirous to find him.*'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-godhead-not-like-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 17:29 — *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* The answer to Wisdom 13:9''s reproach — those able to *aim at the world* should have found its God, not graven him in gold and stone.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-godhead-not-like-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* The unpardonable swap of Wisdom 13:8-9 — serving the creature, having failed to find the Creator thereof.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-godhead-not-like-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-13-carpenter-carves-a-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s carpenter is Wisdom 13:13''s — carving the leftover wood *to the image of a man.*'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-carpenter-carves-a-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:16 — *He burneth part thereof in the fire; with part thereof he eateth flesh; he roasteth roast, and is satisfied: yea, he warmeth himself, and saith, Aha, I am warm, I have seen the fire:* The same refuse Wisdom 13:12 burns *to dress his meat* — and the residue becomes a god.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-carpenter-carves-a-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Jeremiah''s felled tree is Wisdom 13:11''s carpenter *that felleth timber* — the vain custom of carving gods from the forest.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-carpenter-carves-a-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-13-prayer-to-the-dead-thing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The very *gold and silver... the works of men''s hands* that Wisdom 13:10 calls a dead hope.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-prayer-to-the-dead-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The lifeless idol Wisdom 13:17 prays to — speaking *to that which has no life.*'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-prayer-to-the-dead-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* The next breath of the same polemic — the dead thing of Wisdom 13:18, *that which is weak... that which is dead*, named cursed along with its maker.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-prayer-to-the-dead-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

