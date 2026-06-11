-- ----- fragment: minion_1enoch_31.sql (session250 1-enoch 31) -----
-- Source anchor: enoch/1-enoch ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en31 (view _session250_en31_lookup). Sort band base 50750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-31-frankincense-and-myrrh
  ('enoch', '1-enoch', 31, 1, 'canon', 'exodus', 30, 34, 'free', E'Exodus 30:34 — *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* The pure frankincense set apart for the holy incense is the same surpassing fragrance Enoch smells flooding the valley at 31:1-3.'),
  ('enoch', '1-enoch', 31, 1, 'canon', 'song-of-solomon', 3, 6, 'free', E'Song of Solomon 3:6 — *Who is this that cometh out of the wilderness like pillars of smoke, perfumed with myrrh and frankincense, with all powders of the merchant?* The myrrh-and-frankincense fragrance that heralds the Bridegroom is the same holy scent Enoch finds surpassing all fragrance in 31:1-3.'),
  -- thread: 1-enoch-31-tree-of-wisdom-eden
  ('enoch', '1-enoch', 31, 4, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The tree desired to make one wise is exactly the tree of wisdom the angel names in 31:4, eaten by Enoch''s first father and mother.'),
  ('enoch', '1-enoch', 31, 4, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The opened eyes and the knowledge of nakedness in 31:4 are word-for-word the aftermath Genesis records.'),
  ('enoch', '1-enoch', 31, 4, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The driving out of the garden that closes 31:4 is the same expulsion that closes the Eden account.'),
  -- thread: 1-enoch-31-tree-transplanted-to-the-temple
  ('enoch', '1-enoch', 31, 6, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The tree transplanted to the temple in 31:6 is the sanctuary-rooted tree of healing Ezekiel sees by the water that flows from the holy place.'),
  ('enoch', '1-enoch', 31, 6, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The fruit-for-life given to the elect in the holy place at 31:6 is the tree of life set at the centre of the restored City.'),
  ('enoch', '1-enoch', 31, 5, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit withheld until the great judgement and then granted to the righteous in 31:5 belongs to those who keep the commandments — the covenant-keepers, not a self-selected class.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-31-frankincense-and-myrrh',
       E'The fragrant tree — frankincense and myrrh',
       E'Enoch comes to a tree whose scent fills the valley: *And I proceeded to another place, and I saw a tree whose fragrance was like the fragrance of the mastic tree* (1 Enoch 31:1), and he marvels, *This tree is beautiful beyond all trees, and its fragrance surpasses all fragrance* (1 Enoch 31:3). The same holy fragrances of his journey are the ones Yahuah (LORD) reserves for the sanctuary — *Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight* (Exodus 30:34) — and the same myrrh-and-frankincense that perfumes the Bridegroom''s ascent out of the wilderness: *Who is this that cometh out of the wilderness like pillars of smoke, perfumed with myrrh and frankincense, with all powders of the merchant?* (Song of Solomon 3:6). It ain''t new: Enoch''s spice-tree breathes the very incense of worship.',
       sv.verse_id, ev.verse_id, 'extras', 50750
  FROM _session250_en31_lookup sv, _session250_en31_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=31 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-31-tree-of-wisdom-eden',
       E'The tree of wisdom — eyes opened, driven from the garden',
       E'The angel names the tree for Enoch: *This is the tree of wisdom, of which thy father old (in years) and thy aged mother, who were before thee, have eaten, and they learnt wisdom, and their eyes were opened, and they knew that they were naked, and they were driven out of the garden* (1 Enoch 31:4). This is Eden retold without a seam. Eve saw *a tree to be desired to make one wise, she took of the fruit thereof... and gave also unto her husband with her; and he did eat* (Genesis 3:6); then *the eyes of them both were opened, and they knew that they were naked* (Genesis 3:7); and Yahuah Elohim *sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23). Enoch is shown the very tree Genesis names — the order Yahuah set was good, and the fall was reaching for wisdom apart from the Creator''s way, not the law''s fault.',
       sv.verse_id, ev.verse_id, 'extras', 50753
  FROM _session250_en31_lookup sv, _session250_en31_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=31 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-31-tree-transplanted-to-the-temple',
       E'The tree reserved for the elect — transplanted to the holy place',
       E'The wisdom-tree is sealed off until the day of reckoning and then restored to the righteous: *And from that time forward no one has been permitted to touch it until the great judgement, when His righteousness shall be avenged upon the sinners, and its fruit given to the righteous and humble* (1 Enoch 31:5); *Then shall it be given to the righteous and humble, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King* (1 Enoch 31:6). This is the Eden-tree carried home to Zion. Ezekiel sees it rooted by the sanctuary stream: *shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12); Revelation sets it in the City: *the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2); and entry is for those who keep the covenant — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The judgement falls on the sinners, the fruit-for-life goes to the elect and humble, and the tree is replanted at the centre — Eden, Zion, and the age to come are one story.',
       sv.verse_id, ev.verse_id, 'extras', 50756
  FROM _session250_en31_lookup sv, _session250_en31_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=31 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-31-frankincense-and-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 30:34 — *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* The pure frankincense set apart for the holy incense is the same surpassing fragrance Enoch smells flooding the valley at 31:1-3.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-frankincense-and-myrrh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Song of Solomon 3:6 — *Who is this that cometh out of the wilderness like pillars of smoke, perfumed with myrrh and frankincense, with all powders of the merchant?* The myrrh-and-frankincense fragrance that heralds the Bridegroom is the same holy scent Enoch finds surpassing all fragrance in 31:1-3.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-frankincense-and-myrrh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-31-tree-of-wisdom-eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The tree desired to make one wise is exactly the tree of wisdom the angel names in 31:4, eaten by Enoch''s first father and mother.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The opened eyes and the knowledge of nakedness in 31:4 are word-for-word the aftermath Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The driving out of the garden that closes 31:4 is the same expulsion that closes the Eden account.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-tree-of-wisdom-eden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-31-tree-transplanted-to-the-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The tree transplanted to the temple in 31:6 is the sanctuary-rooted tree of healing Ezekiel sees by the water that flows from the holy place.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-tree-transplanted-to-the-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The fruit-for-life given to the elect in the holy place at 31:6 is the tree of life set at the centre of the restored City.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-tree-transplanted-to-the-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The fruit withheld until the great judgement and then granted to the righteous in 31:5 belongs to those who keep the commandments — the covenant-keepers, not a self-selected class.'
  FROM cross_reference_threads t, cross_references x, _session250_en31_lookup sv, _session250_en31_lookup tv
 WHERE t.slug='1-enoch-31-tree-transplanted-to-the-temple'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

