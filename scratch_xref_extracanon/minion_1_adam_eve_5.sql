-- ----- fragment: minion_1adameve_05.sql (session253 1-adam-eve 5) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae5 (view _session253_1ae5_lookup). Sort band base 64100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-5-eve-confesses-the-fall
  ('adam-eve-conflict', '1-adam-eve', 5, 5, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* This is the very deed Eve confesses in 1-adam-eve 5:5 when she says she alone caused Adam to fall from the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 4, 'canon', 'genesis', 3, 13, 'free', E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Eve''s plea that Yahuah forgive and not remember her sin in 1-adam-eve 5:4 unfolds the confession first wrung from her at the tree.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 5, 'canon', '1-timothy', 2, 14, 'free', E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Sha''ul''s verdict matches Eve''s own self-judgment in 1-adam-eve 5:5 that she alone brought Adam down.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 5, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The fall from light into darkness Eve laments in 1-adam-eve 5:5 is the entrance of sin and death that Sha''ul traces back to Eden.'),
  -- thread: 1-adam-eve-5-bone-of-his-side-one-flesh
  ('adam-eve-conflict', '1-adam-eve', 5, 9, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* This is the very act Eve recounts to Yahuah in 1-adam-eve 5:9, the bone taken from Adam''s side and the flesh restored.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 11, 'canon', 'genesis', 2, 23, 'free', E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Eve''s cry that *I and he are one* in 1-adam-eve 5:11 echoes Adam''s first word over her in Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 9, 'jubilees', 'jubilees', 3, 5, 'extras', E'Jubilees 3:5 — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs, and this rib was the origin of the woman from amongst his ribs, and He built up the flesh in its stead, and built the woman.* The restored books keep one primeval history: Jubilees tells the same making of woman that Eve recites in 1-adam-eve 5:9-10.'),
  -- thread: 1-adam-eve-5-godly-sorrow-repentance
  ('adam-eve-conflict', '1-adam-eve', 5, 6, 'canon', '2-corinthians', 7, 10, 'free', E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* Eve''s prayer that Adam be raised *that he may cry and repent* in 1-adam-eve 5:6 is exactly the sorrow-unto-life Sha''ul distinguishes from the world''s sorrow-unto-death.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 7, 'canon', 'romans', 5, 17, 'free', E'Romans 5:17 — *For if by one man''s offence death reigned by one; much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ).* The life and standing Eve begs for Adam in 1-adam-eve 5:7 is the reign-in-life that grace secures over the fall.'),
  -- thread: 1-adam-eve-5-one-flesh-die-the-same-day
  ('adam-eve-conflict', '1-adam-eve', 5, 13, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* Eve''s plea that she and Adam *die the same day* in 1-adam-eve 5:13 is the one-flesh bond of Eden refusing to be sundered even by death.'),
  ('adam-eve-conflict', '1-adam-eve', 5, 8, 'canon', '1-timothy', 2, 15, 'free', E'1 Timothy 2:15 — *Notwithstanding she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety.* As Eve fears to stand *one and alone* in 1-adam-eve 5:8, Sha''ul holds out the woman''s saving hope through the seed and the faith she keeps.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-5-eve-confesses-the-fall',
       E'Eve Owns the Transgression: ''I alone caused Your servant to fall''',
       E'Outside the garden, in the dark of the cave, Eve makes the first confession of the seed-war: *O Elohim (God), forgive me my sin, the sin which I committed, and don''t remember it against me. For I alone caused Your servant to fall from the garden into this condemned land; from light into this darkness; and from the house of joy into this prison* (1-adam-eve 5:4-5). This is the very scene of Genesis: *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat* (Genesis 3:6), and when Yahuah questioned her, *the woman said, The serpent beguiled me, and I did eat* (Genesis 3:13). It ain''t new — Sha''ul reads the same record: *And Adam was not deceived, but the woman being deceived was in the transgression* (1 Timothy 2:14), and *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The serpent''s beguiling in Eden is the first strike at the seed of the woman, and Eve''s grief is already the bruised heel longing for the promised mercy.',
       sv.verse_id, ev.verse_id, 'extras', 64100
  FROM _session253_1ae5_lookup sv, _session253_1ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-5-bone-of-his-side-one-flesh',
       E'Taken from His Side: ''I and he are one''',
       E'Eve grounds her plea in the mystery of her own making: *For You, O Elohim (God), caused him to fall asleep, and took a bone from his side, and restored the flesh in the place of it, by Your divine power. And You took me, the bone, and make me a woman... O Yahuah (Lord), I and he are one, and You, O Elohim (God), are our Creator, You are He who made us both in one day* (1-adam-eve 5:9-11). This is the creation of woman rehearsed back to the Creator: *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof* (Genesis 2:21), so that Adam cried, *This is now bone of my bones, and flesh of my flesh* (Genesis 2:23). The same primeval history is kept in Jubilees: *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs... and built the woman* (Jubilees 3:5). Because the two were made one, Eve cannot conceive of living on alone — the one-flesh bond of Eden is the very plea on which she stands.',
       sv.verse_id, ev.verse_id, 'extras', 64103
  FROM _session253_1ae5_lookup sv, _session253_1ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-5-godly-sorrow-repentance',
       E'Let Him Live to Repent: Godly Sorrow Unto Life',
       E'Eve does not ask only for Adam''s breath but for his repentance: *O Elohim (God), look at this Your servant fallen in this manner, and bring him back to life, that he may cry and repent of his transgression which he committed through me. Don''t take away his soul right now; but let him live that he may stand after the measure of his repentance, and do Your will, as before his death* (1-adam-eve 5:6-7). This is the godly sorrow Sha''ul commends: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). And the mercy she leans on is no innovation but the grace that reigns over the fall: *For if by one man''s offence death reigned by one; much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ)* (Romans 5:17). From the first day outside the garden, Yahuah''s covenant mercy keeps the seed alive to repent — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64106
  FROM _session253_1ae5_lookup sv, _session253_1ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-5-one-flesh-die-the-same-day',
       E'That We Both May Die the Same Day: Love to the Death',
       E'Eve will not be parted from the husband made one with her: *But if You do not bring him back to life, then, O Elohim (God), take away my own soul, that I be like him, and leave me not in this dungeon, one and alone; for I could not stand alone in this world, but with him only* (1-adam-eve 5:8), and again, *But if You will not give him life, then take me, even me, like him; that we both may die the same day* (1-adam-eve 5:13). This is the cleaving of Eden carried to its uttermost: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). And even here, in the woman who fell, Sha''ul holds out a saving hope through the seed she will bear: *Notwithstanding she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety* (1 Timothy 2:15). Her sorrowing fidelity over the seemingly dead Adam is the love that will not let the covenant line die.',
       sv.verse_id, ev.verse_id, 'extras', 64109
  FROM _session253_1ae5_lookup sv, _session253_1ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-5-eve-confesses-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* This is the very deed Eve confesses in 1-adam-eve 5:5 when she says she alone caused Adam to fall from the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-eve-confesses-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Eve''s plea that Yahuah forgive and not remember her sin in 1-adam-eve 5:4 unfolds the confession first wrung from her at the tree.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-eve-confesses-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Sha''ul''s verdict matches Eve''s own self-judgment in 1-adam-eve 5:5 that she alone brought Adam down.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-eve-confesses-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The fall from light into darkness Eve laments in 1-adam-eve 5:5 is the entrance of sin and death that Sha''ul traces back to Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-eve-confesses-the-fall'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-5-bone-of-his-side-one-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* This is the very act Eve recounts to Yahuah in 1-adam-eve 5:9, the bone taken from Adam''s side and the flesh restored.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-bone-of-his-side-one-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Eve''s cry that *I and he are one* in 1-adam-eve 5:11 echoes Adam''s first word over her in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-bone-of-his-side-one-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:5 — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs, and this rib was the origin of the woman from amongst his ribs, and He built up the flesh in its stead, and built the woman.* The restored books keep one primeval history: Jubilees tells the same making of woman that Eve recites in 1-adam-eve 5:9-10.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-bone-of-his-side-one-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-5-godly-sorrow-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* Eve''s prayer that Adam be raised *that he may cry and repent* in 1-adam-eve 5:6 is exactly the sorrow-unto-life Sha''ul distinguishes from the world''s sorrow-unto-death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-godly-sorrow-repentance'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:17 — *For if by one man''s offence death reigned by one; much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ).* The life and standing Eve begs for Adam in 1-adam-eve 5:7 is the reign-in-life that grace secures over the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-godly-sorrow-repentance'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-5-one-flesh-die-the-same-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* Eve''s plea that she and Adam *die the same day* in 1-adam-eve 5:13 is the one-flesh bond of Eden refusing to be sundered even by death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-one-flesh-die-the-same-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 2:15 — *Notwithstanding she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety.* As Eve fears to stand *one and alone* in 1-adam-eve 5:8, Sha''ul holds out the woman''s saving hope through the seed and the faith she keeps.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae5_lookup sv, _session253_1ae5_lookup tv
 WHERE t.slug='1-adam-eve-5-one-flesh-die-the-same-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

