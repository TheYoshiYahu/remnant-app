-- ----- fragment: minion_jubilees_49.sql (session251 jubilees 49) -----
-- Source anchor: jubilees/jubilees ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju49 (view _session251_ju49_lookup). Sort band base 54200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-49-passover-fourteenth-appointed-time
  ('jubilees', 'jubilees', 49, 1, 'canon', 'exodus', 12, 2, 'free', E'Exodus 12:2 — *This month shall be unto you the beginning of months: it shall be the first month of the year to you.* Jubilees'' "fourteenth of the first month" counts from the very head-of-months the LORD fixed in Egypt.'),
  ('jubilees', 'jubilees', 49, 1, 'canon', 'leviticus', 23, 5, 'free', E'Leviticus 23:5 — *In the fourteenth day of the first month at even is the LORD''S passover.* The same day and the same evening Jubilees commands, listed among the LORD''s appointed feasts.'),
  ('jubilees', 'jubilees', 49, 1, 'canon', 'deuteronomy', 16, 6, 'free', E'Deuteronomy 16:6 — *But at the place which Yahuah Elohayka (the LORD thy God) shall choose to place his name in, there thou shalt sacrifice the passover at even, at the going down of the sun, at the season that thou camest forth out of Egypt.* "From the time of the setting of the sun" in Jubilees is the Torah''s own "at the going down of the sun."'),
  -- thread: jubilees-49-blood-on-the-lintels-passover
  ('jubilees', 'jubilees', 49, 3, 'canon', 'exodus', 12, 13, 'free', E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* Jubilees'' "sign of the blood was on its lintels" is Exodus'' very token that turns the destroyer aside.'),
  ('jubilees', 'jubilees', 49, 2, 'canon', 'exodus', 12, 12, 'free', E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The "powers of Mastêmâ" loosed against the firstborn in Jubilees execute the LORD''s own night-judgment on Egypt.'),
  -- thread: jubilees-49-eternal-ordinance-heavenly-tablets
  ('jubilees', 'jubilees', 49, 8, 'canon', 'exodus', 12, 14, 'free', E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* Jubilees'' "eternal ordinance... ordained for ever" is the Torah''s own "feast by an ordinance for ever."'),
  ('jubilees', 'jubilees', 49, 9, 'canon', 'numbers', 9, 13, 'free', E'Numbers 9:13 — *But the man that is clean, and is not in a journey, and forbeareth to keep the passover, even the same soul shall be cut off from among his people: because he brought not the offering of Yahuah (LORD) in his appointed season, that man shall bear his sin.* Jubilees'' clean man cut off who "will take the guilt upon himself" is Numbers'' law word for word.'),
  -- thread: jubilees-49-not-a-bone-broken-passover-lamb
  ('jubilees', 'jubilees', 49, 13, 'canon', 'exodus', 12, 46, 'free', E'Exodus 12:46 — *In one house shall it be eaten; thou shalt not carry forth ought of the flesh abroad out of the house; neither shall ye break a bone thereof.* Jubilees'' "not break any bone thereof" is the Torah''s passover ordinance exactly.'),
  ('jubilees', 'jubilees', 49, 13, 'canon', 'numbers', 9, 12, 'free', E'Numbers 9:12 — *They shall leave none of it unto the morning, nor break any bone of it: according to all the ordinances of the passover they shall keep it.* The same unbroken-bone law Jubilees presses, repeated in the wilderness Passover.'),
  ('jubilees', 'jubilees', 49, 13, 'canon', 'john', 19, 36, 'free', E'John 19:36 — *For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken.* The Passover law Jubilees guards — no bone crushed — is fulfilled in the crucified Messiah, the true Lamb.'),
  ('jubilees', 'jubilees', 49, 14, 'canon', '1-corinthians', 5, 7, 'free', E'1 Corinthians 5:7 — *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us.* Paul names the Lamb Jubilees'' ordinance was always pointing to — Messiah our Passover.'),
  -- thread: jubilees-49-a-memorial-no-plague-passover-kept
  ('jubilees', 'jubilees', 49, 15, 'canon', 'exodus', 12, 21, 'free', E'Exodus 12:21 — *Then Moses called for all the elders of Yashar''el (Israel), and said unto them, Draw out and take you a lamb according to your families, and kill the passover.* Jubilees commands the same perpetual keeping Moses first ordered to the elders.'),
  ('jubilees', 'jubilees', 49, 16, 'canon', '1-corinthians', 5, 8, 'free', E'1 Corinthians 5:8 — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* Jubilees'' command to celebrate Passover "in its appointed season" is the apostle''s own "let us keep the feast."'),
  -- thread: jubilees-49-feast-of-unleavened-bread-haste-shur
  ('jubilees', 'jubilees', 49, 21, 'canon', 'exodus', 12, 15, 'free', E'Exodus 12:15 — *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* Jubilees'' "unleavened bread seven days" is the Torah''s seven-day feast joined to Passover.'),
  ('jubilees', 'jubilees', 49, 23, 'canon', 'deuteronomy', 16, 3, 'free', E'Deuteronomy 16:3 — *Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste.* Jubilees'' "celebrated this festival with haste when you went forth from Egypt" is Moses'' own reason for the unleavened bread.'),
  ('jubilees', 'jubilees', 49, 23, 'canon', 'exodus', 15, 22, 'free', E'Exodus 15:22 — *So Moses brought Yashar''el (Israel) from the Red sea, and they went out into the wilderness of Shur; and they went three days in the wilderness, and found no water.* The wilderness of Shur where Jubilees says they "completed it" is the very place Exodus names just past the sea.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-49-passover-fourteenth-appointed-time',
       E'The Passover in its season — the fourteenth at evening',
       E'Jubilees opens its closing law with the Passover fixed to its day: *Remember the commandment which Yahuah (God) commanded you concerning the passover, that you should celebrate it in its season on the fourteenth of the first month, that you should kill it before it is evening, and that they should eat it by night on the evening of the fifteenth from the time of the setting of the sun* (Jubilees 49:1). This is no late addition — it is the Torah''s own reckoning. Yahuah set the very month as the head of the year: *This month shall be unto you the beginning of months: it shall be the first month of the year to you* (Exodus 12:2), and named the day: *In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5). Moses spells out the same evening at sundown: *But at the place which Yahuah Elohayka (the LORD thy God) shall choose to place his name in, there thou shalt sacrifice the passover at even, at the going down of the sun, at the season that thou camest forth out of Egypt* (Deuteronomy 16:6). It ain''t new — Jubilees is binding Israel to the Appointed Time already engraved in the Law.',
       sv.verse_id, ev.verse_id, 'extras', 54200
  FROM _session251_ju49_lookup sv, _session251_ju49_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=49 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-49-blood-on-the-lintels-passover',
       E'The blood on the lintels — the destroyer passes by',
       E'Jubilees retells the first Passover night exactly as Exodus tells it: *For on this night–the beginning of the festival and the beginning of the joy–you were eating the passover in Egypt, when all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt* (Jubilees 49:2), and the saving sign: *And this is the sign which Yahuah (God) gave them: Into every house on the lintels of which they saw the blood of a lamb of the first year, into (that) house they should not enter to slay, but should pass by (it), that all those should be saved that were in the house because the sign of the blood was on its lintels* (Jubilees 49:3). Set Exodus beside it: *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt* (Exodus 12:13). Jubilees'' "powers of Mastêmâ" let loose to slay is the satan-figure executing the judgment the LORD threatened: *and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12) — the same Exodus/Mastema frame the apparatus carries through Jubilees 48. The blood of the lamb, not the worthiness of the house, is what turns the destroyer aside.',
       sv.verse_id, ev.verse_id, 'extras', 54203
  FROM _session251_ju49_lookup sv, _session251_ju49_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=49 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-49-eternal-ordinance-heavenly-tablets',
       E'An eternal ordinance engraven on the heavenly tablets',
       E'For Jubilees the Passover is no temporary rite but a statute written before the world unfolds: *For it is an eternal ordinance, and engraven on the heavenly tables regarding all the children of Yashar''el (Israel) that they should observe it every year on its day once a year, throughout all their generations; and there is no limit of days, for this is ordained for ever* (Jubilees 49:8). And the one who neglects it bears his own guilt — *that man who is clean and close at hand will be cut off; because he offered not the oblation of Yahuah (God) in its appointed season, he will take the guilt upon himself* (Jubilees 49:9). This is the heavenly-tablets framework reading straight out of the Torah''s own "for ever": *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). And the cutting-off Jubilees warns of is Numbers'' law verbatim: *But the man that is clean, and is not in a journey, and forbeareth to keep the passover, even the same soul shall be cut off from among his people: because he brought not the offering of Yahuah (LORD) in his appointed season, that man shall bear his sin* (Numbers 9:13). The feast is eternal — never abolished, never a curse.',
       sv.verse_id, ev.verse_id, 'extras', 54206
  FROM _session251_ju49_lookup sv, _session251_ju49_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=49 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-49-not-a-bone-broken-passover-lamb',
       E'Not a bone broken — the Passover-Lamb is Messiah',
       E'Here is the highest weave of the chapter. Jubilees commands the lamb roasted whole and uncrushed: *they shall eat it with diligence, its head with the inwards thereof and its feet they shall roast with fire, and not break any bone thereof; for of the children of Yashar''el (Israel) no bone shall be crushed* (Jubilees 49:13), and presses it as the reason the feast is fixed: *For this reason Yahuah (God) commanded the children of Yashar''el (Israel) to observe the passover on the day of its fixed time, and they shall not break a bone thereof* (Jubilees 49:14). This is the Torah''s ordinance — *In one house shall it be eaten; thou shalt not carry forth ought of the flesh abroad out of the house; neither shall ye break a bone thereof* (Exodus 12:46) — and *They shall leave none of it unto the morning, nor break any bone of it: according to all the ordinances of the passover they shall keep it* (Numbers 9:12). And the New Testament shows what the unbroken bone was always pointing to: at the cross the soldiers *brake not his legs* (John 19:33), and John names the law fulfilled — *For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken* (John 19:36). Paul seals it: *For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The lamb without a broken bone was Messiah from the start. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54209
  FROM _session251_ju49_lookup sv, _session251_ju49_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=49 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-49-a-memorial-no-plague-passover-kept',
       E'A memorial well-pleasing — keep it and no plague comes',
       E'Jubilees presses the perpetual keeping as a memorial that shields Israel: *And do you command the children of Yashar''el (Israel) to observe the passover throughout their days, every year, once a year on the day of its fixed time, and it will come for a memorial well pleasing before Yahuah (God), and no plague will come upon them to slay or to smite in that year in which they celebrate the passover in its season in every respect according to His command* (Jubilees 49:15). This is the memorial the LORD himself named in Egypt: *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations* (Exodus 12:14), and the very ordinance restated to the elders: *Then Moses called for all the elders of Yashar''el (Israel), and said unto them, Draw out and take you a lamb according to your families, and kill the passover* (Exodus 12:21). The leaven that must be purged for the feast Jubilees calls "unleavened bread seven days" — Paul gives its meaning: *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Keep the feast — Torah and apostle agree.',
       sv.verse_id, ev.verse_id, 'extras', 54212
  FROM _session251_ju49_lookup sv, _session251_ju49_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=49 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-49-feast-of-unleavened-bread-haste-shur',
       E'Seven days unleavened — kept in haste to the wilderness of Shur',
       E'Jubilees binds Passover to the seven-day feast that follows and to the haste of the Exodus march: *the festival of unleavened bread, that they should eat unleavened bread seven days, (and) that they should observe its festival* (Jubilees 49:21), closing the chapter with the memory of the flight itself: *For you celebrated this festival with haste when you went forth from Egypt till you entered into the wilderness of Shur; for on the shore of the sea you completed it* (Jubilees 49:23). The Torah set the seven days: *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses* (Exodus 12:15), and named the haste as the reason: *Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste* (Deuteronomy 16:3). And the very wilderness Jubilees names is in Exodus: *So Moses brought Yashar''el (Israel) from the Red sea, and they went out into the wilderness of Shur* (Exodus 15:22). Jubilees walks the same road Exodus walked — and the book of feasts closes where the Law began.',
       sv.verse_id, ev.verse_id, 'extras', 54215
  FROM _session251_ju49_lookup sv, _session251_ju49_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=21
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=49 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-49-passover-fourteenth-appointed-time
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:2 — *This month shall be unto you the beginning of months: it shall be the first month of the year to you.* Jubilees'' "fourteenth of the first month" counts from the very head-of-months the LORD fixed in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-passover-fourteenth-appointed-time'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:5 — *In the fourteenth day of the first month at even is the LORD''S passover.* The same day and the same evening Jubilees commands, listed among the LORD''s appointed feasts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-passover-fourteenth-appointed-time'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 16:6 — *But at the place which Yahuah Elohayka (the LORD thy God) shall choose to place his name in, there thou shalt sacrifice the passover at even, at the going down of the sun, at the season that thou camest forth out of Egypt.* "From the time of the setting of the sun" in Jubilees is the Torah''s own "at the going down of the sun."'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-passover-fourteenth-appointed-time'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-49-blood-on-the-lintels-passover
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* Jubilees'' "sign of the blood was on its lintels" is Exodus'' very token that turns the destroyer aside.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-blood-on-the-lintels-passover'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The "powers of Mastêmâ" loosed against the firstborn in Jubilees execute the LORD''s own night-judgment on Egypt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-blood-on-the-lintels-passover'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-49-eternal-ordinance-heavenly-tablets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* Jubilees'' "eternal ordinance... ordained for ever" is the Torah''s own "feast by an ordinance for ever."'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-eternal-ordinance-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 9:13 — *But the man that is clean, and is not in a journey, and forbeareth to keep the passover, even the same soul shall be cut off from among his people: because he brought not the offering of Yahuah (LORD) in his appointed season, that man shall bear his sin.* Jubilees'' clean man cut off who "will take the guilt upon himself" is Numbers'' law word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-eternal-ordinance-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-49-not-a-bone-broken-passover-lamb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:46 — *In one house shall it be eaten; thou shalt not carry forth ought of the flesh abroad out of the house; neither shall ye break a bone thereof.* Jubilees'' "not break any bone thereof" is the Torah''s passover ordinance exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-not-a-bone-broken-passover-lamb'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 9:12 — *They shall leave none of it unto the morning, nor break any bone of it: according to all the ordinances of the passover they shall keep it.* The same unbroken-bone law Jubilees presses, repeated in the wilderness Passover.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-not-a-bone-broken-passover-lamb'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 19:36 — *For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken.* The Passover law Jubilees guards — no bone crushed — is fulfilled in the crucified Messiah, the true Lamb.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-not-a-bone-broken-passover-lamb'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 5:7 — *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us.* Paul names the Lamb Jubilees'' ordinance was always pointing to — Messiah our Passover.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-not-a-bone-broken-passover-lamb'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-49-a-memorial-no-plague-passover-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:21 — *Then Moses called for all the elders of Yashar''el (Israel), and said unto them, Draw out and take you a lamb according to your families, and kill the passover.* Jubilees commands the same perpetual keeping Moses first ordered to the elders.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-a-memorial-no-plague-passover-kept'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 5:8 — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* Jubilees'' command to celebrate Passover "in its appointed season" is the apostle''s own "let us keep the feast."'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-a-memorial-no-plague-passover-kept'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-49-feast-of-unleavened-bread-haste-shur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:15 — *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* Jubilees'' "unleavened bread seven days" is the Torah''s seven-day feast joined to Passover.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-feast-of-unleavened-bread-haste-shur'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 16:3 — *Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste.* Jubilees'' "celebrated this festival with haste when you went forth from Egypt" is Moses'' own reason for the unleavened bread.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-feast-of-unleavened-bread-haste-shur'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 15:22 — *So Moses brought Yashar''el (Israel) from the Red sea, and they went out into the wilderness of Shur; and they went three days in the wilderness, and found no water.* The wilderness of Shur where Jubilees says they "completed it" is the very place Exodus names just past the sea.'
  FROM cross_reference_threads t, cross_references x, _session251_ju49_lookup sv, _session251_ju49_lookup tv
 WHERE t.slug='jubilees-49-feast-of-unleavened-bread-haste-shur'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=49 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

