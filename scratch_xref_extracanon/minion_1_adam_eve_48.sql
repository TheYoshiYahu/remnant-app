-- ----- fragment: minion_1adameve_48.sql (session253 1-adam-eve 48) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch48. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae48 (view _session253_1ae48_lookup). Sort band base 65175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae48_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-48-rock-hurled-at-the-seed
  ('adam-eve-conflict', '1-adam-eve', 48, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to crush Adam and Eve under a rock is the serpent of Eden still striking at the seed of the woman, the very enmity Yahuah declared.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 3, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The war Satan opens against the first man here is the same war Yahuah promises to end by crushing Satan under the seed''s feet.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 3, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s murderous design against Adam from the first days outside Eden is the devil who sins from the beginning, whose works the Son came to destroy.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 1, 'jubilees', 'jubilees', 3, 21, 'extras', E'Jubilees 3:21 — *And He took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame. 32. And Elohim (God) cursed the serpent, and was wroth with it for ever….* Jubilees carries the same primeval history: the serpent Yahuah cursed in the garden is the same Satan now rallying his hosts to murder the man outside it.'),
  -- thread: 1-adam-eve-48-dome-of-mercy
  ('adam-eve-conflict', '1-adam-eve', 48, 7, 'canon', 'psalms', 91, 4, 'free', E'Psalm 91:4 — *He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler.* The rock Yahuah commands to dome over Adam and Eve unharmed is His covering shelter, His truth made shield and buckler against the enemy''s blow.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 7, 'canon', 'psalms', 91, 12, 'free', E'Psalm 91:12 — *They shall bear thee up in their hands, lest thou dash thy foot against a stone.* The very stone meant to crush the seed of the woman is the stone Yahuah''s keeping turns aside, exactly as the psalm promises the kept ones safety from the stone.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 5, 'canon', 'psalms', 91, 7, 'free', E'Psalm 91:7 — *A thousand shall fall at thy side, and ten thousand at thy right hand; but it shall not come nigh thee.* Though Satan summons all his hosts to take up the huge rock, the assault cannot come nigh the two Yahuah shelters under the dome.'),
  -- thread: 1-adam-eve-48-adam-prays-in-the-prison-of-rock
  ('adam-eve-conflict', '1-adam-eve', 48, 15, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam standing to pray before Yahuah through the night is the same calling on the Name that the holy line of Seth carried, the way kept long before Sinai.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 15, 'canon', 'psalms', 91, 15, 'free', E'Psalm 91:15 — *He shall call upon me, and I will answer him: I will be with him in trouble; I will deliver him, and honour him.* Adam''s prayer to be let know what has befallen him is met by Yahuah''s own promise to answer the one who calls upon Him in trouble.'),
  ('adam-eve-conflict', '1-adam-eve', 48, 14, 'canon', '1-peter', 5, 7, 'free', E'1 Peter 5:7 — *Casting all your care upon him; for he careth for you.* Eve''s counsel to rise and pray, and Adam''s standing to seek Yahuah, is the casting of all care upon the One who cares for His own, even in the prison of rock.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae48_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae48_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-48-rock-hurled-at-the-seed',
       E'The rock hurled at the seed — Satan''s old murder',
       E'Satan gathers his hosts against the man Yahuah made: *"You know that this Adam, whom Elohim (God) created out of the dust, is the one who has taken our kingdom, come, let us gather together and kill him; or hurl a rock at him and at Eve, and crush them under it."* (1 Adam and Eve 48:3) It ain''t new — this is the serpent of Eden still striking at the seed of the woman: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) Jubilees tells the same primeval war from the garden — *And Elohim (God) cursed the serpent, and was wroth with it for ever….* (Jubilees 3:21) — and the war ends where it began, under the woman''s seed: *And the Elohim (God) of peace shall bruise Satan under your feet shortly.* (Romans 16:20) For this very purpose the Son was manifested against the murderer-from-the-beginning: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8)',
       sv.verse_id, ev.verse_id, 'extras', 65175
  FROM _session253_1ae48_lookup sv, _session253_1ae48_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=48 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-48-dome-of-mercy',
       E'The dome of mercy — the falling stone made a shelter',
       E'The hurled stone never crushed them, for Yahuah turned the weapon into a shelter: *But as the rock fell down from the mountain toward Adam and Eve, Elohim (God) commanded the rock to become a dome over them, that did them no harm. And so it was by Elohim''s (God''s) order.* (1 Adam and Eve 48:7) This is the covering of the Almighty over those He keeps: *He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler.* (Psalm 91:4) The stone meant to break them could not, for the angels were charged to keep them: *For he shall give his angels charge over thee, to keep thee in all thy ways. They shall bear thee up in their hands, lest thou dash thy foot against a stone.* (Psalm 91:11–12) Though a thousand of Satan''s hosts came, the assault could not touch the seed Yahuah guarded: *A thousand shall fall at thy side, and ten thousand at thy right hand; but it shall not come nigh thee.* (Psalm 91:7)',
       sv.verse_id, ev.verse_id, 'extras', 65178
  FROM _session253_1ae48_lookup sv, _session253_1ae48_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=48 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-48-adam-prays-in-the-prison-of-rock',
       E'Adam prays in the prison of rock — calling on the Name',
       E'Waking in fear under the stone, Adam does not despair but turns to Yahuah: *Then Adam stood up and prayed before Yahuah (Lord), to let him know what had brought about this difficult time. And Adam stood praying like that until the morning.* (1 Adam and Eve 48:15) From the first generation outside Eden this is the way kept before Sinai — men calling on the Name: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26) And Yahuah answers the one who calls in trouble, the very deliverance Adam waits for through the night: *He shall call upon me, and I will answer him: I will be with him in trouble; I will deliver him, and honour him.* (Psalm 91:15) For Yahuah is no far-off judge but the careful keeper of His own: *Casting all your care upon him; for he careth for you.* (1 Peter 5:7)',
       sv.verse_id, ev.verse_id, 'extras', 65181
  FROM _session253_1ae48_lookup sv, _session253_1ae48_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=48 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-48-rock-hurled-at-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to crush Adam and Eve under a rock is the serpent of Eden still striking at the seed of the woman, the very enmity Yahuah declared.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-rock-hurled-at-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The war Satan opens against the first man here is the same war Yahuah promises to end by crushing Satan under the seed''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-rock-hurled-at-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s murderous design against Adam from the first days outside Eden is the devil who sins from the beginning, whose works the Son came to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-rock-hurled-at-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:21 — *And He took fig-leaves and sewed (them) together, and made an apron for himself, and covered his shame. 32. And Elohim (God) cursed the serpent, and was wroth with it for ever….* Jubilees carries the same primeval history: the serpent Yahuah cursed in the garden is the same Satan now rallying his hosts to murder the man outside it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-rock-hurled-at-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-48-dome-of-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 91:4 — *He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler.* The rock Yahuah commands to dome over Adam and Eve unharmed is His covering shelter, His truth made shield and buckler against the enemy''s blow.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-dome-of-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:12 — *They shall bear thee up in their hands, lest thou dash thy foot against a stone.* The very stone meant to crush the seed of the woman is the stone Yahuah''s keeping turns aside, exactly as the psalm promises the kept ones safety from the stone.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-dome-of-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 91:7 — *A thousand shall fall at thy side, and ten thousand at thy right hand; but it shall not come nigh thee.* Though Satan summons all his hosts to take up the huge rock, the assault cannot come nigh the two Yahuah shelters under the dome.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-dome-of-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-48-adam-prays-in-the-prison-of-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam standing to pray before Yahuah through the night is the same calling on the Name that the holy line of Seth carried, the way kept long before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-adam-prays-in-the-prison-of-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:15 — *He shall call upon me, and I will answer him: I will be with him in trouble; I will deliver him, and honour him.* Adam''s prayer to be let know what has befallen him is met by Yahuah''s own promise to answer the one who calls upon Him in trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-adam-prays-in-the-prison-of-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:7 — *Casting all your care upon him; for he careth for you.* Eve''s counsel to rise and pray, and Adam''s standing to seek Yahuah, is the casting of all care upon the One who cares for His own, even in the prison of rock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae48_lookup sv, _session253_1ae48_lookup tv
 WHERE t.slug='1-adam-eve-48-adam-prays-in-the-prison-of-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=48 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

