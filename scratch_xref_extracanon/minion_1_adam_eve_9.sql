-- ----- fragment: minion_1adameve_09.sql (session253 1-adam-eve 9) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae9 (view _session253_1ae9_lookup). Sort band base 64200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-9-gate-of-the-garden
  ('adam-eve-conflict', '1-adam-eve', 9, 1, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Adam standing at the gate to weep in 1 Adam and Eve 9:1 is the lived emotion behind Genesis'' bare sentence of expulsion.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 1, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The barred way is why in 1 Adam and Eve 9:1 they can only stand outside and cry, never re-enter.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 4, 'jubilees', 'jubilees', 3, 32, 'extras', E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* Jubilees dates the same going-forth that 1 Adam and Eve 9:4 mourns, the primeval exile witnessed twice in the restored library.'),
  -- thread: 1-adam-eve-9-river-from-the-tree-of-life
  ('adam-eve-conflict', '1-adam-eve', 9, 2, 'canon', 'genesis', 2, 10, 'free', E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The four rivers from the Tree of Life''s root in 1 Adam and Eve 9:2 are Genesis'' fourfold river of Eden, the same primeval geography.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 3, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Tree of Life whose root feeds the water in 1 Adam and Eve 9:3 is the very tree Genesis sets in the midst of the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 2, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The water from the Tree of Life that Adam mourns in 1 Adam and Eve 9:2 returns restored as the river of life at the throne.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 3, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Tree of Life Adam is severed from in 1 Adam and Eve 9:3 stands again in the New Jerusalem, its leaves for healing.'),
  -- thread: 1-adam-eve-9-why-these-plagues-the-seed
  ('adam-eve-conflict', '1-adam-eve', 9, 5, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The plagues on "our descendants" Adam laments in 1 Adam and Eve 9:5 are the sorrows Genesis lays on the woman''s childbearing line.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 5, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* The punishments Adam grieves over in 1 Adam and Eve 9:5 are the cursed ground and lifelong sorrow Genesis decrees.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 5, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The descendants Adam fears for in 1 Adam and Eve 9:5 are the very seed of the woman through whom the serpent''s head is promised to be crushed.'),
  -- thread: 1-adam-eve-9-despair-in-the-water
  ('adam-eve-conflict', '1-adam-eve', 9, 9, 'canon', '2-corinthians', 7, 10, 'free', E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* The crying that drives Adam and Eve to put an end to themselves in 1 Adam and Eve 9:9 is exactly the sorrow of the world that worketh death.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 9, 'canon', '2-corinthians', 2, 7, 'free', E'2 Corinthians 2:7 — *So that contrariwise ye ought rather to forgive him, and comfort him, lest perhaps such a one should be swallowed up with overmuch sorrow.* The near self-destruction in 1 Adam and Eve 9:9 is the very being swallowed up with overmuch sorrow Paul warns against.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 9, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The despair that nearly drowns the seed in 1 Adam and Eve 9:9 is the work of the murderer from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 9, 9, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The adversary seeking to devour Adam and Eve at the water in 1 Adam and Eve 9:9 is the roaring lion Peter warns the seed to watch against.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-9-gate-of-the-garden',
       E'At the gate, weeping for Eden',
       E'Driven out, the man and his wife cannot tear their eyes from what they lost: *Then Adam and Eve came out of the Cave of Treasures, and went near to the garden gate, and there they stood to look at it, and cried for having come away from it.* (1 Adam and Eve 9:1) — *And Adam cried and wailed, and beat his chest, for being severed from the garden* (1 Adam and Eve 9:4). It ain''t new: this is the very moment Genesis records in a single verse, *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23); the flaming sword bars return — *and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). Jubilees fixes the day they went forth — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation* (Jubilees 3:32) — the same primeval exile, the same sorrowing seed kept under mercy.',
       sv.verse_id, ev.verse_id, 'extras', 64200
  FROM _session253_1ae9_lookup sv, _session253_1ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-9-river-from-the-tree-of-life',
       E'The river from the root of the Tree of Life',
       E'At the south of the garden they find the water they once ignored: *And Adam and Eve went from before the gate of the garden to the southern side of it, and found there the water that watered the garden, from the root of the Tree of Life, and that split itself from there into four rivers over the earth* (1 Adam and Eve 9:2) — *the water that came forth from under the root of the Tree of Life in the garden* (1 Adam and Eve 9:3). Genesis names that same fourfold river — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads* (Genesis 2:10) — flowing past *the tree of life also in the midst of the garden* (Genesis 2:9). What was lost at the root is restored at the throne: John''s Eden made new shows *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1), and again *the tree of life, which bare twelve manner of fruits* (Revelation 22:2). The thirst Adam now feels for the garden water is the thirst the Messiah answers — *the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14).',
       sv.verse_id, ev.verse_id, 'extras', 64203
  FROM _session253_1ae9_lookup sv, _session253_1ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-9-why-these-plagues-the-seed',
       E'Why these plagues upon our descendants',
       E'Adam turns to Eve with the weight of the curse on the line to come: *"Why have you brought on me, on yourself, and on our descendants, so many of these plagues and punishments?"* (1 Adam and Eve 9:5). The plagues he names are the very judgments Genesis pronounced — to the woman, *I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children* (Genesis 3:16), and to the man, *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Yet even the curse carried a covenant promise over the same descendants — the seed-war and its end were spoken in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new: the sorrow Adam dreads for his children is real, but the bruising of the serpent''s head is already promised over that same line.',
       sv.verse_id, ev.verse_id, 'extras', 64206
  FROM _session253_1ae9_lookup sv, _session253_1ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-9-despair-in-the-water',
       E'Worldly sorrow that worketh death',
       E'The sorrow nearly destroys them: *But when Eve heard these words from him, she cried; and from the soreness of their crying, they fell into that water; and would have put an end to themselves in it, so as never again to return and behold the creation* (1 Adam and Eve 9:9). This is the deceiver''s deeper aim — not only the fall but the despair that finishes the seed. Paul names the two sorrows: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10); the brother under crushing grief is to be comforted *lest perhaps such a one should be swallowed up with overmuch sorrow* (2 Corinthians 2:7). For Adam''s adversary is the same from the beginning — *He was a murderer from the beginning, and abode not in the truth* (John 8:44) — the one who still *as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). It ain''t new: from the first day outside the gate the serpent strikes at the seed of the woman, and Yahuah''s mercy keeps them from the water.',
       sv.verse_id, ev.verse_id, 'extras', 64209
  FROM _session253_1ae9_lookup sv, _session253_1ae9_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-9-gate-of-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Adam standing at the gate to weep in 1 Adam and Eve 9:1 is the lived emotion behind Genesis'' bare sentence of expulsion.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-gate-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The barred way is why in 1 Adam and Eve 9:1 they can only stand outside and cry, never re-enter.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-gate-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* Jubilees dates the same going-forth that 1 Adam and Eve 9:4 mourns, the primeval exile witnessed twice in the restored library.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-gate-of-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-9-river-from-the-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The four rivers from the Tree of Life''s root in 1 Adam and Eve 9:2 are Genesis'' fourfold river of Eden, the same primeval geography.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-river-from-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The Tree of Life whose root feeds the water in 1 Adam and Eve 9:3 is the very tree Genesis sets in the midst of the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-river-from-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The water from the Tree of Life that Adam mourns in 1 Adam and Eve 9:2 returns restored as the river of life at the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-river-from-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Tree of Life Adam is severed from in 1 Adam and Eve 9:3 stands again in the New Jerusalem, its leaves for healing.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-river-from-the-tree-of-life'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-9-why-these-plagues-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The plagues on "our descendants" Adam laments in 1 Adam and Eve 9:5 are the sorrows Genesis lays on the woman''s childbearing line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-why-these-plagues-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* The punishments Adam grieves over in 1 Adam and Eve 9:5 are the cursed ground and lifelong sorrow Genesis decrees.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-why-these-plagues-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The descendants Adam fears for in 1 Adam and Eve 9:5 are the very seed of the woman through whom the serpent''s head is promised to be crushed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-why-these-plagues-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-9-despair-in-the-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* The crying that drives Adam and Eve to put an end to themselves in 1 Adam and Eve 9:9 is exactly the sorrow of the world that worketh death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-despair-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 2:7 — *So that contrariwise ye ought rather to forgive him, and comfort him, lest perhaps such a one should be swallowed up with overmuch sorrow.* The near self-destruction in 1 Adam and Eve 9:9 is the very being swallowed up with overmuch sorrow Paul warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-despair-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The despair that nearly drowns the seed in 1 Adam and Eve 9:9 is the work of the murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-despair-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The adversary seeking to devour Adam and Eve at the water in 1 Adam and Eve 9:9 is the roaring lion Peter warns the seed to watch against.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae9_lookup sv, _session253_1ae9_lookup tv
 WHERE t.slug='1-adam-eve-9-despair-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

