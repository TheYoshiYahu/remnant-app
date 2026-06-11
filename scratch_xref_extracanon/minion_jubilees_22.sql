-- ----- fragment: minion_jubilees_22.sql (session251 jubilees 22) -----
-- Source anchor: jubilees/jubilees ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju22 (view _session251_ju22_lookup). Sort band base 53525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-22-feast-of-weeks-firstfruits
  ('jubilees', 'jubilees', 22, 1, 'canon', 'leviticus', 23, 15, 'free', E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:* The Shavuot Abraham keeps in Jubilees 22:1 is the very feast of weeks the Torah counts out from firstfruits.'),
  ('jubilees', 'jubilees', 22, 4, 'canon', 'leviticus', 23, 17, 'free', E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* Rebecca''s new cakes from the new grain in Jubilees 22:4 are the firstfruits-of-the-harvest offering of Shavuot.'),
  ('jubilees', 'jubilees', 22, 4, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The patriarchs already gather for Yahuah''s feast in Jubilees 22, the appointed times kept before they were written at Sinai.'),
  -- thread: jubilees-22-blessing-of-jacob-election
  ('jubilees', 'jubilees', 22, 11, 'canon', 'genesis', 27, 29, 'free', E'Genesis 27:29 — *Let people serve thee, and nations bow down to thee: be lord over thy brethren, and let thy mother''s sons bow down to thee: cursed be every one that curseth thee, and blessed be he that blesseth thee.* The nations bowing before Jacob''s seed in Jubilees 22:11 is Isaac''s stolen-then-confirmed blessing of Genesis.'),
  ('jubilees', 'jubilees', 22, 9, 'canon', 'genesis', 28, 4, 'free', E'Genesis 28:4 — *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham.* The blessing of Abraham passing to Jacob''s seed in Jubilees 22:9 is the very blessing Isaac renews over Jacob at his sending.'),
  ('jubilees', 'jubilees', 22, 9, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Jacob chosen as the chosen nation in Jubilees 22:9 is Paul''s proof that election stands by Yahuah''s call, not by works.'),
  ('jubilees', 'jubilees', 22, 11, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The nations serving and blessed through Jacob''s seed in Jubilees 22:11 carries forward the promise first spoken to Abram.'),
  -- thread: jubilees-22-renew-the-covenant-everlasting
  ('jubilees', 'jubilees', 22, 15, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The renewed covenant that makes Jacob''s seed Yahuah''s inheritance for all the ages in Jubilees 22:15 is the everlasting covenant cut with Abraham.'),
  ('jubilees', 'jubilees', 22, 13, 'canon', 'genesis', 28, 3, 'free', E'Genesis 28:3 — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people;* The blessings of Adam and Noah gathered on Jacob''s seed in Jubilees 22:13 are the El Shaddai blessing Isaac speaks over Jacob in Genesis.'),
  -- thread: jubilees-22-separate-from-the-nations
  ('jubilees', 'jubilees', 22, 16, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Abraham''s charge to separate from the nations in Jubilees 22:16 is grounded in Israel chosen as a holy people.'),
  ('jubilees', 'jubilees', 22, 16, 'canon', '2-corinthians', 6, 14, 'free', E'2 Corinthians 6:14 — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* Abraham''s ''become not their associate'' in Jubilees 22:16 is the separation Paul presses on the assembly.'),
  ('jubilees', 'jubilees', 22, 16, 'canon', '2-corinthians', 6, 17, 'free', E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The command to separate and not touch the unclean works of the nations in Jubilees 22:16 is Paul''s call to come out and be separate.'),
  ('jubilees', 'jubilees', 22, 18, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The wood and stone that cannot deliver, mocked in Jubilees 22:18, are the dumb idols the Psalmist exposes.'),
  -- thread: jubilees-22-no-wife-of-canaan-intermarriage
  ('jubilees', 'jubilees', 22, 20, 'canon', 'genesis', 28, 1, 'free', E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* Abraham''s warning to Jacob against a Canaanite wife in Jubilees 22:20 is the very charge Isaac repeats over Jacob.'),
  ('jubilees', 'jubilees', 22, 20, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The ban on a wife from the seed of Canaan in Jubilees 22:20 becomes Torah law in Deuteronomy.'),
  ('jubilees', 'jubilees', 22, 20, 'canon', 'deuteronomy', 7, 4, 'free', E'Deuteronomy 7:4 — *For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* The reason Abraham forbids the marriage in Jubilees 22:20 — to keep the seed from the nations'' uncleanness — is the reason the Torah gives: lest they turn the heart to other gods.'),
  ('jubilees', 'jubilees', 22, 22, 'canon', 'exodus', 34, 16, 'free', E'Exodus 34:16 — *And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods.* The idol-worship that condemns the nations in Jubilees 22:22 is the whoring-after-gods the marriage ban guards the seed against.'),
  -- thread: jubilees-22-holy-seed-the-house-of-abraham
  ('jubilees', 'jubilees', 22, 27, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* Abraham''s testimony that Yahuah brought him from Ur to establish a holy seed in Jubilees 22:27 is the original call out of his country.'),
  ('jubilees', 'jubilees', 22, 30, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The renewed covenant with Jacob''s seed to all generations in Jubilees 22:30 is the everlasting covenant first cut with Abraham.'),
  ('jubilees', 'jubilees', 22, 29, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Abraham''s prayer that Yahuah sanctify Jacob ''as a nation for Your inheritance'' in Jubilees 22:29 is fulfilled in Israel chosen as a holy people.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-22-feast-of-weeks-firstfruits',
       E'Abraham''s last Shavuot — the feast of weeks, kept before Sinai',
       E'Abraham''s final day on earth is a feast day, and the feast is Shavuot: *And it came to pass in the first week in the forty-fourth jubilee, in the second year, that is, the year in which Abraham died, that Isaac and Ishmael came from the Well of the Oath to celebrate the feast of weeks–that is, the feast of the first-fruits of the harvest–to Abraham, their father* (Jubilees 22:1). Rebecca brings the new grain — *And he offered a thank-offering and made a feast of joy before Ishmael, his brother: and Rebecca made new cakes from the new grain, and gave them to Jacob, her son, to take them to Abraham, his father, from the first-fruits of the land, that he might eat and bless the Creator of all things before he died* (Jubilees 22:4). This is no later Jewish invention. The feast of weeks and its first-fruits stand engraved in the Torah Yahuah gave at Sinai — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete* (Leviticus 23:15); *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD)* (Leviticus 23:17). The fathers kept the Appointed Times centuries before Moses wrote them down. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53525
  FROM _session251_ju22_lookup sv, _session251_ju22_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=22 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-22-blessing-of-jacob-election',
       E'Abraham blesses Jacob — the chosen seed, election before works',
       E'Dying Abraham calls not the elder but Jacob, and lays the whole election on him: *My Elohim (God), may Your mercy and Your peace be upon Your servant, and upon the seed of his sons, that they may be to You a chosen nation and an inheritance from amongst all the nations of the earth* (Jubilees 22:9); *Blessed be my son Jacob... May nations serve you, And all the nations bow themselves before your seed* (Jubilees 22:11). This is the same blessing Isaac will speak over Jacob in Genesis — *Let people serve thee, and nations bow down to thee: be lord over thy brethren* (Genesis 27:29) — and the same word El Shaddai renews at Bethel — *And give thee the blessing of Abraham, to thee, and to thy seed with thee* (Genesis 28:4). The choice falls on the younger, the seed kept, before he has done good or evil — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11). Election precedes confession; the seed is kept by Yahuah''s will, not earned.',
       sv.verse_id, ev.verse_id, 'extras', 53528
  FROM _session251_ju22_lookup sv, _session251_ju22_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=22 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-22-renew-the-covenant-everlasting',
       E'The blessings of Noah and Adam — covenant renewed for ever',
       E'Abraham gathers the whole line of blessing onto Jacob''s head: *May the El Elyon (Most High) Elohim (God) give you all the blessings Wherewith he has blessed me And wherewith He blessed Noah and Adam; May they rest on the sacred head of your seed from generation to generation for ever* (Jubilees 22:13). Then the covenant itself: *And may He renew His covenant with you, That you may be to Him a nation for His inheritance for all the ages, And that He may be to you and to your seed a Elohim (God) in truth and righteousness throughout all the days of the earth* (Jubilees 22:15). This is the everlasting covenant of Genesis, never abolished — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* (Genesis 17:7). The line runs unbroken from Adam through Noah to Abraham to Jacob: one covenant, renewed, for all the ages. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53531
  FROM _session251_ju22_lookup sv, _session251_ju22_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=22 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-22-separate-from-the-nations',
       E'Separate yourself from the nations — the seed kept holy',
       E'Abraham''s charge to Jacob is the whole separation framework, spoken before Sinai: *And do you, my son Jacob, remember my words, And observe the commandments of Abraham, your father: Separate yourself from the nations, And eat not with them: And do not according to their works, And become not their associate; For their works are unclean, And all their ways are a pollution and an abomination and uncleanness* (Jubilees 22:16). Their idols are dead things — *And how they err in saying to a piece of wood: ''You are my Elohim (God),'' And to a stone: ''You are my Yahuah (God) and you are my deliverer.''* (Jubilees 22:18). The Torah will say the same — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6) — and Paul carries the very figure into the assembly — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14); *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). The Psalms mock the same dead idols Abraham warns against — *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). This is not hatred of peoples but the seed kept holy unto Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 53534
  FROM _session251_ju22_lookup sv, _session251_ju22_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=22 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-22-no-wife-of-canaan-intermarriage',
       E'Take no wife of Canaan — against intermarriage with the nations',
       E'Abraham binds Jacob with the marriage law before it is written: *Be you ware, my son Jacob, of taking a wife from any seed of the daughters of Canaan; For all his seed is to be rooted out of the earth* (Jubilees 22:20); *For, owing to the transgression of Ham, Canaan erred, And all his seed will be destroyed from off the earth and all the residue thereof, And none springing from him will be saved on the day of judgment* (Jubilees 22:21). Isaac will charge Jacob the identical way — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan* (Genesis 28:1) — and the Torah will make it law — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3); *For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). The idolaters'' end Abraham names — *As the children of Sodom were taken away from the earth So will all those who worship idols be taken away* (Jubilees 22:22) — is the same snare Exodus warns of — *And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods* (Exodus 34:16). The seed is kept holy, not for blood''s sake but to keep the worship undefiled.',
       sv.verse_id, ev.verse_id, 'extras', 53537
  FROM _session251_ju22_lookup sv, _session251_ju22_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=22 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-22-holy-seed-the-house-of-abraham',
       E'A holy seed — the house of Abraham established for ever',
       E'Abraham''s last word names the purpose of his whole calling: a holy seed established for ever — *who brought me forth from Ur of the Chaldees, that He might give me this land to inherit it for ever, and that I might establish a holy seed–blessed be the El Elyon (Most High) for ever* (Jubilees 22:27). He blesses Jacob with his whole heart — *My son, over whom with all my heart and my affection I rejoice, may Your grace and Your mercy be lift up upon him and upon his seed alway* (Jubilees 22:28) — and prays the election be sealed — *that You may preserve him, and bless him, and may sanctify him as a nation for Your inheritance* (Jubilees 22:29); *and renew Your covenant and Your grace with him and with his seed according to all Your good pleasure to all the generations of the earth* (Jubilees 22:30). This is the call out of Ur, Genesis 12, carried to its end — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1) — and the everlasting covenant — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant* (Genesis 17:7). The holy seed is kept and sanctified as Yahuah''s inheritance to all generations.',
       sv.verse_id, ev.verse_id, 'extras', 53540
  FROM _session251_ju22_lookup sv, _session251_ju22_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=27
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=22 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-22-feast-of-weeks-firstfruits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:* The Shavuot Abraham keeps in Jubilees 22:1 is the very feast of weeks the Torah counts out from firstfruits.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-feast-of-weeks-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* Rebecca''s new cakes from the new grain in Jubilees 22:4 are the firstfruits-of-the-harvest offering of Shavuot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-feast-of-weeks-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The patriarchs already gather for Yahuah''s feast in Jubilees 22, the appointed times kept before they were written at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-feast-of-weeks-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-22-blessing-of-jacob-election
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:29 — *Let people serve thee, and nations bow down to thee: be lord over thy brethren, and let thy mother''s sons bow down to thee: cursed be every one that curseth thee, and blessed be he that blesseth thee.* The nations bowing before Jacob''s seed in Jubilees 22:11 is Isaac''s stolen-then-confirmed blessing of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-blessing-of-jacob-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:4 — *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham.* The blessing of Abraham passing to Jacob''s seed in Jubilees 22:9 is the very blessing Isaac renews over Jacob at his sending.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-blessing-of-jacob-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Jacob chosen as the chosen nation in Jubilees 22:9 is Paul''s proof that election stands by Yahuah''s call, not by works.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-blessing-of-jacob-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The nations serving and blessed through Jacob''s seed in Jubilees 22:11 carries forward the promise first spoken to Abram.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-blessing-of-jacob-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-22-renew-the-covenant-everlasting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The renewed covenant that makes Jacob''s seed Yahuah''s inheritance for all the ages in Jubilees 22:15 is the everlasting covenant cut with Abraham.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-renew-the-covenant-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:3 — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people;* The blessings of Adam and Noah gathered on Jacob''s seed in Jubilees 22:13 are the El Shaddai blessing Isaac speaks over Jacob in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-renew-the-covenant-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-22-separate-from-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Abraham''s charge to separate from the nations in Jubilees 22:16 is grounded in Israel chosen as a holy people.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-separate-from-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 6:14 — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* Abraham''s ''become not their associate'' in Jubilees 22:16 is the separation Paul presses on the assembly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-separate-from-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The command to separate and not touch the unclean works of the nations in Jubilees 22:16 is Paul''s call to come out and be separate.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-separate-from-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The wood and stone that cannot deliver, mocked in Jubilees 22:18, are the dumb idols the Psalmist exposes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-separate-from-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-22-no-wife-of-canaan-intermarriage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* Abraham''s warning to Jacob against a Canaanite wife in Jubilees 22:20 is the very charge Isaac repeats over Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-no-wife-of-canaan-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The ban on a wife from the seed of Canaan in Jubilees 22:20 becomes Torah law in Deuteronomy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-no-wife-of-canaan-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:4 — *For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* The reason Abraham forbids the marriage in Jubilees 22:20 — to keep the seed from the nations'' uncleanness — is the reason the Torah gives: lest they turn the heart to other gods.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-no-wife-of-canaan-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:16 — *And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods.* The idol-worship that condemns the nations in Jubilees 22:22 is the whoring-after-gods the marriage ban guards the seed against.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-no-wife-of-canaan-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-22-holy-seed-the-house-of-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* Abraham''s testimony that Yahuah brought him from Ur to establish a holy seed in Jubilees 22:27 is the original call out of his country.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-holy-seed-the-house-of-abraham'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The renewed covenant with Jacob''s seed to all generations in Jubilees 22:30 is the everlasting covenant first cut with Abraham.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-holy-seed-the-house-of-abraham'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Abraham''s prayer that Yahuah sanctify Jacob ''as a nation for Your inheritance'' in Jubilees 22:29 is fulfilled in Israel chosen as a holy people.'
  FROM cross_reference_threads t, cross_references x, _session251_ju22_lookup sv, _session251_ju22_lookup tv
 WHERE t.slug='jubilees-22-holy-seed-the-house-of-abraham'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=22 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

