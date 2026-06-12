-- ----- fragment: minion_1adameve_50.sql (session253 1-adam-eve 50) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae50 (view _session253_1ae50_lookup). Sort band base 65225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-50-mercy-day-and-night
  ('adam-eve-conflict', '1-adam-eve', 50, 3, 'canon', 'psalms', 130, 1, 'free', E'Psalm 130:1 — *Out of the depths have I cried unto thee, O Yahuah (LORD).* Adam and Eve praying through the whole night and begging for mercy in 1-adam-eve 50:3 is this very cry de profundis from the first generation outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 1, 'canon', 'psalms', 130, 6, 'free', E'Psalm 130:6 — *My soul waiteth for Yahuah (Lord) more than they that watch for the morning: I say, more than they that watch for the morning.* They stand praying in the cave the whole day until evening (50:1) — the watch of those who wait on Yahuah more than the morning-watch.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 3, 'canon', 'lamentations', 3, 22, 'free', E'Lamentations 3:22 — *It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* The mercy Adam and Eve beg through the night (50:3) is the unfailing covenant mercy that keeps the seed of the woman from being consumed.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 3, 'canon', 'lamentations', 3, 23, 'free', E'Lamentations 3:23 — *They are new every morning: great is thy faithfulness.* When the day dawns upon their night of prayer (50:3-4), Yahuah''s compassions are new with the morning, His faithfulness keeping the holy line.'),
  -- thread: 1-adam-eve-50-naked-again-seeking-covering
  ('adam-eve-conflict', '1-adam-eve', 50, 5, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Standing stained and naked and unable to do the work in 1-adam-eve 50:5 reopens the garden''s first nakedness, where human handiwork could not truly cover.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 6, 'canon', 'matthew', 6, 31, 'free', E'Matthew 6:31 — *Therefore take no thought, saying, What shall we eat? or, What shall we drink? or, Wherewithal shall we be clothed?* Adam ceasing from his own failed effort and asking Elohim to show him a covering (50:6) is the very turning the Master commands against anxious self-provision.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 6, 'canon', 'matthew', 6, 32, 'free', E'Matthew 6:32 — *(For after all these things do the Gentiles seek:) for your heavenly Father knoweth that ye have need of all these things.* When Adam asks Elohim to show him wherewith to clothe them (50:6), he leans on the Father who already knows their need.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 6, 'canon', 'psalms', 121, 1, 'free', E'Psalm 121:1 — *I will lift up mine eyes unto the hills, from whence cometh my help.* Adam standing to ask Elohim rather than yielding to Satan''s despair (50:6) is the seed lifting his eyes for help from above.'),
  -- thread: 1-adam-eve-50-word-clothes-with-skins
  ('adam-eve-conflict', '1-adam-eve', 50, 7, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1-adam-eve 50:7 is this eternal Logos, Elohim Himself, walking with the first man.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 7, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comforts and provides for Adam (50:7) would in the fulness of time be made flesh to dwell among men.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 7, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to Adam at the seashore (50:7) is the first of those sundry times and manners in which Elohim spake to the fathers.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 7, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The Word directing them to skins of slain sheep for garments (50:7) repeats the garden''s first covering of skins, a lamb''s death clothing the guilty.'),
  ('adam-eve-conflict', '1-adam-eve', 50, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covering of sheep-skins (50:7) is mercy toward the seed of the woman, sustaining the line through which the serpent''s head would be bruised.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-50-mercy-day-and-night',
       E'Crying for mercy in the Cave, day and night',
       E'In the Cave of Treasures Adam and Eve keep the watch of prayer: *Then Adam and Eve went forth and came into the Cave of Treasures, and they stood praying in it the whole of that day, until the evening* (1 Adam and Eve 50:1), and *Adam and Eve rose again and prayed to Elohim (God) in the cave the whole of that night, and begged for mercy from Him* (1 Adam and Eve 50:3). This is the cry of the seed of the woman out of the depths — *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1) — *My soul waiteth for Yahuah (Lord) more than they that watch for the morning* (Psalm 130:6). And the mercy they beg is the very mercy that keeps the covenant seed: *It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22); *They are new every morning: great is thy faithfulness* (Lamentations 3:23). It ain''t new: from the first days outside the garden the line is kept by Yahuah''s mercy, not by their own strength.',
       sv.verse_id, ev.verse_id, 'extras', 65225
  FROM _session253_1ae50_lookup sv, _session253_1ae50_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=50 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-50-naked-again-seeking-covering',
       E'Naked again, seeking a covering for the body',
       E'Their fire-singed garments gone, Adam and Eve go out and *looked for something to cover their bodies with. But they found nothing, and knew not how to do the work. Yet their bodies were stained, and they were speechless from cold and heat* (1 Adam and Eve 50:5), and *Adam stood and asked Elohim (God) to show him something with which to cover their bodies* (1 Adam and Eve 50:6). This is the old wound of the garden reopened: *the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7) — and as fig-leaf aprons could not cover, so now their own hands *knew not how to do the work*. The Master teaches the same lesson: stop the anxious self-effort and ask the Father — *take no thought, saying... Wherewithal shall we be clothed?* (Matthew 6:31); *for your heavenly Father knoweth that ye have need of all these things* (Matthew 6:32). Adam does not despair (Satan''s snare) but lifts his eyes for help: *I will lift up mine eyes unto the hills, from whence cometh my help* (Psalm 121:1).',
       sv.verse_id, ev.verse_id, 'extras', 65228
  FROM _session253_1ae50_lookup sv, _session253_1ae50_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=50 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-50-word-clothes-with-skins',
       E'The Word of Elohim comes and clothes them with skins',
       E'Then the Logos answers the cry: *Then came the Word of Elohim (God) and said to him, "O Adam, take Eve and come to the seashore where you fasted before. There you will find skins of sheep that were left after lions ate the carcasses. Take them and make garments for yourselves, and clothe yourselves with them."* (1 Adam and Eve 50:7). The One who comes and speaks is the Word who was from the beginning: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *And the Word was made flesh, and dwelt among us* (John 1:14); *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1). And the skins of slain sheep repeat the garden''s first sacrifice, the covering Yahuah Himself made: *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21) — a death of the flock to cover the guilty, pointing to the seed who would bruise the serpent''s head (Genesis 3:15). It ain''t new: from the first day outside Eden, the Word provides, and a lamb''s death covers shame.',
       sv.verse_id, ev.verse_id, 'extras', 65231
  FROM _session253_1ae50_lookup sv, _session253_1ae50_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=50 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-50-mercy-day-and-night
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 130:1 — *Out of the depths have I cried unto thee, O Yahuah (LORD).* Adam and Eve praying through the whole night and begging for mercy in 1-adam-eve 50:3 is this very cry de profundis from the first generation outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-mercy-day-and-night'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 130:6 — *My soul waiteth for Yahuah (Lord) more than they that watch for the morning: I say, more than they that watch for the morning.* They stand praying in the cave the whole day until evening (50:1) — the watch of those who wait on Yahuah more than the morning-watch.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-mercy-day-and-night'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 3:22 — *It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* The mercy Adam and Eve beg through the night (50:3) is the unfailing covenant mercy that keeps the seed of the woman from being consumed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-mercy-day-and-night'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Lamentations 3:23 — *They are new every morning: great is thy faithfulness.* When the day dawns upon their night of prayer (50:3-4), Yahuah''s compassions are new with the morning, His faithfulness keeping the holy line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-mercy-day-and-night'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-50-naked-again-seeking-covering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Standing stained and naked and unable to do the work in 1-adam-eve 50:5 reopens the garden''s first nakedness, where human handiwork could not truly cover.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-naked-again-seeking-covering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:31 — *Therefore take no thought, saying, What shall we eat? or, What shall we drink? or, Wherewithal shall we be clothed?* Adam ceasing from his own failed effort and asking Elohim to show him a covering (50:6) is the very turning the Master commands against anxious self-provision.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-naked-again-seeking-covering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:32 — *(For after all these things do the Gentiles seek:) for your heavenly Father knoweth that ye have need of all these things.* When Adam asks Elohim to show him wherewith to clothe them (50:6), he leans on the Father who already knows their need.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-naked-again-seeking-covering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 121:1 — *I will lift up mine eyes unto the hills, from whence cometh my help.* Adam standing to ask Elohim rather than yielding to Satan''s despair (50:6) is the seed lifting his eyes for help from above.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-naked-again-seeking-covering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-50-word-clothes-with-skins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1-adam-eve 50:7 is this eternal Logos, Elohim Himself, walking with the first man.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-word-clothes-with-skins'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comforts and provides for Adam (50:7) would in the fulness of time be made flesh to dwell among men.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-word-clothes-with-skins'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to Adam at the seashore (50:7) is the first of those sundry times and manners in which Elohim spake to the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-word-clothes-with-skins'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The Word directing them to skins of slain sheep for garments (50:7) repeats the garden''s first covering of skins, a lamb''s death clothing the guilty.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-word-clothes-with-skins'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covering of sheep-skins (50:7) is mercy toward the seed of the woman, sustaining the line through which the serpent''s head would be bruised.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae50_lookup sv, _session253_1ae50_lookup tv
 WHERE t.slug='1-adam-eve-50-word-clothes-with-skins'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

