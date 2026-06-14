-- ----- fragment: minion_colossians_03.sql (S232 Colossians 3) -----
-- =====================================================================
-- S232 minion — COLOSSIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: COLOSSIANS 3 (25 verses) — risen with Messiah / things above / put off the old man,
-- put on the new man after the image / the regathered one body / the household order.
-- Tag: co03 (temp view _s232_co03_lookup).
-- Sort band: floor 7710, step 3 (7710, 7713, 7716, 7719, 7722, 7725 used; under 7735).
-- Source is ALWAYS the canon Colossians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul charges the called-out ones — Yashar'el (Israel) and the grafted-in seed of
-- the nations — to live the resurrection life. Every "put off / put on" here is the Torah's own
-- inward demand brought to fulness, NOT a law-vs-grace antithesis: *covetousness, which is idolatry*
-- re-speaks the tenth word and the first; the *new man... renewed... after the image of him that
-- created him* is the Genesis-1 image restored and the Ezekiel-36 new heart given; *neither Greek nor
-- Yahudi (Jew)... Messiah is all, and in all* is the ONE regathered body (the two-house ingathering of
-- the Ephesians-2 one new man), NOT the erasure of Yashar'el (Israel); *forgiving one another... even
-- as Messiah forgave you* is Leviticus 19's love-thy-neighbour and the Father's own mercy of Exodus
-- 34; *children, obey your parents... well pleasing unto Yahuah (Lord)* is the fifth word AFFIRMED.
-- The household code 3:18-25 is the twin of Ephesians 5:22-6:9. No replacement theology.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   risen with Messiah, seek things above, Messiah on the right hand of Elohim, your life hid
--           Tanakh: Psalm 110:1 (sit thou at my right hand)
--           Extras: none warranted (2 Esdras/2 Baruch world-above not in available editions; not forced)
--           NT: none warranted (the Psalm-110 root is load-bearing; Eph 2:6 carried in prose)
--   v.5-7   mortify your members; covetousness, which is idolatry; the wrath on the children of disobedience
--           Tanakh: Exodus 20:17 / Deuteronomy 5:21 (thou shalt not covet)
--           Extras: none warranted   NT: Ephesians 5:5 (covetous man, who is an idolater) — carried in prose
--   v.8-11  put off the old man, put on the new man renewed after the image; neither Greek nor Yahudi
--           Tanakh: Genesis 1:26-27 (the image), Ezekiel 36:26 (the new heart) [v.9-10];
--                   none warranted for v.11 (the Galatians-3 NT root is the weave)
--           Extras: none warranted   NT: Ephesians 4:22-24 (put off the old man, put on the new) [v.9-10];
--                   Galatians 3:28 (neither Yahudi nor Greek... all one) [v.11]
--   v.12-14 bowels of mercies, kindness, forbearing and forgiving one another, even as Messiah forgave you
--           Tanakh: Exodus 34:6-7 (Yahuah merciful and gracious, forgiving iniquity), Leviticus 19:18
--                   (love thy neighbour, bear no grudge)
--           Extras: Sirach (Ecclesiasticus) 28:2,7 (forgive your neighbour... so shall your sins be forgiven)
--           NT: Matthew 6:14 (if ye forgive men, your Father will forgive you), Matthew 18:35
--                   (forgive every one his brother), Ephesians 4:32 (forgiving one another, as Elohim forgave you)
--   v.15-17 the peace of Elohim rule in your hearts, the word of Messiah dwell in you, psalms and hymns
--           Tanakh: none warranted (no single load-bearing quote; thanksgiving/song is diffuse)
--           Extras: none warranted   NT: Ephesians 5:19-20 (psalms and hymns and spiritual songs) — diffuse twin, not threaded
--   v.18-25 the household order: wives, husbands, children obey your parents, fathers, servants
--           Tanakh: Exodus 20:12 / Deuteronomy 5:16 (honour thy father and mother) [v.20]
--           Extras: none warranted   NT: Ephesians 6:1-3 (children, obey your parents... honour) [v.20];
--                   the wider code Eph 5:22-6:9 is the twin (carried in the v.20 thread's prose)
--
-- THREADS (slug -> target libraries):
--   7710 colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110   (Tanakh)
--   7713 colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5  (Tanakh)
--   7716 colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36  (Tanakh + NT)
--   7719 colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3  (NT)
--   7722 colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19  (Tanakh + Extras + NT)
--   7725 colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s232_co03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110
  ('canon', 'colossians', 3, 1, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). Paul grounds the resurrection life on David''s enthronement psalm: *If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1). The *right hand* the called-out ones look up to is the very place Yahuah (LORD) appointed for *my Lord* — the Formed Son seated at the Father''s right hand, given the kingdom until every enemy is made his footstool. To seek the things above is to set the affection where the enthroned Messiah is; the believer''s life is *hid with Messiah (Christ) in Elohim (God)* (Colossians 3:3) precisely because the Messiah reigns at that right hand.'),
  -- thread: colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5
  ('canon', 'colossians', 3, 5, 'canon', 'exodus', 20, 17, 'free', E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* (Exodus 20:17). The tenth word forbids the grasping desire of the heart, and Paul names that desire by its true root: *Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry* (Colossians 3:5). To covet is to set the heart on what is the neighbour''s as though it were a god — so the tenth word and the first word are one: covetousness *is idolatry,* the inward breaking of the commandment that draws down *the wrath of Elohim (God)* (Colossians 3:6). Paul does not abolish the word; he uncovers its weight.'),
  ('canon', 'colossians', 3, 5, 'canon', 'deuteronomy', 5, 21, 'free', E'*Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* (Deuteronomy 5:21). Moses repeats the tenth word at the renewal of the covenant: the heart must not *desire* nor *covet* what belongs to another. When Paul calls the called-out ones to mortify *covetousness, which is idolatry* (Colossians 3:5), he is enforcing this very word — the desiring heart is the idol-making heart, the *evil concupiscence* that must be put to death. The same Instruction that named the sin at Horeb names it still in the assembly.'),
  -- thread: colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36
  ('canon', 'colossians', 3, 10, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). At creation Elohim (God) formed man *in our image, after our likeness.* The new man Paul puts on is that image restored: *And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10). Salvation is not the making of a different creature but the renewal of the original — the marred image of the Creator brought back to its first design *in knowledge,* the very thing the man lost at the fall now given again.'),
  ('canon', 'colossians', 3, 10, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). The creation word repeats it for emphasis — man bears *the image of Elohim (God).* The *new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10) is the recovery of exactly this: *the image of him that created him* is the image of Genesis 1:27, defaced by sin and now renewed in the risen Messiah. The putting on of the new man is the un-doing of the fall, the divine image set right in those who are risen with him.'),
  ('canon', 'colossians', 3, 10, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). Yahuah (LORD) promised the regathered house of Yashar''el (Israel) a *new heart* and a *new spirit,* the stony heart removed. This is the inward work Paul names *the new man, which is renewed in knowledge* (Colossians 3:10): the renewing is not a human resolve but the covenant gift of Ezekiel — the new heart given, the Spirit put within, so that they walk in his statutes. The old man with his deeds is *put off* (Colossians 3:9) because the stony heart is taken away; the new man is the heart of flesh.'),
  ('canon', 'colossians', 3, 9, 'canon', 'ephesians', 4, 22, 'free', E'*That ye put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts;* (Ephesians 4:22). In the twin letter, written the same hour, Paul speaks the same charge in nearly the same words: *put off... the old man, which is corrupt.* Colossians answers it exactly: *Lie not one to another, seeing that ye have put off the old man with his deeds* (Colossians 3:9). The two letters are one teaching — the old man stripped off like a soiled garment, the deceitful lusts left behind with him.'),
  ('canon', 'colossians', 3, 10, 'canon', 'ephesians', 4, 24, 'free', E'*And that ye put on the new man, which after Elohim (God) is created in righteousness and true holiness.* (Ephesians 4:24). Ephesians names the new man as the one *which after Elohim (God) is created in righteousness and true holiness* — created after Elohim (God) himself. Colossians says the same: *put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10). Both letters root the renewal in the Creator''s own pattern — Genesis 1''s image — so that the new man is the restored likeness of the One who made him, righteousness and true holiness and true knowledge taking the place of the deceitful lusts.'),
  -- thread: colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3
  ('canon', 'colossians', 3, 11, 'canon', 'galatians', 3, 28, 'free', E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus).* (Galatians 3:28). Paul says it twice across the letters: in the new man *there is neither Greek nor Yahudi (Jew), circumcision nor uncircumcision, Barbarian, Scythian, bond nor free: but Messiah (Christ) is all, and in all* (Colossians 3:11). This is not the erasure of Yashar''el (Israel) nor the dissolving of her calling — it is the one regathered body, the grafted-in nations joined to the commonwealth of Yashar''el (Israel), every wall of separation gone so that *Messiah (Christ) is all, and in all.* The distinctions that divided are swallowed up in the one new man, the two houses and the nations made one in him.'),
  -- thread: colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19
  ('canon', 'colossians', 3, 13, 'canon', 'exodus', 34, 6, 'free', E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6). When Yahuah (LORD) proclaimed his own name to Moses, he proclaimed *merciful and gracious, longsuffering* — the very character Paul tells the elect to put on: *bowels of mercies, kindness, humbleness of mind, meekness, longsuffering* (Colossians 3:12). The saints are to wear the mercy of Yahuah (LORD) himself; the *longsuffering* of the assembly is the longsuffering proclaimed at Sinai, the people bearing the likeness of the Elohim (God) who forgives.'),
  ('canon', 'colossians', 3, 13, 'canon', 'exodus', 34, 7, 'free', E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty; visiting the iniquity of the fathers upon the children, and upon the children''s children, unto the third and to the fourth generation.* (Exodus 34:7). Yahuah (LORD) is the One *forgiving iniquity and transgression and sin.* Paul makes that divine forgiveness the measure of the assembly''s forgiveness: *Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). To forgive *even as Messiah (Christ) forgave you* is to forgive *even as* Yahuah (LORD) himself forgives — the people of the covenant extending the very mercy by which they were kept.'),
  ('canon', 'colossians', 3, 13, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The Torah forbids the grudge and commands love of neighbour. Paul''s *Forbearing one another, and forgiving one another, if any man have a quarrel against any* (Colossians 3:13) is this commandment lived in the body: to refuse the grudge, to bear with the brother, to love the neighbour as oneself. *And above all these things put on charity, which is the bond of perfectness* (Colossians 3:14) — the love commanded in Leviticus 19 is the bond that holds the whole renewed life together.'),
  ('canon', 'colossians', 3, 13, 'apocrypha', 'ecclesiasticus', 28, 2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2). The wisdom of the fathers already bound the two together — *forgive your neighbour... so shall your sins also be forgiven.* Paul speaks the same: *forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). The one who has been forgiven cannot withhold forgiveness; the mercy received becomes the mercy given, exactly as Ben Sira taught and as the Father teaches in the gospel.'),
  ('canon', 'colossians', 3, 13, 'apocrypha', 'ecclesiasticus', 28, 7, 'extras', E'*Remember the commandments, and bear no malice to your neighbour: remember the covenant of the Highest, and wink at ignorance.* (Sirach 28:7). Ben Sira ties the forgiving of the neighbour to remembering *the commandments* and *the covenant of the Highest* — to *bear no malice to your neighbour.* So Paul, calling the assembly to put off *malice* (Colossians 3:8) and to be *Forbearing one another, and forgiving one another* (Colossians 3:13), walks the same covenant path: the one who remembers the commandments lets enmity cease and forgives the brother his quarrel.'),
  ('canon', 'colossians', 3, 13, 'canon', 'matthew', 6, 14, 'free', E'*For if ye forgive men their trespasses, your heavenly Father will also forgive you:* (Matthew 6:14). Yahusha (Jesus) taught the disciples that forgiveness given and forgiveness received are bound together: *if ye forgive men their trespasses, your heavenly Father will also forgive you.* Paul makes that same teaching the law of the body: *forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). The standard of the assembly''s forgiveness is the forgiveness it has itself received from the Father through the Messiah.'),
  ('canon', 'colossians', 3, 13, 'canon', 'matthew', 18, 35, 'free', E'*So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses.* (Matthew 18:35). The parable of the unmerciful servant ends with the warning that the one forgiven a vast debt must forgive his fellow: *if ye from your hearts forgive not every one his brother their trespasses.* This is exactly the weight of Paul''s *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13) — the one who has been released from his own debt by the Messiah must release his brother from the quarrel. To withhold forgiveness is to refuse the very mercy by which one stands.'),
  ('canon', 'colossians', 3, 13, 'canon', 'ephesians', 4, 32, 'free', E'*And be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you.* (Ephesians 4:32). The twin letter gives the same charge in the same shape: *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you.* Colossians answers it: *forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). The pattern is fixed — the forgiveness already received is the measure and the motive of the forgiveness now to be given.'),
  -- thread: colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5
  ('canon', 'colossians', 3, 20, 'canon', 'exodus', 20, 12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12). The fifth word commands the child to honour father and mother. Paul does not set it aside but presses it home in the household: *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20). The obedience that is *well pleasing unto Yahuah (Lord)* is the keeping of the fifth commandment — the Instruction stands in the assembly''s homes, and the child who honours father and mother is doing the very thing Yahuah (LORD) commanded at Sinai.'),
  ('canon', 'colossians', 3, 20, 'canon', 'deuteronomy', 5, 16, 'free', E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Deuteronomy 5:16). Moses repeats the fifth word at the covenant renewal, with its promise *that it may go well with thee.* Paul''s *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20) is this word affirmed and applied; he holds the same commandment over the believing household, the honouring of parents that pleases Yahuah (LORD) and goes well with the obedient child.'),
  ('canon', 'colossians', 3, 20, 'canon', 'ephesians', 6, 1, 'free', E'*Children, obey your parents in Yahuah (Lord): for this is right.* (Ephesians 6:1). The twin letter gives the household charge word for word: *Children, obey your parents in Yahuah (Lord): for this is right* — and adds *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). Colossians says the same: *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20). Paul reads the fifth commandment as still binding and still promised; the household codes of Ephesians 5:22-6:9 and Colossians 3:18-25 are one teaching, the Torah''s order of the family kept in the assembly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s232_co03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s232_co03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110',
       E'Risen with Messiah, who sitteth on the right hand of Elohim (Psalm 110)',
       E'Paul lifts the eyes of the called-out ones to the enthroned Messiah: *If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1). The *right hand* is David''s word: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The Formed Son is seated where the Father appointed him — the place of the reigning King who waits until every enemy is made his footstool. Because the Messiah reigns at that right hand, the life of those risen with him is *hid with Messiah (Christ) in Elohim (God)* (Colossians 3:3), and they *set their affection on things above, not on things on the earth* (Colossians 3:2). The resurrection life is oriented upward to the enthroned Lord; when *Messiah (Christ), who is our life, shall appear, then shall ye also appear with him in glory* (Colossians 3:4). The whole exhortation hangs on the Psalm-110 enthronement: seek what is above because the One you are risen with reigns above.',
       sv.verse_id, ev.verse_id, 'free', 7710
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5',
       E'Covetousness, which is idolatry — the tenth word (Exodus 20, Deuteronomy 5)',
       E'Among the members to be mortified Paul names a sin and unmasks its root: *Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry* (Colossians 3:5). This is the tenth word held up to the light. At Sinai Yahuah (LORD) said, *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife... nor any thing that is thy neighbour''s* (Exodus 20:17), and at the covenant renewal, *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house... or any thing that is thy neighbour''s* (Deuteronomy 5:21). To covet is to set the heart''s worship on what belongs to another — so the tenth word and the first word meet: covetousness *is idolatry,* the inward idol of the grasping heart. Paul does not abolish the commandment; he uncovers how deep it cuts, for it is *for which things'' sake the wrath of Elohim (God) cometh on the children of disobedience* (Colossians 3:6). The Instruction that named the sin at Horeb names it still, and the new man puts it to death.',
       sv.verse_id, ev.verse_id, 'free', 7713
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36',
       E'Put off the old man, put on the new man, renewed after the image (Genesis 1, Ezekiel 36)',
       E'The risen life is a change of garments — the old man stripped off, the new man put on: *Lie not one to another, seeing that ye have put off the old man with his deeds; And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). The new man is not a new kind of creature but the original restored: *after the image of him that created him* reaches back to *Let us make man in our image, after our likeness* (Genesis 1:26) and *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27). The image defaced at the fall is renewed *in knowledge* — the very thing lost in Eden given again. And the renewing is not a human resolve but the covenant gift Ezekiel promised the regathered house: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The old man with his deeds is put off because the stony heart is taken away; the new man is the heart of flesh. The twin letter says the same, written the same hour: *put off... the old man, which is corrupt according to the deceitful lusts* (Ephesians 4:22) and *put on the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24). The new man is the Creator''s own image set right in those who are risen with the Messiah — Genesis 1''s likeness recovered, Ezekiel 36''s new heart given.',
       sv.verse_id, ev.verse_id, 'free', 7716
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3',
       E'Neither Greek nor Yahudi (Jew): Messiah is all, and in all — the one body (Galatians 3)',
       E'In the new man the old divisions fall away: *Where there is neither Greek nor Yahudi (Jew), circumcision nor uncircumcision, Barbarian, Scythian, bond nor free: but Messiah (Christ) is all, and in all* (Colossians 3:11). Paul says it again in the same shape to the Galatians: *There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). This is not the erasure of Yashar''el (Israel) nor the cancelling of her calling — it is the one regathered body, the grafted-in seed of the nations joined into the commonwealth of Yashar''el (Israel), every wall of separation thrown down so that *Messiah (Christ) is all, and in all.* The two houses and the nations are made one new man in him; the distinctions that once divided no longer rank or separate, because the Messiah fills all and is in all. The renewed humanity of Colossians 3:10 is a single body, and its only standing is the Messiah himself.',
       sv.verse_id, ev.verse_id, 'free', 7719
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19',
       E'Forgiving one another, even as Messiah forgave you (Exodus 34, Leviticus 19, Sirach 28)',
       E'The garment of the new man is mercy: *Put on therefore, as the elect of Elohim (God), holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering; Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:12-13). The character the saints put on is the character Yahuah (LORD) proclaimed of himself: *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6), the One *forgiving iniquity and transgression and sin* (Exodus 34:7). To forgive *even as Messiah (Christ) forgave you* is to forgive even as Yahuah (LORD) himself forgives. And the Torah already commanded it: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — so *above all these things put on charity, which is the bond of perfectness* (Colossians 3:14). The fathers'' wisdom taught the same binding of forgiveness given to forgiveness received: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Sirach 28:2), and *remember the commandments, and bear no malice to your neighbour* (Sirach 28:7). Yahusha (Jesus) sealed it: *if ye forgive men their trespasses, your heavenly Father will also forgive you* (Matthew 6:14), and the unmerciful servant who would not release his brother''s small debt was himself delivered to the tormentors — *So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses* (Matthew 18:35). The twin letter says it once more: *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* (Ephesians 4:32). The whole library holds one law of mercy — the forgiven heart forgives; the one released from his own debt by the Messiah cannot bind his brother in the quarrel.',
       sv.verse_id, ev.verse_id, 'extras', 7722
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5',
       E'Children, obey your parents: the fifth word affirmed (Exodus 20, Deuteronomy 5)',
       E'The household order Paul sets in the assembly is the Torah''s order kept: *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20). The obedience that is *well pleasing unto Yahuah (Lord)* is the keeping of the fifth word: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12), repeated at the covenant renewal, *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee... that it may go well with thee* (Deuteronomy 5:16). Paul does not set the commandment aside; he presses it home — and the twin letter makes the link explicit: *Children, obey your parents in Yahuah (Lord): for this is right. Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:1-2). The household codes of Colossians 3:18-25 and Ephesians 5:22-6:9 are one teaching, the Instruction''s order of wives and husbands, children and fathers, servants and masters kept in the believing home. The child who honours father and mother is doing the very thing Yahuah (LORD) commanded at Sinai, the commandment that still carries its promise.',
       sv.verse_id, ev.verse_id, 'free', 7725
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* the enthronement of the Formed Son; *Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house... nor any thing that is thy neighbour''s* the tenth word; *covetousness, which is idolatry* (Colossians 3:5), the grasping heart''s idol.'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:21 — *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house... or any thing that is thy neighbour''s* the tenth word at the covenant renewal; the *evil concupiscence... covetousness, which is idolatry* mortified (Colossians 3:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness* the creation image; *the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *in the image of Elohim (God) created he him* the image repeated; *after the image of him that created him,* the marred likeness renewed (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you... I will give you an heart of flesh* the covenant gift behind the renewing; *the new man, which is renewed in knowledge* (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:22 — *put off... the old man, which is corrupt according to the deceitful lusts* the twin letter''s charge; *ye have put off the old man with his deeds* (Colossians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 4:24 — *put on the new man, which after Elohim (God) is created in righteousness and true holiness* the twin letter''s new man; *put on the new man... after the image of him that created him* (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 3:28 — *There is neither Yahudi (Jew) nor Greek... for ye are all one in HaMashiach Yahusha (Christ Jesus)* the one regathered body, not Yashar''el (Israel) erased; *Messiah (Christ) is all, and in all* (Colossians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:6 — *Yahuah (LORD)... merciful and gracious, longsuffering, and abundant in goodness and truth* the character the saints put on; *bowels of mercies, kindness... longsuffering* (Colossians 3:12).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:7 — *forgiving iniquity and transgression and sin* Yahuah (LORD) the forgiver; *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the Torah''s law of mercy; *Forbearing one another, and forgiving one another* (Colossians 3:13), *charity... the bond of perfectness* (Colossians 3:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* the fathers'' wisdom binding forgiveness given to forgiveness received; *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 28:7 — *Remember the commandments, and bear no malice to your neighbour: remember the covenant of the Highest* forgiveness as covenant-keeping; the assembly puts off *malice* (Colossians 3:8) and forgives (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 6:14 — *if ye forgive men their trespasses, your heavenly Father will also forgive you* Yahusha (Jesus) binding the two; the law of the body, *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 18:35 — *if ye from your hearts forgive not every one his brother their trespasses* the unmerciful servant''s warning; the one released from his debt must release his brother''s quarrel (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Ephesians 4:32 — *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* the twin letter''s charge; the same pattern, the forgiveness received the measure of forgiveness given (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land* the fifth word; *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:16 — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee... that it may go well with thee* the fifth word renewed; the obedience *well pleasing unto Yahuah (Lord)* (Colossians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:1 — *Children, obey your parents in Yahuah (Lord): for this is right* the twin letter''s household charge, naming it *the first commandment with promise* (Ephesians 6:2); *Children, obey your parents in all things* (Colossians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
