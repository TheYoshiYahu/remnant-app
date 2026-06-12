-- ----- fragment: minion_1adameve_02.sql (session253 1-adam-eve 2) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae2 (view _session253_1ae2_lookup). Sort band base 64025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-2-out-of-the-garden
  ('adam-eve-conflict', '1-adam-eve', 2, 1, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The walking onto the unknown ground in 1 Adam and Eve 2:1 is this sending-forth lived out step by step.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 2, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The fear that lays Adam and Eve as dead before the gate (1 Adam and Eve 2:2) is the dread of the barred way home.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 3, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* The strange land Adam never saw (1 Adam and Eve 2:3) is the cursed ground he must now till.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 2, 'canon', 'genesis', 3, 18, 'free', E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field.* The earth of stones large and small that terrifies them in 1 Adam and Eve 2:2 is the thorn-bearing ground of the curse.'),
  -- thread: 1-adam-eve-2-bright-nature-lost
  ('adam-eve-conflict', '1-adam-eve', 2, 4, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The bright nature of 1 Adam and Eve 2:4 is the glory of the first-formed man, dust quickened by the breath of Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 4, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The grace of a bright nature is exchanged for hearts now bound to the earthly things of 1 Adam and Eve 2:4, the dust to which man returns.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 4, 'canon', 'psalms', 103, 14, 'free', E'Psalm 103:14 — *For he knoweth our frame; he remembereth that we are dust.* Even as the bright nature fades in 1 Adam and Eve 2:4, Yahuah''s pity reckons with the frame He formed.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The grace and bright nature lost in 1 Adam and Eve 2:4 is the very glory the Word restores when He is made flesh.'),
  -- thread: 1-adam-eve-2-word-raises-them
  ('adam-eve-conflict', '1-adam-eve', 2, 5, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim sends to raise Adam and Eve in 1 Adam and Eve 2:5 is the eternal Logos, Elohim Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 5, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word that comes to the gate in 1 Adam and Eve 2:5 is the one by whom the broad earth they fear was itself made.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 5, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets.* The Word sent to Adam in 1 Adam and Eve 2:5 begins that long speaking of Elohim to the fathers.'),
  ('adam-eve-conflict', '1-adam-eve', 2, 5, 'canon', 'psalms', 103, 8, 'free', E'Psalm 103:8 — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy.* The pity that sends the Word to raise the fallen pair in 1 Adam and Eve 2:5 is this plenteous covenant mercy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-2-out-of-the-garden',
       E'Out of the garden onto the strange earth',
       E'The first steps outside Eden: *But when our father Adam, and Eve, went out of the garden, they walked the ground on their feet, not knowing they were walking* (1 Adam and Eve 2:1), and at the broad stony earth *they feared and trembled, and fell on their faces, from the fear that came over them; and they were as dead* (1 Adam and Eve 2:2). This is the Genesis expulsion unfolded from the inside: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23), and *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). The strangeness of the land is the curse on the ground itself: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17), *Thorns also and thistles shall it bring forth to thee* (Genesis 3:18). It ain''t new -- the exile of man begins on the very first day outside the wall.',
       sv.verse_id, ev.verse_id, 'extras', 64025
  FROM _session253_1ae2_lookup sv, _session253_1ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-2-bright-nature-lost',
       E'The bright nature lost; man remembers he is dust',
       E'In Eden *they were filled with the grace of a bright nature, and they had not hearts turned toward earthly things* (1 Adam and Eve 2:4) -- the glory in which man was first formed. Genesis tells the framing and the fall of that nature: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7), yet now *for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The Psalm answers their dread of the strange earth with the mercy that knows the frame: *For he knoweth our frame; he remembereth that we are dust* (Psalm 103:14). The lost brightness is the glory the Word would one day restore in flesh -- *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14).',
       sv.verse_id, ev.verse_id, 'extras', 64028
  FROM _session253_1ae2_lookup sv, _session253_1ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-2-word-raises-them',
       E'Elohim has pity and sends His Word to raise the fallen',
       E'The chapter''s heart: *Therefore Elohim (God) had pity on them; and when He saw them fallen before the gate of the garden, He sent His Word to our father, Adam and Eve, and raised them from their fallen state* (1 Adam and Eve 2:5). This sent Word is the Logos by whom all was made -- *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), *All things were made by him; and without him was not any thing made that was made* (John 1:3) -- the same who *being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3) speaks to the fathers from the very first day (Hebrews 1:1). And the pity that stoops to the fallen pair is Yahuah''s covenant mercy: *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8). It ain''t new -- from the gate of Eden the Word comes to raise the seed of the woman.',
       sv.verse_id, ev.verse_id, 'extras', 64031
  FROM _session253_1ae2_lookup sv, _session253_1ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-2-out-of-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The walking onto the unknown ground in 1 Adam and Eve 2:1 is this sending-forth lived out step by step.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-out-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The fear that lays Adam and Eve as dead before the gate (1 Adam and Eve 2:2) is the dread of the barred way home.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-out-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* The strange land Adam never saw (1 Adam and Eve 2:3) is the cursed ground he must now till.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-out-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field.* The earth of stones large and small that terrifies them in 1 Adam and Eve 2:2 is the thorn-bearing ground of the curse.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-out-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-2-bright-nature-lost
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The bright nature of 1 Adam and Eve 2:4 is the glory of the first-formed man, dust quickened by the breath of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-bright-nature-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The grace of a bright nature is exchanged for hearts now bound to the earthly things of 1 Adam and Eve 2:4, the dust to which man returns.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-bright-nature-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 103:14 — *For he knoweth our frame; he remembereth that we are dust.* Even as the bright nature fades in 1 Adam and Eve 2:4, Yahuah''s pity reckons with the frame He formed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-bright-nature-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The grace and bright nature lost in 1 Adam and Eve 2:4 is the very glory the Word restores when He is made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-bright-nature-lost'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-2-word-raises-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim sends to raise Adam and Eve in 1 Adam and Eve 2:5 is the eternal Logos, Elohim Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word that comes to the gate in 1 Adam and Eve 2:5 is the one by whom the broad earth they fear was itself made.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets.* The Word sent to Adam in 1 Adam and Eve 2:5 begins that long speaking of Elohim to the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 103:8 — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy.* The pity that sends the Word to raise the fallen pair in 1 Adam and Eve 2:5 is this plenteous covenant mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae2_lookup sv, _session253_1ae2_lookup tv
 WHERE t.slug='1-adam-eve-2-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

