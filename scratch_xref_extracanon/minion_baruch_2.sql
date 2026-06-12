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

