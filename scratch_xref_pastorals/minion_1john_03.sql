-- ----- fragment: minion_1john_03.sql (S242 1 John 3) -----
-- =====================================================================
-- S242 minion — 1 JOHN 3 (Yochanan Aleph) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 3 (24 verses) — contains ★★★ 3:4 the ANTI-ANTINOMIAN ANCHOR.
-- Tag: j242c3 (temp view _s242_j242c3_lookup).
-- Sort band: floor 10060, step 3 (10060, 10063, 10066, 10069, 10072, 10075, 10078).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 1 John is the test-of-knowing-Him letter, and the test is keeping His
-- commandments. Chapter 3 carries the apostle's own DEFINITION of sin — *sin is the transgression
-- of the law* (3:4) — the anti-antinomian anchor: if the Torah were abolished sin itself would be
-- undefinable, but John defines sin AS law-breaking. The chapter also sets the children of Elohim
-- against the children of the devil by the test of righteousness and brotherly love: Cain who slew
-- his brother (3:11-12, Genesis 4) is the type of the wicked one's seed; hating a brother is murder
-- (3:15, Leviticus 19:17 / Genesis 9:6); love is not word but deed and truth (3:18, the Torah's own
-- open-thine-hand commandment); and we receive what we ask because we KEEP His commandments
-- (3:22-24, Deuteronomy 28). The Torah is the measuring-line throughout.
--
-- ===== 1 John 3 coverage checklist =====
--   v.4  Tanakh: Psalm 119:142 (thy law is the truth), Daniel 9:11 (transgressed thy law)
--        Extras: none warranted   NT: Romans 7:7 (I had not known sin but by the law), Romans 4:15 (where no law is, no transgression)
--   v.9  Tanakh: Genesis 1:11-12 (whose seed is in itself, after his kind)
--        Extras: none warranted   NT: none warranted (the seed-after-his-kind root carries it)
--   v.11-12 Tanakh: Genesis 4:1-2,8,10 (Cain slew Abel; thy brother's blood crieth from the ground)
--        Extras: Wisdom of Solomon 10:3 (the unrighteous... murdered his brother), Jubilees 4:1-4 (Cain slew Abel; his blood cried from the ground)
--        NT: John 8:44 (your father the devil, a murderer from the beginning), Jude 11 (the way of Cain)
--   v.15 Tanakh: Leviticus 19:17 (thou shalt not hate thy brother in thine heart), Genesis 9:6 (whoso sheddeth man's blood)
--        Extras: none warranted   NT: none warranted (the Torah root carries it)
--   v.18 Tanakh: Proverbs 3:27-28 (withhold not good), Isaiah 58:7 (deal thy bread to the hungry), Deuteronomy 15:7-8,11 (open thine hand wide to thy poor brother)
--        Extras: none warranted   NT: none warranted
--   v.22-24 Tanakh: Deuteronomy 28:1-2 (if thou hearken... all these blessings shall overtake thee), Psalm 145:18-19 (nigh unto all that call... will fulfil the desire of them that fear him)
--        Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9     [Tanakh + NT]  10060
--   1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1         [Tanakh]       10063
--   1-john-3-not-as-cain-who-slew-his-brother-genesis-4                 [Tanakh+extras+NT] 10066
--   1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9  [Tanakh] 10069
--   1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58  [Tanakh] 10072
--   1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145    [Tanakh] 10075
-- =====================================================================

-- ----- temp view -----
CREATE TEMP VIEW _s242_j242c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----- cross_references -----
INSERT INTO cross_references (source_verse_id, target_verse_id, tier_required, note, source)
SELECT sv.verse_id, tv.verse_id, i.tier::content_tier, i.note, 'manual'
  FROM (VALUES
    -- 3:4 sin is the transgression of the law
    ('canon','1-john',3,4,'canon','psalms',119,142,'free',
      E'*Thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142). The apostle''s definition — *sin is the transgression of the law* (1 John 3:4) — stands on this: the Torah is the truth and the everlasting measure, so its violation is exactly what sin is.'),
    ('canon','1-john',3,4,'canon','daniel',9,11,'free',
      E'*Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us* (Daniel 9:11). Daniel names sin in the same terms John does — to sin is to have *transgressed thy law*; *sin is the transgression of the law* (1 John 3:4).'),
    ('canon','1-john',3,4,'canon','romans',7,7,'free',
      E'*Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). Paul says the very same thing John does: sin is known only by the law, for *sin is the transgression of the law* (1 John 3:4) — the Torah is what defines it.'),
    ('canon','1-john',3,4,'canon','romans',4,15,'free',
      E'*Because the law worketh wrath: for where no law is, there is no transgression* (Romans 4:15). The corollary of John''s definition: if the law were abolished there would be no transgression and so no sin to name; but John defines *sin is the transgression of the law* (1 John 3:4), and so the law still stands.'),
    -- 3:9 born of Elohim, his seed remaineth
    ('canon','1-john',3,9,'canon','genesis',1,11,'free',
      E'*And Elohim (God) said, Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself, upon the earth: and it was so* (Genesis 1:11). The Father''s seed is in itself and brings forth after his kind from the beginning — so John can say of the one born of Elohim that *his seed remaineth in him: and he cannot sin, because he is born of Elohim* (1 John 3:9).'),
    ('canon','1-john',3,9,'canon','genesis',1,12,'free',
      E'*And the earth brought forth grass, and herb yielding seed after his kind, and the tree yielding fruit, whose seed was in itself, after his kind: and Elohim (God) saw that it was good* (Genesis 1:12). The seed reproduces only after its kind — the creation-law John draws on: the one *born of Elohim (God) doth not commit sin; for his seed remaineth in him* (1 John 3:9), bearing the Father''s righteous kind.'),
    -- 3:11-12 not as Cain
    ('canon','1-john',3,12,'canon','genesis',4,1,'free',
      E'*And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD)* (Genesis 4:1). This is the Cain John names — *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12) — the firstborn of Adam whose works became evil.'),
    ('canon','1-john',3,12,'canon','genesis',4,2,'free',
      E'*And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground* (Genesis 4:2). Abel is the righteous brother whose blood Cain shed; *wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','genesis',4,8,'free',
      E'*And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him* (Genesis 4:8). This is the slaying John points to — *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','genesis',4,10,'free',
      E'*And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The blood that cried out is the testimony of the first murder; John holds it up as the type of the world that hates the righteous — *Not as Cain... and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'apocrypha','the-wisdom-of-solomon',10,3,'extras',
      E'*But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3). The Hebrew library remembered Cain the same way John does — the unrighteous man who in his anger *murdered his brother*; *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'jubilees','jubilees',4,2,'extras',
      E'*And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2). Jubilees names the cause John names — the offering rejected, the works evil; *Because his own works were evil, and his brother''s righteous* (1 John 3:12).'),
    ('canon','1-john',3,12,'jubilees','jubilees',4,3,'extras',
      E'*And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3). The library carries Genesis'' crying blood forward; the slain brother''s blood cried out — the murder John sets as the world''s pattern, *Not as Cain... and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','john',8,44,'free',
      E'*Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning... When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The Gospel twin: the murderer from the beginning is the wicked one whose child Cain was; *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','jude',1,11,'free',
      E'*Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 11). Jude names *the way of Cain* as the path of the lost, exactly as John holds Cain up as the type to flee — *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    -- 3:15 hateth his brother is a murderer
    ('canon','1-john',3,15,'canon','leviticus',19,17,'free',
      E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Torah forbids the hatred John equates with murder; *Whosoever hateth his brother is a murderer* (1 John 3:15) — the apostle reads the heart-hatred Leviticus names as already the act.'),
    ('canon','1-john',3,15,'canon','genesis',9,6,'free',
      E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). Murder is the crime against the image of Elohim from of old; John presses it inward — *Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him* (1 John 3:15).'),
    -- 3:18 love in deed and truth
    ('canon','1-john',3,18,'canon','deuteronomy',15,7,'free',
      E'*If there be among you a poor man of one of thy brethren within any of thy gates... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). John''s rebuke — he who *shutteth up his bowels of compassion* from a needy brother (1 John 3:17) — is Moses'' shut hand and hardened heart; love is *in deed and in truth* (1 John 3:18), the open hand the Torah commands.'),
    ('canon','1-john',3,18,'canon','deuteronomy',15,8,'free',
      E'*But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth* (Deuteronomy 15:8). The opened hand is love made deed; *let us not love in word, neither in tongue; but in deed and in truth* (1 John 3:18).'),
    ('canon','1-john',3,18,'canon','deuteronomy',15,11,'free',
      E'*For the poor shall never cease out of the land: therefore I command thee... Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The Torah commands love that acts toward the needy brother — the very love John demands *in deed and in truth* (1 John 3:18).'),
    ('canon','1-john',3,18,'canon','isaiah',58,7,'free',
      E'*Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). The fast Yahuah chose is love enacted toward a brother in need — not love in word but *in deed and in truth* (1 John 3:18).'),
    ('canon','1-john',3,18,'canon','proverbs',3,27,'free',
      E'*Withhold not good from them to whom it is due, when it is in the power of thine hand to do it* (Proverbs 3:27). When it is in thy hand to do good, do it — not love in word but in deed; *let us not love in word, neither in tongue; but in deed and in truth* (1 John 3:18).'),
    -- 3:22-24 we receive because we keep his commandments
    ('canon','1-john',3,22,'canon','deuteronomy',28,1,'free',
      E'*And it shall come to pass, if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth* (Deuteronomy 28:1). The blessing follows the kept commandment, as John says — *whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22).'),
    ('canon','1-john',3,22,'canon','deuteronomy',28,2,'free',
      E'*And all these blessings shall come on thee, and overtake thee, if thou shalt hearken unto the voice of Yahuah Elohayka (the LORD thy God)* (Deuteronomy 28:2). The blessings overtake the obedient; John''s answered prayer rests on the same hinge — *we receive of him, because we keep his commandments, and do those things that are pleasing in his sight* (1 John 3:22).'),
    ('canon','1-john',3,22,'canon','psalms',145,18,'free',
      E'*Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* (Psalm 145:18). He is near to the one who calls in truth and keeps His way; *he that keepeth his commandments dwelleth in him, and he in him* (1 John 3:24).'),
    ('canon','1-john',3,22,'canon','psalms',145,19,'free',
      E'*He will fulfil the desire of them that fear him: he also will hear their cry, and will save them* (Psalm 145:19). The fearers who keep His commandments have their desire fulfilled — *whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s242_j242c3_lookup sv
    ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c3_lookup tv
    ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9',
       E'Sin is the transgression of the law (Psalm 119, Daniel 9)',
       E'Here the apostle gives the plainest definition of sin in all the New Testament, and it is the Torah: *Whosoever committeth sin transgresseth also the law: for sin is the transgression of the law* (1 John 3:4). To sin is to break the law — *hē anomia,* lawlessness. This is not a vague new-covenant feeling of wrongness; it is measured against the commandment, for *thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142). The Torah is the truth and the everlasting measure, so its violation is exactly what sin is. Daniel confessed in the same terms: *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us* (Daniel 9:11) — to sin is to have transgressed the law. Paul says it no differently: *I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7) — sin is known only by the law that names it. And the corollary closes the door on antinomianism: *for where no law is, there is no transgression* (Romans 4:15). If the Torah were abolished, there would be no transgression and so no sin left to define — but John defines sin AS law-breaking, which means the law still stands as the measuring-line of righteousness. This is the anti-antinomian anchor of the whole library set in apostolic ink: the Torah still defines what sin is, and the one born of Elohim is the one who does not transgress it.',
       sv.verse_id, ev.verse_id, 'free', 10060
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1',
       E'Born of Elohim, his seed remaineth in him (Genesis 1)',
       E'*Whosoever is born of Elohim (God) doth not commit sin; for his seed remaineth in him: and he cannot sin, because he is born of Elohim (God)* (1 John 3:9). John reaches back to the creation-law of the seed: *Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself* (Genesis 1:11), *and the earth brought forth... whose seed was in itself, after his kind: and Elohim (God) saw that it was good* (Genesis 1:12). The seed reproduces only after its kind — the Father''s righteous kind in the one begotten of Him. The one born of Elohim cannot make a practice of sin, because the abiding seed bears the Father''s nature, even as the herb brings forth after its kind from the beginning. The new birth is not lawlessness loosed but the Father''s own righteous seed remaining and bearing its kind.',
       sv.verse_id, ev.verse_id, 'free', 10063
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-not-as-cain-who-slew-his-brother-genesis-4',
       E'Not as Cain, who slew his brother (Genesis 4)',
       E'*For this is the message that ye heard from the beginning, that we should love one another. Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:11-12). John holds up the first murder as the type of the world that hates the righteous. The whole library keeps the account. Genesis tells it: *And Adam knew Eve his wife; and she conceived, and bare Cain* (Genesis 4:1); *and she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground* (Genesis 4:2); *and Cain talked with Abel his brother... and slew him* (Genesis 4:8); and the cry that John''s readers heard echoed in their own day — *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The Hebrew library remembered him the same way: *but when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3); and Jubilees names the cause John names — *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2), *and he slew him in the field: and his blood cried from the ground to heaven* (Jubilees 4:3). The works were evil, the brother''s righteous — that is why he slew him. And the Gospel names the father behind the deed: *Ye are of your father the devil... He was a murderer from the beginning* (John 8:44) — Cain *was of that wicked one.* Jude seals it: *Woe unto them! for they have gone in the way of Cain* (Jude 11). The world that hates the children of Elohim walks the way of Cain; the children of Elohim are known by the opposite — they love one another in deed, the message heard from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 10066
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9',
       E'Whosoever hateth his brother is a murderer (Leviticus 19, Genesis 9)',
       E'*Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him* (1 John 3:15). John reads the heart, and the Torah already forbade the hatred there: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The hatred Leviticus names in the heart John names as already murder — the inward root of the outward crime. And murder itself is the ancient crime against the image of Elohim: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). To hate a brother is to assail the image of Elohim in him; the one who does so has no eternal life abiding in him, for he has set himself against the very commandment that is the measuring-line of fellowship.',
       sv.verse_id, ev.verse_id, 'free', 10069
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58',
       E'Let us love not in word but in deed and in truth (Deuteronomy 15, Isaiah 58)',
       E'*But whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him? My little children, let us not love in word, neither in tongue; but in deed and in truth* (1 John 3:17-18). The love John demands is the open hand the Torah commanded. Moses set it plainly: *If there be among you a poor man of one of thy brethren... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7) — the very shut hand and hardened heart John rebukes — *but thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need* (Deuteronomy 15:8), *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* (Deuteronomy 15:11). Isaiah named the fast Yahuah chose in the same deeds: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). And the wise man said, *Withhold not good from them to whom it is due, when it is in the power of thine hand to do it* (Proverbs 3:27). Love that is only word and tongue is no love; the love that proves the children of Elohim is love enacted toward the brother in need — the Torah''s open hand made deed and truth.',
       sv.verse_id, ev.verse_id, 'free', 10072
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145',
       E'We receive because we keep his commandments (Deuteronomy 28, Psalm 145)',
       E'*And whatsoever we ask, we receive of him, because we keep his commandments, and do those things that are pleasing in his sight... And he that keepeth his commandments dwelleth in him, and he in him* (1 John 3:22,24). Answered prayer and abiding fellowship hang on the kept commandment — the Torah''s own hinge. Moses set the blessing after obedience: *if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth* (Deuteronomy 28:1), *And all these blessings shall come on thee, and overtake thee, if thou shalt hearken* (Deuteronomy 28:2). The Psalm names the nearness John promises: *Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* (Psalm 145:18), *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them* (Psalm 145:19). The one who fears Him and keeps His commandments has the answered prayer, the fulfilled desire, the abiding presence. John does not loose obedience from blessing — he welds them, exactly as the Torah does.',
       sv.verse_id, ev.verse_id, 'free', 10075
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:142 — *thy righteousness is an everlasting righteousness, and thy law is the truth* the Torah is the truth and the everlasting measure; *sin is the transgression of the law* (1 John 3:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=142
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:11 — *all Yashar''el (Israel) have transgressed thy law... therefore the curse is poured upon us* Daniel names sin as transgressing the law; *sin is the transgression of the law* (1 John 3:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 7:7 — *I had not known sin, but by the law... except the law had said, Thou shalt not covet* sin is known only by the law that names it; *sin is the transgression of the law* (1 John 3:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:15 — *where no law is, there is no transgression* if the law were abolished no transgression could be named; but *sin is the transgression of the law* (1 John 3:4), so the law stands.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:11 — *the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself* the creation-law of the seed after its kind; *his seed remaineth in him: and he cannot sin, because he is born of Elohim* (1 John 3:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:12 — *whose seed was in itself, after his kind: and Elohim (God) saw that it was good* the seed reproduces only after its kind; the one born of Elohim bears the Father''s righteous kind (1 John 3:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-not-as-cain-who-slew-his-brother-genesis-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:1 — *she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD)* the firstborn of Adam John names; *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:2 — *Abel was a keeper of sheep, but Cain was a tiller of the ground* the righteous brother whose blood was shed; *Because his own works were evil, and his brother''s righteous* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:8 — *Cain rose up against Abel his brother, and slew him* the slaying John points to; *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:10 — *the voice of thy brother''s blood crieth unto me from the ground* the cry of the first murder, type of the world that hates the righteous (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 10:3 — *the unrighteous went away from her in his anger... the fury with which he murdered his brother* the Hebrew library''s memory of Cain; *Not as Cain... and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 4:2 — *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* the rejected offering, the evil works; *Because his own works were evil, and his brother''s righteous* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Jubilees 4:3 — *he slew him in the field: and his blood cried from the ground to heaven* the library carries Genesis'' crying blood forward (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'John 8:44 — *Ye are of your father the devil... He was a murderer from the beginning* the wicked one whose child Cain was; *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Jude 11 — *they have gone in the way of Cain* Jude names the way of Cain as the path of the lost, the type John bids us flee (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart* the Torah forbids the heart-hatred John reads as already murder; *Whosoever hateth his brother is a murderer* (1 John 3:15).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* murder is the crime against the image of Elohim; to hate a brother is to assail it (1 John 3:15).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:7 — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* the very shut hand John rebukes; *let us not love in word... but in deed and in truth* (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:8 — *thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need* the opened hand is love made deed (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 15:11 — *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* the Torah commands love that acts toward the needy brother (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 58:7 — *deal thy bread to the hungry... when thou seest the naked, that thou cover him* the fast Yahuah chose is love enacted toward a brother in need; *in deed and in truth* (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 3:27 — *Withhold not good from them to whom it is due, when it is in the power of thine hand to do it* when it is in thy hand to do good, do it — not love in word (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:1 — *if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments* the blessing follows the kept commandment; *we receive of him, because we keep his commandments* (1 John 3:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:2 — *all these blessings shall come on thee, and overtake thee, if thou shalt hearken* the blessings overtake the obedient; the same hinge of answered prayer (1 John 3:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 145:18 — *Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* the nearness John promises to the commandment-keeper; *he that keepeth his commandments dwelleth in him* (1 John 3:24).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 145:19 — *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them* the fearers who keep His commandments have their desire fulfilled; *whatsoever we ask, we receive of him* (1 John 3:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
