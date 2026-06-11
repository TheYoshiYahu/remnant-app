-- ----- fragment: minion_1corinthians_01.sql (S228 1 Corinthians 1) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 1 (31 verses) — the foolishness of the cross and the wisdom of Elohim.
-- Tag: co01 (temp view _s228_co01_lookup).
-- Sort band: floor 6600, step 3 (6600, 6603, 6606 used; under 6625).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul writes to a divided, fleshly assembly of called-out ones — Israel and the
-- grafted-in seed gathered at Corinth, the scattered seed gathered home, NOT a church that replaced
-- Israel. The chapter sets the cross — *Messiah (Christ) crucified* — against the wisdom of the world.
-- The boast that is excluded is the FLESH-CREDENTIAL boast (wisdom, status, party-loyalty *I am of
-- Paul... of Apollos*), not Torah-keeping; the only glory left is in Yahuah. *I will destroy the
-- wisdom of the wise* (1:19) cites Isaiah 29:14 verbatim; *He that glorieth, let him glory in Yahuah
-- (Lord)* (1:31) cites Jeremiah 9:23-24. Where Paul quotes the Tanakh YHWH text the pull renders the
-- citation *Yahuah (Lord)* (1:31); preserved exactly. The world by wisdom *knew not Elohim* (1:21) is
-- the very blindness the Hebrew library names in Wisdom of Solomon 2:21-22; the true wisdom is the
-- fear of Yahuah and the keeping of the commandments (Sirach 1). Messiah is *the power of Elohim, and
-- the wisdom of Elohim* (1:24) — the Formed in whom the wisdom of Elohim is made ours.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-9   greeting, thanksgiving, called to be saints, waiting for the coming of the Lord Yahusha
--           Tanakh: none warranted (the greeting is letter-frame, no load-bearing root)
--           Extras: none warranted   NT: none warranted (carried in later threads)
--   v.10-16 no divisions; I am of Paul, of Apollos, of Cephas, of Messiah; is Messiah divided
--           Tanakh: none warranted (party-loyalty as flesh-credential is folded into the no-flesh-
--                   glory thread at v.26-31; no verbatim Tanakh root for the division itself)
--           Extras: none warranted   NT: none warranted
--   v.17-25 the preaching of the cross; I will destroy the wisdom of the wise; Messiah the power and
--           wisdom of Elohim; the foolishness of Elohim wiser than men  [CENTERPIECE]
--           Tanakh: Isaiah 29:14 (the wisdom of their wise men shall perish — cited at 1:19),
--                   Isaiah 29:13 (their fear toward me is taught by the precept of men),
--                   Isaiah 33:18 (where is the scribe? where is the receiver?)
--           Extras: Sirach 1:1,14,26 (all wisdom comes from Yahuah; the fear of Yahuah the beginning
--                   of wisdom; keep the commandments and he shall give her), Wisdom 1:1-3 (the world's
--                   froward thoughts that reprove the unwise)   NT: none warranted (Christology in prose)
--   v.20-21 hath not Elohim made foolish the wisdom of this world; the world by wisdom knew not Elohim
--           Tanakh: Isaiah 29:14 (carried at v.19); Isaiah 44:25 (turneth wise men backward)
--           Extras: Wisdom 2:21-22 (their own wickedness blinded them; the mysteries of Yahuah they
--                   knew not), Wisdom 2:1-9 (the ungodly's reasoning, crown ourselves with rosebuds)
--           NT: none warranted
--   v.26-31 not many wise after the flesh called; that no flesh should glory; he that glorieth, let
--           him glory in Yahuah
--           Tanakh: Jeremiah 9:23-24 (let not the wise man glory in his wisdom... but in this, that he
--                   knoweth me — cited at 1:31)
--           Extras: none warranted (the flesh-credential boast carried by Jeremiah 9)   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6600 1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29   (Tanakh + Extras)  [CENTERPIECE]
--   6603 1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2  (Tanakh + Extras)
--   6606 1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29  [CENTERPIECE]
  ('canon', '1-corinthians', 1, 19, 'canon', 'isaiah', 29, 14, 'free', E'*Therefore, behold, I will proceed to do a marvellous work among this people, even a marvellous work and a wonder: for the wisdom of their wise men shall perish, and the understanding of their prudent men shall be hid.* (Isaiah 29:14). This is the very word Paul cites: *For it is written, I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent* (1 Corinthians 1:19). Yahuah (LORD) promised in Isaiah that the wisdom of the wise men of his people would perish before his marvellous work; Paul reads the cross of Messiah (Christ) as that marvellous work — the wisdom of the world undone by what the world calls foolishness. The destroying of the wise is not new in the gospel; it is the promised act of Yahuah (LORD), now accomplished in the crucified Messiah.'),
  ('canon', '1-corinthians', 1, 20, 'canon', 'isaiah', 29, 13, 'free', E'*Wherefore Yahuah (Lord) said, Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men:* (Isaiah 29:13). Just before Yahuah (LORD) promises to confound the wise, he names their fault: a wisdom of the lips that is only *the precept of men.* So Paul asks, *Where is the wise? where is the scribe? where is the disputer of this world? hath not Elohim (God) made foolish the wisdom of this world?* (1 Corinthians 1:20). The man-taught wisdom Isaiah indicts is the very wisdom Elohim (God) has made foolish — the disputers of this world, drawing near with the mouth while the heart is far off, are confounded by the cross.'),
  ('canon', '1-corinthians', 1, 20, 'canon', 'isaiah', 33, 18, 'free', E'*Thine heart shall meditate terror. Where is the scribe? where is the receiver? where is he that counted the towers?* (Isaiah 33:18). Isaiah''s taunt over the overthrown wisdom of the world — *Where is the scribe?* — is the very form of Paul''s question: *Where is the wise? where is the scribe? where is the disputer of this world?* (1 Corinthians 1:20). When Yahuah (LORD) acts, the counters and scribes of the proud power vanish; Paul takes up the prophet''s mocking refrain and turns it on the wisdom of this world, which the cross has made foolish.'),
  ('canon', '1-corinthians', 1, 24, 'apocrypha', 'ecclesiasticus', 1, 1, 'extras', E'*All wisdom comes from Yahuah (God), and is with him for ever.* (Sirach 1:1). The Hebrew library holds that wisdom is not the world''s to win but Yahuah''s (God''s) to give, *with him for ever.* Paul names where that wisdom is now found: *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24). The wisdom that *comes from Yahuah (God)* is the Formed Messiah himself — not a wisdom of words the wise of the world can reach, but the crucified One in whom the wisdom of Elohim (God) is made the possession of the called.'),
  ('canon', '1-corinthians', 1, 25, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Sirach 1:14). The restored library names the true wisdom against the wisdom of the world: not the cleverness of the disputer but *the fear of Yahuah (God).* So Paul declares *the foolishness of Elohim (God) is wiser than men; and the weakness of Elohim (God) is stronger than men* (1 Corinthians 1:25). What the world counts foolish — the fear of Yahuah (God), the cross — is the beginning of the only wisdom; the wisdom of men is overturned by the wisdom that fears him.'),
  ('canon', '1-corinthians', 1, 30, 'apocrypha', 'ecclesiasticus', 1, 26, 'extras', E'*If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you.* (Sirach 1:26). The library binds wisdom to the keeping of the commandments — wisdom is given, not seized by the wise of the world. And Paul says of the called, *But of him are ye in HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30). The wisdom Sirach says Yahuah (God) gives to them that keep his commandments is made ours in the Messiah; the wisdom of Elohim (God) is no flesh-credential earned but the gift of the Father in his Son.'),
  -- thread: 1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2
  ('canon', '1-corinthians', 1, 21, 'apocrypha', 'the-wisdom-of-solomon', 2, 22, 'extras', E'*As for the mysteries of Yahuah (God), they knew them not: neither hoped they for the wages of righteousness, nor discerned a reward for blameless souls.* (Wisdom of Solomon 2:22). The Hebrew library says of the ungodly that, for all their reasoning, *the mysteries of Yahuah (God), they knew them not.* This is precisely Paul''s diagnosis: *after that in the wisdom of Elohim (God) the world by wisdom knew not Elohim (God)* (1 Corinthians 1:21). The world''s wisdom, left to itself, does not arrive at Elohim (God); the mysteries are hidden from it. So *it pleased Elohim (God) by the foolishness of preaching to save them that believe* — the knowing comes not by the world''s wisdom but by the proclaimed cross.'),
  ('canon', '1-corinthians', 1, 20, 'apocrypha', 'the-wisdom-of-solomon', 2, 21, 'extras', E'*Such things they did imagine, and were deceived: for their own wickedness has blinded them.* (Wisdom of Solomon 2:21). The library names the root of the world''s false wisdom: the ungodly *were deceived; for their own wickedness has blinded them.* Their cleverness is blindness. So Paul asks, *hath not Elohim (God) made foolish the wisdom of this world?* (1 Corinthians 1:20). The wisdom of this world, self-blinded by its own wickedness, is the very thing Elohim (God) has shown to be folly; the disputer who imagines himself wise is the deceived man of the library.'),
  ('canon', '1-corinthians', 1, 18, 'apocrypha', 'the-wisdom-of-solomon', 2, 1, 'extras', E'*For the ungodly said, reasoning with themselves, but not aright, Our life is short and tedious, and in the death of a man there is no remedy: neither was there any man known to have returned from the grave.* (Wisdom of Solomon 2:1). The library gives the voice of the world''s wisdom — the ungodly *reasoning with themselves, but not aright,* who count death final and *crown ourselves with rosebuds* (Wisdom of Solomon 2:8). To such reasoning *the preaching of the cross is to them that perish foolishness; but unto us which are saved it is the power of Elohim (God)* (1 Corinthians 1:18). The cross — death undone, the One who returned from the grave — is foolishness to the very wisdom that said no man comes again; it is the power of Elohim (God) to them that are saved.'),
  -- thread: 1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9
  ('canon', '1-corinthians', 1, 31, 'canon', 'jeremiah', 9, 24, 'free', E'*But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth: for in these things I delight, saith Yahuah (LORD).* (Jeremiah 9:24). This is the word Paul cites to close the chapter: *That, according as it is written, He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31). The only glorying left to flesh is the glorying in Yahuah (LORD) himself — to know him, who delights in lovingkindness, judgment, and righteousness. Not wisdom, not might, not riches; the knowing of Yahuah (LORD) is the whole boast.'),
  ('canon', '1-corinthians', 1, 29, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). Yahuah (LORD) forbids the three boasts of the flesh — wisdom, might, riches. Paul says the same of the calling of the assembly: *not many wise men after the flesh, not many mighty, not many noble, are called* (1 Corinthians 1:26), *That no flesh should glory in his presence* (1 Corinthians 1:29). The wise, the mighty, the noble — the very credentials Jeremiah names — are excluded from glorying; Elohim (God) chose the foolish and weak things that no flesh should boast before him.'),
  ('canon', '1-corinthians', 1, 26, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). The three flesh-credentials Yahuah (LORD) forbids — wisdom, might, riches — are the very ones Paul says the calling passes over: *ye see your calling, brethren, how that not many wise men after the flesh, not many mighty, not many noble, are called* (1 Corinthians 1:26). Elohim (God) does not call by the boasts of the flesh; the wise and mighty and noble are not the ground of the calling, that the glory may be his alone.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29',
       E'The foolishness of the cross and the wisdom of Elohim (God) (Isaiah 29)',
       E'Paul sets the cross against the wisdom of the world: *the preaching of the cross is to them that perish foolishness; but unto us which are saved it is the power of Elohim (God)* (1 Corinthians 1:18). And he grounds the overthrow of the world''s wisdom in the prophet: *For it is written, I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent* (1 Corinthians 1:19) — a verbatim citation of Yahuah (LORD)''s word in Isaiah, *I will proceed to do a marvellous work among this people, even a marvellous work and a wonder: for the wisdom of their wise men shall perish, and the understanding of their prudent men shall be hid* (Isaiah 29:14). The destroying of the wise is no novelty of the gospel; it is the promised marvellous work of Yahuah (LORD), now accomplished in the crucified Messiah. Isaiah had named the fault of that wisdom — *their fear toward me is taught by the precept of men* (Isaiah 29:13) — and so Paul mocks it: *Where is the wise? where is the scribe? where is the disputer of this world? hath not Elohim (God) made foolish the wisdom of this world?* (1 Corinthians 1:20), taking up the prophet''s own taunt, *Where is the scribe? where is the receiver?* (Isaiah 33:18). The world by wisdom does not reach Elohim (God); but to the called the cross is *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24), for *the foolishness of Elohim (God) is wiser than men; and the weakness of Elohim (God) is stronger than men* (1 Corinthians 1:25). The Hebrew library had already taught where the true wisdom lies: *All wisdom comes from Yahuah (God), and is with him for ever* (Sirach 1:1); *To fear Yahuah (God) is the beginning of wisdom* (Sirach 1:14); *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26). Wisdom is no flesh-credential seized by the disputer but the gift of the Father — and it is made ours in the Formed Messiah, *who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30). What the world calls foolish, the cross and the fear of Yahuah (LORD), is the only true wisdom.',
       sv.verse_id, ev.verse_id, 'extras', 6600
  FROM _s228_co01_lookup sv, _s228_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2',
       E'The world by wisdom knew not Elohim (God) — the ungodly blinded (Wisdom of Solomon 2)',
       E'*For after that in the wisdom of Elohim (God) the world by wisdom knew not Elohim (God), it pleased Elohim (God) by the foolishness of preaching to save them that believe* (1 Corinthians 1:21). The world''s own wisdom does not arrive at Elohim (God) — and the Hebrew library had already diagnosed exactly why. The ungodly reason *with themselves, but not aright, Our life is short and tedious, and in the death of a man there is no remedy: neither was there any man known to have returned from the grave* (Wisdom of Solomon 2:1), and so they say, *let us crown ourselves with rosebuds, before they be withered* (Wisdom of Solomon 2:8). To such reasoning the cross — death undone, the One who did return from the grave — is folly: *the preaching of the cross is to them that perish foolishness; but unto us which are saved it is the power of Elohim (God)* (1 Corinthians 1:18). The library names the root of this false wisdom: *Such things they did imagine, and were deceived: for their own wickedness has blinded them* (Wisdom of Solomon 2:21) — their cleverness is blindness, which is why Paul asks, *hath not Elohim (God) made foolish the wisdom of this world?* (1 Corinthians 1:20). And it names the end of it: *As for the mysteries of Yahuah (God), they knew them not* (Wisdom of Solomon 2:22) — the very thing Paul says, that the world by wisdom *knew not Elohim (God).* The knowing of Elohim (God) does not come by the disputer''s wisdom, self-blinded by its own wickedness, but by the foolishness of the preached cross, the power of Elohim (God) to them that are saved.',
       sv.verse_id, ev.verse_id, 'extras', 6603
  FROM _s228_co01_lookup sv, _s228_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9',
       E'That no flesh should glory — let him glory in Yahuah (LORD) (Jeremiah 9)',
       E'The chapter closes on the boast that is excluded and the only boast that remains. Elohim (God) chose *the foolish things of the world to confound the wise... and base things of the world, and things which are despised* (1 Corinthians 1:27-28), *That no flesh should glory in his presence* (1 Corinthians 1:29). The calling itself passes over the flesh-credentials: *ye see your calling, brethren, how that not many wise men after the flesh, not many mighty, not many noble, are called* (1 Corinthians 1:26). This is the very three-fold boast Yahuah (LORD) forbade through Jeremiah: *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* (Jeremiah 9:23) — wisdom, might, riches, the standing of the flesh, all shut out of glorying before Elohim (God). And Paul ends with the one boast that is left, citing the prophet directly: *That, according as it is written, He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31), from *let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth* (Jeremiah 9:24). The boast excluded is the flesh-credential — wisdom, status, party-loyalty (*I am of Paul... of Apollos*); the boast permitted is the knowing of Yahuah (LORD) himself, who delights in lovingkindness and judgment and righteousness. The whole glory is in him, that no flesh should boast in his presence.',
       sv.verse_id, ev.verse_id, 'free', 6606
  FROM _s228_co01_lookup sv, _s228_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=1 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 29:14 — *the wisdom of their wise men shall perish, and the understanding of their prudent men shall be hid* the marvellous work Yahuah (LORD) promised, cited verbatim: *I will destroy the wisdom of the wise* (1 Corinthians 1:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 29:13 — *their fear toward me is taught by the precept of men* the man-taught wisdom Isaiah indicts; Paul mocks it: *Where is the wise? where is the scribe?* (1 Corinthians 1:20).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 33:18 — *Where is the scribe? where is the receiver?* the prophet''s taunt over the overthrown wisdom of the world, the form of Paul''s question *Where is the wise? where is the scribe?* (1 Corinthians 1:20).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=33 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever* the wisdom no disputer can win, found in *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 1:14 — *To fear Yahuah (God) is the beginning of wisdom* the true wisdom the world counts foolish; *the foolishness of Elohim (God) is wiser than men* (1 Corinthians 1:25).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 1:26 — *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* wisdom the gift, not the flesh-credential; made ours in the Messiah *who of Elohim (God) is made unto us wisdom* (1 Corinthians 1:30).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-foolishness-of-the-cross-and-the-wisdom-of-god-isaiah-29'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 2:1 — *the ungodly said, reasoning with themselves, but not aright... neither was there any man known to have returned from the grave* the world''s wisdom that counts death final, to which *the preaching of the cross... is foolishness* (1 Corinthians 1:18).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 2:21 — *they were deceived: for their own wickedness has blinded them* the root of the world''s false wisdom, which *Elohim (God) hath made foolish* (1 Corinthians 1:20).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:22 — *the mysteries of Yahuah (God), they knew them not* the library''s diagnosis Paul re-speaks: *the world by wisdom knew not Elohim (God)* (1 Corinthians 1:21).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-the-world-by-wisdom-knew-not-god-the-ungodly-blinded-wisdom-of-solomon-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 9:23 — *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* the three flesh-boasts forbidden; *not many wise... not many mighty, not many noble, are called* (1 Corinthians 1:26).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 9:23 — *Let not the wise man glory in his wisdom... let not the rich man glory in his riches* the wise, mighty, noble shut out of glorying; *That no flesh should glory in his presence* (1 Corinthians 1:29).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:24 — *let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD)* the only boast left, cited verbatim: *He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31).'
  FROM cross_reference_threads t, cross_references x, _s228_co01_lookup sv, _s228_co01_lookup tv
 WHERE t.slug='1-corinthians-1-let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=1 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
