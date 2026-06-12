-- ----- fragment: minion_apocalypseofabraham_21.sql (session253 apocalypse-of-abraham 21) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa21 (view _session253_aoa21_lookup). Sort band base 67500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-21-creation-foreshadowed
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 1, 'canon', 'genesis', 1, 1, 'free', E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The creation Abraham is shown foreshadowed in the expanse is the very work of the first day of Genesis.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 1, 'canon', 'genesis', 1, 6, 'free', E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* The "firmaments" beneath Abraham''s feet are the dividing firmament Elohim set in place.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 2, 'canon', 'genesis', 1, 20, 'free', E'Genesis 1:20 — *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* The creatures and animate beings Abraham sees moving on the earth are the swarming life Elohim called forth.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 2, 'canon', 'psalms', 104, 24, 'free', E'Psalms 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* Abraham''s overview of all the creatures and their works is the psalmist''s wonder at the wisdom by which they were made.'),
  -- thread: apocalypse-of-abraham-21-leviathan-the-deep
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 3, 'canon', 'job', 41, 1, 'free', E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The Leviathan with his dominion and his caves that Abraham sees is the unmasterable sea-monster Yahuah sets before Job.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 3, 'canon', 'psalms', 104, 26, 'free', E'Psalms 104:26 — *There go the ships: there is that leviathan, whom thou hast made to play therein.* The sea with its islands and its monster in Abraham''s vision is the wide sea where the made Leviathan plays.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 3, 'enoch', '1-enoch', 60, 7, 'extras', E'1 Enoch 60:7 — *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters.* The Leviathan in his deep camping-ground that Abraham beholds is Enoch''s Leviathan dwelling in the abysses of the waters.'),
  -- thread: apocalypse-of-abraham-21-garden-of-eden
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 5, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Garden of Eden Abraham is shown is the very garden Yahuah planted eastward and set the man within.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 5, 'canon', 'genesis', 2, 10, 'free', E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The source of the stream issuing from Eden that Abraham sees is the river that went out to water the garden.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 5, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The trees and their bloom and fruits Abraham beholds are the garden''s trees pleasant to the sight and good for food.'),
  -- thread: apocalypse-of-abraham-21-two-peoples-right-left
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 7, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The multitude halved on the right and the left in Abraham''s vision is the two peoples Yahuah separated from the womb.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 7, 'canon', 'matthew', 25, 32, 'free', E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two halves of the great multitude Abraham beholds are the nations the Son of Adam gathers and divides at the end.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 7, 'canon', 'matthew', 25, 33, 'free', E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The right side and the left side of Abraham''s picture are the sheep on the right hand and the goats on the left at the judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-creation-foreshadowed',
       E'The creation foreshadowed in the expanse',
       E'Abraham is shown the whole work of the Maker laid out beneath him: *And He said to me: "Look, now, beneath thy feet at the firmaments, and understand the creation foreshadowed in this expanse, the creatures existing on it, and the age prepared according to it."* (Apocalypse of Abraham 21:1). It ain''t new — this is the opening of Genesis, the heavens and the earth and the dividing firmament: *In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1) and *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* (Genesis 1:6). The patriarch beholds the very expanse and its teeming life: *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* (Genesis 1:20). And the psalmist, gazing on the same world, cries the same wonder: *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* (Psalms 104:24). The God who called Abram out of Ur is the God who made it all.',
       sv.verse_id, ev.verse_id, 'extras', 67500
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-leviathan-the-deep',
       E'Leviathan in the abyss of the waters',
       E'From the height Abraham looks down on the sea and its master: *I saw there the sea and its islands, and its monsters and its fishes, and Leviathan and his dominion, and his camping-ground, and his caves, and the world which lay upon him, and his movements, and the destructions of the world on his account.* (Apocalypse of Abraham 21:3). It ain''t new — Leviathan is no invention here; he is the great creature of the deep that no man can master: *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* (Job 41:1), and the playing monster of the wide sea: *There go the ships: there is that leviathan, whom thou hast made to play therein.* (Psalms 104:26). And the now-live witness of Enoch sets him in the very same abyss of the waters at the end: *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters.* (1 Enoch 60:7). The chaos-beast is real, but he is a made thing, under the dominion of the One Abraham beholds.',
       sv.verse_id, ev.verse_id, 'extras', 67503
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-garden-of-eden',
       E'The Garden of Eden and its river',
       E'Abraham''s eye is led to the place of beginnings: *And I saw there the Garden of Eden and its fruits, the source of the stream issuing from it, and its trees and their bloom, and those who behaved righteously.* (Apocalypse of Abraham 21:5), and *And I saw therein their foods and blessedness.* (Apocalypse of Abraham 21:6). It ain''t new — this is the garden Yahuah planted in the east, with its trees and its single rising river: *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* (Genesis 2:8), and *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* (Genesis 2:10), and *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). The blessedness Abraham sees reserved for the righteous is the garden''s foods, the same Eden — paradise is not a new promise but the first home kept for those who behave righteously.',
       sv.verse_id, ev.verse_id, 'extras', 67506
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-two-peoples-right-left',
       E'The two peoples — the right and the left',
       E'At the last Abraham sees the multitude divided in two: *And I saw there a great multitude — men and women and children, half of them on the right side of the picture, and half of them on the left side of the picture.* (Apocalypse of Abraham 21:7). It ain''t new — election runs back to Rebekah''s womb, two peoples sundered before they had done good or ill: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). And the same dividing stands at the end, when the Son of Adam separates the gathered nations: *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* (Matthew 25:32), *And he shall set the sheep on his right hand, but the goats on the left.* (Matthew 25:33). The right hand is the elect of Abraham''s seed and the left the heathen — election precedes confession, and it is not a church replacing Yashar''el but the dividing the Maker fixed from the womb to the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 67509
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-21-creation-foreshadowed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The creation Abraham is shown foreshadowed in the expanse is the very work of the first day of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* The "firmaments" beneath Abraham''s feet are the dividing firmament Elohim set in place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:20 — *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* The creatures and animate beings Abraham sees moving on the earth are the swarming life Elohim called forth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* Abraham''s overview of all the creatures and their works is the psalmist''s wonder at the wisdom by which they were made.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-21-leviathan-the-deep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The Leviathan with his dominion and his caves that Abraham sees is the unmasterable sea-monster Yahuah sets before Job.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-leviathan-the-deep'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:26 — *There go the ships: there is that leviathan, whom thou hast made to play therein.* The sea with its islands and its monster in Abraham''s vision is the wide sea where the made Leviathan plays.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-leviathan-the-deep'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 60:7 — *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters.* The Leviathan in his deep camping-ground that Abraham beholds is Enoch''s Leviathan dwelling in the abysses of the waters.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-leviathan-the-deep'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-21-garden-of-eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Garden of Eden Abraham is shown is the very garden Yahuah planted eastward and set the man within.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-garden-of-eden'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The source of the stream issuing from Eden that Abraham sees is the river that went out to water the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-garden-of-eden'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The trees and their bloom and fruits Abraham beholds are the garden''s trees pleasant to the sight and good for food.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-garden-of-eden'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-21-two-peoples-right-left
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The multitude halved on the right and the left in Abraham''s vision is the two peoples Yahuah separated from the womb.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two halves of the great multitude Abraham beholds are the nations the Son of Adam gathers and divides at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The right side and the left side of Abraham''s picture are the sheep on the right hand and the goats on the left at the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

