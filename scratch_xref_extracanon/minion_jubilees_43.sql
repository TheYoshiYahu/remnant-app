-- ----- fragment: minion_jubilees_43.sql (session251 jubilees 43) -----
-- Source anchor: jubilees/jubilees ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju43 (view _session251_ju43_lookup). Sort band base 54050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-43-silver-cup-benjamin
  ('jubilees', 'jubilees', 43, 1, 'canon', 'genesis', 44, 2, 'free', E'Genesis 44:2 — *And put my cup, the silver cup, in the sack’s mouth of the youngest, and his corn money. And he did according to the word that Joseph had spoken* — the Genesis command behind Jubilees 43:1, the cup planted in Benjamin''s sack.'),
  ('jubilees', 'jubilees', 43, 2, 'canon', 'genesis', 44, 3, 'free', E'Genesis 44:3 — *As soon as the morning was light, the men were sent away, they and their asses* — the dawn departure that Jubilees 43:2 retells before Joseph sends the steward in pursuit.'),
  ('jubilees', 'jubilees', 43, 5, 'canon', 'genesis', 44, 9, 'free', E'Genesis 44:9 — *With whomsoever of thy servants it be found, both let him die, and we also will be my lord’s bondmen* — the brothers'' rash oath of innocence echoed in Jubilees 43:5.'),
  ('jubilees', 'jubilees', 43, 6, 'canon', 'genesis', 44, 12, 'free', E'Genesis 44:12 — *And he searched, and began at the eldest, and left at the youngest: and the cup was found in Benjamin’s sack* — the same search order and discovery that Jubilees 43:6 records.'),
  -- thread: jubilees-43-judah-offers-himself-surety
  ('jubilees', 'jubilees', 43, 13, 'canon', 'genesis', 44, 33, 'free', E'Genesis 44:33 — *Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren* — Yahudah''s offer of himself, retold verbatim in Jubilees 43:13.'),
  ('jubilees', 'jubilees', 43, 13, 'canon', 'genesis', 44, 32, 'free', E'Genesis 44:32 — *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever* — the surety-bond Jubilees 43:13 names as the ground of Yahudah''s plea.'),
  ('jubilees', 'jubilees', 43, 11, 'canon', 'genesis', 44, 30, 'free', E'Genesis 44:30 — *Now therefore when I come to thy servant my father, and the lad be not with us; seeing that his life is bound up in the lad’s life* — the father''s life bound to Benjamin''s, as Jubilees 43:11 has it.'),
  -- thread: jubilees-43-joseph-made-known
  ('jubilees', 'jubilees', 43, 14, 'canon', 'genesis', 45, 1, 'free', E'Genesis 45:1 — *Then Joseph could not refrain himself before all them that stood by him; and he cried, Cause every man to go out from me. And there stood no man with him, while Joseph made himself known unto his brethren* — the source for Jubilees 43:14, Joseph unable to hold back.'),
  ('jubilees', 'jubilees', 43, 14, 'canon', 'genesis', 45, 3, 'free', E'Genesis 45:3 — *And Joseph said unto his brethren, I am Joseph; doth my father yet live? And his brethren could not answer him; for they were troubled at his presence* — the unveiling Jubilees 43:14 records.'),
  ('jubilees', 'jubilees', 43, 15, 'canon', 'genesis', 45, 14, 'free', E'Genesis 45:14 — *And he fell upon his brother Benjamin’s neck, and wept; and Benjamin wept upon his neck* — the embrace and weeping of Jubilees 43:15.'),
  ('jubilees', 'jubilees', 43, 16, 'canon', 'genesis', 45, 12, 'free', E'Genesis 45:12 — *And, behold, your eyes see, and the eyes of my brother Benjamin, that it is my mouth that speaketh unto you* — the very words Jubilees 43:16 puts in Joseph''s mouth.'),
  -- thread: jubilees-43-god-meant-it-for-good
  ('jubilees', 'jubilees', 43, 18, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* — the forgiveness and providence that Jubilees 43:18 carries.'),
  ('jubilees', 'jubilees', 43, 18, 'canon', 'genesis', 45, 7, 'free', E'Genesis 45:7 — *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* — the great deliverance behind Jubilees 43:18, ''that many people might live.'''),
  ('jubilees', 'jubilees', 43, 18, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* — the full statement of the theme Jubilees 43:18 sounds: harm overruled for life.'),
  ('jubilees', 'jubilees', 43, 18, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant* — the Psalmist reading Joseph''s descent as Elohim sending him ahead, as Jubilees 43:18 does.'),
  ('jubilees', 'jubilees', 43, 19, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* — Stephen''s witness that Elohim stood with the rejected Joseph who Jubilees 43:19 says was made father to Pharaoh.'),
  -- thread: jubilees-43-rejected-then-exalted-deliverer
  ('jubilees', 'jubilees', 43, 19, 'jubilees', 'jubilees', 34, 10, 'extras', E'Jubilees 34:10 — *And in the seventh year of this week he sent Joseph to learn about the welfare of his brothers from his house to the land of Shechem, and he found them in the land of Dothan* — the earlier Jubilees account of Joseph sent to the brothers who would sell him, now exalted in Jubilees 43:19.'),
  ('jubilees', 'jubilees', 43, 19, 'canon', 'acts', 3, 13, 'free', E'Acts 3:13 — *The Elohim (God) of Abraham, and of Isaac, and of Jacob, the Elohim (God) of our fathers, hath glorified his Son Yahusha (Jesus); whom ye delivered up, and denied him in the presence of Pilate* — the rejected-then-glorified Deliverer whose pattern Joseph foreshadows in Jubilees 43:19.'),
  ('jubilees', 'jubilees', 43, 18, 'canon', 'luke', 23, 34, 'free', E'Luke 23:34 — *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots* — the forgiving of those who rejected Him, the very heart Joseph shows in Jubilees 43:18.'),
  ('jubilees', 'jubilees', 43, 18, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* — Paul''s gospel-statement of the truth Jubilees 43:18 enacts: evil overruled for good.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-43-silver-cup-benjamin',
       E'The silver cup hidden in Benjamin''s sack',
       E'Jubilees retells the testing of the brothers exactly as Genesis tells it: *And he did as Joseph had told him, and filled all their sacks for them with food and put their money in their sacks, and put the cup in Benjamin’s sack* (Jubilees 43:1). Genesis frames the same command — *And put my cup, the silver cup, in the sack’s mouth of the youngest, and his corn money. And he did according to the word that Joseph had spoken* (Genesis 44:2) — and the same dawn pursuit, *As soon as the morning was light, the men were sent away, they and their asses* (Genesis 44:3). The brothers stake their lives on their innocence, *Behold here are we and our sacks; search, and wherever you find the cup in the sack of any man amongst us, let him be slain* (Jubilees 43:5), and the search runs down from eldest to youngest until *it was found in Benjamin’s sack* (Jubilees 43:6) — word for word the Genesis source, *And he searched, and began at the eldest, and left at the youngest: and the cup was found in Benjamin’s sack* (Genesis 44:12). It ain''t new: the Joseph cycle stands in Jubilees as it stands in the Torah.',
       sv.verse_id, ev.verse_id, 'extras', 54050
  FROM _session251_ju43_lookup sv, _session251_ju43_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=43 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-43-judah-offers-himself-surety',
       E'Judah''s plea — himself as bondsman for the lad',
       E'Yahudah steps forward and offers his own freedom for Benjamin''s: *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father* (Jubilees 43:13). Genesis carries the same surety-speech, *Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren* (Genesis 44:33), grounded in the bond Yahudah swore to Jacob, *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever* (Genesis 44:32). The father''s life hangs on the boy — *his life also is bound up with the life of this (lad)* (Jubilees 43:11) — as Genesis says, *seeing that his life is bound up in the lad’s life* (Genesis 44:30). This is the same Yahudah of chapter 41 (Judah and Tamar, Perez born), through whom the Messianic seed is kept — here he becomes the substitute who lays his own liberty down for his brother, the kingly line learning to stand surety.',
       sv.verse_id, ev.verse_id, 'extras', 54053
  FROM _session251_ju43_lookup sv, _session251_ju43_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=43 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-43-joseph-made-known',
       E'''I am Joseph'' — he could not refrain himself',
       E'Seeing the brothers of one accord in goodness, *he could not refrain himself, and he told them that he was Joseph* (Jubilees 43:14), and *fell on their neck and wept* (Jubilees 43:15). Genesis tells it the same way: *Then Joseph could not refrain himself before all them that stood by him... while Joseph made himself known unto his brethren* (Genesis 45:1), and *Joseph said unto his brethren, I am Joseph; doth my father yet live?* (Genesis 45:3). The weeping over Benjamin''s neck is shared — *And he fell upon his brother Benjamin’s neck, and wept; and Benjamin wept upon his neck* (Genesis 45:14). Joseph''s word of comfort, *Weep not over me, but hasten and bring my father to me; and you see that it is my mouth that speaks and the eyes of my brother Benjamin see* (Jubilees 43:16), matches Genesis, *And, behold, your eyes see, and the eyes of my brother Benjamin, that it is my mouth that speaketh unto you* (Genesis 45:12).',
       sv.verse_id, ev.verse_id, 'extras', 54056
  FROM _session251_ju43_lookup sv, _session251_ju43_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=43 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-43-god-meant-it-for-good',
       E'''God sent me before you'' — meant for good, to save lives',
       E'Here is the high note of the chapter, the rejected brother revealing the hidden hand of Elohim: *do not be grieved for your possessions, for Yahuah (God) sent me before you to set things in order that many people might live* (Jubilees 43:18). Genesis says it plainly twice — *be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5), and *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7). It reaches its full weight when Joseph forgives outright at his father''s death: *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). The Psalmist reads the whole arc as Elohim''s providence — *He sent a man before them, even Joseph, who was sold for a servant* (Psalm 105:17) — and Stephen preaches it to Israel: *the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9). What men meant for harm, Elohim wove for life.',
       sv.verse_id, ev.verse_id, 'extras', 54059
  FROM _session251_ju43_lookup sv, _session251_ju43_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=43 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-43-rejected-then-exalted-deliverer',
       E'The rejected-then-exalted deliverer — a type of Messiah',
       E'Joseph''s story bears a shape the whole canon will return to: the brother sold by his own — *And in the seventh year of this week he sent Joseph to learn about the welfare of his brothers from his house to the land of Shechem... and they sold him to Ishmaelite merchants, and they brought him down into Egypt* (Jubilees 34:10) — is the one Elohim lifts to rule and to save, *Yahuah (God) has made me as a father to Pharaoh, and ruler over his house and over all the land of Egypt* (Jubilees 43:19). The apostles preach Messiah in just this pattern: *whom ye delivered up, and denied him in the presence of Pilate, when he was determined to let him go* (Acts 3:13) — rejected by His own, then glorified. And where Joseph holds no grudge against the brothers who sold him, Yahusha prays for those who crucify Him, *Father, forgive them; for they know not what they do* (Luke 23:34). The promise the whole type rests on is Paul''s: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). It ain''t new — the rejected-then-exalted deliverer who forgives is written into the patriarchs.',
       sv.verse_id, ev.verse_id, 'extras', 54062
  FROM _session251_ju43_lookup sv, _session251_ju43_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=43 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-43-silver-cup-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 44:2 — *And put my cup, the silver cup, in the sack’s mouth of the youngest, and his corn money. And he did according to the word that Joseph had spoken* — the Genesis command behind Jubilees 43:1, the cup planted in Benjamin''s sack.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-silver-cup-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:3 — *As soon as the morning was light, the men were sent away, they and their asses* — the dawn departure that Jubilees 43:2 retells before Joseph sends the steward in pursuit.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-silver-cup-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 44:9 — *With whomsoever of thy servants it be found, both let him die, and we also will be my lord’s bondmen* — the brothers'' rash oath of innocence echoed in Jubilees 43:5.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-silver-cup-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 44:12 — *And he searched, and began at the eldest, and left at the youngest: and the cup was found in Benjamin’s sack* — the same search order and discovery that Jubilees 43:6 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-silver-cup-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-43-judah-offers-himself-surety
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 44:33 — *Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren* — Yahudah''s offer of himself, retold verbatim in Jubilees 43:13.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-judah-offers-himself-surety'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:32 — *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever* — the surety-bond Jubilees 43:13 names as the ground of Yahudah''s plea.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-judah-offers-himself-surety'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 44:30 — *Now therefore when I come to thy servant my father, and the lad be not with us; seeing that his life is bound up in the lad’s life* — the father''s life bound to Benjamin''s, as Jubilees 43:11 has it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-judah-offers-himself-surety'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-43-joseph-made-known
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:1 — *Then Joseph could not refrain himself before all them that stood by him; and he cried, Cause every man to go out from me. And there stood no man with him, while Joseph made himself known unto his brethren* — the source for Jubilees 43:14, Joseph unable to hold back.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-joseph-made-known'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:3 — *And Joseph said unto his brethren, I am Joseph; doth my father yet live? And his brethren could not answer him; for they were troubled at his presence* — the unveiling Jubilees 43:14 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-joseph-made-known'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 45:14 — *And he fell upon his brother Benjamin’s neck, and wept; and Benjamin wept upon his neck* — the embrace and weeping of Jubilees 43:15.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-joseph-made-known'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 45:12 — *And, behold, your eyes see, and the eyes of my brother Benjamin, that it is my mouth that speaketh unto you* — the very words Jubilees 43:16 puts in Joseph''s mouth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-joseph-made-known'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-43-god-meant-it-for-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* — the forgiveness and providence that Jubilees 43:18 carries.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-god-meant-it-for-good'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:7 — *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* — the great deliverance behind Jubilees 43:18, ''that many people might live.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-god-meant-it-for-good'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* — the full statement of the theme Jubilees 43:18 sounds: harm overruled for life.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-god-meant-it-for-good'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant* — the Psalmist reading Joseph''s descent as Elohim sending him ahead, as Jubilees 43:18 does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-god-meant-it-for-good'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* — Stephen''s witness that Elohim stood with the rejected Joseph who Jubilees 43:19 says was made father to Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-god-meant-it-for-good'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-43-rejected-then-exalted-deliverer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 34:10 — *And in the seventh year of this week he sent Joseph to learn about the welfare of his brothers from his house to the land of Shechem, and he found them in the land of Dothan* — the earlier Jubilees account of Joseph sent to the brothers who would sell him, now exalted in Jubilees 43:19.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-rejected-then-exalted-deliverer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 3:13 — *The Elohim (God) of Abraham, and of Isaac, and of Jacob, the Elohim (God) of our fathers, hath glorified his Son Yahusha (Jesus); whom ye delivered up, and denied him in the presence of Pilate* — the rejected-then-glorified Deliverer whose pattern Joseph foreshadows in Jubilees 43:19.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-rejected-then-exalted-deliverer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 23:34 — *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots* — the forgiving of those who rejected Him, the very heart Joseph shows in Jubilees 43:18.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-rejected-then-exalted-deliverer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* — Paul''s gospel-statement of the truth Jubilees 43:18 enacts: evil overruled for good.'
  FROM cross_reference_threads t, cross_references x, _session251_ju43_lookup sv, _session251_ju43_lookup tv
 WHERE t.slug='jubilees-43-rejected-then-exalted-deliverer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=43 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

