-- ----- fragment: minion_1adameve_36.sql (session253 1-adam-eve 36) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae36 (view _session253_1ae36_lookup). Sort band base 64875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-36-cherub-flaming-sword
  ('adam-eve-conflict', '1-adam-eve', 36, 1, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub with the sword of fire who gives Adam the figs in 1 Adam and Eve 36:1 is the same guardian set at the gate of Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 2, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The cherub obeying Yahuah''s command to serve fallen Adam in 1 Adam and Eve 36:2 is exactly this ministering spirit sent for the heir of mercy.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 4, 'jubilees', 'jubilees', 3, 26, 'extras', E'Jubilees 3:26 — *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden.* Jubilees carries the same exit from Eden whose threshold the fire-armed cherub guards in 1 Adam and Eve 36:4.'),
  -- thread: 1-adam-eve-36-where-are-you-the-word
  ('adam-eve-conflict', '1-adam-eve', 36, 2, 'canon', 'genesis', 3, 9, 'free', E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* 1 Adam and Eve 36:2 quotes this same call of the Word, "Adam, Adam, where are you?"'),
  ('adam-eve-conflict', '1-adam-eve', 36, 3, 'canon', 'genesis', 3, 10, 'free', E'Genesis 3:10 — *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* Adam''s answer in 1 Adam and Eve 36:3 repeats this confession of hearing the voice, fearing, and hiding because naked.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 2, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The book names the One walking and speaking in Eden as "the Word of Elohim" in 1 Adam and Eve 36:2 — the Logos who was from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 3, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Adam''s hiding because he is naked in 1 Adam and Eve 36:3 is undone before the Word from whom nothing is hidden.'),
  -- thread: 1-adam-eve-36-figs-of-the-hiding-trees
  ('adam-eve-conflict', '1-adam-eve', 36, 2, 'canon', 'genesis', 3, 8, 'free', E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* 1 Adam and Eve 36:2 names these as the very trees among which they hid, from which the figs are now taken.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 7, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The fig the pair recognize in 1 Adam and Eve 36:7 is the fruit of the same fig-tree whose leaves first covered their shame.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 7, 'jubilees', 'jubilees', 3, 21, 'extras', E'Jubilees 3:21 — *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked.* Jubilees ties the fig-leaves to the opened eyes of the fall, the same figs the pair recognize in 1 Adam and Eve 36:7.'),
  -- thread: 1-adam-eve-36-angels-trembled-now-adam-fears
  ('adam-eve-conflict', '1-adam-eve', 36, 5, 'canon', 'psalms', 8, 5, 'free', E'Psalm 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The glory at which angels once trembled in 1 Adam and Eve 36:5 is the crown of man Psalm 8 confesses, now darkened by the fall so that Adam fears them.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 5, 'canon', 'hebrews', 2, 7, 'free', E'Hebrews 2:7 — *Thou madest him a little lower than the angels; thou crownedst him with glory and honour, and didst set him over the works of thy hands.* The dominion and glory reversed in 1 Adam and Eve 36:5 is the very crown of man Hebrews says is yet to be restored in the Son.'),
  ('adam-eve-conflict', '1-adam-eve', 36, 5, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* Even as Adam now fears the angels in 1 Adam and Eve 36:5, the angels remain Yahuah''s servants sent to minister to the heirs of mercy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-36-cherub-flaming-sword',
       E'The cherub of the flaming sword, sent to serve',
       E'Outside the garden the same guardian who barred the way is sent to carry mercy back: *Then Elohim (God) commanded the cherub, who kept the gate of the garden with a sword of fire in his hand, to take some of the fruit of the fig-tree, and to give it to Adam* (1 Adam and Eve 36:1), and *The cherub obeyed the command of Yahuah Elohim (the LORD God), and went into the garden and brought two figs on two twigs* (1 Adam and Eve 36:2). This is the very cherub of Genesis — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24) — now bending to a word of grace. The angels are not Adam''s lords but Yahuah''s servants for Adam''s sake: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). And Jubilees keeps the same primeval scene, the garden and its trees held holy and apportioned: *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26).',
       sv.verse_id, ev.verse_id, 'extras', 64875
  FROM _session253_1ae36_lookup sv, _session253_1ae36_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=36 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-36-where-are-you-the-word',
       E'The Word who came and called, Where are you?',
       E'The narrator names the Voice that walked in Eden as the Word, and rehearses the very question of the fall: *the Word of Elohim (God) came to Adam and Eve and said to them, "Adam, Adam, where are you?"* (1 Adam and Eve 36:2), and *And Adam answered, "O Elohim (God), here I am. When I heard the sound of You and Your voice, I hid myself, because I am naked"* (1 Adam and Eve 36:3). It is the scene of Genesis word for word — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* (Genesis 3:9), *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself* (Genesis 3:10). That walking, speaking Word is the Logos by whom all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1). And no hiding avails before Him: *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13).',
       sv.verse_id, ev.verse_id, 'extras', 64878
  FROM _session253_1ae36_lookup sv, _session253_1ae36_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=36 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-36-figs-of-the-hiding-trees',
       E'Figs from the trees among which they hid',
       E'The mercy is tender and pointed: the figs come from the very trees that had been their hiding place. *they were from two of the trees among which Adam and Eve hid themselves when Elohim (God) went to walk in the garden* (1 Adam and Eve 36:2), and when they take them, *they looked at them, and knew they were from the trees among which they had hidden themselves* (1 Adam and Eve 36:7). Genesis joins fig-leaf and hiding in one breath — *and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7), then *Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden* (Genesis 3:8). Jubilees keeps both the figs and the unknowing nakedness of that day: *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate* (Jubilees 3:21).',
       sv.verse_id, ev.verse_id, 'extras', 64881
  FROM _session253_1ae36_lookup sv, _session253_1ae36_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=36 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-36-angels-trembled-now-adam-fears',
       E'Once angels trembled at Adam; now Adam fears them',
       E'One verse measures the whole fall as a reversal of glory: *At first, angels trembled at the presence of Adam and were afraid of him. But now Adam trembled before the angels and was afraid of them* (1 Adam and Eve 36:5). Scripture remembers the crown that was lost — *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4), *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour* (Psalm 8:5). The New Testament takes up that same psalm of man''s dominion now broken yet to be restored in the Son: *Thou madest him a little lower than the angels; thou crownedst him with glory and honour, and didst set him over the works of thy hands* (Hebrews 2:7). Even so the angels remain servants of the redeemed, not their dread: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14).',
       sv.verse_id, ev.verse_id, 'extras', 64884
  FROM _session253_1ae36_lookup sv, _session253_1ae36_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=36 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-36-cherub-flaming-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cherub with the sword of fire who gives Adam the figs in 1 Adam and Eve 36:1 is the same guardian set at the gate of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The cherub obeying Yahuah''s command to serve fallen Adam in 1 Adam and Eve 36:2 is exactly this ministering spirit sent for the heir of mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:26 — *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden.* Jubilees carries the same exit from Eden whose threshold the fire-armed cherub guards in 1 Adam and Eve 36:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-36-where-are-you-the-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* 1 Adam and Eve 36:2 quotes this same call of the Word, "Adam, Adam, where are you?"'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-where-are-you-the-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:10 — *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* Adam''s answer in 1 Adam and Eve 36:3 repeats this confession of hearing the voice, fearing, and hiding because naked.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-where-are-you-the-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The book names the One walking and speaking in Eden as "the Word of Elohim" in 1 Adam and Eve 36:2 — the Logos who was from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-where-are-you-the-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Adam''s hiding because he is naked in 1 Adam and Eve 36:3 is undone before the Word from whom nothing is hidden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-where-are-you-the-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-36-figs-of-the-hiding-trees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* 1 Adam and Eve 36:2 names these as the very trees among which they hid, from which the figs are now taken.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-figs-of-the-hiding-trees'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The fig the pair recognize in 1 Adam and Eve 36:7 is the fruit of the same fig-tree whose leaves first covered their shame.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-figs-of-the-hiding-trees'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:21 — *And when she had first covered her shame with fig-leaves, she gave thereof to Adam and he ate, and his eyes were opened, and he saw that he was naked.* Jubilees ties the fig-leaves to the opened eyes of the fall, the same figs the pair recognize in 1 Adam and Eve 36:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-figs-of-the-hiding-trees'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-36-angels-trembled-now-adam-fears
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The glory at which angels once trembled in 1 Adam and Eve 36:5 is the crown of man Psalm 8 confesses, now darkened by the fall so that Adam fears them.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-angels-trembled-now-adam-fears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 2:7 — *Thou madest him a little lower than the angels; thou crownedst him with glory and honour, and didst set him over the works of thy hands.* The dominion and glory reversed in 1 Adam and Eve 36:5 is the very crown of man Hebrews says is yet to be restored in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-angels-trembled-now-adam-fears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* Even as Adam now fears the angels in 1 Adam and Eve 36:5, the angels remain Yahuah''s servants sent to minister to the heirs of mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae36_lookup sv, _session253_1ae36_lookup tv
 WHERE t.slug='1-adam-eve-36-angels-trembled-now-adam-fears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

