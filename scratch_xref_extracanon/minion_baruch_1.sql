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

