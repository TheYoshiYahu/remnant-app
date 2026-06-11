-- ----- fragment: minion_jasher_17.sql (session252 jasher 17) -----
-- Source anchor: jasher/jasher ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja17 (view _session252_ja17_lookup). Sort band base 55400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-17-chittim-tubal-japheth
  ('jasher', 'jasher', 17, 1, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* Tubal, whose children Jasher 17:1 sets at war, is named here among the sons of Japheth.'),
  ('jasher', 'jasher', 17, 1, 'canon', 'genesis', 10, 4, 'free', E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* Chittim of Jasher 17:1 is the Kittim of Javan''s line, fixing the war among the canon''s named nations.'),
  ('jasher', 'jasher', 17, 1, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Jasher 17:1 says Yahuah scattered the sons of men so Chittim built cities by the Tibreu — the canon''s dividing of the isles told as story.'),
  -- thread: jasher-17-covenant-circumcision
  ('jasher', 'jasher', 17, 16, 'canon', 'genesis', 17, 1, 'free', E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* The same age and the same appearing that Jasher 17:16 records for the covenant.'),
  ('jasher', 'jasher', 17, 17, 'canon', 'genesis', 17, 10, 'free', E'Genesis 17:10 — *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* The very covenant of the flesh Jasher 17:17 sets between Yahuah and Abram and his seed.'),
  ('jasher', 'jasher', 17, 18, 'canon', 'genesis', 17, 12, 'free', E'Genesis 17:12 — *And he that is eight days old shall be circumcised among you, every man child in your generations, he that is born in the house, or bought with money of any stranger, which is not of thy seed.* The eighth-day command of Jasher 17:18, named to the day.'),
  ('jasher', 'jasher', 17, 18, 'canon', 'genesis', 17, 13, 'free', E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jasher 17:18''s everlasting covenant in the flesh, verbatim.'),
  ('jasher', 'jasher', 17, 18, 'jubilees', 'jubilees', 15, 12, 'extras', E'Jubilees 15:12 — *And the child on the eighth day you will circumcise, every male throughout your generations, him that is born in the house, or whom you have bought with money from any stranger, whom you have acquired who is not of your seed.* Jubilees holds the same eighth-day ordinance Jasher 17:18 carries.'),
  -- thread: jasher-17-eternal-sign-keep
  ('jasher', 'jasher', 17, 18, 'canon', 'genesis', 17, 11, 'free', E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* The token in the flesh Jasher 17:18 makes an everlasting covenant.'),
  ('jasher', 'jasher', 17, 18, 'canon', 'romans', 4, 11, 'free', E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:* Paul reads the sign of Jasher 17:18 as the seal of Abraham''s already-counted faith.'),
  ('jasher', 'jasher', 17, 18, 'canon', 'acts', 7, 8, 'free', E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen traces the everlasting sign of Jasher 17:18 down the seed-line to the twelve tribes.'),
  ('jasher', 'jasher', 17, 18, 'jubilees', 'jubilees', 15, 28, 'extras', E'Jubilees 15:28 — *And do you command the children of Yashar''el (Israel) and let them observe the sign of this covenant for their generations as an eternal ordinance, and they will not be rooted out of the land. For the command is ordained for a covenant, that they should observe it for ever among all the children of Yashar''el (Israel).* Jubilees binds the eternal sign of Jasher 17:18 on all Israel forever.'),
  -- thread: jasher-17-new-names-abraham-sarah
  ('jasher', 'jasher', 17, 19, 'canon', 'genesis', 17, 5, 'free', E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* The renaming of Abram to Abraham that Jasher 17:19 records.'),
  ('jasher', 'jasher', 17, 19, 'canon', 'genesis', 17, 15, 'free', E'Genesis 17:15 — *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be.* The renaming of Sarai to Sarah that Jasher 17:19 sets beside Abraham''s.'),
  -- thread: jasher-17-multiply-seed-nations-kings
  ('jasher', 'jasher', 17, 20, 'canon', 'genesis', 17, 2, 'free', E'Genesis 17:2 — *And I will make my covenant between me and thee, and will multiply thee exceedingly.* The multiplied seed Jasher 17:20 promises Abraham.'),
  ('jasher', 'jasher', 17, 20, 'canon', 'genesis', 17, 6, 'free', E'Genesis 17:6 — *And I will make thee exceeding fruitful, and I will make nations of thee, and kings shall come out of thee.* The great nation and the kings of Jasher 17:20, word for word.'),
  ('jasher', 'jasher', 17, 20, 'canon', 'galatians', 3, 29, 'free', E'Galatians 3:29 — *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise.* The seed and the promise of Jasher 17:20 named as the inheritance of those who are Messiah''s.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-17-chittim-tubal-japheth',
       E'Chittim and Tubal — the sons of Japheth in the isles',
       E'Jasher opens with the nations dividing: *And in those days, in the ninety-first year of the life of Abram, the children of Chittim made war with the children of Tubal, for when Yahuah (the Lord) had scattered the sons of men upon the face of the earth, the children of Chittim went and embodied themselves in the plain of Canopia, and they built themselves cities there and dwelt by the river Tibreu* (Jasher 17:1). These are not invented peoples — they are the very sons of Japheth named in the Table of Nations: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2), and Chittim/Kittim from Javan''s line: *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim* (Genesis 10:4). Jasher shows what the canon names in a breath — the scattering after Babel filling the coastlands: *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). It ain''t new — the legendary war of Chittim and Tubal is the canon''s own division of the nations unfolded in story.',
       sv.verse_id, ev.verse_id, 'extras', 55400
  FROM _session252_ja17_lookup sv, _session252_ja17_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=17 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-17-covenant-circumcision',
       E'The everlasting covenant — every male circumcised',
       E'At ninety-nine the call turns to the sign in the flesh: *And Abram the son of Terah was then ninety-nine years old. At that time Yahuah (the Lord) appeared to him and he said to him, I will make my covenant between me and you, and I will greatly multiply your seed, and this is the covenant which I make between me and you, that every male child be circumcised, you and your seed after you* (Jasher 17:16-17), *At eight days old shall it be circumcised, and this covenant shall be in your flesh for an everlasting covenant* (Jasher 17:18). This is Genesis 17 word for word: *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram* (Genesis 17:1); *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised* (Genesis 17:10); *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant* (Genesis 17:13). The same ordinance stands in Jubilees: *And the child on the eighth day you will circumcise, every male throughout your generations* (Jubilees 15:12), an eternal sign commanded to keep — *And do you command the children of Yashar''el (Israel) and let them observe the sign of this covenant for their generations as an eternal ordinance* (Jubilees 15:28). Torah before Sinai; the sign is eternal — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55403
  FROM _session252_ja17_lookup sv, _session252_ja17_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=17 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-17-eternal-sign-keep',
       E'The sign in the flesh — an everlasting ordinance to keep',
       E'Jasher binds the covenant to the body forever: *At eight days old shall it be circumcised, and this covenant shall be in your flesh for an everlasting covenant* (Jasher 17:18). Genesis presses that this sign is to be kept and not broken: *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you* (Genesis 17:11). Paul reads this sign as the seal of faith already counted righteous: *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe* (Romans 4:11), and Stephen recounts it as the hinge of the seed-line: *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs* (Acts 7:8). Jubilees calls it eternal and binding on all Israel: *And do you command the children of Yashar''el (Israel) and let them observe the sign of this covenant for their generations as an eternal ordinance, and they will not be rooted out of the land* (Jubilees 15:28). The everlasting sign of Jasher 17:18 runs straight to the twelve tribes.',
       sv.verse_id, ev.verse_id, 'extras', 55406
  FROM _session252_ja17_lookup sv, _session252_ja17_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=17 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-17-new-names-abraham-sarah',
       E'New names — Abraham and Sarah, the renamed seed',
       E'The covenant remakes their names: *And now therefore your name shall no more be called Abram but Abraham, and your wife shall no more be called Sarai but Sarah* (Jasher 17:19). Genesis gives both renamings — the man: *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee* (Genesis 17:5); and the wife: *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be* (Genesis 17:15). Jasher 17:19 sets the two renamings side by side exactly as the canon does — the chosen seed marked by a new name.',
       sv.verse_id, ev.verse_id, 'extras', 55409
  FROM _session252_ja17_lookup sv, _session252_ja17_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=17 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-17-multiply-seed-nations-kings',
       E'A great nation, and kings from his seed',
       E'The promise widens to a multiplied seed: *For I will bless you both, and I will multiply your seed after you that you shall become a great nation, and kings shall come forth from you* (Jasher 17:20). Genesis grounds it in the same covenant words: *And I will make my covenant between me and thee, and will multiply thee exceedingly* (Genesis 17:2); *And I will make thee exceeding fruitful, and I will make nations of thee, and kings shall come out of thee* (Genesis 17:6). The NT reads the blessed multiplied seed as belonging to those of faith: *Know ye therefore that they which are of faith, the same are the children of Abraham* (Galatians 3:7), *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29). The great nation and the kings of Jasher 17:20 are the canon''s own promise, carried to the heirs of the seed.',
       sv.verse_id, ev.verse_id, 'extras', 55412
  FROM _session252_ja17_lookup sv, _session252_ja17_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=17 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-17-chittim-tubal-japheth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* Tubal, whose children Jasher 17:1 sets at war, is named here among the sons of Japheth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-chittim-tubal-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* Chittim of Jasher 17:1 is the Kittim of Javan''s line, fixing the war among the canon''s named nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-chittim-tubal-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Jasher 17:1 says Yahuah scattered the sons of men so Chittim built cities by the Tibreu — the canon''s dividing of the isles told as story.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-chittim-tubal-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-17-covenant-circumcision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* The same age and the same appearing that Jasher 17:16 records for the covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-covenant-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:10 — *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* The very covenant of the flesh Jasher 17:17 sets between Yahuah and Abram and his seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-covenant-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:12 — *And he that is eight days old shall be circumcised among you, every man child in your generations, he that is born in the house, or bought with money of any stranger, which is not of thy seed.* The eighth-day command of Jasher 17:18, named to the day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-covenant-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jasher 17:18''s everlasting covenant in the flesh, verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-covenant-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 15:12 — *And the child on the eighth day you will circumcise, every male throughout your generations, him that is born in the house, or whom you have bought with money from any stranger, whom you have acquired who is not of your seed.* Jubilees holds the same eighth-day ordinance Jasher 17:18 carries.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-covenant-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=15 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-17-eternal-sign-keep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* The token in the flesh Jasher 17:18 makes an everlasting covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-eternal-sign-keep'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:* Paul reads the sign of Jasher 17:18 as the seal of Abraham''s already-counted faith.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-eternal-sign-keep'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen traces the everlasting sign of Jasher 17:18 down the seed-line to the twelve tribes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-eternal-sign-keep'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 15:28 — *And do you command the children of Yashar''el (Israel) and let them observe the sign of this covenant for their generations as an eternal ordinance, and they will not be rooted out of the land. For the command is ordained for a covenant, that they should observe it for ever among all the children of Yashar''el (Israel).* Jubilees binds the eternal sign of Jasher 17:18 on all Israel forever.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-eternal-sign-keep'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=15 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-17-new-names-abraham-sarah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* The renaming of Abram to Abraham that Jasher 17:19 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-new-names-abraham-sarah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:15 — *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be.* The renaming of Sarai to Sarah that Jasher 17:19 sets beside Abraham''s.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-new-names-abraham-sarah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-17-multiply-seed-nations-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:2 — *And I will make my covenant between me and thee, and will multiply thee exceedingly.* The multiplied seed Jasher 17:20 promises Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-multiply-seed-nations-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:6 — *And I will make thee exceeding fruitful, and I will make nations of thee, and kings shall come out of thee.* The great nation and the kings of Jasher 17:20, word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-multiply-seed-nations-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 3:29 — *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise.* The seed and the promise of Jasher 17:20 named as the inheritance of those who are Messiah''s.'
  FROM cross_reference_threads t, cross_references x, _session252_ja17_lookup sv, _session252_ja17_lookup tv
 WHERE t.slug='jasher-17-multiply-seed-nations-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

