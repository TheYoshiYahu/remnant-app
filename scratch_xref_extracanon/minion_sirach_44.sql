-- ----- fragment: minion_ecclesiasticus_44.sql (session253 ecclesiasticus 44) -----
-- Source anchor: apocrypha/ecclesiasticus ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir44 (view _session253_sir44_lookup). Sort band base 59375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-44-praise-famous-men
  ('apocrypha', 'ecclesiasticus', 44, 1, 'canon', 'hebrews', 11, 2, 'free', E'Hebrews 11:2 — *For by it the elders obtained a good report.* Hebrews echoes Sirach 44:1''s call to praise the fathers, naming the same elders as those who obtained the good report by faith.'),
  ('apocrypha', 'ecclesiasticus', 44, 7, 'canon', 'hebrews', 11, 1, 'free', E'Hebrews 11:1 — *Now faith is the substance of things hoped for, the evidence of things not seen.* The faith Hebrews defines is the very glory by which the fathers of Sirach 44:7 were honoured in their generations.'),
  -- thread: sirach-44-seed-within-the-covenant
  ('apocrypha', 'ecclesiasticus', 44, 11, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The children within the covenant of Sirach 44:11 are the seed Yahuah bound to Himself for ever.'),
  ('apocrypha', 'ecclesiasticus', 44, 13, 'canon', 'galatians', 3, 16, 'free', E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The seed that remains for ever in Sirach 44:13 finds its one head in Messiah, in whom the fathers'' glory is not blotted out.'),
  -- thread: sirach-44-enoch-translated
  ('apocrypha', 'ecclesiasticus', 44, 16, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* This is the translation Sirach 44:16 praises — the man who pleased Yahuah and was taken.'),
  ('apocrypha', 'ecclesiasticus', 44, 16, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Hebrews names the same pleasing-and-translating that Sirach 44:16 sets first among the fathers.'),
  ('apocrypha', 'ecclesiasticus', 44, 16, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees self-links the same Enoch of Sirach 44:16, taken away to bear witness to all generations.'),
  -- thread: sirach-44-noah-perfect-everlasting-covenant
  ('apocrypha', 'ecclesiasticus', 44, 17, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* This is the perfect-and-righteous Noah Sirach 44:17 praises as the remnant left to the earth.'),
  ('apocrypha', 'ecclesiasticus', 44, 18, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The everlasting covenant of Sirach 44:18, that flesh should perish no more by flood, is sealed by this bow.'),
  ('apocrypha', 'ecclesiasticus', 44, 17, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* Hebrews makes Noah''s exchange-for-the-world (Sirach 44:17) an act of saving faith.'),
  ('apocrypha', 'ecclesiasticus', 44, 18, 'jubilees', 'jubilees', 6, 16, 'extras', E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees self-links the everlasting covenant Sirach 44:18 names, that all flesh should perish no more by flood.'),
  -- thread: sirach-44-abraham-law-covenant-flesh
  ('apocrypha', 'ecclesiasticus', 44, 20, 'canon', 'genesis', 17, 1, 'free', E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* The walk-before-me-and-be-perfect of this covenant chapter is the law of the Most High Abraham kept in Sirach 44:20.'),
  ('apocrypha', 'ecclesiasticus', 44, 19, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* Hebrews makes the great father of Sirach 44:19 the pattern of obedient, proven faith.'),
  ('apocrypha', 'ecclesiasticus', 44, 20, 'jubilees', 'jubilees', 15, 11, 'extras', E'Jubilees 15:11 — *And Yahuah (God) said to Abraham: "And as for you, do you keep My Covenant, you and your seed after you, and circumcise you every male among you, and circumcise your foreskins, and it will be a token of an eternal covenant between Me and you."* Jubilees self-links the covenant Abraham established in his flesh (Sirach 44:20).'),
  ('apocrypha', 'ecclesiasticus', 44, 20, 'jasher', 'jasher', 13, 4, 'extras', E'Jasher 13:4 — *And now therefore if you will hearken to my voice and keep my commandments, my statutes and my laws, then will I cause your enemies to fall before you, and I will multiply your seed like the stars of heaven, and I will send my blessing upon all the works of your hands, and you shall lack nothing.* Jasher self-links the law-keeping Abraham of Sirach 44:20, joining it to the multiplied seed.'),
  -- thread: sirach-44-abraham-oath-blessing-seed
  ('apocrypha', 'ecclesiasticus', 44, 21, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* this is the very oath of the stars and the sand that Sirach 44:21 recounts.'),
  ('apocrypha', 'ecclesiasticus', 44, 21, 'canon', 'galatians', 3, 8, 'free', E'Galatians 3:8 — *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* Paul names the blessing of the nations in Abraham''s seed that Sirach 44:21 carries.'),
  ('apocrypha', 'ecclesiasticus', 44, 21, 'canon', 'romans', 4, 11, 'free', E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:* Paul makes Abraham, sworn to by oath in Sirach 44:21, the father of all the nations who believe.'),
  -- thread: sirach-44-isaac-jacob-blessing
  ('apocrypha', 'ecclesiasticus', 44, 22, 'canon', 'genesis', 26, 3, 'free', E'Genesis 26:3 — *Sojourn in this land, and I will be with thee, and will bless thee; for unto thee, and unto thy seed, I will give all these countries, and I will perform the oath which I sware unto Abraham thy father;* the blessing established with Isaac in Sirach 44:22 is Yahuah confirming Abraham''s oath.'),
  ('apocrypha', 'ecclesiasticus', 44, 23, 'canon', 'genesis', 28, 13, 'free', E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed;* the blessing resting on the head of Jacob in Sirach 44:23 is the inheritance pledged at Bethel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-praise-famous-men',
       E'Let us now praise famous men — the roll-call of the fathers',
       E'Yeshua ben Sira opens the great hymn of the fathers: *Let us now praise famous men, and our fathers that begat us* (Ecclesiasticus 44:1), *All these were honoured in their generations, and were the glory of their times* (Ecclesiasticus 44:7). This is the forerunner of the cloud of witnesses — the writer to the Hebrews takes up the same roll-call: *Now faith is the substance of things hoped for, the evidence of things not seen* (Hebrews 11:1), *For by it the elders obtained a good report* (Hebrews 11:2). The fathers'' praise is no new thing; the testimony of the elders runs through the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 59375
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-seed-within-the-covenant',
       E'Their seed within the covenant — the everlasting inheritance',
       E'The merciful fathers leave more than a name: *With their seed shall continually remain a good inheritance, and their children are within the covenant* (Ecclesiasticus 44:11), *Their seed shall remain for ever, and their glory shall not be blotted out* (Ecclesiasticus 44:13). This is the covenant kept in the seed — the same everlasting covenant Yahuah swore to Abraham: *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant* (Genesis 17:7). Paul reads that seed as singular and Messianic: *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The children remain within the covenant because the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 59378
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-enoch-translated',
       E'Enoch translated — the example of repentance',
       E'*Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16). The Tanakh records the taking in a single line: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and Hebrews makes the walk a walk of faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). Jubilees tells the same translation, that he was *taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23) — the same Enoch whose own witness, the live apparatus, testifies to all generations.',
       sv.verse_id, ev.verse_id, 'extras', 59381
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-noah-perfect-everlasting-covenant',
       E'Noah found perfect — the everlasting covenant and the remnant',
       E'*Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came. An everlasting covenant was made with him, that all flesh should perish no more by the flood* (Ecclesiasticus 44:17-18). The Tanakh''s witness: *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9), and the token of the covenant, *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13). Hebrews makes him heir of righteousness by faith: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). Jubilees sets the bow in the cloud as the self-same eternal sign: *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth* (Jubilees 6:16).',
       sv.verse_id, ev.verse_id, 'extras', 59384
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-abraham-law-covenant-flesh',
       E'Abraham kept the law — the covenant in his flesh',
       E'*Abraham was a great father of many people: in glory was there none like to him; Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful* (Ecclesiasticus 44:19-20). The covenant in the flesh is circumcision, commanded at the call: *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect* (Genesis 17:1). Hebrews praises the faith of the call: *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). Jubilees gives the very command to circumcise as the token: *And as for you, do you keep My Covenant, you and your seed after you, and circumcise you every male among you, and circumcise your foreskins, and it will be a token of an eternal covenant between Me and you* (Jubilees 15:11). And Jasher binds the law-keeping to the multiplied seed: *And now therefore if you will hearken to my voice and keep my commandments, my statutes and my laws... I will multiply your seed like the stars of heaven* (Jasher 13:4). Abraham kept the law — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59387
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-abraham-oath-blessing-seed',
       E'The oath to Abraham — blessed in his seed, the stars and the dust',
       E'*Therefore he assured him by an oath, that he would bless the nations in his seed, and that he would multiply him as the dust of the earth, and exalt his seed as the stars, and cause them to inherit from sea to sea, and from the river to the utmost part of the land* (Ecclesiasticus 44:21). This is the oath sworn at the binding: *By myself have I sworn, saith Yahuah (LORD)... That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:16-17). Paul names the gospel preached aforehand: *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). And Romans seals the seal in the flesh by faith: *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe* (Romans 4:11). The nations are blessed in the seed.',
       sv.verse_id, ev.verse_id, 'extras', 59390
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-44-isaac-jacob-blessing',
       E'Isaac and Jacob — the blessing resting on the head, the twelve tribes',
       E'The oath passes down the line: *With Isaac did he establish likewise for Abraham his father''s sake the blessing of all men, and the covenant, And made it rest upon the head of Jacob. He acknowledged him in his blessing, and gave him an heritage, and divided his portions; among the twelve tribes did he part them* (Ecclesiasticus 44:22-23). To Isaac the oath was confirmed: *Sojourn in this land, and I will be with thee, and will bless thee; for unto thee, and unto thy seed, I will give all these countries, and I will perform the oath which I sware unto Abraham thy father* (Genesis 26:3). And upon Jacob at Bethel the inheritance rested: *I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13). The blessing of Abraham came down through Isaac to Jacob, and was parted among the twelve tribes — the whole house of Yashar''el.',
       sv.verse_id, ev.verse_id, 'extras', 59393
  FROM _session253_sir44_lookup sv, _session253_sir44_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=44 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-44-praise-famous-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:2 — *For by it the elders obtained a good report.* Hebrews echoes Sirach 44:1''s call to praise the fathers, naming the same elders as those who obtained the good report by faith.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-praise-famous-men'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:1 — *Now faith is the substance of things hoped for, the evidence of things not seen.* The faith Hebrews defines is the very glory by which the fathers of Sirach 44:7 were honoured in their generations.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-praise-famous-men'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-44-seed-within-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The children within the covenant of Sirach 44:11 are the seed Yahuah bound to Himself for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-seed-within-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The seed that remains for ever in Sirach 44:13 finds its one head in Messiah, in whom the fathers'' glory is not blotted out.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-seed-within-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-44-enoch-translated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* This is the translation Sirach 44:16 praises — the man who pleased Yahuah and was taken.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-enoch-translated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Hebrews names the same pleasing-and-translating that Sirach 44:16 sets first among the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-enoch-translated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees self-links the same Enoch of Sirach 44:16, taken away to bear witness to all generations.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-enoch-translated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-44-noah-perfect-everlasting-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* This is the perfect-and-righteous Noah Sirach 44:17 praises as the remnant left to the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-noah-perfect-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The everlasting covenant of Sirach 44:18, that flesh should perish no more by flood, is sealed by this bow.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-noah-perfect-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* Hebrews makes Noah''s exchange-for-the-world (Sirach 44:17) an act of saving faith.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-noah-perfect-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees self-links the everlasting covenant Sirach 44:18 names, that all flesh should perish no more by flood.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-noah-perfect-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-44-abraham-law-covenant-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* The walk-before-me-and-be-perfect of this covenant chapter is the law of the Most High Abraham kept in Sirach 44:20.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-law-covenant-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* Hebrews makes the great father of Sirach 44:19 the pattern of obedient, proven faith.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-law-covenant-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 15:11 — *And Yahuah (God) said to Abraham: "And as for you, do you keep My Covenant, you and your seed after you, and circumcise you every male among you, and circumcise your foreskins, and it will be a token of an eternal covenant between Me and you."* Jubilees self-links the covenant Abraham established in his flesh (Sirach 44:20).'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-law-covenant-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 13:4 — *And now therefore if you will hearken to my voice and keep my commandments, my statutes and my laws, then will I cause your enemies to fall before you, and I will multiply your seed like the stars of heaven, and I will send my blessing upon all the works of your hands, and you shall lack nothing.* Jasher self-links the law-keeping Abraham of Sirach 44:20, joining it to the multiplied seed.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-law-covenant-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=20
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-44-abraham-oath-blessing-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* this is the very oath of the stars and the sand that Sirach 44:21 recounts.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-oath-blessing-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 3:8 — *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* Paul names the blessing of the nations in Abraham''s seed that Sirach 44:21 carries.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-oath-blessing-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:* Paul makes Abraham, sworn to by oath in Sirach 44:21, the father of all the nations who believe.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-abraham-oath-blessing-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-44-isaac-jacob-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:3 — *Sojourn in this land, and I will be with thee, and will bless thee; for unto thee, and unto thy seed, I will give all these countries, and I will perform the oath which I sware unto Abraham thy father;* the blessing established with Isaac in Sirach 44:22 is Yahuah confirming Abraham''s oath.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-isaac-jacob-blessing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed;* the blessing resting on the head of Jacob in Sirach 44:23 is the inheritance pledged at Bethel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir44_lookup sv, _session253_sir44_lookup tv
 WHERE t.slug='sirach-44-isaac-jacob-blessing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=44 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

