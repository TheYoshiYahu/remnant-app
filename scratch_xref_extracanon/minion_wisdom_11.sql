-- ----- fragment: minion_thewisdomofsolomon_11.sql (session253 the-wisdom-of-solomon 11) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis11 (view _session253_wis11_lookup). Sort band base 58250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-11-water-from-the-rock
  ('apocrypha', 'the-wisdom-of-solomon', 11, 4, 'canon', 'exodus', 17, 6, 'free', E'Exodus 17:6 — *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink. And Moses did so in the sight of the elders of Yashar''el (Israel).* The Horeb rock is the very flinty stone Wisdom of Solomon 11:4 says quenched their thirst.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 4, 'canon', 'numbers', 20, 11, 'free', E'Numbers 20:11 — *And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also.* The water out of the hard stone in Wisdom of Solomon 11:4 is the Meribah gift, given abundantly to the thirsty congregation.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 4, 'canon', '1-corinthians', 10, 4, 'free', E'1 Corinthians 10:4 — *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* Paul names the Rock Wisdom of Solomon 11:4 remembers — the wilderness draught was Messiah Himself.'),
  -- thread: wisdom-11-punished-by-what-they-sinned
  ('apocrypha', 'the-wisdom-of-solomon', 11, 6, 'canon', 'exodus', 7, 20, 'free', E'Exodus 7:20 — *And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* The perpetual river troubled with foul blood in Wisdom of Solomon 11:6 is the first plague turning the Nile to blood.'),
  -- thread: wisdom-11-measure-number-weight
  ('apocrypha', 'the-wisdom-of-solomon', 11, 20, 'canon', 'job', 28, 25, 'free', E'Job 28:25 — *To make the weight for the winds; and he weigheth the waters by measure.* Job''s wisdom-poem gives the same weighing and measuring Wisdom of Solomon 11:20 ascribes to the Creator who ordered all things.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 20, 'canon', 'isaiah', 40, 12, 'free', E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* Isaiah''s measuring, meting, and weighing is the cosmic order Wisdom of Solomon 11:20 names as measure and number and weight.'),
  -- thread: wisdom-11-world-a-grain-of-the-balance
  ('apocrypha', 'the-wisdom-of-solomon', 11, 22, 'apocrypha', 'ecclesiasticus', 18, 10, 'extras', E'Ecclesiasticus 18:10 — *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity.* Ben Sira''s drop-and-gravelstone matches Wisdom of Solomon 11:22''s grain of the balance and drop of dew — creation is nothing beside the Eternal.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 22, 'apocrypha', 'ecclesiasticus', 18, 11, 'extras', E'Ecclesiasticus 18:11 — *Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them.* Ben Sira draws the same conclusion Wisdom of Solomon 11:22-23 draws — the world''s smallness is the ground of His patience and outpoured mercy.'),
  -- thread: wisdom-11-thou-lovest-all-thou-sparest-all
  ('apocrypha', 'the-wisdom-of-solomon', 11, 23, 'canon', 'psalms', 145, 9, 'free', E'Psalms 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* David''s mercy over all His works is the very confession of Wisdom of Solomon 11:23-24, that He loves all He has made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 24, 'canon', 'jonah', 4, 11, 'free', E'Jonah 4:11 — *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* Yahuah''s plea to spare Nineveh enacts Wisdom of Solomon 11:24''s truth that He abhors nothing He has made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 26, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The God who takes no pleasure in death is the lover of souls who spares all in Wisdom of Solomon 11:26.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 26, 'apocrypha', 'ecclesiasticus', 18, 13, 'extras', E'Ecclesiasticus 18:13 — *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* Ben Sira''s mercy upon all flesh is the same lover-of-souls confession Wisdom of Solomon 11:26 makes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-water-from-the-rock',
       E'Water out of the flinty rock — and the Rock was Messiah',
       E'Wisdom rehearses the wilderness mercy: *When they were thirsty, they called upon you, and water was given them out of the flinty rock, and their thirst was quenched out of the hard stone.* (the-wisdom-of-solomon 11:4). This is the Horeb miracle remembered: *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink. And Moses did so in the sight of the elders of Yashar''el (Israel).* (Exodus 17:6) — and again at Meribah, *And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also.* (Numbers 20:11). It ain''t new: Paul reads the same rock messianically, *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* (1 Corinthians 10:4). Wisdom''s wilderness draught and the smitten stone are one witness — the provision that followed Yashar''el was the Anointed.',
       sv.verse_id, ev.verse_id, 'extras', 58250
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-punished-by-what-they-sinned',
       E'Punished by the very thing wherewith they sinned — the river to blood',
       E'Wisdom states the law of measured judgment plainly: *For by what things their enemies were punished, by the same they in their need were benefited.* (the-wisdom-of-solomon 11:5) — *For instead of a perpetual running river troubled with foul blood* (the-wisdom-of-solomon 11:6), Israel was given clean water. The fouled river is the first plague: *And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* (Exodus 7:20). Wisdom distills the principle into a maxim, *That they might know, that wherewithal a man sinneth, by the same also shall he be punished.* (the-wisdom-of-solomon 11:16) — the bloodied Nile that drowned the infants becomes the measure of Egypt''s reproof while Israel drinks from the rock.',
       sv.verse_id, ev.verse_id, 'extras', 58253
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-measure-number-weight',
       E'Ordered all things in measure and number and weight',
       E'Wisdom closes the plague-meditation with the great creation maxim: *but you have ordered all things in measure and number and weight.* (the-wisdom-of-solomon 11:20). This is the Creator who weighs creation: *To make the weight for the winds; and he weigheth the waters by measure.* (Job 28:25), and the One whom Isaiah praises, *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* (Isaiah 40:12). The judgments on Egypt are no caprice but the same exact ordering by which the world was framed — measure, number, weight — the wisdom that lays out the wind and the sea.',
       sv.verse_id, ev.verse_id, 'extras', 58256
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-world-a-grain-of-the-balance',
       E'The whole world a little grain of the balance, a drop of dew',
       E'Against the measured power, Wisdom sets the smallness of creation before Yahuah: *For the whole world before you is as a little grain of the balance, yes, as a drop of the morning dew that falls down upon the earth.* (the-wisdom-of-solomon 11:22). The same scale runs in the wisdom of Yeshua ben Sira: *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity.* (Ecclesiasticus 18:10) — and there too it is the ground of patience, *Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them.* (Ecclesiasticus 18:11). It ain''t new: the deuterocanon speaks with one voice — because the world weighs nothing against Him, His strength is never threatened, and so He can afford to be merciful.',
       sv.verse_id, ev.verse_id, 'extras', 58259
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-thou-lovest-all-thou-sparest-all',
       E'Thou lovest all, abhorrest nothing — O Yahuah, thou lover of souls',
       E'Wisdom ends with one of Scripture''s tenderest confessions of divine mercy: *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* (the-wisdom-of-solomon 11:23) — *For you lovest all the things that are, and abhorrest nothing which you have made: for never wouldest you have made any thing, if you had hated it.* (the-wisdom-of-solomon 11:24) — *But you sparest all: for they are yours, O Yahuah (God), you lover of souls.* (the-wisdom-of-solomon 11:26). This is the David of the Psalms: *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* (Psalms 145:9), and the Yahuah who reasons with Jonah, *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* (Jonah 4:11), the One who swears, *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* (Ezekiel 18:32). It ain''t new — Ben Sira sang it already: *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* (Ecclesiasticus 18:13). Judgment is measured; mercy is over all His works.',
       sv.verse_id, ev.verse_id, 'extras', 58262
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-11-water-from-the-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:6 — *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink. And Moses did so in the sight of the elders of Yashar''el (Israel).* The Horeb rock is the very flinty stone Wisdom of Solomon 11:4 says quenched their thirst.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-water-from-the-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 20:11 — *And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also.* The water out of the hard stone in Wisdom of Solomon 11:4 is the Meribah gift, given abundantly to the thirsty congregation.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-water-from-the-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 10:4 — *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* Paul names the Rock Wisdom of Solomon 11:4 remembers — the wilderness draught was Messiah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-water-from-the-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-punished-by-what-they-sinned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:20 — *And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* The perpetual river troubled with foul blood in Wisdom of Solomon 11:6 is the first plague turning the Nile to blood.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-punished-by-what-they-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-measure-number-weight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:25 — *To make the weight for the winds; and he weigheth the waters by measure.* Job''s wisdom-poem gives the same weighing and measuring Wisdom of Solomon 11:20 ascribes to the Creator who ordered all things.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-measure-number-weight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* Isaiah''s measuring, meting, and weighing is the cosmic order Wisdom of Solomon 11:20 names as measure and number and weight.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-measure-number-weight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-world-a-grain-of-the-balance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 18:10 — *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity.* Ben Sira''s drop-and-gravelstone matches Wisdom of Solomon 11:22''s grain of the balance and drop of dew — creation is nothing beside the Eternal.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-world-a-grain-of-the-balance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 18:11 — *Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them.* Ben Sira draws the same conclusion Wisdom of Solomon 11:22-23 draws — the world''s smallness is the ground of His patience and outpoured mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-world-a-grain-of-the-balance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-thou-lovest-all-thou-sparest-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* David''s mercy over all His works is the very confession of Wisdom of Solomon 11:23-24, that He loves all He has made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 4:11 — *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* Yahuah''s plea to spare Nineveh enacts Wisdom of Solomon 11:24''s truth that He abhors nothing He has made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The God who takes no pleasure in death is the lover of souls who spares all in Wisdom of Solomon 11:26.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 18:13 — *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* Ben Sira''s mercy upon all flesh is the same lover-of-souls confession Wisdom of Solomon 11:26 makes.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

