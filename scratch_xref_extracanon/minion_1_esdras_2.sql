-- ----- fragment: minion_1esdras_02.sql (session253 1-esdras 2) -----
-- Source anchor: apocrypha/1-esdras ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd2 (view _session253_1esd2_lookup). Sort band base 62525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-2-cyrus-decree
  ('apocrypha', '1-esdras', 2, 1, 'canon', 'ezra', 1, 1, 'free', E'Ezra 1:1 — *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* The Ezra original from which 1 Esdras 2:1 is drawn, naming the same first year, the same word by Jeremiah, the same stirred spirit.'),
  ('apocrypha', '1-esdras', 2, 4, 'canon', 'ezra', 1, 2, 'free', E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* Cyrus''s own decree to build the house at Jerusalem, the charge 1 Esdras 2:4 puts in the king''s mouth.'),
  ('apocrypha', '1-esdras', 2, 5, 'canon', 'ezra', 1, 3, 'free', E'Ezra 1:3 — *Who is there among you of all his people? his Elohim (God) be with him, and let him go up to Jerusalem, which is in Yahudah (Judah), and build the house of Yahuah Elohim (the LORD God) of Yashar''el (Israel), (he is the Elohim (God),) which is in Jerusalem.* The summons to go up and build, matching 1 Esdras 2:5 phrase for phrase down to Elohim being with him.'),
  -- thread: 1-esdras-2-cyrus-shepherd-anointed
  ('apocrypha', '1-esdras', 2, 3, 'canon', 'isaiah', 44, 28, 'free', E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Isaiah names Cyrus and his commission to rebuild Jerusalem and the temple, the very thing the king proclaims in 1 Esdras 2:3-4.'),
  ('apocrypha', '1-esdras', 2, 4, 'canon', 'isaiah', 45, 1, 'free', E'Isaiah 45:1 — *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* Yahuah calls Cyrus His anointed and holds his right hand, the unseen hand commissioning the builder of 1 Esdras 2:4.'),
  ('apocrypha', '1-esdras', 2, 4, 'canon', 'isaiah', 45, 13, 'free', E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* Yahuah raises Cyrus to build His city and free the captives without price, the freed exiles and rebuilt house of 1 Esdras 2:4.'),
  -- thread: 1-esdras-2-seventy-years
  ('apocrypha', '1-esdras', 2, 1, 'canon', 'jeremiah', 29, 10, 'free', E'Jeremiah 29:10 — *For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* The seventy-year word by Jeremy that 1 Esdras 2:1 says is now being accomplished in the first year of Cyrus.'),
  ('apocrypha', '1-esdras', 2, 1, 'canon', 'jeremiah', 29, 14, 'free', E'Jeremiah 29:14 — *And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you, saith Yahuah (LORD); and I will bring you again into the place whence I caused you to be carried away captive.* The same prophetic word promises the full regathering, of which the Cyrus return in 1 Esdras 2:1 is the firstfruits.'),
  -- thread: 1-esdras-2-holy-vessels
  ('apocrypha', '1-esdras', 2, 10, 'canon', 'ezra', 1, 7, 'free', E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods;* The same bringing-forth of the holy vessels Nebuchadnezzar had set among idols, matching 1 Esdras 2:10.'),
  ('apocrypha', '1-esdras', 2, 15, 'canon', 'ezra', 1, 11, 'free', E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* Sheshbazzar (Sanabassar) bringing the vessels with the captives from Babylon to Jerusalem, the return of 1 Esdras 2:15.'),
  -- thread: 1-esdras-2-adversaries-letter
  ('apocrypha', '1-esdras', 2, 16, 'canon', 'ezra', 4, 7, 'free', E'Ezra 4:7 — *And in the days of Artaxerxes wrote Bishlam, Mithredath, Tabeel, and the rest of their companions, unto Artaxerxes king of Persia; and the writing of the letter was written in the Syrian tongue, and interpreted in the Syrian tongue.* The same letter under Artaxerxes by Mithredath and Tabeel and their companions that 1 Esdras 2:16 records against the builders.'),
  ('apocrypha', '1-esdras', 2, 18, 'canon', 'ezra', 4, 12, 'free', E'Ezra 4:12 — *Be it known unto the king, that the Yahudim (Jews) which came up from thee to us are come unto Jerusalem, building the rebellious and the bad city, and have set up the walls thereof, and joined the foundations.* The identical accusation that the returned Jews are rebuilding the rebellious city and its walls, as in 1 Esdras 2:18.'),
  ('apocrypha', '1-esdras', 2, 19, 'canon', 'ezra', 4, 13, 'free', E'Ezra 4:13 — *Be it known now unto the king, that, if this city be builded, and the walls set up again, then will they not pay toll, tribute, and custom, and so thou shalt endamage the revenue of the kings.* The same tribute-and-revenue scare 1 Esdras 2:19 uses to turn the king against the work.'),
  -- thread: 1-esdras-2-work-ceased
  ('apocrypha', '1-esdras', 2, 28, 'canon', 'ezra', 4, 21, 'free', E'Ezra 4:21 — *Give ye now commandment to cause these men to cease, and that this city be not builded, until another commandment shall be given from me.* The royal command to make the builders cease, the order 1 Esdras 2:28 records the king giving to hinder the work.'),
  ('apocrypha', '1-esdras', 2, 30, 'canon', 'ezra', 4, 23, 'free', E'Ezra 4:23 — *Now when the copy of king Artaxerxes'' letter was read before Rehum, and Shimshai the scribe, and their companions, they went up in haste to Jerusalem unto the Yahudim (Jews), and made them to cease by force and power.* The haste to Jerusalem to force the builders to stop, the same scene 1 Esdras 2:30 describes with horsemen and a multitude.'),
  ('apocrypha', '1-esdras', 2, 30, 'canon', 'ezra', 4, 24, 'free', E'Ezra 4:24 — *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia.* The work ceasing until the second year of Darius, the exact endpoint 1 Esdras 2:30 names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-cyrus-decree',
       E'Cyrus proclaims the house of Yahuah rebuilt',
       E'1 Esdras opens the return with the Persian decree: *In the first year of Cyrus king of the Persians, that the word of Yahuah (God) might be accomplished, that he had promised by the mouth of Jeremy; Yahuah (God) raised up the spirit of Cyrus the king of the Persians, and he made proclamation through all his kingdom, and also by writing* (1 Esdras 2:1-2). This is Ezra''s own account retold word for word: *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* (Ezra 1:1). The charge Cyrus speaks — *And commanded me to build him an house at Jerusalem in Jewry* (1 Esdras 2:4) — answers exactly to *Thus saith Cyrus king of Persia... he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah)* (Ezra 2:2). It ain''t new: the same hand that moved the heart of a pagan king to restore His house is the witness of both books.',
       sv.verse_id, ev.verse_id, 'extras', 62525
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-cyrus-shepherd-anointed',
       E'Cyrus my shepherd, my anointed',
       E'Behind the decree of 1 Esdras 2 stands a prophecy that named Cyrus by name a hundred and fifty years before he was born: *Saying, Thus says Cyrus king of the Persians; Yahuah (God) of Yashar''el (Israel), the most high Yahuah (God), has made me king of the whole world, And commanded me to build him an house at Jerusalem in Jewry* (1 Esdras 2:3-4). Isaiah had already spoken Yahuah''s word over this very king: *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* (Isaiah 44:28). And He calls the Persian His messiah-figure — *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him* (Isaiah 45:1) — and declares the purpose: *I have raised him up in righteousness... he shall build my city, and he shall let go my captives, not for price nor reward* (Isaiah 45:13). The decree of 1 Esdras 2 is the day that word came to pass.',
       sv.verse_id, ev.verse_id, 'extras', 62528
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-seventy-years',
       E'The word by Jeremy — after seventy years',
       E'1 Esdras grounds the whole return on a prophet''s word: *In the first year of Cyrus king of the Persians, that the word of Yahuah (God) might be accomplished, that he had promised by the mouth of Jeremy* (1 Esdras 2:1). That promised word is the seventy-year decree: *For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place* (Jeremiah 29:10). The gathering Yahuah swore went further than the city — *And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you... and I will bring you again into the place whence I caused you to be carried away captive* (Jeremiah 29:14). Cyrus''s decree in 1 Esdras 2 is the opening of that ingathering, the down-payment on the regathering of the houses Yahuah will never finally cast away.',
       sv.verse_id, ev.verse_id, 'extras', 62531
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-holy-vessels',
       E'The holy vessels carried back from Babylon',
       E'1 Esdras records the restoring of the plundered temple gold: *King Cyrus also brought forth the holy vessels, which Nabuchodonosor had carried away from Jerusalem, and had set up in his temple of idols* (1 Esdras 2:10), and they were *brought back by Sanabassar, together with them of the captivity, from Babylon to Jerusalem* (1 Esdras 2:15). Ezra tells the same restoration: *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods;* (Ezra 1:7), and *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem* (Ezra 1:11). The holy things Babylon set among its idols do not stay in exile; Yahuah brings every sanctified vessel home — the pledge that what is His is never finally lost to Babylon.',
       sv.verse_id, ev.verse_id, 'extras', 62534
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-adversaries-letter',
       E'The adversaries write to stop the work',
       E'The work begun under Cyrus is opposed under a later king: *But in the time of Artexerxes king of the Persians Belemus, and Mithridates, and Tabellius, and Rathumus... wrote to him against them that dwelt in Judea and Jerusalem* (1 Esdras 2:16), charging that *the Yahudim (Jews) that are up from you to us, being come into Jerusalem, that rebellious and wicked city, do build the marketplaces, and repair the walls of it and do lay the foundation of the temple* (1 Esdras 2:18). Ezra preserves this very letter: *And in the days of Artaxerxes wrote Bishlam, Mithredath, Tabeel, and the rest of their companions, unto Artaxerxes king of Persia* (Ezra 4:7), with the same accusation — *that the Yahudim (Jews) which came up from thee to us are come unto Jerusalem, building the rebellious and the bad city, and have set up the walls thereof, and joined the foundations* (Ezra 4:12). The slander that the city will *refuse to give tribute, but also rebel against kings* (1 Esdras 2:19) is Ezra''s *then will they not pay toll, tribute, and custom... so thou shalt endamage the revenue of the kings* (Ezra 4:13). The kingdom-of-man system always moves to halt the building of Yahuah''s house.',
       sv.verse_id, ev.verse_id, 'extras', 62537
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-work-ceased',
       E'The king commands, and the building ceases',
       E'Artaxerxes answers the slander and the work stops: *Now therefore I have commanded to hinder those men from building the city, and heed to be taken that there be no more done in it* (1 Esdras 2:28), and so *Rathumus, and Semellius the scribe, and the rest... removing in haste toward Jerusalem with a troop of horsemen and a multitude of people in battle array, began to hinder the builders; and the building of the temple in Jerusalem ceased until the second year of the reign of Darius king of the Persians* (1 Esdras 2:30). Ezra''s account is identical: *Give ye now commandment to cause these men to cease, and that this city be not builded, until another commandment shall be given from me* (Ezra 4:21), and then *they went up in haste to Jerusalem unto the Yahudim (Jews), and made them to cease by force and power* (Ezra 4:23), so that *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia* (Ezra 4:24). Man''s decree can halt the house for a season; it cannot annul the word Yahuah promised by the mouth of Jeremy.',
       sv.verse_id, ev.verse_id, 'extras', 62540
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-2-cyrus-decree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:1 — *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* The Ezra original from which 1 Esdras 2:1 is drawn, naming the same first year, the same word by Jeremiah, the same stirred spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-decree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* Cyrus''s own decree to build the house at Jerusalem, the charge 1 Esdras 2:4 puts in the king''s mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-decree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 1:3 — *Who is there among you of all his people? his Elohim (God) be with him, and let him go up to Jerusalem, which is in Yahudah (Judah), and build the house of Yahuah Elohim (the LORD God) of Yashar''el (Israel), (he is the Elohim (God),) which is in Jerusalem.* The summons to go up and build, matching 1 Esdras 2:5 phrase for phrase down to Elohim being with him.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-decree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-cyrus-shepherd-anointed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Isaiah names Cyrus and his commission to rebuild Jerusalem and the temple, the very thing the king proclaims in 1 Esdras 2:3-4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-shepherd-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:1 — *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* Yahuah calls Cyrus His anointed and holds his right hand, the unseen hand commissioning the builder of 1 Esdras 2:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-shepherd-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* Yahuah raises Cyrus to build His city and free the captives without price, the freed exiles and rebuilt house of 1 Esdras 2:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-shepherd-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-seventy-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:10 — *For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* The seventy-year word by Jeremy that 1 Esdras 2:1 says is now being accomplished in the first year of Cyrus.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-seventy-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 29:14 — *And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you, saith Yahuah (LORD); and I will bring you again into the place whence I caused you to be carried away captive.* The same prophetic word promises the full regathering, of which the Cyrus return in 1 Esdras 2:1 is the firstfruits.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-seventy-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-holy-vessels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods;* The same bringing-forth of the holy vessels Nebuchadnezzar had set among idols, matching 1 Esdras 2:10.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-holy-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* Sheshbazzar (Sanabassar) bringing the vessels with the captives from Babylon to Jerusalem, the return of 1 Esdras 2:15.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-holy-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-adversaries-letter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 4:7 — *And in the days of Artaxerxes wrote Bishlam, Mithredath, Tabeel, and the rest of their companions, unto Artaxerxes king of Persia; and the writing of the letter was written in the Syrian tongue, and interpreted in the Syrian tongue.* The same letter under Artaxerxes by Mithredath and Tabeel and their companions that 1 Esdras 2:16 records against the builders.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-adversaries-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 4:12 — *Be it known unto the king, that the Yahudim (Jews) which came up from thee to us are come unto Jerusalem, building the rebellious and the bad city, and have set up the walls thereof, and joined the foundations.* The identical accusation that the returned Jews are rebuilding the rebellious city and its walls, as in 1 Esdras 2:18.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-adversaries-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 4:13 — *Be it known now unto the king, that, if this city be builded, and the walls set up again, then will they not pay toll, tribute, and custom, and so thou shalt endamage the revenue of the kings.* The same tribute-and-revenue scare 1 Esdras 2:19 uses to turn the king against the work.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-adversaries-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-work-ceased
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 4:21 — *Give ye now commandment to cause these men to cease, and that this city be not builded, until another commandment shall be given from me.* The royal command to make the builders cease, the order 1 Esdras 2:28 records the king giving to hinder the work.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-work-ceased'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 4:23 — *Now when the copy of king Artaxerxes'' letter was read before Rehum, and Shimshai the scribe, and their companions, they went up in haste to Jerusalem unto the Yahudim (Jews), and made them to cease by force and power.* The haste to Jerusalem to force the builders to stop, the same scene 1 Esdras 2:30 describes with horsemen and a multitude.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-work-ceased'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 4:24 — *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia.* The work ceasing until the second year of Darius, the exact endpoint 1 Esdras 2:30 names.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-work-ceased'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

