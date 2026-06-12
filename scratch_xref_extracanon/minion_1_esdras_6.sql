-- ----- fragment: minion_1esdras_06.sql (session253 1-esdras 6) -----
-- Source anchor: apocrypha/1-esdras ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd6 (view _session253_1esd6_lookup). Sort band base 62625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-6-haggai-zechariah-prophesied
  ('apocrypha', '1-esdras', 6, 1, 'canon', 'ezra', 5, 1, 'free', E'Ezra 5:1 — *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* The canon names the very prophets 1 Esdras 6:1 calls Aggeus and Zacharias the son of Addo, prophesying in that same second year of Darius.'),
  ('apocrypha', '1-esdras', 6, 2, 'canon', 'ezra', 5, 2, 'free', E'Ezra 5:2 — *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* The same pair of builders, Zorobabel and Jesus/Yeshua son of Josedec, begin the house with the prophets helping, exactly as 1 Esdras 6:2 records.'),
  ('apocrypha', '1-esdras', 6, 2, 'canon', 'haggai', 1, 1, 'free', E'Haggai 1:1 — *In the second year of Darius the king, in the sixth month, in the first day of the month, came the word of Yahuah (LORD) by Haggai the prophet unto Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and to Joshua the son of Josedech, the high priest, saying,* The prophetic word that 1 Esdras 6:2 says raised up Zorobabel and Jesus son of Josedec is the word of Yahuah by Haggai, addressed to those same two men.'),
  -- thread: 1-esdras-6-servants-of-the-maker
  ('apocrypha', '1-esdras', 6, 13, 'canon', 'ezra', 5, 11, 'free', E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The identical confession of the elders, the servants of the Maker of heaven and earth, that 1 Esdras 6:13 records.'),
  ('apocrypha', '1-esdras', 6, 14, 'canon', 'ezra', 5, 11, 'free', E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The same verse that adds the house was builded long ago by a great king of Yashar''el, as 1 Esdras 6:14 says it was builded many years ago by a king of Yashar''el great and strong.'),
  -- thread: 1-esdras-6-cyrus-decree-found-in-the-rolls
  ('apocrypha', '1-esdras', 6, 21, 'canon', 'ezra', 6, 1, 'free', E'Ezra 6:1 — *Then Darius the king made a decree, and search was made in the house of the rolls, where the treasures were laid up in Babylon.* The canon''s record of the very search among the records of Cyrus that 1 Esdras 6:21 calls for.'),
  ('apocrypha', '1-esdras', 6, 24, 'canon', 'ezra', 6, 3, 'free', E'Ezra 6:3 — *In the first year of Cyrus the king the same Cyrus the king made a decree concerning the house of Elohim (God) at Jerusalem, Let the house be builded, the place where they offered sacrifices, and let the foundations thereof be strongly laid; the height thereof threescore cubits, and the breadth thereof threescore cubits;* The same Cyrus-decree, with the same threescore-cubit dimensions, that 1 Esdras 6:24-25 records being found in the roll.'),
  ('apocrypha', '1-esdras', 6, 17, 'canon', 'ezra', 1, 2, 'free', E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* The original proclamation of Cyrus to build the house, which 1 Esdras 6:17 says he wrote in his first year over Babylon.'),
  ('apocrypha', '1-esdras', 6, 24, 'canon', 'isaiah', 44, 28, 'free', E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Yahuah named Cyrus and his temple-decree by prophecy long before; the decree found in 1 Esdras 6:24 is the foretold word performed.'),
  -- thread: 1-esdras-6-the-work-finished-through-the-prophets
  ('apocrypha', '1-esdras', 6, 28, 'canon', 'ezra', 6, 14, 'free', E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The finishing that Darius commands in 1 Esdras 6:28 comes, the canon says, through the prophesying of Haggai and Zechariah by the commandment of Elohim and the kings.'),
  ('apocrypha', '1-esdras', 6, 28, 'canon', 'zechariah', 4, 9, 'free', E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* The very promise that the house would be built up whole again and finished, which Darius decrees in 1 Esdras 6:28, was spoken to Zorobabel by the prophet.'),
  ('apocrypha', '1-esdras', 6, 28, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The deeper cause of the prospering work that Darius funds in 1 Esdras 6:28 — the house is finished by Yahuah''s Spirit, not by imperial might or power.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-haggai-zechariah-prophesied',
       E'The prophets Aggeus and Zacharias stir up the building',
       E'*Now in the second year of the reign of Darius Aggeus and Zacharias the son of Addo, the prophets, prophesied to the Yahudim (Jews) in Jewry and Jerusalem in the name of Yahuah (God) of Yashar''el (Israel), which was upon them.* (1 Esdras 6:1) Then *stood up Zorobabel the son of Salatiel, and Jesus the son of Josedec, and began to build the house of Yahuah (God) at Jerusalem, the prophets of Yahuah (God) being with them, and helping them.* (1 Esdras 6:2) It ain''t new — this is the canon''s own record, almost word for word: *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* (Ezra 5:1) And the work rose with them: *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* (Ezra 5:2) The word that moved them came through Haggai in that same second year of Darius: *In the second year of Darius the king, in the sixth month, in the first day of the month, came the word of Yahuah (LORD) by Haggai the prophet unto Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and to Joshua the son of Josedech, the high priest, saying,* (Haggai 1:1) — the same Zorobabel, the same Jesus/Joshua son of Josedec (here Yeshua ben Josedech, the high priest, NOT the Messiah), stirred up to build by the prophetic word.',
       sv.verse_id, ev.verse_id, 'extras', 62625
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-servants-of-the-maker',
       E'We are the servants of Him who made heaven and earth',
       E'When the governors demand by whose authority the house is built, the elders answer with a confession of the Creator: *So they gave us this answer, We are the servants of Yahuah (God) which made heaven and earth.* (1 Esdras 6:13) The canon preserves the same reply almost letter for letter: *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* (Ezra 5:11) The builders do not plead a king''s permit first; they confess the Maker — for the house being raised belongs to *Yahuah (God) which made heaven and earth*, the same word with which the Scriptures open (Genesis 1:1). The covenant identity precedes the imperial paperwork: they are servants of the Creator before they are subjects of Darius.',
       sv.verse_id, ev.verse_id, 'extras', 62628
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-cyrus-decree-found-in-the-rolls',
       E'Darius searches the rolls and finds Cyrus'' decree',
       E'Darius is asked to let the matter be tested against the imperial archives: *Now therefore, if it seem good to the king, let search be made among the records of king Cyrus:* (1 Esdras 6:21) The canon frames the search the same way: *Then Darius the king made a decree, and search was made in the house of the rolls, where the treasures were laid up in Babylon.* (Ezra 6:1) And the decree is found — *In the first year of the reign of Cyrus king Cyrus commanded that the house of Yahuah (God) at Jerusalem should be built again, where they do sacrifice with continual fire:* (1 Esdras 6:24); so the canon: *In the first year of Cyrus the king the same Cyrus the king made a decree concerning the house of Elohim (God) at Jerusalem, Let the house be builded, the place where they offered sacrifices, and let the foundations thereof be strongly laid; the height thereof threescore cubits, and the breadth thereof threescore cubits;* (Ezra 6:3) None of this is new: Cyrus'' decree itself fulfils what Yahuah had spoken long before through Isaiah — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* (Isaiah 44:28) The pagan king''s roll is the prophesied instrument of the house''s restoration.',
       sv.verse_id, ev.verse_id, 'extras', 62631
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-the-work-finished-through-the-prophets',
       E'The work prospers and is finished through Haggai and Zechariah',
       E'Darius confirms and funds the work: *I have commanded also to have it built up whole again; and that they look diligently to help those that be of the captivity of the Yahudim (Jews), till the house of Yahuah (God) be finished:* (1 Esdras 6:28) The canon tells how that finishing actually came — not by might of empire but by the prophetic word: *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* (Ezra 6:14) And the promise that the same hands which laid the foundation would finish it was spoken to Zerubbabel by Zechariah: *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* (Zechariah 4:9) — for the house is built *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6) The king''s diligence in 1 Esdras 6:28 is real, but the unseen engine is the Spirit through the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 62634
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-6-haggai-zechariah-prophesied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 5:1 — *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* The canon names the very prophets 1 Esdras 6:1 calls Aggeus and Zacharias the son of Addo, prophesying in that same second year of Darius.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-haggai-zechariah-prophesied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 5:2 — *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* The same pair of builders, Zorobabel and Jesus/Yeshua son of Josedec, begin the house with the prophets helping, exactly as 1 Esdras 6:2 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-haggai-zechariah-prophesied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Haggai 1:1 — *In the second year of Darius the king, in the sixth month, in the first day of the month, came the word of Yahuah (LORD) by Haggai the prophet unto Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and to Joshua the son of Josedech, the high priest, saying,* The prophetic word that 1 Esdras 6:2 says raised up Zorobabel and Jesus son of Josedec is the word of Yahuah by Haggai, addressed to those same two men.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-haggai-zechariah-prophesied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-6-servants-of-the-maker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The identical confession of the elders, the servants of the Maker of heaven and earth, that 1 Esdras 6:13 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-servants-of-the-maker'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The same verse that adds the house was builded long ago by a great king of Yashar''el, as 1 Esdras 6:14 says it was builded many years ago by a king of Yashar''el great and strong.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-servants-of-the-maker'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-6-cyrus-decree-found-in-the-rolls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:1 — *Then Darius the king made a decree, and search was made in the house of the rolls, where the treasures were laid up in Babylon.* The canon''s record of the very search among the records of Cyrus that 1 Esdras 6:21 calls for.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:3 — *In the first year of Cyrus the king the same Cyrus the king made a decree concerning the house of Elohim (God) at Jerusalem, Let the house be builded, the place where they offered sacrifices, and let the foundations thereof be strongly laid; the height thereof threescore cubits, and the breadth thereof threescore cubits;* The same Cyrus-decree, with the same threescore-cubit dimensions, that 1 Esdras 6:24-25 records being found in the roll.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* The original proclamation of Cyrus to build the house, which 1 Esdras 6:17 says he wrote in his first year over Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Yahuah named Cyrus and his temple-decree by prophecy long before; the decree found in 1 Esdras 6:24 is the foretold word performed.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-6-the-work-finished-through-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The finishing that Darius commands in 1 Esdras 6:28 comes, the canon says, through the prophesying of Haggai and Zechariah by the commandment of Elohim and the kings.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-the-work-finished-through-the-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* The very promise that the house would be built up whole again and finished, which Darius decrees in 1 Esdras 6:28, was spoken to Zorobabel by the prophet.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-the-work-finished-through-the-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The deeper cause of the prospering work that Darius funds in 1 Esdras 6:28 — the house is finished by Yahuah''s Spirit, not by imperial might or power.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-the-work-finished-through-the-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

