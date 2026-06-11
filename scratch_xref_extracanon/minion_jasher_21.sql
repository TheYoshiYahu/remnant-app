-- ----- fragment: minion_jasher_21.sql (session252 jasher 21) -----
-- Source anchor: jasher/jasher ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja21 (view _session252_ja21_lookup). Sort band base 55500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-21-isaac-born-promise
  ('jasher', 'jasher', 21, 1, 'canon', 'genesis', 21, 1, 'free', E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Jasher''s "Elohim visited Sarah, and Yahuah remembered her" retells this same visitation that opens the canon''s account.'),
  ('jasher', 'jasher', 21, 1, 'canon', 'genesis', 21, 2, 'free', E'Genesis 21:2 — *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* The conception Jasher reports is the canon''s "set time" promise kept.'),
  ('jasher', 'jasher', 21, 1, 'canon', 'hebrews', 11, 11, 'free', E'Hebrews 11:11 — *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.* The New Testament names the faith behind the conception Jasher records.'),
  ('jasher', 'jasher', 21, 1, 'jubilees', 'jubilees', 16, 15, 'extras', E'Jubilees 16:15 — *And in the sixth year of the fourth week we came to Abraham, to the Well of the Oath, and we appeared to him as we had told Sarah that we should return to her, and she would have conceived a son.* Jubilees narrates the very visitation Jasher 21:1 retells.'),
  -- thread: jasher-21-circumcision-eighth-day
  ('jasher', 'jasher', 21, 3, 'canon', 'genesis', 21, 4, 'free', E'Genesis 21:4 — *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him.* Jasher''s eight-day circumcision is the canon''s same act of obedience.'),
  ('jasher', 'jasher', 21, 3, 'canon', 'genesis', 17, 11, 'free', E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* The command Jasher says Abraham kept is the token of the covenant given in Genesis.'),
  ('jasher', 'jasher', 21, 3, 'canon', 'genesis', 17, 19, 'free', E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* The covenant sealed in Isaac''s flesh is the everlasting covenant Jasher 21:3 carries.'),
  ('jasher', 'jasher', 21, 3, 'jubilees', 'jubilees', 16, 14, 'extras', E'Jubilees 16:14 — *And Abraham circumcised his son on the eighth day: he was the first that was circumcised according to the covenant which is ordained for ever.* Jubilees marks the same eighth-day sign as the covenant ordained forever.'),
  -- thread: jasher-21-great-feast-weaned
  ('jasher', 'jasher', 21, 4, 'canon', 'genesis', 21, 8, 'free', E'Genesis 21:8 — *And the child grew, and was weaned: and Abraham made a great feast the same day that Isaac was weaned.* Jasher 21:4 retells the canon''s great weaning feast verbatim in substance.'),
  ('jasher', 'jasher', 21, 4, 'jubilees', 'jubilees', 17, 1, 'extras', E'Jubilees 17:1 — *And in the first year of the fifth week Isaac was weaned in this jubilee, and Abraham made a great banquet in the third month, on the day his son Isaac was weaned.* Jubilees dates the same banquet Jasher describes.'),
  ('jasher', 'jasher', 21, 6, 'jubilees', 'jubilees', 17, 2, 'extras', E'Jubilees 17:2 — *And Ishmael, the son of Hagar, the Egyptian, was before the face of Abraham, his father, in his place, and Abraham rejoiced and blessed Elohim (God) because he had seen his sons.* The same gathered rejoicing Jasher 21:6 reports of Terah and Nahor coming up to the feast.'),
  -- thread: jasher-21-cast-out-bondwoman
  ('jasher', 'jasher', 21, 15, 'canon', 'genesis', 21, 10, 'free', E'Genesis 21:10 — *Wherefore she said unto Abraham, Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac.* Jasher 21:15 retells Sarah''s demand almost word for word.'),
  ('jasher', 'jasher', 21, 15, 'canon', 'genesis', 21, 12, 'free', E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* The canon grounds the casting-out Jasher reports in the election of Isaac''s line.'),
  ('jasher', 'jasher', 21, 15, 'canon', 'galatians', 4, 22, 'free', E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul reads the two sons of Jasher 21:15 as the figure of the flesh and the promise.'),
  ('jasher', 'jasher', 21, 15, 'canon', 'galatians', 4, 24, 'free', E'Galatians 4:24 — *Which things are an allegory: for these are the two covenants; the one from the mount Sinai, which gendereth to bondage, which is Agar.* The bondwoman Jasher names becomes Paul''s figure of the two covenants.'),
  ('jasher', 'jasher', 21, 16, 'jubilees', 'jubilees', 17, 4, 'extras', E'Jubilees 17:4 — *And Sarah saw Ishmael playing and dancing and Abraham rejoicing with great joy, and she became jealous of Ishmael and said to Abraham, "Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac."* Jubilees narrates the same expulsion Jasher 21:16 records.'),
  -- thread: jasher-21-ishmael-archer-nation
  ('jasher', 'jasher', 21, 12, 'canon', 'genesis', 21, 20, 'free', E'Genesis 21:20 — *And Elohim (God) was with the lad; and he grew, and dwelt in the wilderness, and became an archer.* Jasher 21:12 carries the same word that Elohim was with Ishmael the archer.'),
  ('jasher', 'jasher', 21, 12, 'canon', 'genesis', 16, 11, 'free', E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* The name Jasher uses was given at the well for the affliction Yahuah heard.'),
  ('jasher', 'jasher', 21, 20, 'canon', 'genesis', 17, 20, 'free', E'Genesis 17:20 — *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation.* The increase Jasher 21:20 reports is the canon''s blessing on Ishmael for Abraham''s sake.'),
  ('jasher', 'jasher', 21, 20, 'canon', 'genesis', 25, 16, 'free', E'Genesis 25:16 — *These are the sons of Ishmael, and these are their names, by their towns, and by their castles; twelve princes according to their nations.* The flocks and increase of Jasher 21:20 ripen into the twelve princes of the canon''s record.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-21-isaac-born-promise',
       E'Yahuah visited Sarah — the son of promise is born',
       E'Jasher opens the long-promised birth: *And it was at that time at the end of a year and four months of Abraham''s dwelling in the land of the Philistines in Gerar, that Elohim (God) visited Sarah, and Yahuah (the Lord) remembered her, and she conceived and bare a son to Abraham* (Jasher 21:1), *And Abraham called the name of the son which was born to him, which Sarah bare to him, Isaac* (Jasher 21:2). It ain''t new — Genesis carries the same scene word for word, *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken* (Genesis 21:1), and the seed comes at the set time, *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:2). The New Testament reads this as the faith of the freewoman, *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). Jubilees records the same visitation and conception, *And in the sixth year of the fourth week we came to Abraham, to the Well of the Oath, and we appeared to him as we had told Sarah that we should return to her, and she would have conceived a son* (Jubilees 16:15) — the election of the chosen seed kept, not a new thing.',
       sv.verse_id, ev.verse_id, 'extras', 55500
  FROM _session252_ja21_lookup sv, _session252_ja21_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=21 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-21-circumcision-eighth-day',
       E'Circumcised at eight days — the token of the everlasting covenant',
       E'Jasher keeps the sign exactly: *And Abraham circumcised his son Isaac at eight days old, as Elohim had commanded Abraham to do to his seed after him; and Abraham was one hundred, and Sarah ninety years old, when Isaac was born to them* (Jasher 21:3). Genesis records the same obedience, *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him* (Genesis 21:4), and the original command made it the token of the covenant, *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you* (Genesis 17:11) — covenant with Isaac established forever, *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him* (Genesis 17:19). Torah stands before Sinai: Jubilees marks Abraham the first to keep the eternal sign, *And Abraham circumcised his son on the eighth day: he was the first that was circumcised according to the covenant which is ordained for ever* (Jubilees 16:14). It ain''t new — the eighth-day sign is the patriarchs'' own way.',
       sv.verse_id, ev.verse_id, 'extras', 55503
  FROM _session252_ja21_lookup sv, _session252_ja21_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=21 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-21-great-feast-weaned',
       E'The great feast when Isaac was weaned',
       E'Jasher tells of the celebration: *And the child grew up and he was weaned, and Abraham made a great feast upon the day that Isaac was weaned* (Jasher 21:4), and Shem, Eber, Abimelech, and even *Terah, the father of Abraham, and Nahor his brother, came from Haran* (Jasher 21:6) to rejoice. The canon records the same feast, *And the child grew, and was weaned: and Abraham made a great feast the same day that Isaac was weaned* (Genesis 21:8). Jubilees, narrating the SAME event, dates and names it, *And in the first year of the fifth week Isaac was weaned in this jubilee, and Abraham made a great banquet in the third month, on the day his son Isaac was weaned* (Jubilees 17:1), and shows Abraham keeping the way in joyful thanks, *And Ishmael, the son of Hagar, the Egyptian, was before the face of Abraham, his father, in his place, and Abraham rejoiced and blessed Elohim (God) because he had seen his sons* (Jubilees 17:2). The fathers feasted before Yahuah — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55506
  FROM _session252_ja21_lookup sv, _session252_ja21_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-21-cast-out-bondwoman',
       E'Cast out the bondwoman — the son of the flesh and the son of promise',
       E'Jasher gives the sharpest scene of the chapter: Ishmael takes the bow against Isaac, *and intended to slay Isaac* (Jasher 21:14), and Sarah demands, *Cast out this bondwoman and her son, for her son shall not be heir with my son, for thus did he seek to do to him this day* (Jasher 21:15), and *Abraham hearkened to the voice of Sarah, and he rose up early in the morning, and he took twelve loaves and a bottle of water which he gave to Hagar, and sent her away with her son* (Jasher 21:16). Genesis carries it whole, *Wherefore she said unto Abraham, Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac* (Genesis 21:10), and grounds the election, *for in Isaac shall thy seed be called* (Genesis 21:12). Paul reads the two sons as the two covenants — the son of the flesh vs the son of promise, *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman* (Galatians 4:22), *Which things are an allegory: for these are the two covenants; the one from the mount Sinai, which gendereth to bondage, which is Agar* (Galatians 4:24), and Romans seals the line of election, *Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called* (Romans 9:7). Jubilees tells the same expulsion, *And Sarah saw Ishmael playing and dancing and Abraham rejoicing with great joy, and she became jealous of Ishmael and said to Abraham, "Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac."* (Jubilees 17:4). It ain''t new — the chosen seed is kept; election precedes confession.',
       sv.verse_id, ev.verse_id, 'extras', 55509
  FROM _session252_ja21_lookup sv, _session252_ja21_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=21 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-21-ishmael-archer-nation',
       E'Ishmael the archer in the wilderness — a great nation of the seed',
       E'Jasher follows Ishmael into the desert: *And Elohim was with Ishmael the son of Abraham, and he grew up, and he learned to use the bow and became an archer* (Jasher 21:12), and *Hagar went with her son to the wilderness, and they dwelt in the wilderness of Paran* (Jasher 21:16), where *Elohim gave Ishmael flocks and herds and tents on account of Abraham his father* (Jasher 21:20). Genesis records the same growth, *And Elohim (God) was with the lad; and he grew, and dwelt in the wilderness, and became an archer* (Genesis 21:20). The naming and the promise stand from the well: *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction* (Genesis 16:11), and the blessing on him as Abraham''s seed, *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation* (Genesis 17:20) — fulfilled in the twelve sons, *These are the sons of Ishmael, and these are their names, by their towns, and by their castles; twelve princes according to their nations* (Genesis 25:16). Not the chosen seed, yet kept for Abraham''s sake — Jasher''s Ishmael is the canon''s Ishmael.',
       sv.verse_id, ev.verse_id, 'extras', 55512
  FROM _session252_ja21_lookup sv, _session252_ja21_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=21 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-21-isaac-born-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Jasher''s "Elohim visited Sarah, and Yahuah remembered her" retells this same visitation that opens the canon''s account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-isaac-born-promise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:2 — *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* The conception Jasher reports is the canon''s "set time" promise kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-isaac-born-promise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:11 — *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.* The New Testament names the faith behind the conception Jasher records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-isaac-born-promise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:15 — *And in the sixth year of the fourth week we came to Abraham, to the Well of the Oath, and we appeared to him as we had told Sarah that we should return to her, and she would have conceived a son.* Jubilees narrates the very visitation Jasher 21:1 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-isaac-born-promise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-21-circumcision-eighth-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:4 — *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him.* Jasher''s eight-day circumcision is the canon''s same act of obedience.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-circumcision-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* The command Jasher says Abraham kept is the token of the covenant given in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-circumcision-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* The covenant sealed in Isaac''s flesh is the everlasting covenant Jasher 21:3 carries.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-circumcision-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:14 — *And Abraham circumcised his son on the eighth day: he was the first that was circumcised according to the covenant which is ordained for ever.* Jubilees marks the same eighth-day sign as the covenant ordained forever.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-circumcision-eighth-day'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-21-great-feast-weaned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:8 — *And the child grew, and was weaned: and Abraham made a great feast the same day that Isaac was weaned.* Jasher 21:4 retells the canon''s great weaning feast verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-great-feast-weaned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 17:1 — *And in the first year of the fifth week Isaac was weaned in this jubilee, and Abraham made a great banquet in the third month, on the day his son Isaac was weaned.* Jubilees dates the same banquet Jasher describes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-great-feast-weaned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 17:2 — *And Ishmael, the son of Hagar, the Egyptian, was before the face of Abraham, his father, in his place, and Abraham rejoiced and blessed Elohim (God) because he had seen his sons.* The same gathered rejoicing Jasher 21:6 reports of Terah and Nahor coming up to the feast.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-great-feast-weaned'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=17 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-21-cast-out-bondwoman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:10 — *Wherefore she said unto Abraham, Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac.* Jasher 21:15 retells Sarah''s demand almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-cast-out-bondwoman'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* The canon grounds the casting-out Jasher reports in the election of Isaac''s line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-cast-out-bondwoman'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul reads the two sons of Jasher 21:15 as the figure of the flesh and the promise.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-cast-out-bondwoman'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 4:24 — *Which things are an allegory: for these are the two covenants; the one from the mount Sinai, which gendereth to bondage, which is Agar.* The bondwoman Jasher names becomes Paul''s figure of the two covenants.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-cast-out-bondwoman'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 17:4 — *And Sarah saw Ishmael playing and dancing and Abraham rejoicing with great joy, and she became jealous of Ishmael and said to Abraham, "Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac."* Jubilees narrates the same expulsion Jasher 21:16 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-cast-out-bondwoman'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=17 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-21-ishmael-archer-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:20 — *And Elohim (God) was with the lad; and he grew, and dwelt in the wilderness, and became an archer.* Jasher 21:12 carries the same word that Elohim was with Ishmael the archer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-ishmael-archer-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* The name Jasher uses was given at the well for the affliction Yahuah heard.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-ishmael-archer-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:20 — *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation.* The increase Jasher 21:20 reports is the canon''s blessing on Ishmael for Abraham''s sake.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-ishmael-archer-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 25:16 — *These are the sons of Ishmael, and these are their names, by their towns, and by their castles; twelve princes according to their nations.* The flocks and increase of Jasher 21:20 ripen into the twelve princes of the canon''s record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja21_lookup sv, _session252_ja21_lookup tv
 WHERE t.slug='jasher-21-ishmael-archer-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=21 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

