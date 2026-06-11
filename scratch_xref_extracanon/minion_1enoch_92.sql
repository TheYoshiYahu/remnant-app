-- ----- fragment: minion_1enoch_92.sql (session250 1-enoch 92) -----
-- Source anchor: enoch/1-enoch ch92. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en92 (view _session250_en92_lookup). Sort band base 52275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en92_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-92-preserve-the-books
  ('enoch', '1-enoch', 92, 2, 'canon', 'deuteronomy', 6, 6, 'free', E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* Enoch''s charge to keep the books in the heart (92:2) is the Shema''s command to set the words in the heart.'),
  ('enoch', '1-enoch', 92, 2, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* The generation-to-generation teaching of 92:2 is the Torah''s own diligent-teaching mandate.'),
  ('enoch', '1-enoch', 92, 1, 'canon', 'deuteronomy', 4, 2, 'free', E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* The books preserved untouched (92:1) keep the Torah''s no-add-no-subtract fence around the word.'),
  ('enoch', '1-enoch', 92, 14, 'canon', 'revelation', 22, 18, 'free', E'Revelation 22:18 — *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* Writing the words in a book for a testimony (92:14) is sealed by Revelation''s same warning against tampering with the testimony.'),
  -- thread: 1-enoch-92-altering-the-appointed-times
  ('enoch', '1-enoch', 92, 3, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The sinners who alter the times and seasons (92:3) are Daniel''s horn who thinks to change times and laws.'),
  ('enoch', '1-enoch', 92, 3, 'jubilees', 'jubilees', 6, 37, 'extras', E'Jubilees 6:37 — *...they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees, from the same Sinai mountain, names the identical corruption of 92:3 — the moedim confounded and blood eaten with all flesh.'),
  ('enoch', '1-enoch', 92, 3, 'jubilees', 'jubilees', 6, 36, 'extras', E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* The altering of the seasons and new moons (92:3) is Jubilees'' warning that the moon-reckoning will pull the year ten days off the appointed order.'),
  ('enoch', '1-enoch', 92, 3, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood-eating Enoch condemns (92:3) breaks the Noahic prohibition given before Sinai itself.'),
  ('enoch', '1-enoch', 92, 3, 'canon', 'leviticus', 17, 14, 'free', E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* Eating blood with all flesh (92:3) is the very sin Torah seals with cutting-off, the life of the flesh being the blood.'),
  -- thread: 1-enoch-92-two-ways-inherit-eternal-life
  ('enoch', '1-enoch', 92, 5, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Enoch''s blessing on those who keep the commandments (92:5) sets the same two ways Moses placed before Israel: life and good against death and evil.'),
  ('enoch', '1-enoch', 92, 5, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* To keep the commandments and inherit eternal life (92:5) is to choose life as Moses charged, that the seed may live.'),
  ('enoch', '1-enoch', 92, 5, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The blessing on the righteous and ruin of the sinner in 92:5 is the Psalter''s two paths: the way of the righteous known, the way of the ungodly perishing.'),
  ('enoch', '1-enoch', 92, 5, 'canon', 'john', 17, 3, 'free', E'John 17:3 — *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* The eternal life Enoch promises the commandment-keepers (92:5) is the knowing of the Father and Yahusha whom He sent.'),
  -- thread: 1-enoch-92-the-law-of-the-luminaries
  ('enoch', '1-enoch', 92, 7, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries that do not alter their courses (92:7) are the fourth-day lights set for signs, seasons, days, and years.'),
  ('enoch', '1-enoch', 92, 6, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The law of the sun and the moon Enoch shows (92:6) is the Psalter''s fixed order: the moon appointed for seasons, the sun knowing its setting.'),
  ('enoch', '1-enoch', 92, 6, 'canon', 'leviticus', 23, 4, 'free', E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The seasons governed by the luminaries'' law (92:6) are the feasts of Yahuah proclaimed in their appointed seasons.'),
  ('enoch', '1-enoch', 92, 7, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The luminaries that never alter their courses (92:7) are the heavens declaring the glory of their Maker.'),
  -- thread: 1-enoch-92-woe-to-those-who-lead-astray
  ('enoch', '1-enoch', 92, 13, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The woe on those who lead men astray (92:13) is answered by the resurrection that sorts the righteous to everlasting life and the deceivers to everlasting contempt.'),
  ('enoch', '1-enoch', 92, 11, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The star-leaders who never transgress (92:11) prefigure the wise who shine as stars — those who turn many to righteousness rather than lead them astray.'),
  ('enoch', '1-enoch', 92, 11, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The star-leaders who serve in their appointed places (92:11) point to the Sun of righteousness rising over those who fear the Name.'),
  ('enoch', '1-enoch', 92, 13, 'canon', 'psalms', 19, 2, 'free', E'Psalm 19:2 — *Day unto day uttereth speech, and night unto night sheweth knowledge.* The faithful luminaries (92:11-13) preach the Maker''s order day and night, a standing witness against those who alter the times and lead men astray.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en92_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en92_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-92-preserve-the-books',
       E'Preserve these books, add not, diminish not — a testimony for the generations',
       E'Enoch hands the wisdom to his son: *And now, my son Methuselah, All that I have recounted and preserved for thee, I have given into thy hands, And thou shalt preserve the books from the hand of thy father, And thou shalt commit them to the memory of thy sons, And to the sons of thy sons who shall come after thee, That they may preserve this wisdom which is greater than all the wisdom of the world.* (1 Enoch 92:1), and again *Preserve these books in thy heart... thou shalt teach them to thy sons, And thy sons shall teach them to their sons, From generation to generation for ever.* (1 Enoch 92:2). This is not a new commission but the Torah pattern of transmission: *And these words, which I command thee this day, shall be in thine heart:* (Deuteronomy 6:6) — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* (Deuteronomy 6:7). The words are kept whole, never tampered: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* (Deuteronomy 4:2), a fence the Revelator seals on the last book: *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* (Revelation 22:18). To write the words in a book *for a testimony for the generations of the world* (1 Enoch 92:14) is the very office Moses kept — the deposit guarded, handed down, untouched.',
       sv.verse_id, ev.verse_id, 'extras', 52275
  FROM _session250_en92_lookup sv, _session250_en92_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=92 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-92-altering-the-appointed-times',
       E'The sinners alter the times, the seasons, the new moons, the sabbaths, the festivals',
       E'Enoch foresees the assault on the appointed times: *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* (1 Enoch 92:3). Daniel names the same horn who *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25) — to change the times is to assault the moedim, not the clock. Jubilees, given on the same Sinai mountain, warns of this exact corruption almost word-for-word: *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* (Jubilees 6:36) and *they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* (Jubilees 6:37). The blood-eating Enoch warns of is the standing prohibition from the days of Noah: *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4), set in Torah with a covenant penalty: *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh...* (Leviticus 17:14). The sin here is not Torah as curse — it is the dismantling of the Creator''s order: the feasts, the new moons, the Sabbath, the blood.',
       sv.verse_id, ev.verse_id, 'extras', 52278
  FROM _session250_en92_lookup sv, _session250_en92_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=92 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-92-two-ways-inherit-eternal-life',
       E'The two ways — blessed who keep the commandments and inherit eternal life',
       E'Against the corruption of the order Enoch sets the blessing: *But blessed are those who keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth, For they shall inherit eternal life.* (1 Enoch 92:5), repeated for those who keep the calendar order: *And blessed are those who observe these things, And keep the commandments of Yahuah (God) of Spirits, And walk in righteousness, And complete their years in truth.* (1 Enoch 92:12). This is the two ways laid before Israel at the Jordan: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15) — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments...* (Deuteronomy 30:16) — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). The Psalter draws the same two paths: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalm 1:6). And the eternal life Enoch promises is no abstraction but the knowing of the Father and the Son: *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* (John 17:3). The way of life is to keep the commandments and walk in righteousness — Torah is the way, never the curse.',
       sv.verse_id, ev.verse_id, 'extras', 52281
  FROM _session250_en92_lookup sv, _session250_en92_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=92 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-92-the-law-of-the-luminaries',
       E'The law of the luminaries — the heavenly tablets do not alter their courses',
       E'Enoch shows Methuselah the whole order of the lights: *I have shown thee the whole vision of the heavenly tablets, And all the commandments of the luminaries, And the law of the stars, And the law of the sun and the moon...* (1 Enoch 92:6), charging him to keep it unaltered, *For the luminaries do not alter their courses, And the earth does not alter her seasons, And the sea does not alter her boundaries.* (1 Enoch 92:7). This is the fourth-day decree of creation: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — the lights are set for the moedim, the appointed seasons. The Psalter echoes the same fixed order: *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19). Those seasons the lights govern are the feasts of Yahuah: *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* (Leviticus 23:4). And the luminaries that do not alter their courses preach their Maker without a word: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1). The calendar is not a private opinion but a law written in the sky — to keep it is to keep faith with the Creator''s order.',
       sv.verse_id, ev.verse_id, 'extras', 52284
  FROM _session250_en92_lookup sv, _session250_en92_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=92 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-92-woe-to-those-who-lead-astray',
       E'The star-leaders transgress not — woe to those who lead the sons of men astray',
       E'The chiefs of the stars keep their stations in perfect obedience: *And the leaders of the stars are the chiefs of the thousands, And they serve Yahuah (God) of Spirits in their appointed places, And they do not transgress their commandments.* (1 Enoch 92:11) — and against them stands the woe: *And woe to those who alter these things, And lead the sons of men astray, And cause them to transgress the commandments of Yahuah (God) of Spirits.* (1 Enoch 92:13). The woe of the Epistle falls on those who pervert the order and lead the people off the way; but those who turn many to righteousness shine like the very luminaries Enoch describes: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2) — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). The Sun of righteousness Himself rises over those who fear the Name: *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* (Malachi 4:2). The same heavens that declare glory rebuke the deceivers: *Day unto day uttereth speech, and night unto night sheweth knowledge.* (Psalm 19:2). Woe falls on the system that leads astray; the righteous who keep and teach the order are made to shine as the stars forever.',
       sv.verse_id, ev.verse_id, 'extras', 52287
  FROM _session250_en92_lookup sv, _session250_en92_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=92 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-92-preserve-the-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* Enoch''s charge to keep the books in the heart (92:2) is the Shema''s command to set the words in the heart.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-preserve-the-books'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* The generation-to-generation teaching of 92:2 is the Torah''s own diligent-teaching mandate.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-preserve-the-books'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* The books preserved untouched (92:1) keep the Torah''s no-add-no-subtract fence around the word.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-preserve-the-books'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:18 — *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* Writing the words in a book for a testimony (92:14) is sealed by Revelation''s same warning against tampering with the testimony.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-preserve-the-books'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-92-altering-the-appointed-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The sinners who alter the times and seasons (92:3) are Daniel''s horn who thinks to change times and laws.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-altering-the-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:37 — *...they will go wrong as to the new moons and seasons and sabbaths and festivals, and they will eat all kinds of blood with all kinds of flesh.* Jubilees, from the same Sinai mountain, names the identical corruption of 92:3 — the moedim confounded and blood eaten with all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-altering-the-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon.* The altering of the seasons and new moons (92:3) is Jubilees'' warning that the moon-reckoning will pull the year ten days off the appointed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-altering-the-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood-eating Enoch condemns (92:3) breaks the Noahic prohibition given before Sinai itself.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-altering-the-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* Eating blood with all flesh (92:3) is the very sin Torah seals with cutting-off, the life of the flesh being the blood.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-altering-the-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-92-two-ways-inherit-eternal-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Enoch''s blessing on those who keep the commandments (92:5) sets the same two ways Moses placed before Israel: life and good against death and evil.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-two-ways-inherit-eternal-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* To keep the commandments and inherit eternal life (92:5) is to choose life as Moses charged, that the seed may live.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-two-ways-inherit-eternal-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The blessing on the righteous and ruin of the sinner in 92:5 is the Psalter''s two paths: the way of the righteous known, the way of the ungodly perishing.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-two-ways-inherit-eternal-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 17:3 — *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* The eternal life Enoch promises the commandment-keepers (92:5) is the knowing of the Father and Yahusha whom He sent.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-two-ways-inherit-eternal-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-92-the-law-of-the-luminaries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries that do not alter their courses (92:7) are the fourth-day lights set for signs, seasons, days, and years.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-the-law-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The law of the sun and the moon Enoch shows (92:6) is the Psalter''s fixed order: the moon appointed for seasons, the sun knowing its setting.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-the-law-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The seasons governed by the luminaries'' law (92:6) are the feasts of Yahuah proclaimed in their appointed seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-the-law-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The luminaries that never alter their courses (92:7) are the heavens declaring the glory of their Maker.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-the-law-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-92-woe-to-those-who-lead-astray
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The woe on those who lead men astray (92:13) is answered by the resurrection that sorts the righteous to everlasting life and the deceivers to everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-woe-to-those-who-lead-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The star-leaders who never transgress (92:11) prefigure the wise who shine as stars — those who turn many to righteousness rather than lead them astray.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-woe-to-those-who-lead-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The star-leaders who serve in their appointed places (92:11) point to the Sun of righteousness rising over those who fear the Name.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-woe-to-those-who-lead-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 19:2 — *Day unto day uttereth speech, and night unto night sheweth knowledge.* The faithful luminaries (92:11-13) preach the Maker''s order day and night, a standing witness against those who alter the times and lead men astray.'
  FROM cross_reference_threads t, cross_references x, _session250_en92_lookup sv, _session250_en92_lookup tv
 WHERE t.slug='1-enoch-92-woe-to-those-who-lead-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=92 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

