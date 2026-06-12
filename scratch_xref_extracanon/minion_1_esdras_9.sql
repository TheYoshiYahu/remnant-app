-- ----- fragment: minion_1esdras_09.sql (session253 1-esdras 9) -----
-- Source anchor: apocrypha/1-esdras ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd9 (view _session253_1esd9_lookup). Sort band base 62700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-9-strange-wives-ezra-ten
  ('apocrypha', '1-esdras', 9, 5, 'canon', 'ezra', 10, 9, 'free', E'Ezra 10:9 — *Then all the men of Yahudah (Judah) and Benjamin gathered themselves together unto Jerusalem within three days. It was the ninth month, on the twentieth day of the month; and all the people sat in the street of the house of Elohim (God), trembling because of this matter, and for the great rain.* The very tribes, the very twentieth day of the ninth month, the very rain of 1 Esdras 9:5 stand recorded in the canon.'),
  ('apocrypha', '1-esdras', 9, 4, 'canon', 'ezra', 10, 8, 'free', E'Ezra 10:8 — *And that whosoever would not come within three days, according to the counsel of the princes and the elders, all his substance should be forfeited, and himself separated from the congregation of those that had been carried away.* The forfeit of goods and casting-out for any who failed to gather is the same decree Esdras proclaims in 1 Esdras 9:4.'),
  -- thread: 1-esdras-9-confess-and-separate
  ('apocrypha', '1-esdras', 9, 8, 'canon', 'ezra', 10, 11, 'free', E'Ezra 10:11 — *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives.* Esdras'' threefold charge to confess, do His will, and separate in 1 Esdras 9:8-9 is Ezra''s charge verbatim in covenant force.'),
  ('apocrypha', '1-esdras', 9, 9, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The separation from strange women Esdras commands in 1 Esdras 9:9 is obedience to the marriage boundary Moses set in the Torah.'),
  ('apocrypha', '1-esdras', 9, 9, 'canon', '2-corinthians', 6, 17, 'free', E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The same set-apart calling Esdras presses in 1 Esdras 9:9 sounds again to the renewed assembly — come out and be separate.'),
  -- thread: 1-esdras-9-mourning-iniquity
  ('apocrypha', '1-esdras', 9, 2, 'canon', 'ezra', 10, 6, 'free', E'Ezra 10:6 — *Then Ezra rose up from before the house of Elohim (God), and went into the chamber of Johanan the son of Eliashib: and when he came thither, he did eat no bread, nor drink water: for he mourned because of the transgression of them that had been carried away.* The chamber of Johanan, the fast from bread and water, the mourning over the captivity''s sin in 1 Esdras 9:1-2 are recorded the same in the canon.'),
  ('apocrypha', '1-esdras', 9, 2, 'canon', 'ezra', 9, 4, 'free', E'Ezra 9:4 — *Then were assembled unto me every one that trembled at the words of the Elohim (God) of Yashar''el (Israel), because of the transgression of those that had been carried away; and I sat astonied until the evening sacrifice.* Esdras'' mourning over the great iniquities in 1 Esdras 9:2 gathers, as Ezra''s did, all who tremble at the word of Elohim.'),
  -- thread: 1-esdras-9-reading-the-law
  ('apocrypha', '1-esdras', 9, 41, 'canon', 'nehemiah', 8, 3, 'free', E'Nehemiah 8:3 — *And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law.* The reading from morning to midday before men and women, the multitude giving heed, in 1 Esdras 9:41 is Nehemiah''s broad-place reading exactly.'),
  ('apocrypha', '1-esdras', 9, 38, 'canon', 'nehemiah', 8, 1, 'free', E'Nehemiah 8:1 — *And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel).* The whole multitude gathering with one accord and calling for the Law in 1 Esdras 9:38-39 is the same assembly at the water gate.'),
  ('apocrypha', '1-esdras', 9, 40, 'canon', 'deuteronomy', 31, 12, 'free', E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law:* Esdras reading the Law to the whole multitude from man to woman in 1 Esdras 9:40 fulfills Moses'' command to gather all Israel to hear the law read aloud.'),
  ('apocrypha', '1-esdras', 9, 48, 'canon', 'luke', 24, 45, 'free', E'Luke 24:45 — *Then opened he their understanding, that they might understand the scriptures,* The Levites making the people understand the law in 1 Esdras 9:48 foreshadow the risen Messiah opening the understanding of His own to the Scriptures.'),
  -- thread: 1-esdras-9-joy-is-your-strength
  ('apocrypha', '1-esdras', 9, 52, 'canon', 'nehemiah', 8, 10, 'free', E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* Esdras'' charge to eat the fat, drink the sweet, send portions, and be not sorrowful in 1 Esdras 9:51-52 is Nehemiah''s word — and its ground is that the joy of Yahuah is the people''s strength.'),
  ('apocrypha', '1-esdras', 9, 50, 'canon', 'nehemiah', 8, 9, 'free', E'Nehemiah 8:9 — *And Nehemiah, which is the Tirshatha, and Ezra the priest the scribe, and the Levites that taught the people, said unto all the people, This day is holy unto Yahuah Elohaychem (the LORD your God); mourn not, nor weep. For all the people wept, when they heard the words of the law.* The holy day, the weeping at the hearing of the law, and the call to mourn not in 1 Esdras 9:50 are the same scene Nehemiah records.'),
  ('apocrypha', '1-esdras', 9, 55, 'canon', 'nehemiah', 8, 12, 'free', E'Nehemiah 8:12 — *And all the people went their way to eat, and to drink, and to send portions, and to make great mirth, because they had understood the words that were declared unto them.* The multitude going to feast because they understood the words in which they were instructed in 1 Esdras 9:55 closes the scene exactly as Nehemiah does — understanding turned to gladness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-strange-wives-ezra-ten',
       E'The congregation in the rain — Ezra''s own record',
       E'Esdras'' account of the gathered remnant is Ezra 10 told over again, word for word in substance: *And in three days were all they of the tribe of Yahudah (Judah) and Benjamin gathered together at Jerusalem the twentieth day of the ninth month. And all the multitude sat trembling in the broad court of the temple because of the present foul weather* (1 Esdras 9:5-6). The Hebrew canon records the same hour: *Then all the men of Yahudah (Judah) and Benjamin gathered themselves together unto Jerusalem within three days. It was the ninth month, on the twentieth day of the month; and all the people sat in the street of the house of Elohim (God), trembling because of this matter, and for the great rain* (Ezra 10:9). It ain''t new — 1 Esdras is the same testimony, the same returned remnant trembling in the rain before the rebuilt house.',
       sv.verse_id, ev.verse_id, 'extras', 62700
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-confess-and-separate',
       E'Confess, do His will, and be separate from the strange women',
       E'Esdras stands and charges the people: *And now by confessing give glory to Yahuah (God) of our fathers, And do his will, and separate yourselves from the heathen of the land, and from the strange women* (1 Esdras 9:8-9). This is Ezra''s own commandment: *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives* (Ezra 10:11). The Torah had set the boundary from the beginning — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3), *For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). The same call carries into the renewed covenant — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). One unbroken summons to a set-apart seed.',
       sv.verse_id, ev.verse_id, 'extras', 62703
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-mourning-iniquity',
       E'Esdras fasting and mourning for the iniquity of the multitude',
       E'Before the assembly, Esdras goes apart and grieves: *And remained there, and did eat no meat nor drink water, mourning for the great iniquities of the multitude* (1 Esdras 9:2). Ezra records the identical fast: *Then Ezra rose up from before the house of Elohim (God), and went into the chamber of Johanan the son of Eliashib: and when he came thither, he did eat no bread, nor drink water: for he mourned because of the transgression of them that had been carried away* (Ezra 10:6). The mourning gathers others who fear the word — *Then were assembled unto me every one that trembled at the words of the Elohim (God) of Yashar''el (Israel), because of the transgression of those that had been carried away* (Ezra 9:4). The priest''s grief over the people''s sin is the burden of every true intercessor.',
       sv.verse_id, ev.verse_id, 'extras', 62706
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-reading-the-law',
       E'★ Esdras reads the Law on the broad place — Nehemiah 8',
       E'The great scene: the whole multitude gathers and Esdras the priest and reader brings out the Law. *And the whole multitude came together with one accord into the broad place of the holy porch toward the east... And he read in the broad court before the holy porch from morning to midday, before both men and women; and the multitude gave heed to the law* (1 Esdras 9:38, 41). This is Nehemiah 8 told again: *And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1); *And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3). Moses himself had appointed this public reading: *thou shalt read this law before all Yashar''el (Israel) in their hearing. Gather the people together, men, and women, and children... that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God)* (Deuteronomy 31:11-12). And the Levites who *taught the law of Yahuah (God), making them withal to understand it* (1 Esdras 9:48) prefigure the One who *opened... their understanding, that they might understand the scriptures* (Luke 24:45). The Law read aloud to all the people, the seed brought back to the Word — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62709
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-joy-is-your-strength',
       E'★ This day is holy — mourn not, the joy of Yahuah is your strength',
       E'When the people weep at the hearing of the Law, they are turned from sorrow to feast: *This day is holy to Yahuah (God); (for they all wept when they heard the law:) Go then, and eat the fat, and drink the sweet, and send part to them that have nothing; For this day is holy to Yahuah (God): and be not sorrowful; for Yahuah (God) will bring you to honour* (1 Esdras 9:50-52). This is the very word of Nehemiah 8: *This day is holy unto Yahuah Elohaychem (the LORD your God); mourn not, nor weep. For all the people wept, when they heard the words of the law* (Nehemiah 8:9); *Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10). And the people went, *because they understood the words in which they were instructed* (1 Esdras 9:55) — as Nehemiah records, *because they had understood the words that were declared unto them* (Nehemiah 8:12). The Word brings conviction and then joy; the holy day is kept with feasting and portions for the poor. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62712
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=50
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=55
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-9-strange-wives-ezra-ten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:9 — *Then all the men of Yahudah (Judah) and Benjamin gathered themselves together unto Jerusalem within three days. It was the ninth month, on the twentieth day of the month; and all the people sat in the street of the house of Elohim (God), trembling because of this matter, and for the great rain.* The very tribes, the very twentieth day of the ninth month, the very rain of 1 Esdras 9:5 stand recorded in the canon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-strange-wives-ezra-ten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 10:8 — *And that whosoever would not come within three days, according to the counsel of the princes and the elders, all his substance should be forfeited, and himself separated from the congregation of those that had been carried away.* The forfeit of goods and casting-out for any who failed to gather is the same decree Esdras proclaims in 1 Esdras 9:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-strange-wives-ezra-ten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-confess-and-separate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:11 — *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives.* Esdras'' threefold charge to confess, do His will, and separate in 1 Esdras 9:8-9 is Ezra''s charge verbatim in covenant force.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-confess-and-separate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The separation from strange women Esdras commands in 1 Esdras 9:9 is obedience to the marriage boundary Moses set in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-confess-and-separate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The same set-apart calling Esdras presses in 1 Esdras 9:9 sounds again to the renewed assembly — come out and be separate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-confess-and-separate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-mourning-iniquity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:6 — *Then Ezra rose up from before the house of Elohim (God), and went into the chamber of Johanan the son of Eliashib: and when he came thither, he did eat no bread, nor drink water: for he mourned because of the transgression of them that had been carried away.* The chamber of Johanan, the fast from bread and water, the mourning over the captivity''s sin in 1 Esdras 9:1-2 are recorded the same in the canon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-mourning-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:4 — *Then were assembled unto me every one that trembled at the words of the Elohim (God) of Yashar''el (Israel), because of the transgression of those that had been carried away; and I sat astonied until the evening sacrifice.* Esdras'' mourning over the great iniquities in 1 Esdras 9:2 gathers, as Ezra''s did, all who tremble at the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-mourning-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-reading-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 8:3 — *And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law.* The reading from morning to midday before men and women, the multitude giving heed, in 1 Esdras 9:41 is Nehemiah''s broad-place reading exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:1 — *And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel).* The whole multitude gathering with one accord and calling for the Law in 1 Esdras 9:38-39 is the same assembly at the water gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law:* Esdras reading the Law to the whole multitude from man to woman in 1 Esdras 9:40 fulfills Moses'' command to gather all Israel to hear the law read aloud.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 24:45 — *Then opened he their understanding, that they might understand the scriptures,* The Levites making the people understand the law in 1 Esdras 9:48 foreshadow the risen Messiah opening the understanding of His own to the Scriptures.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-joy-is-your-strength
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* Esdras'' charge to eat the fat, drink the sweet, send portions, and be not sorrowful in 1 Esdras 9:51-52 is Nehemiah''s word — and its ground is that the joy of Yahuah is the people''s strength.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-joy-is-your-strength'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:9 — *And Nehemiah, which is the Tirshatha, and Ezra the priest the scribe, and the Levites that taught the people, said unto all the people, This day is holy unto Yahuah Elohaychem (the LORD your God); mourn not, nor weep. For all the people wept, when they heard the words of the law.* The holy day, the weeping at the hearing of the law, and the call to mourn not in 1 Esdras 9:50 are the same scene Nehemiah records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-joy-is-your-strength'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 8:12 — *And all the people went their way to eat, and to drink, and to send portions, and to make great mirth, because they had understood the words that were declared unto them.* The multitude going to feast because they understood the words in which they were instructed in 1 Esdras 9:55 closes the scene exactly as Nehemiah does — understanding turned to gladness.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-joy-is-your-strength'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

