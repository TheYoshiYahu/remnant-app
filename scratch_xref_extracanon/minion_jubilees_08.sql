-- ----- fragment: minion_jubilees_08.sql (session251 jubilees 8) -----
-- Source anchor: jubilees/jubilees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju08 (view _session251_ju08_lookup). Sort band base 53175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-8-generations-of-shem
  ('jubilees', 'jubilees', 8, 8, 'canon', 'genesis', 10, 25, 'free', E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Genesis names Peleg for the dividing of the earth exactly as Jubilees 8:8 does.'),
  ('jubilees', 'jubilees', 8, 5, 'canon', 'genesis', 10, 24, 'free', E'Genesis 10:24 — *And Arphaxad begat Salah; and Salah begat Eber.* The Genesis source of the Arpachshad–Shelah–Eber descent Jubilees 8:5-6 retells.'),
  ('jubilees', 'jubilees', 8, 1, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The header of the generations Jubilees 8 unfolds verse by verse.'),
  ('jubilees', 'jubilees', 8, 1, 'canon', 'genesis', 10, 21, 'free', E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* The Torah''s own framing of Shem as father of Eber, the kept line Jubilees follows.'),
  -- thread: jubilees-8-watchers-writing-on-the-rock
  ('jubilees', 'jubilees', 8, 3, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' star-omens Kainam transcribes in Jubilees 8:3 are the very teaching 1 Enoch names by name.'),
  -- thread: jubilees-8-division-of-the-earth-by-lot
  ('jubilees', 'jubilees', 8, 10, 'canon', 'genesis', 10, 32, 'free', E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The Torah''s summary of the post-Flood dividing Jubilees 8:10 stages as a casting of lots.'),
  ('jubilees', 'jubilees', 8, 10, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The bounds of the nations are the Most High''s appointment, which the lot of Jubilees 8:10-11 carries out.'),
  -- thread: jubilees-8-shem-the-centre-navel-of-the-earth
  ('jubilees', 'jubilees', 8, 18, 'canon', 'ezekiel', 5, 5, 'free', E'Ezekiel 5:5 — *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* Yahuah Himself names Jerusalem the midst of the earth that Jubilees 8:18-19 calls Zion the navel.'),
  ('jubilees', 'jubilees', 8, 18, 'canon', 'ezekiel', 38, 12, 'free', E'Ezekiel 38:12 — *To take a spoil, and to take a prey; to turn thine hand upon the desolate places that are now inhabited, and upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land.* The regathered seed dwelling in the navel of the earth — the centre Shem inherits in Jubilees 8:18.'),
  ('jubilees', 'jubilees', 8, 18, 'enoch', '1-enoch', 26, 1, 'extras', E'1 Enoch 26:1 — *And I proceeded to the middle of the earth, and saw there a blessed and fertile place, and there were many trees in it.* Enoch''s vision of the middle of the earth — the holy mountain and Zion — is the same centre Jubilees 8:18 sets at the navel of the world.'),
  -- thread: jubilees-8-blessed-be-yahuah-of-shem
  ('jubilees', 'jubilees', 8, 18, 'canon', 'genesis', 9, 26, 'free', E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Noah''s Torah blessing, quoted back word-for-word as Jubilees 8:18 records the prophecy he remembered.'),
  ('jubilees', 'jubilees', 8, 18, 'canon', 'genesis', 9, 27, 'free', E'Genesis 9:27 — *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem; and Canaan shall be his servant.* Japheth dwelling in Shem''s tents, the dwelling Jubilees 8:18 says Yahuah Himself chooses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-generations-of-shem',
       E'The generations of Shem — and Peleg, when the earth was divided',
       E'Jubilees walks the line of Shem down to the days the earth was parted: *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8). This is no new genealogy — it is Genesis told again. Moses had already written *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1), and traced the same descent: *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born* (Genesis 10:21) — *And Arphaxad begat Salah; and Salah begat Eber* (Genesis 10:24). And Genesis names Peleg for the very same reason: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan* (Genesis 10:25). It ain''t new — Jubilees keeps the Torah''s own seed-line, the kept line through which the covenant runs.',
       sv.verse_id, ev.verse_id, 'extras', 53175
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-watchers-writing-on-the-rock',
       E'Kainam finds the Watchers'' writing — the omens of sun, moon and stars',
       E'Before the earth is divided, Jubilees pauses on a buried danger: *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven* (Jubilees 8:3). This is the same corruption the live Enoch apparatus records: *Barâqîjâl taught astrology, Kôkabêl the constellations... Shamsiêl the signs of the sun, and Sariêl the course of the moon* (1 Enoch 8:2). The Watchers'' star-reading is the counterfeit of the heavenly calendar — and Kainam *wrote it down and said nothing regarding it; for he was afraid to speak to Noah about it lest he should be angry with him on account of it* (Jubilees 8:4). The true Appointed Times are engraved on the heavenly tablets and kept by Noah and the fathers; this is its dark forgery, the omen-craft that crept back in after the Flood.',
       sv.verse_id, ev.verse_id, 'extras', 53178
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-division-of-the-earth-by-lot',
       E'The earth divided by lot among Noah''s sons',
       E'At the head of the thirty-third jubilee the inheritance is parcelled out: *they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each* (Jubilees 8:10), and Noah''s sons *reached forth their hands, and took the writing out of the bosom of Noah, their father* (Jubilees 8:11). Genesis seals the same dividing: *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). And the Torah grounds it deeper still — the boundaries of the nations are not chance but appointment: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The lot in Jubilees only makes visible what the Most High had already written.',
       sv.verse_id, ev.verse_id, 'extras', 53181
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-shem-the-centre-navel-of-the-earth',
       E'Shem''s lot — the middle of the earth, Eden, Sinai and Zion the navel',
       E'The first lot falls to Shem, and it is the holy centre: *And there came forth on the writing as Shem’s lot the middle of the earth which he should take as an inheritance for himself and for his sons for the generations of eternity* (Jubilees 8:11), *that they should possess it for ever to his generations for evermore* (Jubilees 8:17). And the reason is unveiled: *he knew that the Garden of Eden is the holy of holies, and the dwelling of Yahuah (God), and Mount Sinai the centre of the desert, and Mount Zion–the centre of the navel of the earth: these three were created as holy places facing each other* (Jubilees 8:18). This is the framework''s land itself — Jerusalem at the centre of the world. Ezekiel says it plainly: *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her* (Ezekiel 5:5), and again of the regathered people *that dwell in the midst of the land* (Ezekiel 38:12). The live Enoch apparatus saw the same centre: *And I proceeded to the middle of the earth, and saw there a blessed and fertile place* (1 Enoch 26:1) — Zion, the navel, the kept inheritance of the seed.',
       sv.verse_id, ev.verse_id, 'extras', 53184
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-blessed-be-yahuah-of-shem',
       E'Blessed be Yahuah Elohim of Shem — Noah''s prophecy remembered',
       E'When Shem''s portion falls, Noah remembers his own prophecy: *Blessed be Yahuah Elohim (the LORD God) of Shem, And may Yahuah (God) dwell in the dwelling of Shem* (Jubilees 8:18), and *a blessed portion and a blessing had come to Shem and his sons to the generations for ever* (Jubilees 8:21). This is word-for-word the blessing Noah spoke in the Torah after the Flood: *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant* (Genesis 9:26) — *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem; and Canaan shall be his servant* (Genesis 9:27). It ain''t new: the dividing of the earth in Jubilees is the outworking of Genesis 9, the election of the kept line in Shem, in whose dwelling Yahuah chooses to dwell. The seed is set apart not by merit but by the blessing already spoken over it.',
       sv.verse_id, ev.verse_id, 'extras', 53187
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-8-generations-of-shem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Genesis names Peleg for the dividing of the earth exactly as Jubilees 8:8 does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:24 — *And Arphaxad begat Salah; and Salah begat Eber.* The Genesis source of the Arpachshad–Shelah–Eber descent Jubilees 8:5-6 retells.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The header of the generations Jubilees 8 unfolds verse by verse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* The Torah''s own framing of Shem as father of Eber, the kept line Jubilees follows.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-watchers-writing-on-the-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' star-omens Kainam transcribes in Jubilees 8:3 are the very teaching 1 Enoch names by name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-watchers-writing-on-the-rock'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-division-of-the-earth-by-lot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The Torah''s summary of the post-Flood dividing Jubilees 8:10 stages as a casting of lots.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-division-of-the-earth-by-lot'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The bounds of the nations are the Most High''s appointment, which the lot of Jubilees 8:10-11 carries out.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-division-of-the-earth-by-lot'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-shem-the-centre-navel-of-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 5:5 — *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* Yahuah Himself names Jerusalem the midst of the earth that Jubilees 8:18-19 calls Zion the navel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-shem-the-centre-navel-of-the-earth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 38:12 — *To take a spoil, and to take a prey; to turn thine hand upon the desolate places that are now inhabited, and upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land.* The regathered seed dwelling in the navel of the earth — the centre Shem inherits in Jubilees 8:18.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-shem-the-centre-navel-of-the-earth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 26:1 — *And I proceeded to the middle of the earth, and saw there a blessed and fertile place, and there were many trees in it.* Enoch''s vision of the middle of the earth — the holy mountain and Zion — is the same centre Jubilees 8:18 sets at the navel of the world.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-shem-the-centre-navel-of-the-earth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-blessed-be-yahuah-of-shem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Noah''s Torah blessing, quoted back word-for-word as Jubilees 8:18 records the prophecy he remembered.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-blessed-be-yahuah-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:27 — *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem; and Canaan shall be his servant.* Japheth dwelling in Shem''s tents, the dwelling Jubilees 8:18 says Yahuah Himself chooses.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-blessed-be-yahuah-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

