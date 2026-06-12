-- ----- fragment: minion_1esdras_07.sql (session253 1-esdras 7) -----
-- Source anchor: apocrypha/1-esdras ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd7 (view _session253_1esd7_lookup). Sort band base 62650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-7-house-finished
  ('apocrypha', '1-esdras', 7, 3, 'canon', 'ezra', 6, 14, 'free', E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The same Haggai and Zechariah prophesying, the same kings named, the same commandment of Elohim that 1 Esdras 7:3-4 records word for word.'),
  ('apocrypha', '1-esdras', 7, 5, 'canon', 'ezra', 6, 15, 'free', E'Ezra 6:15 — *And this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king.* The month Adar and the sixth year of Darius fix the completion exactly as 1 Esdras 7:5 dates it.'),
  ('apocrypha', '1-esdras', 7, 4, 'canon', '2-chronicles', 7, 1, 'free', E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* The first house Solomon finished and the second house the exiles finish are one work of one Elohim, as 1 Esdras 7:4 declares it built by His commandment.'),
  -- thread: 1-esdras-7-dedication-offerings
  ('apocrypha', '1-esdras', 7, 7, 'canon', 'ezra', 6, 17, 'free', E'Ezra 6:17 — *And offered at the dedication of this house of Elohim (God) an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel).* The identical tally, and the twelve goats for the whole twelve-tribe house, matching 1 Esdras 7:7-8 exactly.'),
  ('apocrypha', '1-esdras', 7, 9, 'canon', 'ezra', 6, 18, 'free', E'Ezra 6:18 — *And they set the priests in their divisions, and the Levites in their courses, for the service of Elohim (God), which is at Jerusalem; as it is written in the book of Moses.* The priests and Levites arrayed by the book of Moses are the same ranks 1 Esdras 7:9 sets in their vestments at every gate.'),
  ('apocrypha', '1-esdras', 7, 7, 'canon', '2-chronicles', 7, 5, 'free', E'2 Chronicles 7:5 — *And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God).* Solomon''s first dedication-sacrifice is the pattern the smaller returning remnant follows in 1 Esdras 7:7, the house dedicated with blood.'),
  -- thread: 1-esdras-7-passover-kept
  ('apocrypha', '1-esdras', 7, 10, 'canon', 'ezra', 6, 19, 'free', E'Ezra 6:19 — *And the children of the captivity kept the passover upon the fourteenth day of the first month.* The very fourteenth day of the first month 1 Esdras 7:10 names, the returned captivity keeping the Passover.'),
  ('apocrypha', '1-esdras', 7, 10, 'canon', 'exodus', 12, 18, 'free', E'Exodus 12:18 — *In the first month, on the fourteenth day of the month at even, ye shall eat unleavened bread, until the one and twentieth day of the month at even.* The Sinai ordinance fixes the fourteenth-day Passover the exiles keep in 1 Esdras 7:10 — the feast did not change in captivity.'),
  ('apocrypha', '1-esdras', 7, 14, 'canon', 'ezra', 6, 22, 'free', E'Ezra 6:22 — *And kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them, to strengthen their hands in the work of the house of Elohim (God), the Elohim (God) of Yashar''el (Israel).* The seven-day feast kept with joy, and the turned heart of the Assyrian king strengthening their hands, is 1 Esdras 7:14-15 told in Ezra''s own words.'),
  ('apocrypha', '1-esdras', 7, 14, 'canon', '1-corinthians', 5, 7, 'free', E'1 Corinthians 5:7 — *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us:* The seven-day unleavened feast the exiles keep before Yahuah in 1 Esdras 7:14 finds its substance in Yahusha, our Passover.'),
  -- thread: 1-esdras-7-separated-holy
  ('apocrypha', '1-esdras', 7, 13, 'canon', 'ezra', 6, 21, 'free', E'Ezra 6:21 — *And the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel), did eat.* The separated remnant that seeks Yahuah and eats the Passover is 1 Esdras 7:13 in Ezra''s own line.'),
  ('apocrypha', '1-esdras', 7, 13, 'canon', 'leviticus', 20, 26, 'free', E'Leviticus 20:26 — *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* The severing from the peoples that Yahuah commands is the very separation from the abominations of the land the exiles enact in 1 Esdras 7:13.'),
  ('apocrypha', '1-esdras', 7, 13, 'canon', 'leviticus', 20, 7, 'free', E'Leviticus 20:7 — *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God).* The command to sanctify and separate stands behind the returned captivity who separated themselves and sought Yahuah in 1 Esdras 7:13.'),
  ('apocrypha', '1-esdras', 7, 13, 'canon', '2-corinthians', 6, 17, 'free', E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The apostolic call to come out and be separate from the unclean is the same covenant separation the exiles keep in 1 Esdras 7:13.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-house-finished',
       E'The holy house finished, the prophets prophesying',
       E'The returned exiles bring the temple to completion under the prophets'' word: *And so the holy works prospered, when Aggeus and Zacharias the prophets prophesied. And they finished these things by the commandment of Yahuah (God) of Yashar''el (Israel)... And thus was the holy house finished in the three and twentieth day of the month Adar, in the sixth year of Darius king of the Persians* (1 Esd 7:3-5). This is the very record of Ezra: *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel)* (Ezra 6:14). And the date stands witness: *And this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king* (Ezra 6:15) — the same Adar, the same sixth year of Darius. It ain''t new: the word that built the first house through Solomon builds the second, *Now when Solomon had made an end of praying, the fire came down from heaven... and the glory of Yahuah (LORD) filled the house* (2 Chron 7:1).',
       sv.verse_id, ev.verse_id, 'extras', 62650
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-dedication-offerings',
       E'The dedication: bullocks, rams, lambs, and twelve goats for all Israel',
       E'The house is dedicated with sacrifice for every tribe: *And to the dedication of the temple of Yahuah (God) they offered an hundred bullocks two hundred rams, four hundred lambs; And twelve goats for the sin of all Yashar''el (Israel), according to the number of the chief of the tribes of Yashar''el (Israel)* (1 Esd 7:7-8). Ezra counts the same herd: *And offered at the dedication of this house of Elohim (God) an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel)* (Ezra 6:17) — twelve goats, for the returned exiles never forget the twelve tribes, the whole house, not Judah only. And the priests stand by the book of Moses as Solomon''s dedication stood, *And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God)* (2 Chron 7:5).',
       sv.verse_id, ev.verse_id, 'extras', 62653
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-passover-kept',
       E'The Passover and unleavened bread kept by the returned captivity',
       E'The exiles keep the appointed feast in its season: *And the children of Yashar''el (Israel) that were of the captivity held the passover the fourteenth day of the first month... And they kept the feast of unleavened bread seven days, making merry before Yahuah (God)* (1 Esd 7:10,14). This is Ezra''s record verbatim: *And the children of the captivity kept the passover upon the fourteenth day of the first month* (Ezra 6:19), and *kept the feast of unleavened bread seven days with joy* (Ezra 6:22). And it ain''t new — it is the standing ordinance of Sinai: *In the first month, on the fourteenth day of the month at even, ye shall eat unleavened bread* (Exo 12:18), *ye shall keep it a feast by an ordinance for ever* (Exo 12:14). The feast the redeemed keep is the redeemed Yahusha keeps: *For even Messiah (Christ) our passover is sacrificed for us* (1 Cor 5:7) — *Therefore let us keep the feast* (1 Cor 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 62656
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-separated-holy',
       E'Separated from the heathen filthiness to seek Yahuah',
       E'Only those who came out of the world''s abominations eat the Passover: *And the children of Yashar''el (Israel) that came out of the captivity did eat, even all they that had separated themselves from the abominations of the people of the land, and sought Yahuah (God)* (1 Esd 7:13). Ezra records the same separation: *And the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel), did eat* (Ezra 6:21). And it ain''t new — this is the holiness Yahuah severed His people unto from the beginning: *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Lev 20:26); *Sanctify yourselves therefore, and be ye holy* (Lev 20:7). The call to the separated table runs straight into the gospel: *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Cor 6:17).',
       sv.verse_id, ev.verse_id, 'extras', 62659
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-7-house-finished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The same Haggai and Zechariah prophesying, the same kings named, the same commandment of Elohim that 1 Esdras 7:3-4 records word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-house-finished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:15 — *And this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king.* The month Adar and the sixth year of Darius fix the completion exactly as 1 Esdras 7:5 dates it.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-house-finished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* The first house Solomon finished and the second house the exiles finish are one work of one Elohim, as 1 Esdras 7:4 declares it built by His commandment.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-house-finished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-7-dedication-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:17 — *And offered at the dedication of this house of Elohim (God) an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel).* The identical tally, and the twelve goats for the whole twelve-tribe house, matching 1 Esdras 7:7-8 exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-dedication-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:18 — *And they set the priests in their divisions, and the Levites in their courses, for the service of Elohim (God), which is at Jerusalem; as it is written in the book of Moses.* The priests and Levites arrayed by the book of Moses are the same ranks 1 Esdras 7:9 sets in their vestments at every gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-dedication-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 7:5 — *And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God).* Solomon''s first dedication-sacrifice is the pattern the smaller returning remnant follows in 1 Esdras 7:7, the house dedicated with blood.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-dedication-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-7-passover-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:19 — *And the children of the captivity kept the passover upon the fourteenth day of the first month.* The very fourteenth day of the first month 1 Esdras 7:10 names, the returned captivity keeping the Passover.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:18 — *In the first month, on the fourteenth day of the month at even, ye shall eat unleavened bread, until the one and twentieth day of the month at even.* The Sinai ordinance fixes the fourteenth-day Passover the exiles keep in 1 Esdras 7:10 — the feast did not change in captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 6:22 — *And kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them, to strengthen their hands in the work of the house of Elohim (God), the Elohim (God) of Yashar''el (Israel).* The seven-day feast kept with joy, and the turned heart of the Assyrian king strengthening their hands, is 1 Esdras 7:14-15 told in Ezra''s own words.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 5:7 — *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us:* The seven-day unleavened feast the exiles keep before Yahuah in 1 Esdras 7:14 finds its substance in Yahusha, our Passover.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-7-separated-holy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:21 — *And the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel), did eat.* The separated remnant that seeks Yahuah and eats the Passover is 1 Esdras 7:13 in Ezra''s own line.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 20:26 — *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* The severing from the peoples that Yahuah commands is the very separation from the abominations of the land the exiles enact in 1 Esdras 7:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 20:7 — *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God).* The command to sanctify and separate stands behind the returned captivity who separated themselves and sought Yahuah in 1 Esdras 7:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The apostolic call to come out and be separate from the unclean is the same covenant separation the exiles keep in 1 Esdras 7:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

