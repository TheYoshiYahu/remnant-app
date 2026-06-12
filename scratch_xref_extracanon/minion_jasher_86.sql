-- ----- fragment: minion_jasher_86.sql (session252 jasher 86) -----
-- Source anchor: jasher/jasher ch86. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja86 (view _session252_ja86_lookup). Sort band base 57125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja86_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-86-census-after-the-plague
  ('jasher', 'jasher', 86, 1, 'canon', 'numbers', 26, 1, 'free', E'Numbers 26:1 — *And it came to pass after the plague, that Yahuah (LORD) spake unto Moses and unto Eleazar the son of Aaron the priest, saying* — the canon sets the same census command after the plague to Moses and Eleazar, exactly as Jasher 86:1.'),
  ('jasher', 'jasher', 86, 2, 'canon', 'numbers', 26, 64, 'free', E'Numbers 26:64 — *But among these there was not a man of them whom Moses and Aaron the priest numbered, when they numbered the children of Yashar''el (Israel) in the wilderness of Sinai* — the canon''s framing of the new generation numbered from twenty years old, as Jasher 86:2.'),
  ('jasher', 'jasher', 86, 3, 'canon', 'numbers', 26, 51, 'free', E'Numbers 26:51 — *These were the numbered of the children of Yashar''el (Israel), six hundred thousand and a thousand seven hundred and thirty* — the canon''s mustered total of the covenant seed, the count Jasher 86:3 carries (seven hundred and thirty).'),
  -- thread: jasher-86-levi-numbered-from-a-month-old
  ('jasher', 'jasher', 86, 4, 'canon', 'numbers', 26, 62, 'free', E'Numbers 26:62 — *And those that were numbered of them were twenty and three thousand, all males from a month old and upward: for they were not numbered among the children of Yashar''el (Israel), because there was no inheritance given them among the children of Yashar''el (Israel)* — the canon''s identical Levite count from a month old, as Jasher 86:4.'),
  ('jasher', 'jasher', 86, 4, 'canon', 'numbers', 26, 64, 'free', E'Numbers 26:64 — *But among these there was not a man of them whom Moses and Aaron the priest numbered, when they numbered the children of Yashar''el (Israel) in the wilderness of Sinai* — the canon''s note that none of the Sinai-numbered remained, echoed in Jasher 86:4.'),
  -- thread: jasher-86-wilderness-generation-fallen
  ('jasher', 'jasher', 86, 5, 'canon', 'numbers', 26, 65, 'free', E'Numbers 26:65 — *For Yahuah (LORD) had said of them, They shall surely die in the wilderness. And there was not left a man of them, save Caleb the son of Jephunneh, and Joshua the son of Nun* — the canon''s census names the identical survivors and verdict of Jasher 86:5.'),
  ('jasher', 'jasher', 86, 5, 'canon', 'numbers', 14, 29, 'free', E'Numbers 14:29 — *Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me* — the oath that they would die in the wilderness, the sentence Jasher 86:5 reports fulfilled.'),
  ('jasher', 'jasher', 86, 5, 'canon', 'numbers', 14, 30, 'free', E'Numbers 14:30 — *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein, save Caleb the son of Jephunneh, and Joshua the son of Nun* — the canon''s reservation of the two faithful, exactly the exception of Jasher 86:5.'),
  -- thread: jasher-86-war-against-midian
  ('jasher', 'jasher', 86, 6, 'canon', 'numbers', 31, 2, 'free', E'Numbers 31:2 — *Avenge the children of Yashar''el (Israel) of the Midianites: afterward shalt thou be gathered unto thy people* — the canon''s command to avenge Midian, the word Yahuah gives Moses in Jasher 86:6.'),
  ('jasher', 'jasher', 86, 7, 'canon', 'numbers', 31, 5, 'free', E'Numbers 31:5 — *So there were delivered out of the thousands of Yashar''el (Israel), a thousand of every tribe, twelve thousand armed for war* — the canon''s muster of a thousand per tribe, the twelve thousand Jasher 86:7 sends to Midian.'),
  ('jasher', 'jasher', 86, 8, 'canon', 'numbers', 31, 8, 'free', E'Numbers 31:8 — *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword* — the canon names the five princes and Balaam''s death by the sword, exactly as Jasher 86:8.'),
  ('jasher', 'jasher', 86, 8, 'canon', 'joshua', 13, 22, 'free', E'Joshua 13:22 — *Balaam also the son of Beor, the soothsayer, did the children of Yashar''el (Israel) slay with the sword among them that were slain by them* — the conquest record keeps the same memorial of Balaam''s fall reported in Jasher 86:8.'),
  -- thread: jasher-86-the-way-of-balaam
  ('jasher', 'jasher', 86, 8, 'canon', 'numbers', 25, 3, 'free', E'Numbers 25:3 — *And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* — the snare at Peor that Balaam''s counsel set, the sin avenged in the Midian war Jasher 86:8 reports.'),
  ('jasher', 'jasher', 86, 8, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* — the apostle reads Balaam, slain in Jasher 86:8, as the type of the teacher who sells truth for reward.'),
  ('jasher', 'jasher', 86, 8, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* — Jude binds Balaam''s error and ruin, the end Jasher 86:8 records by the sword.'),
  ('jasher', 'jasher', 86, 8, 'canon', 'revelation', 2, 14, 'free', E'Revelation 2:14 — *But I have a few things against thee, because thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* — the risen Messiah names the very counsel of the Balaam slain in Jasher 86:8.'),
  -- thread: jasher-86-spoil-of-midian-plains-of-moab
  ('jasher', 'jasher', 86, 9, 'canon', 'numbers', 31, 9, 'free', E'Numbers 31:9 — *And the children of Yashar''el (Israel) took all the women of Midian captives, and their little ones, and took the spoil of all their cattle, and all their flocks, and all their goods* — the canon''s identical list of captives and spoil taken in Jasher 86:9.'),
  ('jasher', 'jasher', 86, 10, 'canon', 'numbers', 31, 12, 'free', E'Numbers 31:12 — *And they brought the captives, and the prey, and the spoil, unto Moses, and Eleazar the priest, and unto the congregation of the children of Yashar''el (Israel), unto the camp at the plains of Moab, which are by Jordan near Jericho* — the canon brings the spoil to Moses and Eleazar at the plains of Moab, exactly as Jasher 86:10.'),
  ('jasher', 'jasher', 86, 10, 'canon', 'numbers', 26, 63, 'free', E'Numbers 26:63 — *These are they that were numbered by Moses and Eleazar the priest, who numbered the children of Yashar''el (Israel) in the plains of Moab by Jordan near Jericho* — the same plains of Moab where Jasher 86:10 brings the spoil, the staging-ground of the second census.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja86_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja86_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-86-census-after-the-plague',
       E'The Second Census — numbered after the plague',
       E'Jasher opens its retelling of the second wilderness census: *At that time after the pestilence, Yahuah (the Lord) said to Moses, and to Elazer the son of Aaron the priest, saying, Number the heads of the whole community of the children of Israel, from twenty years old and upward, all that went forth in the army* (Jasher 86:1-2). It ain''t new — this is the very command of Numbers 26, set in the same hour after the plague: *And it came to pass after the plague, that Yahuah (LORD) spake unto Moses and unto Eleazar the son of Aaron the priest, saying* (Numbers 26:1). Jasher''s tally — *the number of all Israel was seven hundred thousand, seven hundred and thirty* (Jasher 86:3) — carries the canon''s own count of the covenant seed mustered on the plains of Moab: *These were the numbered of the children of Yashar''el (Israel), six hundred thousand and a thousand seven hundred and thirty* (Numbers 26:51). The twelve-tribe nation is counted and kept, ready to inherit.',
       sv.verse_id, ev.verse_id, 'extras', 57125
  FROM _session252_ja86_lookup sv, _session252_ja86_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=86 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-86-levi-numbered-from-a-month-old',
       E'The Levites numbered from a month old',
       E'Jasher separately tallies the priestly tribe: *And the number of the children of Levi, from one month old and upward, was twenty-three thousand, and amongst these there was not a man of those numbered by Moses and Aaron in the wilderness of Sinai* (Jasher 86:4). The canon numbers Levi by the same rule and the same sum: *And those that were numbered of them were twenty and three thousand, all males from a month old and upward: for they were not numbered among the children of Yashar''el (Israel), because there was no inheritance given them among the children of Yashar''el (Israel)* (Numbers 26:62). And the canon, like Jasher, marks that none of the first-numbered remained: *But among these there was not a man of them whom Moses and Aaron the priest numbered, when they numbered the children of Yashar''el (Israel) in the wilderness of Sinai* (Numbers 26:64). The tribe set apart for the Name is kept and counted by its own ordinance.',
       sv.verse_id, ev.verse_id, 'extras', 57128
  FROM _session252_ja86_lookup sv, _session252_ja86_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=86 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-86-wilderness-generation-fallen',
       E'The wilderness generation fallen — only Caleb and Joshua left',
       E'Jasher states the judgment that emptied the first census: *For Yahuah (the Lord) had told them that they would die in the wilderness, so they all died, and not one had been left of them excepting Caleb the son of Jephuneh, and Joshua the son of Nun* (Jasher 86:5). It ain''t new — this is the very sentence of Numbers, the oath that fell on the murmurers: *Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me* (Numbers 14:29), *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein, save Caleb the son of Jephunneh, and Joshua the son of Nun* (Numbers 14:30). And the canon''s census names the same two survivors with the same words: *For Yahuah (LORD) had said of them, They shall surely die in the wilderness. And there was not left a man of them, save Caleb the son of Jephunneh, and Joshua the son of Nun* (Numbers 26:65). Election keeps the faithful seed; the two who believed the promise live to inherit it.',
       sv.verse_id, ev.verse_id, 'extras', 57131
  FROM _session252_ja86_lookup sv, _session252_ja86_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=86 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-86-war-against-midian',
       E'The war against Midian — twelve thousand, Balaam slain',
       E'Jasher narrates the avenging of Midian: *And it was after this that Yahuah (the Lord) said to Moses, Say to the children of Israel to avenge upon Midian the cause of their brethren the children of Israel* (Jasher 86:6), and *the children of Israel chose from amongst them twelve thousand men, being one thousand to a tribe, and they went to Midian* (Jasher 86:7). It ain''t new — the canon gives the same command and the same muster: *Avenge the children of Yashar''el (Israel) of the Midianites: afterward shalt thou be gathered unto thy people* (Numbers 31:2), and *there were delivered out of the thousands of Yashar''el (Israel), a thousand of every tribe, twelve thousand armed for war* (Numbers 31:5). Jasher then reports the slaughter — *they slew every male, also the five princes of Midian, and Balaam the son of Beor did they slay with the sword* (Jasher 86:8) — which the canon records in the same terms: *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword* (Numbers 31:8). The book of Joshua keeps the same memorial: *Balaam also the son of Beor, the soothsayer, did the children of Yashar''el (Israel) slay with the sword among them that were slain by them* (Joshua 13:22). The diviner who sold his counsel falls with the kingdom that hired him.',
       sv.verse_id, ev.verse_id, 'extras', 57134
  FROM _session252_ja86_lookup sv, _session252_ja86_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=86 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-86-the-way-of-balaam',
       E'The way of Balaam — the diviner who taught the stumbling-block',
       E'When Jasher records that *Balaam the son of Beor did they slay with the sword* (Jasher 86:8), it closes the account of the man the canon names as the one who taught Midian and Moab to seduce Israel into Baal-peor: *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1), *And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* (Numbers 25:3). The apostles read his end as the type of every false teacher who sells the truth for reward: *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15); *Woe unto them! ... ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 1:11); and the risen Messiah names his very doctrine: *thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). It ain''t new — the seed-war runs through Balaam; the diviner who would corrupt the covenant people perishes with the kingdom that hired him.',
       sv.verse_id, ev.verse_id, 'extras', 57137
  FROM _session252_ja86_lookup sv, _session252_ja86_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=86 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-86-spoil-of-midian-plains-of-moab',
       E'The spoil of Midian brought to the plains of Moab',
       E'Jasher closes the campaign with the spoil and the captives: *And the children of Israel took the wives of Midian captive, with their little ones and their cattle, and all belonging to them* (Jasher 86:9), *And they took all the spoil and all the prey, and they brought it to Moses and to Elazer to the plains of Moab* (Jasher 86:10). It ain''t new — the canon records the same captives, prey, and destination: *And the children of Yashar''el (Israel) took all the women of Midian captives, and their little ones, and took the spoil of all their cattle, and all their flocks, and all their goods* (Numbers 31:9), and *they brought the captives, and the prey, and the spoil, unto Moses, and Eleazar the priest, and unto the congregation of the children of Yashar''el (Israel), unto the camp at the plains of Moab, which are by Jordan near Jericho* (Numbers 31:12). The whole muster gathers at the plains of Moab — the very staging-ground from which the second census numbered the seed: *These are they that were numbered by Moses and Eleazar the priest, who numbered the children of Yashar''el (Israel) in the plains of Moab by Jordan near Jericho* (Numbers 26:63). The people stand revenged and assembled at the threshold of the land.',
       sv.verse_id, ev.verse_id, 'extras', 57140
  FROM _session252_ja86_lookup sv, _session252_ja86_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=86 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-86-census-after-the-plague
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 26:1 — *And it came to pass after the plague, that Yahuah (LORD) spake unto Moses and unto Eleazar the son of Aaron the priest, saying* — the canon sets the same census command after the plague to Moses and Eleazar, exactly as Jasher 86:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-census-after-the-plague'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 26:64 — *But among these there was not a man of them whom Moses and Aaron the priest numbered, when they numbered the children of Yashar''el (Israel) in the wilderness of Sinai* — the canon''s framing of the new generation numbered from twenty years old, as Jasher 86:2.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-census-after-the-plague'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 26:51 — *These were the numbered of the children of Yashar''el (Israel), six hundred thousand and a thousand seven hundred and thirty* — the canon''s mustered total of the covenant seed, the count Jasher 86:3 carries (seven hundred and thirty).'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-census-after-the-plague'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-86-levi-numbered-from-a-month-old
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 26:62 — *And those that were numbered of them were twenty and three thousand, all males from a month old and upward: for they were not numbered among the children of Yashar''el (Israel), because there was no inheritance given them among the children of Yashar''el (Israel)* — the canon''s identical Levite count from a month old, as Jasher 86:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-levi-numbered-from-a-month-old'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=62
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 26:64 — *But among these there was not a man of them whom Moses and Aaron the priest numbered, when they numbered the children of Yashar''el (Israel) in the wilderness of Sinai* — the canon''s note that none of the Sinai-numbered remained, echoed in Jasher 86:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-levi-numbered-from-a-month-old'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-86-wilderness-generation-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 26:65 — *For Yahuah (LORD) had said of them, They shall surely die in the wilderness. And there was not left a man of them, save Caleb the son of Jephunneh, and Joshua the son of Nun* — the canon''s census names the identical survivors and verdict of Jasher 86:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-wilderness-generation-fallen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=65
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 14:29 — *Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me* — the oath that they would die in the wilderness, the sentence Jasher 86:5 reports fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-wilderness-generation-fallen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 14:30 — *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein, save Caleb the son of Jephunneh, and Joshua the son of Nun* — the canon''s reservation of the two faithful, exactly the exception of Jasher 86:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-wilderness-generation-fallen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-86-war-against-midian
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 31:2 — *Avenge the children of Yashar''el (Israel) of the Midianites: afterward shalt thou be gathered unto thy people* — the canon''s command to avenge Midian, the word Yahuah gives Moses in Jasher 86:6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-war-against-midian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 31:5 — *So there were delivered out of the thousands of Yashar''el (Israel), a thousand of every tribe, twelve thousand armed for war* — the canon''s muster of a thousand per tribe, the twelve thousand Jasher 86:7 sends to Midian.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-war-against-midian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 31:8 — *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword* — the canon names the five princes and Balaam''s death by the sword, exactly as Jasher 86:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-war-against-midian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 13:22 — *Balaam also the son of Beor, the soothsayer, did the children of Yashar''el (Israel) slay with the sword among them that were slain by them* — the conquest record keeps the same memorial of Balaam''s fall reported in Jasher 86:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-war-against-midian'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=13 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-86-the-way-of-balaam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:3 — *And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* — the snare at Peor that Balaam''s counsel set, the sin avenged in the Midian war Jasher 86:8 reports.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-the-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* — the apostle reads Balaam, slain in Jasher 86:8, as the type of the teacher who sells truth for reward.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-the-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* — Jude binds Balaam''s error and ruin, the end Jasher 86:8 records by the sword.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-the-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:14 — *But I have a few things against thee, because thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* — the risen Messiah names the very counsel of the Balaam slain in Jasher 86:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-the-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-86-spoil-of-midian-plains-of-moab
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 31:9 — *And the children of Yashar''el (Israel) took all the women of Midian captives, and their little ones, and took the spoil of all their cattle, and all their flocks, and all their goods* — the canon''s identical list of captives and spoil taken in Jasher 86:9.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-spoil-of-midian-plains-of-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 31:12 — *And they brought the captives, and the prey, and the spoil, unto Moses, and Eleazar the priest, and unto the congregation of the children of Yashar''el (Israel), unto the camp at the plains of Moab, which are by Jordan near Jericho* — the canon brings the spoil to Moses and Eleazar at the plains of Moab, exactly as Jasher 86:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-spoil-of-midian-plains-of-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 26:63 — *These are they that were numbered by Moses and Eleazar the priest, who numbered the children of Yashar''el (Israel) in the plains of Moab by Jordan near Jericho* — the same plains of Moab where Jasher 86:10 brings the spoil, the staging-ground of the second census.'
  FROM cross_reference_threads t, cross_references x, _session252_ja86_lookup sv, _session252_ja86_lookup tv
 WHERE t.slug='jasher-86-spoil-of-midian-plains-of-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=86 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

