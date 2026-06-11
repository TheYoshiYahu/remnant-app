-- ----- fragment: minion_jasher_27.sql (session252 jasher 27) -----
-- Source anchor: jasher/jasher ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja27 (view _session252_ja27_lookup). Sort band base 55650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-27-esau-slays-nimrod
  ('jasher', 'jasher', 27, 7, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* The Nimrod Esau cuts down in Jasher 27:7 is the canon''s own mighty one, son of Cush.'),
  ('jasher', 'jasher', 27, 2, 'canon', 'genesis', 10, 9, 'free', E'Genesis 10:9 — *He was a mighty hunter before Yahuah (LORD): wherefore it is said, Even as Nimrod the mighty hunter before Yahuah (LORD).* Jasher 27:2 shows that same Nimrod still hunting in the field — the title the canon gave him.'),
  ('jasher', 'jasher', 27, 2, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* The king Jasher 27:2 calls ''king of Babel'' is the canon''s Nimrod, whose kingdom began at Babel in Shinar.'),
  ('jasher', 'jasher', 27, 10, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The garments by which Nimrod ''prevailed over the whole land'' (Jasher 27:10) belong to the Babel kingdom-of-man that sought a name for itself.'),
  -- thread: jasher-27-birthright-despised
  ('jasher', 'jasher', 27, 12, 'canon', 'genesis', 25, 31, 'free', E'Genesis 25:31 — *And Jacob said, Sell me this day thy birthright.* Jasher 27:12''s sale of the birthright to Jacob is the canon''s own bargain at the pottage.'),
  ('jasher', 'jasher', 27, 12, 'canon', 'genesis', 25, 32, 'free', E'Genesis 25:32 — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* Esau''s ''Behold I shall die this day'' in Jasher 27:12 echoes his canon words exactly.'),
  ('jasher', 'jasher', 27, 12, 'jubilees', 'jubilees', 24, 4, 'extras', E'Jubilees 24:4 — *And Esau said in his heart: “I shall die; of what profit to me is this birthright?” And he said to Jacob: “I give it to you.”* Jubilees narrates the same birthright sale after Abraham''s death that Jasher 27:12 records.'),
  ('jasher', 'jasher', 27, 12, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The NT names the despising behind Jasher 27:12''s bargain.'),
  -- thread: jasher-27-election-elder-younger
  ('jasher', 'jasher', 27, 12, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Jasher 27:12''s ''brought about by Yahuah'' is the womb-oracle of election at work.'),
  ('jasher', 'jasher', 27, 12, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul grounds the birthright Jasher 27:12 calls Yahuah''s doing in election, not in works.'),
  ('jasher', 'jasher', 27, 12, 'canon', 'romans', 9, 12, 'free', E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* The elder Esau yielding the birthright to younger Jacob in Jasher 27:12 is exactly the word Paul quotes.'),
  -- thread: jasher-27-machpelah-portion
  ('jasher', 'jasher', 27, 13, 'canon', 'genesis', 23, 17, 'free', E'Genesis 23:17 — *And the field of Ephron, which was in Machpelah, which was before Mamre, the field, and the cave which was therein, and all the trees that were in the field, that were in all the borders round about, were made sure.* The Machpelah portion Esau sells in Jasher 27:13 is the field Abraham deeded from the children of Heth.'),
  ('jasher', 'jasher', 27, 13, 'canon', 'genesis', 23, 19, 'free', E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* Jasher 27:13''s burial-ground bought from the children of Heth is this cave of Machpelah at Hebron.'),
  ('jasher', 'jasher', 27, 13, 'canon', 'hebrews', 11, 9, 'free', E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Jacob gathering Esau''s portion in the fathers'' resting-place (Jasher 27:13) is the heir keeping his hold on the land of promise.'),
  -- thread: jasher-27-nimrods-kingdom-divided
  ('jasher', 'jasher', 27, 17, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Nimrod''s kingdom dividing into many parts in Jasher 27:17 mirrors the scattering of his Babel from the start.'),
  ('jasher', 'jasher', 27, 16, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* The kingdom that falls by Esau''s sword in Jasher 27:16 is the Babel-dominion the canon credits to Nimrod.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-27-esau-slays-nimrod',
       E'Esau slays Nimrod the mighty hunter',
       E'Jasher gives the legendary cause of a hatred Genesis only hints at: *And Nimrod and two of his men that were with him came to the place where they were, when Esau started suddenly from his lurking place, and drew his sword, and hastened and ran to Nimrod and cut off his head* (Jasher 27:7). The man Jasher names is the same rebel king-builder the canon already knows: *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), *He was a mighty hunter before Yahuah (LORD): wherefore it is said, Even as Nimrod the mighty hunter before Yahuah (LORD)* (Genesis 10:9). His kingdom was the Babel-tyranny — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10) — the kingdom of man that built the tower: *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). It ain''t new — Jasher only puts a sword to the rivalry the seed-line and the kingdom-of-man have carried since Shinar.',
       sv.verse_id, ev.verse_id, 'extras', 55650
  FROM _session252_ja27_lookup sv, _session252_ja27_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=27 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-27-birthright-despised',
       E'Esau sells the birthright; the profane person',
       E'At the heart of the chapter the canon''s birthright scene appears, Jasher setting it on the very day of Nimrod''s death: *And he said to his brother Jacob, Behold I shall die this day, and therefore then do I want the birthright? And Jacob acted wisely with Esau in this matter, and Esau sold his birthright to Jacob, for it was so brought about by Yahuah (the Lord)* (Jasher 27:12). Genesis tells the same trade: *And Jacob said, Sell me this day thy birthright* (Genesis 25:31) — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* (Genesis 25:32). Jubilees narrates it word for word — *And Esau said in his heart: ''I shall die; of what profit to me is this birthright?'' And he said to Jacob: ''I give it to you.''* (Jubilees 24:4) — and names the heart of it: a despising. The NT reads it as the warning it is: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). It ain''t new — three witnesses lay the same despised birthright on the table.',
       sv.verse_id, ev.verse_id, 'extras', 55653
  FROM _session252_ja27_lookup sv, _session252_ja27_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=27 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-27-election-elder-younger',
       E'Election — ''brought about by Yahuah''',
       E'Jasher will not let the trade be mere cunning: *and Esau sold his birthright to Jacob, for it was so brought about by Yahuah (the Lord)* (Jasher 27:12). That is the canon''s election, spoken in the womb: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). The choosing precedes the conduct — Esau''s profanity does not make the election, it serves it. Paul reads it the same way: *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11), *It was said unto her, The elder shall serve the younger* (Romans 9:12). The covenant seed is kept and chosen — not a category swapped in, but Jacob over Esau, the line carried.',
       sv.verse_id, ev.verse_id, 'extras', 55656
  FROM _session252_ja27_lookup sv, _session252_ja27_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=27 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-27-machpelah-portion',
       E'Esau sells his portion in Machpelah',
       E'Jasher adds a second sale the canon does not record but rhymes with: *And Esau''s portion in the cave of the field of Machpelah, which Abraham had bought from the children of Heth for the possession of a burial ground, Esau also sold to Jacob, and Jacob bought all this from his brother Esau for value given* (Jasher 27:13). The burial ground is the canon''s own deeded inheritance: *And the field of Ephron, which was in Machpelah, which was before Mamre, the field, and the cave which was therein, and all the trees that were in the field, that were in all the borders round about, were made sure* (Genesis 23:17), *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan* (Genesis 23:19). Esau trades away his share in the resting-place of the fathers; Jacob gathers it — the seed-line keeping its hold on the land of promise: *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9).',
       sv.verse_id, ev.verse_id, 'extras', 55659
  FROM _session252_ja27_lookup sv, _session252_ja27_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=27 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-27-nimrods-kingdom-divided',
       E'Nimrod''s kingdom of man scattered',
       E'With Nimrod dead, Jasher shows the kingdom of man undone: *And at the death of Nimrod his kingdom became divided into many divisions, and all those parts that Nimrod reigned over were restored to the respective kings of the land, who recovered them after the death of Nimrod, and all the people of the house of Nimrod were for a long time enslaved to all the other kings of the land* (Jasher 27:17). The same Babel-kingdom the canon already saw scattered: *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). The tower-builders'' name and dominion do not stand — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10), but the beginning is also the breaking. The kingdom of man falls; the chosen seed, just handed the birthright, goes on. It ain''t new — the Babel pattern dissolves exactly as Genesis told it.',
       sv.verse_id, ev.verse_id, 'extras', 55662
  FROM _session252_ja27_lookup sv, _session252_ja27_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=27 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-27-esau-slays-nimrod
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* The Nimrod Esau cuts down in Jasher 27:7 is the canon''s own mighty one, son of Cush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-esau-slays-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:9 — *He was a mighty hunter before Yahuah (LORD): wherefore it is said, Even as Nimrod the mighty hunter before Yahuah (LORD).* Jasher 27:2 shows that same Nimrod still hunting in the field — the title the canon gave him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-esau-slays-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* The king Jasher 27:2 calls ''king of Babel'' is the canon''s Nimrod, whose kingdom began at Babel in Shinar.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-esau-slays-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The garments by which Nimrod ''prevailed over the whole land'' (Jasher 27:10) belong to the Babel kingdom-of-man that sought a name for itself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-esau-slays-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-27-birthright-despised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:31 — *And Jacob said, Sell me this day thy birthright.* Jasher 27:12''s sale of the birthright to Jacob is the canon''s own bargain at the pottage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-birthright-despised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:32 — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* Esau''s ''Behold I shall die this day'' in Jasher 27:12 echoes his canon words exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-birthright-despised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 24:4 — *And Esau said in his heart: “I shall die; of what profit to me is this birthright?” And he said to Jacob: “I give it to you.”* Jubilees narrates the same birthright sale after Abraham''s death that Jasher 27:12 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-birthright-despised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The NT names the despising behind Jasher 27:12''s bargain.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-birthright-despised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-27-election-elder-younger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Jasher 27:12''s ''brought about by Yahuah'' is the womb-oracle of election at work.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-election-elder-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul grounds the birthright Jasher 27:12 calls Yahuah''s doing in election, not in works.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-election-elder-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* The elder Esau yielding the birthright to younger Jacob in Jasher 27:12 is exactly the word Paul quotes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-election-elder-younger'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-27-machpelah-portion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:17 — *And the field of Ephron, which was in Machpelah, which was before Mamre, the field, and the cave which was therein, and all the trees that were in the field, that were in all the borders round about, were made sure.* The Machpelah portion Esau sells in Jasher 27:13 is the field Abraham deeded from the children of Heth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-machpelah-portion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* Jasher 27:13''s burial-ground bought from the children of Heth is this cave of Machpelah at Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-machpelah-portion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Jacob gathering Esau''s portion in the fathers'' resting-place (Jasher 27:13) is the heir keeping his hold on the land of promise.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-machpelah-portion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-27-nimrods-kingdom-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Nimrod''s kingdom dividing into many parts in Jasher 27:17 mirrors the scattering of his Babel from the start.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-nimrods-kingdom-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* The kingdom that falls by Esau''s sword in Jasher 27:16 is the Babel-dominion the canon credits to Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja27_lookup sv, _session252_ja27_lookup tv
 WHERE t.slug='jasher-27-nimrods-kingdom-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=27 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

