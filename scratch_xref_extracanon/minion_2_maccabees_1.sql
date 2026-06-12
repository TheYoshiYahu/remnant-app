-- ----- fragment: minion_2maccabees_01.sql (session253 2-maccabees 1) -----
-- Source anchor: apocrypha/2-maccabees ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac1 (view _session253_2mac1_lookup). Sort band base 62000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-1-covenant-keep-the-law
  ('apocrypha', '2-maccabees', 1, 2, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The very covenant with Abraham, Isaac, and Jacob the brethren ask Yahuah to remember in 2 Maccabees 1:2.'),
  ('apocrypha', '2-maccabees', 1, 2, 'canon', 'nehemiah', 9, 7, 'free', E'Nehemiah 9:7 — *Thou art Yahuah (LORD) the Elohim (God), who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham.* The same electing God of the fathers whom the letter blesses in 2 Maccabees 1:2.'),
  -- thread: 2-maccabees-1-keep-the-feast-dedication
  ('apocrypha', '2-maccabees', 1, 18, 'apocrypha', '1-maccabees', 4, 59, 'extras', E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The companion record of the very feast of dedication the letter of 2 Maccabees 1:18 urges Egypt to keep.'),
  ('apocrypha', '2-maccabees', 1, 18, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Messiah keeps in the temple the very Casleu dedication-feast the brethren command in 2 Maccabees 1:18.'),
  -- thread: 2-maccabees-1-hidden-fire-kindled-by-sun
  ('apocrypha', '2-maccabees', 1, 19, 'canon', 'leviticus', 6, 12, 'free', E'Leviticus 6:12 — *And the fire upon the altar shall be burning in it; it shall not be put out: and the priest shall burn wood on it every morning, and lay the burnt offering in order upon it; and he shall burn thereon the fat of the peace offerings.* The ever-burning altar-fire the devout priests guarded as thick water through the exile in 2 Maccabees 1:19.'),
  ('apocrypha', '2-maccabees', 1, 22, 'canon', 'leviticus', 9, 24, 'free', E'Leviticus 9:24 — *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces.* The original heaven-sent altar-fire whose marvellous re-kindling by the sun astonishes every man in 2 Maccabees 1:22.'),
  ('apocrypha', '2-maccabees', 1, 21, 'canon', '1-kings', 18, 38, 'free', E'1 Kings 18:38 — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench.* As Elijah''s fire devoured the water-soaked sacrifice, so the hidden fire blazes from the water Neemias sprinkled in 2 Maccabees 1:21.'),
  -- thread: 2-maccabees-1-gather-the-scattered-plant-thy-people
  ('apocrypha', '2-maccabees', 1, 29, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The very word of Moses that Neemias invokes when he prays Yahuah to plant His people again in 2 Maccabees 1:29.'),
  ('apocrypha', '2-maccabees', 1, 27, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The two-house regathering from the heathen that Neemias prays for the scattered in 2 Maccabees 1:27.'),
  ('apocrypha', '2-maccabees', 1, 27, 'canon', 'psalms', 147, 2, 'free', E'Psalms 147:2 — *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* The same gathering God whom Neemias entreats to bring home the scattered and despised in 2 Maccabees 1:27.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-1-covenant-keep-the-law',
       E'Remember His covenant — open your hearts in His law',
       E'The brethren at Jerusalem write to the brethren in Egypt, and the blessing they pronounce is pure covenant: *Yahuah (God) be gracious to you, and remember his covenant that he made with Abraham, Isaac, and Jacob, his faithful servants* (2 Maccabees 1:2), praying Elohim would *open your hearts in his law and commandments, and send you peace* (2 Maccabees 1:4). This is no church newly invented but the one seed kept under the one covenant. It is the everlasting promise to Abraham: *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* (Genesis 17:7). The God they bless is the One who chose the fathers: *Thou art Yahuah (LORD) the Elohim (God), who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham* (Nehemiah 9:7). The law is not a curse to escape but the place where the heart is opened.',
       sv.verse_id, ev.verse_id, 'extras', 62000
  FROM _session253_2mac1_lookup sv, _session253_2mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-1-keep-the-feast-dedication',
       E'Keep the feast — the dedication the Messiah kept',
       E'Twice the letter commands the brethren in Egypt to keep the appointed time: *And now see that you keep the feast of tabernacles in the month Casleu* (2 Maccabees 1:9), and again, *whereas we are now purposed to keep the purification of the temple upon the five and twentieth day of the month Casleu... that you also might keep it* (2 Maccabees 1:18). This is the very ordinance the Maccabees established: *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness* (1 Maccabees 4:59). It is the feast Yahusha Himself walked in: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The keeping of the moedim is no Jewish relic but the rhythm the Messiah honoured.',
       sv.verse_id, ev.verse_id, 'extras', 62003
  FROM _session253_2mac1_lookup sv, _session253_2mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-1-hidden-fire-kindled-by-sun',
       E'The hidden fire — quenched not, kindled by the sun',
       E'Here is the wonder of the chapter: the altar fire was hidden in exile and raised again as water that blazed at the touch of the sun. *The priests that were then devout took the fire of the altar privily, and hid it in an hollow place of a pit without water, where they kept it sure* (2 Maccabees 1:19); and when poured upon the wood, *the time came that the sun shone, which afore was hid in the cloud, there was a great fire kindled, so that every man marvelled* (2 Maccabees 1:22). This is the fire Torah commanded never to die: *And the fire upon the altar shall be burning in it; it shall not be put out: and the priest shall burn wood on it every morning, and lay the burnt offering in order upon it; and he shall burn thereon the fat of the peace offerings* (Leviticus 6:12). Its first kindling came from heaven itself: *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces* (Leviticus 9:24); and on Carmel it fell again and licked up the water — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench* (1 Kings 18:38). The unquenchable flame is the witness that the covenant was never abolished, only hidden, to blaze again at the appointed time.',
       sv.verse_id, ev.verse_id, 'extras', 62006
  FROM _session253_2mac1_lookup sv, _session253_2mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-1-gather-the-scattered-plant-thy-people',
       E'Gather the scattered — plant Thy people in Thy holy place',
       E'Neemias'' prayer over the rekindled altar is the cry of the whole exile: *Gather those together that are scattered from us, deliver them that serve among the heathen, look upon them that are despised and abhorred, and let the heathen know that you are our Elohim (God)* (2 Maccabees 1:27), and *Plant your people again in your holy place, as Moses has spoken* (2 Maccabees 1:29). He prays Moses'' own promise: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). It is the regathering Ezekiel saw of the two-house people: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21); the work of the One who *doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel)* (Psalms 147:2). Not a people replaced, but the covenant seed planted again in His holy place.',
       sv.verse_id, ev.verse_id, 'extras', 62009
  FROM _session253_2mac1_lookup sv, _session253_2mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=1 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-1-covenant-keep-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The very covenant with Abraham, Isaac, and Jacob the brethren ask Yahuah to remember in 2 Maccabees 1:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-covenant-keep-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:7 — *Thou art Yahuah (LORD) the Elohim (God), who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham.* The same electing God of the fathers whom the letter blesses in 2 Maccabees 1:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-covenant-keep-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-1-keep-the-feast-dedication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The companion record of the very feast of dedication the letter of 2 Maccabees 1:18 urges Egypt to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-keep-the-feast-dedication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=59
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Messiah keeps in the temple the very Casleu dedication-feast the brethren command in 2 Maccabees 1:18.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-keep-the-feast-dedication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-1-hidden-fire-kindled-by-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 6:12 — *And the fire upon the altar shall be burning in it; it shall not be put out: and the priest shall burn wood on it every morning, and lay the burnt offering in order upon it; and he shall burn thereon the fat of the peace offerings.* The ever-burning altar-fire the devout priests guarded as thick water through the exile in 2 Maccabees 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-hidden-fire-kindled-by-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 9:24 — *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces.* The original heaven-sent altar-fire whose marvellous re-kindling by the sun astonishes every man in 2 Maccabees 1:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-hidden-fire-kindled-by-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 18:38 — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench.* As Elijah''s fire devoured the water-soaked sacrifice, so the hidden fire blazes from the water Neemias sprinkled in 2 Maccabees 1:21.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-hidden-fire-kindled-by-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-1-gather-the-scattered-plant-thy-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The very word of Moses that Neemias invokes when he prays Yahuah to plant His people again in 2 Maccabees 1:29.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-gather-the-scattered-plant-thy-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The two-house regathering from the heathen that Neemias prays for the scattered in 2 Maccabees 1:27.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-gather-the-scattered-plant-thy-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 147:2 — *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* The same gathering God whom Neemias entreats to bring home the scattered and despised in 2 Maccabees 1:27.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac1_lookup sv, _session253_2mac1_lookup tv
 WHERE t.slug='2-maccabees-1-gather-the-scattered-plant-thy-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

