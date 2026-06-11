-- ----- fragment: minion_jasher_29.sql (session252 jasher 29) -----
-- Source anchor: jasher/jasher ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja29 (view _session252_ja29_lookup). Sort band base 55700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-29-stolen-blessing
  ('jasher', 'jasher', 29, 7, 'canon', 'genesis', 27, 19, 'free', E'Genesis 27:19 — *And Jacob said unto his father, I am Esau thy firstborn; I have done according as thou badest me: arise, I pray thee, sit and eat of my venison, that thy soul may bless me.* The Genesis source of Jacob''s claim to the blessing that Jasher 29:7 retells.'),
  ('jasher', 'jasher', 29, 6, 'canon', 'genesis', 27, 17, 'free', E'Genesis 27:17 — *And she gave the savoury meat and the bread, which she had prepared, into the hand of her son Jacob.* Rebecca''s hand in the savory meat, the same dish Jacob carries to Isaac in Jasher 29:6.'),
  ('jasher', 'jasher', 29, 7, 'jubilees', 'jubilees', 26, 13, 'extras', E'Jubilees 26:13 — *And Jacob went in to his father and said: “I am your son: I have done according as you bade me: arise and sit and eat of that which I have caught, father, that your soul may bless me.”* The Jubilees telling of the same scene, the third witness to Jasher 29:7.'),
  -- thread: jasher-29-despised-birthright-election
  ('jasher', 'jasher', 29, 10, 'canon', 'genesis', 27, 36, 'free', E'Genesis 27:36 — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing. And he said, Hast thou not reserved a blessing for me?* The Genesis source of Esau''s "supplanted me twice" cry in Jasher 29:10.'),
  ('jasher', 'jasher', 29, 10, 'canon', 'genesis', 25, 34, 'free', E'Genesis 25:34 — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* The first of the two supplantings Jasher 29:10 names — Esau himself despised the birthright.'),
  ('jasher', 'jasher', 29, 10, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The apostle''s verdict on the profane Esau whose loss Jasher 29:10 records.'),
  ('jasher', 'jasher', 29, 10, 'canon', 'romans', 9, 13, 'free', E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* The election standing behind the blessing Jacob takes in Jasher 29:10 — the seed-line chosen, not earned.'),
  -- thread: jasher-29-jacob-flees-keeps-the-way
  ('jasher', 'jasher', 29, 11, 'canon', 'genesis', 27, 43, 'free', E'Genesis 27:43 — *Now therefore, my son, obey my voice; and arise, flee thou to Laban my brother to Haran;* Rebekah''s command that drives Jacob''s flight in Jasher 29:11 and 29:23.'),
  ('jasher', 'jasher', 29, 23, 'jubilees', 'jubilees', 27, 3, 'extras', E'Jubilees 27:3 — *Now, therefore, my son, obey my voice, and arise and flee you to Laban, my brother, to Haran, and tarry with him a few days until your brother’s anger turns away, and he remove his anger from you, and forget all that you have done; then I will send and fetch you from thence.* The Jubilees telling of Rebecca''s same charge to flee to Haran, paralleling Jasher 29:23.'),
  -- thread: jasher-29-isaac-charge-abrahamic-blessing
  ('jasher', 'jasher', 29, 24, 'canon', 'genesis', 28, 1, 'free', E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* The Genesis charge that Jasher 29:24 retells as Isaac sends Jacob to Haran.'),
  ('jasher', 'jasher', 29, 29, 'canon', 'genesis', 28, 3, 'free', E'Genesis 28:3 — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people;* The El Shaddai blessing of fruitfulness that Jasher 29:29 carries word for word.'),
  ('jasher', 'jasher', 29, 29, 'canon', 'genesis', 28, 4, 'free', E'Genesis 28:4 — *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham.* The blessing of Abraham passing to Jacob and his seed, the same words as Jasher 29:29.'),
  ('jasher', 'jasher', 29, 29, 'jubilees', 'jubilees', 27, 11, 'extras', E'Jubilees 27:11 — *And El Shaddai (God Almighty) bless you and increase and multiply you that you may become a company of nations, and give you the blessings of my father Abraham, to you and to your seed after you, that you may inherit the land of your sojournings and all the land which Elohim (God) gave to Abraham: go, my son, in peace.* The Jubilees telling of the same Abrahamic blessing Isaac gives in Jasher 29:29.'),
  -- thread: jasher-29-esau-wives-ishmael-dies
  ('jasher', 'jasher', 29, 17, 'canon', 'genesis', 26, 34, 'free', E'Genesis 26:34 — *And Esau was forty years old when he took to wife Judith the daughter of Beeri the Hittite, and Bashemath the daughter of Elon the Hittite:* The Genesis record of Esau''s Hittite marriages that grieved Isaac, the same daughters-of-Heth Jasher 29:14-17 names.'),
  ('jasher', 'jasher', 29, 18, 'canon', 'genesis', 25, 17, 'free', E'Genesis 25:17 — *And these are the years of the life of Ishmael, an hundred and thirty and seven years: and he gave up the ghost and died; and was gathered unto his people.* The Genesis notice of Ishmael''s death at 137 years, the very figure Jasher 29:18 records.'),
  ('jasher', 'jasher', 29, 18, 'canon', 'genesis', 17, 20, 'free', E'Genesis 17:20 — *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation.* Ishmael, whose death Jasher 29:18 records, was himself kept under Abraham''s blessing — the seed-line''s wider mercy.'),
  -- thread: jasher-29-eliphaz-robs-jacob
  ('jasher', 'jasher', 29, 38, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Yahuah''s keeping of Jacob "in all places" is exactly the favor that spares him from Eliphaz''s sword in Jasher 29:38.'),
  ('jasher', 'jasher', 29, 43, 'canon', 'genesis', 28, 9, 'free', E'Genesis 28:9 — *Then went Esau unto Ishmael, and took unto the wives which he had Mahalath the daughter of Ishmael Abraham’s son, the sister of Nebajoth, to be his wife.* The Genesis source of Esau''s marriage to Machlath the daughter of Ishmael that closes Jasher 29:43.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-29-stolen-blessing',
       E'Isaac blesses Jacob — the savory meat and the kids of the goats',
       E'*And Isaac said to Jacob, Who are you, my son? And he said, I am your first born Esau, I have done as you did order me, now therefore rise up I pray you, and eat of my hunt, in order that your soul may bless me as you did speak to me* (Jasher 29:7). Jasher is retelling Genesis 28''s prelude word for word: *And Jacob said unto his father, I am Esau thy firstborn; I have done according as thou badest me: arise, I pray thee, sit and eat of my venison, that thy soul may bless me* (Genesis 27:19), with Rebecca dressing him in the savory meat she prepared — *And he gave the savoury meat and the bread, which she had prepared, into the hand of her son Jacob* (Genesis 27:17). And Jubilees carries the very same scene: *And Jacob went in to his father and said: "I am your son: I have done according as you bade me: arise and sit and eat of that which I have caught, father, that your soul may bless me."* (Jubilees 26:13). It ain''t new — three witnesses to the one blessing passing to the chosen son.',
       sv.verse_id, ev.verse_id, 'extras', 55700
  FROM _session252_ja29_lookup sv, _session252_ja29_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=29 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-29-despised-birthright-election',
       E'He supplanted me twice — the despised birthright and the election',
       E'*And Esau said, Is he not rightly called Jacob? for he has supplanted me twice, he took away my birthright and now he has taken away my blessing; and Esau wept greatly* (Jasher 29:10). Genesis frames Esau''s own words the same way: *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing* (Genesis 27:36). But the birthright was Esau''s own to throw away — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright* (Genesis 25:34), and the apostle names the man: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). The deeper word is election — the line was chosen before either son could earn it: *As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). Election precedes confession; the covenant seed is kept and chosen, not won.',
       sv.verse_id, ev.verse_id, 'extras', 55703
  FROM _session252_ja29_lookup sv, _session252_ja29_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=29 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-29-jacob-flees-keeps-the-way',
       E'Jacob flees to Eber''s house and learns the ways of Yahuah',
       E'*And Jacob was very much afraid of his brother Esau, and he rose up and fled to the house of Eber the son of Shem, and he concealed himself there on account of his brother... and he there continued to learn the ways of Yahuah (the Lord) and his commandments* (Jasher 29:11). Genesis sends him on the same flight at his mother''s word: *Now therefore, my son, obey my voice; and arise, flee thou to Laban my brother to Haran* (Genesis 27:43). Jubilees records Rebecca''s same charge: *Now, therefore, my son, obey my voice, and arise and flee you to Laban, my brother, to Haran, and tarry with him a few days until your brother’s anger turns away* (Jubilees 27:3). Jasher''s added detail — fourteen years hidden in Eber''s house "learning the ways of Yahuah and his commandments" — is Torah-before-Sinai: the chosen seed keeping the way of the fathers. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55706
  FROM _session252_ja29_lookup sv, _session252_ja29_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=29 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-29-isaac-charge-abrahamic-blessing',
       E'Take no wife of Canaan — the blessing of Abraham and El Shaddai',
       E'*And may the El Shaddai (Almighty God) grant you favor in the sight of the people of the earth... And may Elohim (God) give to you and your seed the blessing of your father Abraham, and make you fruitful and multiply you, and may you become a multitude of people in the land whither you go* (Jasher 29:28-29). This is Genesis 28''s charge nearly word for word: *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people; And give thee the blessing of Abraham, to thee, and to thy seed with thee* (Genesis 28:3-4), preceded by the command *Thou shalt not take a wife of the daughters of Canaan* (Genesis 28:1). Jubilees seals the same blessing: *And El Shaddai (God Almighty) bless you and increase and multiply you that you may become a company of nations, and give you the blessings of my father Abraham, to you and to your seed after you* (Jubilees 27:11). The Abrahamic covenant — the land, the seed, the multitude — passes intact to Jacob. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55709
  FROM _session252_ja29_lookup sv, _session252_ja29_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=29 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-29-esau-wives-ishmael-dies',
       E'Esau''s Hittite wives and the death of Ishmael',
       E'*And the wives of Esau vexed and provoked Isaac and Rebecca with their works, for they walked not in the ways of Yahuah (the Lord), but served their father’s gods of wood and stone* (Jasher 29:14). Genesis already marked Esau''s foreign marriages as a grief: *And Esau was forty years old when he took to wife Judith the daughter of Beeri the Hittite, and Bashemath the daughter of Elon the Hittite* (Genesis 26:34). In the same span Jasher records Ishmael''s death — *And Ishmael the son of Abraham died in those days, in the sixty-forth year of the life of Jacob, and all the days that Ishmael lived were one hundred and thirty-seven years* (Jasher 29:18) — exactly Genesis: *And these are the years of the life of Ishmael, an hundred and thirty and seven years: and he gave up the ghost and died; and was gathered unto his people* (Genesis 25:17). Even Ishmael''s line was kept under blessing: *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation* (Genesis 17:20). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55712
  FROM _session252_ja29_lookup sv, _session252_ja29_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=29 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-29-eliphaz-robs-jacob',
       E'Eliphaz pursues Jacob — Yahuah grants favor and spares his life',
       E'Jasher fills in a scene Genesis only implies: Esau sends his son to ambush the fleeing Jacob. *Behold all that I have and which my father and mother gave to me, that take to you and go from me, and do not slay me, and may this thing be accounted to you a righteousness* (Jasher 29:37), *And Yahuah (the Lord) caused Jacob to find favor in the sight of Eliphaz the son of Esau, and his men, and they hearkened to the voice of Jacob, and they did not put him to death* (Jasher 29:38). This is the seed kept by Yahuah''s own hand even when stripped of silver and gold — the covenant promise "I am with thee, and will keep thee in all places whither thou goest" worked out in the road. Genesis closed the marriage frame the same chapter, *Then went Esau unto Ishmael, and took unto the wives which he had Mahalath the daughter of Ishmael Abraham’s son, the sister of Nebajoth, to be his wife* (Genesis 28:9), which Jasher 29:43 retells as Esau takes Machlath. The chosen line is preserved; the kingdom-of-man''s sword does not prevail.',
       sv.verse_id, ev.verse_id, 'extras', 55715
  FROM _session252_ja29_lookup sv, _session252_ja29_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=31
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=29 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-29-stolen-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:19 — *And Jacob said unto his father, I am Esau thy firstborn; I have done according as thou badest me: arise, I pray thee, sit and eat of my venison, that thy soul may bless me.* The Genesis source of Jacob''s claim to the blessing that Jasher 29:7 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-stolen-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:17 — *And she gave the savoury meat and the bread, which she had prepared, into the hand of her son Jacob.* Rebecca''s hand in the savory meat, the same dish Jacob carries to Isaac in Jasher 29:6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-stolen-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 26:13 — *And Jacob went in to his father and said: “I am your son: I have done according as you bade me: arise and sit and eat of that which I have caught, father, that your soul may bless me.”* The Jubilees telling of the same scene, the third witness to Jasher 29:7.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-stolen-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=26 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-29-despised-birthright-election
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:36 — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing. And he said, Hast thou not reserved a blessing for me?* The Genesis source of Esau''s "supplanted me twice" cry in Jasher 29:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-despised-birthright-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:34 — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* The first of the two supplantings Jasher 29:10 names — Esau himself despised the birthright.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-despised-birthright-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The apostle''s verdict on the profane Esau whose loss Jasher 29:10 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-despised-birthright-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* The election standing behind the blessing Jacob takes in Jasher 29:10 — the seed-line chosen, not earned.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-despised-birthright-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-29-jacob-flees-keeps-the-way
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:43 — *Now therefore, my son, obey my voice; and arise, flee thou to Laban my brother to Haran;* Rebekah''s command that drives Jacob''s flight in Jasher 29:11 and 29:23.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-jacob-flees-keeps-the-way'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 27:3 — *Now, therefore, my son, obey my voice, and arise and flee you to Laban, my brother, to Haran, and tarry with him a few days until your brother’s anger turns away, and he remove his anger from you, and forget all that you have done; then I will send and fetch you from thence.* The Jubilees telling of Rebecca''s same charge to flee to Haran, paralleling Jasher 29:23.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-jacob-flees-keeps-the-way'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-29-isaac-charge-abrahamic-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* The Genesis charge that Jasher 29:24 retells as Isaac sends Jacob to Haran.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-isaac-charge-abrahamic-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:3 — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people;* The El Shaddai blessing of fruitfulness that Jasher 29:29 carries word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-isaac-charge-abrahamic-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 28:4 — *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham.* The blessing of Abraham passing to Jacob and his seed, the same words as Jasher 29:29.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-isaac-charge-abrahamic-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 27:11 — *And El Shaddai (God Almighty) bless you and increase and multiply you that you may become a company of nations, and give you the blessings of my father Abraham, to you and to your seed after you, that you may inherit the land of your sojournings and all the land which Elohim (God) gave to Abraham: go, my son, in peace.* The Jubilees telling of the same Abrahamic blessing Isaac gives in Jasher 29:29.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-isaac-charge-abrahamic-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=29
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-29-esau-wives-ishmael-dies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:34 — *And Esau was forty years old when he took to wife Judith the daughter of Beeri the Hittite, and Bashemath the daughter of Elon the Hittite:* The Genesis record of Esau''s Hittite marriages that grieved Isaac, the same daughters-of-Heth Jasher 29:14-17 names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-esau-wives-ishmael-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:17 — *And these are the years of the life of Ishmael, an hundred and thirty and seven years: and he gave up the ghost and died; and was gathered unto his people.* The Genesis notice of Ishmael''s death at 137 years, the very figure Jasher 29:18 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-esau-wives-ishmael-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:20 — *And as for Ishmael, I have heard thee: Behold, I have blessed him, and will make him fruitful, and will multiply him exceedingly; twelve princes shall he beget, and I will make him a great nation.* Ishmael, whose death Jasher 29:18 records, was himself kept under Abraham''s blessing — the seed-line''s wider mercy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-esau-wives-ishmael-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-29-eliphaz-robs-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Yahuah''s keeping of Jacob "in all places" is exactly the favor that spares him from Eliphaz''s sword in Jasher 29:38.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-eliphaz-robs-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:9 — *Then went Esau unto Ishmael, and took unto the wives which he had Mahalath the daughter of Ishmael Abraham’s son, the sister of Nebajoth, to be his wife.* The Genesis source of Esau''s marriage to Machlath the daughter of Ishmael that closes Jasher 29:43.'
  FROM cross_reference_threads t, cross_references x, _session252_ja29_lookup sv, _session252_ja29_lookup tv
 WHERE t.slug='jasher-29-eliphaz-robs-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=29 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

