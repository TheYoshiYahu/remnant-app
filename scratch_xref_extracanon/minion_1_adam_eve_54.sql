-- ----- fragment: minion_1adameve_54.sql (session253 1-adam-eve 54) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch54. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae54 (view _session253_1ae54_lookup). Sort band base 65325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae54_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-54-cherub-flaming-sword
  ('adam-eve-conflict', '1-adam-eve', 54, 3, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* This is the original of the cherub and flaming sword that meet Adam at the eastern gate in 1-adam-eve 54:3-4.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 2, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The sending-forth is why Adam and Eve in 1-adam-eve 54:2 can only walk the outside border of the garden they once kept.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 3, 'jubilees', 'jubilees', 3, 26, 'extras', E'Jubilees 3:26 — *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden.* Jubilees preserves the same expulsion behind the locked eastern gate of 1-adam-eve 54:3.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 4, 'enoch', '1-enoch', 32, 4, 'extras', E'1 Enoch 32:4 — *And the tree of life was in the midst of the garden, and its fragrance was sweeter than all fragrance, and its leaves and its flowers and its wood wither not for ever, and its fruit is beautiful, and its fruit is like clusters of the vine, very beautiful.* The living tree behind the sword in 1-adam-eve 54:4 is the very tree Enoch was shown standing in the garden of righteousness.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 4, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The gate barred by the cherub in 1-adam-eve 54:4 is the same way to the tree of life the Lamb opens at the end to the keepers of the commandments.'),
  -- thread: 1-adam-eve-54-sword-stayed-mercy
  ('adam-eve-conflict', '1-adam-eve', 54, 5, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The flame that will not flash forth in 1-adam-eve 54:5 is the first mercy that keeps the seed of the woman alive against the serpent.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 6, 'canon', 'lamentations', 3, 22, 'free', E'Lamentations 3:22 — *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* The cherub''s wonder that Elohim is favorable in 1-adam-eve 54:6 is exactly the un-consuming mercy of Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 6, 'canon', 'psalms', 103, 13, 'free', E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The favor the cherub perceives toward Adam in 1-adam-eve 54:6 is the Father''s pity on His dust-made children.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 5, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enmity the stayed sword preserves in 1-adam-eve 54:5 ends with Satan crushed under the seed it kept alive.'),
  -- thread: 1-adam-eve-54-fell-as-dead
  ('adam-eve-conflict', '1-adam-eve', 54, 8, 'canon', 'revelation', 1, 17, 'free', E'Revelation 1:17 — *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last:* Adam and Eve falling as dead before the cherub in 1-adam-eve 54:8 is the same collapse of flesh before glory that fells John.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 8, 'canon', 'daniel', 10, 9, 'free', E'Daniel 10:9 — *Yet heard I the voice of his words: and when I heard the voice of his words, then was I in a deep sleep on my face, and my face toward the ground.* Daniel face-down and strengthless mirrors Adam and Eve fallen on their faces as dead in 1-adam-eve 54:8.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 9, 'canon', 'matthew', 28, 2, 'free', E'Matthew 28:2 — *And, behold, there was a great earthquake: for the angel of Yahuah (Lord) descended from heaven, and came and rolled back the stone from the door, and sat upon it.* The heavens and earth shaking with the descending cherubim in 1-adam-eve 54:9 answers the earthquake and the descending angel at the tomb.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 8, 'canon', 'matthew', 28, 4, 'free', E'Matthew 28:4 — *And for fear of him the keepers did shake, and became as dead men.* The keepers becoming as dead men at the angel is the very terror that lays Adam and Eve as dead in 1-adam-eve 54:8.'),
  -- thread: 1-adam-eve-54-angels-flame-of-fire
  ('adam-eve-conflict', '1-adam-eve', 54, 10, 'canon', 'hebrews', 1, 7, 'free', E'Hebrews 1:7 — *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire.* The cherub of flaming sword and the descending angels of 1-adam-eve 54:10 are these flame-of-fire ministers.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 11, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angels glad over Adam''s hoped-for return in 1-adam-eve 54:11 are ministering spirits sent for the heirs of the promised salvation.'),
  ('adam-eve-conflict', '1-adam-eve', 54, 10, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The fiery angels coming down to Adam and Eve in 1-adam-eve 54:10 are the flaming-fire ministers of Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae54_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae54_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-54-cherub-flaming-sword',
       E'The cherub and the flaming sword at the eastern gate',
       E'Adam and Eve, blind with sorrow, climb the border of the garden until they stand at the eastern gate they may no longer enter: *And the cherub who guarded the garden was standing at the western gate, and guarding it against Adam and Eve, lest they should suddenly come into the garden* (1-adam-eve 54:3); *suddenly came the cherub with a flashing sword of fire in his hand* (1-adam-eve 54:4). This is the very scene Moses sealed at the close of Eden: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23), and *he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). Jubilees keeps the same memory of the sending-forth: *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26). And the tree behind that sword is no myth — Enoch was shown it standing: *And the tree of life was in the midst of the garden, and its fragrance was sweeter than all fragrance* (1 Enoch 32:4). It ain''t new: from the first day outside the garden the way to life is guarded, until the Lamb opens it again — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14).',
       sv.verse_id, ev.verse_id, 'extras', 65325
  FROM _session253_1ae54_lookup sv, _session253_1ae54_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=54 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-54-sword-stayed-mercy',
       E'The sword that would not flash — mercy stays the seed-war',
       E'The cherub raises the sword to kill — and it will not strike: *But when he raised it over Adam and Eve, the flame of the sword did not flash forth* (1-adam-eve 54:5); *Therefore the cherub thought that Elohim (God) was favorable to them* (1-adam-eve 54:6). The serpent has struck at the seed of the woman from the first day, and from the first day Yahuah''s mercy keeps the seed alive — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The withheld flame is the LORD''s compassion: *It is of the LORD''S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22); *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him. For he knoweth our frame; he remembereth that we are dust* (Psalm 103:13). The same enmity that spares them here ends with the head-blow: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). It ain''t new: the stayed sword over the dust-made man already preaches the Saviour who will come and save the seed.',
       sv.verse_id, ev.verse_id, 'extras', 65328
  FROM _session253_1ae54_lookup sv, _session253_1ae54_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=54 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-54-fell-as-dead',
       E'Fallen as dead before the cherub, and heaven and earth shaking',
       E'Before the flaming presence Adam and Eve collapse: *they fell on their faces from fear, and were as dead* (1-adam-eve 54:8); *At that time the heavens and the earth shook; and another cherubim came down from heaven* (1-adam-eve 54:9). This is the unfailing measure of mortal flesh before the holy — Daniel falls the same way: *Yet heard I the voice of his words: and when I heard the voice of his words, then was I in a deep sleep on my face, and my face toward the ground* (Daniel 10:9); and John on Patmos: *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not* (Revelation 1:17). At the empty tomb the guards meet the same shaking and the same terror: *And, behold, there was a great earthquake: for the angel of Yahuah (Lord) descended from heaven* (Matthew 28:2); *And for fear of him the keepers did shake, and became as dead men* (Matthew 28:4). It ain''t new: the dread of the guarding angel at the gate of life is the dread of the rolling angel at the gate of the grave.',
       sv.verse_id, ev.verse_id, 'extras', 65331
  FROM _session253_1ae54_lookup sv, _session253_1ae54_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=54 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-54-angels-flame-of-fire',
       E'The ministering angels divided between joy and sorrow',
       E'The host gathers about the fallen pair: *Then, again, other angels came down close to the place where Adam and Eve were. They were divided between joy and sorrow* (1-adam-eve 54:10) — glad in hope of his return, grieving over the man fallen like the dead. These guarding, descending, fiery messengers are exactly what Scripture names them: *Who maketh his angels spirits; his ministers a flaming fire* (Psalm 104:4); *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire* (Hebrews 1:7). And their errand of mercy over the fallen heirs of Adam is no idle watching: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). It ain''t new: the angels that watch and weep over Adam at the gate are the same flame-of-fire spirits sent to minister to the heirs of the very salvation Yahuah promised the man.',
       sv.verse_id, ev.verse_id, 'extras', 65334
  FROM _session253_1ae54_lookup sv, _session253_1ae54_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=54 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-54-cherub-flaming-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* This is the original of the cherub and flaming sword that meet Adam at the eastern gate in 1-adam-eve 54:3-4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The sending-forth is why Adam and Eve in 1-adam-eve 54:2 can only walk the outside border of the garden they once kept.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:26 — *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden.* Jubilees preserves the same expulsion behind the locked eastern gate of 1-adam-eve 54:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 32:4 — *And the tree of life was in the midst of the garden, and its fragrance was sweeter than all fragrance, and its leaves and its flowers and its wood wither not for ever, and its fruit is beautiful, and its fruit is like clusters of the vine, very beautiful.* The living tree behind the sword in 1-adam-eve 54:4 is the very tree Enoch was shown standing in the garden of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=32 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The gate barred by the cherub in 1-adam-eve 54:4 is the same way to the tree of life the Lamb opens at the end to the keepers of the commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-cherub-flaming-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-54-sword-stayed-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The flame that will not flash forth in 1-adam-eve 54:5 is the first mercy that keeps the seed of the woman alive against the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-sword-stayed-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 3:22 — *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* The cherub''s wonder that Elohim is favorable in 1-adam-eve 54:6 is exactly the un-consuming mercy of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-sword-stayed-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The favor the cherub perceives toward Adam in 1-adam-eve 54:6 is the Father''s pity on His dust-made children.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-sword-stayed-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enmity the stayed sword preserves in 1-adam-eve 54:5 ends with Satan crushed under the seed it kept alive.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-sword-stayed-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-54-fell-as-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 1:17 — *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last:* Adam and Eve falling as dead before the cherub in 1-adam-eve 54:8 is the same collapse of flesh before glory that fells John.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-fell-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:9 — *Yet heard I the voice of his words: and when I heard the voice of his words, then was I in a deep sleep on my face, and my face toward the ground.* Daniel face-down and strengthless mirrors Adam and Eve fallen on their faces as dead in 1-adam-eve 54:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-fell-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 28:2 — *And, behold, there was a great earthquake: for the angel of Yahuah (Lord) descended from heaven, and came and rolled back the stone from the door, and sat upon it.* The heavens and earth shaking with the descending cherubim in 1-adam-eve 54:9 answers the earthquake and the descending angel at the tomb.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-fell-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 28:4 — *And for fear of him the keepers did shake, and became as dead men.* The keepers becoming as dead men at the angel is the very terror that lays Adam and Eve as dead in 1-adam-eve 54:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-fell-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-54-angels-flame-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:7 — *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire.* The cherub of flaming sword and the descending angels of 1-adam-eve 54:10 are these flame-of-fire ministers.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-angels-flame-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angels glad over Adam''s hoped-for return in 1-adam-eve 54:11 are ministering spirits sent for the heirs of the promised salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-angels-flame-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The fiery angels coming down to Adam and Eve in 1-adam-eve 54:10 are the flaming-fire ministers of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae54_lookup sv, _session253_1ae54_lookup tv
 WHERE t.slug='1-adam-eve-54-angels-flame-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=54 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

