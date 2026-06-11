-- ----- fragment: minion_jasher_47.sql (session252 jasher 47) -----
-- Source anchor: jasher/jasher ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja47 (view _session252_ja47_lookup). Sort band base 56150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-47-isaac-blesses-the-sons
  ('jasher', 'jasher', 47, 5, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The star-seed Isaac speaks over Jacob''s sons in Jasher 47:5 is the very oath Yahuah swore to Abraham.'),
  ('jasher', 'jasher', 47, 5, 'canon', 'genesis', 26, 4, 'free', E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed;* The same promise was renewed to Isaac himself, which is why he can pass the star-blessing to his grandsons in Jasher 47:5.'),
  ('jasher', 'jasher', 47, 5, 'jubilees', 'jubilees', 36, 6, 'extras', E'Jubilees 36:6 — *Remember you, my sons, Yahuah Elohim (the LORD God) of Abraham your father, and how I too worshipped Him and served Him in righteousness and in joy, that He might multiply you and increase your seed as the stars of heaven in multitude, and establish you on the earth as the plant of righteousness which will not be rooted out to all the generations for ever.* Jubilees keeps the same deathbed scene of Isaac invoking the star-seed that Jasher 47:5 narrates.'),
  ('jasher', 'jasher', 47, 5, 'apocrypha', 'ecclesiasticus', 44, 22, 'extras', E'Ecclesiasticus 44:22 — *With Isaac did he establish likewise for Abraham his father’s sake the blessing of all men, and the covenant,* Sirach''s praise of the fathers confirms that the blessing Isaac hands on in Jasher 47:5 was first established with him for Abraham''s sake.'),
  -- thread: jasher-47-teach-your-children
  ('jasher', 'jasher', 47, 8, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Isaac''s charge to teach the children to fear Yahuah in Jasher 47:8 is the Shema''s own command, kept by the fathers before Sinai.'),
  ('jasher', 'jasher', 47, 7, 'canon', 'genesis', 26, 3, 'free', E'Genesis 26:3 — *Sojourn in this land, and I will be with thee, and will bless thee; for unto thee, and unto thy seed, I will give all these countries, and I will perform the oath which I sware unto Abraham thy father;* The land-for-the-seed oath Isaac repeats in Jasher 47:7 is the word Yahuah first spoke directly to him.'),
  ('jasher', 'jasher', 47, 8, 'jubilees', 'jubilees', 36, 3, 'extras', E'Jubilees 36:3 — *And this I command you, my sons, that you practise righteousness and uprightness on the earth, so that Yahuah (God) may bring upon you all that Yahuah (God) said that he would do to Abraham and to his seed.* Jubilees gives the same dying charge to walk in righteousness so the promise to Abraham''s seed may come, paralleling Jasher 47:8.'),
  -- thread: jasher-47-isaac-dies-machpelah
  ('jasher', 'jasher', 47, 9, 'canon', 'genesis', 35, 29, 'free', E'Genesis 35:29 — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* Jasher 47:9 retells this verse almost verbatim — Isaac gathered to his people, buried by his two sons.'),
  ('jasher', 'jasher', 47, 10, 'canon', 'genesis', 35, 28, 'free', E'Genesis 35:28 — *And the days of Isaac were an hundred and fourscore years.* Genesis records the same one hundred and eighty years that Jasher 47:10 gives for Isaac at his death.'),
  ('jasher', 'jasher', 47, 10, 'canon', 'genesis', 23, 17, 'free', E'Genesis 23:17 — *And the field of Ephron, which was in Machpelah, which was before Mamre, the field, and the cave which was therein, and all the trees that were in the field, that were in all the borders round about, were made sure* The cave Abraham bought from the children of Heth, where Isaac is buried in Jasher 47:10, is the field of Machpelah secured here.'),
  ('jasher', 'jasher', 47, 9, 'jubilees', 'jubilees', 36, 18, 'extras', E'Jubilees 36:18 — *And Isaac slept on his bed that day rejoicing; and he slept the eternal sleep, and died one hundred and eighty years old. He completed twenty-five weeks and five years; and his two sons Esau and Jacob buried him.* Jubilees gives the same death at one hundred and eighty years, buried by Esau and Jacob, that Jasher 47:9 narrates.'),
  ('jasher', 'jasher', 47, 9, 'jubilees', 'jubilees', 36, 2, 'extras', E'Jubilees 36:2 — *Wherefore bury me near Abraham my father, in the double cave in the field of Ephron the Hittite, where Abraham purchased a sepulchre to bury in; in the sepulchre which I digged for myself, there bury me.* Isaac''s request to be laid in Abraham''s purchased cave matches the Machpelah burial of Jasher 47:9-10.'),
  -- thread: jasher-47-jacob-takes-the-land
  ('jasher', 'jasher', 47, 24, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The exact boundary Jacob takes for his seed forever in Jasher 47:24 is the covenant land-grant Yahuah cut with Abram.'),
  ('jasher', 'jasher', 47, 24, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting possession Jacob secures in Jasher 47:24 rests on the everlasting covenant to Abraham''s seed.'),
  ('jasher', 'jasher', 47, 31, 'canon', 'genesis', 36, 6, 'free', E'Genesis 36:6 — *And Esau took his wives, and his sons, and his daughters, and all the persons of his house, and his cattle, and all his beasts, and all his substance, which he had got in the land of Canaan; and went into the country from the face of his brother Jacob.* Genesis already records Esau taking his goods and departing from Jacob to Seir, just as Jasher 47:31 narrates.'),
  ('jasher', 'jasher', 47, 19, 'jubilees', 'jubilees', 36, 11, 'extras', E'Jubilees 36:11 — *I say and testify to you, my sons, according to the judgment which will come upon the man who wishes to injure his brother." And he divided all his possessions between the two on that day, and he gave the larger portion to him that was the first-born, and the tower and all that was about it, and all that Abraham possessed at the Well of the Oath.* Jubilees has Isaac himself divide the estate between the brothers, the same partition Jacob and Esau settle in Jasher 47:15-19.'),
  -- thread: jasher-47-everlasting-inheritance
  ('jasher', 'jasher', 47, 33, 'canon', 'genesis', 36, 8, 'free', E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Genesis records the same end Jasher 47:33 gives — Esau and his children inheriting the mountain of Seir while Canaan goes to Israel.'),
  ('jasher', 'jasher', 47, 33, 'canon', 'genesis', 27, 39, 'free', E'Genesis 27:39 — *And Isaac his father answered and said unto him, Behold, thy dwelling shall be the fatness of the earth, and of the dew of heaven from above;* Esau''s portion away from Canaan in Jasher 47:33 fulfills the very dwelling Isaac had spoken over him.'),
  ('jasher', 'jasher', 47, 33, 'canon', 'hebrews', 11, 9, 'free', E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise:* The everlasting inheritance Jacob secures for Israel in Jasher 47:33 is the land of promise the fathers held by faith as joint heirs.'),
  ('jasher', 'jasher', 47, 29, 'canon', 'acts', 7, 8, 'free', E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen traces the same kept seed-line — Abraham to Isaac to Jacob to the twelve — whose deed Jacob seals for his children in Jasher 47:29.'),
  ('jasher', 'jasher', 47, 33, 'apocrypha', 'ecclesiasticus', 44, 23, 'extras', E'Ecclesiasticus 44:23 — *And made it rest upon the head of Jacob. He acknowledged him in his blessing, and gave him an heritage, and divided his portions; among the twelve tribes did he part them.* Sirach sums the very outcome of Jasher 47:33 — the heritage resting on Jacob and parted among the twelve tribes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-47-isaac-blesses-the-sons',
       E'Isaac blesses the sons of Jacob — the seed like the stars',
       E'Jasher gathers the aged Isaac with his grandsons for a final blessing: *And Isaac placed his hands upon all the sons of Jacob, and he took hold of them and embraced them, and kissed them one by one, and Isaac blessed them on that day, and he said to them, May the Elohim (God) of my fathers bless you and increase your seed like the stars of heaven for number.* (Jasher 47:5). The blessing simply carries the covenant Yahuah swore to Abraham — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17) — and to Isaac himself — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed;* (Genesis 26:4). Jubilees keeps the same scene of the dying patriarch invoking the star-seed — *Remember you, my sons, Yahuah Elohim (the LORD God) of Abraham your father, and how I too worshipped Him and served Him in righteousness and in joy, that He might multiply you and increase your seed as the stars of heaven in multitude, and establish you on the earth as the plant of righteousness which will not be rooted out to all the generations for ever.* (Jubilees 36:6). It ain''t new — the election runs Abraham → Isaac → Jacob → the twelve, the covenant seed kept and chosen.',
       sv.verse_id, ev.verse_id, 'extras', 56150
  FROM _session252_ja47_lookup sv, _session252_ja47_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=47 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-47-teach-your-children',
       E'Teach your children to fear Yahuah — Torah before Sinai',
       E'Isaac''s charge to Jacob in Jasher is the covenant condition spoken plainly: *Now therefore my son, teach your children and your children’s children to fear Yahuah (the Lord), and to go in the good way which will please Yahuah your Elohim (the Lord your God), for if you keep the ways of Yahuah (the Lord) and his statutes Yahuah (the Lord) will also keep to you his covenant with Abraham, and will do well with you and your seed all the days.* (Jasher 47:8) — and the land-inheritance hangs on it: *Yahuah Elohim (the Lord God) of the whole earth said to me, To your seed will I give this land for an inheritance if your children keep my statutes and my ways, and I will perform to them the oath which I swore to your father Abraham.* (Jasher 47:7). This is the Shema-charge centuries before Sinai — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* (Deuteronomy 6:7) — and Jubilees keeps the same testament — *And this I command you, my sons, that you practise righteousness and uprightness on the earth, so that Yahuah (God) may bring upon you all that Yahuah (God) said that he would do to Abraham and to his seed.* (Jubilees 36:3). Torah stands; the fathers walked the way and taught it. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56153
  FROM _session252_ja47_lookup sv, _session252_ja47_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=47 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-47-isaac-dies-machpelah',
       E'Isaac gives up the ghost — buried in Machpelah',
       E'Jasher closes Isaac''s life as Genesis does: *And when Isaac had finished commanding Jacob and his children, he gave up the ghost and died, and was gathered to his people.* (Jasher 47:9), and his sons *carried him to the cave of Machpelah, which Abraham had bought from the children of Heth for a possession of a burial place.* (Jasher 47:10). Genesis sets it word for word — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* (Genesis 35:29) — at the very age Jasher names — *And the days of Isaac were an hundred and fourscore years.* (Genesis 35:28). The burial-place is the field Abraham bought — *And the field of Ephron, which was in Machpelah, which was before Mamre, the field, and the cave which was therein, and all the trees that were in the field, that were in all the borders round about, were made sure* (Genesis 23:17). Jubilees keeps the same death-scene and request — *And Isaac slept on his bed that day rejoicing; and he slept the eternal sleep, and died one hundred and eighty years old. He completed twenty-five weeks and five years; and his two sons Esau and Jacob buried him.* (Jubilees 36:18). It ain''t new — Jasher only fills in the kings'' honors around the canon''s plain record.',
       sv.verse_id, ev.verse_id, 'extras', 56156
  FROM _session252_ja47_lookup sv, _session252_ja47_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=47 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-47-jacob-takes-the-land',
       E'The land or the riches — Jacob inherits Canaan forever',
       E'Where the brothers divide Isaac''s estate, Jasher dramatizes the old birthright choice: Jacob lays the whole inheritance before Esau and lets him choose — *If you desire the whole land take it for you and your children forever, and I will take this riches, and it you desire the riches take it to you, and I will take this land for me and for my children to inherit it forever.* (Jasher 47:19) — and Esau takes the silver and gold while Jacob takes the land: *and Jacob took all the land of Canaan, from the brook of Egypt to the river Euphrates, and he took it for an everlasting possession, and for his children and for his seed after him forever.* (Jasher 47:24). The boundary is the covenant land-grant itself — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* (Genesis 15:18) — sworn as an everlasting possession — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* (Genesis 17:7). Genesis already had Esau choosing Seir over the land — *And Esau took his wives, and his sons, and his daughters, and all the persons of his house, and his cattle, and all his beasts, and all his substance, which he had got in the land of Canaan; and went into the country from the face of his brother Jacob.* (Genesis 36:6). The elect seed keeps the land-promise; the profane brother takes the goods and departs. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56159
  FROM _session252_ja47_lookup sv, _session252_ja47_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=47 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-47-everlasting-inheritance',
       E'Canaan an everlasting inheritance — the deed in the earthen vessel',
       E'Jasher seals the transfer with a written deed: *And Jacob took the book of purchase and the signature, the command and the statutes and the revealed book, and he placed them in an earthen vessel in order that they should remain for a long time, and he delivered them into the hands of his children.* (Jasher 47:29), and the chapter ends — *And the whole land of Canaan became an inheritance to the children of Israel for an everlasting inheritance, and Esau with all his children inherited the mountain of Seir.* (Jasher 47:33). This is the canon''s settled outcome: Esau to Seir — *Thus dwelt Esau in mount Seir: Esau is Edom.* (Genesis 36:8) — the very dwelling Isaac foretold for him — *Behold, thy dwelling shall be the fatness of the earth, and of the dew of heaven from above;* (Genesis 27:39). The New Testament reads it as faith holding an inheritance not yet possessed — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise:* (Hebrews 11:9) — and the apostles trace the kept seed-line — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* (Acts 7:8). The twelve-tribe people forms here; the everlasting inheritance is theirs. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56162
  FROM _session252_ja47_lookup sv, _session252_ja47_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=29
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=47 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-47-isaac-blesses-the-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The star-seed Isaac speaks over Jacob''s sons in Jasher 47:5 is the very oath Yahuah swore to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-blesses-the-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed;* The same promise was renewed to Isaac himself, which is why he can pass the star-blessing to his grandsons in Jasher 47:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-blesses-the-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 36:6 — *Remember you, my sons, Yahuah Elohim (the LORD God) of Abraham your father, and how I too worshipped Him and served Him in righteousness and in joy, that He might multiply you and increase your seed as the stars of heaven in multitude, and establish you on the earth as the plant of righteousness which will not be rooted out to all the generations for ever.* Jubilees keeps the same deathbed scene of Isaac invoking the star-seed that Jasher 47:5 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-blesses-the-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 44:22 — *With Isaac did he establish likewise for Abraham his father’s sake the blessing of all men, and the covenant,* Sirach''s praise of the fathers confirms that the blessing Isaac hands on in Jasher 47:5 was first established with him for Abraham''s sake.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-blesses-the-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-47-teach-your-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Isaac''s charge to teach the children to fear Yahuah in Jasher 47:8 is the Shema''s own command, kept by the fathers before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-teach-your-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:3 — *Sojourn in this land, and I will be with thee, and will bless thee; for unto thee, and unto thy seed, I will give all these countries, and I will perform the oath which I sware unto Abraham thy father;* The land-for-the-seed oath Isaac repeats in Jasher 47:7 is the word Yahuah first spoke directly to him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-teach-your-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 36:3 — *And this I command you, my sons, that you practise righteousness and uprightness on the earth, so that Yahuah (God) may bring upon you all that Yahuah (God) said that he would do to Abraham and to his seed.* Jubilees gives the same dying charge to walk in righteousness so the promise to Abraham''s seed may come, paralleling Jasher 47:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-teach-your-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-47-isaac-dies-machpelah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:29 — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* Jasher 47:9 retells this verse almost verbatim — Isaac gathered to his people, buried by his two sons.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-dies-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:28 — *And the days of Isaac were an hundred and fourscore years.* Genesis records the same one hundred and eighty years that Jasher 47:10 gives for Isaac at his death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-dies-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 23:17 — *And the field of Ephron, which was in Machpelah, which was before Mamre, the field, and the cave which was therein, and all the trees that were in the field, that were in all the borders round about, were made sure* The cave Abraham bought from the children of Heth, where Isaac is buried in Jasher 47:10, is the field of Machpelah secured here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-dies-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 36:18 — *And Isaac slept on his bed that day rejoicing; and he slept the eternal sleep, and died one hundred and eighty years old. He completed twenty-five weeks and five years; and his two sons Esau and Jacob buried him.* Jubilees gives the same death at one hundred and eighty years, buried by Esau and Jacob, that Jasher 47:9 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-dies-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 36:2 — *Wherefore bury me near Abraham my father, in the double cave in the field of Ephron the Hittite, where Abraham purchased a sepulchre to bury in; in the sepulchre which I digged for myself, there bury me.* Isaac''s request to be laid in Abraham''s purchased cave matches the Machpelah burial of Jasher 47:9-10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-isaac-dies-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-47-jacob-takes-the-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The exact boundary Jacob takes for his seed forever in Jasher 47:24 is the covenant land-grant Yahuah cut with Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-jacob-takes-the-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting possession Jacob secures in Jasher 47:24 rests on the everlasting covenant to Abraham''s seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-jacob-takes-the-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:6 — *And Esau took his wives, and his sons, and his daughters, and all the persons of his house, and his cattle, and all his beasts, and all his substance, which he had got in the land of Canaan; and went into the country from the face of his brother Jacob.* Genesis already records Esau taking his goods and departing from Jacob to Seir, just as Jasher 47:31 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-jacob-takes-the-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 36:11 — *I say and testify to you, my sons, according to the judgment which will come upon the man who wishes to injure his brother." And he divided all his possessions between the two on that day, and he gave the larger portion to him that was the first-born, and the tower and all that was about it, and all that Abraham possessed at the Well of the Oath.* Jubilees has Isaac himself divide the estate between the brothers, the same partition Jacob and Esau settle in Jasher 47:15-19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-jacob-takes-the-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-47-everlasting-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Genesis records the same end Jasher 47:33 gives — Esau and his children inheriting the mountain of Seir while Canaan goes to Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-everlasting-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:39 — *And Isaac his father answered and said unto him, Behold, thy dwelling shall be the fatness of the earth, and of the dew of heaven from above;* Esau''s portion away from Canaan in Jasher 47:33 fulfills the very dwelling Isaac had spoken over him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-everlasting-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise:* The everlasting inheritance Jacob secures for Israel in Jasher 47:33 is the land of promise the fathers held by faith as joint heirs.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-everlasting-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen traces the same kept seed-line — Abraham to Isaac to Jacob to the twelve — whose deed Jacob seals for his children in Jasher 47:29.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-everlasting-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 44:23 — *And made it rest upon the head of Jacob. He acknowledged him in his blessing, and gave him an heritage, and divided his portions; among the twelve tribes did he part them.* Sirach sums the very outcome of Jasher 47:33 — the heritage resting on Jacob and parted among the twelve tribes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja47_lookup sv, _session252_ja47_lookup tv
 WHERE t.slug='jasher-47-everlasting-inheritance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=47 AND sv.verse_number=33
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

