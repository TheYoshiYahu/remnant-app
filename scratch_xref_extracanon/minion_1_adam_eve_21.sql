-- ----- fragment: minion_1adameve_21.sql (session253 1-adam-eve 21) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae21 (view _session253_1ae21_lookup). Sort band base 64500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-21-sweat-of-the-face
  ('adam-eve-conflict', '1-adam-eve', 21, 2, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sweat that beats on their faces in 1 Adam and Eve 21:2 is the exact sentence of the ground spoken in the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 3, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The dust-formed man of 21:3 stands at the western gate of the very garden where that breath was first given.'),
  -- thread: 1-adam-eve-21-satan-drives-to-despair
  ('adam-eve-conflict', '1-adam-eve', 21, 4, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Adam''s torn flesh and near death in 21:4 is the devouring lion at work on the seed from the very first day outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 7, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The despair that throws Eve after Adam in 21:7 is the deceiver''s craft, dressing destruction up as devotion.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 4, 'canon', 'psalms', 22, 15, 'free', E'Psalm 22:15 — *My strength is dried up like a potsherd; and my tongue cleaveth to my jaws; and thou hast brought me into the dust of death.* The blood-loss and dust-death of 21:4 is the same dust of death the suffering righteous one would later cry from.'),
  -- thread: 1-adam-eve-21-eve-the-woman-and-the-seed
  ('adam-eve-conflict', '1-adam-eve', 21, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Eve''s "through me" in 21:6 names the very woman whose seed is promised to bruise the serpent''s head.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 6, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The despair Satan stirs in Eve at 21:6 is answered by the certain crushing of the very one who stirs it.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 6, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who sins "from the beginning" is the very one assaulting the first parents at 21:6 — and the Son is manifested to undo his work.'),
  -- thread: 1-adam-eve-21-the-word-raises-and-the-5500-years
  ('adam-eve-conflict', '1-adam-eve', 21, 8, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to raise Adam and Eve in 21:8 is the Logos who was in the beginning, Elohim Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 8, 'canon', 'john', 11, 25, 'free', E'John 11:25 — *Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live:* The Word who raises the dead Adam and Eve in 21:8 is the same Resurrection-and-Life who would later raise Lazarus.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 9, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The covenant of the 5,500 years in 21:9 is the appointed measure of that fulness of time, kept from the first day.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 9, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The 5,500-year covenant of 21:9 is the open declaration of the Saviour foreordained before the foundation, now reckoned out to His coming.'),
  ('adam-eve-conflict', '1-adam-eve', 21, 8, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word sent to raise them in 21:8 is the one upholding all things by the word of his power.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-21-sweat-of-the-face',
       E'The heat beat like a flame — the curse of the ground outside Eden',
       E'Driven from the garden, Adam and Eve go back in search of it, and the very approach scorches them: *And the heat beat like a flame on their faces; and they sweated from the heat, and cried before Yahuah (Lord)* (1 Adam and Eve 21:2). The sweat on the brow is the precise sentence Yahuah spoke over Adam in the garden: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The garden that received the breath of life — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — now bars the dust-formed man with a wall of heat. It ain''t new: the conflict outside the gate is the curse of the ground, already pronounced.',
       sv.verse_id, ev.verse_id, 'extras', 64500
  FROM _session253_1ae21_lookup sv, _session253_1ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-21-satan-drives-to-despair',
       E'The leap from the mountain — Satan drives the seed to self-destruction',
       E'Adam casts himself off the height: *Then Adam threw himself down from the top of that mountain; his face was torn and his flesh was ripped; he lost a lot of blood and was close to death* (1 Adam and Eve 21:4); and Eve, charging herself with all of it, follows him down: *Then she threw herself after him; and was torn and ripped by stones; and remained lying as dead* (1 Adam and Eve 21:7). This despair unto death is the adversary''s signature: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14), and *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The serpent struck at the heel in the garden; now he hunts the seed of the woman to swallow it whole. The dust-tongue cry — *My strength is dried up like a potsherd; and my tongue cleaveth to my jaws; and thou hast brought me into the dust of death* (Psalm 22:15) — is sung first by the first parents at the foot of the cliff. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64503
  FROM _session253_1ae21_lookup sv, _session253_1ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-21-eve-the-woman-and-the-seed',
       E'I will not live after him — through me — and the enmity of the seed',
       E'Eve names herself the cause: *And she said, "I don''t wish to live after him; for all that he did to himself was through me"* (1 Adam and Eve 21:6). Her self-accusation reaches back to the word spoken over the serpent and the woman in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The woman through whom the fall came is the very woman through whom the Bruiser of the serpent''s head will come — and the promise of the crushing already stands: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). Satan drives Eve to despair precisely because she carries the seed of his undoing.',
       sv.verse_id, ev.verse_id, 'extras', 64506
  FROM _session253_1ae21_lookup sv, _session253_1ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-21-the-word-raises-and-the-5500-years',
       E'He sent His Word and raised them — the covenant of the 5,500 years',
       E'At the foot of the cliff the Word of Elohim comes and lifts the dead: *But the merciful Elohim (God), who looks over His creatures, looked at Adam and Eve as they lay dead, and He sent His Word to them, and raised them* (1 Adam and Eve 21:8), with the unbreakable pledge: *neither will it alter the covenant of the 5, 500 years* (1 Adam and Eve 21:9) — the appointed reckoning until the Saviour comes. The Word who is sent is the Logos by whom all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), *And the Word was made flesh, and dwelt among us* (John 1:14). The 5,500 years is the fulness of time foretold from the first day: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — a coming *foreordained before the foundation of the world, but... manifest in these last times* (1 Peter 1:20). And the raising of the dead Adam is the first sign of the Resurrection itself, who *upholding all things by the word of his power* (Hebrews 1:3) would say *I am the resurrection, and the life* (John 11:25). It ain''t new: the Messiah is promised, and the dead are raised, on the very first day outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 64509
  FROM _session253_1ae21_lookup sv, _session253_1ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-21-sweat-of-the-face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sweat that beats on their faces in 1 Adam and Eve 21:2 is the exact sentence of the ground spoken in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-sweat-of-the-face'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The dust-formed man of 21:3 stands at the western gate of the very garden where that breath was first given.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-sweat-of-the-face'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-21-satan-drives-to-despair
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Adam''s torn flesh and near death in 21:4 is the devouring lion at work on the seed from the very first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-satan-drives-to-despair'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The despair that throws Eve after Adam in 21:7 is the deceiver''s craft, dressing destruction up as devotion.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-satan-drives-to-despair'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:15 — *My strength is dried up like a potsherd; and my tongue cleaveth to my jaws; and thou hast brought me into the dust of death.* The blood-loss and dust-death of 21:4 is the same dust of death the suffering righteous one would later cry from.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-satan-drives-to-despair'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-21-eve-the-woman-and-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Eve''s "through me" in 21:6 names the very woman whose seed is promised to bruise the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-eve-the-woman-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The despair Satan stirs in Eve at 21:6 is answered by the certain crushing of the very one who stirs it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-eve-the-woman-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who sins "from the beginning" is the very one assaulting the first parents at 21:6 — and the Son is manifested to undo his work.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-eve-the-woman-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-21-the-word-raises-and-the-5500-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to raise Adam and Eve in 21:8 is the Logos who was in the beginning, Elohim Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-the-word-raises-and-the-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 11:25 — *Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live:* The Word who raises the dead Adam and Eve in 21:8 is the same Resurrection-and-Life who would later raise Lazarus.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-the-word-raises-and-the-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The covenant of the 5,500 years in 21:9 is the appointed measure of that fulness of time, kept from the first day.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-the-word-raises-and-the-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The 5,500-year covenant of 21:9 is the open declaration of the Saviour foreordained before the foundation, now reckoned out to His coming.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-the-word-raises-and-the-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word sent to raise them in 21:8 is the one upholding all things by the word of his power.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae21_lookup sv, _session253_1ae21_lookup tv
 WHERE t.slug='1-adam-eve-21-the-word-raises-and-the-5500-years'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

