-- =====================================================================
-- Session 253 — Baruch FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_baruch_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Baruch cross-references starting...'
BEGIN;

-- ----- fragment: minion_baruchwiththeletterofjeremiah_01.sql (session253 baruch-with-the-letter-of-jeremiah 1) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar1 (view _session253_bar1_lookup). Sort band base 60700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-1-read-wept-fasted
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 5, 'canon', 'daniel', 9, 3, 'free', E'Daniel 9:3 — *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes:* Daniel in the same Babylon sets the exact pattern of fasting-and-prayer that the river-Sud exiles enact in Baruch 1:5.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 3, 'canon', 'jeremiah', 29, 7, 'free', E'Jeremiah 29:7 — *And seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace.* Jeremiah''s letter to the captives commands the very praying-and-seeking that Baruch reads aloud in Baruch 1:3.'),
  -- thread: baruch-1-silver-for-offerings
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 10, 'canon', 'ezra', 6, 10, 'free', E'Ezra 6:10 — *That they may offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons.* The Ezra decree binds offerings to prayer-for-the-king exactly as Baruch 1:10 sends silver for burnt offerings while v.11 prays for Nebuchadnezzar.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 8, 'canon', 'ezra', 6, 5, 'free', E'Ezra 6:5 — *And also let the golden and silver vessels of the house of Elohim (God), which Nebuchadnezzar took forth out of the temple which is at Jerusalem, and brought unto Babylon, be restored, and brought again unto the temple which is at Jerusalem, every one to his place, and place them in the house of Elohim (God).* The silver temple-vessels returned to Judah in Baruch 1:8 are the same vessels Ezra''s decree orders restored.'),
  -- thread: baruch-1-pray-for-the-king
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 12, 'canon', 'jeremiah', 27, 6, 'free', E'Jeremiah 27:6 — *And now have I given all these lands into the hand of Nebuchadnezzar the king of Babylon, my servant; and the beasts of the field have I given him also to serve him.* Living under Babylon''s shadow and serving the king in Baruch 1:12 is obedience to Yahuah''s own word that He gave the lands into Nebuchadnezzar''s hand.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 11, 'canon', '1-timothy', 2, 1, 'free', E'1 Timothy 2:1 — *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men;* The apostolic call to intercede for all men is the same Spirit as Baruch 1:11''s prayer for the life of the pagan king.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 11, 'canon', '1-timothy', 2, 2, 'free', E'1 Timothy 2:2 — *For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty.* Praying for kings so the people may live quietly is precisely Baruch 1:11-12''s plea that the king''s days endure and the exiles find favour.'),
  -- thread: baruch-1-righteousness-confusion-of-faces
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 15, 'canon', 'daniel', 9, 7, 'free', E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar''el (Israel), that are near, and that are far off, through all the countries whither thou hast driven them, because of their trespass that they have trespassed against thee.* Baruch 1:15 quotes Daniel''s confession nearly verbatim — righteousness to Yahuah, confusion of faces to Judah and Jerusalem.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 16, 'canon', 'daniel', 9, 6, 'free', E'Daniel 9:6 — *Neither have we hearkened unto thy servants the prophets, which spake in thy name to our kings, our princes, and our fathers, and to all the people of the land.* Baruch 1:16''s list — kings, princes, priests, prophets, fathers — is Daniel''s same enumeration of those who would not hearken.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 15, 'canon', 'nehemiah', 9, 33, 'free', E'Nehemiah 9:33 — *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* Nehemiah''s Levites make the identical division of Baruch 1:15 — Yahuah is just, the people have done wickedly.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 15, 'canon', 'ezra', 9, 7, 'free', E'Ezra 9:7 — *Since the days of our fathers have we been in a great trespass unto this day; and for our iniquities have we, our kings, and our priests, been delivered into the hand of the kings of the lands, to the sword, to captivity, and to a spoil, and to confusion of face, as it is this day.* Ezra''s prayer names the same *confusion of face* upon kings and priests that Baruch 1:15 lays upon Judah.'),
  -- thread: baruch-1-disobeyed-since-egypt
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 22, 'canon', 'jeremiah', 7, 24, 'free', E'Jeremiah 7:24 — *But they hearkened not, nor inclined their ear, but walked in the counsels and in the imagination of their evil heart, and went backward, and not forward.* Jeremiah''s *imagination of their evil heart* is the exact charge Baruch 1:22 confesses — every man followed his own wicked heart to serve strange gods.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 19, 'canon', 'jeremiah', 7, 25, 'free', E'Jeremiah 7:25 — *Since the day that your fathers came forth out of the land of Egypt unto this day I have even sent unto you all my servants the prophets, daily rising up early and sending them:* Jeremiah measures the disobedience from the Exodus *unto this day* just as Baruch 1:19 dates it from the bringing-out of Egypt to the present.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 20, 'canon', 'deuteronomy', 28, 15, 'free', E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* The curse Baruch 1:20 says Moses appointed is this Deuteronomic oath — disobedience to Yahuah''s voice brings the very curses that overtook the exiles.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 1, 20, 'canon', 'exodus', 3, 8, 'free', E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey; unto the place of the Canaanites, and the Hittites, and the Amorites, and the Perizzites, and the Hivites, and the Jebusites.* The *land that floweth with milk and honey* mourned in Baruch 1:20 is the very land Yahuah promised at the bush when He came down to redeem from Egypt.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-1-read-wept-fasted',
       E'The book read by the river — they wept, fasted, and prayed',
       E'By the waters of Babylon the exiles gather to hear the scroll: *And in the hearing of the nobles, and of the king’s sons, and in the hearing of the elders, and of all the people, from the lowest to the highest, even of all them that dwelt at Babylon by the river Sud.* (Baruch 1:4) — *Whereupon they wept, fasted, and prayed before Yahuah (God).* (Baruch 1:5) It ain''t new: this is the Daniel posture, the man of Babylon who turned his face homeward. *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes:* (Daniel 9:3) The whole scene is Jeremiah''s letter answered in the flesh — the prophet wrote to *the residue of the elders which were carried away captives*, and here they read and weep, the Torah-shaped repentance of the captivity made visible.',
       sv.verse_id, ev.verse_id, 'extras', 60700
  FROM _session253_bar1_lookup sv, _session253_bar1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-1-silver-for-offerings',
       E'Silver sent up to Jerusalem — burnt offerings on the altar',
       E'The exiles take up a collection and send it home for the altar: *And they said, Behold, we have sent you money to buy you burnt offerings, and sin offerings, and incense, and prepare you manna, and offer upon the altar of Yahuah (God), our Elohim (God);* (Baruch 1:10) It ain''t new: this is the Persian-era decree made an exile''s own offering — *That they may offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons.* (Ezra 6:10) Even the vessels carried back match the canon''s record: *And also let the golden and silver vessels of the house of Elohim (God), which Nebuchadnezzar took forth out of the temple which is at Jerusalem, and brought unto Babylon, be restored, and brought again unto the temple which is at Jerusalem* (Ezra 6:5). The house is not abandoned; the seed keeps the worship alive across the river.',
       sv.verse_id, ev.verse_id, 'extras', 60703
  FROM _session253_bar1_lookup sv, _session253_bar1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-1-pray-for-the-king',
       E'Pray for the life of Nebuchadnezzar — under the shadow of Babylon',
       E'Astonishingly, the captives pray for their captor: *And pray for the life of Nabuchodonosor king of Babylon, and for the life of Balthasar his son, that their days may be upon earth as the days of heaven:* (Baruch 1:11) — *and we shall live under the shadow of Nabuchodonosor king of Babylon... and find favour in their sight.* (Baruch 1:12) It ain''t new: Yahuah Himself had named the king His instrument — *And now have I given all these lands into the hand of Nebuchadnezzar the king of Babylon, my servant; and the beasts of the field have I given him also to serve him.* (Jeremiah 27:6) So Jeremiah''s command to seek the city''s peace becomes intercession for the throne, and the same posture is carried into the assembly: *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men;* (1 Timothy 2:1) — *For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty.* (1 Timothy 2:2) Not collaboration but covenant patience: the seed serves out its appointed seventy years.',
       sv.verse_id, ev.verse_id, 'extras', 60706
  FROM _session253_bar1_lookup sv, _session253_bar1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-1-righteousness-confusion-of-faces',
       E'To Yahuah belongeth righteousness, to us confusion of faces',
       E'The confession opens with words almost identical to Daniel''s: *And you shall say, To Yahuah (God), our Elohim (God) belongeth righteousness, but to us the confusion of faces, as it is come to pass this day, to them of Juda, and to the inhabitants of Jerusalem,* (Baruch 1:15) — *And to our kings, and to our princes, and to our priests, and to our prophets, and to our fathers:* (Baruch 1:16) It ain''t new — it is Daniel''s prayer, word for word: *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem* (Daniel 9:7), and the same roll-call of the guilty: *Neither have we hearkened unto thy servants the prophets, which spake in thy name to our kings, our princes, and our fathers, and to all the people of the land.* (Daniel 9:6) Nehemiah''s Levites confess in the same court: *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* (Nehemiah 9:33) Ezra too names the *confusion of face*: *Since the days of our fathers have we been in a great trespass unto this day; and for our iniquities have we, our kings, and our priests, been delivered into the hand of the kings of the lands, to the sword, to captivity, and to a spoil, and to confusion of face, as it is this day.* (Ezra 9:7) One confession, four witnesses — Yahuah is righteous, the people justly ashamed.',
       sv.verse_id, ev.verse_id, 'extras', 60709
  FROM _session253_bar1_lookup sv, _session253_bar1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-1-disobeyed-since-egypt',
       E'Disobedient since Egypt — the curse appointed by Moses',
       E'The confession traces the sin back to the Exodus and owns the covenant curse: *Since the day that Yahuah (God) brought our forefathers out of the land of Egypt, to this present day, we have been disobedient to Yahuah (God), our Elohim (God), and we have been negligent in not hearing his voice.* (Baruch 1:19) — *Wherefore the evils cleaved to us, and the curse, which Yahuah (God) appointed by Moses his servant at the time that he brought our fathers out of the land of Egypt, to give us a land that floweth with milk and honey* (Baruch 1:20) — *But every man followed the imagination of his own wicked heart, to serve strange gods* (Baruch 1:22). It ain''t new: Jeremiah preached this very indictment — *But they hearkened not, nor inclined their ear, but walked in the counsels and in the imagination of their evil heart, and went backward, and not forward.* (Jeremiah 7:24) — *Since the day that your fathers came forth out of the land of Egypt unto this day I have even sent unto you all my servants the prophets* (Jeremiah 7:25). The curse is no arbitrary wrath but the very oath Torah set forth: *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* (Deuteronomy 28:15) And the land they forfeited is the land first promised: *And I am come down to deliver them out of the hand of the Egyptians... unto a land flowing with milk and honey* (Exodus 3:8). Torah stands; the exile is its honest seal, never law-as-curse but covenant kept by Yahuah even in the people''s breaking.',
       sv.verse_id, ev.verse_id, 'extras', 60712
  FROM _session253_bar1_lookup sv, _session253_bar1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-1-read-wept-fasted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:3 — *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes:* Daniel in the same Babylon sets the exact pattern of fasting-and-prayer that the river-Sud exiles enact in Baruch 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-read-wept-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 29:7 — *And seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace.* Jeremiah''s letter to the captives commands the very praying-and-seeking that Baruch reads aloud in Baruch 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-read-wept-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-1-silver-for-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:10 — *That they may offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons.* The Ezra decree binds offerings to prayer-for-the-king exactly as Baruch 1:10 sends silver for burnt offerings while v.11 prays for Nebuchadnezzar.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-silver-for-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:5 — *And also let the golden and silver vessels of the house of Elohim (God), which Nebuchadnezzar took forth out of the temple which is at Jerusalem, and brought unto Babylon, be restored, and brought again unto the temple which is at Jerusalem, every one to his place, and place them in the house of Elohim (God).* The silver temple-vessels returned to Judah in Baruch 1:8 are the same vessels Ezra''s decree orders restored.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-silver-for-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-1-pray-for-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 27:6 — *And now have I given all these lands into the hand of Nebuchadnezzar the king of Babylon, my servant; and the beasts of the field have I given him also to serve him.* Living under Babylon''s shadow and serving the king in Baruch 1:12 is obedience to Yahuah''s own word that He gave the lands into Nebuchadnezzar''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-pray-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 2:1 — *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men;* The apostolic call to intercede for all men is the same Spirit as Baruch 1:11''s prayer for the life of the pagan king.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-pray-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:2 — *For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty.* Praying for kings so the people may live quietly is precisely Baruch 1:11-12''s plea that the king''s days endure and the exiles find favour.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-pray-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-1-righteousness-confusion-of-faces
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar''el (Israel), that are near, and that are far off, through all the countries whither thou hast driven them, because of their trespass that they have trespassed against thee.* Baruch 1:15 quotes Daniel''s confession nearly verbatim — righteousness to Yahuah, confusion of faces to Judah and Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-righteousness-confusion-of-faces'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:6 — *Neither have we hearkened unto thy servants the prophets, which spake in thy name to our kings, our princes, and our fathers, and to all the people of the land.* Baruch 1:16''s list — kings, princes, priests, prophets, fathers — is Daniel''s same enumeration of those who would not hearken.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-righteousness-confusion-of-faces'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 9:33 — *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* Nehemiah''s Levites make the identical division of Baruch 1:15 — Yahuah is just, the people have done wickedly.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-righteousness-confusion-of-faces'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezra 9:7 — *Since the days of our fathers have we been in a great trespass unto this day; and for our iniquities have we, our kings, and our priests, been delivered into the hand of the kings of the lands, to the sword, to captivity, and to a spoil, and to confusion of face, as it is this day.* Ezra''s prayer names the same *confusion of face* upon kings and priests that Baruch 1:15 lays upon Judah.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-righteousness-confusion-of-faces'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-1-disobeyed-since-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 7:24 — *But they hearkened not, nor inclined their ear, but walked in the counsels and in the imagination of their evil heart, and went backward, and not forward.* Jeremiah''s *imagination of their evil heart* is the exact charge Baruch 1:22 confesses — every man followed his own wicked heart to serve strange gods.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-disobeyed-since-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 7:25 — *Since the day that your fathers came forth out of the land of Egypt unto this day I have even sent unto you all my servants the prophets, daily rising up early and sending them:* Jeremiah measures the disobedience from the Exodus *unto this day* just as Baruch 1:19 dates it from the bringing-out of Egypt to the present.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-disobeyed-since-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* The curse Baruch 1:20 says Moses appointed is this Deuteronomic oath — disobedience to Yahuah''s voice brings the very curses that overtook the exiles.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-disobeyed-since-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey; unto the place of the Canaanites, and the Hittites, and the Amorites, and the Perizzites, and the Hivites, and the Jebusites.* The *land that floweth with milk and honey* mourned in Baruch 1:20 is the very land Yahuah promised at the bush when He came down to redeem from Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_bar1_lookup sv, _session253_bar1_lookup tv
 WHERE t.slug='baruch-1-disobeyed-since-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_baruchwiththeletterofjeremiah_02.sql (session253 baruch-with-the-letter-of-jeremiah 2) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar2 (view _session253_bar2_lookup). Sort band base 60725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-2-curses-of-the-law
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 2, 'canon', 'deuteronomy', 28, 15, 'free', E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* The plagues Baruch 2:2 says came ''according to the things that were written in the law of Moses'' are exactly these threatened curses falling due.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 4, 'canon', 'deuteronomy', 28, 64, 'free', E'Deuteronomy 28:64 — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* Baruch 2:4''s subjection and scattering ''among all the people round about'' is this Mosaic dispersal coming to pass.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 7, 'canon', 'leviticus', 26, 14, 'free', E'Leviticus 26:14 — *But if ye will not hearken unto me, and will not do all these commandments;* Baruch 2:7''s ''all these plagues are come upon us'' answers the very condition Leviticus set for the covenant-curse to fall.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 2, 'canon', 'daniel', 9, 11, 'free', E'Daniel 9:11 — *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* Daniel, in the same exile, names the law of Moses as the bond whose curse Baruch 2:2 says is now fulfilled in Jerusalem.'),
  -- thread: baruch-2-eat-flesh-of-son
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 3, 'canon', 'deuteronomy', 28, 53, 'free', E'Deuteronomy 28:53 — *And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee:* Baruch 2:3 quotes the siege-curse of Moses almost word for word, confessing it has come to pass.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 3, 'canon', 'leviticus', 26, 29, 'free', E'Leviticus 26:29 — *And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat.* The same dreadful sign of a covenant broken stands behind Baruch 2:3 — it ain''t new, it was written into the law.'),
  -- thread: baruch-2-righteousness-his-shame-ours
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 6, 'canon', 'daniel', 9, 7, 'free', E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar''el (Israel), that are near, and that are far off, through all the countries whither thou hast driven them, because of their trespass that they have trespassed against thee.* Baruch 2:6''s ''to Yahuah appertaineth righteousness: but to us... open shame'' is Daniel''s confession in the same words.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 9, 'canon', 'daniel', 9, 14, 'free', E'Daniel 9:14 — *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* Baruch 2:9''s ''Yahuah watched over us for evil... for Yahuah is righteous in all his works'' echoes Daniel almost verbatim.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 10, 'canon', 'daniel', 9, 10, 'free', E'Daniel 9:10 — *Neither have we obeyed the voice of Yahuah Eloheinu (the LORD our God), to walk in his laws, which he set before us by his servants the prophets.* Baruch 2:10''s ''we have not hearkened to his voice, to walk in the commandments... that he has set before us'' is the same self-accusation.'),
  -- thread: baruch-2-mercy-for-thy-names-sake
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 14, 'canon', 'daniel', 9, 17, 'free', E'Daniel 9:17 — *Now therefore, O our Elohim (God), hear the prayer of thy servant, and his supplications, and cause thy face to shine upon thy sanctuary that is desolate, for Yahuah''s (Lord''s) sake.* Baruch 2:14''s ''deliver us for your own sake'' rests on the same plea — for God''s sake, not the petitioner''s.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 19, 'canon', 'daniel', 9, 18, 'free', E'Daniel 9:18 — *O my Elohim (God), incline thine ear, and hear; open thine eyes, and behold our desolations, and the city which is called by thy name: for we do not present our supplications before thee for our righteousnesses, but for thy great mercies.* Baruch 2:19''s refusal to plead ''for the righteousness of our fathers'' is Daniel''s exact disavowal of merit, leaning on great mercy alone.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 15, 'canon', 'daniel', 9, 19, 'free', E'Daniel 9:19 — *O Yahuah (Lord), hear; O Yahuah (Lord), forgive; O Yahuah (Lord), hearken and do; defer not, for thine own sake, O my Elohim (God): for thy city and thy people are called by thy name.* Baruch 2:15 grounds the plea in the same fact — that Israel ''is called by your name'' — so the Name''s honour is at stake.'),
  -- thread: baruch-2-new-heart-everlasting-covenant
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 31, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Baruch 2:31''s promise ''I will give them an heart, and ears to hear'' is Jeremiah''s new-covenant law written on the inward heart.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 31, 'canon', 'ezekiel', 36, 26, 'free', E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* Baruch 2:31''s given heart and hearing ears are Ezekiel''s heart of flesh replacing the stony heart of the stiffnecked people.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 32, 'canon', 'ezekiel', 36, 27, 'free', E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* Baruch 2:32''s ''they shall praise me... and think upon my name'' is the fruit of Ezekiel''s indwelling Spirit causing them to walk in His statutes.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 34, 'canon', 'deuteronomy', 30, 6, 'free', E'Deuteronomy 30:6 — *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* Baruch 2:34''s regathering to the land of Abraham, Isaac and Jacob is the very return Moses sealed after the curse — circumcised heart and all.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 2, 35, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Baruch 2:35''s everlasting covenant — never again driven out — is grounded in Moses'' promised regathering of the scattered, the two-house return.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-2-curses-of-the-law',
       E'The curses written in the law of Moses are come upon us',
       E'Baruch turns the captivity into a confession that is no new thing — it is the very sentence Moses set in the book, fallen due. *To bring upon us great plagues, such as never happened under the whole heaven, as it came to pass in Jerusalem, according to the things that were written in the law of Moses;* (Baruch 2:2), and *For all these plagues are come upon us, which Yahuah (God) has pronounced against us* (Baruch 2:7). Moses had sealed it generations before: *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* (Deuteronomy 28:15), and the scattering itself — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* (Deuteronomy 28:64). Leviticus had spoken the same covenant-curse: *But if ye will not hearken unto me, and will not do all these commandments;* (Leviticus 26:14). Daniel, praying the same captivity, names the source by name: *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* (Daniel 9:11). It ain''t new — Baruch is only reading aloud the bond Moses wrote.',
       sv.verse_id, ev.verse_id, 'extras', 60725
  FROM _session253_bar2_lookup sv, _session253_bar2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-2-eat-flesh-of-son',
       E'A man should eat the flesh of his own son — the siege foretold',
       E'The most terrible clause of the broken covenant is named flatly: *That a man should eat the flesh of his own son, and the flesh of his own daughter.* (Baruch 2:3). This is no fresh horror invented by Babylon; it is the exact word Moses wrote into the curse of the siege: *And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee:* (Deuteronomy 28:53). Leviticus 26 had set the same sign over a people that would not hearken: *And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat.* (Leviticus 26:29). Baruch is not reporting a new judgment but acknowledging that the most fearful line of the book has been read into history.',
       sv.verse_id, ev.verse_id, 'extras', 60728
  FROM _session253_bar2_lookup sv, _session253_bar2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-2-righteousness-his-shame-ours',
       E'To Yahuah belongeth righteousness, to us open shame',
       E'The heart of the confession is that God is just and the people are not — the very shape of Daniel''s prayer. *To Yahuah (God), our Elohim (God) appertaineth righteousness: but to us and to our fathers open shame, as appears this day.* (Baruch 2:6); *Wherefore Yahuah (God) watched over us for evil, and Yahuah (God) has brought it upon us: for Yahuah (God) is righteous in all his works which he has commanded us.* (Baruch 2:9); *Yet we have not hearkened to his voice, to walk in the commandments of Yahuah (God), that he has set before us.* (Baruch 2:10). Daniel 9 prays it in the same breath: *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day...* (Daniel 9:7), *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* (Daniel 9:14), *Neither have we obeyed the voice of Yahuah Eloheinu (the LORD our God), to walk in his laws, which he set before us by his servants the prophets.* (Daniel 9:10). The two confessions are twins — repentance that justifies God and accuses self, never law-as-curse but law honoured even in the breaking.',
       sv.verse_id, ev.verse_id, 'extras', 60731
  FROM _session253_bar2_lookup sv, _session253_bar2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-2-mercy-for-thy-names-sake',
       E'Deliver us for thy Name''s sake',
       E'The plea does not lean on the people''s worthiness but on God''s own Name and glory among the nations. *Hear our prayers, O Yahuah (God), and our petitions, and deliver us for your own sake, and give us favour in the sight of them which have led us away:* (Baruch 2:14); *That all the earth may know that you are Yahuah (God), our Elohim (God), because Yashar''el (Israel) and his posterity is called by your name.* (Baruch 2:15); *Therefore we do not make our humble supplication before you, O Yahuah (God), our Elohim (God), for the righteousness of our fathers, and of our kings.* (Baruch 2:19). Daniel prays the identical ground: *Now therefore, O our Elohim (God), hear the prayer of thy servant, and his supplications, and cause thy face to shine upon thy sanctuary that is desolate, for Yahuah''s (Lord''s) sake.* (Daniel 9:17); *O my Elohim (God), incline thine ear, and hear; open thine eyes, and behold our desolations, and the city which is called by thy name: for we do not present our supplications before thee for our righteousnesses, but for thy great mercies.* (Daniel 9:18); *O Yahuah (Lord), hear; O Yahuah (Lord), forgive; O Yahuah (Lord), hearken and do; defer not, for thine own sake, O my Elohim (God): for thy city and thy people are called by thy name.* (Daniel 9:19). Mercy is real but never cheap — it is begged for the sake of the Name set upon the people, not the merit of the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 60734
  FROM _session253_bar2_lookup sv, _session253_bar2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-2-new-heart-everlasting-covenant',
       E'I will give them a heart and ears to hear — the everlasting covenant',
       E'The confession does not end in the grave of exile but in promise: the God who scattered will give a new heart, gather the children, and bind an everlasting covenant. *And shall know that I am Yahuah (God), their Elohim (God): for I will give them an heart, and ears to hear:* (Baruch 2:31), *And I will bring them again into the land which I promised with an oath to their fathers, Abraham, Isaac, and Jacob...* (Baruch 2:34), *And I will make an everlasting covenant with them to be their Elohim (God), and they shall be my people: and I will no more drive my people of Yashar''el (Israel) out of the land that I have given them.* (Baruch 2:35). Jeremiah had spoken the new-covenant heart: *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). Ezekiel made the heart of stone a heart of flesh with the indwelling Spirit: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26), *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). And Moses himself had sealed the return at the end of the curse — the circumcised heart and the regathering: *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). The gathering of the children and the new heart is the two-house restoration of Israel, not its replacement — the everlasting covenant Baruch 2:35 names is the one the prophets all sing.',
       sv.verse_id, ev.verse_id, 'extras', 60737
  FROM _session253_bar2_lookup sv, _session253_bar2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=2 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-2-curses-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* The plagues Baruch 2:2 says came ''according to the things that were written in the law of Moses'' are exactly these threatened curses falling due.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-curses-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:64 — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* Baruch 2:4''s subjection and scattering ''among all the people round about'' is this Mosaic dispersal coming to pass.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-curses-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:14 — *But if ye will not hearken unto me, and will not do all these commandments;* Baruch 2:7''s ''all these plagues are come upon us'' answers the very condition Leviticus set for the covenant-curse to fall.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-curses-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 9:11 — *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* Daniel, in the same exile, names the law of Moses as the bond whose curse Baruch 2:2 says is now fulfilled in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-curses-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-2-eat-flesh-of-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:53 — *And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee:* Baruch 2:3 quotes the siege-curse of Moses almost word for word, confessing it has come to pass.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-eat-flesh-of-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:29 — *And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat.* The same dreadful sign of a covenant broken stands behind Baruch 2:3 — it ain''t new, it was written into the law.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-eat-flesh-of-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-2-righteousness-his-shame-ours
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar''el (Israel), that are near, and that are far off, through all the countries whither thou hast driven them, because of their trespass that they have trespassed against thee.* Baruch 2:6''s ''to Yahuah appertaineth righteousness: but to us... open shame'' is Daniel''s confession in the same words.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-righteousness-his-shame-ours'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:14 — *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* Baruch 2:9''s ''Yahuah watched over us for evil... for Yahuah is righteous in all his works'' echoes Daniel almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-righteousness-his-shame-ours'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:10 — *Neither have we obeyed the voice of Yahuah Eloheinu (the LORD our God), to walk in his laws, which he set before us by his servants the prophets.* Baruch 2:10''s ''we have not hearkened to his voice, to walk in the commandments... that he has set before us'' is the same self-accusation.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-righteousness-his-shame-ours'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-2-mercy-for-thy-names-sake
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:17 — *Now therefore, O our Elohim (God), hear the prayer of thy servant, and his supplications, and cause thy face to shine upon thy sanctuary that is desolate, for Yahuah''s (Lord''s) sake.* Baruch 2:14''s ''deliver us for your own sake'' rests on the same plea — for God''s sake, not the petitioner''s.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-mercy-for-thy-names-sake'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:18 — *O my Elohim (God), incline thine ear, and hear; open thine eyes, and behold our desolations, and the city which is called by thy name: for we do not present our supplications before thee for our righteousnesses, but for thy great mercies.* Baruch 2:19''s refusal to plead ''for the righteousness of our fathers'' is Daniel''s exact disavowal of merit, leaning on great mercy alone.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-mercy-for-thy-names-sake'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:19 — *O Yahuah (Lord), hear; O Yahuah (Lord), forgive; O Yahuah (Lord), hearken and do; defer not, for thine own sake, O my Elohim (God): for thy city and thy people are called by thy name.* Baruch 2:15 grounds the plea in the same fact — that Israel ''is called by your name'' — so the Name''s honour is at stake.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-mercy-for-thy-names-sake'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-2-new-heart-everlasting-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Baruch 2:31''s promise ''I will give them an heart, and ears to hear'' is Jeremiah''s new-covenant law written on the inward heart.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-new-heart-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* Baruch 2:31''s given heart and hearing ears are Ezekiel''s heart of flesh replacing the stony heart of the stiffnecked people.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-new-heart-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* Baruch 2:32''s ''they shall praise me... and think upon my name'' is the fruit of Ezekiel''s indwelling Spirit causing them to walk in His statutes.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-new-heart-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:6 — *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* Baruch 2:34''s regathering to the land of Abraham, Isaac and Jacob is the very return Moses sealed after the curse — circumcised heart and all.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-new-heart-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Baruch 2:35''s everlasting covenant — never again driven out — is grounded in Moses'' promised regathering of the scattered, the two-house return.'
  FROM cross_reference_threads t, cross_references x, _session253_bar2_lookup sv, _session253_bar2_lookup tv
 WHERE t.slug='baruch-2-new-heart-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=2 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_baruchwiththeletterofjeremiah_03.sql (session253 baruch-with-the-letter-of-jeremiah 3) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar3 (view _session253_bar3_lookup). Sort band base 60750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-3-fountain-of-wisdom
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 12, 'canon', 'jeremiah', 2, 12, 'free', E'Jeremiah 2:12 — *Be astonished, O ye heavens, at this, and be horribly afraid, be ye very desolate, saith Yahuah (LORD).* Jeremiah''s heavens are summoned to be astonished at the very crime Baruch 3:12 confesses — Israel forsaking the fountain.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 9, 'canon', 'proverbs', 1, 20, 'free', E'Proverbs 1:20 — *Wisdom crieth without; she uttereth her voice in the streets:* the same Wisdom Baruch 3:9 bids Israel hear has been crying aloud all along, never hidden from the one who would listen.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 9, 'canon', 'proverbs', 1, 22, 'free', E'Proverbs 1:22 — *How long, ye simple ones, will ye love simplicity? and the scorners delight in their scorning, and fools hate knowledge?* Wisdom''s reproach in Proverbs is the rebuke beneath Baruch 3:9''s summons to give ear and understand.'),
  -- thread: baruch-3-where-is-wisdom-found
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 15, 'canon', 'job', 28, 12, 'free', E'Job 28:12 — *But where shall wisdom be found? and where is the place of understanding?* Job''s question is Baruch 3:15''s question exactly — who has found out her place.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 17, 'canon', 'job', 28, 15, 'free', E'Job 28:15 — *It cannot be gotten for gold, neither shall silver be weighed for the price thereof.* The silver-hoarders of Baruch 3:17 could never purchase the wisdom Job says no gold can buy.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 14, 'canon', 'proverbs', 8, 11, 'free', E'Proverbs 8:11 — wisdom is better than rubies; Baruch 3:14 sends Israel to learn where she is, for she is worth more than the strength and length of days men chase without her.'),
  -- thread: baruch-3-princes-and-giants-perished
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 16, 'canon', '1-corinthians', 2, 6, 'free', E'1 Corinthians 2:6 — *Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought:* Paul''s princes who come to nought are Baruch 3:16''s vanished princes of the heathen, ruling without the way of knowledge.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 28, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The mighty perish through their own foolishness in Baruch 3:28 precisely because the hidden Wisdom was never given them to know.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 26, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of God came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The famous giants of Baruch 3:26 are the Nephilim of Genesis, mighty in war yet destroyed for want of wisdom.'),
  -- thread: baruch-3-not-in-heaven-nor-beyond-the-sea
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 29, 'canon', 'deuteronomy', 30, 12, 'free', E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* Baruch 3:29''s ''who has gone up into heaven'' is Moses'' own rhetorical climb, answered: the word need not be fetched down.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 30, 'canon', 'deuteronomy', 30, 13, 'free', E'Deuteronomy 30:13 — *Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* Baruch 3:30''s voyage over the sea for wisdom is the very crossing Moses says is unnecessary, for the word is already given.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 31, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* Where Baruch 3:31 says no man knows her way, Moses answers that the word-wisdom is set as near as the mouth and the heart.'),
  -- thread: baruch-3-he-that-knoweth-all-things
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 32, 'canon', 'job', 28, 23, 'free', E'Job 28:23 — *Elohim (God) understandeth the way thereof, and he knoweth the place thereof.* Job''s verdict is Baruch 3:32 exactly: the One who knoweth all things alone has found wisdom''s way out.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 32, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* The Maker who ''prepared the earth'' and found out wisdom in Baruch 3:32 is the same who possessed her before the works of old.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 34, 'canon', 'proverbs', 8, 27, 'free', E'Proverbs 8:27 — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth:* the stars that answer ''Here we be'' in Baruch 3:34 were set in heavens Wisdom watched her Maker prepare.'),
  -- thread: baruch-3-shewed-himself-upon-earth
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Baruch 3:37''s Wisdom who ''shewed himself upon earth, and conversed with men'' is the Word made flesh who dwelt among us.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 36, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Sirach 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Sirach''s Wisdom given to dwell in Jacob is the very Wisdom Baruch 3:36 says was given to Jacob his servant.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 36, 'canon', 'proverbs', 8, 31, 'free', E'Proverbs 8:31 — *Rejoicing in the habitable part of his earth; and my delights were with the sons of men.* The Wisdom given to Israel in Baruch 3:36 is she whose delight was always with the sons of men, foreshadowing the conversing of 3:37.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* The One who shewed himself upon earth in Baruch 3:37 is the pre-existent Wisdom-Logos by whom all things hold together.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-fountain-of-wisdom',
       E'Israel forsook the fountain of wisdom',
       E'Baruch turns from the captives'' confession to the heart of the matter: *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom* (Baruch 3:9) — *That you are counted with them that go down into the grave?* (Baruch 3:11) — *You have forsaken the fountain of wisdom* (Baruch 3:12) — *For if you had walked in the way of Yahuah (God), you should have dwelled in peace for ever* (Baruch 3:13). The diagnosis is not new. Jeremiah had already named the double crime: *Be astonished, O ye heavens, at this, and be horribly afraid, be ye very desolate, saith Yahuah (LORD)* (Jeremiah 2:12) — for they forsook the fountain of living waters and hewed out broken cisterns. And the fountain still cries aloud in the streets to the simple: *Wisdom crieth without; she uttereth her voice in the streets* (Proverbs 1:20), *How long, ye simple ones, will ye love simplicity? and the scorners delight in their scorning, and fools hate knowledge?* (Proverbs 1:22). Wisdom here is Torah — the commandments of life — and to forsake her is to choose the grave. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60750
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-where-is-wisdom-found',
       E'Where shall wisdom be found',
       E'Baruch asks the oldest question: *Learn where is wisdom, where is strength, where is understanding* (Baruch 3:14) — *Who has found out her place? or who has come into her treasures?* (Baruch 3:15). This is Job''s question, word for word in spirit: *But where shall wisdom be found? and where is the place of understanding?* (Job 28:12). Job has already searched the mines and the deep and found that *It cannot be gotten for gold, neither shall silver be weighed for the price thereof* (Job 28:15). The merchants and the princes who *hoarded up silver and gold* (Baruch 3:17) never bought her. It ain''t new — Baruch is singing Job''s twenty-eighth chapter back to the exiles.',
       sv.verse_id, ev.verse_id, 'extras', 60753
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-princes-and-giants-perished',
       E'The princes and the giants perished without her',
       E'Baruch surveys the dead who ruled without wisdom: *Where are the princes of the heathen become, and such as ruled the beasts upon the earth* (Baruch 3:16) — *There were the giants famous from the beginning, that were of so great stature, and so expert in war* (Baruch 3:26) — *Those did not Yahuah (God) choose, neither gave he the way of knowledge to them* (Baruch 3:27) — *But they were destroyed, because they had no wisdom, and perished through their own foolishness* (Baruch 3:28). The giants are the Nephilim of the days before the flood, the mighty men of renown — and their end is the same as Paul''s verdict on the rulers of this age: *Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought* (1 Corinthians 2:6), *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). Power without wisdom always comes to nought. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60756
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-not-in-heaven-nor-beyond-the-sea',
       E'Not in heaven, nor beyond the sea',
       E'Baruch asks who can ascend or cross the deep to fetch her: *Who has gone up into heaven, and taken her, and brought her down from the clouds?* (Baruch 3:29) — *Who has gone over the sea, and found her, and will bring her for pure gold?* (Baruch 3:30) — *No man knoweth her way, nor thinketh of her path* (Baruch 3:31). This is Moses'' word at the end of Deuteronomy, only flipped to its glory: the commandment is NOT out of reach. *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:12) — *Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:13) — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). No man can climb to wisdom or sail to her — yet Yahuah set her near in the Torah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60759
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-he-that-knoweth-all-things',
       E'He that knoweth all things found her out',
       E'If no man can reach wisdom, One can: *But he that knoweth all things knoweth her, and has found her out with his understanding: he that prepared the earth for evermore has filled it with fourfooted beasts* (Baruch 3:32) — *He that sends forth light, and it goes, calls it again, and it obeyeth him with fear* (Baruch 3:33) — *The stars shined in their watches, and rejoiced: when he calls them, they say, Here we be; and so with cheerfulness they shewed light to him that made them* (Baruch 3:34). The Maker who possesses Wisdom is the same who possessed her at creation: *Elohim (God) understandeth the way thereof, and he knoweth the place thereof* (Job 28:23). And Wisdom answers from before the world: *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22) — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27). The stars that come at His call in Baruch 3:34 are the same heavens Wisdom watched Him stretch. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60762
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-shewed-himself-upon-earth',
       E'Afterward he shewed himself upon earth',
       E'The chapter crowns its hymn to Wisdom with the line the early church could not stop quoting: *This is our Elohim (God), and there shall none other be accounted of in comparison of him* (Baruch 3:35) — *He has found out all the way of knowledge, and has given it to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36) — *Afterward did he shew himself upon earth, and conversed with men* (Baruch 3:37). The Wisdom given to Jacob is Torah, and that same Wisdom came and dwelt: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). Sirach already heard Wisdom say where she was sent to abide: *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Sirach 24:8). And Paul names the Wisdom by whom all was made: *And he is before all things, and by him all things consist* (Colossians 1:17), the same who *rejoicing in the habitable part of his earth; and my delights were with the sons of men* (Proverbs 8:31). Wisdom = Torah = the Logos who came and conversed with men. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60765
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-3-fountain-of-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 2:12 — *Be astonished, O ye heavens, at this, and be horribly afraid, be ye very desolate, saith Yahuah (LORD).* Jeremiah''s heavens are summoned to be astonished at the very crime Baruch 3:12 confesses — Israel forsaking the fountain.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-fountain-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 1:20 — *Wisdom crieth without; she uttereth her voice in the streets:* the same Wisdom Baruch 3:9 bids Israel hear has been crying aloud all along, never hidden from the one who would listen.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-fountain-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:22 — *How long, ye simple ones, will ye love simplicity? and the scorners delight in their scorning, and fools hate knowledge?* Wisdom''s reproach in Proverbs is the rebuke beneath Baruch 3:9''s summons to give ear and understand.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-fountain-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-where-is-wisdom-found
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:12 — *But where shall wisdom be found? and where is the place of understanding?* Job''s question is Baruch 3:15''s question exactly — who has found out her place.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-where-is-wisdom-found'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 28:15 — *It cannot be gotten for gold, neither shall silver be weighed for the price thereof.* The silver-hoarders of Baruch 3:17 could never purchase the wisdom Job says no gold can buy.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-where-is-wisdom-found'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:11 — wisdom is better than rubies; Baruch 3:14 sends Israel to learn where she is, for she is worth more than the strength and length of days men chase without her.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-where-is-wisdom-found'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-princes-and-giants-perished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:6 — *Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought:* Paul''s princes who come to nought are Baruch 3:16''s vanished princes of the heathen, ruling without the way of knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-princes-and-giants-perished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The mighty perish through their own foolishness in Baruch 3:28 precisely because the hidden Wisdom was never given them to know.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-princes-and-giants-perished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of God came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The famous giants of Baruch 3:26 are the Nephilim of Genesis, mighty in war yet destroyed for want of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-princes-and-giants-perished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-not-in-heaven-nor-beyond-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* Baruch 3:29''s ''who has gone up into heaven'' is Moses'' own rhetorical climb, answered: the word need not be fetched down.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-not-in-heaven-nor-beyond-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:13 — *Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* Baruch 3:30''s voyage over the sea for wisdom is the very crossing Moses says is unnecessary, for the word is already given.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-not-in-heaven-nor-beyond-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* Where Baruch 3:31 says no man knows her way, Moses answers that the word-wisdom is set as near as the mouth and the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-not-in-heaven-nor-beyond-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-he-that-knoweth-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:23 — *Elohim (God) understandeth the way thereof, and he knoweth the place thereof.* Job''s verdict is Baruch 3:32 exactly: the One who knoweth all things alone has found wisdom''s way out.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-he-that-knoweth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* The Maker who ''prepared the earth'' and found out wisdom in Baruch 3:32 is the same who possessed her before the works of old.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-he-that-knoweth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:27 — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth:* the stars that answer ''Here we be'' in Baruch 3:34 were set in heavens Wisdom watched her Maker prepare.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-he-that-knoweth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-shewed-himself-upon-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Baruch 3:37''s Wisdom who ''shewed himself upon earth, and conversed with men'' is the Word made flesh who dwelt among us.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Sirach''s Wisdom given to dwell in Jacob is the very Wisdom Baruch 3:36 says was given to Jacob his servant.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:31 — *Rejoicing in the habitable part of his earth; and my delights were with the sons of men.* The Wisdom given to Israel in Baruch 3:36 is she whose delight was always with the sons of men, foreshadowing the conversing of 3:37.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* The One who shewed himself upon earth in Baruch 3:37 is the pre-existent Wisdom-Logos by whom all things hold together.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_baruchwiththeletterofjeremiah_04.sql (session253 baruch-with-the-letter-of-jeremiah 4) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar4 (view _session253_bar4_lookup). Sort band base 60775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-4-book-of-the-commandments
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'canon', 'leviticus', 18, 5, 'free', E'Leviticus 18:5 — *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* The Torah is the law of life Baruch 4:1 names, the keeping of which is to come to life.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'canon', 'psalms', 19, 7, 'free', E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The same perfect, soul-converting law that endureth for ever is the wisdom Baruch 4:1 holds out as the book of the commandments.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The commandment is not far off but near and keepable, exactly the take-hold-of-it nearness Baruch 4:1-2 presses.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 2, 'canon', 'deuteronomy', 30, 12, 'free', E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* The light is not beyond reach to be fetched; turn and take hold of it, says Baruch 4:2.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 2, 'canon', 'romans', 10, 6, 'free', E'Romans 10:6 — *But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* Paul reads Moses'' near-word as faith laying hold of the same Wisdom Baruch 4:2 calls Jacob to take hold of.'),
  -- thread: baruch-4-sacrificing-to-devils
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 7, 'canon', 'deuteronomy', 32, 17, 'free', E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* The Song of Moses is the very indictment Baruch 4:7 repeats: sacrificing to devils, not to Yahuah.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 7, 'canon', 'psalms', 106, 37, 'free', E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalter names the demonic worship that provoked the wrath Baruch 4:6-7 says delivered Israel to the enemies.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 7, 'canon', '1-corinthians', 10, 20, 'free', E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Paul confirms Baruch 4:7''s framework — idolatry is fellowship with devils, the system of dead gods, never to be shared.'),
  -- thread: baruch-4-jerusalem-the-widow
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 12, 'canon', 'lamentations', 1, 1, 'free', E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed, forsaken Zion of Baruch 4:12 is the solitary widow-city Jeremiah already wept over.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 10, 'canon', 'lamentations', 1, 16, 'free', E'Lamentations 1:16 — *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* Zion''s weeping over desolate children matches Baruch 4:10''s captivity of her sons and daughters.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 12, 'canon', 'lamentations', 1, 5, 'free', E'Lamentations 1:5 — *Her adversaries are the chief, her enemies prosper; for Yahuah (LORD) hath afflicted her for the multitude of her transgressions: her children are gone into captivity before the enemy.* Baruch 4:12 gives the same reason for the desolation: the children departed from the law and were carried away.'),
  -- thread: baruch-4-mercy-shall-soon-come
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 22, 'canon', 'isaiah', 40, 1, 'free', E'Isaiah 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* The mercy soon to come from the Everlasting Saviour in Baruch 4:22 is the very comfort Isaiah is commanded to speak to Yahuah''s people.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 22, 'canon', 'isaiah', 66, 13, 'free', E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* The joy-from-the-Holy-One of Baruch 4:22 is Yahuah''s mother-comfort poured out in Jerusalem.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 23, 'canon', 'isaiah', 54, 7, 'free', E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* Baruch 4:23''s sending-out with weeping and giving-back with joy is the brief forsaking and great-mercy gathering Isaiah promises the widow-city.'),
  -- thread: baruch-4-tread-upon-his-neck
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 28, 'canon', 'deuteronomy', 30, 2, 'free', E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* Baruch 4:28''s call to return and seek him ten times more is Moses'' wholehearted return that turns the captivity.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 25, 'canon', 'isaiah', 51, 23, 'free', E'Isaiah 51:23 — *But I will put it into the hand of them that afflict thee; which have said to thy soul, Bow down, that we may go over: and thou hast laid thy body as the ground, and as the street, to them that went over.* The cup passes to the persecutor, and the once-trodden tread upon the enemy''s neck, just as Baruch 4:25 foresees his destruction.'),
  -- thread: baruch-4-look-toward-the-east
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37, 'canon', 'isaiah', 43, 5, 'free', E'Isaiah 43:5 — *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* Baruch 4:37''s sons gathered from east to west are the seed Yahuah promises to bring from the east and gather from the west.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37, 'canon', 'isaiah', 43, 6, 'free', E'Isaiah 43:6 — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* The four-winds regathering of sons and daughters in Isaiah is the very return Baruch 4:37 sees coming by the word of the Holy One.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36, 'canon', 'isaiah', 49, 18, 'free', E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* Baruch 4:36''s call to Jerusalem to look and behold the coming joy is Isaiah''s lift-up-thine-eyes upon the gathering children.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons-from-far and daughters returning to Zion are the regathered children Baruch 4:36-37 bids Jerusalem look east to behold.'),
  -- thread: baruch-4-happy-art-thou-israel
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 4, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The things pleasing to Yahuah made known in Baruch 4:4 are the life-and-good Moses set before Israel to choose.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 4, 'canon', 'romans', 10, 2, 'free', E'Romans 10:2 — *For I bear them record that they have a zeal of Elohim (God), but not according to knowledge.* Paul honours the very knowledge of Elohim entrusted to Israel that Baruch 4:4 calls happy — the honour not to be handed to a strange nation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-book-of-the-commandments',
       E'The book of the commandments, the law that endureth for ever',
       E'Wisdom is not an abstraction but a book you can hold and keep: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* (Baruch 4:1) — *Turn you, O Jacob, and take hold of it: walk in the presence of the light thereof, that you may be illuminated.* (Baruch 4:2). Moses already set it this near and this plain: *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14), having denied it was hidden — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:12) — the very text Paul re-reads of the righteousness of faith, *Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* (Romans 10:6). The law is the law of life, never the law-as-curse: *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5), and *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalms 19:7). It ain''t new — Wisdom and Torah are one book.',
       sv.verse_id, ev.verse_id, 'extras', 60775
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-sacrificing-to-devils',
       E'They provoked him by sacrificing to devils, not to Yahuah',
       E'The exile''s root is named without flinching: *You were sold to the nations, not for your destruction: but because you moved Yahuah (God) to wrath, you were delivered to the enemies.* (Baruch 4:6) — *For you provoked him that made you by sacrificing to devils, and not to Yahuah (God).* (Baruch 4:7). The charge is the Song of Moses verbatim in spirit: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). The Psalter records the cost of that whoring: *Yea, they sacrificed their sons and their daughters unto devils,* (Psalms 106:37). And Paul, dismantling the System of dead gods, says the same of all idol-worship: *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* (1 Corinthians 10:20). The polemic is against the demonic system, not a people — and the discipline is fatherly, *not for your destruction*.',
       sv.verse_id, ev.verse_id, 'extras', 60778
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-jerusalem-the-widow',
       E'Jerusalem the widow, left desolate of her children',
       E'Mother Zion speaks as a bereaved widow: *Let no man rejoice over me, a widow, and forsaken of many, who for the sins of my children am left desolate; because they departed from the law of Yahuah (God).* (Baruch 4:12) — *For I saw the captivity of my sons and daughters, which the Everlasting brought upon them.* (Baruch 4:10). Lamentations sang it first: *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* (Lamentations 1:1), and *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* (Lamentations 1:16). The cause is the same — *Her adversaries are the chief, her enemies prosper; for Yahuah (LORD) hath afflicted her for the multitude of her transgressions: her children are gone into captivity before the enemy.* (Lamentations 1:5). The grief is real; so is the turn that follows.',
       sv.verse_id, ev.verse_id, 'extras', 60781
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-mercy-shall-soon-come',
       E'Be of good cheer: mercy and salvation shall soon come',
       E'The lament breaks into hope without going cheap: *For my hope is in the Everlasting, that he will save you; and joy is come to me from the Holy One, because of the mercy which shall soon come to you from the Everlasting our Saviour.* (Baruch 4:22) — *For I sent you out with mourning and weeping: but Yahuah (God) will give you to me again with joy and gladness for ever.* (Baruch 4:23). This is Isaiah''s gospel of comfort: *Comfort ye, comfort ye my people, saith your Elohim (God).* (Isaiah 40:1), and the mother-tenderness of *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* (Isaiah 66:13). The forsaking is a moment; the gathering is everlasting: *For a small moment have I forsaken thee; but with great mercies will I gather thee.* (Isaiah 54:7). Mercy soon-coming, mourning turned to joy — the same Everlasting Saviour.',
       sv.verse_id, ev.verse_id, 'extras', 60784
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-tread-upon-his-neck',
       E'Return and seek him: the enemy''s destruction, the foe''s mourning',
       E'Patient endurance is promised vindication, and repentance is real turning: *My children, suffer patiently the wrath that is come upon you from Yahuah (God): for your enemy has persecuted you; but shortly you shall see his destruction, and shall tread upon his neck.* (Baruch 4:25) — *For as it was your mind to go astray from Yahuah (God): so, being returned, seek him ten times more.* (Baruch 4:28). The seek-him-and-return is Moses'' own promise of restored captivity: *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* (Deuteronomy 30:2). The cup of fury passes to the persecutor: *But I will put it into the hand of them that afflict thee; which have said to thy soul, Bow down, that we may go over: and thou hast laid thy body as the ground, and as the street, to them that went over.* (Isaiah 51:23) — the trodden become the treaders, *shall tread upon his neck*. The mercy is never cheap; the turning is wholehearted.',
       sv.verse_id, ev.verse_id, 'extras', 60787
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-look-toward-the-east',
       E'Look toward the east: thy children gathered from east and west',
       E'The chapter ends in the two-house regathering: *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* (Baruch 4:36) — *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* (Baruch 4:37). This is Isaiah''s gathering from the four winds: *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* (Isaiah 43:5) — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* (Isaiah 43:6). It is the widow-city told to lift her eyes and count returning children: *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* (Isaiah 49:18), and *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* (Isaiah 60:4). Not a church replacing Israel — the scattered sons and daughters of the two houses, gathered home by the word of the Holy One.',
       sv.verse_id, ev.verse_id, 'extras', 60790
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-happy-art-thou-israel',
       E'Happy art thou, O Israel: the things pleasing to Yahuah made known',
       E'Election is a gift to be guarded, not bartered: *Give not yours honour to another, nor the things that are profitable to you to a strange nation.* (Baruch 4:3) — *O Yashar''el (Israel), happy are we: for things that are pleasing to Yahuah (God) are made known to us.* (Baruch 4:4). It is Moses'' wonder that the near, doable word was given to this people: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15). And it carries the Torah-witness Paul still grants Israel — *For I bear them record that they have a zeal of Elohim (God), but not according to knowledge.* (Romans 10:2) — the honour not to be given to another, the knowledge of what pleases Yahuah, kept within the covenant people.',
       sv.verse_id, ev.verse_id, 'extras', 60793
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-4-book-of-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:5 — *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* The Torah is the law of life Baruch 4:1 names, the keeping of which is to come to life.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The same perfect, soul-converting law that endureth for ever is the wisdom Baruch 4:1 holds out as the book of the commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The commandment is not far off but near and keepable, exactly the take-hold-of-it nearness Baruch 4:1-2 presses.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* The light is not beyond reach to be fetched; turn and take hold of it, says Baruch 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 10:6 — *But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* Paul reads Moses'' near-word as faith laying hold of the same Wisdom Baruch 4:2 calls Jacob to take hold of.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-sacrificing-to-devils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* The Song of Moses is the very indictment Baruch 4:7 repeats: sacrificing to devils, not to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-sacrificing-to-devils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalter names the demonic worship that provoked the wrath Baruch 4:6-7 says delivered Israel to the enemies.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-sacrificing-to-devils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Paul confirms Baruch 4:7''s framework — idolatry is fellowship with devils, the system of dead gods, never to be shared.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-sacrificing-to-devils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-jerusalem-the-widow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed, forsaken Zion of Baruch 4:12 is the solitary widow-city Jeremiah already wept over.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-jerusalem-the-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:16 — *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* Zion''s weeping over desolate children matches Baruch 4:10''s captivity of her sons and daughters.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-jerusalem-the-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 1:5 — *Her adversaries are the chief, her enemies prosper; for Yahuah (LORD) hath afflicted her for the multitude of her transgressions: her children are gone into captivity before the enemy.* Baruch 4:12 gives the same reason for the desolation: the children departed from the law and were carried away.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-jerusalem-the-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-mercy-shall-soon-come
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* The mercy soon to come from the Everlasting Saviour in Baruch 4:22 is the very comfort Isaiah is commanded to speak to Yahuah''s people.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-mercy-shall-soon-come'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* The joy-from-the-Holy-One of Baruch 4:22 is Yahuah''s mother-comfort poured out in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-mercy-shall-soon-come'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* Baruch 4:23''s sending-out with weeping and giving-back with joy is the brief forsaking and great-mercy gathering Isaiah promises the widow-city.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-mercy-shall-soon-come'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-tread-upon-his-neck
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* Baruch 4:28''s call to return and seek him ten times more is Moses'' wholehearted return that turns the captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-tread-upon-his-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:23 — *But I will put it into the hand of them that afflict thee; which have said to thy soul, Bow down, that we may go over: and thou hast laid thy body as the ground, and as the street, to them that went over.* The cup passes to the persecutor, and the once-trodden tread upon the enemy''s neck, just as Baruch 4:25 foresees his destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-tread-upon-his-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-look-toward-the-east
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:5 — *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* Baruch 4:37''s sons gathered from east to west are the seed Yahuah promises to bring from the east and gather from the west.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 43:6 — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* The four-winds regathering of sons and daughters in Isaiah is the very return Baruch 4:37 sees coming by the word of the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* Baruch 4:36''s call to Jerusalem to look and behold the coming joy is Isaiah''s lift-up-thine-eyes upon the gathering children.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons-from-far and daughters returning to Zion are the regathered children Baruch 4:36-37 bids Jerusalem look east to behold.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-happy-art-thou-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The things pleasing to Yahuah made known in Baruch 4:4 are the life-and-good Moses set before Israel to choose.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-happy-art-thou-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 10:2 — *For I bear them record that they have a zeal of Elohim (God), but not according to knowledge.* Paul honours the very knowledge of Elohim entrusted to Israel that Baruch 4:4 calls happy — the honour not to be handed to a strange nation.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-happy-art-thou-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_baruchwiththeletterofjeremiah_05.sql (session253 baruch-with-the-letter-of-jeremiah 5) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar5 (view _session253_bar5_lookup). Sort band base 60800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-5-robe-of-righteousness
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'canon', 'isaiah', 52, 1, 'free', E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Baruch 5:1''s command to put off mourning and put on glory is Isaiah''s very summons to Jerusalem to change her garments.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'canon', 'isaiah', 61, 10, 'free', E'Isaiah 61:10 — *I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels.* The robe of righteousness that *comes from Yahuah* in Baruch 5:1-2 is Isaiah''s garment of salvation, given not earned.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 2, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Baruch''s exchange of the garment of mourning for the garment of glory is the beauty-for-ashes Yahuah appoints to Zion''s mourners.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The mourning city of Baruch 5:1, re-clothed in glory, is the adorned bride John beholds at the last.'),
  -- thread: baruch-5-new-name-diadem
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 2, 'canon', 'isaiah', 62, 3, 'free', E'Isaiah 62:3 — *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God).* The diadem of the glory of the Everlasting set on Jerusalem''s head in Baruch 5:2 is Isaiah''s royal diadem in the hand of her Elohim.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 4, 'canon', 'isaiah', 62, 2, 'free', E'Isaiah 62:2 — *And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name.* Baruch 5:4''s new name spoken by Yahuah, ''The peace of righteousness,'' is Isaiah''s new name which the mouth of Yahuah shall name.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 3, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* Baruch 5:3''s promise that Yahuah will show Jerusalem''s brightness to every country under heaven is Isaiah''s nations drawn to her risen light.'),
  -- thread: baruch-5-children-gathered-east-west
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* Baruch 5:5''s children gathered from west to east are Ezekiel''s children of Israel gathered on every side and brought back to their land.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'canon', 'isaiah', 49, 12, 'free', E'Isaiah 49:12 — *Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim.* The children Baruch 5:5 watches return from the west are Isaiah''s exiles coming from far, from every direction, to the waiting city.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 6, 'canon', 'isaiah', 49, 22, 'free', E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* Baruch 5:6''s children, led away on foot but brought back exalted with glory, are Isaiah''s sons borne home in arms and on shoulders.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'apocrypha', 'tobit', 13, 13, 'extras', E'Tobit 13:13 — *Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just.* Baruch 5:5''s children gathered home rejoicing in the remembrance of Yahuah are Tobit''s children of the just, gathered together to bless Him.'),
  -- thread: baruch-5-every-valley-filled
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'isaiah', 40, 4, 'free', E'Isaiah 40:4 — *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain:* Baruch 5:7''s hills cast down and valleys filled to make even ground is Isaiah''s levelled highway, prepared for the homecoming.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'isaiah', 40, 5, 'free', E'Isaiah 40:5 — *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together: for the mouth of Yahuah (LORD) hath spoken it.* The even road of Baruch 5:7, on which Israel goes safely ''in the glory of Yahuah,'' is the way on which Isaiah says that glory shall be revealed to all flesh.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'luke', 3, 5, 'free', E'Luke 3:5 — *Every valley shall be filled, and every mountain and hill shall be brought low; and the crooked shall be made straight, and the rough ways shall be made smooth;* The leveling of the land in Baruch 5:7 is the very prophecy the Baptist proclaims to prepare the way of Yahuah.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'luke', 3, 6, 'free', E'Luke 3:6 — *And all flesh shall see the salvation of Elohim (God).* Baruch 5:7''s safe homeward road in the glory of Yahuah ends where Luke does: all flesh seeing the salvation of Elohim.'),
  -- thread: baruch-5-led-home-in-light-and-mercy
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 8, 'canon', 'isaiah', 35, 1, 'free', E'Isaiah 35:1 — *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* Baruch 5:8''s woods and sweetsmelling trees overshadowing Israel are Isaiah''s wilderness made glad and blossoming for the returning people.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9, 'canon', 'isaiah', 35, 10, 'free', E'Isaiah 35:10 — *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* Baruch 5:9''s Israel led with joy in the light of His glory is Isaiah''s ransomed returning to Zion with everlasting joy, their sorrow fled away.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9, 'canon', 'isaiah', 60, 19, 'free', E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The light of His glory leading Israel home in Baruch 5:9 is Isaiah''s everlasting light, Yahuah Himself become her lamp.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-robe-of-righteousness',
       E'Put off mourning, put on the robe of righteousness',
       E'Baruch calls the bereaved city to be unrobed of her grief and clothed anew: *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever* (Baruch 5:1), *Cast about you a double garment of the righteousness which comes from Yahuah (God); and set a diadem on yours head of the glory of the Everlasting* (Baruch 5:2). It ain''t new — this is Isaiah''s bridal exchange. *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city* (Isaiah 52:1); *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10). The mourning of the captivity is ended and beauty given for ashes, and John sees the same city *coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The garment is not earned — it *comes from Yahuah*; the righteousness is His gift, the double for the double sorrow she had borne.',
       sv.verse_id, ev.verse_id, 'extras', 60800
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-new-name-diadem',
       E'The diadem and the new name of Jerusalem',
       E'The city receives a crown and a new title: *set a diadem on yours head of the glory of the Everlasting* (Baruch 5:2), and *For your name shall be called of Yahuah (God) for ever The peace of righteousness, and The glory of the worship of Yahuah (God)* (Baruch 5:4). Isaiah had promised both the royal crown and the renaming: *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2), *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God)* (Isaiah 62:3). The renamed, crowned city is no longer Forsaken but the *peace of righteousness* — the same righteousness-and-peace that meet when Yahuah brings His people home, and her brightness is shown to every country (Isaiah 60:3).',
       sv.verse_id, ev.verse_id, 'extras', 60803
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-children-gathered-east-west',
       E'Thy children gathered from the west to the east',
       E'The exiled city lifts her eyes and sees her scattered seed brought home: *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5), for *they departed from you on foot, and were led away of their enemies: but Yahuah (God) brings them to you exalted with glory, as children of the kingdom* (Baruch 5:6). This is the two-house regathering, not a church replacing Israel: Yahuah declares *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), making the divided kingdoms one nation again. Isaiah saw them streaming from every quarter — *these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim* (Isaiah 49:12) — borne home in arms and on shoulders (Isaiah 49:22). Tobit sang the same: *they shall be gathered together, and shall bless Yahuah (God) of the just* (Tobit 13:13). They left on foot in chains; they return carried in glory, as children of the kingdom.',
       sv.verse_id, ev.verse_id, 'extras', 60806
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-every-valley-filled',
       E'Every high hill cast down, the valleys filled',
       E'So that the returning exiles may walk home unhindered, the land itself is levelled: *For Yahuah (God) has appointed that every high hill, and banks of long continuance, should be cast down, and valleys filled up, to make even the ground, that Yashar''el (Israel) may go safely in the glory of Yahuah (God)* (Baruch 5:7). This is the highway of the prophets, word for word: *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain* (Isaiah 40:4), *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together* (Isaiah 40:5). The Baptist took up the same cry to prepare the way — *Every valley shall be filled, and every mountain and hill shall be brought low* (Luke 3:5), *And all flesh shall see the salvation of Elohim (God)* (Luke 3:6). The road that brings Israel home in glory is the road on which all flesh will see the salvation of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 60809
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-led-home-in-light-and-mercy',
       E'Led home in the light of His glory, with mercy and righteousness',
       E'The trees of the field shade the pilgrims, and Yahuah Himself is their guide: *Moreover even the woods and every sweetsmelling tree shall overshadow Yashar''el (Israel) by the commandment of Yahuah (God)* (Baruch 5:8), *For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory with the mercy and righteousness that comes from him* (Baruch 5:9). Isaiah''s ransomed return the same way — *and the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away* (Isaiah 35:10) — and the desert itself blossoms before them (Isaiah 35:1). The everlasting light is Yahuah Himself: *the sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19). The homecoming is led by joy, lit by glory, and carried by mercy — never cheap, always His.',
       sv.verse_id, ev.verse_id, 'extras', 60812
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-5-robe-of-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Baruch 5:1''s command to put off mourning and put on glory is Isaiah''s very summons to Jerusalem to change her garments.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:10 — *I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels.* The robe of righteousness that *comes from Yahuah* in Baruch 5:1-2 is Isaiah''s garment of salvation, given not earned.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Baruch''s exchange of the garment of mourning for the garment of glory is the beauty-for-ashes Yahuah appoints to Zion''s mourners.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The mourning city of Baruch 5:1, re-clothed in glory, is the adorned bride John beholds at the last.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-new-name-diadem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 62:3 — *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God).* The diadem of the glory of the Everlasting set on Jerusalem''s head in Baruch 5:2 is Isaiah''s royal diadem in the hand of her Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-new-name-diadem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:2 — *And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name.* Baruch 5:4''s new name spoken by Yahuah, ''The peace of righteousness,'' is Isaiah''s new name which the mouth of Yahuah shall name.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-new-name-diadem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* Baruch 5:3''s promise that Yahuah will show Jerusalem''s brightness to every country under heaven is Isaiah''s nations drawn to her risen light.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-new-name-diadem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-children-gathered-east-west
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* Baruch 5:5''s children gathered from west to east are Ezekiel''s children of Israel gathered on every side and brought back to their land.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:12 — *Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim.* The children Baruch 5:5 watches return from the west are Isaiah''s exiles coming from far, from every direction, to the waiting city.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* Baruch 5:6''s children, led away on foot but brought back exalted with glory, are Isaiah''s sons borne home in arms and on shoulders.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 13:13 — *Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just.* Baruch 5:5''s children gathered home rejoicing in the remembrance of Yahuah are Tobit''s children of the just, gathered together to bless Him.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-every-valley-filled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:4 — *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain:* Baruch 5:7''s hills cast down and valleys filled to make even ground is Isaiah''s levelled highway, prepared for the homecoming.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:5 — *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together: for the mouth of Yahuah (LORD) hath spoken it.* The even road of Baruch 5:7, on which Israel goes safely ''in the glory of Yahuah,'' is the way on which Isaiah says that glory shall be revealed to all flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 3:5 — *Every valley shall be filled, and every mountain and hill shall be brought low; and the crooked shall be made straight, and the rough ways shall be made smooth;* The leveling of the land in Baruch 5:7 is the very prophecy the Baptist proclaims to prepare the way of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 3:6 — *And all flesh shall see the salvation of Elohim (God).* Baruch 5:7''s safe homeward road in the glory of Yahuah ends where Luke does: all flesh seeing the salvation of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-led-home-in-light-and-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:1 — *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* Baruch 5:8''s woods and sweetsmelling trees overshadowing Israel are Isaiah''s wilderness made glad and blossoming for the returning people.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-led-home-in-light-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:10 — *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* Baruch 5:9''s Israel led with joy in the light of His glory is Isaiah''s ransomed returning to Zion with everlasting joy, their sorrow fled away.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-led-home-in-light-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The light of His glory leading Israel home in Baruch 5:9 is Isaiah''s everlasting light, Yahuah Himself become her lamp.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-led-home-in-light-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_baruchwiththeletterofjeremiah_06.sql (session253 baruch-with-the-letter-of-jeremiah 6) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar6 (view _session253_bar6_lookup). Sort band base 60825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-6-borne-cannot-walk
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 26, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The very source of the Epistle: the idol must be carried because it cannot walk, exactly as Baruch 6:26.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 26, 'canon', 'isaiah', 46, 7, 'free', E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s Bel-and-Nebo taunt matches Baruch 6:26 word for word in scorn — the god borne and immovable.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 27, 'canon', 'isaiah', 46, 4, 'free', E'Isaiah 46:4 — *and even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you.* The living Elohim carries His people; the idol of Baruch 6:27 cannot even lift itself off the ground.'),
  -- thread: baruch-6-cannot-speak-see
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 8, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not.* The Psalm''s idol-catalogue is the very charge of Baruch 6:8 — gilded tongues that cannot speak.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 17, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The dust-blind eyes of Baruch 6:17 blind also the worshipper, who becomes as lifeless as the thing he trusts.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 19, 'canon', 'habakkuk', 2, 19, 'free', E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* Candles before eyes that cannot see one (Baruch 6:19) is Habakkuk''s woe — wood and stone overlaid with metal, with no breath in it.'),
  -- thread: baruch-6-work-of-mens-hands
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 45, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Isaiah''s residue-god is Baruch 6:45''s carpenter-made thing — it can be nothing but what the workman wills.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 51, 'canon', 'deuteronomy', 4, 28, 'free', E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Moses named the work-of-men''s-hands curse of exile that Baruch 6:51 watches play out among the Babylonian gods.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 51, 'canon', '1-corinthians', 8, 4, 'free', E'1 Corinthians 8:4 — *As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other Elohim (God) but one.* Paul speaks the same verdict as Baruch 6:51 — no work of Yahuah is in them; the idol is nothing, and Elohim is one.'),
  -- thread: baruch-6-cannot-save
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 36, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living Elohim of Jeremiah saves and judges where the idol of Baruch 6:36 can deliver no one from death.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 36, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The redeemer who is first and last is the answer to Baruch 6:36 — beside Him there is no god to save.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 38, 'canon', 'psalms', 115, 9, 'free', E'Psalm 115:9 — *O Yashar''el (Israel), trust thou in Yahuah (LORD): he is their help and their shield.* The idol shows no mercy to widow or fatherless (Baruch 6:38); Yahuah alone is the help and shield Israel is to trust.'),
  -- thread: baruch-6-bel-chaldeans-dishonour
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 41, 'apocrypha', 'bel-and-the-dragon', 1, 5, 'extras', E'Bel and the Dragon 1:5 — *Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh.* Daniel''s confession before the very Bel that Baruch 6:41 says the Babylonians intreat — the living Creator against the dumb idol.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 41, 'canon', 'isaiah', 46, 1, 'free', E'Isaiah 46:1 — *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* Isaiah names Bel''s collapse; Baruch 6:41 shows the same Bel intreated in vain to make a dumb man speak.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 40, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul names the exchange that Baruch 6:40 marvels at — even the Chaldeans dishonour the images they have set in Elohim''s place.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-borne-cannot-walk',
       E'Borne on shoulders, having no feet',
       E'The Epistle of Jeremy strips the idol of its last pretence — it cannot even stand: *They are borne upon shoulders, having no feet by which they declare to men that they be nothing worth* (Baruch 6:26), and *They also that serve them are ashamed: for if they fall to the ground at any time, they cannot rise up again of themselves: neither, if one set them upright, can they move of themselves* (Baruch 6:27). It ain''t new: Jeremiah said the same of the carved tree — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). Isaiah mocks Bel and Nebo loaded on the cattle — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble* (Isaiah 46:7) — and over against the dead god sets the living Elohim who carries Israel: *and even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you* (Isaiah 46:4). The whole contrast of the chapter: the idol must be carried; Yahuah carries His people.',
       sv.verse_id, ev.verse_id, 'extras', 60825
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-cannot-speak-see',
       E'False, and cannot speak',
       E'The mouths are gilded but mute: *As for their tongue, it is polished by the workman, and they themselves are gilded and laid over with silver; yet are they but false, and cannot speak* (Baruch 6:8); their eyes fill with dust — *when they be set up in the temple, their eyes be full of dust through the feet of them that come in* (Baruch 6:17); and the worshippers light them candles *of which they cannot see one* (Baruch 6:19). This is the Psalmist''s catalogue verbatim in spirit: *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5), with the verdict that the maker becomes as the made — *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). Habakkuk closes the case: *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it* (Habakkuk 2:19). Dead gods of silver and gold against the One who is in His holy temple.',
       sv.verse_id, ev.verse_id, 'extras', 60828
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-work-of-mens-hands',
       E'The works of men''s hands, no gods',
       E'The refrain returns again and again — *fear them not* — because the thing has a maker: *They are made of carpenters and goldsmiths: they can be nothing else than the workmen will have them to be* (Baruch 6:45), and the proof at last shall *manifestly appear to all nations and kings that they are no gods, but the works of men''s hands, and that there is no work of Yahuah (God) in them* (Baruch 6:51). This is Isaiah''s residue-god, half burned for fuel and half worshipped — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god* (Isaiah 44:17). Moses foresaw it as the curse of exile — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell* (Deuteronomy 4:28) — the very scattering into Babylon that frames the whole Epistle (Baruch 6:2). And Paul gathers the witness: the idol is nothing, *we know that an idol is nothing in the world, and that there is none other Elohim (God) but one* (1 Corinthians 8:4). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60831
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=45
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-cannot-save',
       E'They can save no man from death',
       E'The heart of the polemic: the dead god is useless precisely where help is needed — *They can save no man from death, neither deliver the weak from the mighty* (Baruch 6:36), *They cannot restore a blind man to his sight, nor help any man in his distress* (Baruch 6:37), *They can shew no mercy to the widow, nor do good to the fatherless* (Baruch 6:38). Over against this stands Yahuah alone the King of nations — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation* (Jeremiah 10:10) — and the redeemer who is first and last beside whom there is no Elohim — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). The idol cannot save; only the living Elohim saves.',
       sv.verse_id, ev.verse_id, 'extras', 60834
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-bel-chaldeans-dishonour',
       E'Even the Chaldeans dishonour them; intreat Bel',
       E'The Epistle turns the heathen''s own conduct into testimony — *How should a man then think and say that they are gods, when even the Chaldeans themselves dishonour them?* (Baruch 6:40) — and pictures them bringing a dumb man to *intreat Bel that he may speak, as though he were able to understand* (Baruch 6:41). The name Bel is no abstraction in this library: Daniel faced that very idol — *Now the Babylons had an idol, called Bel, and there were spent upon him every day twelve great measures of fine flour, and forty sheep, and six vessels of wine* (Bel and the Dragon 1:3) — and gave the Epistle''s own confession: *Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh* (Bel and the Dragon 1:5). Isaiah had already prophesied Bel''s fall: *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast* (Isaiah 46:1). And Paul names the root sin: men *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man* (Romans 1:23).',
       sv.verse_id, ev.verse_id, 'extras', 60837
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-6-borne-cannot-walk
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The very source of the Epistle: the idol must be carried because it cannot walk, exactly as Baruch 6:26.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-borne-cannot-walk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s Bel-and-Nebo taunt matches Baruch 6:26 word for word in scorn — the god borne and immovable.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-borne-cannot-walk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 46:4 — *and even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you.* The living Elohim carries His people; the idol of Baruch 6:27 cannot even lift itself off the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-borne-cannot-walk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-cannot-speak-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not.* The Psalm''s idol-catalogue is the very charge of Baruch 6:8 — gilded tongues that cannot speak.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-speak-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The dust-blind eyes of Baruch 6:17 blind also the worshipper, who becomes as lifeless as the thing he trusts.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-speak-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* Candles before eyes that cannot see one (Baruch 6:19) is Habakkuk''s woe — wood and stone overlaid with metal, with no breath in it.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-speak-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-work-of-mens-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Isaiah''s residue-god is Baruch 6:45''s carpenter-made thing — it can be nothing but what the workman wills.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-work-of-mens-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Moses named the work-of-men''s-hands curse of exile that Baruch 6:51 watches play out among the Babylonian gods.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-work-of-mens-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 8:4 — *As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other Elohim (God) but one.* Paul speaks the same verdict as Baruch 6:51 — no work of Yahuah is in them; the idol is nothing, and Elohim is one.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-work-of-mens-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-cannot-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living Elohim of Jeremiah saves and judges where the idol of Baruch 6:36 can deliver no one from death.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-save'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The redeemer who is first and last is the answer to Baruch 6:36 — beside Him there is no god to save.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-save'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:9 — *O Yashar''el (Israel), trust thou in Yahuah (LORD): he is their help and their shield.* The idol shows no mercy to widow or fatherless (Baruch 6:38); Yahuah alone is the help and shield Israel is to trust.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-save'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-bel-chaldeans-dishonour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Bel and the Dragon 1:5 — *Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh.* Daniel''s confession before the very Bel that Baruch 6:41 says the Babylonians intreat — the living Creator against the dumb idol.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-bel-chaldeans-dishonour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='apocrypha' AND tv.book_slug='bel-and-the-dragon' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 46:1 — *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* Isaiah names Bel''s collapse; Baruch 6:41 shows the same Bel intreated in vain to make a dumb man speak.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-bel-chaldeans-dishonour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul names the exchange that Baruch 6:40 marvels at — even the Chaldeans dishonour the images they have set in Elohim''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-bel-chaldeans-dishonour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Baruch cross-references complete.'
