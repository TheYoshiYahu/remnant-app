-- ----- fragment: minion_1adameve_01.sql (session253 1-adam-eve 1) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae1 (view _session253_1ae1_lookup). Sort band base 64000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-1-garden-eastward
  ('adam-eve-conflict', '1-adam-eve', 1, 1, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 - *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Conflict''s garden planted in the east is the very garden of Eden Moses set eastward in 1 Adam and Eve 1:1.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 9, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 - *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Adam''s appointed cave in the rock below the garden in 1 Adam and Eve 1:9 sits outside the flaming sword that now keeps the way back.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 1, 'jubilees', 'jubilees', 3, 9, 'extras', E'Jubilees 3:9 - *And after Adam had completed forty days in the land where he had been created, we brought him into the Garden of Eden to till and keep it, but his wife they brought in on the eightieth day, and after this she entered into the Garden of Eden.* Jubilees keeps the same memory of the holy garden into which Adam was set, the ground from which 1 Adam and Eve 1:1 measures the world eastward.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 8, 'canon', 'genesis', 4, 16, 'free', E'Genesis 4:16 - *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* The geography Adam is given in 1 Adam and Eve 1:8 is the very stage of the two seed-lines, the field east of Eden where Cain would later wander.'),
  -- thread: 1-adam-eve-1-cleansing-sea-last-day
  ('adam-eve-conflict', '1-adam-eve', 1, 4, 'canon', 'ezekiel', 36, 25, 'free', E'Ezekiel 36:25 - *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* The pure sea that washes the righteous clean of their sins in 1 Adam and Eve 1:4 is the clean water Yahuah promises to sprinkle for cleansing.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 - *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The souls Elohim would raise at the last day to return to their flesh in 1 Adam and Eve 1:4 are the sleepers in the dust whom Daniel sees awake.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 4, 'canon', 'john', 6, 39, 'free', E'John 6:39 - *And this is the Father''s will which hath sent me, that of all which he hath given me I should lose nothing, but should raise it up again at the last day.* The very last-day raising promised over Adam''s sea in 1 Adam and Eve 1:4 is the Father''s will the Messiah declares He came to do.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 4, 'canon', '1-peter', 3, 21, 'free', E'1 Peter 3:21 - *The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ):* The saving, repentance-bearing water of 1 Adam and Eve 1:4 is the figure Peter names baptism, joined to the resurrection.'),
  -- thread: 1-adam-eve-1-mercy-knows-our-frame
  ('adam-eve-conflict', '1-adam-eve', 1, 8, 'canon', 'psalms', 103, 14, 'free', E'Psalm 103:14 - *For he knoweth our frame; he remembereth that we are dust.* The Elohim who governs Adam''s dwelling in pity in 1 Adam and Eve 1:8 is the Father who knows the frame of the man He made of dust.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 8, 'canon', 'lamentations', 3, 22, 'free', E'Lamentations 3:22 - *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* That Adam is preserved and provided a dwelling rather than destroyed in 1 Adam and Eve 1:8 is the unfailing mercy that keeps the fallen from being consumed.'),
  ('adam-eve-conflict', '1-adam-eve', 1, 5, 'canon', 'titus', 3, 5, 'free', E'Titus 3:5 - *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit);* The cleansing sea Adam may not reach by his own going in 1 Adam and Eve 1:5 answers to the washing of regeneration granted not by works but by mercy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-1-garden-eastward',
       E'The garden eastward, and the way kept',
       E'The Conflict opens where Genesis leaves off - outside the gate, the holy ground walled away to the east. *On the third day, Elohim (God) planted the garden in the east of the earth, on the border of the world eastward, beyond which, towards the sun-rising, one finds nothing but water, that encompasses the whole world, and reaches to the borders of heaven* (1 Adam and Eve 1:1), and *Elohim (God) commanded him to live there in a cave in a rock--the Cave of Treasures below the garden* (1 Adam and Eve 1:9). It ain''t new: Moses already set the garden eastward - *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed* (Genesis 2:8). And when the man transgressed, the way back was kept by fire - *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). Jubilees, the same primeval history, remembers the bringing-in to till and keep - *we brought him into the Garden of Eden to till and keep it* (Jubilees 3:9). The whole drama outside the gate is the seed-war east of Eden, the same field to which Cain would wander - *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden* (Genesis 4:16).',
       sv.verse_id, ev.verse_id, 'extras', 64000
  FROM _session253_1ae1_lookup sv, _session253_1ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-1-cleansing-sea-last-day',
       E'The sea of cleansing and the raising at the last day',
       E'Elohim makes a sea of pure water for a people not yet born, against the last day. *And Elohim (God) created that sea of his own good pleasure, for He knew what would come of the man He would make; so that after he had left the garden, on account of his transgression, men should be born in the earth. Among them are righteous ones who will die, whose souls Elohim (God) would raise at the last day; when all of them will return to their flesh, bathe in the water of that sea, and repent of their sins* (1 Adam and Eve 1:4). The washing of water for cleansing is the prophets'' own promise - *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25). And the raising of the flesh at the last day is no new doctrine - *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The Word who would come to Adam says it plainly in the days of His flesh - *And this is the Father''s will which hath sent me, that of all which he hath given me I should lose nothing, but should raise it up again at the last day* (John 6:39). The figure of the saving water Peter names baptism - *The like figure whereunto even baptism doth also now save us... by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21).',
       sv.verse_id, ev.verse_id, 'extras', 64003
  FROM _session253_1ae1_lookup sv, _session253_1ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-1-mercy-knows-our-frame',
       E'Mercy withholds the comfort - He knoweth our frame',
       E'Why does Elohim deny Adam the cleansing sea and the sweet smell of the trees? Not cruelty, but mercy that will not let the fallen man cheaply forget his transgression. *But when Elohim (God) made Adam go out of the garden, He did not place him on the border of it northward. This was so that he and Eve would not be able to go near to the sea of water where they could wash themselves in it, be cleansed from their sins, erase the transgression they had committed, and be no longer reminded of it in the thought of their punishment* (1 Adam and Eve 1:5); *Again, also, because Elohim (God) is merciful and of great pity, and governs all things in a way that He alone knows--He made our father Adam live in the western border of the garden, because on that side the earth is very broad* (1 Adam and Eve 1:8). This is the Father who remembers what we are made of - *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him. For he knoweth our frame; he remembereth that we are dust* (Psalm 103:13-14). It is mercy that we are spared at all - *It is of the LORD''S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22). And the cleansing, when it comes, is by His mercy and not our works - *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5).',
       sv.verse_id, ev.verse_id, 'extras', 64006
  FROM _session253_1ae1_lookup sv, _session253_1ae1_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-1-garden-eastward
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:8 - *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Conflict''s garden planted in the east is the very garden of Eden Moses set eastward in 1 Adam and Eve 1:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-garden-eastward'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 - *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Adam''s appointed cave in the rock below the garden in 1 Adam and Eve 1:9 sits outside the flaming sword that now keeps the way back.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-garden-eastward'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:9 - *And after Adam had completed forty days in the land where he had been created, we brought him into the Garden of Eden to till and keep it, but his wife they brought in on the eightieth day, and after this she entered into the Garden of Eden.* Jubilees keeps the same memory of the holy garden into which Adam was set, the ground from which 1 Adam and Eve 1:1 measures the world eastward.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-garden-eastward'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:16 - *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* The geography Adam is given in 1 Adam and Eve 1:8 is the very stage of the two seed-lines, the field east of Eden where Cain would later wander.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-garden-eastward'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-1-cleansing-sea-last-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:25 - *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* The pure sea that washes the righteous clean of their sins in 1 Adam and Eve 1:4 is the clean water Yahuah promises to sprinkle for cleansing.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-cleansing-sea-last-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 - *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The souls Elohim would raise at the last day to return to their flesh in 1 Adam and Eve 1:4 are the sleepers in the dust whom Daniel sees awake.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-cleansing-sea-last-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:39 - *And this is the Father''s will which hath sent me, that of all which he hath given me I should lose nothing, but should raise it up again at the last day.* The very last-day raising promised over Adam''s sea in 1 Adam and Eve 1:4 is the Father''s will the Messiah declares He came to do.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-cleansing-sea-last-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 3:21 - *The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ):* The saving, repentance-bearing water of 1 Adam and Eve 1:4 is the figure Peter names baptism, joined to the resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-cleansing-sea-last-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-1-mercy-knows-our-frame
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:14 - *For he knoweth our frame; he remembereth that we are dust.* The Elohim who governs Adam''s dwelling in pity in 1 Adam and Eve 1:8 is the Father who knows the frame of the man He made of dust.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-mercy-knows-our-frame'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 3:22 - *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* That Adam is preserved and provided a dwelling rather than destroyed in 1 Adam and Eve 1:8 is the unfailing mercy that keeps the fallen from being consumed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-mercy-knows-our-frame'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Titus 3:5 - *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit);* The cleansing sea Adam may not reach by his own going in 1 Adam and Eve 1:5 answers to the washing of regeneration granted not by works but by mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae1_lookup sv, _session253_1ae1_lookup tv
 WHERE t.slug='1-adam-eve-1-mercy-knows-our-frame'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

