-- ----- fragment: minion_1adameve_04.sql (session253 1-adam-eve 4) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae4 (view _session253_1ae4_lookup). Sort band base 64075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-4-lament-outside-the-garden
  ('adam-eve-conflict', '1-adam-eve', 4, 1, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The driving-out that Genesis states is the wound Adam and Eve weep over in 1 Adam & Eve 4:1.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 7, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The stony cursed soil Adam laments in 1 Adam & Eve 4:7 is the ground Yahuah cursed for his sake.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 1, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* The first cry of the first pair in 1 Adam & Eve 4:1 is the opening note of the creation-wide groan Paul still hears.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 1, 'jubilees', 'jubilees', 3, 32, 'extras', E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* Jubilees records the same going-forth from the garden that 1 Adam & Eve 4:1 mourns.'),
  -- thread: 1-adam-eve-4-altered-flesh-eyes-that-saw-angels
  ('adam-eve-conflict', '1-adam-eve', 4, 8, 'canon', 'psalms', 8, 5, 'free', E'Psalm 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The eyes that once *beheld angels praising in heaven* (1 Adam & Eve 4:8) were the crown of glory man has now dimmed.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 9, 'canon', 'romans', 3, 23, 'free', E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* The flesh-darkened eyes of 1 Adam & Eve 4:9 are the falling-short of glory Paul declares over all.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 2, 'canon', '2-corinthians', 4, 7, 'free', E'2 Corinthians 4:7 — *But we have this treasure in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us.* The altered flesh Adam weeps over in 1 Adam & Eve 4:2 becomes the earthen vessel mercy fills.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Even as Adam grieves the altered flesh, the seed-promise already runs through the woman''s line he and Eve carry in 1 Adam & Eve 4:2.'),
  -- thread: 1-adam-eve-4-cave-prison-strangers-and-pilgrims
  ('adam-eve-conflict', '1-adam-eve', 4, 3, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* The cave-prison of 1 Adam & Eve 4:3 makes Adam the first stranger and pilgrim on the earth.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 3, 'canon', 'hebrews', 11, 16, 'free', E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The exile of 1 Adam & Eve 4:3 sets the whole line longing for the city Yahuah has prepared.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 5, 'canon', '2-corinthians', 5, 4, 'free', E'2 Corinthians 5:4 — *For we that are in this tabernacle do groan, being burdened: not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life.* The gloom Adam groans under in 1 Adam & Eve 4:5 is the burdened tabernacle Paul says shall be swallowed up of life.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 3, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The place of punishment in 1 Adam & Eve 4:3 is the dust-bound mortality Genesis pronounces over Adam.'),
  -- thread: 1-adam-eve-4-bowed-to-the-order-learned-obedience
  ('adam-eve-conflict', '1-adam-eve', 4, 12, 'canon', 'hebrews', 5, 8, 'free', E'Hebrews 5:8 — *Though he were a Son, yet learned he obedience by the things which he suffered;* Adam''s bowing to Elohim''s order rather than transgress in 1 Adam & Eve 4:12 foreshadows the obedience the Son learns through suffering.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 12, 'canon', 'philippians', 2, 8, 'free', E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* The humbled obedience Adam shows in 1 Adam & Eve 4:12 is perfected by the Seed who is obedient unto death.'),
  ('adam-eve-conflict', '1-adam-eve', 4, 12, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s refusal to be again a transgressor in 1 Adam & Eve 4:12 is mercy keeping the seed-line through which the head-bruising Seed will come.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-4-lament-outside-the-garden',
       E'The first cry outside Eden — the cursed ground and the groaning creation',
       E'Adam and Eve weep over the threshold of the lost garden: *But Adam and Eve cried for having come out of the garden, their first home.* (1 Adam & Eve 4:1), and Adam measures the bare cave against the home they forfeited — *What is the soil of this cave compared with the garden land? This earth, strewed with stones; and that, planted with delicious fruit trees?* (1 Adam & Eve 4:7). This is the very sentence of Genesis unfolding in narrative: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* (Genesis 3:23), the ground itself now cursed — *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). It ain''t new: Paul names the same groan, that *the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20), and that *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). Jubilees keeps the same memory of the exit and the tilling — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* (Jubilees 3:32).',
       sv.verse_id, ev.verse_id, 'extras', 64075
  FROM _session253_1ae4_lookup sv, _session253_1ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-4-altered-flesh-eyes-that-saw-angels',
       E'Eyes of flesh — the lost glory and the treasure in earthen vessels',
       E'Adam looks at his changed body and weeps: *And indeed, when Adam looked at his flesh, that was altered, he cried bitterly* (1 Adam & Eve 4:2); the eyes that once beheld heaven are now mere flesh — *Look at your eyes, and at mine, which before beheld angels praising in heaven... But now we do not see as we did; our eyes have become of flesh; they cannot see like they used to see before.* (1 Adam & Eve 4:8-9). This is the very loss Scripture names: man was *made a little lower than the angels, and hast crowned him with glory and honour* (Psalm 8:5), and now *all have sinned, and come short of the glory of Elohim (God)* (Romans 3:23). Yet the seed-promise stands inside the ruin — Yahuah set *enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — and Paul, gazing on the same altered flesh, calls it grace: *But we have this treasure in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us.* (2 Corinthians 4:7); *though our outward man perish, yet the inward man is renewed day by day* (2 Corinthians 4:16). The body Adam mourns is the vessel mercy will yet fill.',
       sv.verse_id, ev.verse_id, 'extras', 64078
  FROM _session253_1ae4_lookup sv, _session253_1ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-4-cave-prison-strangers-and-pilgrims',
       E'The Cave of Treasures as prison — strangers and pilgrims awaiting a city',
       E'Adam names the cave their place of exile: *Look at this cave that is to be our prison in this world, and a place of punishment!* (1 Adam & Eve 4:3), and recoils from the dark rock — *What is the gloom of this cavern, compared with the light of the garden?* (1 Adam & Eve 4:5). The first family becomes the first sojourners on a ground from which dust returns to dust — *for dust thou art, and unto dust shalt thou return* (Genesis 3:19) — and the whole faithful line after them will *confess that they were strangers and pilgrims on the earth* (Hebrews 11:13), people who *desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). The groaning Adam feels in the cave Paul names exactly: *For we that are in this tabernacle do groan, being burdened... that mortality might be swallowed up of life* (2 Corinthians 5:4). It ain''t new — the prison-cave is the first chapter of the long pilgrimage home.',
       sv.verse_id, ev.verse_id, 'extras', 64081
  FROM _session253_1ae4_lookup sv, _session253_1ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-4-bowed-to-the-order-learned-obedience',
       E'He bowed to Elohim''s order — obedience kept rather than transgression',
       E'Though Adam dreads the cave, he yields to the command rather than sin again: *But he bowed to Elohim''s (God''s) orders; and said to himself, “Unless I enter the cave, I shall again be a transgressor.”* (1 Adam & Eve 4:12) — the way of obedience is kept from the very first day outside Eden, never law-as-curse but covenant submission. This is the path the promised Seed will perfect: *Though he were a Son, yet learned he obedience by the things which he suffered;* (Hebrews 5:8), and *being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). Where the first Adam''s disobedience drove him out, his submission here turns him back toward the order of Yahuah — the same enmity-and-mercy of *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) working its way through a humbled heart.',
       sv.verse_id, ev.verse_id, 'extras', 64084
  FROM _session253_1ae4_lookup sv, _session253_1ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-4-lament-outside-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The driving-out that Genesis states is the wound Adam and Eve weep over in 1 Adam & Eve 4:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-lament-outside-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The stony cursed soil Adam laments in 1 Adam & Eve 4:7 is the ground Yahuah cursed for his sake.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-lament-outside-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* The first cry of the first pair in 1 Adam & Eve 4:1 is the opening note of the creation-wide groan Paul still hears.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-lament-outside-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* Jubilees records the same going-forth from the garden that 1 Adam & Eve 4:1 mourns.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-lament-outside-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-4-altered-flesh-eyes-that-saw-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The eyes that once *beheld angels praising in heaven* (1 Adam & Eve 4:8) were the crown of glory man has now dimmed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-altered-flesh-eyes-that-saw-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* The flesh-darkened eyes of 1 Adam & Eve 4:9 are the falling-short of glory Paul declares over all.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-altered-flesh-eyes-that-saw-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 4:7 — *But we have this treasure in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us.* The altered flesh Adam weeps over in 1 Adam & Eve 4:2 becomes the earthen vessel mercy fills.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-altered-flesh-eyes-that-saw-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Even as Adam grieves the altered flesh, the seed-promise already runs through the woman''s line he and Eve carry in 1 Adam & Eve 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-altered-flesh-eyes-that-saw-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-4-cave-prison-strangers-and-pilgrims
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* The cave-prison of 1 Adam & Eve 4:3 makes Adam the first stranger and pilgrim on the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-cave-prison-strangers-and-pilgrims'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The exile of 1 Adam & Eve 4:3 sets the whole line longing for the city Yahuah has prepared.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-cave-prison-strangers-and-pilgrims'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 5:4 — *For we that are in this tabernacle do groan, being burdened: not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life.* The gloom Adam groans under in 1 Adam & Eve 4:5 is the burdened tabernacle Paul says shall be swallowed up of life.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-cave-prison-strangers-and-pilgrims'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The place of punishment in 1 Adam & Eve 4:3 is the dust-bound mortality Genesis pronounces over Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-cave-prison-strangers-and-pilgrims'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-4-bowed-to-the-order-learned-obedience
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 5:8 — *Though he were a Son, yet learned he obedience by the things which he suffered;* Adam''s bowing to Elohim''s order rather than transgress in 1 Adam & Eve 4:12 foreshadows the obedience the Son learns through suffering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-bowed-to-the-order-learned-obedience'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* The humbled obedience Adam shows in 1 Adam & Eve 4:12 is perfected by the Seed who is obedient unto death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-bowed-to-the-order-learned-obedience'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s refusal to be again a transgressor in 1 Adam & Eve 4:12 is mercy keeping the seed-line through which the head-bruising Seed will come.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae4_lookup sv, _session253_1ae4_lookup tv
 WHERE t.slug='1-adam-eve-4-bowed-to-the-order-learned-obedience'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

