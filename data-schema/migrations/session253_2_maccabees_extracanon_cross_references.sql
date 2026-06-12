-- =====================================================================
-- Session 253 — 2 Maccabees FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_2_maccabees_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 2 Maccabees cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_2maccabees_02.sql (session253 2-maccabees 2) -----
-- Source anchor: apocrypha/2-maccabees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac2 (view _session253_2mac2_lookup). Sort band base 62025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-2-hidden-ark
  ('apocrypha', '2-maccabees', 2, 5, 'canon', 'revelation', 11, 19, 'free', E'Revelation 11:19 — *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail.* The ark Jeremy stopped in the cave is the very ark John sees revealed when the heavenly temple is opened at the end.'),
  ('apocrypha', '2-maccabees', 2, 4, 'canon', 'jeremiah', 3, 16, 'free', E'Jeremiah 3:16 — *And it shall come to pass, when ye be multiplied and increased in the land, in those days, saith Yahuah (LORD), they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more.* The same prophet who hid the ark had already foretold that one day the people would no longer cling to the box itself.'),
  -- thread: 2-maccabees-2-unknown-till-the-gathering
  ('apocrypha', '2-maccabees', 2, 7, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The unknown cave waits for the very gathering-and-mercy Moses had sworn into the law.'),
  ('apocrypha', '2-maccabees', 2, 7, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* Jeremy''s regathered people are the two scattered houses Yahuah re-gathers, not a replacement people.'),
  ('apocrypha', '2-maccabees', 2, 7, 'canon', 'jeremiah', 3, 18, 'free', E'Jeremiah 3:18 — *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers.* The prophet who hid the ark names the gathering as Judah and Israel walking home together — the time the cave is opened.'),
  -- thread: 2-maccabees-2-glory-and-the-cloud
  ('apocrypha', '2-maccabees', 2, 8, 'canon', 'exodus', 40, 34, 'free', E'Exodus 40:34 — *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle.* The glory and the cloud Jeremy promises will reappear are exactly what fell on the tabernacle Moses reared up.'),
  ('apocrypha', '2-maccabees', 2, 8, 'canon', '2-chronicles', 5, 14, 'free', E'2 Chronicles 5:14 — *So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God).* The same cloud-and-glory that Solomon saw when the place was sanctified is the sign Jeremy says shall appear at the gathering.'),
  ('apocrypha', '2-maccabees', 2, 8, 'canon', '1-kings', 8, 11, 'free', E'1 Kings 8:11 — *So that the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house of Yahuah (LORD).* Solomon''s dedication, named in the same breath by Jeremy, is sealed by the cloud-glory pledged to return.'),
  -- thread: 2-maccabees-2-fire-from-heaven-eight-days
  ('apocrypha', '2-maccabees', 2, 10, 'canon', '2-chronicles', 7, 1, 'free', E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* This is the very fire-from-heaven Jeremy''s record says answered Solomon''s prayer.'),
  ('apocrypha', '2-maccabees', 2, 12, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Solomon''s eight-day dedication becomes the Feast of Dedication the Messiah kept in Jerusalem.'),
  ('apocrypha', '2-maccabees', 2, 12, 'apocrypha', '1-maccabees', 4, 56, 'extras', E'1 Maccabees 4:56 — *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness, and sacrificed the sacrifice of deliverance and praise.* The Maccabees'' own eight-day rededication answers to Solomon''s eight days that Jeremy''s writing recorded.'),
  -- thread: 2-maccabees-2-gathered-out-of-every-land
  ('apocrypha', '2-maccabees', 2, 18, 'canon', 'deuteronomy', 30, 4, 'free', E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The letter''s prayer to be gathered out of every land under heaven is Moses'' own promise of the regathering.'),
  ('apocrypha', '2-maccabees', 2, 18, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The deliverance the writer hopes for opens onto the better resurrection of this very book''s tortured martyrs, who would not break covenant.'),
  ('apocrypha', '2-maccabees', 2, 18, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The hope that carries the covenant-keepers through Antiochus'' great troubles is the awakening of the dead to everlasting life.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-hidden-ark',
       E'Jeremy hides the tabernacle and the ark',
       E'When the people were carried away, *the prophet, being warned of Yahuah (God), commanded the tabernacle and the ark to go with him, as he went forth into the mountain, where Moses climbed up, and saw the heritage of Yahuah (God)* (2 Maccabees 2:4); *And when Jeremy came thither, he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door* (2 Maccabees 2:5). The earthly ark is taken from sight — and at the trumpet of the end it is shown again, but in heaven: *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). Jeremy himself had foretold that men would cease to seek the box of acacia and gold: *they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more* (Jeremiah 3:16) — for Yahuah Himself becomes the throne. It ain''t new: the hidden ark waits for the day Yahuah opens His own temple.',
       sv.verse_id, ev.verse_id, 'extras', 62025
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-unknown-till-the-gathering',
       E'Unknown until He gather His people again',
       E'Jeremy blamed those who tried to mark the cave: *As for that place, it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy* (2 Maccabees 2:7). The hiding is keyed to the regathering — the same promise Moses sealed into the Torah: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). It is the two-house ingathering, not a church replacing the seed: *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12); *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18). The covenant people are kept, and gathered to mercy.',
       sv.verse_id, ev.verse_id, 'extras', 62028
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-glory-and-the-cloud',
       E'The glory and the cloud shall appear',
       E'At that gathering the hidden things are restored with the visible Presence: *Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also, as it was shewed under Moses, and as when Solomon desired that the place might be honourably sanctified* (2 Maccabees 2:8). This is the very sign that fell on the wilderness tent: *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34); and again on Solomon''s house: *So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God)* (2 Chronicles 5:14). The same cloud-and-glory that twice marked Yahuah''s dwelling is pledged to return when His people are gathered to mercy.',
       sv.verse_id, ev.verse_id, 'extras', 62031
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-fire-from-heaven-eight-days',
       E'The fire from heaven and Solomon''s eight days',
       E'Jeremy''s writing recalls how dedication was sealed by fire: *And as when Moses prayed to Yahuah (God), the fire came down from heaven, and consumed the sacrifices: even so prayed Solomon also, and the fire came down from heaven, and consumed the burnt offerings* (2 Maccabees 2:10), and *So Solomon kept those eight days* (2 Maccabees 2:12). Scripture records that very fire: *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1). The eight-day dedication becomes the pattern the Maccabees keep, and the feast the Messiah Himself walked in: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22); *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness, and sacrificed the sacrifice of deliverance and praise* (1 Maccabees 4:56). It ain''t new: the fire, the glory, the eight days — one unbroken feast of dedication.',
       sv.verse_id, ev.verse_id, 'extras', 62034
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-gathered-out-of-every-land',
       E'Gathered out of every land; the better resurrection',
       E'The letter prays for the same mercy and gathering: *will shortly have mercy upon us, and gather us together out of every land under heaven into the holy place: for he has delivered us out of great troubles, and has purified the place* (2 Maccabees 2:18), as they call the brethren to keep the feast: *you shall do well, if you keep the same days* (2 Maccabees 2:16). This is Moses'' oath again: *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee* (Deuteronomy 30:4). And the hope that holds the Torah-faithful through Antiochus'' troubles is bodily resurrection — the very hope this book''s seven brothers confess (2 Maccabees 7), to which Hebrews points back: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35); *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Delivered, purified, gathered — and raised.',
       sv.verse_id, ev.verse_id, 'extras', 62037
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-2-hidden-ark
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 11:19 — *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail.* The ark Jeremy stopped in the cave is the very ark John sees revealed when the heavenly temple is opened at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-hidden-ark'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 3:16 — *And it shall come to pass, when ye be multiplied and increased in the land, in those days, saith Yahuah (LORD), they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more.* The same prophet who hid the ark had already foretold that one day the people would no longer cling to the box itself.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-hidden-ark'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-unknown-till-the-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The unknown cave waits for the very gathering-and-mercy Moses had sworn into the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-unknown-till-the-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* Jeremy''s regathered people are the two scattered houses Yahuah re-gathers, not a replacement people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-unknown-till-the-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 3:18 — *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers.* The prophet who hid the ark names the gathering as Judah and Israel walking home together — the time the cave is opened.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-unknown-till-the-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-glory-and-the-cloud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 40:34 — *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle.* The glory and the cloud Jeremy promises will reappear are exactly what fell on the tabernacle Moses reared up.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-glory-and-the-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 5:14 — *So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God).* The same cloud-and-glory that Solomon saw when the place was sanctified is the sign Jeremy says shall appear at the gathering.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-glory-and-the-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:11 — *So that the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house of Yahuah (LORD).* Solomon''s dedication, named in the same breath by Jeremy, is sealed by the cloud-glory pledged to return.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-glory-and-the-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-fire-from-heaven-eight-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* This is the very fire-from-heaven Jeremy''s record says answered Solomon''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-fire-from-heaven-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Solomon''s eight-day dedication becomes the Feast of Dedication the Messiah kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-fire-from-heaven-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 4:56 — *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness, and sacrificed the sacrifice of deliverance and praise.* The Maccabees'' own eight-day rededication answers to Solomon''s eight days that Jeremy''s writing recorded.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-fire-from-heaven-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-gathered-out-of-every-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The letter''s prayer to be gathered out of every land under heaven is Moses'' own promise of the regathering.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-gathered-out-of-every-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The deliverance the writer hopes for opens onto the better resurrection of this very book''s tortured martyrs, who would not break covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-gathered-out-of-every-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The hope that carries the covenant-keepers through Antiochus'' great troubles is the awakening of the dead to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-gathered-out-of-every-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_03.sql (session253 2-maccabees 3) -----
-- Source anchor: apocrypha/2-maccabees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac3 (view _session253_2mac3_lookup). Sort band base 62050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-3-widows-treasure
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'exodus', 22, 22, 'free', E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child.* The treasury Heliodorus came to seize was the very substance the Torah forbids any man to afflict.'),
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'deuteronomy', 10, 18, 'free', E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* Yahuah Himself defends the cause whose relief was laid up in the house at 2-maccabees 3:10.'),
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'psalms', 68, 5, 'free', E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* The God of the widow dwells in the very habitation Heliodorus presumed to plunder.'),
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The same covenant care the temple stored is named the heart of pure religion — it ain''t new.'),
  ('apocrypha', '2-maccabees', 3, 10, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The restored Tobit names the almsgiving for the poor that the temple treasury safeguarded in 2-maccabees 3:10.'),
  -- thread: 2-maccabees-3-priests-supplication
  ('apocrypha', '2-maccabees', 3, 15, 'canon', 'joel', 2, 17, 'free', E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* The very prophetic liturgy the priests enact prostrate before the altar in 2-maccabees 3:15.'),
  ('apocrypha', '2-maccabees', 3, 15, 'canon', 'numbers', 16, 48, 'free', E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* As Aaron''s priestly standing turned back wrath, so the priests'' supplication stands between the temple and the spoiler at 2-maccabees 3:15.'),
  ('apocrypha', '2-maccabees', 3, 22, 'canon', 'psalms', 127, 1, 'free', E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The people commit the keeping to the Almighty in 2-maccabees 3:22 because no human watch can guard the house.'),
  ('apocrypha', '2-maccabees', 3, 15, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The interceding priesthood of Onias points to the High Priest who ever lives to intercede — it ain''t new.'),
  -- thread: 2-maccabees-3-dread-horseman
  ('apocrypha', '2-maccabees', 3, 25, 'canon', 'joshua', 5, 13, 'free', E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The armed rider who strikes Heliodorus in 2-maccabees 3:25 is the same captain-of-the-host who stood sword-drawn for the LORD''s place.'),
  ('apocrypha', '2-maccabees', 3, 24, 'canon', 'joshua', 5, 14, 'free', E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The Prince of all power who causes the apparition in 2-maccabees 3:24 is the captain of Yahuah''s host come to defend His own.'),
  ('apocrypha', '2-maccabees', 3, 24, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The same heaven that smote Assyria for besieging Jerusalem strikes Heliodorus'' host in 2-maccabees 3:24.'),
  ('apocrypha', '2-maccabees', 3, 24, 'canon', '2-chronicles', 32, 21, 'free', E'2 Chronicles 32:21 — *And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria. So he returned with shame of face to his own land...* As one angel cut off Sennacherib''s captains, so the apparition routs the king''s treasurer in 2-maccabees 3:24.'),
  ('apocrypha', '2-maccabees', 3, 25, 'canon', 'psalms', 35, 5, 'free', E'Psalm 35:5 — *Let them be as chaff before the wind: and let the angel of Yahuah (LORD) chase them.* The fiercely running rider of 2-maccabees 3:25 is the chasing angel the psalmist summoned against the oppressors of the righteous.'),
  -- thread: 2-maccabees-3-cast-down-and-spared
  ('apocrypha', '2-maccabees', 3, 27, 'canon', 'acts', 9, 3, 'free', E'Acts 9:3 — *And as he journeyed, he came near Damascus: and suddenly there shined round about him a light from heaven:* As light from heaven felled the persecutor Saul, the dread apparition compasses Heliodorus with great darkness and casts him down in 2-maccabees 3:27.'),
  ('apocrypha', '2-maccabees', 3, 27, 'canon', 'acts', 9, 4, 'free', E'Acts 9:4 — *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* Like Saul thrown to the earth and then made a herald, Heliodorus falls suddenly and is sent to declare the power he fought, in 2-maccabees 3:27,34.'),
  ('apocrypha', '2-maccabees', 3, 29, 'canon', 'psalms', 76, 7, 'free', E'Psalm 76:7 — *Thou, even thou, art to be feared: and who may stand in thy sight when once thou art angry?* Heliodorus lies cast down and speechless in 2-maccabees 3:29 because no man may stand before the wrath of Yahuah.'),
  ('apocrypha', '2-maccabees', 3, 27, 'apocrypha', '2-maccabees', 9, 5, 'extras', E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts;* The treasurer Heliodorus is felled and spared at a priest''s prayer in 2-maccabees 3:27, but the unrepentant Antiochus who likewise raged against the sanctuary is struck without remedy.'),
  -- thread: 2-maccabees-3-he-that-dwells-in-heaven-defends
  ('apocrypha', '2-maccabees', 3, 39, 'canon', 'psalms', 127, 1, 'free', E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* Heliodorus confesses in 2-maccabees 3:39 that He who dwells in heaven keeps the place no man''s labour could defend.'),
  ('apocrypha', '2-maccabees', 3, 39, 'canon', 'zechariah', 2, 5, 'free', E'Zechariah 2:5 — *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her.* The God who keeps His eye on the place and beats off its enemies in 2-maccabees 3:39 is the wall of fire round His city.'),
  ('apocrypha', '2-maccabees', 3, 39, 'canon', 'isaiah', 31, 5, 'free', E'Isaiah 31:5 — *As birds flying, so will Yahuah Tseva''ot (LORD of hosts) defend Jerusalem; defending also he will deliver it; and passing over he will preserve it.* The LORD who defends and preserves Jerusalem is the same that defendeth His place against all who would hurt it in 2-maccabees 3:39.'),
  ('apocrypha', '2-maccabees', 3, 38, 'canon', '2-thessalonians', 1, 6, 'free', E'2 Thessalonians 1:6 — *Seeing it is a righteous thing with Elohim (God) to recompense tribulation to them that trouble you;* The well-scourged spoiler of 2-maccabees 3:38 shows the righteous recompense the apostle promises to all who trouble the covenant people — it ain''t new.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-widows-treasure',
       E'The treasure of the widow and the fatherless',
       E'When Heliodorus comes to plunder the temple, the high priest tells him what the treasury truly holds: *Then the high priest told him that there was such money laid up for the relief of widows and fatherless children:* (2 Maccabees 3:10) — the king''s man covets gold, but it is the substance of the helpless. The Torah set a fence around exactly this: *Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22), for of Yahuah it is said *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* (Deuteronomy 10:18) and *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5). The same covenant heart runs straight into the apostolic age — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* (James 1:27) — it ain''t new. And the restored Tobit names the very almsgiving the temple safeguarded: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7). To rob this house is to rob the poor of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 62050
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-priests-supplication',
       E'The priests cry out between the porch and the altar',
       E'Against the king''s decree the city does not arm itself but prays: *But the priests, prostrating themselves before the altar in their priests'' vestments, called to heaven upon him that made a law concerning things given to be kept, that they should safely be preserved for such as had committed them to be kept.* (2 Maccabees 3:15), and all the people *called upon the Almighty Yahuah (God) to keep the things committed of trust safe and sure for those that had committed them.* (2 Maccabees 3:22). This is the prophet''s own liturgy of intercession: *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them...* (Joel 2:17). It is Aaron standing in the breach — *And he stood between the dead and the living; and the plague was stayed.* (Numbers 16:48) — for no watchman avails alone: *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* (Psalm 127:1). And the priestly intercession of Onias foreshadows the High Priest who *is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* (Hebrews 7:25).',
       sv.verse_id, ev.verse_id, 'extras', 62053
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-dread-horseman',
       E'The dread horseman and the captain of the host',
       E'Heliodorus presumes to enter, and heaven answers in arms: *Yahuah (God) of spirits, and the Prince of all power, caused a great apparition...* (2 Maccabees 3:24), *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* (2 Maccabees 3:25). This is the armed Prince Joshua met before Jericho: *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand...* (Joshua 5:13), *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come...* (Joshua 5:14). It is the lone angel who routs an empire — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand...* (2 Kings 19:35), *And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria...* (2 Chronicles 32:21) — and the chasing angel of the psalm: *Let them be as chaff before the wind: and let the angel of Yahuah (LORD) chase them.* (Psalm 35:5). The kingdom of man marches on the holy place; the host of heaven scatters it.',
       sv.verse_id, ev.verse_id, 'extras', 62056
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-cast-down-and-spared',
       E'Cast down speechless, raised up a witness',
       E'The two young men scourge the spoiler and he falls: *And Heliodorus fell suddenly to the ground, and was compassed with great darkness...* (2 Maccabees 3:27), *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life.* (2 Maccabees 3:29) — yet at Onias'' atoning prayer he is spared and sent out to *declare to all men the mighty power of Yahuah (God).* (2 Maccabees 3:34). The persecutor felled by light and raised a herald is the very shape of Saul on the Damascus road: *And as he journeyed, he came near Damascus: and suddenly there shined round about him a light from heaven:* (Acts 9:3), *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). For no flesh may stand when heaven rises: *Thou, even thou, art to be feared: and who may stand in thy sight when once thou art angry?* (Psalm 76:7). And the lesson Heliodorus learns the hard kings refuse — in the very same book Antiochus, who like Heliodorus stretched out his hand against the sanctuary, is met not with mercy but the end of the proud: *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague... and sore torments of the inner parts;* (2 Maccabees 9:5).',
       sv.verse_id, ev.verse_id, 'extras', 62059
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-he-that-dwells-in-heaven-defends',
       E'He that dwells in heaven defends His place',
       E'Heliodorus himself bears the verdict back to the king: *If you have any enemy or traitor, send him thither, and you shall receive him well scourged, if he escape with his life: for in that place, no doubt, there is an especial power of Yahuah (God).* (2 Maccabees 3:38), *For he that dwells in heaven has his eye on that place, and defendeth it; and he beateth and destroys them that come to hurt it.* (2 Maccabees 3:39). The watchman is Yahuah Himself: *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* (Psalm 127:1), who promises to His city *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her.* (Zechariah 2:5), and who covers it like birds in flight — *As birds flying, so will Yahuah Tseva''ot (LORD of hosts) defend Jerusalem; defending also he will deliver it; and passing over he will preserve it.* (Isaiah 31:5). It is no less than the righteous judgment the apostle preaches — *Seeing it is a righteous thing with Elohim (God) to recompense tribulation to them that trouble you;* (2 Thessalonians 1:6). The kingdom of man cannot strip the house its Builder guards.',
       sv.verse_id, ev.verse_id, 'extras', 62062
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-3-widows-treasure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child.* The treasury Heliodorus came to seize was the very substance the Torah forbids any man to afflict.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* Yahuah Himself defends the cause whose relief was laid up in the house at 2-maccabees 3:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* The God of the widow dwells in the very habitation Heliodorus presumed to plunder.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The same covenant care the temple stored is named the heart of pure religion — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The restored Tobit names the almsgiving for the poor that the temple treasury safeguarded in 2-maccabees 3:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-priests-supplication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* The very prophetic liturgy the priests enact prostrate before the altar in 2-maccabees 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* As Aaron''s priestly standing turned back wrath, so the priests'' supplication stands between the temple and the spoiler at 2-maccabees 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The people commit the keeping to the Almighty in 2-maccabees 3:22 because no human watch can guard the house.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The interceding priesthood of Onias points to the High Priest who ever lives to intercede — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-dread-horseman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The armed rider who strikes Heliodorus in 2-maccabees 3:25 is the same captain-of-the-host who stood sword-drawn for the LORD''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The Prince of all power who causes the apparition in 2-maccabees 3:24 is the captain of Yahuah''s host come to defend His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The same heaven that smote Assyria for besieging Jerusalem strikes Heliodorus'' host in 2-maccabees 3:24.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 32:21 — *And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria. So he returned with shame of face to his own land...* As one angel cut off Sennacherib''s captains, so the apparition routs the king''s treasurer in 2-maccabees 3:24.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 35:5 — *Let them be as chaff before the wind: and let the angel of Yahuah (LORD) chase them.* The fiercely running rider of 2-maccabees 3:25 is the chasing angel the psalmist summoned against the oppressors of the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-cast-down-and-spared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:3 — *And as he journeyed, he came near Damascus: and suddenly there shined round about him a light from heaven:* As light from heaven felled the persecutor Saul, the dread apparition compasses Heliodorus with great darkness and casts him down in 2-maccabees 3:27.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:4 — *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* Like Saul thrown to the earth and then made a herald, Heliodorus falls suddenly and is sent to declare the power he fought, in 2-maccabees 3:27,34.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 76:7 — *Thou, even thou, art to be feared: and who may stand in thy sight when once thou art angry?* Heliodorus lies cast down and speechless in 2-maccabees 3:29 because no man may stand before the wrath of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts;* The treasurer Heliodorus is felled and spared at a priest''s prayer in 2-maccabees 3:27, but the unrepentant Antiochus who likewise raged against the sanctuary is struck without remedy.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-he-that-dwells-in-heaven-defends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* Heliodorus confesses in 2-maccabees 3:39 that He who dwells in heaven keeps the place no man''s labour could defend.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 2:5 — *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her.* The God who keeps His eye on the place and beats off its enemies in 2-maccabees 3:39 is the wall of fire round His city.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 31:5 — *As birds flying, so will Yahuah Tseva''ot (LORD of hosts) defend Jerusalem; defending also he will deliver it; and passing over he will preserve it.* The LORD who defends and preserves Jerusalem is the same that defendeth His place against all who would hurt it in 2-maccabees 3:39.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Thessalonians 1:6 — *Seeing it is a righteous thing with Elohim (God) to recompense tribulation to them that trouble you;* The well-scourged spoiler of 2-maccabees 3:38 shows the righteous recompense the apostle promises to all who trouble the covenant people — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_04.sql (session253 2-maccabees 4) -----
-- Source anchor: apocrypha/2-maccabees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac4 (view _session253_2mac4_lookup). Sort band base 62075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-4-priesthood-for-sale
  ('apocrypha', '2-maccabees', 4, 8, 'canon', 'micah', 3, 11, 'free', E'Micah 3:11 — *The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us.* Jason''s purchase of the priesthood for silver is exactly the priests-teaching-for-hire the prophet condemned, the office turned to gain.'),
  ('apocrypha', '2-maccabees', 4, 24, 'canon', 'acts', 8, 20, 'free', E'Acts 8:20 — *But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* Menelaus outbidding Jason for the holy office is the very simony Peter rebukes — the gift of Elohim treated as a thing to be bought.'),
  ('apocrypha', '2-maccabees', 4, 24, 'canon', '1-timothy', 6, 10, 'free', E'1 Timothy 6:10 — *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.* Menelaus erring from the covenant for silver, then sliding into theft and murder, traces the very pierced-through path Paul names.'),
  ('apocrypha', '2-maccabees', 4, 7, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The sister history names the same apostasy under Jason: the leaders forsook the holy covenant and were sold to do mischief.'),
  -- thread: 2-maccabees-4-customs-against-the-law
  ('apocrypha', '2-maccabees', 4, 11, 'canon', 'daniel', 11, 30, 'free', E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Jason and his Antiochians are the men who forsake the holy covenant whom Antiochus has intelligence with, the inside hand of Daniel''s vision.'),
  ('apocrypha', '2-maccabees', 4, 12, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The gymnasium built under the temple tower is the first pollution of the sanctuary that ripens into Daniel''s abomination of desolation.'),
  ('apocrypha', '2-maccabees', 4, 13, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reaches back through this Greekifying of the holy place to warn of the last abomination — the same antichrist pattern of the kingdom-of-man.'),
  ('apocrypha', '2-maccabees', 4, 11, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The parallel record makes the gymnasium''s meaning plain: the new customs against the law were a forsaking of the holy covenant itself.'),
  -- thread: 2-maccabees-4-priests-from-the-altar
  ('apocrypha', '2-maccabees', 4, 14, 'canon', 'malachi', 2, 7, 'free', E'Malachi 2:7 — *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* The priests who lose courage to serve at the altar have abandoned the very office Malachi defines — the messenger meant to keep knowledge and the law.'),
  ('apocrypha', '2-maccabees', 4, 14, 'canon', 'malachi', 2, 8, 'free', E'Malachi 2:8 — *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts).* Priests despising the temple and running to the gymnasium are the departed-out-of-the-way who corrupt the covenant of Levi — corruption from within.'),
  ('apocrypha', '2-maccabees', 4, 15, 'canon', 'hosea', 4, 6, 'free', E'Hosea 4:6 — *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children.* Choosing the glory of the Grecians over the honours of the fathers is exactly the forgotten law of Elohim that unmakes a priesthood.'),
  ('apocrypha', '2-maccabees', 4, 16, 'canon', 'hosea', 4, 8, 'free', E'Hosea 4:8 — *They eat up the sin of my people, and they set their heart on their iniquity.* The priests partaking of the unlawful allowance, profiting off the people''s apostasy, are Hosea''s priests who eat up the sin of the people.'),
  -- thread: 2-maccabees-4-hireling-shepherds
  ('apocrypha', '2-maccabees', 4, 25, 'canon', 'john', 10, 12, 'free', E'John 10:12 — *But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep.* Menelaus, a cruel tyrant who brought nothing worthy the priesthood, is the very hireling the Good Shepherd contrasts with Himself.'),
  ('apocrypha', '2-maccabees', 4, 50, 'canon', 'isaiah', 56, 11, 'free', E'Isaiah 56:11 — *Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter.* Menelaus increasing in malice and covetousness while in authority is Isaiah''s greedy shepherd who looks only to his own gain.'),
  ('apocrypha', '2-maccabees', 4, 25, 'canon', 'ezekiel', 34, 2, 'free', E'Ezekiel 34:2 — *Son of Adam, prophesy against the shepherds of Yashar''el (Israel), prophesy, and say unto them, Thus saith Adonai Yahuah (the Lord GOD) unto the shepherds; Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* The Woe over shepherds who feed themselves falls squarely on Menelaus, the beast-tempered high priest who devours rather than tends the flock.'),
  ('apocrypha', '2-maccabees', 4, 32, 'canon', 'ezekiel', 34, 3, 'free', E'Ezekiel 34:3 — *Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock.* Menelaus stealing the gold vessels of the temple to enrich himself is the shepherd of Ezekiel who plunders the flock he was set to feed.'),
  -- thread: 2-maccabees-4-innocent-blood-onias
  ('apocrypha', '2-maccabees', 4, 35, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The unjust murder of righteous Onias, grieved over by Jew and Gentile alike, is innocent blood that cries from the ground as Abel''s did before it.'),
  ('apocrypha', '2-maccabees', 4, 34, 'canon', 'deuteronomy', 27, 25, 'free', E'Deuteronomy 27:25 — *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen.* Andronicus, persuaded by Menelaus to seize Onias and slay him, falls under Torah''s express curse on the hired killer of an innocent man.'),
  ('apocrypha', '2-maccabees', 4, 35, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The shedding of righteous Onias'' blood near the sanctuary belongs to the long reckoning of all the righteous blood the Messiah names.'),
  ('apocrypha', '2-maccabees', 4, 33, 'apocrypha', 'the-wisdom-of-solomon', 2, 12, 'extras', E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* The ungodly lying in wait for Onias, who reproved their sacrilege, is exactly Wisdom''s plot of the wicked against the law-keeping righteous man.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-priesthood-for-sale',
       E'The high priesthood bought and sold',
       E'The holy office is put up for auction. *Promising to the king by intercession three hundred and threescore talents of silver, and of another revenue eighty talents* (2 Maccabees 4:8) — Jason buys what Yahuah gave by covenant, and Menelaus simply outbids him: *got the priesthood to himself, offering more than Jason by three hundred talents of silver* (2 Maccabees 4:24). The prophets named this rot in the house of Yahuah: *The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:11). The Renewed Covenant calls the same sin by its first New-Testament name when Simon Magus would purchase the Spirit: *But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money* (Acts 8:20) — the very *simony* that takes its name from this traffic. And the root is laid bare: *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). It ain''t new — the man who would buy the altar has already sold the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 62075
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-customs-against-the-law',
       E'New customs against the law — the gymnasium and the abomination',
       E'Jason dismantles the covenant order from within: *putting down the governments which were according to the law, he brought up new customs against the law* (2 Maccabees 4:11), building *a place of exercise under the tower itself* and making the young men *wear a hat* (2 Maccabees 4:12) in the fashion of the heathen. This is the abomination Daniel saw — not first a foreign army but a domestic betrayal: *he shall even return, and have intelligence with them that forsake the holy covenant* (Daniel 11:30), and *they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The Messiah Himself pointed the last generation back to this very desolation: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Antiochus is the pattern of the kingdom-of-man that always works by flattery from inside the camp — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief* (1 Maccabees 1:15). The fight was never against Torah; it was for it.',
       sv.verse_id, ev.verse_id, 'extras', 62078
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-priests-from-the-altar',
       E'The priests despise the altar — corruption from within',
       E'The deepest wound is that the priests themselves abandon the service: *the priests had no courage to serve any more at the altar, but despising the temple, and neglecting the sacrifices, hastened to be partakers of the unlawful allowance in the place of exercise* (2 Maccabees 4:14), *not setting by the honours of their fathers, but liking the glory of the Grecians best of all* (2 Maccabees 4:15). This is Malachi''s indictment to the letter — the priest who should guard knowledge instead leads the stumble: *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7), *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:8). And Hosea weighs the harvest of a priesthood that forgets Torah: *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children* (Hosea 4:6), *They eat up the sin of my people, and they set their heart on their iniquity* (Hosea 4:8). The covenant is corrupted not by the heathen at the gate but by the shepherds at the altar.',
       sv.verse_id, ev.verse_id, 'extras', 62081
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-hireling-shepherds',
       E'The cruel hireling — shepherds who devour the flock',
       E'Menelaus brings *nothing worthy the high priesthood, but having the fury of a cruel tyrant, and the rage of a savage beast* (2 Maccabees 4:25), and to the end *remained still in authority, increasing in malice, and being a great traitor to the citizens* (2 Maccabees 4:50). He is the hireling who fleeces and never feeds. The Good Shepherd set him in sharpest relief: *But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep* (John 10:12). Isaiah saw the same self-serving watchmen: *Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter* (Isaiah 56:11). And Ezekiel pronounced the Woe that hangs over every Menelaus: *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2), *Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock* (Ezekiel 34:3). The false shepherd is no new thing — and Yahuah promises to seek out His own sheep from his hand.',
       sv.verse_id, ev.verse_id, 'extras', 62084
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-innocent-blood-onias',
       E'The blood of righteous Onias',
       E'The righteous high priest, who had withdrawn into sanctuary, is lured out by a false oath and murdered: Andronicus *coming to Onias in deceit, gave him his right hand with oaths... whom forthwith he shut up without regard of justice* (2 Maccabees 4:34), so that *not only the Yahudim (Jews), but many also of other nations, took great indignation, and were much grieved for the unjust murder of the man* (2 Maccabees 4:35) — innocent blood, even the heathen knowing it. From the first murder, such blood has a voice: *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). Torah set the curse upon the hired killer: *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen* (Deuteronomy 27:25). The Messiah gathered every such slaying into one reckoning: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). And Wisdom had already drawn the portrait of this very plot against the just man: *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law* (Wisdom of Solomon 2:12). Yahuah Himself avenged the deed: *Thus Yahuah (God) rewarded him his punishment, as he had deserved* (2 Maccabees 4:38) — the innocent blood does not cry in vain.',
       sv.verse_id, ev.verse_id, 'extras', 62087
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-4-priesthood-for-sale
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 3:11 — *The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us.* Jason''s purchase of the priesthood for silver is exactly the priests-teaching-for-hire the prophet condemned, the office turned to gain.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 8:20 — *But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* Menelaus outbidding Jason for the holy office is the very simony Peter rebukes — the gift of Elohim treated as a thing to be bought.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:10 — *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.* Menelaus erring from the covenant for silver, then sliding into theft and murder, traces the very pierced-through path Paul names.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The sister history names the same apostasy under Jason: the leaders forsook the holy covenant and were sold to do mischief.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-customs-against-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Jason and his Antiochians are the men who forsake the holy covenant whom Antiochus has intelligence with, the inside hand of Daniel''s vision.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The gymnasium built under the temple tower is the first pollution of the sanctuary that ripens into Daniel''s abomination of desolation.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reaches back through this Greekifying of the holy place to warn of the last abomination — the same antichrist pattern of the kingdom-of-man.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The parallel record makes the gymnasium''s meaning plain: the new customs against the law were a forsaking of the holy covenant itself.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-priests-from-the-altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 2:7 — *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* The priests who lose courage to serve at the altar have abandoned the very office Malachi defines — the messenger meant to keep knowledge and the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 2:8 — *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts).* Priests despising the temple and running to the gymnasium are the departed-out-of-the-way who corrupt the covenant of Levi — corruption from within.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 4:6 — *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children.* Choosing the glory of the Grecians over the honours of the fathers is exactly the forgotten law of Elohim that unmakes a priesthood.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 4:8 — *They eat up the sin of my people, and they set their heart on their iniquity.* The priests partaking of the unlawful allowance, profiting off the people''s apostasy, are Hosea''s priests who eat up the sin of the people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-hireling-shepherds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:12 — *But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep.* Menelaus, a cruel tyrant who brought nothing worthy the priesthood, is the very hireling the Good Shepherd contrasts with Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 56:11 — *Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter.* Menelaus increasing in malice and covetousness while in authority is Isaiah''s greedy shepherd who looks only to his own gain.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:2 — *Son of Adam, prophesy against the shepherds of Yashar''el (Israel), prophesy, and say unto them, Thus saith Adonai Yahuah (the Lord GOD) unto the shepherds; Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* The Woe over shepherds who feed themselves falls squarely on Menelaus, the beast-tempered high priest who devours rather than tends the flock.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 34:3 — *Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock.* Menelaus stealing the gold vessels of the temple to enrich himself is the shepherd of Ezekiel who plunders the flock he was set to feed.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-innocent-blood-onias
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The unjust murder of righteous Onias, grieved over by Jew and Gentile alike, is innocent blood that cries from the ground as Abel''s did before it.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 27:25 — *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen.* Andronicus, persuaded by Menelaus to seize Onias and slay him, falls under Torah''s express curse on the hired killer of an innocent man.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The shedding of righteous Onias'' blood near the sanctuary belongs to the long reckoning of all the righteous blood the Messiah names.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* The ungodly lying in wait for Onias, who reproved their sacrilege, is exactly Wisdom''s plot of the wicked against the law-keeping righteous man.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=33
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_05.sql (session253 2-maccabees 5) -----
-- Source anchor: apocrypha/2-maccabees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac5 (view _session253_2mac5_lookup). Sort band base 62100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-5-place-for-the-people
  ('apocrypha', '2-maccabees', 5, 19, 'canon', 'matthew', 12, 6, 'free', E'Matthew 12:6 — *But I say unto you, That in this place is one greater than the temple.* The Messiah, standing in the very temple Antiochus had once defiled, declares Himself greater than it — confirming that the place was always for the sake of the One it pointed to, not the reverse, as 2 Maccabees 5:19 insists.'),
  ('apocrypha', '2-maccabees', 5, 19, 'canon', 'acts', 7, 48, 'free', E'Acts 7:48 — *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet,* Stephen, martyred for the same covenant the Maccabees died for, voices the chronicler''s exact theology — Yahuah is not contained by the building He let Antiochus strip in 2 Maccabees 5:19.'),
  ('apocrypha', '2-maccabees', 5, 19, 'canon', 'acts', 7, 49, 'free', E'Acts 7:49 — *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* Heaven itself is His throne, so the plundered sanctuary of 2 Maccabees 5:19 was never His dwelling but His people''s gift.'),
  ('apocrypha', '2-maccabees', 5, 19, 'canon', '1-kings', 8, 27, 'free', E'1 Kings 8:27 — *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* Solomon confessed at the dedication what the chronicler reaffirms in 2 Maccabees 5:19 — the house could not contain Yahuah, so it was made for the people, not the people for it.'),
  -- thread: 2-maccabees-5-whom-the-lord-loveth-he-chasteneth
  ('apocrypha', '2-maccabees', 5, 17, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The anger ''for a while for the sins'' in 2 Maccabees 5:17 is precisely the scourging of a beloved son, not the wrath of rejection — discipline that proves sonship, never law-as-curse.'),
  ('apocrypha', '2-maccabees', 5, 17, 'apocrypha', '2-maccabees', 6, 12, 'extras', E'2 Maccabees 6:12 — *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* The chronicler''s own gloss on his narrative makes 2 Maccabees 5:17 explicit — these blows are a chastening of the nation, not its destruction.'),
  ('apocrypha', '2-maccabees', 5, 20, 'apocrypha', '2-maccabees', 7, 33, 'extras', E'2 Maccabees 7:33 — *And though the living Yahuah (God) be angry with us a little while for our chastening and correction, yet shall he be at one again with his servants.* The martyrs voice the same hope as 2 Maccabees 5:20 — the wrath is brief, and the reconciled Yahuah sets His people (and His place) up again.'),
  -- thread: 2-maccabees-5-abomination-and-the-slaughter
  ('apocrypha', '2-maccabees', 5, 13, 'canon', 'daniel', 11, 28, 'free', E'Daniel 11:28 — *Then shall he return into his land with great riches; and his heart shall be against the holy covenant; and he shall do exploits, and return to his own land.* Daniel foresaw this very rage against the covenant city that erupts in the slaughter of 2 Maccabees 5:13 — the king whose heart is set against the holy covenant.'),
  ('apocrypha', '2-maccabees', 5, 11, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The desolating power of Daniel''s vision is the very king who ''took the city by force of arms'' in 2 Maccabees 5:11 — the abomination embodied in Antiochus.'),
  ('apocrypha', '2-maccabees', 5, 13, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the Maccabean horror of 2 Maccabees 5:13 into a sign of the last days — the same abomination that desolated the holy place will rise again at the end.'),
  ('apocrypha', '2-maccabees', 5, 14, 'apocrypha', '1-maccabees', 1, 24, 'extras', E'1 Maccabees 1:24 — *And when he had taken all away, he went into his own land, having made a great massacre, and spoken very proudly.* The companion chronicle records the same ''great massacre'' counted in the fourscore thousand of 2 Maccabees 5:14 — one witness confirming the other.'),
  -- thread: 2-maccabees-5-the-holy-vessels-plundered
  ('apocrypha', '2-maccabees', 5, 16, 'apocrypha', '1-maccabees', 1, 21, 'extras', E'1 Maccabees 1:21 — *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof,* The companion account names the holy vessels Antiochus seized ''with polluted hands'' in 2 Maccabees 5:16 — the golden altar and candlestick stripped from the most holy place.'),
  ('apocrypha', '2-maccabees', 5, 15, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Antiochus presuming into ''the most holy temple of all the world'' in 2 Maccabees 5:15 is the polluting of the sanctuary Daniel had already written down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-place-for-the-people',
       E'The place for the people''s sake — not temples made with hands',
       E'When Antiochus stripped the sanctuary he never reckoned with the truth the chronicler sets at the heart of the chapter: *Nevertheless Yahuah (God) did not choose the people for the place’s sake, but the place for the people’s sake.* (2 Maccabees 5:19) The covenant people are the treasure; the house was given for their sake, not they for the building''s. The Messiah says the same standing in that same temple — *But I say unto you, That in this place is one greater than the temple.* (Matthew 12:6) Stephen, dying like the Maccabean martyrs, presses it further: *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet,* (Acts 7:48) — *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* (Acts 7:49) And Solomon himself, the day he dedicated it, confessed it: *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27) It ain''t new — the stones could be plundered, but the Most High was never housed in them.',
       sv.verse_id, ev.verse_id, 'extras', 62100
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-whom-the-lord-loveth-he-chasteneth',
       E'The wrath for a while — a chastening, not a casting off',
       E'The chronicler reads the catastrophe not as Yahuah''s defeat but as His fatherly discipline: *And so haughty was Antiochus in mind, that he considered not that Yahuah (God) was angry for a while for the sins of them that dwelt in the city, and therefore his eye was not upon the place.* (2 Maccabees 5:17) The sister chapter says it plainly — *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* (2 Maccabees 6:12) The seven brothers under torment say the same — *And though the living Yahuah (God) be angry with us a little while for our chastening and correction, yet shall he be at one again with his servants.* (2 Maccabees 7:33) This is the Father''s rod, not the curse of the law: *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6) The wrath is *for a while*; the covenant stands, and the reconciled House is set up again with all glory.',
       sv.verse_id, ev.verse_id, 'extras', 62103
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-abomination-and-the-slaughter',
       E'Forty thousand slain — the kingdom of man against the holy covenant',
       E'Returning from Egypt in a fury, Antiochus turns the sword on the covenant city: *And commanded his men of war not to spare such as they met, and to slay such as went up upon the houses.* (2 Maccabees 5:12) *Thus there was killing of young and old, making away of men, women, and children, slaying of virgins and infants.* (2 Maccabees 5:13) The tyrant is the abomination foretold — *and his heart shall be against the holy covenant; and he shall do exploits, and return to his own land.* (Daniel 11:28) *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31) The Messiah names that same desolating power as the sign of the end — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15) And the sister account remembers the same massacre — *And when he had taken all away, he went into his own land, having made a great massacre, and spoken very proudly.* (1 Maccabees 1:24) Antiochus is the type of the antichrist kingdom-of-man, and the slaughtered remnant the seed kept through the fire.',
       sv.verse_id, ev.verse_id, 'extras', 62106
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-the-holy-vessels-plundered',
       E'The holy vessels carried off with polluted hands',
       E'Not content with blood, Antiochus profanes the sanctuary itself: *Yet was he not content with this, but presumed to go into the most holy temple of all the world; Menelaus, that traitor to the laws, and to his own country, being his guide:* (2 Maccabees 5:15) *And taking the holy vessels with polluted hands, and with profane hands pulling down the things that were dedicated by other kings to the augmentation and glory and honour of the place, he gave them away.* (2 Maccabees 5:16) The sister scroll lists the very vessels he seized — *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof,* (1 Maccabees 1:21) This polluting of the sanctuary is exactly what Daniel foretold — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31) The kingdom of man lays hands on the holy things; yet what is dedicated to Yahuah is never finally lost — the place reconciled is set up again with all glory.',
       sv.verse_id, ev.verse_id, 'extras', 62109
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-5-place-for-the-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:6 — *But I say unto you, That in this place is one greater than the temple.* The Messiah, standing in the very temple Antiochus had once defiled, declares Himself greater than it — confirming that the place was always for the sake of the One it pointed to, not the reverse, as 2 Maccabees 5:19 insists.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:48 — *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet,* Stephen, martyred for the same covenant the Maccabees died for, voices the chronicler''s exact theology — Yahuah is not contained by the building He let Antiochus strip in 2 Maccabees 5:19.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:49 — *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* Heaven itself is His throne, so the plundered sanctuary of 2 Maccabees 5:19 was never His dwelling but His people''s gift.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 8:27 — *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* Solomon confessed at the dedication what the chronicler reaffirms in 2 Maccabees 5:19 — the house could not contain Yahuah, so it was made for the people, not the people for it.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-5-whom-the-lord-loveth-he-chasteneth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The anger ''for a while for the sins'' in 2 Maccabees 5:17 is precisely the scourging of a beloved son, not the wrath of rejection — discipline that proves sonship, never law-as-curse.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-whom-the-lord-loveth-he-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 6:12 — *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* The chronicler''s own gloss on his narrative makes 2 Maccabees 5:17 explicit — these blows are a chastening of the nation, not its destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-whom-the-lord-loveth-he-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:33 — *And though the living Yahuah (God) be angry with us a little while for our chastening and correction, yet shall he be at one again with his servants.* The martyrs voice the same hope as 2 Maccabees 5:20 — the wrath is brief, and the reconciled Yahuah sets His people (and His place) up again.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-whom-the-lord-loveth-he-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-5-abomination-and-the-slaughter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:28 — *Then shall he return into his land with great riches; and his heart shall be against the holy covenant; and he shall do exploits, and return to his own land.* Daniel foresaw this very rage against the covenant city that erupts in the slaughter of 2 Maccabees 5:13 — the king whose heart is set against the holy covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The desolating power of Daniel''s vision is the very king who ''took the city by force of arms'' in 2 Maccabees 5:11 — the abomination embodied in Antiochus.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the Maccabean horror of 2 Maccabees 5:13 into a sign of the last days — the same abomination that desolated the holy place will rise again at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:24 — *And when he had taken all away, he went into his own land, having made a great massacre, and spoken very proudly.* The companion chronicle records the same ''great massacre'' counted in the fourscore thousand of 2 Maccabees 5:14 — one witness confirming the other.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-5-the-holy-vessels-plundered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:21 — *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof,* The companion account names the holy vessels Antiochus seized ''with polluted hands'' in 2 Maccabees 5:16 — the golden altar and candlestick stripped from the most holy place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-the-holy-vessels-plundered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Antiochus presuming into ''the most holy temple of all the world'' in 2 Maccabees 5:15 is the polluting of the sanctuary Daniel had already written down.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-the-holy-vessels-plundered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_06.sql (session253 2-maccabees 6) -----
-- Source anchor: apocrypha/2-maccabees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac6 (view _session253_2mac6_lookup). Sort band base 62125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-6-abomination-of-desolation
  ('apocrypha', '2-maccabees', 6, 2, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foresaw exactly this polluting of the sanctuary that Antiochus now works in 2 Maccabees 6:2.'),
  ('apocrypha', '2-maccabees', 6, 5, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the desolation of the altar in 2 Maccabees 6:5 into the sign of the end, the same abomination set up again.'),
  -- thread: 2-maccabees-6-sabbath-feasts-circumcision
  ('apocrypha', '2-maccabees', 6, 6, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Sabbath and feasts forbidden in 2 Maccabees 6:6 are the very appointed times the Messiah walks in — keeping even the dedication won by these martyrs'' faithfulness.'),
  -- thread: 2-maccabees-6-chastening-not-destruction
  ('apocrypha', '2-maccabees', 6, 12, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The punishments judged in 2 Maccabees 6:12 to be chastening and not destruction are exactly the scourging Hebrews names as the mark of a received son.'),
  ('apocrypha', '2-maccabees', 6, 12, 'canon', 'proverbs', 3, 11, 'free', E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* The plea of 2 Maccabees 6:12 not to be discouraged is Proverbs'' charge not to despise the Father''s correction.'),
  ('apocrypha', '2-maccabees', 6, 16, 'canon', 'proverbs', 3, 12, 'free', E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* The mercy never withdrawn in 2 Maccabees 6:16 is the fatherly delight behind every correction in Proverbs.'),
  ('apocrypha', '2-maccabees', 6, 16, 'canon', 'hebrews', 12, 11, 'free', E'Hebrews 12:11 — *Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby.* The adversity that never forsakes the people (2 Maccabees 6:16) bears, as Hebrews says, the peaceable fruit of righteousness.'),
  -- thread: 2-maccabees-6-eleazar-swines-flesh
  ('apocrypha', '2-maccabees', 6, 19, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The flesh Eleazar spits forth in 2 Maccabees 6:19 is the swine the Torah itself names unclean.'),
  ('apocrypha', '2-maccabees', 6, 20, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* Eleazar''s resolve in 2 Maccabees 6:20 to taste no unlawful thing for love of life is obedience to this very command.'),
  ('apocrypha', '2-maccabees', 6, 23, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Eleazar, choosing the grave by the holy law (2 Maccabees 6:23), stands with Daniel who purposed in his heart not to defile himself at the king''s table.'),
  -- thread: 2-maccabees-6-notable-example-better-resurrection
  ('apocrypha', '2-maccabees', 6, 30, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* Eleazar, beaten yet content in soul (2 Maccabees 6:30), is among the tortured who refuse deliverance for a better resurrection.'),
  ('apocrypha', '2-maccabees', 6, 28, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The notable example of dying for the holy laws (2 Maccabees 6:28) rests on Daniel''s promise that the sleepers awake to everlasting life.'),
  ('apocrypha', '2-maccabees', 6, 30, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The content soul of Eleazar (2 Maccabees 6:30) speaks plainly in his successors: the King of the world raises up those who die for His laws.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-abomination-of-desolation',
       E'The temple defiled — the abomination set up',
       E'The temple is seized and renamed to the god of the kingdom-of-man: *And to pollute also the temple in Jerusalem, and to call it the temple of Jupiter Olympius; and that in Garizim, of Jupiter the Defender of strangers, as they did desire that dwelt in the place.* (2 Maccabees 6:2). *The altar also was filled with profane things, which the law forbiddeth.* (2 Maccabees 6:5). This is the very desolation Daniel saw set against the holy covenant — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31) — and the Messiah Himself points His people to it as the sign still to come: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Antiochus is the type; the antichrist system that dismantles Yahuah''s order is the antitype.',
       sv.verse_id, ev.verse_id, 'extras', 62125
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-sabbath-feasts-circumcision',
       E'Sabbath, feasts, and circumcision punished by death',
       E'The covenant marks themselves are outlawed — Torah forbidden on pain of death: *Neither was it lawful for a man to keep sabbath days or ancient fasts, or to profess himself at all to be a Yahudi (Jew).* (2 Maccabees 6:6). The mothers who kept circumcision are martyred: *For there were two women brought, who had circumcised their children; whom when they had openly led round about the city, the babes hanging at their breasts, they cast them down headlong from the wall.* (2 Maccabees 6:10). And the Sabbath-keepers are burned: *And others, that had run together into caves near by, to keep the sabbath day secretly, being discovered by Philip, were all burnt together, because they made a conscience to help themselves for the honour of the most sacred day.* (2 Maccabees 6:11). The very things the kingdom-of-man forbids are the very things the Messiah keeps — at Jerusalem He honours even the Maccabean rededication: *And it was at Jerusalem the feast of the dedication, and it was winter.* (John 10:22). The covenant the dragon hates is the covenant kept.',
       sv.verse_id, ev.verse_id, 'extras', 62128
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-chastening-not-destruction',
       E'Chastening, not destruction — the Father''s mercy',
       E'The writer reads the calamity not as wrath unto ruin but as a Father''s discipline: *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* (2 Maccabees 6:12). *And therefore he never withdraweth his mercy from us: and though he punish with adversity, yet does he never forsake his people.* (2 Maccabees 6:16). This is Proverbs read aloud over Israel: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* (Proverbs 3:11-12) — and Hebrews carries the same word to the covenant people: *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6); *Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby.* (Hebrews 12:11). The seed is corrected, never cast off.',
       sv.verse_id, ev.verse_id, 'extras', 62131
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-eleazar-swines-flesh',
       E'Eleazar — death rather than swine''s flesh',
       E'The aged scribe Eleazar is forced to the unclean thing and refuses: *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment,* (2 Maccabees 6:19). He will not even feign it: *As it behoved them to come, that are resolute to stand out against such things, as are not lawful for love of life to be tasted.* (2 Maccabees 6:20). The swine is unclean by the Torah''s own word: *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* (Leviticus 11:7); *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* (Leviticus 11:8). Eleazar stands in the line of Daniel at the king''s table: *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* (Daniel 1:8). Torah-faithfulness unto death — never law as curse, but the holy law loved more than life.',
       sv.verse_id, ev.verse_id, 'extras', 62134
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-notable-example-better-resurrection',
       E'A notable example — the better resurrection',
       E'Eleazar dies to teach the young to die well: *And leave a notable example to such as be young to die willingly and courageously for the honourable and holy laws. And when he had said these words, immediately he went to the torment:* (2 Maccabees 6:28). He suffers in body but is content in soul, fearing Yahuah: *But when he was ready to die with stripes, he groaned, and said, It is manifest to Yahuah (God), that has the holy knowledge, that whereas I might have been delivered from death, I now endure sore pains in body by being beaten: but in soul am well content to suffer these things, because I fear him.* (2 Maccabees 6:30). This is the very faith Hebrews names in its roll of witnesses: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35) — and the seven brothers of the next chapter speak its ground aloud: *You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9). The hope that lets a man refuse deliverance is the resurrection itself: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 62137
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-6-abomination-of-desolation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foresaw exactly this polluting of the sanctuary that Antiochus now works in 2 Maccabees 6:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the desolation of the altar in 2 Maccabees 6:5 into the sign of the end, the same abomination set up again.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-sabbath-feasts-circumcision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Sabbath and feasts forbidden in 2 Maccabees 6:6 are the very appointed times the Messiah walks in — keeping even the dedication won by these martyrs'' faithfulness.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-sabbath-feasts-circumcision'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-chastening-not-destruction
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The punishments judged in 2 Maccabees 6:12 to be chastening and not destruction are exactly the scourging Hebrews names as the mark of a received son.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* The plea of 2 Maccabees 6:12 not to be discouraged is Proverbs'' charge not to despise the Father''s correction.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* The mercy never withdrawn in 2 Maccabees 6:16 is the fatherly delight behind every correction in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:11 — *Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby.* The adversity that never forsakes the people (2 Maccabees 6:16) bears, as Hebrews says, the peaceable fruit of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-eleazar-swines-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The flesh Eleazar spits forth in 2 Maccabees 6:19 is the swine the Torah itself names unclean.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-eleazar-swines-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* Eleazar''s resolve in 2 Maccabees 6:20 to taste no unlawful thing for love of life is obedience to this very command.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-eleazar-swines-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Eleazar, choosing the grave by the holy law (2 Maccabees 6:23), stands with Daniel who purposed in his heart not to defile himself at the king''s table.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-eleazar-swines-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-notable-example-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* Eleazar, beaten yet content in soul (2 Maccabees 6:30), is among the tortured who refuse deliverance for a better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-notable-example-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The notable example of dying for the holy laws (2 Maccabees 6:28) rests on Daniel''s promise that the sleepers awake to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-notable-example-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The content soul of Eleazar (2 Maccabees 6:30) speaks plainly in his successors: the King of the world raises up those who die for His laws.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-notable-example-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_07.sql (session253 2-maccabees 7) -----
-- Source anchor: apocrypha/2-maccabees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac7 (view _session253_2mac7_lookup). Sort band base 62150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-7-better-resurrection
  ('apocrypha', '2-maccabees', 7, 9, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* This is the very passage that looks back to the brothers of 2 Maccabees 7:9, who would not accept deliverance for the sake of a better rising.'),
  ('apocrypha', '2-maccabees', 7, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The fourth brother''s hope of being raised up again in 2 Maccabees 7:14 rests on this prophesied awakening to everlasting life.'),
  ('apocrypha', '2-maccabees', 7, 9, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The King of the world who shall raise them up in 2 Maccabees 7:9 is the One whose voice the graves will hear.'),
  ('apocrypha', '2-maccabees', 7, 14, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The brother''s word that the tyrant shall have no resurrection to life (2 Maccabees 7:14) is this same parting of the two resurrections.'),
  -- thread: 2-maccabees-7-first-resurrection-thrones
  ('apocrypha', '2-maccabees', 7, 36, 'canon', 'revelation', 20, 4, 'free', E'Revelation 20:4 — *And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God), and which had not worshipped the beast, neither his image, neither had received his mark upon their foreheads, or in their hands; and they lived and reigned with Messiah (Christ) a thousand years.* The brothers dead under the covenant of everlasting life in 2 Maccabees 7:36 are these enthroned souls slain for the word of Elohim.'),
  ('apocrypha', '2-maccabees', 7, 9, 'canon', 'revelation', 20, 6, 'free', E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The raising up to everlasting life confessed in 2 Maccabees 7:9 is a share in this first resurrection over which the second death has no power.'),
  -- thread: 2-maccabees-7-mother-gives-life-again
  ('apocrypha', '2-maccabees', 7, 23, 'canon', '2-corinthians', 4, 14, 'free', E'2 Corinthians 4:14 — *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you.* The Creator who gives breath and life again in 2 Maccabees 7:23 is the One who raises and presents His own.'),
  ('apocrypha', '2-maccabees', 7, 22, 'canon', 'deuteronomy', 32, 39, 'free', E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The mother''s confession that she neither gave breath nor formed the members (2 Maccabees 7:22) leans on this God who alone kills and makes alive.'),
  -- thread: 2-maccabees-7-ex-nihilo
  ('apocrypha', '2-maccabees', 7, 28, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The mother''s teaching that Elohim made all of things that were not (2 Maccabees 7:28) is this same faith that the seen was not made of what appears.'),
  ('apocrypha', '2-maccabees', 7, 28, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The God who made all of things that were not in 2 Maccabees 7:28 is the same who quickens the dead and calls the things which be not.'),
  -- thread: 2-maccabees-7-die-for-the-laws
  ('apocrypha', '2-maccabees', 7, 6, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* The brothers cite Moses'' song that He shall be comforted in His servants (2 Maccabees 7:6), and this is the verse of that comfort.'),
  ('apocrypha', '2-maccabees', 7, 2, 'apocrypha', '2-maccabees', 6, 19, 'extras', E'2 Maccabees 6:19 — *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment,* Eleazar''s choice to die rather than taste swine is the same covenant-faithfulness the brothers swear in 2 Maccabees 7:2.'),
  -- thread: 2-maccabees-7-judgment-on-the-tyrant
  ('apocrypha', '2-maccabees', 7, 35, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The judgment of Almighty Yahuah that the tyrant has not escaped in 2 Maccabees 7:35 is the recompense Moses says belongs to God alone.'),
  ('apocrypha', '2-maccabees', 7, 19, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The warning that Antiochus shall not escape unpunished (2 Maccabees 7:19) leaves vengeance to the God who says He will repay.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-better-resurrection',
       E'The seven brothers and the better resurrection',
       E'Seven brothers and their mother are tortured for refusing swine''s flesh, and one after another they confess the hope no tyrant can touch: *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), and the fourth, *It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him* (2 Maccabees 7:14). It ain''t new, and it ain''t a later church doctrine: when Hebrews names the cloud of witnesses it points straight back to these very martyrs — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The Spirit of prophecy long before had laid the foundation: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2), and the Messiah sealed it: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28). Come and see — the brothers died for the laws of their fathers in the sure hope of standing again.',
       sv.verse_id, ev.verse_id, 'extras', 62150
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-first-resurrection-thrones',
       E'Slain for the witness, reigning in the first resurrection',
       E'These youths are killed for keeping the covenant, and they die looking past the executioner: *but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), and the seventh, *For our brothers, who now have suffered a short pain, are dead under the covenant of Yahuah (God) of everlasting life* (2 Maccabees 7:36). John sees the end of their hope — the souls slain for the witness, raised and enthroned: *and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God)... and they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4), *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power* (Revelation 20:6). Come and see — the death these brothers died is the very martyrdom John crowns, and the resurrection they confessed is the first resurrection.',
       sv.verse_id, ev.verse_id, 'extras', 62153
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-mother-gives-life-again',
       E'The mother and the Creator who gives breath again',
       E'The mother, marvellous above all, watches seven sons die in one day and answers torture with the doctrine of creation and resurrection together: *I cannot tell how you came into my womb: for I neither gave you breath nor life, neither was it I that formed the members of every one of you; But doubtless the Creator of the world, who formed the generation of man... will also of his own mercy give you breath and life again* (2 Maccabees 7:22-23). The God who first gave the breath can give it back — *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). And Moses set this Creator''s two-handed power in his song: *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39). Come and see — the same hand that formed the members gives life again.',
       sv.verse_id, ev.verse_id, 'extras', 62156
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-ex-nihilo',
       E'Elohim made them of things that were not',
       E'The mother''s last word to her youngest is creation out of nothing, set as the very ground of resurrection: *I beseech you, my son, look upon the heaven and the earth, and all that is in it, and consider that Yahuah (God) made them of things that were not; and so was mankind made likewise* (2 Maccabees 7:28). It ain''t new — Hebrews speaks the same mystery: *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3), and Paul names the God of resurrection by this very power: *even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). The God who made what was not from nothing can raise the dead from the grave. Come and see — ex nihilo and resurrection are one faith.',
       sv.verse_id, ev.verse_id, 'extras', 62159
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-die-for-the-laws',
       E'Torah-faithful unto death; the song of Moses witnessed',
       E'These are not law-cursed men but covenant-keepers who will die before they break the commandment: *we are ready to die, rather than to transgress the laws of our fathers* (2 Maccabees 7:2), and the youngest, *I will not obey the king''s commandment: but I will obey the commandment of the law that was given to our fathers by Moses* (2 Maccabees 7:30). They die comforted by Moses'' own song: *as Moses in his song, which witnessed to their faces, declared, saying, And he shall be comforted in his servants* (2 Maccabees 7:6) — *For Yahuah (LORD) shall judge his people, and repent himself for his servants* (Deuteronomy 32:36). And their elder Eleazar had gone the same way before them, refusing the same swine: *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment* (2 Maccabees 6:19). Come and see — Torah-faithfulness unto death, never law as curse.',
       sv.verse_id, ev.verse_id, 'extras', 62162
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-judgment-on-the-tyrant',
       E'Vengeance belongs to Elohim; the tyrant shall not escape',
       E'Antiochus rages as the man of lawlessness, the abomination who would dismantle the covenant — but the dying brothers hand his judgment up to heaven: *abide a while, and behold his great power, how he will torment you and your seed* (2 Maccabees 7:17), and *think not... that you shall escape unpunished* (2 Maccabees 7:19), *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things* (2 Maccabees 7:35). This is no private revenge but the Torah''s own verdict: *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand* (Deuteronomy 32:35), which Paul repeats: *Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). Come and see — the kingdom of man falls under the judgment of Almighty Yahuah who seeth all things.',
       sv.verse_id, ev.verse_id, 'extras', 62165
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-7-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* This is the very passage that looks back to the brothers of 2 Maccabees 7:9, who would not accept deliverance for the sake of a better rising.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The fourth brother''s hope of being raised up again in 2 Maccabees 7:14 rests on this prophesied awakening to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The King of the world who shall raise them up in 2 Maccabees 7:9 is the One whose voice the graves will hear.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The brother''s word that the tyrant shall have no resurrection to life (2 Maccabees 7:14) is this same parting of the two resurrections.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-first-resurrection-thrones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:4 — *And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God), and which had not worshipped the beast, neither his image, neither had received his mark upon their foreheads, or in their hands; and they lived and reigned with Messiah (Christ) a thousand years.* The brothers dead under the covenant of everlasting life in 2 Maccabees 7:36 are these enthroned souls slain for the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-first-resurrection-thrones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The raising up to everlasting life confessed in 2 Maccabees 7:9 is a share in this first resurrection over which the second death has no power.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-first-resurrection-thrones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-mother-gives-life-again
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 4:14 — *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you.* The Creator who gives breath and life again in 2 Maccabees 7:23 is the One who raises and presents His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-mother-gives-life-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The mother''s confession that she neither gave breath nor formed the members (2 Maccabees 7:22) leans on this God who alone kills and makes alive.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-mother-gives-life-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-ex-nihilo
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The mother''s teaching that Elohim made all of things that were not (2 Maccabees 7:28) is this same faith that the seen was not made of what appears.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-ex-nihilo'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The God who made all of things that were not in 2 Maccabees 7:28 is the same who quickens the dead and calls the things which be not.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-ex-nihilo'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-die-for-the-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* The brothers cite Moses'' song that He shall be comforted in His servants (2 Maccabees 7:6), and this is the verse of that comfort.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-die-for-the-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 6:19 — *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment,* Eleazar''s choice to die rather than taste swine is the same covenant-faithfulness the brothers swear in 2 Maccabees 7:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-die-for-the-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-judgment-on-the-tyrant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The judgment of Almighty Yahuah that the tyrant has not escaped in 2 Maccabees 7:35 is the recompense Moses says belongs to God alone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-judgment-on-the-tyrant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The warning that Antiochus shall not escape unpunished (2 Maccabees 7:19) leaves vengeance to the God who says He will repay.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-judgment-on-the-tyrant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_08.sql (session253 2-maccabees 8) -----
-- Source anchor: apocrypha/2-maccabees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac8 (view _session253_2mac8_lookup). Sort band base 62175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-8-covenant-remembered
  ('apocrypha', '2-maccabees', 8, 15, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Like Jehoshaphat''s outnumbered remnant, the Maccabees plead the covenant rather than their own strength, knowing the fight belongs to Yahuah.'),
  ('apocrypha', '2-maccabees', 8, 15, 'canon', 'leviticus', 26, 42, 'free', E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenants "made with their fathers" that the faithful invoke are the threefold oath Yahuah swore to Jacob, Isaac, and Abraham.'),
  ('apocrypha', '2-maccabees', 8, 15, 'canon', 'leviticus', 26, 44, 'free', E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* The people trodden down and sold are never abandoned, because Yahuah will not break His covenant with the seed He keeps.'),
  ('apocrypha', '2-maccabees', 8, 29, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* When His servants are reduced to nothing and beseech Him "to be reconciled," it is the Song of Moses fulfilled — Yahuah turning judgment back to mercy for His own.'),
  -- thread: 2-maccabees-8-battle-is-yahuahs
  ('apocrypha', '2-maccabees', 8, 18, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* David''s defiance of Goliath is Judas'' creed against Nicanor — the outcome hangs on Yahuah, not on the count of weapons.'),
  ('apocrypha', '2-maccabees', 8, 18, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The same Almighty who fought for Israel at the sea is the "confidence" Judas urges on the six thousand.'),
  ('apocrypha', '2-maccabees', 8, 18, 'canon', 'isaiah', 31, 1, 'free', E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The heathen "trust in their weapons," exactly the misplaced confidence Isaiah condemns, while the faithful look to the Holy One alone.'),
  ('apocrypha', '2-maccabees', 8, 18, 'apocrypha', '1-maccabees', 3, 19, 'extras', E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* The sister account puts Judas'' confidence in a single sentence — strength is from heaven, never from numbers.'),
  -- thread: 2-maccabees-8-sennacherib-host-smitten
  ('apocrypha', '2-maccabees', 8, 19, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas cites this very night, "an hundred fourscore and five thousand" to the number, as proof that heaven can undo any host.'),
  ('apocrypha', '2-maccabees', 8, 19, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the same deliverance Judas recounts, the great army felled by an angel in a single night.'),
  ('apocrypha', '2-maccabees', 8, 19, 'canon', 'psalms', 44, 7, 'free', E'Psalm 44:7 — *But thou hast saved us from our enemies, and hast put them to shame that hated us.* The remembrance of "helps their forefathers had found" is the psalmist''s own boast — that salvation came from Yahuah, not the sword.'),
  -- thread: 2-maccabees-8-ready-to-die-for-the-law
  ('apocrypha', '2-maccabees', 8, 23, 'canon', 'joshua', 1, 8, 'free', E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* Eleazar reading the holy book over the army is Joshua''s charge enacted — the Torah goes before them into battle as the source of success.'),
  ('apocrypha', '2-maccabees', 8, 23, 'canon', 'nehemiah', 8, 8, 'free', E'Nehemiah 8:8 — *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading.* The appointing of Eleazar "to read the holy book" continues the restored practice of reading the law aloud to the gathered people.'),
  ('apocrypha', '2-maccabees', 8, 21, 'canon', 'deuteronomy', 20, 3, 'free', E'Deuteronomy 20:3 — *And shall say unto them, Hear, O Yashar''el (Israel), ye approach this day unto battle against your enemies: let not your hearts faint, fear not, and do not tremble, neither be ye terrified because of them.* Judas exhorting his men "not to be stricken with terror" and made "ready to die for the law" follows the very encouragement Torah commands before war.'),
  ('apocrypha', '2-maccabees', 8, 21, 'canon', 'hebrews', 11, 33, 'free', E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions.* The cloud of witnesses remembers these Torah-faithful warriors who by faith "subdued kingdoms," the Maccabees among them.'),
  -- thread: 2-maccabees-8-vengeance-and-the-resurrection-hope
  ('apocrypha', '2-maccabees', 8, 11, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* Nicanor sells the captives "not expecting the vengeance" — but that recompence belongs to Yahuah alone, who repays in His day.'),
  ('apocrypha', '2-maccabees', 8, 11, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The faithful leave Nicanor''s punishment to heaven, exactly the posture Paul commands — vengeance surrendered to Yahuah.'),
  ('apocrypha', '2-maccabees', 8, 27, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The hope that steadies the whole Maccabean resistance is this "better resurrection" — the writer of Hebrews points straight back to the tortured faithful of these very books.'),
  ('apocrypha', '2-maccabees', 8, 27, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The praise of those "preserved to that day" rests on the martyrs'' creed of the chapter before — the King of the world raises up those who die for His laws.'),
  ('apocrypha', '2-maccabees', 8, 27, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The everlasting life the Maccabean martyrs await is Daniel''s promise of the awakening from the dust, the world to come behind their courage.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-covenant-remembered',
       E'Not for our sakes, but for the covenant with the fathers',
       E'When the captive people are sold off and the sanctuary profaned, they do not plead their own merit but the oath sworn to the patriarchs: *Others sold all that they had left, and withal besought Yahuah (God) to deliver them, sold by the wicked Nicanor before they met together: And if not for their own sakes, yet for the covenants he had made with their fathers, and for his holy and glorious name''s sake, by which they were called* (2 Maccabees 8:14-15). And when the day is won they end where they began — in supplication: *they besought the merciful Yahuah (God) to be reconciled with his servants for ever* (2 Maccabees 8:29). This is no novelty; it is Jehoshaphat''s word in the same crisis: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). It is the Song of Moses, which promises that mercy outlasts judgment: *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left* (Deuteronomy 32:36). The ground of that mercy is the unbreakable covenant: *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land* (Leviticus 26:42). The seed is not cast off; Yahuah will not abhor His own: *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44).',
       sv.verse_id, ev.verse_id, 'extras', 62175
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-battle-is-yahuahs',
       E'Confidence in the Almighty, not in weapons',
       E'Judas sets the true balance of the war before his men: not numbers, not steel, but heaven. *For they, said he, trust in their weapons and boldness; but our confidence is in the Almighty who at a beck can cast down both them that come against us, and also all the world* (2 Maccabees 8:18). This is David''s word before Goliath, when the boy with a sling answered the armoured giant: *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). It is Moses at the sea, bidding the trembling people stand: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). It is the rebuke of Isaiah against those who count chariots: *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1). And in the brother-book Judas says it plainest: *For the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:19). Against the kingdom of man and its twenty thousand of all nations, the remnant''s only weapon is the same one Israel always had.',
       sv.verse_id, ev.verse_id, 'extras', 62178
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-sennacherib-host-smitten',
       E'As under Sennacherib — heaven smites the great army',
       E'To steel his men Judas recounts the past deliverances, chief among them the night Assyria fell without a sword of Israel lifted: *Moreover, he recounted to them what helps their forefathers had found, and how they were delivered, when under Sennacherib an hundred fourscore and five thousand perished* (2 Maccabees 8:19). The figure is exact to the chronicle: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (2 Kings 19:35). Isaiah records the selfsame stroke: *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (Isaiah 37:36). It is the psalmist''s confession that the victory was never theirs to claim: *But thou hast saved us from our enemies, and hast put them to shame that hated us* (Psalm 44:7). The same Hand that broke Sennacherib''s host will break Nicanor''s — the kingdom of man, however vast, is dead corpses by morning when heaven fights.',
       sv.verse_id, ev.verse_id, 'extras', 62181
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-ready-to-die-for-the-law',
       E'Eleazar reads the holy book; ready to die for the law',
       E'The Maccabean host goes into battle not by drill alone but by the Word: *Also he appointed Eleazar to read the holy book: and when he had given them this watchword, The help of Yahuah (God); himself leading the first band* (2 Maccabees 8:23), the men having been made *ready to die for the law and the country* (2 Maccabees 8:21). This is Torah-faithfulness unto death — never the law as a curse, but the covenant held dearer than life. The watchword and the reading are Joshua''s charge: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). It is Ezra''s reform restored: *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading* (Nehemiah 8:8). It is the priest''s word before Israel went to war: *And shall say unto them, Hear, O Yashar''el (Israel), ye approach this day unto battle against your enemies: let not your hearts faint, fear not, and do not tremble, neither be ye terrified because of them* (Deuteronomy 20:3). And the great cloud of witnesses remembers these very fighters: *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33).',
       sv.verse_id, ev.verse_id, 'extras', 62184
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-vengeance-and-the-resurrection-hope',
       E'Not expecting the vengeance — and the better resurrection',
       E'The slave-trader Nicanor sells the people cheap, *not expecting the vengeance that was to follow upon him from the Almighty Yahuah (God)* (2 Maccabees 8:11) — and the faithful, far from avenging themselves, leave that justice to heaven and end the day yielding *exceeding praise and thanks to Yahuah (God), who had preserved them* (2 Maccabees 8:27). Vengeance is never theirs to seize, for the Song of Moses claims it: *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste* (Deuteronomy 32:35). Paul cites that very line for the covenant people: *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). And the deepest hope undergirding the whole Maccabean stand — the hope for which the seven brothers of the chapter before chose torture over the swine — is the resurrection the writer of Hebrews names directly: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). That "better resurrection" is the martyrs'' confidence, *the King of the world shall raise us up* (2 Maccabees 7:9), echoed by Daniel: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 62187
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-8-covenant-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Like Jehoshaphat''s outnumbered remnant, the Maccabees plead the covenant rather than their own strength, knowing the fight belongs to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenants "made with their fathers" that the faithful invoke are the threefold oath Yahuah swore to Jacob, Isaac, and Abraham.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* The people trodden down and sold are never abandoned, because Yahuah will not break His covenant with the seed He keeps.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* When His servants are reduced to nothing and beseech Him "to be reconciled," it is the Song of Moses fulfilled — Yahuah turning judgment back to mercy for His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-battle-is-yahuahs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* David''s defiance of Goliath is Judas'' creed against Nicanor — the outcome hangs on Yahuah, not on the count of weapons.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The same Almighty who fought for Israel at the sea is the "confidence" Judas urges on the six thousand.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The heathen "trust in their weapons," exactly the misplaced confidence Isaiah condemns, while the faithful look to the Holy One alone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* The sister account puts Judas'' confidence in a single sentence — strength is from heaven, never from numbers.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-sennacherib-host-smitten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas cites this very night, "an hundred fourscore and five thousand" to the number, as proof that heaven can undo any host.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-sennacherib-host-smitten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the same deliverance Judas recounts, the great army felled by an angel in a single night.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-sennacherib-host-smitten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 44:7 — *But thou hast saved us from our enemies, and hast put them to shame that hated us.* The remembrance of "helps their forefathers had found" is the psalmist''s own boast — that salvation came from Yahuah, not the sword.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-sennacherib-host-smitten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-ready-to-die-for-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* Eleazar reading the holy book over the army is Joshua''s charge enacted — the Torah goes before them into battle as the source of success.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:8 — *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading.* The appointing of Eleazar "to read the holy book" continues the restored practice of reading the law aloud to the gathered people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 20:3 — *And shall say unto them, Hear, O Yashar''el (Israel), ye approach this day unto battle against your enemies: let not your hearts faint, fear not, and do not tremble, neither be ye terrified because of them.* Judas exhorting his men "not to be stricken with terror" and made "ready to die for the law" follows the very encouragement Torah commands before war.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions.* The cloud of witnesses remembers these Torah-faithful warriors who by faith "subdued kingdoms," the Maccabees among them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-vengeance-and-the-resurrection-hope
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* Nicanor sells the captives "not expecting the vengeance" — but that recompence belongs to Yahuah alone, who repays in His day.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The faithful leave Nicanor''s punishment to heaven, exactly the posture Paul commands — vengeance surrendered to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The hope that steadies the whole Maccabean resistance is this "better resurrection" — the writer of Hebrews points straight back to the tortured faithful of these very books.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The praise of those "preserved to that day" rests on the martyrs'' creed of the chapter before — the King of the world raises up those who die for His laws.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The everlasting life the Maccabean martyrs await is Daniel''s promise of the awakening from the dust, the world to come behind their courage.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_09.sql (session253 2-maccabees 9) -----
-- Source anchor: apocrypha/2-maccabees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac9 (view _session253_2mac9_lookup). Sort band base 62200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-9-worm-spread-under-thee
  ('apocrypha', '2-maccabees', 9, 9, 'canon', 'isaiah', 14, 11, 'free', E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The same worm that buries Babylon''s proud king crawls up out of Antiochus'' living flesh in 2 Maccabees 9:9.'),
  ('apocrypha', '2-maccabees', 9, 9, 'canon', 'acts', 12, 23, 'free', E'Acts 12:23 — *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost.* Herod, like Antiochus in 2 Maccabees 9:9, is eaten of worms for stealing the glory that belongs to Yahuah alone.'),
  ('apocrypha', '2-maccabees', 9, 10, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The man who thought to reach the stars becomes the carcase no man can endure, an abhorring unto all flesh, in 2 Maccabees 9:10.'),
  -- thread: 2-maccabees-9-command-the-waves
  ('apocrypha', '2-maccabees', 9, 8, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* Antiochus'' boast to command the sea and weigh the mountains in 2 Maccabees 9:8 is the same heart that says it will ascend above the stars.'),
  ('apocrypha', '2-maccabees', 9, 8, 'canon', 'ezekiel', 28, 2, 'free', E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God).* Like the prince of Tyrus enthroned in the midst of the seas, Antiochus thought he might command the waves yet was ''proud beyond the condition of man'' (2 Maccabees 9:8).'),
  ('apocrypha', '2-maccabees', 9, 10, 'canon', 'obadiah', 1, 4, 'free', E'Obadiah 1:4 — *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD).* The man who ''thought a little afore he could reach to the stars of heaven'' (2 Maccabees 9:10) is brought down exactly as Edom is brought down from among the stars.'),
  -- thread: 2-maccabees-9-pride-before-the-fall
  ('apocrypha', '2-maccabees', 9, 7, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Antiochus, ''still filled with pride,'' falls headlong from his chariot in 2 Maccabees 9:7 — the proverb enacted to the letter.'),
  ('apocrypha', '2-maccabees', 9, 7, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The God who resists the proud breaks the bragging blasphemer of 2 Maccabees 9:7.'),
  ('apocrypha', '2-maccabees', 9, 7, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The King of heaven who abased Nebuchadnezzar likewise abases Antiochus, who would not cease from his pride (2 Maccabees 9:7).'),
  -- thread: 2-maccabees-9-know-the-mighty-power
  ('apocrypha', '2-maccabees', 9, 12, 'canon', 'daniel', 4, 34, 'free', E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation.* Antiochus'' words that a mortal should not think himself God (2 Maccabees 9:12) echo Nebuchadnezzar''s restored confession of the Most High''s everlasting dominion.'),
  ('apocrypha', '2-maccabees', 9, 12, 'canon', 'daniel', 4, 32, 'free', E'Daniel 4:32 — *And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* The very lesson Nebuchadnezzar was scourged to learn — that the Most High rules the kingdom of men — is what Antiochus is forced to own in 2 Maccabees 9:12.'),
  ('apocrypha', '2-maccabees', 9, 11, 'canon', 'luke', 18, 13, 'free', E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* Antiochus comes ''to the knowledge of himself by the scourge of Yahuah'' (2 Maccabees 9:11), but unlike the publican his late humbling finds no mercy (9:13).'),
  -- thread: 2-maccabees-9-judgment-just-recompence
  ('apocrypha', '2-maccabees', 9, 6, 'canon', 'psalms', 9, 15, 'free', E'Psalm 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* Antiochus is tormented in the bowels ''most justly'' (2 Maccabees 9:6), snared in the very torments he devised for others.'),
  ('apocrypha', '2-maccabees', 9, 28, 'apocrypha', '1-maccabees', 6, 12, 'extras', E'1 Maccabees 6:12 — *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause.* The companion book records the same blasphemer''s dying confession, that he perishes for what he did to Jerusalem — the death of 2 Maccabees 9:28 read from within.'),
  ('apocrypha', '2-maccabees', 9, 28, 'apocrypha', '2-maccabees', 7, 35, 'extras', E'2 Maccabees 7:35 — *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things.* The youngest brother''s warning to the persecutor is fulfilled when the murderer dies a miserable death (2 Maccabees 9:28); the martyrs'' resurrection-hope stands while their tormentor rots.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-worm-spread-under-thee',
       E'The worm spread under the proud blasphemer',
       E'Antiochus, the abomination-king who set up the desolation in the holy place, is struck in the bowels and rots while yet living: *So that the worms rose up out of the body of this wicked man, and whiles he lived in sorrow and pain, his flesh fell away, and the filthiness of his smell was noisome to all his army* (2 Maccabees 9:9). It ain''t new — Yahuah had already chanted this dirge over Babylon''s king: *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee* (Isaiah 14:11). The same scourge falls on Herod, the next tyrant to take to himself the glory of God: *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost* (Acts 12:23). And the prophets seal the end of every such carcase: *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh* (Isaiah 66:24). One worm, one judgment, on every man who exalts the kingdom of man against heaven.',
       sv.verse_id, ev.verse_id, 'extras', 62200
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-command-the-waves',
       E'He that thought to command the sea, cast on the ground',
       E'The towering boast of the man of sin: *And thus he that a little afore thought he might command the waves of the sea, (so proud was he beyond the condition of man) and weigh the high mountains in a balance, was now cast on the ground, and carried in an horselitter, shewing forth to all the manifest power of Yahuah (God)* (2 Maccabees 9:8). This is the very sin of Babel and of the covering cherub: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13); *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God)* (Ezekiel 28:2). Edom heard the same word: *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:4). And so Antiochus, who reached for the stars (9:10), is cast on the ground.',
       sv.verse_id, ev.verse_id, 'extras', 62203
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-pride-before-the-fall',
       E'Pride goeth before destruction',
       E'The whole death of Antiochus is one proverb made flesh: *Howbeit he nothing at all ceased from his bragging, but still was filled with pride, breathing out fire in his rage against the Yahudim (Jews), and commanding to haste the journey: but it came to pass that he fell down from his chariot, carried violently; so that having a sore fall, all the members of his body were much pained* (2 Maccabees 9:7). Come and see how the wisdom-writings name it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). The apostles preach the same law of the kingdom: *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6); *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* — the King of heaven *is able to abase* those that walk in pride (Daniel 4:37). The literal fall from the chariot is the figure of the everlasting fall of the kingdom of man.',
       sv.verse_id, ev.verse_id, 'extras', 62206
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-know-the-mighty-power',
       E'That a mortal man should not think himself God',
       E'Brought to the end of himself by his own stench, the tyrant confesses the lesson of every fallen king: *And when he himself could not abide his own smell, he said these words, It is meet to be subject to Yahuah (God), and that a man that is mortal should not proudly think of himself if he were Yahuah (God)* (2 Maccabees 9:12). This is Nebuchadnezzar''s confession after the seven times: *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation* (Daniel 4:34); the scourge teaches him *that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* (Daniel 4:32). It is the publican''s posture against the Pharisee''s: *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — only Antiochus comes to it too late, for mercy ''now no more would have'' him (9:13).',
       sv.verse_id, ev.verse_id, 'extras', 62209
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-judgment-just-recompence',
       E'Most justly — tormented as he tormented',
       E'The narrator declares the death no accident but exact recompense: *And that most justly: for he had tormented other men''s bowels with many and strange torments* (2 Maccabees 9:6); *Thus the murderer and blasphemer having suffered most grievously, as he entreated other men, so died he a miserable death in a strange country in the mountains* (2 Maccabees 9:28). This is the measure-for-measure justice of the psalms: *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken* (Psalm 9:15). His brother-tyrant in the other book of the war died the same way, confessing the same cause: *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause* (1 Maccabees 6:12). And the seven brethren had already prophesied this hour to the persecutor: *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things* (2 Maccabees 7:35) — the resurrection-hope of the martyrs is vindicated in the worm-eaten end of their tormentor.',
       sv.verse_id, ev.verse_id, 'extras', 62212
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-9-worm-spread-under-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The same worm that buries Babylon''s proud king crawls up out of Antiochus'' living flesh in 2 Maccabees 9:9.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-worm-spread-under-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 12:23 — *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost.* Herod, like Antiochus in 2 Maccabees 9:9, is eaten of worms for stealing the glory that belongs to Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-worm-spread-under-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The man who thought to reach the stars becomes the carcase no man can endure, an abhorring unto all flesh, in 2 Maccabees 9:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-worm-spread-under-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-command-the-waves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* Antiochus'' boast to command the sea and weigh the mountains in 2 Maccabees 9:8 is the same heart that says it will ascend above the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-command-the-waves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God).* Like the prince of Tyrus enthroned in the midst of the seas, Antiochus thought he might command the waves yet was ''proud beyond the condition of man'' (2 Maccabees 9:8).'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-command-the-waves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:4 — *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD).* The man who ''thought a little afore he could reach to the stars of heaven'' (2 Maccabees 9:10) is brought down exactly as Edom is brought down from among the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-command-the-waves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-pride-before-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Antiochus, ''still filled with pride,'' falls headlong from his chariot in 2 Maccabees 9:7 — the proverb enacted to the letter.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-pride-before-the-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The God who resists the proud breaks the bragging blasphemer of 2 Maccabees 9:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-pride-before-the-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The King of heaven who abased Nebuchadnezzar likewise abases Antiochus, who would not cease from his pride (2 Maccabees 9:7).'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-pride-before-the-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-know-the-mighty-power
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation.* Antiochus'' words that a mortal should not think himself God (2 Maccabees 9:12) echo Nebuchadnezzar''s restored confession of the Most High''s everlasting dominion.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-know-the-mighty-power'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:32 — *And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* The very lesson Nebuchadnezzar was scourged to learn — that the Most High rules the kingdom of men — is what Antiochus is forced to own in 2 Maccabees 9:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-know-the-mighty-power'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* Antiochus comes ''to the knowledge of himself by the scourge of Yahuah'' (2 Maccabees 9:11), but unlike the publican his late humbling finds no mercy (9:13).'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-know-the-mighty-power'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-judgment-just-recompence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* Antiochus is tormented in the bowels ''most justly'' (2 Maccabees 9:6), snared in the very torments he devised for others.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-judgment-just-recompence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 6:12 — *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause.* The companion book records the same blasphemer''s dying confession, that he perishes for what he did to Jerusalem — the death of 2 Maccabees 9:28 read from within.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-judgment-just-recompence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:35 — *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things.* The youngest brother''s warning to the persecutor is fulfilled when the murderer dies a miserable death (2 Maccabees 9:28); the martyrs'' resurrection-hope stands while their tormentor rots.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-judgment-just-recompence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_10.sql (session253 2-maccabees 10) -----
-- Source anchor: apocrypha/2-maccabees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac10 (view _session253_2mac10_lookup). Sort band base 62225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-10-dedication-eight-days
  ('apocrypha', '2-maccabees', 10, 7, 'canon', 'leviticus', 23, 40, 'free', E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The branches, boughs, and palms the Maccabees bore in 2-maccabees 10:7 are the prescribed Sukkot rite of Torah, kept out of season because they had been hunted in the mountains.'),
  ('apocrypha', '2-maccabees', 10, 6, 'canon', 'nehemiah', 8, 15, 'free', E'Nehemiah 8:15 — *And that they should publish and proclaim in all their cities, and in Jerusalem, saying, Go forth unto the mount, and fetch olive branches, and pine branches, and myrtle branches, and palm branches, and branches of thick trees, to make booths, as it is written.* As the returned remnant under Ezra rediscovered the booths-feast and proclaimed it, so the Maccabees in 2-maccabees 10:6 keep tabernacles as a people lately delivered out of the wilderness of dens and beasts.'),
  ('apocrypha', '2-maccabees', 10, 8, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The yearly winter feast the whole nation ordained in 2-maccabees 10:8 is the very Feast of Dedication the Messiah kept in the temple — He honoured the Maccabean rededication.'),
  ('apocrypha', '2-maccabees', 10, 8, 'apocrypha', '1-maccabees', 4, 59, 'extras', E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The brother book records the same eight-day statute on the twenty-fifth of Casleu that 2-maccabees 10:8 decrees for the whole nation.'),
  ('apocrypha', '2-maccabees', 10, 7, 'canon', 'zechariah', 14, 16, 'free', E'Zechariah 14:16 — *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* The tabernacles-keeping with palms and psalms in 2-maccabees 10:7 prefigures the day all nations go up yearly to keep that same feast before the King.'),
  -- thread: 2-maccabees-10-altars-pulled-down-abomination
  ('apocrypha', '2-maccabees', 10, 2, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The heathen altars and chapels the Maccabees pull down in 2-maccabees 10:2 are exactly the abomination Daniel foresaw Antiochus placing in the polluted sanctuary.'),
  ('apocrypha', '2-maccabees', 10, 5, 'canon', 'daniel', 8, 13, 'free', E'Daniel 8:13 — *Then I heard one saint speaking, and another saint said unto that certain saint which spake, How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* The cleansing on the very day of the profanation in 2-maccabees 10:5 answers the angel''s ''how long'' over the trodden sanctuary.'),
  ('apocrypha', '2-maccabees', 10, 1, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The recovery of the defiled temple in 2-maccabees 10:1 is the historical first fulfillment of the abomination the Messiah warns will yet stand in the holy place.'),
  -- thread: 2-maccabees-10-chasten-with-mercy
  ('apocrypha', '2-maccabees', 10, 4, 'canon', '2-samuel', 24, 14, 'free', E'2 Samuel 24:14 — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (the LORD); for his mercies are great: and let me not fall into the hand of man.* David''s choice to fall into Yahuah''s merciful hand rather than man''s is precisely the prayer of 2-maccabees 10:4 — chasten us, but spare us the blasphemous nations.'),
  ('apocrypha', '2-maccabees', 10, 4, 'apocrypha', 'tobit', 13, 5, 'extras', E'Tobit 13:5 — *And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* Tobit voices the same covenant confidence the Maccabees pray in 2-maccabees 10:4 — the chastening of the scattered people ends in mercy and regathering, not abandonment.'),
  ('apocrypha', '2-maccabees', 10, 4, 'canon', 'hebrews', 8, 12, 'free', E'Hebrews 8:12 — *For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more.* The very mercy the Maccabees ask to be chastened with in 2-maccabees 10:4 is the covenant promise — corrected in mercy, their sins not held against them.'),
  -- thread: 2-maccabees-10-zeal-against-blasphemy
  ('apocrypha', '2-maccabees', 10, 35, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The young men ''inflamed with anger because of the blasphemies'' in 2-maccabees 10:35 act in the very zeal-for-Yahuah''s-sake that marked Phinehas.'),
  ('apocrypha', '2-maccabees', 10, 36, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting covenant given for Phinehas'' zeal is the inheritance the zealous Maccabean house claims as it burns out the blasphemers in 2-maccabees 10:36.'),
  -- thread: 2-maccabees-10-horsemen-from-heaven
  ('apocrypha', '2-maccabees', 10, 29, 'canon', '2-kings', 6, 17, 'free', E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The five comely horsemen from heaven who shield Maccabeus in 2-maccabees 10:29 are the same heavenly cavalry Elisha''s servant was given eyes to see.'),
  ('apocrypha', '2-maccabees', 10, 38, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The psalms and thanksgiving with which the people praise Yahuah for the victory in 2-maccabees 10:38 reprise the song Moses sang when the LORD overthrew horse and rider.'),
  ('apocrypha', '2-maccabees', 10, 30, 'canon', 'exodus', 15, 3, 'free', E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The heavenly riders who shoot arrows and lightnings to deliver Maccabeus in 2-maccabees 10:30 make plain that the battle belongs to Yahuah the man of war.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-dedication-eight-days',
       E'The Rededication Kept After the Manner of Tabernacles',
       E'When Maccabeus and his company recovered the sanctuary they did not invent a new thing — they kept the oldest thing. *And they kept the eight days with gladness, as in the feast of the tabernacles, remembering that not long afore they had held the feast of the tabernacles, when as they wandered in the mountains and dens like beasts. Therefore they bare branches, and fair boughs, and palms also, and sang psalms to him that had given them good success in cleansing his place* (2 Maccabees 10:6-7). The branches and palms are Torah: *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days* (Leviticus 23:40). The eight-day winter feast they ordained — *They ordained also by a common statute and decree, That every year those days should be kept of the whole nation of the Yahudim (Jews)* (2 Maccabees 10:8) — is the very feast the Messiah Himself walked in: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). It ain''t new — the brother book records the same ordinance: *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness* (1 Maccabees 4:59). And the regathered ingathering it patterns will be kept by all nations at the end: *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16).',
       sv.verse_id, ev.verse_id, 'extras', 62225
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-altars-pulled-down-abomination',
       E'The Abomination Torn Down, the Sanctuary Cleansed',
       E'The first work of the recovered people is demolition of the kingdom-of-man''s worship. *But the altars which the heathen had built in the open street, and also the chapels, they pulled down* (2 Maccabees 10:2) — *Now upon the same day that the strangers profaned the temple, on the very same day it was cleansed again, even the five and twentieth day of the same month, which is Casleu* (2 Maccabees 10:5). This is the undoing of Antiochus the antichrist-type, the man Daniel saw in vision: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The angel had asked how long the desolation would stand: *How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* (Daniel 8:13). 2 Maccabees 10 is the answer in history — yet the Messiah lifts the same abomination forward as a sign still to come: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Antiochus is the pattern of the system to be dismantled, not the law.',
       sv.verse_id, ev.verse_id, 'extras', 62228
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-chasten-with-mercy',
       E'Chasten Us With Mercy: the Covenant People Kept',
       E'Prostrate in the cleansed house, the people do not plead innocence but covenant. *When that was done, they fell flat down, and besought Yahuah (God) that they might come no more into such troubles; but if they sinned any more against him, that he himself would chasten them with mercy, and that they might not be delivered to the blasphemous and barbarous nations* (2 Maccabees 10:4). This is the heart of the kept seed — chastened, never cast off — and it is the same posture Tobit''s repentant Israel takes, owning the rod as a Father''s: *And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). The fathers had already framed the choice as mercy not curse — they would rather fall into the hand of Yahuah than of men: *Let us fall now into the hand of Yahuah (the LORD); for his mercies are great: and let me not fall into the hand of man* (2 Samuel 24:14). And the worst dread — to *be delivered to the blasphemous and barbarous nations* — is the very thing covenant mercy spares: *For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:12). The remnant asks to be corrected, not consumed; Torah is the Father''s discipline, not a sentence of death.',
       sv.verse_id, ev.verse_id, 'extras', 62231
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-zeal-against-blasphemy',
       E'Inflamed With Zeal Against the Blasphemers',
       E'When the besieged garrison *blasphemed exceedingly, and uttered wicked words* (2 Maccabees 10:34), the young men answer as Phinehas did. *Nevertheless upon the fifth day early twenty young men of Maccabeus'' company, inflamed with anger because of the blasphemies, assaulted the wall manly, and with a fierce courage killed all that they met withal* (2 Maccabees 10:35). This is covenant zeal, the very thing Yahuah credited to Phinehas in the wilderness: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy* (Numbers 25:11). For that zeal an everlasting covenant was given: *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). The same Phinehas-zeal armed Mattathias'' house — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62234
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-horsemen-from-heaven',
       E'Five Comely Men Upon Horses From Heaven',
       E'Against Timotheus'' multitude the deliverance is openly angelic. *But when the battle waxed strong, there appeared to the enemies from heaven five comely men upon horses, with bridles of gold, and two of them led the Yahudim (Jews), And took Maccabeus between them, and covered him on every side weapons, and kept him safe, but shot arrows and lightnings against the enemies: so that being confounded with blindness, and full of trouble, they were killed* (2 Maccabees 10:29-30). The unseen host made visible is Elisha''s mountain: *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17). And the people who pray before the battle (10:25-26) ascribe the victory to Yahuah the Warrior: *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name* (Exodus 15:3) — so that when it is done *they praised Yahuah (God) with psalms and thanksgiving, who had done so great things for Yashar''el (Israel)* (2 Maccabees 10:38), singing the song of the sea afresh: *I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1).',
       sv.verse_id, ev.verse_id, 'extras', 62237
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-10-dedication-eight-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The branches, boughs, and palms the Maccabees bore in 2-maccabees 10:7 are the prescribed Sukkot rite of Torah, kept out of season because they had been hunted in the mountains.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:15 — *And that they should publish and proclaim in all their cities, and in Jerusalem, saying, Go forth unto the mount, and fetch olive branches, and pine branches, and myrtle branches, and palm branches, and branches of thick trees, to make booths, as it is written.* As the returned remnant under Ezra rediscovered the booths-feast and proclaimed it, so the Maccabees in 2-maccabees 10:6 keep tabernacles as a people lately delivered out of the wilderness of dens and beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The yearly winter feast the whole nation ordained in 2-maccabees 10:8 is the very Feast of Dedication the Messiah kept in the temple — He honoured the Maccabean rededication.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The brother book records the same eight-day statute on the twenty-fifth of Casleu that 2-maccabees 10:8 decrees for the whole nation.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=59
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 14:16 — *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* The tabernacles-keeping with palms and psalms in 2-maccabees 10:7 prefigures the day all nations go up yearly to keep that same feast before the King.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-altars-pulled-down-abomination
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The heathen altars and chapels the Maccabees pull down in 2-maccabees 10:2 are exactly the abomination Daniel foresaw Antiochus placing in the polluted sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-altars-pulled-down-abomination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 8:13 — *Then I heard one saint speaking, and another saint said unto that certain saint which spake, How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* The cleansing on the very day of the profanation in 2-maccabees 10:5 answers the angel''s ''how long'' over the trodden sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-altars-pulled-down-abomination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The recovery of the defiled temple in 2-maccabees 10:1 is the historical first fulfillment of the abomination the Messiah warns will yet stand in the holy place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-altars-pulled-down-abomination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-chasten-with-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 24:14 — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (the LORD); for his mercies are great: and let me not fall into the hand of man.* David''s choice to fall into Yahuah''s merciful hand rather than man''s is precisely the prayer of 2-maccabees 10:4 — chasten us, but spare us the blasphemous nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-chasten-with-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 13:5 — *And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* Tobit voices the same covenant confidence the Maccabees pray in 2-maccabees 10:4 — the chastening of the scattered people ends in mercy and regathering, not abandonment.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-chasten-with-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 8:12 — *For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more.* The very mercy the Maccabees ask to be chastened with in 2-maccabees 10:4 is the covenant promise — corrected in mercy, their sins not held against them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-chasten-with-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-zeal-against-blasphemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The young men ''inflamed with anger because of the blasphemies'' in 2-maccabees 10:35 act in the very zeal-for-Yahuah''s-sake that marked Phinehas.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-zeal-against-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting covenant given for Phinehas'' zeal is the inheritance the zealous Maccabean house claims as it burns out the blasphemers in 2-maccabees 10:36.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-zeal-against-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-horsemen-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The five comely horsemen from heaven who shield Maccabeus in 2-maccabees 10:29 are the same heavenly cavalry Elisha''s servant was given eyes to see.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-horsemen-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The psalms and thanksgiving with which the people praise Yahuah for the victory in 2-maccabees 10:38 reprise the song Moses sang when the LORD overthrew horse and rider.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-horsemen-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The heavenly riders who shoot arrows and lightnings to deliver Maccabeus in 2-maccabees 10:30 make plain that the battle belongs to Yahuah the man of war.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-horsemen-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_11.sql (session253 2-maccabees 11) -----
-- Source anchor: apocrypha/2-maccabees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac11 (view _session253_2mac11_lookup). Sort band base 62250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-11-good-angel-deliver
  ('apocrypha', '2-maccabees', 11, 6, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The good angel the Maccabees beg for in 2-maccabees 11:6 is the very Angel Yahuah pledged to send before His covenant people.'),
  ('apocrypha', '2-maccabees', 11, 6, 'canon', 'exodus', 23, 22, 'free', E'Exodus 23:22 — *But if thou shalt indeed obey his voice, and do all that I speak; then I will be an enemy unto thine enemies, and an adversary unto thine adversaries.* The condition of that heavenly help is covenant obedience — the very Torah-faithfulness for which the men of 2-maccabees 11:6 are fighting.'),
  -- thread: 2-maccabees-11-horseman-white-gold
  ('apocrypha', '2-maccabees', 11, 8, 'canon', 'joshua', 5, 13, 'free', E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The same drawn-armed Figure that met Joshua at Jericho rides before the Maccabees at Jerusalem in 2-maccabees 11:8.'),
  ('apocrypha', '2-maccabees', 11, 8, 'canon', 'joshua', 5, 14, 'free', E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The white-clad horseman of 2-maccabees 11:8 is that Captain of the host of Yahuah, come to lead Israel''s battle.'),
  ('apocrypha', '2-maccabees', 11, 8, 'apocrypha', '2-maccabees', 3, 25, 'extras', E'2 Maccabees 3:25 — *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* The golden-harnessed rider who smote Heliodorus at the temple is the same heavenly horseman who now leads Israel in 2-maccabees 11:8.'),
  ('apocrypha', '2-maccabees', 11, 8, 'canon', 'revelation', 19, 11, 'free', E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The white horseman shaking his golden armour in 2-maccabees 11:8 foreshadows the Rider Faithful and True who leads the armies of heaven.'),
  -- thread: 2-maccabees-11-helper-from-heaven
  ('apocrypha', '2-maccabees', 11, 10, 'canon', '2-kings', 6, 17, 'free', E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The helper from heaven seen marching with Israel in 2-maccabees 11:10 is that same unseen host of fiery horses and chariots.'),
  ('apocrypha', '2-maccabees', 11, 13, 'canon', '2-kings', 6, 16, 'free', E'2 Kings 6:16 — *And he answered, Fear not: for they that be with us are more than they that be with them.* Lysias'' own conclusion in 2-maccabees 11:13 that the Hebrews could not be overcome is the enemy''s-eye proof of Elisha''s word — heaven''s host outnumbers every army of men.'),
  ('apocrypha', '2-maccabees', 11, 13, 'canon', 'revelation', 19, 14, 'free', E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The Almighty who could not be resisted in 2-maccabees 11:13 is He whose heavenly armies ride behind Him in white at the last.'),
  -- thread: 2-maccabees-11-die-for-his-laws
  ('apocrypha', '2-maccabees', 11, 24, 'canon', 'psalms', 119, 44, 'free', E'Psalm 119:44 — *So shall I keep thy law continually for ever and ever.* The manner of living the Jews would not surrender in 2-maccabees 11:24 is exactly this enduring delight to keep Yahuah''s law for ever.'),
  ('apocrypha', '2-maccabees', 11, 24, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The laws Antiochus is forced to restore in 2-maccabees 11:24 are the very laws the seven brothers died for, in the hope of resurrection.'),
  ('apocrypha', '2-maccabees', 11, 31, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Maccabean refusal to abandon their own meats and laws in 2-maccabees 11:31 is the very faith Hebrews crowns with the better resurrection.'),
  -- thread: 2-maccabees-11-restore-their-temple
  ('apocrypha', '2-maccabees', 11, 25, 'canon', 'ezra', 7, 25, 'free', E'Ezra 7:25 — *And thou, Ezra, after the wisdom of thy Elohim (God), that is in thine hand, set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not.* As Persia once decreed the restoration of Yahuah''s law over His people, so the king''s letter in 2-maccabees 11:25 is forced to restore the temple and the customs of the forefathers.'),
  ('apocrypha', '2-maccabees', 11, 25, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The temple restored to the Jews in 2-maccabees 11:25 is the house whose rededication became the very feast the Messiah Himself kept at Jerusalem.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-good-angel-deliver',
       E'Send a good angel to deliver Israel',
       E'Besieged by Lysias, Maccabeus and the covenant people do not first reach for the sword but for heaven: *Now when they that were with Maccabeus heard that he besieged the holds, they and all the people with lamentation and tears besought Yahuah (God) that he would send a good angel to deliver Yashar''el (Israel)* (2 Maccabees 11:6). It ain''t new — this is the deliverance Yahuah promised from the wilderness: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), the Angel in whom His Name dwells, who fights for the people that obey His voice: *But if thou shalt indeed obey his voice, and do all that I speak; then I will be an enemy unto thine enemies, and an adversary unto thine adversaries* (Exodus 23:22). The Torah-faithful Maccabees stand exactly where Israel stood at the Jordan, and the same Helper answers.',
       sv.verse_id, ev.verse_id, 'extras', 62250
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-horseman-white-gold',
       E'The horseman in white, his armour of gold',
       E'Heaven sends not merely an angel but a captain: *And as they were at Jerusalem, there appeared before them on horseback one in white clothing, shaking his armour of gold* (2 Maccabees 11:8). When Joshua first entered the land he met the same Figure — *behold, there stood a man over against him with his sword drawn in his hand* (Joshua 5:13) — who declared, *Nay; but as captain of the host of Yahuah (LORD) am I now come* (Joshua 5:14). It is no new apparition even within this book: at the temple Heliodorus was struck down by *an horse with a terrible rider upon him... and it seemed that he that sat upon the horse had complete harness of gold* (2 Maccabees 3:25). And the same Rider opens the last book of all: *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war* (Revelation 19:11) — the Captain of Yahuah''s host leading His armies still.',
       sv.verse_id, ev.verse_id, 'extras', 62253
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-helper-from-heaven',
       E'Having an helper from heaven',
       E'The whole victory hangs on one confession: *Thus they marched forward in their armour, having an helper from heaven: for Yahuah (God) was merciful to them* (2 Maccabees 11:10), so that the very enemy concluded *that the Hebrews could not be overcome, because the Almighty Yahuah (God) helped them* (2 Maccabees 11:13). This is the open-eyes faith of Elisha''s servant at Dothan, who feared the encircling host until *Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17) — for the word stood, *Fear not: for they that be with us are more than they that be with them* (2 Kings 6:16). The heavenly cavalry the Maccabees saw is the same fiery host that always surrounds the covenant people.',
       sv.verse_id, ev.verse_id, 'extras', 62256
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-die-for-his-laws',
       E'Liberty to live after their own laws',
       E'The peace letters confess what the whole war was for — not land but Torah: the Jews *would not consent to our father, for to be brought to the custom of the Gentiles, but had rather keep their own manner of living: for the which cause they require of us, that we should suffer them to live after their own laws* (2 Maccabees 11:24), and so the decree restores them: *the Yahudim (Jews) shall use their own kind of meats and laws, as before* (2 Maccabees 11:31). Even the kingdom of man is forced to grant what the covenant people would sooner die than surrender — the very hope of the brother who, dying for the commandments, cried, *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). This is no law-as-curse: it is the psalmist''s vow, *So shall I keep thy law continually for ever and ever* (Psalm 119:44), and the resurrection of the Torah-faithful that Hebrews itself looks back to: *others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35).',
       sv.verse_id, ev.verse_id, 'extras', 62259
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-restore-their-temple',
       E'We have determined to restore them their temple',
       E'Antiochus'' own letter is forced to undo the desolation he had wrought: *Wherefore our mind is, that this nation shall be in rest, and we have determined to restore them their temple, that they may live according to the customs of their forefathers* (2 Maccabees 11:25). The kingdom of man that profaned the sanctuary must now grant its restoration — as the Persian decree once charged Ezra to set Yahuah''s law again over the regathered people: *set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not* (Ezra 7:25). The temple given back here is the temple Judas will cleanse, the feast the Messiah Himself kept: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The covenant people and their house are not replaced but restored.',
       sv.verse_id, ev.verse_id, 'extras', 62262
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-11-good-angel-deliver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The good angel the Maccabees beg for in 2-maccabees 11:6 is the very Angel Yahuah pledged to send before His covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-good-angel-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:22 — *But if thou shalt indeed obey his voice, and do all that I speak; then I will be an enemy unto thine enemies, and an adversary unto thine adversaries.* The condition of that heavenly help is covenant obedience — the very Torah-faithfulness for which the men of 2-maccabees 11:6 are fighting.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-good-angel-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-horseman-white-gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The same drawn-armed Figure that met Joshua at Jericho rides before the Maccabees at Jerusalem in 2-maccabees 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The white-clad horseman of 2-maccabees 11:8 is that Captain of the host of Yahuah, come to lead Israel''s battle.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 3:25 — *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* The golden-harnessed rider who smote Heliodorus at the temple is the same heavenly horseman who now leads Israel in 2-maccabees 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The white horseman shaking his golden armour in 2-maccabees 11:8 foreshadows the Rider Faithful and True who leads the armies of heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-helper-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The helper from heaven seen marching with Israel in 2-maccabees 11:10 is that same unseen host of fiery horses and chariots.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-helper-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 6:16 — *And he answered, Fear not: for they that be with us are more than they that be with them.* Lysias'' own conclusion in 2-maccabees 11:13 that the Hebrews could not be overcome is the enemy''s-eye proof of Elisha''s word — heaven''s host outnumbers every army of men.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-helper-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The Almighty who could not be resisted in 2-maccabees 11:13 is He whose heavenly armies ride behind Him in white at the last.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-helper-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-die-for-his-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:44 — *So shall I keep thy law continually for ever and ever.* The manner of living the Jews would not surrender in 2-maccabees 11:24 is exactly this enduring delight to keep Yahuah''s law for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-die-for-his-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The laws Antiochus is forced to restore in 2-maccabees 11:24 are the very laws the seven brothers died for, in the hope of resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-die-for-his-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Maccabean refusal to abandon their own meats and laws in 2-maccabees 11:31 is the very faith Hebrews crowns with the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-die-for-his-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-restore-their-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:25 — *And thou, Ezra, after the wisdom of thy Elohim (God), that is in thine hand, set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not.* As Persia once decreed the restoration of Yahuah''s law over His people, so the king''s letter in 2-maccabees 11:25 is forced to restore the temple and the customs of the forefathers.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-restore-their-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The temple restored to the Jews in 2-maccabees 11:25 is the house whose rededication became the very feast the Messiah Himself kept at Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-restore-their-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_12.sql (session253 2-maccabees 12) -----
-- Source anchor: apocrypha/2-maccabees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac12 (view _session253_2mac12_lookup). Sort band base 62275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-12-mindful-of-the-resurrection
  ('apocrypha', '2-maccabees', 12, 43, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* the Maccabean martyrs are precisely the *others* in view, so when Judas is *mindful of the resurrection* he holds the same better hope Hebrews honours.'),
  ('apocrypha', '2-maccabees', 12, 44, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Judas hopes *they that were slain should have risen again* on the strength of this promised awaking of the dead.'),
  ('apocrypha', '2-maccabees', 12, 44, 'canon', '1-corinthians', 15, 29, 'free', E'1 Corinthians 15:29 — *Else what shall they do which are baptized for the dead, if the dead rise not at all? why are they then baptized for the dead?* Paul argues exactly as Judas does — an act on behalf of the dead is *superfluous and vain* unless the dead rise.'),
  ('apocrypha', '2-maccabees', 12, 45, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim; and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The *great favour laid up for those that died godly* is the standing-up John witnesses at the throne.'),
  ('apocrypha', '2-maccabees', 12, 43, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The resurrection Judas is *mindful of* is the same one the seven brothers confessed under torture — those who *died godly* die for the laws.'),
  -- thread: 2-maccabees-12-accursed-thing-under-the-coats
  ('apocrypha', '2-maccabees', 12, 40, 'canon', 'joshua', 7, 11, 'free', E'Joshua 7:11 — *Yashar''el hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff.* The idol-tokens hidden *under the coats* are Achan''s accursed thing hidden among the stuff — the same covenant breach by the same concealment.'),
  ('apocrypha', '2-maccabees', 12, 40, 'canon', 'joshua', 7, 12, 'free', E'Joshua 7:12 — *Therefore the children of Yashar''el could not stand before their enemies, but turned their backs before their enemies, because they were accursed: neither will I be with you any more, except ye destroy the accursed from among you.* This is why the slain fell — like Achan''s Israel, they *could not stand* while the accursed thing was carried among them.'),
  ('apocrypha', '2-maccabees', 12, 40, 'canon', 'deuteronomy', 7, 25, 'free', E'Deuteronomy 7:25 — *The graven images of their gods shall ye burn with fire: thou shalt not desire the silver or gold that is on them, nor take it unto thee, lest thou be snared therein: for it is an abomination to Yahuah Elohayka.* The *things consecrated to the idols* are exactly the snare the law forbade — taking the idol''s silver was the abomination that slew them.'),
  ('apocrypha', '2-maccabees', 12, 42, 'canon', 'leviticus', 27, 28, 'free', E'Leviticus 27:28 — *Notwithstanding no devoted thing, that a man shall devote unto Yahuah of all that he hath, both of man and beast, and of the field of his possession, shall be sold or redeemed: every devoted thing is most holy unto Yahuah.* The devoted spoil belonged to Yahuah, not the soldier''s coat — Judas''s call to purge the sin restores the holy thing to its place.'),
  -- thread: 2-maccabees-12-sin-offering-for-reconciliation
  ('apocrypha', '2-maccabees', 12, 43, 'canon', 'leviticus', 4, 26, 'free', E'Leviticus 4:26 — *And he shall burn all his fat upon the altar, as the fat of the sacrifice of peace offerings: and the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him.* Judas''s *sin offering* at Jerusalem follows the very ordinance Torah gave for atonement — the means of being *delivered from sin*.'),
  ('apocrypha', '2-maccabees', 12, 45, 'canon', '1-corinthians', 15, 20, 'free', E'1 Corinthians 15:20 — *But now is Messiah risen from the dead, and become the firstfruits of them that slept.* The *reconciliation for the dead* rests on a resurrection that has a firstfruits — the godly slain follow where the firstfruits has gone.'),
  -- thread: 2-maccabees-12-jericho-who-seeth-all-things
  ('apocrypha', '2-maccabees', 12, 15, 'canon', 'joshua', 6, 20, 'free', E'Joshua 6:20 — *So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* Judas pleads this very fall — the One who cast down Jericho *without rams or engines* casts down Caspis''s walls too.'),
  ('apocrypha', '2-maccabees', 12, 22, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah, which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The enemy *struck with fear and terror through the appearing of him who seeth all things* is routed by the same warrior-God who fought at the sea.'),
  -- thread: 2-maccabees-12-feast-of-weeks-kept
  ('apocrypha', '2-maccabees', 12, 31, 'canon', 'leviticus', 23, 21, 'free', E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* The *feast of the weeks* the warriors come to Jerusalem to keep is this *statute for ever* — the appointed time honoured even in war.'),
  ('apocrypha', '2-maccabees', 12, 32, 'canon', 'acts', 2, 1, 'free', E'Acts 2:1 — *And when the day of Pentecost was fully come, they were all with one accord in one place.* The same *feast, called Pentecost* the Maccabees keep is the day the gathered people stand together with one accord — one feast across the covenant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-mindful-of-the-resurrection',
       E'Mindful of the resurrection — the hope laid up for those that died godly',
       E'Judas gathers an offering for the slain and sends it to Jerusalem, *And when he had made a gathering throughout the company to the sum of two thousand drachms of silver, he sent it to Jerusalem to offer a sin offering, doing in it very well and honestly, in that he was mindful of the resurrection* (2 Maccabees 12:43) — and the text says plainly why: *For if he had not hoped that they that were slain should have risen again, it had been superfluous and vain to pray for the dead* (2 Maccabees 12:44). The deed is honest only because the resurrection is real; *he perceived that there was great favour laid up for those that died godly* (2 Maccabees 12:45). This is the same hope the seven brothers held under Antiochus — *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9) — and it is the very hope Hebrews names when it points back to *others* who *were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The prophets carried it before them: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2). Paul reasons exactly as Judas does — that to act for the dead is empty unless the dead rise (1 Corinthians 15:29) — and John sees the day arrive: *And I saw the dead, small and great, stand before Elohim* (Revelation 20:12). It ain''t new: the covenant people died godly because they knew the dust would give them back.',
       sv.verse_id, ev.verse_id, 'extras', 62275
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-accursed-thing-under-the-coats',
       E'The accursed thing under their coats — why they were slain',
       E'When the bodies are gathered, the cause of their fall is uncovered: *Now under the coats of every one that was slain they found things consecrated to the idols of the Jamnites, which is forbidden the Yahudim by the law. Then every man saw that this was the cause wherefore they were slain* (2 Maccabees 12:40). This is Achan retold — *Yashar''el hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing* (Joshua 7:11) — and as with Achan, the host *could not stand before their enemies* (Joshua 7:12) until the devoted thing was purged. The Torah had warned exactly this concerning the silver and gold of idols: *thou shalt not desire the silver or gold that is on them, nor take it unto thee, lest thou be snared therein: for it is an abomination to Yahuah Elohayka* (Deuteronomy 7:25); the spoil of the herem is *most holy unto Yahuah* and not for private keeping (Leviticus 27:28). So Judas leads the people to *besought him that the sin committed might wholly be put out of remembrance* (2 Maccabees 12:42) — Torah-faithfulness, not law-as-curse: the covenant stands, and the people keep it.',
       sv.verse_id, ev.verse_id, 'extras', 62278
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-sin-offering-for-reconciliation',
       E'A sin offering sent to Jerusalem — reconciliation for the dead',
       E'Judas *sent it to Jerusalem to offer a sin offering* (2 Maccabees 12:43), and *Whereupon he made a reconciliation for the dead, that they might be delivered from sin* (2 Maccabees 12:45). The pattern is the altar Torah appointed: *the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him* (Leviticus 4:26) — sin is covered by an offering brought to the sanctuary, not invented but commanded. Read honestly, the deliverance from sin is grounded in the resurrection-hope, for the slain are reckoned among those who will rise — and Messiah is the firstfruits of that rising: *But now is Messiah risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20). The sin offering at Jerusalem looks toward the day the dead in the dust are gathered and the godly find favour; the reconciliation is real because the resurrection is sure.',
       sv.verse_id, ev.verse_id, 'extras', 62281
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-jericho-who-seeth-all-things',
       E'Who cast down Jericho — the warrior who seeth all things',
       E'Before the walls of Caspis, Judas calls *upon the great Yahuah of the world, who without rams or engines of war did cast down Jericho in the time of Joshua* (2 Maccabees 12:15) — pleading the founding deliverance: *the wall fell down flat... and they took the city* (Joshua 6:20), where no siege-engine but the trumpet and the LORD brought the walls down. So too here *they found him not... having left a very strong garrison* is undone, and the enemy flees *through the appearing of him who seeth all things* (2 Maccabees 12:22) — the same Captain who told Israel at the sea, *Fear ye not, stand still, and see the salvation of Yahuah, which he will shew to you to day* (Exodus 14:13). Antiochus''s officers are the kingdom of man with all its *engines and darts*; the victory is not in the engines but in the One who sees and fights for His people.',
       sv.verse_id, ev.verse_id, 'extras', 62284
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-feast-of-weeks-kept',
       E'The feast of weeks approaching — the appointed time kept in war',
       E'Even in the press of campaign the fighters keep the moed: *so they came to Jerusalem, the feast of the weeks approaching* (2 Maccabees 12:31), *And after the feast, called Pentecost, they went forth against Gorgias* (2 Maccabees 12:32). The covenant calendar governs the warriors — the Torah-appointed day stands: *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever* (Leviticus 23:21). It is the feast the faithful kept — and the very day on which, generations on, the people would again be gathered with one accord: *And when the day of Pentecost was fully come, they were all with one accord in one place* (Acts 2:1). The Maccabees keep the feast first, then fight; the appointed times are not abolished but honoured.',
       sv.verse_id, ev.verse_id, 'extras', 62287
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-12-mindful-of-the-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* the Maccabean martyrs are precisely the *others* in view, so when Judas is *mindful of the resurrection* he holds the same better hope Hebrews honours.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Judas hopes *they that were slain should have risen again* on the strength of this promised awaking of the dead.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:29 — *Else what shall they do which are baptized for the dead, if the dead rise not at all? why are they then baptized for the dead?* Paul argues exactly as Judas does — an act on behalf of the dead is *superfluous and vain* unless the dead rise.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim; and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The *great favour laid up for those that died godly* is the standing-up John witnesses at the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The resurrection Judas is *mindful of* is the same one the seven brothers confessed under torture — those who *died godly* die for the laws.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-accursed-thing-under-the-coats
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 7:11 — *Yashar''el hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff.* The idol-tokens hidden *under the coats* are Achan''s accursed thing hidden among the stuff — the same covenant breach by the same concealment.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 7:12 — *Therefore the children of Yashar''el could not stand before their enemies, but turned their backs before their enemies, because they were accursed: neither will I be with you any more, except ye destroy the accursed from among you.* This is why the slain fell — like Achan''s Israel, they *could not stand* while the accursed thing was carried among them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:25 — *The graven images of their gods shall ye burn with fire: thou shalt not desire the silver or gold that is on them, nor take it unto thee, lest thou be snared therein: for it is an abomination to Yahuah Elohayka.* The *things consecrated to the idols* are exactly the snare the law forbade — taking the idol''s silver was the abomination that slew them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 27:28 — *Notwithstanding no devoted thing, that a man shall devote unto Yahuah of all that he hath, both of man and beast, and of the field of his possession, shall be sold or redeemed: every devoted thing is most holy unto Yahuah.* The devoted spoil belonged to Yahuah, not the soldier''s coat — Judas''s call to purge the sin restores the holy thing to its place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-sin-offering-for-reconciliation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 4:26 — *And he shall burn all his fat upon the altar, as the fat of the sacrifice of peace offerings: and the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him.* Judas''s *sin offering* at Jerusalem follows the very ordinance Torah gave for atonement — the means of being *delivered from sin*.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-sin-offering-for-reconciliation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:20 — *But now is Messiah risen from the dead, and become the firstfruits of them that slept.* The *reconciliation for the dead* rests on a resurrection that has a firstfruits — the godly slain follow where the firstfruits has gone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-sin-offering-for-reconciliation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-jericho-who-seeth-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 6:20 — *So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* Judas pleads this very fall — the One who cast down Jericho *without rams or engines* casts down Caspis''s walls too.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-jericho-who-seeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah, which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The enemy *struck with fear and terror through the appearing of him who seeth all things* is routed by the same warrior-God who fought at the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-jericho-who-seeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-feast-of-weeks-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* The *feast of the weeks* the warriors come to Jerusalem to keep is this *statute for ever* — the appointed time honoured even in war.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-feast-of-weeks-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:1 — *And when the day of Pentecost was fully come, they were all with one accord in one place.* The same *feast, called Pentecost* the Maccabees keep is the day the gathered people stand together with one accord — one feast across the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-feast-of-weeks-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_13.sql (session253 2-maccabees 13) -----
-- Source anchor: apocrypha/2-maccabees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac13 (view _session253_2mac13_lookup). Sort band base 62300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-13-king-of-kings
  ('apocrypha', '2-maccabees', 13, 4, 'canon', 'daniel', 2, 37, 'free', E'Daniel 2:37 — *Thou, O king, art a king of kings: for the Elohim (God) of heaven hath given thee a kingdom, power, and strength, and glory.* As Daniel told Babylon, so 2 Maccabees 13:4 confesses: the empire''s crown is loaned by the Elohim of heaven, who bends even Antiochus'' mind to His purpose.'),
  ('apocrypha', '2-maccabees', 13, 4, 'canon', '1-timothy', 6, 15, 'free', E'1 Timothy 6:15 — *Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* The very title the apostle gives to the One above every throne is the title 2 Maccabees 13:4 sets over Antiochus, who is moved like a piece on a board he cannot see.'),
  -- thread: 2-maccabees-13-ashes-recompense
  ('apocrypha', '2-maccabees', 13, 7, 'canon', 'galatians', 6, 7, 'free', E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Menelaus sinning about the holy altar and dying in its ashes (2 Maccabees 13:7-8) is the sowing-and-reaping law made visible.'),
  ('apocrypha', '2-maccabees', 13, 8, 'canon', 'proverbs', 11, 21, 'free', E'Proverbs 11:21 — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* Though Menelaus joined hands with Antiochus, he was not unpunished; 2 Maccabees 13:8 says he received his death in ashes — most justly.'),
  ('apocrypha', '2-maccabees', 13, 7, 'canon', 'jeremiah', 22, 19, 'free', E'Jeremiah 22:19 — *He shall be buried with the burial of an ass, drawn and cast forth beyond the gates of Jerusalem.* The covenant-betrayer denied an honourable grave in Jeremiah is the same recompense 2 Maccabees 13:7 records over Menelaus, who died not having so much as burial in the earth.'),
  -- thread: 2-maccabees-13-weeping-fasting-battle
  ('apocrypha', '2-maccabees', 13, 12, 'canon', '2-chronicles', 20, 12, 'free', E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s helpless turning of his eyes to Yahuah is exactly the weeping, fasting, three-days-prostrate posture of Judas'' people in 2 Maccabees 13:12.'),
  ('apocrypha', '2-maccabees', 13, 14, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* When Judas commits all to the Creator of the world in 2 Maccabees 13:14, he stands in the truth Jehoshaphat heard: the battle belongs to Elohim.'),
  ('apocrypha', '2-maccabees', 13, 12, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s summons to return with fasting and weeping is enacted to the letter by Judas'' people in 2 Maccabees 13:12.'),
  ('apocrypha', '2-maccabees', 13, 12, 'apocrypha', '1-maccabees', 4, 30, 'extras', E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The sister-book shows the same Maccabean rule — prayer before the mighty army — that frames the fasting of 2 Maccabees 13:12.'),
  -- thread: 2-maccabees-13-night-victory
  ('apocrypha', '2-maccabees', 13, 15, 'canon', 'psalms', 20, 7, 'free', E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* Against Antiochus'' three hundred hooked chariots, Judas'' watchword Victory is of Yahuah in 2 Maccabees 13:15 is this very psalm made flesh.'),
  ('apocrypha', '2-maccabees', 13, 15, 'canon', 'judges', 7, 7, 'free', E'Judges 7:7 — *And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place.* The choice young men striking the king''s camp by night in 2 Maccabees 13:15 are Gideon''s whittled three hundred, that the victory might plainly be of Yahuah.'),
  ('apocrypha', '2-maccabees', 13, 17, 'canon', 'judges', 7, 20, 'free', E'Judges 7:20 — *And the three companies blew the trumpets, and brake the pitchers, and held the lamps in their left hands, and the trumpets in their right hands to blow withal: and they cried, The sword of Yahuah (LORD), and of Gideon.* Gideon''s night-rout, finished as the protection of Yahuah did help him, is the pattern of Judas'' dawn victory in 2 Maccabees 13:17.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-king-of-kings',
       E'The King of kings turns the heart of kings',
       E'When the apostate Menelaus marched alongside the invading Antiochus, hoping to be made governor, the historian unmasks the true Sovereign over the whole affair: *But the King of kings moved Antiochus’ mind against this wicked wretch, and Lysias informed the king that this man was the cause of all mischief, so that the king commanded to bring him to Berea, and to put him to death, as the manner is in that place.* (2 Maccabees 13:4). The pagan emperor is no autonomous power; even Babylon''s crown is a delegated thing — *Thou, O king, art a king of kings: for the Elohim (God) of heaven hath given thee a kingdom, power, and strength, and glory.* (Daniel 2:37) — and Yahuah turns the heart of the man-kingdom wherever He wills. The same title rises in the apostles'' confession of the One above every throne — *Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* (1 Timothy 6:15) — so that Antiochus the abomination, like Menelaus, is only an instrument in a hand he cannot see.',
       sv.verse_id, ev.verse_id, 'extras', 62300
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-ashes-recompense',
       E'Menelaus dies in ashes, unburied — the just recompense',
       E'The traitor-priest who defiled the altar is repaid in kind, dying in the tower of ashes and denied a grave: *Such a death it happened that wicked man to die, not having so much as burial in the earth; and that most justly:* (2 Maccabees 13:7); *For inasmuch as he had committed many sins about the altar, whose fire and ashes were holy, he received his death in ashes.* (2 Maccabees 13:8). This is not law-as-curse but the covenant''s own scale: a man reaps what he sows — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7) — and *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* (Proverbs 11:21). The denial of burial echoes the prophet''s word over another covenant-betrayer, Jehoiakim — *He shall be buried with the burial of an ass, drawn and cast forth beyond the gates of Jerusalem.* (Jeremiah 22:19) — the apostate''s end answered by the very holiness he profaned.',
       sv.verse_id, ev.verse_id, 'extras', 62303
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-weeping-fasting-battle',
       E'Weeping and fasting: the battle is Yahuah''s',
       E'Before a sword is drawn, Judas turns the people to their true defence — supplication, fasting, and the casting of all upon the Creator: *So when they had all done this together, and besought the merciful Yahuah (God) with weeping and fasting, and lying flat upon the ground three days long, Judas, having exhorted them, commanded they should be in a readiness.* (2 Maccabees 13:12); *So when he had committed all to the Creator of the world, and exhorted his soldiers to fight manfully, even to death, for the laws, the temple, the city, the country, and the commonwealth, he camped by Modin:* (2 Maccabees 13:14). This is Jehoshaphat''s posture when an overwhelming host came up — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* (2 Chronicles 20:12) — and the word that answered him answers Judas: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* (2 Chronicles 20:15). It is the very prophet''s call to turn back with fasting — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* (Joel 2:12) — and the brother-Maccabee before him prayed the same in the face of a mighty army: *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* (1 Maccabees 4:30).',
       sv.verse_id, ev.verse_id, 'extras', 62306
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-night-victory',
       E'Victory is of Yahuah — the night-strike like Gideon',
       E'With the watchword on their lips, Judas'' chosen men fall upon the camp by night and break it in the dawn, for the deliverance was never theirs to manufacture: *And having given the watchword to them that were about him, Victory is of Yahuah (God); with the most valiant and choice young men he went in into the king’s tent by night, and slew in the camp about four thousand men, and the chiefest of the elephants, with all that were upon him.* (2 Maccabees 13:15); *This was done in the break of the day, because the protection of Yahuah (God) did help him.* (2 Maccabees 13:17). It is Gideon''s three hundred all over again, the night-strike on a numberless host so that no flesh could boast — *And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place.* (Judges 7:7); *And the three companies blew the trumpets, and brake the pitchers, and held the lamps in their left hands, and the trumpets in their right hands to blow withal: and they cried, The sword of Yahuah (LORD), and of Gideon.* (Judges 7:20). And the watchword itself is the psalm of the trusting remnant: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7) — against Antiochus'' chariots armed with hooks, the name of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 62309
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-13-king-of-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:37 — *Thou, O king, art a king of kings: for the Elohim (God) of heaven hath given thee a kingdom, power, and strength, and glory.* As Daniel told Babylon, so 2 Maccabees 13:4 confesses: the empire''s crown is loaned by the Elohim of heaven, who bends even Antiochus'' mind to His purpose.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-king-of-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 6:15 — *Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* The very title the apostle gives to the One above every throne is the title 2 Maccabees 13:4 sets over Antiochus, who is moved like a piece on a board he cannot see.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-king-of-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-13-ashes-recompense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Menelaus sinning about the holy altar and dying in its ashes (2 Maccabees 13:7-8) is the sowing-and-reaping law made visible.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-ashes-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:21 — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* Though Menelaus joined hands with Antiochus, he was not unpunished; 2 Maccabees 13:8 says he received his death in ashes — most justly.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-ashes-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 22:19 — *He shall be buried with the burial of an ass, drawn and cast forth beyond the gates of Jerusalem.* The covenant-betrayer denied an honourable grave in Jeremiah is the same recompense 2 Maccabees 13:7 records over Menelaus, who died not having so much as burial in the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-ashes-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-13-weeping-fasting-battle
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s helpless turning of his eyes to Yahuah is exactly the weeping, fasting, three-days-prostrate posture of Judas'' people in 2 Maccabees 13:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* When Judas commits all to the Creator of the world in 2 Maccabees 13:14, he stands in the truth Jehoshaphat heard: the battle belongs to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s summons to return with fasting and weeping is enacted to the letter by Judas'' people in 2 Maccabees 13:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The sister-book shows the same Maccabean rule — prayer before the mighty army — that frames the fasting of 2 Maccabees 13:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-13-night-victory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* Against Antiochus'' three hundred hooked chariots, Judas'' watchword Victory is of Yahuah in 2 Maccabees 13:15 is this very psalm made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-night-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 7:7 — *And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place.* The choice young men striking the king''s camp by night in 2 Maccabees 13:15 are Gideon''s whittled three hundred, that the victory might plainly be of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-night-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 7:20 — *And the three companies blew the trumpets, and brake the pitchers, and held the lamps in their left hands, and the trumpets in their right hands to blow withal: and they cried, The sword of Yahuah (LORD), and of Gideon.* Gideon''s night-rout, finished as the protection of Yahuah did help him, is the pattern of Judas'' dawn victory in 2 Maccabees 13:17.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-night-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_14.sql (session253 2-maccabees 14) -----
-- Source anchor: apocrypha/2-maccabees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac14 (view _session253_2mac14_lookup). Sort band base 62325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-14-razis-restore-bowels
  ('apocrypha', '2-maccabees', 14, 46, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The seven brothers and Razis share one confession — the King of the world will raise up those who die for His laws, so 2 Maccabees 14:46 can hand back its very bowels in faith.'),
  ('apocrypha', '2-maccabees', 14, 46, 'apocrypha', '2-maccabees', 7, 11, 'extras', E'2 Maccabees 7:11 — *And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* The brother''s words over his own severed hands and tongue are Razis'' words over his own cast-out bowels in 2 Maccabees 14:46 — received from heaven, surrendered for the law, hoped back from the same hand.'),
  ('apocrypha', '2-maccabees', 14, 46, 'canon', 'job', 19, 25, 'free', E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* Razis dies on this ancient certainty — that the living Redeemer stands at the latter day to restore what the grave takes, so 2 Maccabees 14:46 entrusts the flesh itself to Him.'),
  ('apocrypha', '2-maccabees', 14, 46, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awaking from the dust that Daniel saw under this same Greek kingdom is the restoration Razis calls upon at 2 Maccabees 14:46.'),
  ('apocrypha', '2-maccabees', 14, 46, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The Messiah names the very hour Razis reached for — the resurrection of life that gives back the body — confirming the hope of 2 Maccabees 14:46 is no novelty.'),
  -- thread: 2-maccabees-14-die-rather-than-defiled
  ('apocrypha', '2-maccabees', 14, 42, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The faith roll''s tortured who refused deliverance for a better resurrection are these very Maccabean martyrs, so Razis'' choice to die rather than be taken at 2 Maccabees 14:42 is the apostle''s own example of faith.'),
  ('apocrypha', '2-maccabees', 14, 38, 'apocrypha', '2-maccabees', 7, 14, 'extras', E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* Razis'' lifelong jeopardy of body and life for the religion of the Yahudim at 2 Maccabees 14:38 rests on the same hope the dying brother named — put to death by men, raised again by Yahuah.'),
  -- thread: 2-maccabees-14-nicanor-blasphemes-temple
  ('apocrypha', '2-maccabees', 14, 33, 'canon', '2-kings', 19, 22, 'free', E'2 Kings 19:22 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Nicanor''s hand raised against the temple at 2 Maccabees 14:33 is Sennacherib''s exalted voice all over again — the reproach falls not on Israel but on the Holy One who defends His house.'),
  ('apocrypha', '2-maccabees', 14, 33, 'canon', 'psalms', 74, 7, 'free', E'Psalm 74:7 — *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.* The very threat Nicanor swears at 2 Maccabees 14:33 — to lay the temple even with the ground — is the desolation Asaph already mourned and laid before Yahuah.'),
  ('apocrypha', '2-maccabees', 14, 33, 'canon', 'psalms', 74, 10, 'free', E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The blaspheming adversary of the psalm is Nicanor swearing against the house at 2 Maccabees 14:33 — and the cry ''how long'' is answered when Yahuah strikes him down in the next chapter.'),
  -- thread: 2-maccabees-14-keep-this-house-undefiled
  ('apocrypha', '2-maccabees', 14, 36, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The house ''lately cleansed'' that the priests beg to keep undefiled at 2 Maccabees 14:36 is the Maccabean rededication — the feast of dedication the Messiah Himself kept in Jerusalem.'),
  ('apocrypha', '2-maccabees', 14, 35, 'canon', 'psalms', 74, 10, 'free', E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The priests'' plea that Yahuah dwell among them at 2 Maccabees 14:35 is the answer to Asaph''s ''how long'' — the God who chose this habitation will not let the blasphemer''s mouth go unstopped.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-razis-restore-bowels',
       E'Razis casts himself down, calling on the Lord of life to restore him',
       E'Noble Razis, hemmed in on every side rather than fall into the hand of the wicked, makes his own body the witness of the resurrection: *When as his blood was now quite gone, he plucked out his bowels, and taking them in both his hands, he cast them upon the throng, and calling upon Yahuah (God) of life and spirit to restore him those again, he thus died.* (2 Maccabees 14:46). This is the same hope the seven brothers of chapter 7 confessed before the same persecuting kingdom: *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9), and *And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* (2 Maccabees 7:11) — the very bowels and limbs given back. Iyob (Job) had seen it long before from his ash-heap: *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* (Job 19:25), *And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God):* (Job 19:26). Daniel sealed it: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). And the Messiah Himself named the hour Razis was reaching for: *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62325
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-die-rather-than-defiled',
       E'Choosing to die manfully rather than fall into the hands of the wicked',
       E'Razis, a father of the Yahudim accused of his Torah-faithfulness, refuses the enemy''s hand: *Choosing rather to die manfully, than to come into the hands of the wicked, to be abused otherwise than beseemed his noble birth:* (2 Maccabees 14:42). He had long before *jeopard his body and life with all vehemency for the religion of the Yahudim (Jews).* (2 Maccabees 14:38) — covenant kept unto death, never the law as a curse but the law as life worth dying for. This is the witness the writer to the Hebrews names: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35). The tortured who would not accept deliverance ARE the Maccabean martyrs — Eleazar, the seven brothers, and Razis — and the *better resurrection* they refused deliverance to obtain is the very restoration of the body he prays for as he dies.',
       sv.verse_id, ev.verse_id, 'extras', 62328
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=42
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-nicanor-blasphemes-temple',
       E'Nicanor stretches out his hand against the temple — the blasphemer''s reproach',
       E'Nicanor lifts his right hand against the house of Yahuah and threatens to set up an idol in its place: *He stretched out his right hand toward the temple, and made an oath in this manner: If you will not deliver me Judas as a prisoner, I will lay this temple of Yahuah (God) even with the ground, and I will break down the altar, and erect a notable temple to Bacchus.* (2 Maccabees 14:33). It is the proud voice raised against the Holy One — the same Assyrian arrogance Yahuah answered through Yeshayahu (Isaiah) against Sennacherib: *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* (2 Kings 19:22). Asaph had wept over the very desolation Nicanor threatens: *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.* (Psalm 74:7), crying *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* (Psalm 74:10). Antiochus'' kingdom is the system of the man who exalts his voice against heaven — and heaven, not the sword, brings it down.',
       sv.verse_id, ev.verse_id, 'extras', 62331
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-keep-this-house-undefiled',
       E'The priests plead: keep this house ever undefiled, lately cleansed',
       E'Against the threatened abomination the priests appeal to the Defender of the nation to guard the house newly rededicated: *Therefore now, O holy Yahuah (God) of all holiness, keep this house ever undefiled, which lately was cleansed, and stop every unrighteous mouth.* (2 Maccabees 14:36), pleading with *You, O Yahuah (God) of all things, who have need of nothing, were pleased that the temple of yours habitation should be among us:* (2 Maccabees 14:35). The cleansing ''lately'' done is the rededication the Messiah Himself would keep — *And it was at Jerusalem the feast of the dedication, and it was winter.* (John 10:22) — and the One who has need of nothing yet chose to dwell among His people is the same Elohim whose name the enemy blasphemes. The temple kept undefiled here points past the desolation Daniel foresaw to the day the prayer is fully answered, the unrighteous mouth at last stopped.',
       sv.verse_id, ev.verse_id, 'extras', 62334
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-14-razis-restore-bowels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The seven brothers and Razis share one confession — the King of the world will raise up those who die for His laws, so 2 Maccabees 14:46 can hand back its very bowels in faith.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:11 — *And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* The brother''s words over his own severed hands and tongue are Razis'' words over his own cast-out bowels in 2 Maccabees 14:46 — received from heaven, surrendered for the law, hoped back from the same hand.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* Razis dies on this ancient certainty — that the living Redeemer stands at the latter day to restore what the grave takes, so 2 Maccabees 14:46 entrusts the flesh itself to Him.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awaking from the dust that Daniel saw under this same Greek kingdom is the restoration Razis calls upon at 2 Maccabees 14:46.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The Messiah names the very hour Razis reached for — the resurrection of life that gives back the body — confirming the hope of 2 Maccabees 14:46 is no novelty.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-14-die-rather-than-defiled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The faith roll''s tortured who refused deliverance for a better resurrection are these very Maccabean martyrs, so Razis'' choice to die rather than be taken at 2 Maccabees 14:42 is the apostle''s own example of faith.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-die-rather-than-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* Razis'' lifelong jeopardy of body and life for the religion of the Yahudim at 2 Maccabees 14:38 rests on the same hope the dying brother named — put to death by men, raised again by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-die-rather-than-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=38
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-14-nicanor-blasphemes-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:22 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Nicanor''s hand raised against the temple at 2 Maccabees 14:33 is Sennacherib''s exalted voice all over again — the reproach falls not on Israel but on the Holy One who defends His house.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-nicanor-blasphemes-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:7 — *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.* The very threat Nicanor swears at 2 Maccabees 14:33 — to lay the temple even with the ground — is the desolation Asaph already mourned and laid before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-nicanor-blasphemes-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The blaspheming adversary of the psalm is Nicanor swearing against the house at 2 Maccabees 14:33 — and the cry ''how long'' is answered when Yahuah strikes him down in the next chapter.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-nicanor-blasphemes-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-14-keep-this-house-undefiled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The house ''lately cleansed'' that the priests beg to keep undefiled at 2 Maccabees 14:36 is the Maccabean rededication — the feast of dedication the Messiah Himself kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-keep-this-house-undefiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The priests'' plea that Yahuah dwell among them at 2 Maccabees 14:35 is the answer to Asaph''s ''how long'' — the God who chose this habitation will not let the blasphemer''s mouth go unstopped.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-keep-this-house-undefiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2maccabees_15.sql (session253 2-maccabees 15) -----
-- Source anchor: apocrypha/2-maccabees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac15 (view _session253_2mac15_lookup). Sort band base 62350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-15-sabbath-kept
  ('apocrypha', '2-maccabees', 15, 4, 'canon', 'exodus', 31, 16, 'free', E'Exodus 31:16 — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant.* The seventh-day rest the Yahudim confess before Nicanor is the perpetual sign of the covenant given at Sinai, not a yoke to be set aside under threat.'),
  ('apocrypha', '2-maccabees', 15, 2, 'canon', 'exodus', 20, 11, 'free', E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The One who ''seeth all things'' has ''honoured with holiness above all other days'' the very day He hallowed at creation in 2 Maccabees 15:2.'),
  -- thread: 2-maccabees-15-comfort-law-and-prophets
  ('apocrypha', '2-maccabees', 15, 9, 'canon', 'deuteronomy', 20, 1, 'free', E'Deuteronomy 20:1 — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah (LORD) thy God is with thee, which brought thee up out of the land of Egypt.* The Torah Judas reads to his men is the same word of war that bids Yashar''el not to fear the multitude in 2 Maccabees 15:9.'),
  ('apocrypha', '2-maccabees', 15, 8, 'canon', 'deuteronomy', 31, 6, 'free', E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah (LORD) thy God, he it is that doth go with thee; he will not fail thee, nor forsake thee.* Judas exhorts his people ''not to fear the coming of the heathen'' on the strength of this same Mosaic charge in 2 Maccabees 15:8.'),
  -- thread: 2-maccabees-15-jeremiah-intercedes
  ('apocrypha', '2-maccabees', 15, 14, 'canon', 'jeremiah', 15, 1, 'free', E'Jeremiah 15:1 — *Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people: cast them out of my sight, and let them go forth.* The very Jeremiah who knew the weight of standing before Elohim for the people is the grey-haired intercessor ''who prayeth much for the people, and for the holy city'' in 2 Maccabees 15:14.'),
  ('apocrypha', '2-maccabees', 15, 12, 'canon', 'zechariah', 1, 12, 'free', E'Zechariah 1:12 — *Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* Onias''s uplifted hands ''for the whole body of the Yahudim'' echo the heavenly intercession for Jerusalem in 2 Maccabees 15:12.'),
  ('apocrypha', '2-maccabees', 15, 14, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The prayers of Onias and Jeremiah for the holy city are the same saints'' prayers that rise before the throne in 2 Maccabees 15:14.'),
  -- thread: 2-maccabees-15-golden-sword
  ('apocrypha', '2-maccabees', 15, 16, 'canon', 'ephesians', 6, 17, 'free', E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God).* The ''holy sword, a gift from Yahuah'' that Jeremiah hands Judas is the covenant''s true weapon, the word of Elohim, in 2 Maccabees 15:16.'),
  ('apocrypha', '2-maccabees', 15, 16, 'canon', 'hebrews', 4, 12, 'free', E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blade with which Judas shall ''wound the adversaries'' is the living word that cuts sharper than any edge in 2 Maccabees 15:16.'),
  ('apocrypha', '2-maccabees', 15, 15, 'canon', 'revelation', 1, 16, 'free', E'Revelation 1:16 — *And he had in his right hand seven stars: and out of his mouth went a sharp twoedged sword: and his countenance was as the sun shineth in his strength.* The golden sword from Jeremiah''s right hand foreshadows the twoedged sword from the mouth of the Glorified One in 2 Maccabees 15:15.'),
  -- thread: 2-maccabees-15-angel-and-deliverance
  ('apocrypha', '2-maccabees', 15, 22, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas pleads this exact deliverance — the angel slaying the hundred fourscore and five thousand of Sennacherib — as the pattern for his own day in 2 Maccabees 15:22.'),
  ('apocrypha', '2-maccabees', 15, 22, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the very angelic blow Judas recalls against the host of Sennacherib in 2 Maccabees 15:22.'),
  -- thread: 2-maccabees-15-nicanors-day-feast
  ('apocrypha', '2-maccabees', 15, 36, 'canon', 'esther', 9, 28, 'free', E'Esther 9:28 — *And that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed.* Nicanor''s Day is ordained ''the day before Mardocheus'' day'' — set beside the very feast of Purim whose perpetual keeping Esther 9:28 commands, in 2 Maccabees 15:36.'),
  ('apocrypha', '2-maccabees', 15, 36, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Maccabean habit of ordaining feasts of deliverance is the same covenant rhythm by which the rededication became the feast the Messiah kept, illuminating the decree of 2 Maccabees 15:36.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-sabbath-kept',
       E'The Sabbath kept though the sword be drawn',
       E'Nicanor schemes to fall on Judas on the day of rest, and the very Yahudim pressed into his ranks plead the holiness of the day: *Nevertheless the Yahudim (Jews) that were compelled to go with him said, O destroy not so cruelly and barbarously, but give honour to that day, which he, that seeth all things, has honoured with holiness above all other days* (2 Maccabees 15:2). When the tyrant sneers, *if there were a Mighty one in heaven, that had commanded the sabbath day to be kept* (2 Maccabees 15:3), they answer with the bare witness of Sinai: *There is in heaven a living Yahuah (God), and mighty, who commanded the seventh day to be kept* (2 Maccabees 15:4). This is no law-as-curse but the seal of the everlasting covenant — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant* (Exodus 31:16). It Ain''t New: the Torah-faithful confess the Sabbath before the kingdom of man, even on the field of battle.',
       sv.verse_id, ev.verse_id, 'extras', 62350
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-comfort-law-and-prophets',
       E'Comforted out of the law and the prophets',
       E'Judas does not arm his people first with iron but with the memory of the covenant: *And so comforting them out of the law and the prophets, and withal putting them in mind of the battles that they won afore, he made them more cheerful* (2 Maccabees 15:9). He bids them *not to fear the coming of the heathen against them, but to remember the help which in former times they had received from heaven* (2 Maccabees 15:8). This is the very posture Moses gave to Yashar''el: *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah (LORD) thy God is with thee* (Deuteronomy 20:1), and the word that steadies every covenant heart — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah (LORD) thy God, he it is that doth go with thee* (Deuteronomy 31:6). The Scriptures themselves are the armoury.',
       sv.verse_id, ev.verse_id, 'extras', 62353
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-jeremiah-intercedes',
       E'Onias and Jeremiah — the prophet who prayeth much for the people',
       E'Judas''s dream-vision shows the great cloud of witnesses interceding for the covenant people: Onias the former high priest, *holding up his hands prayed for the whole body of the Yahudim (Jews)* (2 Maccabees 15:12), and beside him *a man with gray hairs, and exceeding glorious* whom Onias names — *This is a lover of the brothers, who prayeth much for the people, and for the holy city, to wit, Jeremias the prophet of Yahuah (God)* (2 Maccabees 15:14). It Ain''t New that the prophets stand before Elohim on Yashar''el''s behalf: Jeremiah himself heard *Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people* (Jeremiah 15:1) — the same Jeremiah now pictured pleading for them. The angel of Yahuah cries the same plea in Zechariah''s night-vision — *O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah)* (Zechariah 1:12) — and in the heavenly temple *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). The intercession that armed Judas still rises before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 62356
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-golden-sword',
       E'The holy sword, a gift from Yahuah',
       E'Jeremiah arms Judas not with steel but with a heavenly weapon: *Whereupon Jeremias holding forth his right hand gave to Judas a sword of gold, and in giving it spoke thus* (2 Maccabees 15:15), *Take this holy sword, a gift from Yahuah (God), with the which you shall wound the adversaries* (2 Maccabees 15:16). The true sword the covenant people wield is the word of Elohim — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17), the word that is *quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12). And the One who comes to make war carries that very blade — *out of his mouth went a sharp twoedged sword* (Revelation 1:16). The golden sword from the prophet''s hand is the same living word by which the adversary''s system is undone.',
       sv.verse_id, ev.verse_id, 'extras', 62359
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-angel-and-deliverance',
       E'Send a good angel before us — the host of Sennacherib remembered',
       E'Lifting his hands toward heaven, Judas pleads the great deliverance of old: *O Yahuah (God), you did send your angel in the time of Ezekias king of Judea, and did slay in the host of Sennacherib an hundred fourscore and five thousand* (2 Maccabees 15:22), and so he prays, *send a good angel before us for a fear and dread to them* (2 Maccabees 15:23). It Ain''t New — the deliverance he remembers is written plain: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand* (2 Kings 19:35), the same word standing in the prophet — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand* (Isaiah 37:36). The victory comes not by arms but by the hand of heaven, as Judas confesses: *knowing that victory comes not by arms, but even as it seemeth good to him, he gives it to such as are worthy* (2 Maccabees 15:21).',
       sv.verse_id, ev.verse_id, 'extras', 62362
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-nicanors-day-feast',
       E'Nicanor''s Day kept as a feast — and here shall be an end',
       E'The deliverance is sealed into the calendar of the covenant people: *And they ordained all with a common decree in no case to let that day pass without solemnity, but to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus'' day* (2 Maccabees 15:36). It Ain''t New to fix a day of remembrance: of Purim it is written *that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews)* (Esther 9:28) — and Nicanor''s Day is set the eve before. So too the rededication the Maccabees won became the feast the Messiah Himself walked in — *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The author lays down his pen with the candour of a man, not a prophet: *And if I have done well, and as is fitting the story, it is that which I desired: but if slenderly and meanly, it is that which I could attain to* (2 Maccabees 15:38).',
       sv.verse_id, ev.verse_id, 'extras', 62365
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-15-sabbath-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 31:16 — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant.* The seventh-day rest the Yahudim confess before Nicanor is the perpetual sign of the covenant given at Sinai, not a yoke to be set aside under threat.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-sabbath-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The One who ''seeth all things'' has ''honoured with holiness above all other days'' the very day He hallowed at creation in 2 Maccabees 15:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-sabbath-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-comfort-law-and-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 20:1 — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah (LORD) thy God is with thee, which brought thee up out of the land of Egypt.* The Torah Judas reads to his men is the same word of war that bids Yashar''el not to fear the multitude in 2 Maccabees 15:9.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-comfort-law-and-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah (LORD) thy God, he it is that doth go with thee; he will not fail thee, nor forsake thee.* Judas exhorts his people ''not to fear the coming of the heathen'' on the strength of this same Mosaic charge in 2 Maccabees 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-comfort-law-and-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-jeremiah-intercedes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 15:1 — *Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people: cast them out of my sight, and let them go forth.* The very Jeremiah who knew the weight of standing before Elohim for the people is the grey-haired intercessor ''who prayeth much for the people, and for the holy city'' in 2 Maccabees 15:14.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-jeremiah-intercedes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 1:12 — *Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* Onias''s uplifted hands ''for the whole body of the Yahudim'' echo the heavenly intercession for Jerusalem in 2 Maccabees 15:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-jeremiah-intercedes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The prayers of Onias and Jeremiah for the holy city are the same saints'' prayers that rise before the throne in 2 Maccabees 15:14.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-jeremiah-intercedes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-golden-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God).* The ''holy sword, a gift from Yahuah'' that Jeremiah hands Judas is the covenant''s true weapon, the word of Elohim, in 2 Maccabees 15:16.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-golden-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blade with which Judas shall ''wound the adversaries'' is the living word that cuts sharper than any edge in 2 Maccabees 15:16.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-golden-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:16 — *And he had in his right hand seven stars: and out of his mouth went a sharp twoedged sword: and his countenance was as the sun shineth in his strength.* The golden sword from Jeremiah''s right hand foreshadows the twoedged sword from the mouth of the Glorified One in 2 Maccabees 15:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-golden-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-angel-and-deliverance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas pleads this exact deliverance — the angel slaying the hundred fourscore and five thousand of Sennacherib — as the pattern for his own day in 2 Maccabees 15:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-angel-and-deliverance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the very angelic blow Judas recalls against the host of Sennacherib in 2 Maccabees 15:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-angel-and-deliverance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-nicanors-day-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:28 — *And that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed.* Nicanor''s Day is ordained ''the day before Mardocheus'' day'' — set beside the very feast of Purim whose perpetual keeping Esther 9:28 commands, in 2 Maccabees 15:36.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-nicanors-day-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Maccabean habit of ordaining feasts of deliverance is the same covenant rhythm by which the rededication became the feast the Messiah kept, illuminating the decree of 2 Maccabees 15:36.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-nicanors-day-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 2 Maccabees cross-references complete.'
