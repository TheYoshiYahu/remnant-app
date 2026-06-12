-- ----- fragment: minion_apocalypseofabraham_20.sql (session253 apocalypse-of-abraham 20) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa20 (view _session253_aoa20_lookup). Sort band base 67475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-20-number-the-stars
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 3, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The angel''s charge to number the stars in Apocalypse of Abraham 20:3 is the very covenant scene of Genesis 15 lifted into the heavens.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The stars-as-seed promise that AoA 20:6 makes into a nation is the oath sworn over the bound Isaac.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'hebrews', 11, 12, 'free', E'Hebrews 11:12 — *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable.* The Besorah confirms the heavenly star-count of AoA 20:6 was fulfilled in Abraham''s innumerable seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'romans', 4, 18, 'free', E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* Sha''ul reads the same star-promise rehearsed in AoA 20:6 as the faith counted to Abraham for righteousness.'),
  -- thread: apocalypse-of-abraham-20-dust-and-ashes
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 5, 'canon', 'genesis', 18, 27, 'free', E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes.* Abraham''s confession in AoA 20:5 that he is *but a man of dust and ashes* is his own self-naming from the plea for Sodom.'),
  -- thread: apocalypse-of-abraham-20-set-apart-heritage
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* The seed *set apart for me in my heritage* of AoA 20:6 is the Song of Moshe''s word that Jacob is Yahuah''s own portion.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The setting-apart of Abraham''s seed as a heritage in AoA 20:6 is the dividing of the nations around the children of Israel.'),
  -- thread: apocalypse-of-abraham-20-azazel-inveighed
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 9, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Azazel who *inveighed against* Abraham in AoA 20:9 is the wilderness-lot of the Day of Atonement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.''* The Azazel named with Abraham''s heritage in AoA 20:6 is the bound Watcher of the restored Enoch.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The fallen one set against Abraham''s portion in AoA 20:6 is the Watcher to whom all sin is ascribed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 9, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The accuser who *inveighed against* Abraham in AoA 20:9 stands already reserved in chains for judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-number-the-stars',
       E'Number the stars — so shall thy seed be',
       E'The Eternal Mighty One lifts Abraham above the firmament and sets him the same charge given at the covenant of the pieces: *"Consider from above the stars which are beneath thee, and number them for me, and make known to me their number."* (Apocalypse of Abraham 20:3) — *"As the number of the stars and their power, so will I make thy seed a nation and a people, set apart for me..."* (20:6). It ain''t new: this is Genesis 15 carried up into heaven. There the same voice *brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). The oath was doubled at the binding — *in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17), and the Besorah testifies it came to pass: *there sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude* (Hebrews 11:12). Sha''ul names it the seed-promise believed against hope — *according to that which was spoken, So shall thy seed be* (Romans 4:18).',
       sv.verse_id, ev.verse_id, 'extras', 67475
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-dust-and-ashes',
       E'But a man of dust and ashes',
       E'When the heavens are opened to him, Abraham answers from his own lowliness: *"When can I? For I am but a man of dust and ashes."* (Apocalypse of Abraham 20:4-5). The phrase is Abraham''s own from the canon — pleading for Sodom he said *Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes* (Genesis 18:27). It ain''t new: the patriarch who would father stars never forgot he was formed of the ground, and the man yet bows before the Eternal *Mighty One*.',
       sv.verse_id, ev.verse_id, 'extras', 67478
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-set-apart-heritage',
       E'A people set apart in His heritage',
       E'The promise is not numbers only but separation: *"so will I make thy seed a nation and a people, set apart for me in my heritage..."* (Apocalypse of Abraham 20:6). This is the Song of Moshe: *For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9) — and the dividing of the nations *according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Election precedes confession; the seed is set apart as Yahuah''s own heritage. Not a people replacing Israel — Israel IS the heritage.',
       sv.verse_id, ev.verse_id, 'extras', 67481
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-azazel-inveighed',
       E'Azazel inveighed against me — the accuser bound',
       E'Twice the fallen one is named: the heritage is set apart *"with Azazel"* (Apocalypse of Abraham 20:6), and Abraham protests, *"before Thou leddest me up Azazel inveighed against me. How, then... hast Thou constituted Thyself with him?"* (20:9-10). It ain''t new: Azazel is the lot driven into the wilderness — *the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD)... and to let him go for a scapegoat into the wilderness* (Leviticus 16:10). The restored Watchers'' book names him the chief of the fallen: *Bind Azâzêl hand and foot, and cast him into the darkness... to him ascribe all sin* (1 Enoch 10:4,8). Yahudah testifies of the same fate — *the angels which kept not their first estate... he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). The accuser inveighs; the system is bound.',
       sv.verse_id, ev.verse_id, 'extras', 67484
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-20-number-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The angel''s charge to number the stars in Apocalypse of Abraham 20:3 is the very covenant scene of Genesis 15 lifted into the heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The stars-as-seed promise that AoA 20:6 makes into a nation is the oath sworn over the bound Isaac.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:12 — *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable.* The Besorah confirms the heavenly star-count of AoA 20:6 was fulfilled in Abraham''s innumerable seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* Sha''ul reads the same star-promise rehearsed in AoA 20:6 as the faith counted to Abraham for righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-20-dust-and-ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes.* Abraham''s confession in AoA 20:5 that he is *but a man of dust and ashes* is his own self-naming from the plea for Sodom.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-dust-and-ashes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-20-set-apart-heritage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* The seed *set apart for me in my heritage* of AoA 20:6 is the Song of Moshe''s word that Jacob is Yahuah''s own portion.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-set-apart-heritage'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The setting-apart of Abraham''s seed as a heritage in AoA 20:6 is the dividing of the nations around the children of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-set-apart-heritage'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-20-azazel-inveighed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Azazel who *inveighed against* Abraham in AoA 20:9 is the wilderness-lot of the Day of Atonement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.''* The Azazel named with Abraham''s heritage in AoA 20:6 is the bound Watcher of the restored Enoch.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The fallen one set against Abraham''s portion in AoA 20:6 is the Watcher to whom all sin is ascribed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The accuser who *inveighed against* Abraham in AoA 20:9 stands already reserved in chains for judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

