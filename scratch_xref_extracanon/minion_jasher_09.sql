-- ----- fragment: minion_jasher_09.sql (session252 jasher 9) -----
-- Source anchor: jasher/jasher ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja09 (view _session252_ja09_lookup). Sort band base 55200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-9-haran-family-and-the-birth-of-sarai
  ('jasher', 'jasher', 9, 3, 'canon', 'genesis', 11, 29, 'free', E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* the canon names the same daughters of Haran''s house that Jasher records, Milcah and Sarai (Jasher 9:3).'),
  -- thread: jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah
  ('jasher', 'jasher', 9, 5, 'canon', 'genesis', 9, 26, 'free', E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Abram learns the way of Yahuah in the house of Shem, the blessed line in whose tents the knowledge of the Creator was kept (Jasher 9:5).'),
  ('jasher', 'jasher', 9, 6, 'canon', 'isaiah', 51, 2, 'free', E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* the prophet names the lone calling that Jasher shows beginning in the hidden boy who knew Yahuah from three years old (Jasher 9:6).'),
  ('jasher', 'jasher', 9, 6, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call in Mesopotamia, the land of the idol-houses Jasher describes, before ever Abram reached Haran (Jasher 9:6).'),
  ('jasher', 'jasher', 9, 5, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Yahuah''s own testimony that He took Abraham out, the deliverance Jasher shows beginning in the house of Noah and Shem (Jasher 9:5).'),
  -- thread: jasher-9-the-generation-serves-gods-of-wood-and-stone
  ('jasher', 'jasher', 9, 7, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* the canon names Terah the idolater exactly as Jasher does — the first of the idol-servers (Jasher 9:7).'),
  ('jasher', 'jasher', 9, 6, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men’s hands.* the gods of wood and stone that could neither speak nor hear nor deliver (Jasher 9:6) are the very dumb idols the psalm derides.'),
  ('jasher', 'jasher', 9, 6, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* the prophet''s verdict on the breathless idols Jasher''s generation served (Jasher 9:6).'),
  -- thread: jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator
  ('jasher', 'jasher', 9, 7, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them,* Moses forbids the host-of-heaven worship that Abram reasons his way out of, finding sun and moon are servants, not gods (Jasher 9:7).'),
  ('jasher', 'jasher', 9, 7, 'jubilees', 'jubilees', 12, 17, 'extras', E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out?* Jubilees records the same reasoning — Abram turning from the host of heaven to the One in whose hand they are (Jasher 9:7).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-haran-family-and-the-birth-of-sarai',
       E'Haran''s house and the birth of Sarai',
       E'Jasher names the household from which the chosen seed will take its wife: *And Haran, the son of Terah, Abram’s oldest brother, took a wife in those days* (Jasher 9:1), and *she conceived again and bare a daughter... she called her name Sarai* (Jasher 9:3). The canon names the same marriages: *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah* (Genesis 11:29). The line is being drawn toward the seed of promise.',
       sv.verse_id, ev.verse_id, 'extras', 55200
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah',
       E'Abram in the house of Noah and Shem — he knew Yahuah',
       E'The chosen child is hidden in the one righteous house left on the earth: *when Abram came out from the cave, he went to Noah and his son Shem, and he remained with them to learn the instruction of Yahuah (the Lord) and his ways* (Jasher 9:5), *and Abram knew Yahuah (the Lord) from three years old, and he went in the ways of Yahuah (the Lord) until the day of his death, as Noah and his son Shem had taught him* (Jasher 9:6). It is the school of Shem — *Blessed be Yahuah Elohim (the LORD God) of Shem* (Genesis 9:26) — from which the prophet says Yahuah drew him alone: *Look unto Abraham your father... for I called him alone, and blessed him, and increased him* (Isaiah 51:2). Stephen tells it the same way: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), and Yahuah testifies *I took your father Abraham from the other side of the flood... and multiplied his seed* (Joshua 24:3). The election is before the confession — the seed kept and chosen out of the idolatrous world.',
       sv.verse_id, ev.verse_id, 'extras', 55203
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-the-generation-serves-gods-of-wood-and-stone',
       E'The generation serves gods of wood and stone',
       E'Abram is the one knower of Yahuah in a world wholly turned to idols: *all the sons of the earth in those days greatly transgressed against Yahuah (the Lord)... and the inhabitants of the earth made to themselves, at that time, every man his god; gods of wood and stone which could neither speak, hear, nor deliver* (Jasher 9:6), *and the king and all his servants, and Terah with all his household were then the first of those that served gods of wood and stone* (Jasher 9:7). Joshua names the same fathers: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). The prophets mock the dumb idol Jasher describes: *Their idols are silver and gold, the work of men’s hands* (Psalm 115:4), *his molten image is falsehood, and there is no breath in them* (Jeremiah 10:14). The seed is chosen out of a house of idols.',
       sv.verse_id, ev.verse_id, 'extras', 55206
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator',
       E'Abram reasons from the sun and moon to the Creator',
       E'Given an understanding heart, Abram tests the host of heaven and finds them servants, not gods: he served the sun, *and when evening came the sun set as usual, and Abram said within himself, Surely this cannot be Elohim?* then *Abram saw the stars and moon... Surely this is the Elohim... and behold these his servants are gods around him*, until at dawn *Surely these are not gods that made the earth and all mankind, but these are the servants of Elohim* (Jasher 9:7). Moses had warned against the very worship Abram reasons his way out of: *lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them* (Deuteronomy 4:19). Jubilees tells the same turning: *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out?* (Jubilees 12:17). The host of heaven points past itself to the One who made it.',
       sv.verse_id, ev.verse_id, 'extras', 55209
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-9-haran-family-and-the-birth-of-sarai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* the canon names the same daughters of Haran''s house that Jasher records, Milcah and Sarai (Jasher 9:3).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-haran-family-and-the-birth-of-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Abram learns the way of Yahuah in the house of Shem, the blessed line in whose tents the knowledge of the Creator was kept (Jasher 9:5).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* the prophet names the lone calling that Jasher shows beginning in the hidden boy who knew Yahuah from three years old (Jasher 9:6).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call in Mesopotamia, the land of the idol-houses Jasher describes, before ever Abram reached Haran (Jasher 9:6).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Yahuah''s own testimony that He took Abraham out, the deliverance Jasher shows beginning in the house of Noah and Shem (Jasher 9:5).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-9-the-generation-serves-gods-of-wood-and-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* the canon names Terah the idolater exactly as Jasher does — the first of the idol-servers (Jasher 9:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-the-generation-serves-gods-of-wood-and-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men’s hands.* the gods of wood and stone that could neither speak nor hear nor deliver (Jasher 9:6) are the very dumb idols the psalm derides.'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-the-generation-serves-gods-of-wood-and-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* the prophet''s verdict on the breathless idols Jasher''s generation served (Jasher 9:6).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-the-generation-serves-gods-of-wood-and-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them,* Moses forbids the host-of-heaven worship that Abram reasons his way out of, finding sun and moon are servants, not gods (Jasher 9:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out?* Jubilees records the same reasoning — Abram turning from the host of heaven to the One in whose hand they are (Jasher 9:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

