-- ----- fragment: minion_1adameve_10.sql (session253 1-adam-eve 10) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae10 (view _session253_1ae10_lookup). Sort band base 64225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-10-word-raises-the-dead
  ('adam-eve-conflict', '1-adam-eve', 10, 3, 'canon', 'psalms', 107, 20, 'free', E'Psalm 107:20 — *He sent his word, and healed them, and delivered them from their destructions.* The very pattern of 1 Adam and Eve 10:3, where Elohim sends His Word to raise the dying pair from death.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 1, 'canon', 'psalms', 107, 6, 'free', E'Psalm 107:6 — *Then they cried unto Yahuah (LORD) in their trouble, and he delivered them out of their distresses.* Adam and Eve, sinking in the water and close to death (10:1), are delivered just as the redeemed cried and were brought out.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 3, 'canon', 'ezekiel', 37, 5, 'free', E'Ezekiel 37:5 — *Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live:* The Word that raises Adam and Eve from their death in 10:3 is the same Word that raises the dead in Ezekiel''s valley.'),
  -- thread: 1-adam-eve-10-the-word-is-the-logos
  ('adam-eve-conflict', '1-adam-eve', 10, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim sends to raise Adam and Eve in 10:3 is the eternal Logos John names from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 3, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comforts and raises Adam (10:3) is the same Word who would take flesh to save him.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 3, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word that raises Adam by His own power (10:3) is the Son who upholds all things and purges sin.'),
  -- thread: 1-adam-eve-10-bright-angel-to-dust
  ('adam-eve-conflict', '1-adam-eve', 10, 5, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The bright, beast-ruling estate Adam once held (10:5) is the image-and-dominion of Genesis 1.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 6, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The body now beast-like and in want of water (10:6) lives out the dust-sentence of Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 6, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Adam''s new want and toil for water (10:6) flows from his being sent out to till the ground.'),
  -- thread: 1-adam-eve-10-the-promise-and-the-seed
  ('adam-eve-conflict', '1-adam-eve', 10, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise Adam clings to in 10:8 is the seed-promise spoken at the gate of Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 8, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The promise of 10:8, fulfilled in its appointed time when the woman''s Seed was sent forth.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 8, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour Adam is promised in 10:8 was foreordained before the world''s foundation.'),
  ('adam-eve-conflict', '1-adam-eve', 10, 8, 'canon', 'revelation', 22, 3, 'free', E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him:* The garden Adam is promised to re-enter (10:8) is the curse-lifted city where the tree of life stands again.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-10-word-raises-the-dead',
       E'He Sent His Word and Raised Them',
       E'Adam and Eve lie in the water at the point of death, and the rescue comes by the Word: *Then Elohim (God) sent His Word to Adam and Eve, who raised them from their death* (1 Adam and Eve 10:3). This is no anonymous power but the same Word the psalmist names over every deliverance from the gates of death — *He sent his word, and healed them, and delivered them from their destructions* (Psalm 107:20) — and the same Word that stands over the dry-bones valley, the breath that re-enters the slain that *they may live* (Ezekiel 37:5). It ain''t new: from the first day outside the garden, life comes only by Yahuah speaking His Word over the dead.',
       sv.verse_id, ev.verse_id, 'extras', 64225
  FROM _session253_1ae10_lookup sv, _session253_1ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-10-the-word-is-the-logos',
       E'The Word Who Comes to Adam',
       E'When the angel reports the creatures have breathed their last, it is the Word Himself who acts: *Then Elohim (God) sent His Word to Adam and Eve, who raised them from their death* (1 Adam and Eve 10:3). John names this Word from the same beginning: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), the One by whom *All things were made* (John 1:3). The Word that comforts the first man is the Word that *was made flesh, and dwelt among us* (John 1:14) — the same Son by whom Elohim *made the worlds* and who upholds *all things by the word of his power* (Hebrews 1:2-3). The Comforter of Adam in the dust is the Logos who would come and save him.',
       sv.verse_id, ev.verse_id, 'extras', 64228
  FROM _session253_1ae10_lookup sv, _session253_1ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-10-bright-angel-to-dust',
       E'Once a Bright Angel, Now in Want of Water',
       E'Elohim explains the change wrought by the fall: *While you were under My command and were a bright angel, you knew not this water* (1 Adam and Eve 10:5), but now the body *is now like that of beasts, and is in want of water* (10:6). The man made *in our image, after our likeness* (Genesis 1:26) and given dominion over the beasts has, by transgression, come to share the beasts'' need. This is the sentence of Eden: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The glory dimmed to dust — yet not abandoned.',
       sv.verse_id, ev.verse_id, 'extras', 64231
  FROM _session253_1ae10_lookup sv, _session253_1ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-10-the-promise-and-the-seed',
       E'The Promise: Back to the Garden With the Righteous Seed',
       E'Adam begs to see the garden again, and Yahuah answers with the promise that governs the whole book: *I have made you a promise; when that promise is fulfilled, I will bring you back into the garden, you and your righteous descendants* (1 Adam and Eve 10:8). That promise was first spoken to the serpent — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the seed who would come *when the fulness of the time was come* (Galatians 4:4), *foreordained before the foundation of the world* (1 Peter 1:20). And its fulfilment is the garden restored: *In the midst of the street of it... was there the tree of life* (Revelation 22:2), where *there shall be no more curse* (Revelation 22:3). It ain''t new — the seed-war and the seed-promise stand from the first day outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 64234
  FROM _session253_1ae10_lookup sv, _session253_1ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-10-word-raises-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:20 — *He sent his word, and healed them, and delivered them from their destructions.* The very pattern of 1 Adam and Eve 10:3, where Elohim sends His Word to raise the dying pair from death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-word-raises-the-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 107:6 — *Then they cried unto Yahuah (LORD) in their trouble, and he delivered them out of their distresses.* Adam and Eve, sinking in the water and close to death (10:1), are delivered just as the redeemed cried and were brought out.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-word-raises-the-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:5 — *Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live:* The Word that raises Adam and Eve from their death in 10:3 is the same Word that raises the dead in Ezekiel''s valley.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-word-raises-the-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-10-the-word-is-the-logos
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim sends to raise Adam and Eve in 10:3 is the eternal Logos John names from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-word-is-the-logos'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comforts and raises Adam (10:3) is the same Word who would take flesh to save him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-word-is-the-logos'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word that raises Adam by His own power (10:3) is the Son who upholds all things and purges sin.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-word-is-the-logos'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-10-bright-angel-to-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The bright, beast-ruling estate Adam once held (10:5) is the image-and-dominion of Genesis 1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-bright-angel-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The body now beast-like and in want of water (10:6) lives out the dust-sentence of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-bright-angel-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Adam''s new want and toil for water (10:6) flows from his being sent out to till the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-bright-angel-to-dust'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-10-the-promise-and-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise Adam clings to in 10:8 is the seed-promise spoken at the gate of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-promise-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The promise of 10:8, fulfilled in its appointed time when the woman''s Seed was sent forth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-promise-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour Adam is promised in 10:8 was foreordained before the world''s foundation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-promise-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him:* The garden Adam is promised to re-enter (10:8) is the curse-lifted city where the tree of life stands again.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae10_lookup sv, _session253_1ae10_lookup tv
 WHERE t.slug='1-adam-eve-10-the-promise-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

