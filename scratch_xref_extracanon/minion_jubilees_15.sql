-- ----- fragment: minion_jubilees_15.sql (session251 jubilees 15) -----
-- Source anchor: jubilees/jubilees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju15 (view _session251_ju15_lookup). Sort band base 53350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-15-circumcision-eternal-sign
  ('jubilees', 'jubilees', 15, 11, 'canon', 'genesis', 17, 11, 'free', E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* Jubilees 15:11 carries the very words of the Genesis covenant — the foreskin circumcised as the token between Yahuah and Abraham''s seed.'),
  ('jubilees', 'jubilees', 15, 13, 'canon', 'genesis', 17, 13, 'free', E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jubilees 15:13 echoes it exactly: the covenant in the flesh "for an eternal ordinance," and the uncircumcised soul cut off.'),
  ('jubilees', 'jubilees', 15, 12, 'canon', 'leviticus', 12, 3, 'free', E'Leviticus 12:3 — *And in the eighth day the flesh of his foreskin shall be circumcised.* Jubilees 15:12 fixes the same eighth-day timing the Torah commands — the sign given on the appointed day, never omitted.'),
  ('jubilees', 'jubilees', 15, 11, 'canon', 'acts', 7, 8, 'free', E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen calls it "the covenant of circumcision" — the same eternal token Jubilees 15:11 places in Abraham''s keeping.'),
  ('jubilees', 'jubilees', 15, 13, 'canon', 'romans', 4, 11, 'free', E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also.* Paul reads the sign of Jubilees 15:13 as a seal upon a faith already counted — the token of an eternal covenant, not its undoing.'),
  -- thread: jubilees-15-abram-to-abraham-covenant
  ('jubilees', 'jubilees', 15, 3, 'canon', 'genesis', 17, 1, 'free', E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* Jubilees 15:3 retells the same self-disclosure of El Shaddai and the call to be perfect.'),
  ('jubilees', 'jubilees', 15, 5, 'canon', 'genesis', 17, 5, 'free', E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Jubilees 15:5 carries the renaming word for word — Abram becomes Abraham, father of many nations forever.'),
  ('jubilees', 'jubilees', 15, 5, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* Jubilees 15:5 names the same everlasting covenant to Abraham and his seed throughout their generations.'),
  ('jubilees', 'jubilees', 15, 10, 'canon', 'genesis', 17, 8, 'free', E'Genesis 17:8 — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God).* Jubilees 15:10 grants the same land of Canaan to the seed for an everlasting possession.'),
  ('jubilees', 'jubilees', 15, 5, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Paul takes the "father of many nations" of Jubilees 15:5 as the seal of Abraham''s faith in the God who raises the dead.'),
  -- thread: jubilees-15-isaac-promised-everlasting
  ('jubilees', 'jubilees', 15, 15, 'canon', 'genesis', 17, 15, 'free', E'Genesis 17:15 — *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be.* Jubilees 15:15 retells the renaming of Sarai to Sarah, the mother of the promised seed.'),
  ('jubilees', 'jubilees', 15, 17, 'canon', 'genesis', 17, 17, 'free', E'Genesis 17:17 — *Then Abraham fell upon his face, and laughed, and said in his heart, Shall a child be born unto him that is an hundred years old? and shall Sarah, that is ninety years old, bear?* Jubilees 15:17 carries the same wonder of a hundred-year-old father and a ninety-year-old mother.'),
  ('jubilees', 'jubilees', 15, 18, 'canon', 'genesis', 17, 19, 'free', E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 15:18 names Isaac and establishes the everlasting covenant in him exactly as Genesis does.'),
  ('jubilees', 'jubilees', 15, 17, 'canon', 'romans', 4, 19, 'free', E'Romans 4:19 — *And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb.* Paul turns the impossibility Abraham marvels at in Jubilees 15:17 into the very ground of his faith.'),
  -- thread: jubilees-15-abram-firstfruits-feast
  ('jubilees', 'jubilees', 15, 1, 'canon', 'leviticus', 23, 10, 'free', E'Leviticus 23:10 — *Speak unto the children of Yashar''el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest.* Abram''s feast of first-fruits in Jubilees 15:1 is the very harvest-offering the Torah later commands.'),
  ('jubilees', 'jubilees', 15, 1, 'canon', 'leviticus', 23, 17, 'free', E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* The third-month grain first-fruits Abram keeps in Jubilees 15:1 is Shavuot, the feast of these wave-loaf firstfruits.'),
  ('jubilees', 'jubilees', 15, 2, 'canon', 'leviticus', 23, 21, 'free', E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Abram''s new offerings of the first-fruits in Jubilees 15:2 keep the feast the Torah calls a statute for ever.'),
  -- thread: jubilees-15-election-spirits-over-nations
  ('jubilees', 'jubilees', 15, 30, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Jubilees 15:31''s apportioning of spirits over the many nations retells the Song of Moses'' division of the peoples.'),
  ('jubilees', 'jubilees', 15, 32, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''s portion is his people; Jacob is the lot of his inheritance.* Jubilees 15:32 says Yahuah alone is Israel''s ruler, appointing no angel over them — Israel is His own portion as the Song declares.'),
  ('jubilees', 'jubilees', 15, 31, 'enoch', '1-enoch', 99, 7, 'extras', E'1 Enoch 99:7 — *And they who worship stones, and grave images of gold and silver and wood [and stone] and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them.* The spirits set over the nations to lead them astray in Jubilees 15:31 are the impure spirits and demons behind the idols in the live Enoch apparatus.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-circumcision-eternal-sign',
       E'Circumcision — the token of an eternal covenant in the flesh',
       E'Jubilees sets the covenant-sign in Abraham''s flesh as something that does not expire: *And Yahuah (God) said to Abraham: "And as for you, do you keep My Covenant, you and your seed after you, and circumcise you every male among you, and circumcise your foreskins, and it will be a token of an eternal covenant between Me and you. And the child on the eighth day you will circumcise, every male throughout your generations"* (Jubilees 15:11-12). This is Genesis 17 retold almost word for word — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you* (Genesis 17:11), *and my covenant shall be in your flesh for an everlasting covenant* (Genesis 17:13). The Torah fixes the eighth day as the very day it falls in the cycle of cleanness — *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3). Stephen names it the standing covenant Abraham received and kept — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day* (Acts 7:8). And Paul, far from voiding it, makes the sign read what was already true — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised* (Romans 4:11). It ain''t new: one everlasting sign, the same in Genesis, in the law, in the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 53350
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-abram-to-abraham-covenant',
       E'Abram made Abraham — father of many nations, the seed forever',
       E'El Shaddai appears and renames the patriarch: *And Abram fell on his face, and Elohim (God) talked with him, and said: "Behold My ordinance is with you, And you will be the father of many nations. Neither will your name any more be called Abram, But your name from henceforth, even for ever, shall be Abraham... And I shall establish My covenant between Me and you, and your seed after you, throughout their generations, for an eternal covenant"* (Jubilees 15:5). This is the Genesis theophany retold — *I am the El Shaddai (Almighty God); walk before me, and be thou perfect* (Genesis 17:1) and *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee* (Genesis 17:5). The land-grant of Jubilees 15:10 likewise repeats *the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession* (Genesis 17:8). Paul presses the same naming as the gospel of the dead made alive — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead* (Romans 4:17). The election of this seed is ancient and engraved: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53353
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-isaac-promised-everlasting',
       E'Sarah shall bear Isaac — the covenant established with the promised seed',
       E'The covenant is narrowed to a son not yet born: *And Elohim (God) said to Abraham: "As for Sarai your wife, her name will no more be called Sarai, but Sarah will be her name. And I shall bless her, and give you a son by her... you will call his name Isaac, and I shall establish My covenant with him, an everlasting covenant, and for his seed after him"* (Jubilees 15:15-18). It is Genesis 17 retold — *Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him* (Genesis 17:19). Abraham''s laughing wonder is the same — *Shall a child be born unto him that is an hundred years old? and shall Sarah, that is ninety years old, bear?* (Genesis 17:17). Paul reads that very impossibility as Abraham''s faith — *And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb* (Romans 4:19). The seed is kept through the promised son: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53356
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-abram-firstfruits-feast',
       E'Abram keeps the feast of first-fruits — the moedim kept by the fathers',
       E'Before the covenant is renewed, Jubilees dates it to an appointed time the patriarch is already keeping: *And in the fifth year of the fourth week of this jubilee, in the third month, in the middle of the month, Abram celebrated the feast of the first-fruits of the grain harvest. And he offered new offerings on the altar, the first-fruits of the produce, to Yahuah (God)* (Jubilees 15:1-2). The third-month grain first-fruits is Shavuot — the very feast the Torah ordains: *When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest* (Leviticus 23:10), and the wheat-harvest loaves fifty days on — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD)* (Leviticus 23:17). This is Yoshi''s Appointed Times spine: the feast is not a later Jewish invention but kept by Abraham himself. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53359
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-election-spirits-over-nations',
       E'Israel chosen as Yahuah''s own — spirits over the nations, none over Israel',
       E'Jubilees grounds Israel''s election against the backdrop of the seed-war over the nations: *He chose Yashar''el (Israel) to be His people. And He sanctified it, and gathered it from amongst all the children of men; for there are many nations and many peoples, and all are His, and over all has He placed spirits in authority to lead them astray from Him. But over Yashar''el (Israel) He did not appoint any angel or spirit, for He alone is their ruler* (Jubilees 15:30-32). This is the apportioning of Deuteronomy 32 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* — and *the LORD''s portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:8-9). The spirits set over the nations to lead them astray are the demonic powers of the live Enoch apparatus, where the idol-worshippers serve impure spirits — *And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them* (1 Enoch 99:7). Election precedes confession; the seed is kept under Yahuah''s own hand. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53362
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=30
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-15-circumcision-eternal-sign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* Jubilees 15:11 carries the very words of the Genesis covenant — the foreskin circumcised as the token between Yahuah and Abraham''s seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jubilees 15:13 echoes it exactly: the covenant in the flesh "for an eternal ordinance," and the uncircumcised soul cut off.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 12:3 — *And in the eighth day the flesh of his foreskin shall be circumcised.* Jubilees 15:12 fixes the same eighth-day timing the Torah commands — the sign given on the appointed day, never omitted.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen calls it "the covenant of circumcision" — the same eternal token Jubilees 15:11 places in Abraham''s keeping.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also.* Paul reads the sign of Jubilees 15:13 as a seal upon a faith already counted — the token of an eternal covenant, not its undoing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-abram-to-abraham-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* Jubilees 15:3 retells the same self-disclosure of El Shaddai and the call to be perfect.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Jubilees 15:5 carries the renaming word for word — Abram becomes Abraham, father of many nations forever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* Jubilees 15:5 names the same everlasting covenant to Abraham and his seed throughout their generations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:8 — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God).* Jubilees 15:10 grants the same land of Canaan to the seed for an everlasting possession.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Paul takes the "father of many nations" of Jubilees 15:5 as the seal of Abraham''s faith in the God who raises the dead.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-isaac-promised-everlasting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:15 — *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be.* Jubilees 15:15 retells the renaming of Sarai to Sarah, the mother of the promised seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:17 — *Then Abraham fell upon his face, and laughed, and said in his heart, Shall a child be born unto him that is an hundred years old? and shall Sarah, that is ninety years old, bear?* Jubilees 15:17 carries the same wonder of a hundred-year-old father and a ninety-year-old mother.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 15:18 names Isaac and establishes the everlasting covenant in him exactly as Genesis does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:19 — *And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb.* Paul turns the impossibility Abraham marvels at in Jubilees 15:17 into the very ground of his faith.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-abram-firstfruits-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:10 — *Speak unto the children of Yashar''el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest.* Abram''s feast of first-fruits in Jubilees 15:1 is the very harvest-offering the Torah later commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-firstfruits-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* The third-month grain first-fruits Abram keeps in Jubilees 15:1 is Shavuot, the feast of these wave-loaf firstfruits.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-firstfruits-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Abram''s new offerings of the first-fruits in Jubilees 15:2 keep the feast the Torah calls a statute for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-firstfruits-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-election-spirits-over-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Jubilees 15:31''s apportioning of spirits over the many nations retells the Song of Moses'' division of the peoples.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-election-spirits-over-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:9 — *For the LORD''s portion is his people; Jacob is the lot of his inheritance.* Jubilees 15:32 says Yahuah alone is Israel''s ruler, appointing no angel over them — Israel is His own portion as the Song declares.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-election-spirits-over-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 99:7 — *And they who worship stones, and grave images of gold and silver and wood [and stone] and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them.* The spirits set over the nations to lead them astray in Jubilees 15:31 are the impure spirits and demons behind the idols in the live Enoch apparatus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-election-spirits-over-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=31
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

