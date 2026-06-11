-- ----- fragment: minion_jubilees_23.sql (session251 jubilees 23) -----
-- Source anchor: jubilees/jubilees ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju23 (view _session251_ju23_lookup). Sort band base 53550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-23-abraham-gathered-to-his-fathers
  ('jubilees', 'jubilees', 23, 1, 'canon', 'genesis', 25, 8, 'free', E'Genesis 25:8 — *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people.* Jubilees'' “slept the sleep of eternity, and was gathered to his fathers” is Genesis'' “gathered to his people” retold.'),
  ('jubilees', 'jubilees', 23, 6, 'canon', 'genesis', 25, 9, 'free', E'Genesis 25:9 — *And his sons Isaac and Ishmael buried him in the cave of Machpelah, in the field of Ephron the son of Zohar the Hittite, which is before Mamre;* the same two sons, the same cave — Jubilees'' “double cave” is Machpelah.'),
  ('jubilees', 'jubilees', 23, 6, 'canon', 'genesis', 25, 10, 'free', E'Genesis 25:10 — *The field which Abraham purchased of the sons of Heth: there was Abraham buried, and Sarah his wife.* Jubilees buries him “near Sarah his wife” — exactly Genesis'' burial beside Sarah.'),
  -- thread: jubilees-23-days-shortened-for-sin
  ('jubilees', 'jubilees', 23, 8, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* Jubilees'' “after the Flood they began to grow less” is the Torah''s bounding of human days at the Flood.'),
  ('jubilees', 'jubilees', 23, 15, 'canon', 'psalms', 90, 10, 'free', E'Psalm 90:10 — *The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away.* Jubilees'' “three score years and ten... four score years, and those evil” quotes the prayer of Moses almost word for word.'),
  -- thread: jubilees-23-forsaking-covenant-feasts-evil-generation
  ('jubilees', 'jubilees', 23, 16, 'canon', 'malachi', 3, 7, 'free', E'Malachi 3:7 — *Even from the days of your fathers ye are gone away from mine ordinances, and have not kept them. Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts).* Jubilees'' generation “forsaking the covenant” is Malachi''s nation gone away from the ordinances — and the same word “return” answers it.'),
  ('jubilees', 'jubilees', 23, 17, 'canon', 'isaiah', 65, 12, 'free', E'Isaiah 65:12 — *Therefore will I number you to the sword, and ye shall all bow down to the slaughter: because when I called, ye did not answer; when I spake, ye did not hear; but did evil before mine eyes, and did choose that wherein I delighted not.* Jubilees'' faithless generation handed “over to the sword” is Isaiah''s people numbered to the sword for refusing to hear.'),
  ('jubilees', 'jubilees', 23, 19, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The “feasts, and months, and Sabbaths” Jubilees says they forgot are Yahuah''s own appointed feasts — not later inventions but His.'),
  -- thread: jubilees-23-children-return-to-the-way-restoration
  ('jubilees', 'jubilees', 23, 25, 'canon', 'deuteronomy', 30, 2, 'free', E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* Jubilees'' children who “seek the commandments, and return to the path of righteousness” are the children the Torah promised would return and obey.'),
  ('jubilees', 'jubilees', 23, 25, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The lengthening days and healing of Jubilees 23 follow exactly on the Torah''s “return” — the regathering after the return-to-the-way.'),
  ('jubilees', 'jubilees', 23, 16, 'canon', 'malachi', 4, 6, 'free', E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* Jubilees has the sons convict the fathers (23:16) and then the children turn back — Malachi''s turning of the hearts between the generations.'),
  ('jubilees', 'jubilees', 23, 27, 'canon', 'jeremiah', 31, 10, 'free', E'Jeremiah 31:10 — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* The restoration Jubilees foresees is the prophet''s promised regathering of the scattered flock — the awakening of the two-house remnant.'),
  -- thread: jubilees-23-new-heavens-days-of-a-tree-healing
  ('jubilees', 'jubilees', 23, 28, 'canon', 'isaiah', 65, 20, 'free', E'Isaiah 65:20 — *There shall be no more thence an infant of days, nor an old man that hath not filled his days: for the child shall die an hundred years old; but the sinner being an hundred years old shall be accursed.* Jubilees'' “no old man Nor one who is not satisfied with his days” is Isaiah''s new heavens, where none dies short of his days.'),
  ('jubilees', 'jubilees', 23, 27, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Jubilees'' days drawing “nigh to one thousand years” are Isaiah''s “days of a tree” for the lengthened life of the restored people.'),
  ('jubilees', 'jubilees', 23, 30, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Jubilees'' servants who “rise up” while “their bones will rest in the earth, And their spirits will have much joy” is Daniel''s awakening of those who sleep in the dust.'),
  ('jubilees', 'jubilees', 23, 30, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Jubilees'' closing “record on the heavenly tables for a testimony” is Malachi''s book of remembrance written before Yahuah — the law and the history pre-written.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-23-abraham-gathered-to-his-fathers',
       E'Abraham slept the sleep of eternity — the burial in the double cave',
       E'Jubilees closes Abraham''s life over the sleeping Jacob: *“And he placed two fingers of Jacob on his eyes, and he blessed the Elohim (God) of gods, and he covered his face and stretched out his feet and slept the sleep of eternity, and was gathered to his fathers.”* (Jubilees 23:1), and the sons gather to bury him: *“And his sons Isaac and Ishmael buried him in the double cave, near Sarah his wife”* (Jubilees 23:6). This is Genesis retold, not invented — Genesis already records *“Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people”* (Genesis 25:8), and *“And his sons Isaac and Ishmael buried him in the cave of Machpelah”* (Genesis 25:9). It ain''t new — the double cave is the cave of Machpelah, the two sons are the same two sons. Jubilees only sets the same death beside the boy Jacob who would carry the seed.',
       sv.verse_id, ev.verse_id, 'extras', 53550
  FROM _session251_ju23_lookup sv, _session251_ju23_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-23-days-shortened-for-sin',
       E'Their days grew few — the shortening of human life for the wickedness of their ways',
       E'Jubilees marks Abraham''s span and then the decline: *“For the days of the forefathers, of their life, were nineteen jubilees; and after the Flood they began to grow less than nineteen jubilees... by reason of manifold tribulation and the wickedness of their ways”* (Jubilees 23:8). The shortening of days is no accident of biology — the Torah already fixes the bound at the threshold of the Flood: *“And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years”* (Genesis 6:3). And when Jubilees says that in those evil days a man''s span is *“three score years and ten, and, if he is strong, four score years”* (Jubilees 23:15), it is quoting the prayer of Moses: *“The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow”* (Psalm 90:10). It ain''t new — Jubilees is reading the same Scripture, the days cut short for sin.',
       sv.verse_id, ev.verse_id, 'extras', 53553
  FROM _session251_ju23_lookup sv, _session251_ju23_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=23 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-23-forsaking-covenant-feasts-evil-generation',
       E'They have forgotten commandment, covenant, feasts, months, Sabbaths and jubilees',
       E'Jubilees names the sin of the evil generation precisely: they have abandoned the appointed times. *“they have forgotten commandment, and covenant, and feasts, and months, and Sabbaths, and jubilees, and all judgments”* (Jubilees 23:19), having *“forsaken the covenant which Yahuah (God) made between them and Him, that they should observe and do all His commandments and His ordinances and all His laws”* (Jubilees 23:16). This is not a new charge — it is the prophets'' charge. Malachi names the same turning away from the ordinances and the same call back: *“Even from the days of your fathers ye are gone away from mine ordinances, and have not kept them. Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts)”* (Malachi 3:7). The feasts and Sabbaths Jubilees grounds in the patriarchs and the heavenly tablets are the very things this generation forgot — to forget the moedim is to forsake the covenant. It ain''t new, and it ain''t abolished; it is forgotten, and the prophet calls it back.',
       sv.verse_id, ev.verse_id, 'extras', 53556
  FROM _session251_ju23_lookup sv, _session251_ju23_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=23 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-23-children-return-to-the-way-restoration',
       E'The children begin to study the law and return to the path of righteousness — the awakening',
       E'This is the hinge of the chapter and the heart of the framework. After the wars that try and fail *“to turn them back into the way”* (Jubilees 23:20), the turning comes from the children themselves: *“And in those days the children will begin to study the laws, And to seek the commandments, And to return to the path of righteousness”* (Jubilees 23:25). This is the second recovery, the awakening — and it is the Torah''s own promise of regathering: *“And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children”* (Deuteronomy 30:2), *“That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations”* (Deuteronomy 30:3). It is Malachi''s promise that *“he shall turn the heart of the fathers to the children, and the heart of the children to their fathers”* (Malachi 4:6) — here the children convict the fathers (Jubilees 23:16) and then return. It is Jeremiah''s regathered remnant: *“He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock”* (Jeremiah 31:10). The return-to-the-way is happening now.',
       sv.verse_id, ev.verse_id, 'extras', 53559
  FROM _session251_ju23_lookup sv, _session251_ju23_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=23 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-23-new-heavens-days-of-a-tree-healing',
       E'Their days draw nigh to a thousand years — the days of a tree, the resurrection, the heavenly tables',
       E'The restoration unfolds toward a thousand years of peace: *“And the days will begin to grow many and increase amongst those children of men, Till their days draw nigh to one thousand years”* (Jubilees 23:27), and *“there will be no old man Nor one who is not satisfied with his days”* (Jubilees 23:28). This is the very new-creation Isaiah saw: *“There shall be no more thence an infant of days, nor an old man that hath not filled his days”* (Isaiah 65:20), where *“as the days of a tree are the days of my people”* (Isaiah 65:22). Then comes the healing and the rising: *“And at that time Yahuah (God) will heal His servants, And they will rise up and see great peace... And their bones will rest in the earth, And their spirits will have much joy”* (Jubilees 23:30) — the resurrection Daniel sealed: *“And many of them that sleep in the dust of the earth shall awake, some to everlasting life”* (Daniel 12:2). And Jubilees closes as it began, on the heavenly tablets: *“thus are they written, and they record (them) on the heavenly tables for a testimony for the generations for ever”* (Jubilees 23:30) — the book of remembrance: *“a book of remembrance was written before him for them that feared Yahuah (LORD)”* (Malachi 3:16). It ain''t new — it was written before it unfolded.',
       sv.verse_id, ev.verse_id, 'extras', 53562
  FROM _session251_ju23_lookup sv, _session251_ju23_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=27
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=23 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-23-abraham-gathered-to-his-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:8 — *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people.* Jubilees'' “slept the sleep of eternity, and was gathered to his fathers” is Genesis'' “gathered to his people” retold.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-abraham-gathered-to-his-fathers'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:9 — *And his sons Isaac and Ishmael buried him in the cave of Machpelah, in the field of Ephron the son of Zohar the Hittite, which is before Mamre;* the same two sons, the same cave — Jubilees'' “double cave” is Machpelah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-abraham-gathered-to-his-fathers'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:10 — *The field which Abraham purchased of the sons of Heth: there was Abraham buried, and Sarah his wife.* Jubilees buries him “near Sarah his wife” — exactly Genesis'' burial beside Sarah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-abraham-gathered-to-his-fathers'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-23-days-shortened-for-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* Jubilees'' “after the Flood they began to grow less” is the Torah''s bounding of human days at the Flood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-days-shortened-for-sin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 90:10 — *The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away.* Jubilees'' “three score years and ten... four score years, and those evil” quotes the prayer of Moses almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-days-shortened-for-sin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-23-forsaking-covenant-feasts-evil-generation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:7 — *Even from the days of your fathers ye are gone away from mine ordinances, and have not kept them. Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts).* Jubilees'' generation “forsaking the covenant” is Malachi''s nation gone away from the ordinances — and the same word “return” answers it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-forsaking-covenant-feasts-evil-generation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:12 — *Therefore will I number you to the sword, and ye shall all bow down to the slaughter: because when I called, ye did not answer; when I spake, ye did not hear; but did evil before mine eyes, and did choose that wherein I delighted not.* Jubilees'' faithless generation handed “over to the sword” is Isaiah''s people numbered to the sword for refusing to hear.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-forsaking-covenant-feasts-evil-generation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The “feasts, and months, and Sabbaths” Jubilees says they forgot are Yahuah''s own appointed feasts — not later inventions but His.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-forsaking-covenant-feasts-evil-generation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-23-children-return-to-the-way-restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* Jubilees'' children who “seek the commandments, and return to the path of righteousness” are the children the Torah promised would return and obey.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-children-return-to-the-way-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The lengthening days and healing of Jubilees 23 follow exactly on the Torah''s “return” — the regathering after the return-to-the-way.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-children-return-to-the-way-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* Jubilees has the sons convict the fathers (23:16) and then the children turn back — Malachi''s turning of the hearts between the generations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-children-return-to-the-way-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:10 — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* The restoration Jubilees foresees is the prophet''s promised regathering of the scattered flock — the awakening of the two-house remnant.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-children-return-to-the-way-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-23-new-heavens-days-of-a-tree-healing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:20 — *There shall be no more thence an infant of days, nor an old man that hath not filled his days: for the child shall die an hundred years old; but the sinner being an hundred years old shall be accursed.* Jubilees'' “no old man Nor one who is not satisfied with his days” is Isaiah''s new heavens, where none dies short of his days.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-new-heavens-days-of-a-tree-healing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* Jubilees'' days drawing “nigh to one thousand years” are Isaiah''s “days of a tree” for the lengthened life of the restored people.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-new-heavens-days-of-a-tree-healing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Jubilees'' servants who “rise up” while “their bones will rest in the earth, And their spirits will have much joy” is Daniel''s awakening of those who sleep in the dust.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-new-heavens-days-of-a-tree-healing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Jubilees'' closing “record on the heavenly tables for a testimony” is Malachi''s book of remembrance written before Yahuah — the law and the history pre-written.'
  FROM cross_reference_threads t, cross_references x, _session251_ju23_lookup sv, _session251_ju23_lookup tv
 WHERE t.slug='jubilees-23-new-heavens-days-of-a-tree-healing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=23 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

