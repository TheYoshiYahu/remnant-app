-- ----- fragment: minion_1enoch_81.sql (session250 1-enoch 81) -----
-- Source anchor: enoch/1-enoch ch81. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en81 (view _session250_en81_lookup). Sort band base 52000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en81_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-81-heavenly-tablets-books-of-men
  ('enoch', '1-enoch', 81, 2, 'enoch', '1-enoch', 47, 3, 'extras', E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* The heavenly tablets Enoch reads in 81:2 are the same books of the living opened before the Head of Days.'),
  ('enoch', '1-enoch', 81, 2, 'canon', 'psalms', 139, 16, 'free', E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The works of men written on Enoch''s tablets (81:2) match the book where our members were written before there was one of them — election before confession.'),
  ('enoch', '1-enoch', 81, 2, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Deliverance turns on being found in the book Enoch reads in 81:2.'),
  ('enoch', '1-enoch', 81, 2, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The same tablets of the works of men (81:2) are opened at the white-throne judgement.'),
  -- thread: 1-enoch-81-scribe-teach-thy-children
  ('enoch', '1-enoch', 81, 3, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Enoch''s charge to tell his children and the children of his children (81:3) is the Shema''s command to teach the next generation diligently.'),
  ('enoch', '1-enoch', 81, 5, 'canon', 'deuteronomy', 6, 6, 'free', E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* The words of truth Enoch writes for Methuselah to preserve (81:5) are the commanded words kept in the heart so they are not lost.'),
  ('enoch', '1-enoch', 81, 5, 'canon', 'proverbs', 3, 3, 'free', E'Proverbs 3:3 — *Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart:* Enoch writes the wisdom down lest it be lost (81:5); the canon writes the same on the tablet of the heart.'),
  -- thread: 1-enoch-81-altering-the-times-and-seasons
  ('enoch', '1-enoch', 81, 7, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The times, seasons, new moons and festivals the perverse generation alters (81:7) are fixed by the luminaries at creation, not by men.'),
  ('enoch', '1-enoch', 81, 7, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* To alter the times and the festivals (81:7) is to do the work of the horn who thinks to change times and laws.'),
  ('enoch', '1-enoch', 81, 7, 'jubilees', 'jubilees', 6, 34, 'extras', E'Jubilees 6:34 — *And all the children of Yashar''el (Israel) will forget, and will not find the path of the years, and will forget the new moons, and seasons, and sabbaths, and they will go wrong as to all the order of the years.* Jubilees describes the identical drift Enoch foretells in 81:7 — forgetting the new moons, seasons and sabbaths of the 364-day order.'),
  ('enoch', '1-enoch', 81, 7, 'jubilees', 'jubilees', 6, 37, 'extras', E'Jubilees 6:37 — *For this reason the years will come upon them when they will disturb (the order), and make an abominable (day) the day of testimony, and an unclean day a feast day, and they will confound all the days, the holy with the unclean, and the unclean day with the holy; for they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees even ends with Enoch''s exact pairing — going wrong as to new moons, seasons, sabbaths and festivals, and eating blood with all kinds of flesh (81:7).'),
  -- thread: 1-enoch-81-blessed-who-keep-the-commandments
  ('enoch', '1-enoch', 81, 10, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* To complete the years in truth (81:10) is to keep the feasts that are Yahuah''s own appointed times, fixed by the lights.'),
  ('enoch', '1-enoch', 81, 10, 'enoch', '1-enoch', 82, 7, 'extras', E'1 Enoch 82:7 — *And thou shalt preserve them, And thou shalt not alter them, For the luminaries do not alter their courses, And the earth does not alter her seasons, And the sea does not alter her boundaries.* The blessing on those who keep the commandments (81:10) is sealed in the next chapter: preserve the reckoning, for the luminaries themselves do not alter their courses.'),
  ('enoch', '1-enoch', 81, 10, 'enoch', '1-enoch', 82, 5, 'extras', E'1 Enoch 82:5 — *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* The identical blessing is restated as the standing word of the luminaries, confirming 81:10 as the keep-the-reckoning charge.'),
  ('enoch', '1-enoch', 81, 9, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* Enoch''s few righteous who refuse the paths of unrighteousness (81:9) are the blessed man of the two ways who will not walk in the counsel of the ungodly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en81_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en81_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-81-heavenly-tablets-books-of-men',
       E'The heavenly tablets — all the works of men written',
       E'Enoch is set before the heavenly tablets and reads the whole record of mankind: *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* (1 Enoch 81:1), *And I observed everything on the heavenly tablets, And read everything which was written (thereon), And understood everything, And read the book and everything that was written in it, All the works of men.* (1 Enoch 81:2). This is the canon''s own book of the living, opened before the throne — Enoch had already seen it in the Similitudes: *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). The same books anchor election before confession: *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* (Psalm 139:16); *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). John sees the same tablets opened at the end: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). It ain''t new — the deeds and the names are recorded before ever a man speaks.',
       sv.verse_id, ev.verse_id, 'extras', 52000
  FROM _session250_en81_lookup sv, _session250_en81_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=81 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-81-scribe-teach-thy-children',
       E'Scribe of righteousness — tell it to thy children',
       E'Having read the tablets, Enoch is commissioned to teach and to write for the generations: *And in those days the Lord called me, And said to me: ''Enoch, thou scribe of righteousness, Go tell thy children and the children of thy children All the works of righteousness which thou hast seen, And the words of truth which thou hast heard.* (1 Enoch 81:3), and he writes it down so the wisdom is not lost: *And now, my son Methuselah, I tell thee all these things, And write them down for thee, That thou mayest preserve them, And hand them down to thy children after thee, And that this wisdom may not be lost from the world.* (1 Enoch 81:5). This is the Shema''s own charge to pass the order down the generations: *And these words, which I command thee this day, shall be in thine heart:* (Deuteronomy 6:6); *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* (Deuteronomy 6:7). Wisdom literature gives the same instruction to bind the commandments and inscribe them: *Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart:* (Proverbs 3:3) — the heavenly tablet written upon the heart of the children. Torah stands; the way is kept by being handed down, not invented.',
       sv.verse_id, ev.verse_id, 'extras', 52003
  FROM _session250_en81_lookup sv, _session250_en81_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=81 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-81-altering-the-times-and-seasons',
       E'The perverse generation that alters the times and the moedim',
       E'Enoch foretells the generation that forsakes the Creator''s reckoning: *For in the generation after thee there shall arise a perverse generation, And many shall be the sinners, And they shall transgress the commandments of Yahuah (God) of Spirits, And they shall forget the commandments which I have commanded thee.* (1 Enoch 81:6), *And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* (1 Enoch 81:7). The appointed times are not invented by men — they are written into creation by the lights: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14). To alter the seasons and festivals is to do the enemy''s own work, the horn who *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). Jubilees, the great calendar parallel, warns of the very same drift away from the 364-day solar order: *And all the children of Yashar''el (Israel) will forget, and will not find the path of the years, and will forget the new moons, and seasons, and sabbaths, and they will go wrong as to all the order of the years.* (Jubilees 6:34); and that they will *go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* (Jubilees 6:37). It ain''t new: the Appointed Times are the Creator''s covenant order; to change them is rebellion, not reform.',
       sv.verse_id, ev.verse_id, 'extras', 52006
  FROM _session250_en81_lookup sv, _session250_en81_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=81 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-81-blessed-who-keep-the-commandments',
       E'Blessed are those who keep the commandments and complete their years in truth',
       E'Against the perverse generation Enoch sets the blessing on those who keep the order: *And the righteous shall be few in number, And the sinners shall be many, And they shall walk in the paths of unrighteousness.* (1 Enoch 81:9), *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* (1 Enoch 81:10). To complete the years in truth is to keep the moedim by the lights — the feasts that belong to the Creator, not to men: *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2). The very next chapter seals it as the standing charge of the luminaries: *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* (1 Enoch 82:5), *And thou shalt preserve them, And thou shalt not alter them, For the luminaries do not alter their courses, And the earth does not alter her seasons, And the sea does not alter her boundaries.* (1 Enoch 82:7). This is the two-ways blessing of the first Psalm: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* (Psalm 1:1). The righteous are few because they refuse to alter the reckoning — the calendar is covenant fidelity, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 52009
  FROM _session250_en81_lookup sv, _session250_en81_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=81 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-81-heavenly-tablets-books-of-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* The heavenly tablets Enoch reads in 81:2 are the same books of the living opened before the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-heavenly-tablets-books-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The works of men written on Enoch''s tablets (81:2) match the book where our members were written before there was one of them — election before confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-heavenly-tablets-books-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Deliverance turns on being found in the book Enoch reads in 81:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-heavenly-tablets-books-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The same tablets of the works of men (81:2) are opened at the white-throne judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-heavenly-tablets-books-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-81-scribe-teach-thy-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Enoch''s charge to tell his children and the children of his children (81:3) is the Shema''s command to teach the next generation diligently.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-scribe-teach-thy-children'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* The words of truth Enoch writes for Methuselah to preserve (81:5) are the commanded words kept in the heart so they are not lost.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-scribe-teach-thy-children'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:3 — *Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart:* Enoch writes the wisdom down lest it be lost (81:5); the canon writes the same on the tablet of the heart.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-scribe-teach-thy-children'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-81-altering-the-times-and-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The times, seasons, new moons and festivals the perverse generation alters (81:7) are fixed by the luminaries at creation, not by men.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* To alter the times and the festivals (81:7) is to do the work of the horn who thinks to change times and laws.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:34 — *And all the children of Yashar''el (Israel) will forget, and will not find the path of the years, and will forget the new moons, and seasons, and sabbaths, and they will go wrong as to all the order of the years.* Jubilees describes the identical drift Enoch foretells in 81:7 — forgetting the new moons, seasons and sabbaths of the 364-day order.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 6:37 — *For this reason the years will come upon them when they will disturb (the order), and make an abominable (day) the day of testimony, and an unclean day a feast day, and they will confound all the days, the holy with the unclean, and the unclean day with the holy; for they will go wrong as to the months and sabbaths and feasts and jubilees. For this reason I command and testify to you that you may testify to them; for after your death your children will disturb (them), so that they will not make the year three hundred and sixty-four days only, and for this reason they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees even ends with Enoch''s exact pairing — going wrong as to new moons, seasons, sabbaths and festivals, and eating blood with all kinds of flesh (81:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-altering-the-times-and-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-81-blessed-who-keep-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* To complete the years in truth (81:10) is to keep the feasts that are Yahuah''s own appointed times, fixed by the lights.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-blessed-who-keep-the-commandments'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 82:7 — *And thou shalt preserve them, And thou shalt not alter them, For the luminaries do not alter their courses, And the earth does not alter her seasons, And the sea does not alter her boundaries.* The blessing on those who keep the commandments (81:10) is sealed in the next chapter: preserve the reckoning, for the luminaries themselves do not alter their courses.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-blessed-who-keep-the-commandments'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 82:5 — *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* The identical blessing is restated as the standing word of the luminaries, confirming 81:10 as the keep-the-reckoning charge.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-blessed-who-keep-the-commandments'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* Enoch''s few righteous who refuse the paths of unrighteousness (81:9) are the blessed man of the two ways who will not walk in the counsel of the ungodly.'
  FROM cross_reference_threads t, cross_references x, _session250_en81_lookup sv, _session250_en81_lookup tv
 WHERE t.slug='1-enoch-81-blessed-who-keep-the-commandments'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=81 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

