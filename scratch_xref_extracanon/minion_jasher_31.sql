-- ----- fragment: minion_jasher_31.sql (session252 jasher 31) -----
-- Source anchor: jasher/jasher ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja31 (view _session252_ja31_lookup). Sort band base 55750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-31-leah-rachel-wedding-deception
  ('jasher', 'jasher', 31, 4, 'canon', 'genesis', 29, 23, 'free', E'Genesis 29:23 — *And it came to pass in the evening, that he took Leah his daughter, and brought her to him; and he went in unto her.* The canon''s terse wedding-night line is the scene Jasher 31:4 expands with the extinguished lamps and the unwitting Jacob.'),
  ('jasher', 'jasher', 31, 11, 'canon', 'genesis', 29, 25, 'free', E'Genesis 29:25 — *And it came to pass, that in the morning, behold, it was Leah: and he said to Laban, What is this thou hast done unto me? did not I serve with thee for Rachel? wherefore then hast thou beguiled me?* Jacob''s morning protest in Jasher 31:11 is the same charge of deceit lodged in Genesis.'),
  ('jasher', 'jasher', 31, 12, 'canon', 'genesis', 29, 26, 'free', E'Genesis 29:26 — *And Laban said, It must not be so done in our country, to give the younger before the firstborn.* Laban''s elder-before-younger custom in Jasher 31:12 quotes the canon''s defense almost verbatim.'),
  ('jasher', 'jasher', 31, 4, 'jubilees', 'jubilees', 28, 4, 'extras', E'Jubilees 28:4 — *And he went in to her, and behold, she was Leah; and Jacob was angry with Laban, and said to him: “Why have you dealt thus with me? Did not I serve you for Rachel and not for Leah?* Jubilees narrates the same deceived wedding night that Jasher 31:4 tells, the two extra-canon witnesses agreeing with Genesis.'),
  -- thread: jasher-31-twelve-tribes-begin
  ('jasher', 'jasher', 31, 14, 'canon', 'genesis', 29, 31, 'free', E'Genesis 29:31 — *And when Yahuah (LORD) saw that Leah was hated, he opened her womb: but Rachel was barren.* Jasher 31:14 retells this opening of Leah''s womb that begins the tribal births.'),
  ('jasher', 'jasher', 31, 18, 'canon', 'genesis', 30, 21, 'free', E'Genesis 30:21 — *And afterwards she bare a daughter, and called her name Dinah.* The sister named in Jasher 31:18 alongside Issachar and Zebulon is the canon''s Dinah.'),
  ('jasher', 'jasher', 31, 15, 'canon', 'exodus', 1, 1, 'free', E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* The sons Jasher 31:15 begins naming are the very tribes that become the nation in Egypt.'),
  ('jasher', 'jasher', 31, 15, 'jubilees', 'jubilees', 28, 11, 'extras', E'Jubilees 28:11 — *And Yahuah (God) opened the womb of Leah, and she conceived and bare Jacob a son, and he called his name Reuben, on the fourteenth day of the ninth month, in the first year of the third week.* Jubilees dates the first of the sons Jasher 31:15 lists, the same tribal beginning.'),
  -- thread: jasher-31-rachel-prayer-joseph
  ('jasher', 'jasher', 31, 21, 'canon', 'genesis', 30, 22, 'free', E'Genesis 30:22 — *And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb.* Rachel''s answered supplication in Jasher 31:19-21 is the canon''s remembering of Rachel.'),
  ('jasher', 'jasher', 31, 21, 'canon', 'genesis', 30, 23, 'free', E'Genesis 30:23 — *And she conceived, and bare a son; and said, Elohim (God) hath taken away my reproach.* The exact words Jasher 31:21 puts in Rachel''s mouth at Joseph''s naming.'),
  ('jasher', 'jasher', 31, 19, 'jubilees', 'jubilees', 28, 24, 'extras', E'Jubilees 28:24 — *And Yahuah (God) was gracious to Rachel, and opened her womb, and she conceived, and bare a son, and she called his name Joseph, on the new moon of the fourth month, in the sixth year in this fourth week.* Jubilees dates the birth that answers Rachel''s prayer in Jasher 31:19.'),
  -- thread: jasher-31-speckled-flocks-increase
  ('jasher', 'jasher', 31, 26, 'canon', 'genesis', 30, 32, 'free', E'Genesis 30:32 — *I will pass through all thy flock to day, removing from thence all the speckled and spotted cattle, and all the brown cattle among the sheep, and the spotted and speckled among the goats: and of such shall be my hire.* The very wage-terms Jacob names in Jasher 31:26.'),
  ('jasher', 'jasher', 31, 31, 'canon', 'genesis', 30, 43, 'free', E'Genesis 30:43 — *And the man increased exceedingly, and had much cattle, and maidservants, and menservants, and camels, and asses.* Jasher 31:31 closes the flock account with the canon''s identical inventory of Jacob''s increase.'),
  ('jasher', 'jasher', 31, 35, 'canon', 'genesis', 31, 1, 'free', E'Genesis 31:1 — *And he heard the words of Laban''s sons, saying, Jacob hath taken away all that was our father''s; and of that which was our father''s hath he gotten all this glory.* The envy of Laban''s sons in Jasher 31:35 is quoted nearly word for word from the canon.'),
  ('jasher', 'jasher', 31, 31, 'jubilees', 'jubilees', 28, 29, 'extras', E'Jubilees 28:29 — *And Jacob''s possessions multiplied exceedingly, and he possessed oxen and sheep and asses and camels, and menservants and maidservants. And Laban and his sons envied Jacob.* Jubilees joins the same multiplying-and-envy Jasher 31:31-35 records.'),
  -- thread: jasher-31-flight-rachel-teraphim
  ('jasher', 'jasher', 31, 37, 'canon', 'genesis', 31, 3, 'free', E'Genesis 31:3 — *And Yahuah (LORD) said unto Jacob, Return unto the land of thy fathers, and to thy kindred; and I will be with thee.* The departure command of Jasher 31:37 is the canon''s call to return, with the same “I will be with thee.”'),
  ('jasher', 'jasher', 31, 40, 'canon', 'genesis', 31, 19, 'free', E'Genesis 31:19 — *And Laban went to shear his sheep: and Rachel had stolen the images that were her father''s.* Rachel''s theft of the teraphim in Jasher 31:40 retells this canon line, sheep-shearing and all.'),
  ('jasher', 'jasher', 31, 37, 'jubilees', 'jubilees', 29, 2, 'extras', E'Jubilees 29:2 — *And Jacob saw that Laban was going to shear his sheep, and Jacob called Leah and Rachel, and spake kindly to them that they should come with him to the land of Canaan.* Jubilees narrates the same shearing-day flight Jasher 31:37-40 sets up.'),
  -- thread: jasher-31-laban-pursuit-gilead-heap
  ('jasher', 'jasher', 31, 51, 'canon', 'genesis', 31, 50, 'free', E'Genesis 31:50 — *If thou shalt afflict my daughters, or if thou shalt take other wives beside my daughters, no man is with us; see, Elohim (God) is witness betwixt me and thee.* The exact covenant condition Laban lays on Jacob in Jasher 31:51.'),
  ('jasher', 'jasher', 31, 52, 'canon', 'genesis', 31, 44, 'free', E'Genesis 31:44 — *Now therefore come thou, let us make a covenant, I and thou; and let it be for a witness between me and thee.* Jasher 31:52''s heap-as-witness is the canon''s covenant of witness between Laban and Jacob.'),
  ('jasher', 'jasher', 31, 52, 'jubilees', 'jubilees', 29, 8, 'extras', E'Jubilees 29:8 — *And he made there a heap for a witness; wherefore the name of that place is called: “The Heap of Witness,” after this heap.* Jubilees names the same Gilead heap-of-witness Jacob and Laban raise in Jasher 31:52.'),
  -- thread: jasher-31-jacob-election-israel
  ('jasher', 'jasher', 31, 64, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau''s burning hatred in Jasher 31:64 stands against the womb-oracle that chose the younger Jacob.'),
  ('jasher', 'jasher', 31, 64, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul reads Jacob-over-Esau, the very rivalry erupting in Jasher 31:64-65, as election before works.'),
  ('jasher', 'jasher', 31, 65, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The Esau who arms four hundred men in Jasher 31:65 is the profane brother who despised his birthright.'),
  ('jasher', 'jasher', 31, 72, 'canon', 'hosea', 12, 3, 'free', E'Hosea 12:3 — *He took his brother by the heel in the womb, and by his strength he had power with Elohim (God):* The prophet recalls the heel-grasping Jacob whose host-of-Elohim camp Jasher 31:72 names Machnayim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-leah-rachel-wedding-deception',
       E'Heleah, Heleah — Laban deceives Jacob with Leah',
       E'Jasher unfolds the wedding-night deception in detail: *And afterward Laban took his daughter Leah, and he brought her to Jacob, and he came to her and Jacob did not know that she was Leah* (Jasher 31:4), the neighbors crying *Heleah, Heleah* under the extinguished lamps as a hint Jacob does not catch (Jasher 31:7,10). This is the canon scene retold — *And it came to pass in the evening, that he took Leah his daughter, and brought her to him; and he went in unto her* (Genesis 29:23), and at daybreak *in the morning, behold, it was Leah: and he said to Laban, What is this thou hast done unto me? did not I serve with thee for Rachel? wherefore then hast thou beguiled me?* (Genesis 29:25). Laban''s defense in Jasher 31:12 echoes the canon word for word: *And Laban said, It must not be so done in our country, to give the younger before the firstborn* (Genesis 29:26). Jubilees narrates the same week: *And he went in to her, and behold, she was Leah; and Jacob was angry with Laban* (Jubilees 28:4). The deceiver Jacob is here deceived — the heel-grasper meets a cunning equal — yet the covenant seed is not derailed. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55750
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-twelve-tribes-begin',
       E'The twelve sons and Dinah — the tribes begin',
       E'Jasher tracks the womb-war that founds the nation: *And these are their names, Reuben Simeon, Levi, and Judah* (Jasher 31:15), then Dan and Naphtali by Bilhah, Gad and Asher by Zilpah, then *Issachar, Zebulon, and their sister Dinah* (Jasher 31:18). This is Genesis told son by son — *And when Yahuah (LORD) saw that Leah was hated, he opened her womb: but Rachel was barren* (Genesis 29:31) opens it, and Jasher 31:14 carries the same line. Jubilees logs each birth by date: *And Yahuah (God) opened the womb of Leah, and she conceived and bare Jacob a son, and he called his name Reuben* (Jubilees 28:11). These twelve are the covenant people in seed-form — the same names that go down into Egypt: *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob* (Exodus 1:1). The twelve-tribe nation of Ezekiel''s two sticks begins here in a tent in Haran. The election is kept; the gathering has its root.',
       sv.verse_id, ev.verse_id, 'extras', 55753
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-rachel-prayer-joseph',
       E'Rachel''s reproach taken away — the birth of Joseph',
       E'Jasher gives Rachel a prayer the canon only implies: *O Yahuah Elohim (O Lord God) remember me and visit me, I beseech you, for now my husband will cast me off, for I have borne him no children* (Jasher 31:19), and Elohim answers — *and she said, Yahuah (the Lord) has taken away my reproach, and she called his name Joseph* (Jasher 31:21). Genesis is spare and exact at the same turn: *And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb* (Genesis 30:22), and *she conceived, and bare a son; and said, Elohim (God) hath taken away my reproach* (Genesis 30:23). Jubilees marks the day: *And Yahuah (God) was gracious to Rachel, and opened her womb, and she conceived, and bare a son, and she called his name Joseph* (Jubilees 28:24). The barren beloved is heard; the seed kept; Joseph — who will carry the whole house into Egypt and out — is given.',
       sv.verse_id, ev.verse_id, 'extras', 55756
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-speckled-flocks-increase',
       E'The speckled wages — Jacob increased exceedingly',
       E'Jasher sets the wage-bargain plainly: *that I shall this day pass through all your flock and take away from them every lamb that is speckled and spotted and such as are brown amongst the sheep, and amongst the goats* (Jasher 31:26), and the result — *the man increased abundantly and he had cattle and maid servants and men servants, camels, and asses* (Jasher 31:31). This is the speckled-flock account of Genesis: *I will pass through all thy flock to day, removing from thence all the speckled and spotted cattle, and all the brown cattle among the sheep* (Genesis 30:32), closing with the canon''s near-identical summary — *And the man increased exceedingly, and had much cattle, and maidservants, and menservants, and camels, and asses* (Genesis 30:43). Jubilees records the same multiplying and the same envy: *And Jacob''s possessions multiplied exceedingly, and he possessed oxen and sheep and asses and camels, and menservants and maidservants* (Jubilees 28:29). The blessing on the chosen seed outruns the schemer Laban; Yahuah, not the rods, makes him great.',
       sv.verse_id, ev.verse_id, 'extras', 55759
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-flight-rachel-teraphim',
       E'The flight and the stolen teraphim',
       E'Yahuah commands the return — *Arise, go forth out of this land, and return to the land of your birthplace and I will be with you* (Jasher 31:37) — and Jacob flees while Laban shears, *And Rachel stole her father''s images, and she took them and she concealed them upon the camel upon which she sat* (Jasher 31:40). The canon command is the same — *And Yahuah (LORD) said unto Jacob, Return unto the land of thy fathers, and to thy kindred; and I will be with thee* (Genesis 31:3) — and so is the theft: *And Laban went to shear his sheep: and Rachel had stolen the images that were her father''s* (Genesis 31:19). Jubilees tells it too: *And Jacob saw that Laban was going to shear his sheep, and Jacob called Leah and Rachel, and spake kindly to them that they should come with him to the land of Canaan* (Jubilees 29:2). Jasher 31:41-43 then adds its legendary recipe for the talking teraphim — idols that *speak* by a name and read the stars — exposing them as the dead, oracle-mongering counterfeit the chosen seed must leave behind. The household gods are carried off; the covenant Elohim goes with Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 55762
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=37
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-laban-pursuit-gilead-heap',
       E'The pursuit and the heap of witness at Gilead',
       E'Laban overtakes Jacob and they cut a covenant: *We will make a covenant together and it shall be a testimony between me and you; if you shall afflict my daughters, or shall take other wives besides my daughters, even Elohim shall be a witness between me and you* (Jasher 31:51), and *they took stones and made a heap... therefore he called the name of it Gilead* (Jasher 31:52). The canon is the same covenant and the same heap — *Now therefore come thou, let us make a covenant, I and thou; and let it be for a witness between me and thee* (Genesis 31:44), and *If thou shalt afflict my daughters, or if thou shalt take other wives beside my daughters, no man is with us; see, Elohim (God) is witness betwixt me and thee* (Genesis 31:50). Jubilees names it likewise: *And he made there a heap for a witness; wherefore the name of that place is called: “The Heap of Witness,” after this heap* (Jubilees 29:8). Jacob, the heel-grasper, is delivered from Laban''s hand by oath and altar — the deceiver schemes but cannot keep the chosen seed; the fathers settle disputes with sacrifice and the Name as witness. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55765
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=46
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-31-jacob-election-israel',
       E'The supplanter chosen — Jacob, the elder shall serve the younger',
       E'All of Jasher 31 turns on a man hated by his brother yet held by Elohim: Jacob serves, is cheated, increases, flees, and is delivered. Genesis named the choosing from the womb — *Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23) — and Paul reads it as election before works: *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11). The despised birthright belongs to the other brother: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16) — and at this chapter''s end (Jasher 31:54-65) it is that same Esau who musters four hundred men against Jacob. The prophets keep the pattern: *He took his brother by the heel in the womb, and by his strength he had power with Elohim* (Hosea 12:3). Election precedes confession; the seed is kept not for Jacob''s merit but by Him that calleth. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55768
  FROM _session252_ja31_lookup sv, _session252_ja31_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=64
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=31 AND ev.verse_number=77
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-31-leah-rachel-wedding-deception
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:23 — *And it came to pass in the evening, that he took Leah his daughter, and brought her to him; and he went in unto her.* The canon''s terse wedding-night line is the scene Jasher 31:4 expands with the extinguished lamps and the unwitting Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-leah-rachel-wedding-deception'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:25 — *And it came to pass, that in the morning, behold, it was Leah: and he said to Laban, What is this thou hast done unto me? did not I serve with thee for Rachel? wherefore then hast thou beguiled me?* Jacob''s morning protest in Jasher 31:11 is the same charge of deceit lodged in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-leah-rachel-wedding-deception'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:26 — *And Laban said, It must not be so done in our country, to give the younger before the firstborn.* Laban''s elder-before-younger custom in Jasher 31:12 quotes the canon''s defense almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-leah-rachel-wedding-deception'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 28:4 — *And he went in to her, and behold, she was Leah; and Jacob was angry with Laban, and said to him: “Why have you dealt thus with me? Did not I serve you for Rachel and not for Leah?* Jubilees narrates the same deceived wedding night that Jasher 31:4 tells, the two extra-canon witnesses agreeing with Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-leah-rachel-wedding-deception'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-31-twelve-tribes-begin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:31 — *And when Yahuah (LORD) saw that Leah was hated, he opened her womb: but Rachel was barren.* Jasher 31:14 retells this opening of Leah''s womb that begins the tribal births.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-twelve-tribes-begin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 30:21 — *And afterwards she bare a daughter, and called her name Dinah.* The sister named in Jasher 31:18 alongside Issachar and Zebulon is the canon''s Dinah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-twelve-tribes-begin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* The sons Jasher 31:15 begins naming are the very tribes that become the nation in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-twelve-tribes-begin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 28:11 — *And Yahuah (God) opened the womb of Leah, and she conceived and bare Jacob a son, and he called his name Reuben, on the fourteenth day of the ninth month, in the first year of the third week.* Jubilees dates the first of the sons Jasher 31:15 lists, the same tribal beginning.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-twelve-tribes-begin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=28 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-31-rachel-prayer-joseph
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 30:22 — *And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb.* Rachel''s answered supplication in Jasher 31:19-21 is the canon''s remembering of Rachel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-rachel-prayer-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 30:23 — *And she conceived, and bare a son; and said, Elohim (God) hath taken away my reproach.* The exact words Jasher 31:21 puts in Rachel''s mouth at Joseph''s naming.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-rachel-prayer-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 28:24 — *And Yahuah (God) was gracious to Rachel, and opened her womb, and she conceived, and bare a son, and she called his name Joseph, on the new moon of the fourth month, in the sixth year in this fourth week.* Jubilees dates the birth that answers Rachel''s prayer in Jasher 31:19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-rachel-prayer-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=28 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-31-speckled-flocks-increase
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 30:32 — *I will pass through all thy flock to day, removing from thence all the speckled and spotted cattle, and all the brown cattle among the sheep, and the spotted and speckled among the goats: and of such shall be my hire.* The very wage-terms Jacob names in Jasher 31:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-speckled-flocks-increase'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 30:43 — *And the man increased exceedingly, and had much cattle, and maidservants, and menservants, and camels, and asses.* Jasher 31:31 closes the flock account with the canon''s identical inventory of Jacob''s increase.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-speckled-flocks-increase'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 31:1 — *And he heard the words of Laban''s sons, saying, Jacob hath taken away all that was our father''s; and of that which was our father''s hath he gotten all this glory.* The envy of Laban''s sons in Jasher 31:35 is quoted nearly word for word from the canon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-speckled-flocks-increase'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 28:29 — *And Jacob''s possessions multiplied exceedingly, and he possessed oxen and sheep and asses and camels, and menservants and maidservants. And Laban and his sons envied Jacob.* Jubilees joins the same multiplying-and-envy Jasher 31:31-35 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-speckled-flocks-increase'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=28 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-31-flight-rachel-teraphim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 31:3 — *And Yahuah (LORD) said unto Jacob, Return unto the land of thy fathers, and to thy kindred; and I will be with thee.* The departure command of Jasher 31:37 is the canon''s call to return, with the same “I will be with thee.”'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-flight-rachel-teraphim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 31:19 — *And Laban went to shear his sheep: and Rachel had stolen the images that were her father''s.* Rachel''s theft of the teraphim in Jasher 31:40 retells this canon line, sheep-shearing and all.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-flight-rachel-teraphim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 29:2 — *And Jacob saw that Laban was going to shear his sheep, and Jacob called Leah and Rachel, and spake kindly to them that they should come with him to the land of Canaan.* Jubilees narrates the same shearing-day flight Jasher 31:37-40 sets up.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-flight-rachel-teraphim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=37
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=29 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-31-laban-pursuit-gilead-heap
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 31:50 — *If thou shalt afflict my daughters, or if thou shalt take other wives beside my daughters, no man is with us; see, Elohim (God) is witness betwixt me and thee.* The exact covenant condition Laban lays on Jacob in Jasher 31:51.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-laban-pursuit-gilead-heap'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 31:44 — *Now therefore come thou, let us make a covenant, I and thou; and let it be for a witness between me and thee.* Jasher 31:52''s heap-as-witness is the canon''s covenant of witness between Laban and Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-laban-pursuit-gilead-heap'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 29:8 — *And he made there a heap for a witness; wherefore the name of that place is called: “The Heap of Witness,” after this heap.* Jubilees names the same Gilead heap-of-witness Jacob and Laban raise in Jasher 31:52.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-laban-pursuit-gilead-heap'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=52
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=29 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-31-jacob-election-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau''s burning hatred in Jasher 31:64 stands against the womb-oracle that chose the younger Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-jacob-election-israel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul reads Jacob-over-Esau, the very rivalry erupting in Jasher 31:64-65, as election before works.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-jacob-election-israel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The Esau who arms four hundred men in Jasher 31:65 is the profane brother who despised his birthright.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-jacob-election-israel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 12:3 — *He took his brother by the heel in the womb, and by his strength he had power with Elohim (God):* The prophet recalls the heel-grasping Jacob whose host-of-Elohim camp Jasher 31:72 names Machnayim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja31_lookup sv, _session252_ja31_lookup tv
 WHERE t.slug='jasher-31-jacob-election-israel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=31 AND sv.verse_number=72
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

