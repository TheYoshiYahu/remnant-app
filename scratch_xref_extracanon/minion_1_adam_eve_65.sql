-- ----- fragment: minion_1adameve_65.sql (session253 1-adam-eve 65) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch65. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae65 (view _session253_1ae65_lookup). Sort band base 65600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae65_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-65-earthy-of-the-dust
  ('adam-eve-conflict', '1-adam-eve', 65, 9, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Adam''s confession that they are now *earthy and of the dust* (65:9) names again the very dust he was formed from.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 9, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The altered, earthy body of 65:9 is the working-out of the sentence of dust pronounced in Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 9, 'canon', '1-corinthians', 15, 47, 'free', E'1 Corinthians 15:47 — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* Adam owning that they are now *earthy* (65:9) is the first half of the contrast whose second man is the promised Saviour from heaven.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 7, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* The bodily alteration that makes Adam and Eve weep (65:7) is the first groan of the whole creation subjected to corruption with him.'),
  -- thread: 1-adam-eve-65-food-that-defiles-surely-die
  ('adam-eve-conflict', '1-adam-eve', 65, 3, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Their fear that eating will kill them (65:3-4) echoes the first warning that eating brings death.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 4, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* Adam''s pain over the food (65:4) is the sorrow-in-eating decreed when the ground was cursed.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 4, 'canon', 'genesis', 3, 18, 'free', E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field.* The coarse earthly food that sickens them (65:4) is the herb of the cursed field they were sentenced to eat.'),
  -- thread: 1-adam-eve-65-hope-of-the-garden-lost
  ('adam-eve-conflict', '1-adam-eve', 65, 7, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Their settled knowledge that they cannot enter the garden (65:7) is the expulsion to till the ground made conscious.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 8, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The garden their flesh can no longer enter (65:8) is the way now kept by the cherubim and the flaming sword.'),
  -- thread: 1-adam-eve-65-great-mercy-and-the-promise-to-save
  ('adam-eve-conflict', '1-adam-eve', 65, 5, 'canon', 'psalms', 103, 14, 'free', E'Psalm 103:14 — *For he knoweth our frame; he remembereth that we are dust.* Adam appeals to Yahuah''s *great mercy* (65:5) toward a frame that has just become earthy and of the dust.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise to *save us, and to bring us again into the garden* (65:9) rests on the seed-promise that will crush the serpent''s head.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 9, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The day Yahuah promised to save Adam (65:9) is the appointed fulness of time when the seed of the woman was sent.'),
  ('adam-eve-conflict', '1-adam-eve', 65, 5, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise Adam trusts (65:5) is fulfilled when the Word who comforted him took the very flesh of dust to dwell among men.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae65_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae65_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-65-earthy-of-the-dust',
       E'Now we are earthy and of the dust',
       E'Outside the garden the very food alters them: *Then Adam and Eve came back into the cave sorrowful and crying because of the alteration of their bodies. And they both knew from that hour that they were altered beings* (1 Adam & Eve 65:7), and Adam confesses *from now on we are earthy and of the dust, and of the inhabitants of the earth* (65:9). It ain''t new — this is the very frame Yahuah named at the forming: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7), the dust to which the curse returns him: *for dust thou art, and unto dust shalt thou return* (Genesis 3:19). Sha''ul carries the same two-Adam pattern — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47) — and the whole creation that fell with Adam now *groaneth and travaileth in pain together until now* (Romans 8:22), waiting for the deliverance the cave-dwellers were promised.',
       sv.verse_id, ev.verse_id, 'extras', 65600
  FROM _session253_1ae65_lookup sv, _session253_1ae65_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=65 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-65-food-that-defiles-surely-die',
       E'Defiled by the food — surely die',
       E'The strange earthly food makes them sick, and they cry *It would have been better for us to have died keeping our bodies pure than to have eaten and defiled them with food* (1 Adam & Eve 65:3); Adam fears *that Elohim (God) means to kill us with this pain before He has fulfilled His promise to us* (65:4). The dread of death-by-eating is the old wound: *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17). And the toil and sorrow now bound to eating is the very curse on the ground — *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17) — for *thou shalt eat the herb of the field* (Genesis 3:18). Every bite outside Eden carries the memory of the forbidden bite within it.',
       sv.verse_id, ev.verse_id, 'extras', 65603
  FROM _session253_1ae65_lookup sv, _session253_1ae65_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=65 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-65-hope-of-the-garden-lost',
       E'All hope of returning to the garden lost',
       E'Now they know it for certain: *all hope of returning to the garden was now lost; and that they could not enter it* (1 Adam & Eve 65:7), *for that now their bodies had strange functions; and all flesh that requires food and drink for its existence, cannot be in the garden* (65:8). This is the door shut in Genesis: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23), and *he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). Yet Adam''s grief is not despair — he adds *until the day in which Elohim (God) has promised to save us, and to bring us again into the garden* (65:9): the closed way is the same way the second Adam will open.',
       sv.verse_id, ev.verse_id, 'extras', 65606
  FROM _session253_1ae65_lookup sv, _session253_1ae65_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=65 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-65-great-mercy-and-the-promise-to-save',
       E'Deal with us according to Your great mercy',
       E'Adam pleads not on his worth but on Yahuah''s heart: *but deal with us according to Your great mercy, and forsake us not until the day of the promise You have made us* (1 Adam & Eve 65:5), and he names that promise — the day Yahuah *has promised to save us* (65:9). This is the same tenderness the psalmist sings: *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him. For he knoweth our frame; he remembereth that we are dust* (Psalm 103:13-14). And the promise Adam clings to is the seed-promise spoken over the serpent — *it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — kept until *the fulness of the time was come* and *Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4), when *the Word was made flesh, and dwelt among us* (John 1:14). The Word who first comforted Adam is the Word who came to save him.',
       sv.verse_id, ev.verse_id, 'extras', 65609
  FROM _session253_1ae65_lookup sv, _session253_1ae65_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=65 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-65-earthy-of-the-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Adam''s confession that they are now *earthy and of the dust* (65:9) names again the very dust he was formed from.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-earthy-of-the-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The altered, earthy body of 65:9 is the working-out of the sentence of dust pronounced in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-earthy-of-the-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:47 — *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* Adam owning that they are now *earthy* (65:9) is the first half of the contrast whose second man is the promised Saviour from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-earthy-of-the-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* The bodily alteration that makes Adam and Eve weep (65:7) is the first groan of the whole creation subjected to corruption with him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-earthy-of-the-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-65-food-that-defiles-surely-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Their fear that eating will kill them (65:3-4) echoes the first warning that eating brings death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-food-that-defiles-surely-die'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* Adam''s pain over the food (65:4) is the sorrow-in-eating decreed when the ground was cursed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-food-that-defiles-surely-die'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field.* The coarse earthly food that sickens them (65:4) is the herb of the cursed field they were sentenced to eat.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-food-that-defiles-surely-die'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-65-hope-of-the-garden-lost
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Their settled knowledge that they cannot enter the garden (65:7) is the expulsion to till the ground made conscious.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-hope-of-the-garden-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The garden their flesh can no longer enter (65:8) is the way now kept by the cherubim and the flaming sword.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-hope-of-the-garden-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-65-great-mercy-and-the-promise-to-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:14 — *For he knoweth our frame; he remembereth that we are dust.* Adam appeals to Yahuah''s *great mercy* (65:5) toward a frame that has just become earthy and of the dust.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-great-mercy-and-the-promise-to-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise to *save us, and to bring us again into the garden* (65:9) rests on the seed-promise that will crush the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-great-mercy-and-the-promise-to-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The day Yahuah promised to save Adam (65:9) is the appointed fulness of time when the seed of the woman was sent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-great-mercy-and-the-promise-to-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise Adam trusts (65:5) is fulfilled when the Word who comforted him took the very flesh of dust to dwell among men.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae65_lookup sv, _session253_1ae65_lookup tv
 WHERE t.slug='1-adam-eve-65-great-mercy-and-the-promise-to-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=65 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

