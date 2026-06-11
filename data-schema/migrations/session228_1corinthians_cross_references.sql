-- =====================================================================
-- Session 228 — 1 Corinthians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session228_1corinthians_cross_references.sql
-- =====================================================================

\echo 'session228 — 1 Corinthians cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1corinthians_02.sql (S228 1 Corinthians 2) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 2 (16 verses) — the hidden wisdom and the spiritual man.
-- Tag: co02 (temp view _s228_co02_lookup).
-- Sort band: floor 6625, step 3 (6625, 6628, 6631 used; under 6650).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul, having declared the cross the power and wisdom of Elohim (God), now unfolds
-- the WISDOM hidden from the rulers of this age. *We speak the wisdom of Elohim (God) in a mystery,
-- even the hidden wisdom, which Elohim (God) ordained before the world* (2:7) — the wisdom *which
-- none of the princes of this world knew: for had they known it, they would not have crucified Yahuah
-- (Lord) of glory* (2:8). It is *revealed... by his Spirit: for the Spirit searcheth all things, yea,
-- the deep things of Elohim (God)* (2:10). The *natural man* who *receiveth not the things of the
-- Spirit* against *he that is spiritual* is NOT body/soul dualism (no platonic split) — it is the man
-- without the Spirit who cannot DISCERN the revealed wisdom versus the man given the Spirit who can.
-- Two explicit Tanakh citations anchor the chapter: 2:9 cites Isaiah 64:4 (*eye hath not seen... the
-- things which Elohim (God) hath prepared for them that love him*) and 2:16 cites Isaiah 40:13 (*who
-- hath known the mind of Yahuah (Lord)*) — and Paul caps it: *But we have the mind of Messiah
-- (Christ).* NT-Lord rule: 2:16's *mind of Yahuah (Lord)* is the OT YHWH citation (pull renders
-- Yahuah (Lord)); preserve exactly. The richest extras witness is Wisdom of Solomon — the ungodly who
-- *knew not the mysteries of Yahuah (God)* (Wisdom 2:21-22), the souls of the righteous whose *hope is
-- full of immortality* (Wisdom 3:4), and the wisdom *sent from above* that alone discloses the counsel
-- of Elohim (God) (Wisdom 9:13-17); Sirach 1 on wisdom created before all things and *given to them
-- that love him.*
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   not with excellency of speech, but in demonstration of the Spirit and power
--           Tanakh: none warranted (the cross-as-wisdom root carried in ch1's apparatus; v.1-5 is
--                   Paul's manner, not a citation)
--           Extras: none warranted   NT: none warranted
--   v.6-8   the hidden wisdom ordained before the world, which the princes of this world knew not
--           Tanakh: none warranted (Isaiah 64:4 is the v.9 citation, kept in its own thread)
--           Extras: Wisdom 9:13-17 (who hath known the counsel of Yahuah (God)... send thy Ruach
--                   HaKodesh from above), Sirach 1:1-10 (wisdom created before all things, given to
--                   them that love him), Wisdom 2:21-22 (the ungodly knew not the mysteries of Yahuah
--                   (God), wickedness blinded them — the princes who crucified)
--           NT: none warranted (no Tanakh quotation here; the cross is carried in prose)
--   v.9     Eye hath not seen... the things which Elohim (God) hath prepared for them that love him
--           Tanakh: Isaiah 64:4 (since the beginning of the world... neither hath the eye seen, O
--                   Elohim (God), beside thee, what he hath prepared for him that waiteth for him) [CITATION]
--           Extras: Wisdom 3:1-9 (the souls of the righteous... their hope is full of immortality —
--                   the reward the ungodly did not discern)
--           NT: none warranted
--   v.10-13 the Spirit searcheth the deep things of Elohim (God); spiritual things compared
--           Tanakh: none warranted (the searching Spirit is carried in the v.16 mind-of-the-Lord thread)
--           Extras: Wisdom 9:13-17 woven (the counsel of Yahuah (God) known only by the Spirit sent
--                   from above) — folded into the hidden-wisdom thread
--           NT: none warranted
--   v.14-15 the natural man vs the spiritual man — discernment by the Spirit
--           Tanakh: none warranted   Extras: none warranted (no body/soul-dualism root to honor;
--                   forcing one would invite the platonic misreading the frame forbids)
--           NT: none warranted
--   v.16    who hath known the mind of Yahuah (Lord)... But we have the mind of Messiah (Christ)
--           Tanakh: Isaiah 40:13 (Who hath directed the Spirit of Yahuah (LORD), or being his
--                   counsellor hath taught him?) [CITATION]
--           Extras: none warranted (Wisdom 9 carried in the hidden-wisdom thread)
--           NT: Romans 11:34 (For who hath known the mind of Yahuah (Lord)? or who hath been his
--                   counsellor? — Paul citing the same Isaiah 40:13)
--
-- THREADS (slug -> target libraries):
--   6625 1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9   (Extras)
--   6628 1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64  (Tanakh + Extras)
--   6631 1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9
  ('canon', '1-corinthians', 2, 7, 'apocrypha', 'the-wisdom-of-solomon', 9, 13, 'extras', E'*For what man is he that can know the counsel of Yahuah (God)? or who can think what the will of Yahuah (God) is? For the thoughts of mortal men are miserable, and our devices are but uncertain.* (Wisdom of Solomon 9:13-14). The Hebrew library asks the very question Paul answers: man cannot know the counsel of Yahuah (God) by his own thought. So Paul says *we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory* (1 Corinthians 2:7) — a wisdom no *device* of mortal men could reach, hidden until Elohim (God) himself disclosed it.'),
  ('canon', '1-corinthians', 2, 10, 'apocrypha', 'the-wisdom-of-solomon', 9, 17, 'extras', E'*And your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (Wisdom of Solomon 9:17). The library names the only way the counsel of Elohim (God) is ever known: he must *send your Ruach HaKodesh (Holy Spirit) from above.* This is exactly Paul''s claim — *Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* (1 Corinthians 2:10). The deep things no man reaches are searched out by the Spirit sent from above; the hidden wisdom is opened only by the Ruach HaKodesh (Holy Spirit), not by *man''s wisdom.*'),
  ('canon', '1-corinthians', 2, 9, 'apocrypha', 'ecclesiasticus', 1, 10, 'extras', E'*She is with all flesh according to his gift, and he has given her to them that love him.* (Sirach 1:10). Sirach says wisdom is *created before all things* (Sirach 1:4) and *given to them that love him* — and Paul speaks of the hidden wisdom *which Elohim (God) ordained before the world* (1 Corinthians 2:7), the things *which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9). The same two marks meet: wisdom set before the world began, and reserved for *them that love him.* What Sirach names as the gift of the fear of Yahuah (God) is the very wisdom Paul says the rulers of this age could not see.'),
  ('canon', '1-corinthians', 2, 8, 'apocrypha', 'the-wisdom-of-solomon', 2, 22, 'extras', E'*As for the mysteries of Yahuah (God), they knew them not: neither hoped they for the wages of righteousness, nor discerned a reward for blameless souls.* (Wisdom of Solomon 2:22). The ungodly of Wisdom plot against the righteous man because *their own wickedness has blinded them* (Wisdom 2:21) — *the mysteries of Yahuah (God), they knew them not.* Paul says the same of the rulers who crucified the Messiah: the hidden wisdom *none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). The blindness to the mystery is the blindness that condemned the just One; the princes did not know, and so they crucified the Lord of glory.'),
  -- thread: 1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64
  ('canon', '1-corinthians', 2, 9, 'canon', 'isaiah', 64, 4, 'free', E'*For since the beginning of the world men have not heard, nor perceived by the ear, neither hath the eye seen, O Elohim (God), beside thee, what he hath prepared for him that waiteth for him.* (Isaiah 64:4). This is the *as it is written* Paul cites: *Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9). Isaiah''s prophet, longing for Yahuah (LORD) to rend the heavens and come down, confesses that no eye has seen what Elohim (God) prepares for *him that waiteth for him* — and Paul declares those prepared things now revealed by the Spirit to *them that love him,* the hidden wisdom unveiled to the gathered.'),
  ('canon', '1-corinthians', 2, 9, 'apocrypha', 'the-wisdom-of-solomon', 3, 4, 'extras', E'*For though they be punished in the sight of men, yet is their hope full of immortality.* (Wisdom of Solomon 3:4). The library tells what the eye of the ungodly cannot see: *the souls of the righteous are in the hand of Yahuah (God)... their hope is full of immortality* (Wisdom 3:1,4), a reward *the ungodly... neither hoped... nor discerned* (Wisdom 2:22). This is the unseen thing Paul means — *the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9), which *eye hath not seen.* The reward hidden from the world''s wisdom is the immortal hope kept for the righteous, prepared before the world and disclosed by the Spirit.'),
  -- thread: 1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40
  ('canon', '1-corinthians', 2, 16, 'canon', 'isaiah', 40, 13, 'free', E'*Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* (Isaiah 40:13). This is the Tanakh word Paul cites: *For who hath known the mind of Yahuah (Lord), that he may instruct him?* (1 Corinthians 2:16). Isaiah''s question demands the answer *no one* — no man directs the Spirit of Yahuah (LORD) or teaches him. Yet Paul adds the astonishing turn: *But we have the mind of Messiah (Christ).* What no man could know of himself, the gathered are given in the Messiah — not that they instruct Yahuah (Lord), but that by the Spirit they share the very mind of the Formed Son.'),
  ('canon', '1-corinthians', 2, 16, 'canon', 'romans', 11, 34, 'free', E'*For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34). Paul quotes the same Isaiah 40:13 word in Romans, marvelling at *the depth of the riches both of the wisdom and knowledge of Elohim (God)* whose *ways past finding out.* Here in Corinth he cites it again — *who hath known the mind of Yahuah (Lord), that he may instruct him?* (1 Corinthians 2:16) — and answers it from the side of grace: the unsearchable mind no counsellor ever taught is now given to his people, for *we have the mind of Messiah (Christ).* The two passages set the same question; the wisdom hidden in Elohim (God) is opened to those who have the Spirit.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9',
       E'The hidden wisdom ordained before the world, which the princes knew not (Wisdom of Solomon 9, Sirach 1)',
       E'Paul speaks a wisdom that is not of this age: *we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory: Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:7-8). The Hebrew library had already framed this exact mystery. Wisdom of Solomon asks Paul''s question and gives Paul''s answer: *For what man is he that can know the counsel of Yahuah (God)? or who can think what the will of Yahuah (God) is? For the thoughts of mortal men are miserable, and our devices are but uncertain* (Wisdom 9:13-14) — and the only opening of that counsel is from above: *your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (Wisdom 9:17). This is precisely how Paul says the hidden wisdom is reached — *Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* (1 Corinthians 2:10). Sirach adds the two marks of this wisdom: it was *created before all things* and is *given to them that love him* (Sirach 1:4,10) — the same wisdom *ordained before the world* and prepared *for them that love him* (1 Corinthians 2:7,9). And the library names why the rulers missed it: the ungodly, *their own wickedness has blinded them,* for *the mysteries of Yahuah (God), they knew them not* (Wisdom 2:21-22). That blindness to the mystery is the blindness that crucified the just One — *had they known it, they would not have crucified Yahuah (Lord) of glory.* The wisdom of Elohim (God) is no philosophy of the wise but a mystery hidden from the world''s rulers and disclosed by the Ruach HaKodesh (Holy Spirit) to those who love him.',
       sv.verse_id, ev.verse_id, 'extras', 6625
  FROM _s228_co02_lookup sv, _s228_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64',
       E'Eye hath not seen the things prepared for them that love him (Isaiah 64)',
       E'Paul caps the hidden wisdom with a written word: *But as it is written, Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9). The citation is Isaiah''s: *For since the beginning of the world men have not heard, nor perceived by the ear, neither hath the eye seen, O Elohim (God), beside thee, what he hath prepared for him that waiteth for him* (Isaiah 64:4). Isaiah''s prophet, longing for Yahuah (LORD) to *rend the heavens* and *come down,* confesses that no eye, no ear, no heart of man has reached what Elohim (God) prepares for the one who waits on him — and Paul declares those prepared things now revealed by the Spirit to *them that love him,* the gathered who receive the mystery. The restored library tells what that unseen thing is: *the souls of the righteous are in the hand of Yahuah (God)... their hope is full of immortality* (Wisdom of Solomon 3:1,4) — a reward the ungodly *neither hoped... nor discerned* (Wisdom 2:22). The thing eye hath not seen is the immortal hope kept for the righteous, prepared before the world and hidden from the world''s wisdom, opened to those who love Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 6628
  FROM _s228_co02_lookup sv, _s228_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40',
       E'Who hath known the mind of Yahuah (Lord)? But we have the mind of Messiah (Isaiah 40)',
       E'Paul ends the chapter on a question and a gift. The question is Isaiah''s: *For who hath known the mind of Yahuah (Lord), that he may instruct him?* (1 Corinthians 2:16), citing *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* (Isaiah 40:13). Isaiah''s demand answers itself — no one directs the Spirit of Yahuah (LORD) or teaches him; the Creator of the ends of the earth has no counsellor and *there is no searching of his understanding* (Isaiah 40:28). Paul cites this same word in Romans, bowing before *the depth of the riches both of the wisdom and knowledge of Elohim (God)*: *For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34). Here in Corinth he turns it toward grace. The unsearchable mind no man ever taught is now shared with his people: *But we have the mind of Messiah (Christ)* (1 Corinthians 2:16). This is not that the gathered instruct Yahuah (Lord), but that by the Spirit who *searcheth... the deep things of Elohim (God)* (1 Corinthians 2:10) they are given the mind of the Formed Son — the natural man cannot discern these things, but *he that is spiritual judgeth all things* (1 Corinthians 2:15), for the hidden wisdom is opened to those who have the Spirit.',
       sv.verse_id, ev.verse_id, 'free', 6631
  FROM _s228_co02_lookup sv, _s228_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 9:13 — *For what man is he that can know the counsel of Yahuah (God)?* the library''s question that the hidden wisdom *which Elohim (God) ordained before the world* (1 Corinthians 2:7) answers.'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 9:17 — *except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above* the counsel known only by the Spirit sent from above; *the Spirit searcheth... the deep things of Elohim (God)* (1 Corinthians 2:10).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 1:10 — wisdom *given to them that love him,* and *created before all things* (Sirach 1:4); the wisdom *ordained before the world,* prepared *for them that love him* (1 Corinthians 2:7,9).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 2:22 — *the mysteries of Yahuah (God), they knew them not,* the ungodly whom *wickedness has blinded* (Wisdom 2:21); the princes who *would not have crucified Yahuah (Lord) of glory* had they known (1 Corinthians 2:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 64:4 — *neither hath the eye seen, O Elohim (God), beside thee, what he hath prepared for him that waiteth for him* the written word Paul cites: *Eye hath not seen... the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:4 — *their hope is full of immortality,* the reward of the righteous the ungodly *neither hoped... nor discerned* (Wisdom 2:22); the unseen *things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:13 — *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* the citation behind *who hath known the mind of Yahuah (Lord)... But we have the mind of Messiah (Christ)* (1 Corinthians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:34 — *For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* Paul citing the same Isaiah 40:13, the unsearchable mind now given: *we have the mind of Messiah (Christ)* (1 Corinthians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_03.sql (S228 1 Corinthians 3) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 3 (23 verses) — Elohim's husbandry, Elohim's building, Elohim's temple.
-- Tag: co03 (temp view _s228_co03_lookup).
-- Sort band: floor 6650, step 3 (6650, 6653, 6656, 6659 used; under 6675).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul keeps reasoning with the fleshly, divided assembly at Corinth — called-out
-- Israel and the grafted-in seed gathered home. The party-loyalty boast (*I am of Paul... of
-- Apollos,* 3:4) is flesh-credential carnality, not Torah-keeping; planter and waterer are nothing,
-- *Elohim (God) gave the increase* (3:6). The chapter's spine is the building-and-temple figure: the
-- assembly is *Elohim''s (God''s) building* (3:9), and *the foundation... is Yahusha HaMashiach (Jesus
-- Christ)* (3:11) — the tried corner stone Yahuah (LORD) laid in Zion (Isaiah 28:16). They are *the
-- temple of Elohim (God)* in whom *the Spirit of Elohim (God) dwelleth* (3:16) — the tabernacle/temple
-- promise of Sinai kept, *I will set my tabernacle among you... I will walk among you* (Leviticus
-- 26:11-12, Exodus 25:8, 29:45): the same indwelling Yahuah (LORD), the same gathered people, not a
-- church that replaced Yashar''el (Israel). Then the two explicit Tanakh citations close the
-- world-wisdom: *He taketh the wise in their own craftiness* (3:19, citing Job 5:13) and *Yahuah
-- (LORD) knoweth the thoughts of the wise, that they are vain* (3:20, citing Psalm 94:11). The
-- NT-Lord rule: 3:5 (*even as Yahuah (Lord) gave to every man*) and 3:20 (*Yahuah (Lord) knoweth*)
-- are rendered exactly as the pull returns them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   milk not meat, ye are yet carnal, I am of Paul / of Apollos
--           Tanakh: none warranted (the divisions are flesh-credential carnality; no load-bearing root)
--           Extras: none warranted
--           NT: Hebrews 5:12-14 (need of milk, and not of strong meat; babes vs full age)
--   v.5-9   I planted, Apollos watered, Elohim gave the increase; ye are Elohim's husbandry/building
--           Tanakh: none warranted (the planting figure is illustrative; the load-bearing Tanakh root
--                   is the building/temple, carried at v.9 into the temple thread)
--           Extras: none warranted   NT: none warranted (continues into the building/temple weave)
--   v.10-11 I have laid the foundation; other foundation can no man lay than Yahusha HaMashiach
--           Tanakh: Isaiah 28:16 (Behold, I lay in Zion for a foundation a stone, a tried stone)
--           Extras: none warranted
--           NT: 1 Peter 2:6 (I lay in Sion a chief corner stone, elect, precious), Ephesians 2:20
--               (built upon the foundation... Yahusha HaMashiach the chief corner stone)
--   v.12-15 gold, silver, wood, hay, stubble; the day shall declare it, revealed by fire; saved by fire
--           Tanakh: none warranted (the fire-tested-work figure has no single load-bearing root)
--           Extras: none warranted   NT: none warranted
--   v.16-17 ye are the temple of Elohim, and the Spirit of Elohim dwelleth in you; the temple is holy
--           Tanakh: Leviticus 26:11-12 (I will set my tabernacle among you... and I will walk among
--                   you), Exodus 25:8 (let them make me a sanctuary; that I may dwell among them),
--                   Exodus 29:45 (I will dwell among the children of Yashar'el)
--           Extras: none warranted
--           NT: 1 Peter 2:5 (built up a spiritual house, an holy priesthood), Ephesians 2:21-22
--               (groweth unto an holy temple... an habitation of Elohim through the Spirit)
--   v.18-20 if any man seem wise, let him become a fool; the wisdom of this world is foolishness
--           Tanakh: Job 5:13 (He taketh the wise in their own craftiness — explicit citation),
--                   Psalm 94:11 (Yahuah knoweth the thoughts of man, that they are vanity — explicit)
--           Extras: none warranted (the Wisdom-of-Solomon world-wisdom weight sits in ch1-2)
--           NT: none warranted
--   v.21-23 let no man glory in men; all things are yours; ye are Messiah's; Messiah is Elohim's
--           Tanakh: none warranted   Extras: none warranted
--           NT: none warranted (the glory-not-in-men close is the carnal-divisions thread's resolution)
--
-- THREADS (slug -> target libraries):
--   6650 1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5   (NT)
--   6653 1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28   (Tanakh + NT)
--   6656 1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26  (Tanakh + NT)
--   6659 1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5
  ('canon', '1-corinthians', 3, 2, 'canon', 'hebrews', 5, 12, 'free', E'*For when for the time ye ought to be teachers, ye have need that one teach you again which be the first principles of the oracles of Elohim (God); and are become such as have need of milk, and not of strong meat.* (Hebrews 5:12). The same rebuke Paul gives the Corinthians: *I have fed you with milk, and not with meat: for hitherto ye were not able to bear it* (1 Corinthians 3:2). Both letters measure a people by what they can take in — the carnal stay at the milk of *babes in Messiah (Christ)* (1 Corinthians 3:1), unready for the strong meat. The fault is not in the meat but in the fleshliness that cannot yet bear it.'),
  ('canon', '1-corinthians', 3, 2, 'canon', 'hebrews', 5, 14, 'free', E'*But strong meat belongeth to them that are of full age, even those who by reason of use have their senses exercised to discern both good and evil.* (Hebrews 5:14). The strong meat is for *them that are of full age* — and Paul tells the Corinthians they are not yet there: *ye were not able to bear it, neither yet now are ye able. For ye are yet carnal* (1 Corinthians 3:2-3). The proof of their childishness is the envying and strife and the party-cries *I am of Paul; and another, I am of Apollos* (1 Corinthians 3:4): a full-grown discernment would not split the one body into factions.'),
  -- thread: 1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28
  ('canon', '1-corinthians', 3, 11, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). Yahuah (LORD) himself laid the one foundation in Zion — *a tried stone, a precious corner stone, a sure foundation.* Paul builds on no other: *other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11). The masterbuilder only sets what Yahuah (LORD) already laid; the tried stone of Isaiah is the Messiah, and every wise builder lays his work upon that and no rival.'),
  ('canon', '1-corinthians', 3, 11, 'canon', '1-peter', 2, 6, 'free', E'*Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded.* (1 Peter 2:6). Peter reads the same Isaiah-28 stone as the Messiah, the *chief corner stone, elect, precious,* laid in Zion by Elohim (God). It is the very foundation Paul will lay and no other: *other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11). The two apostles confess one corner stone — the tried stone of Isaiah, the Messiah on whom the whole building rests.'),
  ('canon', '1-corinthians', 3, 10, 'canon', 'ephesians', 2, 20, 'free', E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* (Ephesians 2:20). The household of Elohim (God) is *built upon the foundation... Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone.* Paul tells the Corinthians the same: *as a wise masterbuilder, I have laid the foundation, and another buildeth thereon. But let every man take heed how he buildeth thereupon* (1 Corinthians 3:10). The corner stone is the Messiah; the apostolic laying only sets that foundation, and every man''s building must answer to it.'),
  -- thread: 1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26
  ('canon', '1-corinthians', 3, 16, 'canon', 'leviticus', 26, 11, 'free', E'*And I will set my tabernacle among you: and my soul shall not abhor you.* (Leviticus 26:11). The covenant promise of Sinai is the dwelling of Yahuah (LORD) in the midst of his people: *I will set my tabernacle among you.* Paul tells the assembly the promise is kept in them: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16). The tabernacle set among Yashar''el (Israel) and the Spirit dwelling in the gathered seed are one indwelling — the same Elohim (God) who would not abhor his people, making his house among them.'),
  ('canon', '1-corinthians', 3, 16, 'canon', 'leviticus', 26, 12, 'free', E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12). Yahuah (LORD) promised to *walk among you, and will be your Elohim (God), and ye shall be my people* — the heart of the covenant. That walking-among is now the Spirit''s indwelling: *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). To be his temple is to be the people in whose midst he walks; the assembly is not a new house but the covenant dwelling brought to the gathered seed.'),
  ('canon', '1-corinthians', 3, 16, 'canon', 'exodus', 25, 8, 'free', E'*And let them make me a sanctuary; that I may dwell among them.* (Exodus 25:8). The whole purpose of the tabernacle Yahuah (LORD) named at the mount: *let them make me a sanctuary; that I may dwell among them.* That dwelling is fulfilled not in cut stone but in the people themselves — *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). The sanctuary built so that Yahuah (LORD) might dwell among Yashar''el (Israel) becomes the assembly indwelt by his Spirit; the indwelling is the same, the house is now living.'),
  ('canon', '1-corinthians', 3, 17, 'canon', 'exodus', 29, 45, 'free', E'*And I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God).* (Exodus 29:45). When the tabernacle and altar were hallowed, Yahuah (LORD) declared *I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God)* — and the house was sanctified by his glory, holy because he dwelt there. So Paul: *if any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:17). The dwelling makes the house holy; to defile the indwelt assembly is to profane the sanctuary Yahuah (LORD) sanctified by his presence.'),
  ('canon', '1-corinthians', 3, 16, 'canon', '1-peter', 2, 5, 'free', E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* (1 Peter 2:5). Peter sees the gathered as *a spiritual house, an holy priesthood* built of living stones — the same temple Paul names: *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). The figure is one: the assembly is the dwelling of Elohim (God), built on the corner stone, indwelt by his Spirit, offering up what is acceptable to him.'),
  ('canon', '1-corinthians', 3, 16, 'canon', 'ephesians', 2, 21, 'free', E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord):* (Ephesians 2:21). The building *fitly framed together groweth unto an holy temple in Yahuah (Lord)* — and in the next breath, *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). It is the very thing Paul tells the Corinthians: *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). The holy temple is the gathered people, the habitation of Elohim (God) through the Spirit — Israel and the grafted-in framed together into one indwelt house.'),
  -- thread: 1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5
  ('canon', '1-corinthians', 3, 19, 'canon', 'job', 5, 13, 'free', E'*He taketh the wise in their own craftiness: and the counsel of the froward is carried headlong.* (Job 5:13). Paul cites this verse outright: *the wisdom of this world is foolishness with Elohim (God). For it is written, He taketh the wise in their own craftiness* (1 Corinthians 3:19). The world''s clever counsel becomes the very snare that traps the clever; Elohim (God) overturns the wisdom that exalts itself. The Corinthians who *seemeth to be wise in this world* are warned to *become a fool, that he may be wise* (1 Corinthians 3:18) — for the craftiness men trust is what Yahuah (LORD) uses to take them.'),
  ('canon', '1-corinthians', 3, 20, 'canon', 'psalms', 94, 11, 'free', E'*Yahuah (LORD) knoweth the thoughts of man, that they are vanity.* (Psalm 94:11). Paul cites this Psalm directly: *And again, Yahuah (Lord) knoweth the thoughts of the wise, that they are vain* (1 Corinthians 3:20). The Psalm rebukes the brutish and the foolish who say *Yahuah (LORD) shall not see* (Psalm 94:7-8); Paul turns it on those who prize the wisdom of this world. The thoughts the wise are proud of are vanity before the One who searches them — *let no man glory in men* (1 Corinthians 3:21), for the cleverness men boast in is emptiness with Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5',
       E'Milk, not meat: the carnal divisions of those yet babes in Messiah (Hebrews 5)',
       E'Paul cannot speak to the Corinthians as spiritual but *as unto carnal, even as unto babes in Messiah (Christ)* (1 Corinthians 3:1): *I have fed you with milk, and not with meat: for hitherto ye were not able to bear it, neither yet now are ye able* (1 Corinthians 3:2). The same measure stands in Hebrews — a people who *ought to be teachers* but *are become such as have need of milk, and not of strong meat* (Hebrews 5:12), for *strong meat belongeth to them that are of full age, even those who by reason of use have their senses exercised to discern both good and evil* (Hebrews 5:14). The fault is not in the meat but in the fleshliness that cannot yet take it in. And the proof of their childishness is plain: *whereas there is among you envying, and strife, and divisions, are ye not carnal, and walk as men? For while one saith, I am of Paul; and another, I am of Apollos; are ye not carnal?* (1 Corinthians 3:3-4). The party-cry is a flesh-credential boast — loyalty to a man as a badge of status — and Paul dissolves it: *Who then is Paul, and who is Apollos, but ministers by whom ye believed... I have planted, Apollos watered; but Elohim (God) gave the increase* (1 Corinthians 3:5-6). A full-grown discernment glories in no man, for the increase is the Elohim (God) who gives it, and *all things are yours... and ye are Messiah''s (Christ''s); and Messiah (Christ) is Elohim''s (God''s)* (1 Corinthians 3:21-23).',
       sv.verse_id, ev.verse_id, 'free', 6650
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28',
       E'Other foundation can no man lay: Yahusha HaMashiach the tried corner stone (Isaiah 28)',
       E'Paul builds as *a wise masterbuilder,* but he lays nothing of his own: *I have laid the foundation, and another buildeth thereon. But let every man take heed how he buildeth thereupon. For other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:10-11). The one foundation was laid by Yahuah (LORD) himself, long before any apostle: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The masterbuilder only sets what Yahuah (LORD) already laid in Zion — the tried stone, which is the Messiah. The other apostles confess the same one stone: Peter reads Isaiah''s word as the Messiah, *Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6); and the household of Elohim (God) is *built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20). There is one corner stone for the whole building; every man''s work is laid upon that and tested by it, and *the fire shall try every man''s work of what sort it is* (1 Corinthians 3:13).',
       sv.verse_id, ev.verse_id, 'free', 6653
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26',
       E'Ye are the temple of Elohim (God), and his Spirit dwelleth in you (Leviticus 26, Exodus 25 & 29)',
       E'*Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you? If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:16-17). The assembly is *Elohim''s (God''s) building* (1 Corinthians 3:9), and the indwelling Paul names is the very covenant promise of Sinai. Yahuah (LORD) gave the tabernacle for one purpose: *let them make me a sanctuary; that I may dwell among them* (Exodus 25:8); and when it was hallowed he declared *I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God)* (Exodus 29:45). The heart of the covenant was his dwelling in the midst: *I will set my tabernacle among you: and my soul shall not abhor you. And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12). That walking-among is now the Spirit''s indwelling of the gathered seed — not a church that replaced Yashar''el (Israel), but the same indwelling Yahuah (LORD), the same covenant presence, brought into the living house of Israel and the grafted-in. And as the sanctuary was sanctified by his glory, so the indwelt assembly is holy: *the temple of Elohim (God) is holy, which temple ye are.* Peter sees the same — *ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5) — and the building in Ephesians *groweth unto an holy temple in Yahuah (Lord)... an habitation of Elohim (God) through the Spirit* (Ephesians 2:21-22). To defile the temple is to profane the dwelling Yahuah (LORD) hallowed by his own presence.',
       sv.verse_id, ev.verse_id, 'free', 6656
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5',
       E'The wisdom of this world is foolishness: He taketh the wise in their craftiness (Job 5, Psalm 94)',
       E'Paul closes the building-chapter by turning on the very wisdom the Corinthians prized in their factions: *Let no man deceive himself. If any man among you seemeth to be wise in this world, let him become a fool, that he may be wise. For the wisdom of this world is foolishness with Elohim (God)* (1 Corinthians 3:18-19). He proves it from two Tanakh texts he quotes outright. The first is Job: *For it is written, He taketh the wise in their own craftiness* (1 Corinthians 3:19), the words of Job 5:13 — *He taketh the wise in their own craftiness: and the counsel of the froward is carried headlong.* The world''s clever counsel becomes the snare that traps the clever; Elohim (God) overturns the wisdom that exalts itself. The second is the Psalm: *And again, Yahuah (Lord) knoweth the thoughts of the wise, that they are vain* (1 Corinthians 3:20), citing *Yahuah (LORD) knoweth the thoughts of man, that they are vanity* (Psalm 94:11) — the Psalm that rebukes the brutish who say *Yahuah (LORD) shall not see.* The thoughts the wise boast in are emptiness before the One who searches them. So the chapter''s charge follows: *Therefore let no man glory in men. For all things are yours* (1 Corinthians 3:21) — the party-loyalty boast is excluded not because wisdom is despised but because the only true wisdom is to belong wholly to the Messiah, *and ye are Messiah''s (Christ''s); and Messiah (Christ) is Elohim''s (God''s)* (1 Corinthians 3:23).',
       sv.verse_id, ev.verse_id, 'free', 6659
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 5:12 — *are become such as have need of milk, and not of strong meat* the same milk-fed childishness; Paul''s *I have fed you with milk, and not with meat* (1 Corinthians 3:2).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 5:14 — *strong meat belongeth to them that are of full age... to discern both good and evil* what the carnal cannot yet bear; *neither yet now are ye able. For ye are yet carnal* (1 Corinthians 3:2-3).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation* the one foundation Yahuah (LORD) laid; *other foundation can no man lay... which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 2:6 — *I lay in Sion a chief corner stone, elect, precious* Peter reads the same Isaiah-28 stone as the Messiah; the one laid foundation of 1 Corinthians 3:11.'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:20 — *built upon the foundation... Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* the same corner stone the masterbuilder lays; *take heed how he buildeth thereupon* (1 Corinthians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:11 — *I will set my tabernacle among you: and my soul shall not abhor you* the covenant dwelling promise; *the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:12 — *I will walk among you, and will be your Elohim (God), and ye shall be my people* the covenant''s heart; the walking-among now the Spirit''s indwelling (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 25:8 — *let them make me a sanctuary; that I may dwell among them* the tabernacle''s whole purpose, fulfilled in the living house; *ye are the temple of Elohim (God)* (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 29:45 — *I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God)* the dwelling that makes the house holy; *the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 2:5 — *built up a spiritual house, an holy priesthood* the same temple-figure for the gathered; *ye are the temple of Elohim (God)* (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ephesians 2:21 — *groweth unto an holy temple in Yahuah (Lord)... an habitation of Elohim (God) through the Spirit* the gathered framed into one indwelt house; *the temple of Elohim (God)... which temple ye are* (1 Corinthians 3:16-17).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 5:13 — *He taketh the wise in their own craftiness* the verse Paul cites outright; *the wisdom of this world is foolishness with Elohim (God). For it is written...* (1 Corinthians 3:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 94:11 — *Yahuah (LORD) knoweth the thoughts of man, that they are vanity* the verse Paul cites; *And again, Yahuah (Lord) knoweth the thoughts of the wise, that they are vain* (1 Corinthians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_04.sql (S228 1 Corinthians 4) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 4 (21 verses).
-- Tag: co04 (temp view _s228_co04_lookup).
-- Sort band: floor 6675, step 3 (6675, 6678, 6681, 6684 used; under 6700).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Corinthians = Paul to a divided, fleshly assembly of called-out ones, Israel and
-- the grafted-in seed gathered at Corinth; Torah kept and honored; the cross the power and wisdom of
-- Elohim; no replacement, no law-vs-grace antithesis, no platonic resurrection). Chapter 4 closes the
-- party-strife argument: Paul and Apollos are *ministers of Messiah, and stewards of the mysteries of
-- Elohim* (4:1), required only to be *found faithful* (4:2). He defers all verdicts to the One judge:
-- *he that judgeth me is Yahuah (Lord)* (4:4), who *will bring to light the hidden things of darkness*
-- (4:5). Against the puffed-up boasters he sets the flesh-credential question — *what hast thou that
-- thou didst not receive? now if thou didst receive it, why dost thou glory?* (4:7): the boast excluded
-- is the credential-boast, exactly the boast Jeremiah forbids and 1:31 already cited. Then the chapter's
-- weight: the apostles *made a spectacle unto the world* (4:9), *fools for Messiah's sake* (4:10),
-- hungering, naked, buffeted, *being reviled, we bless* (4:12), *the filth of the world... the
-- offscouring of all things* (4:13) — the suffering-servant pattern of Isaiah 53, Psalm 22, and the
-- lament of Lamentations 3:45, the despised-righteous of the Hebrew library, the same death-bearing
-- ministry of 2 Corinthians, and the Beatitude blessing of the reviled. Christology stays plain: Yahusha
-- (Jesus) is the Messiah whose servants the apostles are; the Lord who judges is Yahuah (Lord).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   ministers of Messiah, stewards of the mysteries of Elohim, found faithful
--           Tanakh: none warranted (the steward-figure root is the NT parable, not a Tanakh text)
--           Extras: none warranted
--           NT: Luke 12:42 (that faithful and wise steward... to give them their portion in due season)
--   v.3-5   he that judgeth me is Yahuah (Lord); will bring to light the hidden things of darkness
--           Tanakh: Ecclesiastes 12:14 (Elohim shall bring every work into judgment, with every secret thing)
--           Extras: none warranted
--           NT: none warranted (the bring-to-light root is the Tanakh judgment-of-secrets text)
--   v.6-7   not puffed up; what hast thou that thou didst not receive; why dost thou glory
--           Tanakh: Jeremiah 9:23-24 (let not the wise man glory in his wisdom... but let him that
--                   glorieth glory in this, that he... knoweth me) — the flesh-credential boast excluded
--           Extras: none warranted
--           NT: none warranted (carried in prose; the root is the Jeremiah boast-text Paul already cited at 1:31)
--   v.8     ye are full, ye are rich, ye have reigned as kings without us
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (Paul's irony, no load-bearing root)
--   v.9-13  the apostles a spectacle, fools, weak, despised; reviled we bless; the filth/offscouring
--           Tanakh: Isaiah 53:3 (he is despised and rejected of men; a man of sorrows), Psalm 22:6-7
--                   (I am a worm... a reproach of men... they laugh me to scorn), Lamentations 3:45
--                   (thou hast made us as the offscouring and refuse in the midst of the people)
--           Extras: Wisdom of Solomon 2:12-20 (let us lie in wait for the righteous... let us examine
--                   him with despitefulness and torture... condemn him with a shameful death)
--           NT: 2 Corinthians 4:9 (persecuted, but not forsaken; cast down, but not destroyed),
--               Matthew 5:11 (blessed are ye, when men shall revile you, and persecute you),
--               Romans 12:14 (bless them which persecute you: bless, and curse not)
--   v.14-21 my beloved sons, I have begotten you through the gospel; come with a rod or in love
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral close, no load-bearing root)
--
-- THREADS (slug -> target libraries):
--   6675 1-corinthians-4-stewards-of-the-mysteries-of-god-found-faithful-luke-12       (NT)
--   6678 1-corinthians-4-he-that-judgeth-me-is-the-lord-who-brings-the-hidden-to-light-ecclesiastes-12  (Tanakh)
--   6681 1-corinthians-4-what-hast-thou-that-thou-didst-not-receive-glory-in-the-lord-jeremiah-9  (Tanakh)
--   6684 1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53     (Tanakh + Extras + NT)  [CENTERPIECE]
-- =====================================================================

CREATE TEMP VIEW _s228_co04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-4-stewards-of-the-mysteries-of-god-found-faithful-luke-12
  ('canon', '1-corinthians', 4, 2, 'canon', 'luke', 12, 42, 'free', E'*And Yahuah (Lord) said, Who then is that faithful and wise steward, whom his lord shall make ruler over his household, to give them their portion of meat in due season?* (Luke 12:42). Yahusha (Jesus) defined the steward by one demand: faithfulness in dispensing the household''s portion in due season. Paul takes that exact measure for himself and Apollos — *Let a man so account of us, as of the ministers of Messiah (Christ), and stewards of the mysteries of Elohim (God). Moreover it is required in stewards, that a man be found faithful* (1 Corinthians 4:1-2). The apostle is not a party-head to be glorified but a steward of another''s house and another''s mysteries; the only thing required of him is to be *found faithful* with what was entrusted, the very standard the Master set in the parable.'),
  -- thread: 1-corinthians-4-he-that-judgeth-me-is-the-lord-who-brings-the-hidden-to-light-ecclesiastes-12
  ('canon', '1-corinthians', 4, 5, 'canon', 'ecclesiastes', 12, 14, 'free', E'*For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* (Ecclesiastes 12:14). The Preacher''s conclusion is that Elohim (God) will bring *every secret thing* into judgment. Paul rests his whole answer to his judges on that promise: *judge nothing before the time, until Yahuah (Lord) come, who both will bring to light the hidden things of darkness, and will make manifest the counsels of the hearts* (1 Corinthians 4:5). Because the One who *judgeth me is Yahuah (Lord)* (1 Corinthians 4:4) will bring every hidden thing into the open, human verdicts before the time are premature; the steward waits for the only assize that can read the counsels of the heart.'),
  -- thread: 1-corinthians-4-what-hast-thou-that-thou-didst-not-receive-glory-in-the-lord-jeremiah-9
  ('canon', '1-corinthians', 4, 7, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). Yahuah (LORD) forbids the boast in wisdom, might, and riches — the three flesh-credentials. Paul presses the Corinthians with the same logic against being *puffed up for one against another* (1 Corinthians 4:6): *what hast thou that thou didst not receive? now if thou didst receive it, why dost thou glory, as if thou hadst not received it?* (1 Corinthians 4:7). Every credential they boast in was received as a gift; the boast in the gift as though it were earned is exactly the flesh-glory Jeremiah forbids — the same boast Paul already excluded when he cited this passage at *He that glorieth, let him glory in Yahuah (LORD).*'),
  ('canon', '1-corinthians', 4, 7, 'canon', 'jeremiah', 9, 24, 'free', E'*But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth: for in these things I delight, saith Yahuah (LORD).* (Jeremiah 9:24). Yahuah (LORD) leaves one boast standing: to know him. This is the answer behind Paul''s question *why dost thou glory, as if thou hadst not received it?* (1 Corinthians 4:7) — the puffed-up party-loyalty (*I am of Paul... of Apollos*) is the credential-boast that is excluded, while the only glorying left is in Yahuah (LORD) who gives every gift. The boast that is barred is the boast in the flesh, never the keeping of his ways in which he delights.'),
  -- thread: 1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53  [CENTERPIECE]
  ('canon', '1-corinthians', 4, 10, 'canon', 'isaiah', 53, 3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* (Isaiah 53:3). The suffering Servant was *despised and rejected of men.* The apostles walk in his pattern: *we are fools for Messiah''s (Christ''s) sake... we are weak... we are despised* (1 Corinthians 4:10). The servant is not above his Master; the One esteemed not is the One whose ministers are *made a spectacle unto the world* (1 Corinthians 4:9). The despising that fell on the man of sorrows now falls on those who carry his gospel, marking them as his, not shaming them.'),
  ('canon', '1-corinthians', 4, 13, 'canon', 'psalms', 22, 6, 'free', E'*But I am a worm, and no man; a reproach of men, and despised of the people.* (Psalm 22:6). The psalm of the forsaken Righteous One makes him *a reproach of men, and despised of the people* — the very psalm whose pierced hands and feet and parted garments speak the crucifixion. Paul measures the apostles by that same abasement: *being defamed, we intreat: we are made as the filth of the world, and are the offscouring of all things unto this day* (1 Corinthians 4:13). The reproach and scorn heaped on the Worm-who-is-no-man is the reproach the apostles bear; they are conformed to the despised Righteous One, the *spectacle unto the world* (1 Corinthians 4:9).'),
  ('canon', '1-corinthians', 4, 13, 'canon', 'lamentations', 3, 45, 'free', E'*Thou hast made us as the offscouring and refuse in the midst of the people.* (Lamentations 3:45). The lament names the people Yahuah (LORD) had made *the offscouring and refuse in the midst of the people* — the sweepings, the scum scraped away. Paul takes that exact word for the apostles: *we are made as the filth of the world, and are the offscouring of all things unto this day* (1 Corinthians 4:13). What was the affliction of the lamenting remnant becomes the chosen lot of Messiah''s ministers; the offscouring of the world is the place from which they bless, *being reviled, we bless; being persecuted, we suffer it* (1 Corinthians 4:12).'),
  ('canon', '1-corinthians', 4, 9, 'apocrypha', 'the-wisdom-of-solomon', 2, 19, 'extras', E'*Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience.* (Wisdom of Solomon 2:19). The Hebrew library long held the figure of the righteous one set up for derision: the ungodly resolve to *lie in wait for the righteous* and to *examine him with despitefulness and torture... condemn him with a shameful death* (Wisdom of Solomon 2:12,19-20). Paul sees the apostles set in that same arena — *Elohim (God) hath set forth us the apostles last, as it were appointed to death: for we are made a spectacle unto the world, and to angels, and to men* (1 Corinthians 4:9). The righteous made a public reproof of the world, examined and condemned and proved in his patience, is the pattern the apostles fill out, appointed to death and made a spectacle before the whole creation.'),
  ('canon', '1-corinthians', 4, 11, 'canon', '2-corinthians', 4, 9, 'free', E'*Persecuted, but not forsaken; cast down, but not destroyed;* (2 Corinthians 4:9). To this same assembly Paul later unfolds the same death-bearing ministry — *troubled on every side... persecuted, but not forsaken; cast down, but not destroyed,* *always bearing about in the body the dying of the Lord Yahusha (Lord Jesus).* Here he first names that lot plainly: *even unto this present hour we both hunger, and thirst, and are naked, and are buffeted, and have no certain dwellingplace* (1 Corinthians 4:11). The hunger, nakedness, and buffeting of the apostle is the dying of Yahusha (Jesus) carried in the body, that his life might be made manifest — affliction that does not destroy, because the One they serve was himself raised.'),
  ('canon', '1-corinthians', 4, 12, 'canon', 'matthew', 5, 11, 'free', E'*Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake.* (Matthew 5:11). Yahusha (Jesus) pronounced blessing on the reviled and persecuted, joining them to the prophets who were before them. Paul lives the beatitude: *being reviled, we bless; being persecuted, we suffer it: Being defamed, we intreat* (1 Corinthians 4:12-13). The reviling that the Master called blessed is the reviling the apostles answer with blessing; the persecution is borne, not avenged, because the reward is with the One for whose sake they are defamed.'),
  ('canon', '1-corinthians', 4, 12, 'canon', 'romans', 12, 14, 'free', E'*Bless them which persecute you: bless, and curse not.* (Romans 12:14). Paul''s rule for the assembly is to answer persecution with blessing — *bless, and curse not.* In Corinth he shows it lived out in his own flesh: *being reviled, we bless; being persecuted, we suffer it* (1 Corinthians 4:12). The apostle does not merely command the way of blessing the persecutor; he walks it, returning blessing for reviling as the shape of a steward conformed to his despised and praying Master.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-4-stewards-of-the-mysteries-of-god-found-faithful-luke-12',
       E'Ministers of Messiah and stewards of the mysteries of Elohim, found faithful (Luke 12)',
       E'Paul ends the party-quarrel by reframing what an apostle is: not a head to be glorified but a servant of another''s house. *Let a man so account of us, as of the ministers of Messiah (Christ), and stewards of the mysteries of Elohim (God). Moreover it is required in stewards, that a man be found faithful* (1 Corinthians 4:1-2). The steward-figure is the one Yahusha (Jesus) drew in the gospel: *Who then is that faithful and wise steward, whom his lord shall make ruler over his household, to give them their portion of meat in due season?* (Luke 12:42). The mysteries of Elohim (God) are the household goods the steward dispenses, not his own to boast in; the single demand laid on him is faithfulness with what was entrusted. So Paul refuses both the Corinthians'' verdict and his own — *with me it is a very small thing that I should be judged of you... yea, I judge not mine own self* (1 Corinthians 4:3) — because the steward answers to the Master who entrusted the house, not to the household he serves.',
       sv.verse_id, ev.verse_id, 'free', 6675
  FROM _s228_co04_lookup sv, _s228_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-4-he-that-judgeth-me-is-the-lord-who-brings-the-hidden-to-light-ecclesiastes-12',
       E'He that judgeth me is Yahuah (Lord), who brings the hidden things to light (Ecclesiastes 12)',
       E'Because the steward answers to the Master, Paul defers every verdict to the one assize that can reach the heart: *he that judgeth me is Yahuah (Lord). Therefore judge nothing before the time, until Yahuah (Lord) come, who both will bring to light the hidden things of darkness, and will make manifest the counsels of the hearts: and then shall every man have praise of Elohim (God)* (1 Corinthians 4:4-5). This is the Preacher''s closing word made the ground of apostolic patience: *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments... For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:13-14). The judgment that will bring *every secret thing* into the open is the judgment Paul waits for; human courts before the time are premature because they cannot read the counsels of the heart. The steward neither acquits nor condemns himself, but leaves the books to the One who keeps them.',
       sv.verse_id, ev.verse_id, 'free', 6678
  FROM _s228_co04_lookup sv, _s228_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-4-what-hast-thou-that-thou-didst-not-receive-glory-in-the-lord-jeremiah-9',
       E'What hast thou that thou didst not receive? Glory only in Yahuah (LORD) (Jeremiah 9)',
       E'Against the boasting that fed the divisions Paul sets a single question. The Corinthians were *puffed up for one against another* (1 Corinthians 4:6), and he cuts the root out: *For who maketh thee to differ from another? and what hast thou that thou didst not receive? now if thou didst receive it, why dost thou glory, as if thou hadst not received it?* (1 Corinthians 4:7). Every gift they prize — wisdom, eloquence, party-loyalty to Paul or Apollos — was received, not earned; to boast in it as though it were a self-made credential is the flesh-glory Yahuah (LORD) forbade through Jeremiah: *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches: But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD)* (Jeremiah 9:23-24). One boast alone is left standing — to know him — the same boast Paul had already pressed when he wrote *He that glorieth, let him glory in Yahuah (LORD).* The credential-boast in the flesh is excluded; the keeping of his ways, in which he delights, is not.',
       sv.verse_id, ev.verse_id, 'free', 6681
  FROM _s228_co04_lookup sv, _s228_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53',
       E'The apostles made a spectacle, the filth of the world: the suffering-servant pattern (Isaiah 53)',
       E'The puffed-up Corinthians imagine themselves *full... rich... reigned as kings* (1 Corinthians 4:8), so Paul holds up the opposite: *Elohim (God) hath set forth us the apostles last, as it were appointed to death: for we are made a spectacle unto the world, and to angels, and to men. We are fools for Messiah''s (Christ''s) sake... we are weak... we are despised* (1 Corinthians 4:9-10), and on to *being reviled, we bless; being persecuted, we suffer it... we are made as the filth of the world, and are the offscouring of all things unto this day* (1 Corinthians 4:12-13). This is the suffering-servant pattern, the despised-Righteous-One worn as a garment by his ministers. Isaiah saw the Servant *despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not* (Isaiah 53:3); the psalm of the forsaken Righteous One cries *I am a worm, and no man; a reproach of men, and despised of the people* (Psalm 22:6); the lament names the people *as the offscouring and refuse in the midst of the people* (Lamentations 3:45) — the very word Paul takes for himself. The Hebrew library had long drawn the righteous one set up for derision: the ungodly resolve to *examine him with despitefulness and torture... condemn him with a shameful death* (Wisdom of Solomon 2:19-20). And the apostle is not alone in it: to this same assembly he later writes *persecuted, but not forsaken; cast down, but not destroyed* (2 Corinthians 4:9), bearing in the body the dying of Yahusha (Jesus). Yet the lot is not curse but blessing, for the Master pronounced it so — *Blessed are ye, when men shall revile you, and persecute you* (Matthew 5:11) — and the apostle answers reviling with blessing as his rule commands, *Bless them which persecute you: bless, and curse not* (Romans 12:14). The spectacle, the foolishness, the offscouring is the shape of conformity to the despised and praying Messiah, not a shame to be escaped.',
       sv.verse_id, ev.verse_id, 'extras', 6684
  FROM _s228_co04_lookup sv, _s228_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-4-stewards-of-the-mysteries-of-god-found-faithful-luke-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:42 — *Who then is that faithful and wise steward... to give them their portion of meat in due season?* the steward-figure Yahusha (Jesus) drew; the apostles are *stewards of the mysteries of Elohim (God)* required only to be *found faithful* (1 Corinthians 4:1-2).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-stewards-of-the-mysteries-of-god-found-faithful-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-4-he-that-judgeth-me-is-the-lord-who-brings-the-hidden-to-light-ecclesiastes-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:14 — *Elohim (God) shall bring every work into judgment, with every secret thing* the Preacher''s conclusion that grounds apostolic patience; Yahuah (Lord) *will bring to light the hidden things of darkness* (1 Corinthians 4:5), so judge nothing before the time.'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-he-that-judgeth-me-is-the-lord-who-brings-the-hidden-to-light-ecclesiastes-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-4-what-hast-thou-that-thou-didst-not-receive-glory-in-the-lord-jeremiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 9:23 — *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might... his riches* the three flesh-credentials forbidden; *what hast thou that thou didst not receive? why dost thou glory?* (1 Corinthians 4:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-what-hast-thou-that-thou-didst-not-receive-glory-in-the-lord-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 9:24 — *let him that glorieth glory in this, that he... knoweth me, that I am Yahuah (LORD)* the one boast left standing; the puffed-up party-credential is excluded, the glorying in Yahuah (LORD) alone remains (1 Corinthians 4:6-7).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-what-hast-thou-that-thou-didst-not-receive-glory-in-the-lord-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *He is despised and rejected of men; a man of sorrows... he was despised, and we esteemed him not* the suffering Servant''s pattern worn by his ministers, *we are fools for Messiah''s (Christ''s) sake... we are despised* (1 Corinthians 4:10).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:6 — *I am a worm, and no man; a reproach of men, and despised of the people* the forsaken Righteous One''s abasement; the apostles *made as the filth of the world... the offscouring of all things* (1 Corinthians 4:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 3:45 — *Thou hast made us as the offscouring and refuse in the midst of the people* the exact word Paul takes for the apostles, *made as the filth of the world, and are the offscouring of all things* (1 Corinthians 4:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 2:19 — *Let us examine him with despitefulness and torture... that we may know his meekness* the Hebrew library''s righteous-one set up for derision; the apostles *appointed to death... a spectacle unto the world* (1 Corinthians 4:9).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Corinthians 4:9 — *Persecuted, but not forsaken; cast down, but not destroyed* the same death-bearing ministry to the same assembly; *we both hunger, and thirst, and are naked, and are buffeted* (1 Corinthians 4:11).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 5:11 — *Blessed are ye, when men shall revile you, and persecute you* the Master''s beatitude on the reviled; *being reviled, we bless; being persecuted, we suffer it* (1 Corinthians 4:12).'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 12:14 — *Bless them which persecute you: bless, and curse not* the rule Paul lives in his own flesh; *being reviled, we bless* (1 Corinthians 4:12), returning blessing for reviling.'
  FROM cross_reference_threads t, cross_references x, _s228_co04_lookup sv, _s228_co04_lookup tv
 WHERE t.slug='1-corinthians-4-the-apostles-a-spectacle-the-filth-of-the-world-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_05.sql (S228 1 Corinthians 5) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 5 (13 verses) — THE KEEP-THE-FEAST / PASSOVER BLESSING WATCHPOINT.
-- Tag: co05 (temp view _s228_co05_lookup).
-- Sort band: floor 6700, step 3 (6700, 6703, 6706, 6709 used; under 6725).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. Paul disciplines a fleshly assembly of called-out ones — Israel and the grafted-in
-- seed gathered at Corinth — and he does it ON TORAH GROUND, not against Torah. (1) The sin he names
-- is the one Torah curses by name: *one should have his father''s wife* (5:1) is *the nakedness of thy
-- father''s wife* Torah forbids (Leviticus 18:8) and *Cursed be he that lieth with his father''s wife*
-- (Deuteronomy 27:20). (2) The CENTERPIECE: *Purge out therefore the old leaven... For even Messiah
-- (Christ) our passover is sacrificed for us: Therefore let us keep the feast* (5:7-8). Paul does NOT
-- abolish the feast — he commands the assembly to KEEP it. Messiah is the Passover LAMB (Exodus 12 —
-- the lamb without blemish, the blood that turns the destroyer aside), the putting-away of leaven is
-- the Feast of Unleavened Bread (Exodus 12:15-20, Leviticus 23:5-8, Deuteronomy 16:3-4, Exodus 13:7),
-- and the unleavened bread is now read as *sincerity and truth.* The feast is affirmed and fulfilled,
-- never repealed. (3) The DISCIPLINE: *put away from among yourselves that wicked person* (5:13) is the
-- recurring Torah judgment formula *so shalt thou put the evil away from among you* (Deuteronomy 13:5,
-- 17:7, 19:19, 21:21, 22:21, 24:7) — Paul settles the case BY the law. No law-vs-grace antithesis, no
-- church-replacing-Israel; the discipline of the gathered seed is the discipline of the congregation
-- of Yashar''el (Israel) carried forward. Lord-rule: where *Lord* is Yahusha titular (*our Lord Yahusha
-- HaMashiach,* *the day of the Lord Yahusha*) the pull keeps *Lord* — preserved exactly.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the fornication named: one should have his father''s wife; ye are puffed up
--           Tanakh: Leviticus 18:8 (the nakedness of thy father''s wife shalt thou not uncover),
--                   Deuteronomy 22:30 (a man shall not take his father''s wife), Deuteronomy 27:20
--                   (Cursed be he that lieth with his father''s wife)
--           Extras: none warranted   NT: none warranted (the root is the Torah prohibition)
--   v.3-5   deliver such an one unto Satan for the destruction of the flesh, that the spirit be saved
--           Tanakh: none warranted   Extras: none warranted
--           NT: Matthew 18:17 (tell it unto the church... let him be as an heathen man) — the
--               assembly''s judgment of the unrepentant brother
--   v.6-8   a little leaven leaveneth the whole lump; Messiah our passover; let us keep the feast [BLESSING]
--           Tanakh: Exodus 12:5 (lamb without blemish), Exodus 12:13 (when I see the blood, I will
--                   pass over you), Exodus 12:15 (the first day ye shall put away leaven out of your
--                   houses), Exodus 12:8 (unleavened bread), Exodus 13:7 (no leaven seen in all thy
--                   quarters), Leviticus 23:5-6 (the LORD''S passover... the feast of unleavened bread),
--                   Deuteronomy 16:3 (no leavened bread... seven days unleavened bread)
--           Extras: none warranted (the Torah feast is the whole load-bearing root)
--           NT: John 1:29 (Behold the Lamb of Elohim), 1 Peter 1:19 (the precious blood of Messiah,
--               as of a lamb without blemish)
--   v.9-13  keep no company with a fornicator... them that are without Elohim judgeth; put away that
--           wicked person
--           Tanakh: Deuteronomy 13:5, 17:7, 19:19, 21:21, 22:21, 24:7 (so shalt thou put the evil
--                   away from among you — the recurring discipline formula)
--           Extras: none warranted   NT: carried in the discipline thread (Matthew 18:17)
--
-- THREADS (slug -> target libraries):
--   6700 1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12         (Tanakh + NT)  [BLESSING CENTERPIECE]
--   6703 1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13  (Tanakh)
--   6706 1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18  (Tanakh)
--   6709 1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18  (NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12  [BLESSING CENTERPIECE]
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 12, 5, 'free', E'*Your lamb shall be without blemish, a male of the first year: ye shall take it out from the sheep, or from the goats:* (Exodus 12:5). The Passover lamb of Egypt had to be *without blemish* — and Paul names the One it always pointed to: *For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The unblemished lamb chosen on the tenth day and slain on the fourteenth is the Messiah; the feast is not abolished but filled, its lamb revealed. Paul does not loose the assembly from the Passover — he tells them whose blood the lamb foretold.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 12, 13, 'free', E'*And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* (Exodus 12:13). The blood on the door turned the destroyer aside; Yahuah (LORD) passed over the houses marked by the lamb. *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the blood that now stands between the gathered seed and judgment is the blood the door-posts foretold. The Passover is the same Passover; the Lamb is the Messiah.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 12, 15, 'free', E'*Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* (Exodus 12:15). The Feast of Unleavened Bread begins with putting leaven out of the house. Paul speaks the very command to the assembly: *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened* (1 Corinthians 5:7). The literal sweeping-out of leaven becomes the sweeping-out of *malice and wickedness* — but the feast that taught it stands; Paul keeps it and tells them to keep it.'),
  ('canon', '1-corinthians', 5, 8, 'canon', 'exodus', 12, 8, 'free', E'*And they shall eat the flesh in that night, roast with fire, and unleavened bread; and with bitter herbs they shall eat it.* (Exodus 12:8). The lamb was eaten with *unleavened bread* — and Paul reads that very bread as the shape of the redeemed life: *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). *Let us keep the feast* — the Feast of Unleavened Bread is affirmed, and its bread is now sincerity and truth. The feast is not severed from the assembly; it is fulfilled in them.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 13, 7, 'free', E'*Unleavened bread shall be eaten seven days; and there shall no leavened bread be seen with thee, neither shall there be leaven seen with thee in all thy quarters.* (Exodus 13:7). No leaven was to be seen in all the borders of Yashar''el (Israel) through the seven feast-days. Paul presses the same total purge upon the assembly: *a little leaven leaveneth the whole lump. Purge out therefore the old leaven* (1 Corinthians 5:6-7). The thoroughness Torah required of the houses of Yashar''el (Israel) is the thoroughness the gathered seed owes — the leaven of wickedness wholly put away.'),
  ('canon', '1-corinthians', 5, 8, 'canon', 'leviticus', 23, 6, 'free', E'*And on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread.* (Leviticus 23:6). Among the appointed feasts of Yahuah (LORD), the fifteenth day opens *the feast of unleavened bread.* This is the very feast Paul commands the assembly to keep: *Therefore let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The feast of unleavened bread is named in the calendar of Yahuah''s (LORD''s) own appointed times; Paul does not abolish that appointment but binds the assembly to it, its meaning now full.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'leviticus', 23, 5, 'free', E'*In the fourteenth day of the first month at even is the LORD''S passover.* (Leviticus 23:5). The Passover stands first among the feasts of Yahuah (LORD), kept on the fourteenth at even. *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7): the appointed Passover of Yahuah''s (LORD''s) calendar finds its Lamb. The feast is not a shadow discarded but an appointment kept and filled — the day Yahuah (LORD) set apart now bearing the name of the One it foretold.'),
  ('canon', '1-corinthians', 5, 8, 'canon', 'deuteronomy', 16, 3, 'free', E'*Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste: that thou mayest remember the day when thou camest forth out of the land of Egypt all the days of thy life.* (Deuteronomy 16:3). The unleavened bread is the *bread of affliction,* eaten to remember the deliverance out of Egypt all the days of one''s life. Paul keeps the remembrance and gives it its fullness: *let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The feast that remembers the first redemption now remembers the greater — *Messiah (Christ) our passover* — and the bread of affliction becomes the bread of sincerity and truth.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'john', 1, 29, 'free', E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world.* (John 1:29). John the Immerser names Yahusha (Jesus) *the Lamb of Elohim (God)* — the Passover lamb in person. Paul says the same: *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The lamb of Exodus 12, the Lamb of Elohim (God) pointed out at the Jordan, and the Passover sacrificed for the assembly are one and the same — Yahusha (Jesus), the unblemished Lamb whose blood turns the destroyer aside.'),
  ('canon', '1-corinthians', 5, 7, 'canon', '1-peter', 1, 19, 'free', E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* (1 Peter 1:19). The Passover lamb had to be *without blemish* (Exodus 12:5), and Peter names the redemption-price by that very pattern: *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot.* It is the same confession Paul makes — *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The unblemished lamb of the feast is the Messiah, his blood the ransom; the apostolic witness reads the Passover not as abolished but as fulfilled in him.'),
  -- thread: 1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 13, 5, 'free', E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)... So shalt thou put the evil away from the midst of thee.* (Deuteronomy 13:5). Paul closes the discipline of the assembly with a Torah formula: *Therefore put away from among yourselves that wicked person* (1 Corinthians 5:13). It is the recurring judgment-word of Deuteronomy — *so shalt thou put the evil away from the midst of thee.* Paul settles the case by the law; the discipline of the gathered seed is the discipline of the congregation of Yashar''el (Israel) carried forward, not set aside.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 17, 7, 'free', E'*The hands of the witnesses shall be first upon him to put him to death, and afterward the hands of all the people. So thou shalt put the evil away from among you.* (Deuteronomy 17:7). The Torah''s charge against the idolater ends with the words Paul takes up almost verbatim: *put away from among yourselves that wicked person* (1 Corinthians 5:13). *So thou shalt put the evil away from among you* — the formula that purged Yashar''el (Israel) of the corrupting evil is the formula by which Paul purges the assembly. The leaven and the evil-person are the same charge: a little corruption left in leavens the whole.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 19, 19, 'free', E'*Then shall ye do unto him, as he had thought to have done unto his brother: so shalt thou put the evil away from among you.* (Deuteronomy 19:19). Against the false witness Torah repeats the standing word, *so shalt thou put the evil away from among you* — the same word Paul speaks over the unrepentant fornicator: *put away from among yourselves that wicked person* (1 Corinthians 5:13). The assembly that judges *them that are within* (1 Corinthians 5:12) does so on the authority of the law that purged the camp of evil.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 21, 21, 'free', E'*And all the men of his city shall stone him with stones, that he die: so shalt thou put evil away from among you; and all Yashar''el (Israel) shall hear, and fear.* (Deuteronomy 21:21). The stubborn and rebellious son is judged that *all Yashar''el (Israel) shall hear, and fear* — and the evil put away. Paul''s *put away from among yourselves that wicked person* (1 Corinthians 5:13) carries the same purpose: the leaven removed *that ye may be a new lump* (1 Corinthians 5:7). The discipline is not cruelty but the keeping of the assembly clean, the very logic of the Torah formula.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 22, 21, 'free', E'*Then they shall bring out the damsel to the door of her father''s house, and the men of her city shall stone her with stones that she die: because she hath wrought folly in Yashar''el (Israel), to play the whore in her father''s house: so shalt thou put evil away from among you.* (Deuteronomy 22:21). The sexual-sin case in Torah closes with *so shalt thou put evil away from among you* — and it is a sexual sin Paul is judging, *such fornication as is not so much as named among the Gentiles* (1 Corinthians 5:1). His verdict is the Torah verdict: *put away from among yourselves that wicked person* (1 Corinthians 5:13). The folly wrought is purged from the assembly as it was purged from Yashar''el (Israel).'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 24, 7, 'free', E'*If a man be found stealing any of his brethren of the children of Yashar''el (Israel), and maketh merchandise of him, or selleth him; then that thief shall die; and thou shalt put evil away from among you.* (Deuteronomy 24:7). Once more the Torah closes its judgment with *thou shalt put evil away from among you.* Across the offences of Deuteronomy the formula stands unchanged, and Paul speaks it over the Corinthian assembly: *put away from among yourselves that wicked person* (1 Corinthians 5:13). The apostle does not improvise a new church-order; he applies the law''s own enduring command to the gathered seed.'),
  -- thread: 1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18
  ('canon', '1-corinthians', 5, 1, 'canon', 'leviticus', 18, 8, 'free', E'*The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness.* (Leviticus 18:8). The sin Paul reports is named in the Torah by the very relation: *that one should have his father''s wife* (1 Corinthians 5:1) is *the nakedness of thy father''s wife* the law forbids. What the assembly tolerated and was *puffed up* over (1 Corinthians 5:2), Torah had already marked as forbidden — Paul judges by the standard of holiness Yahuah (LORD) gave Yashar''el (Israel), not by the leniency of the nations.'),
  ('canon', '1-corinthians', 5, 1, 'canon', 'deuteronomy', 22, 30, 'free', E'*A man shall not take his father''s wife, nor discover his father''s skirt.* (Deuteronomy 22:30). The law is plain: *a man shall not take his father''s wife.* Yet the Corinthian assembly harboured exactly this — *one should have his father''s wife* (1 Corinthians 5:1) — and gloried instead of mourning. Paul holds the Torah''s line: the relationship is not a matter of opinion but a thing the law of Yahuah (LORD) had long forbidden to Yashar''el (Israel) and to the stranger grafted among them.'),
  ('canon', '1-corinthians', 5, 1, 'canon', 'deuteronomy', 27, 20, 'free', E'*Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen.* (Deuteronomy 27:20). From Mount Ebal the curse was pronounced and all the people answered *Amen* over the man who *lieth with his father''s wife.* This is the sin Paul finds in the assembly — *that one should have his father''s wife* (1 Corinthians 5:1) — and the boasting over it is boasting over what stands under the covenant curse. Paul''s judgment to *deliver such an one unto Satan for the destruction of the flesh* (1 Corinthians 5:5) honours the seriousness the Torah-curse already declared.'),
  -- thread: 1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18
  ('canon', '1-corinthians', 5, 5, 'canon', 'matthew', 18, 17, 'free', E'*And if he shall neglect to hear them, tell it unto the church: but if he neglect to hear the church, let him be unto thee as an heathen man and a publican.* (Matthew 18:17). Yahusha (Jesus) gave the assembly authority to judge the unrepentant brother: the final step is to *tell it unto the church,* and the one who will not hear is put outside. Paul exercises that very authority — *To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:5) — for *do not ye judge them that are within?* (1 Corinthians 5:12). The discipline is the Master''s own ordinance for his gathered people, aimed not at destruction but that *the spirit may be saved.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12',
       E'Messiah our passover — purge the old leaven and keep the feast (Exodus 12)',
       E'Paul does not abolish the feast; he commands the assembly to keep it. *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us: Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:7-8). Every word rests on the Passover of Egypt. The lamb was *without blemish, a male of the first year* (Exodus 12:5), and *Messiah (Christ) our passover* is that unblemished Lamb — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29), *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The blood marked the door, *and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13) — the blood that now stands between the gathered seed and judgment. And the purging of leaven is the Feast of Unleavened Bread itself: *even the first day ye shall put away leaven out of your houses* (Exodus 12:15), *there shall no leavened bread be seen with thee... in all thy quarters* (Exodus 13:7); for these are the appointed feasts of Yahuah (LORD) — *In the fourteenth day of the first month at even is the LORD''S passover. And on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:5-6), *the bread of affliction... that thou mayest remember the day when thou camest forth out of the land of Egypt* (Deuteronomy 16:3). Paul takes the whole appointment and tells the assembly to keep it — *let us keep the feast.* The lamb is revealed as the Messiah; the literal leaven swept from the house becomes *malice and wickedness* swept from the assembly; the unleavened bread becomes *sincerity and truth.* The feast is not a shadow discarded but an appointed time of Yahuah (LORD) kept and filled in the gathered seed — Israel and the grafted-in — who eat the Passover whose Lamb has come.',
       sv.verse_id, ev.verse_id, 'free', 6700
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13',
       E'Put away from among yourselves that wicked person (Deuteronomy''s "put the evil away")',
       E'Paul ends the chapter with a Torah formula, word for word: *Therefore put away from among yourselves that wicked person* (1 Corinthians 5:13). Throughout Deuteronomy the judgment of a corrupting offence closes with the same charge — *So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5, against the prophet who turns the people from Yahuah Elohaychem, the LORD your God); *So thou shalt put the evil away from among you* (Deuteronomy 17:7, against the idolater); *so shalt thou put the evil away from among you* (Deuteronomy 19:19, against the false witness); *so shalt thou put evil away from among you; and all Yashar''el (Israel) shall hear, and fear* (Deuteronomy 21:21, against the rebellious son); *so shalt thou put evil away from among you* (Deuteronomy 22:21, against the one who wrought folly in Yashar''el, Israel); *and thou shalt put evil away from among you* (Deuteronomy 24:7, against the man-stealer). Paul is judging exactly this kind of corrupting sin — *such fornication as is not so much as named among the Gentiles* (1 Corinthians 5:1) — and he settles it on the law''s own authority: *do not ye judge them that are within?* (1 Corinthians 5:12). This is the same logic as the leaven — *a little leaven leaveneth the whole lump* (1 Corinthians 5:6) — the corruption left in the camp spreads. The discipline of the gathered seed is not a new church-order invented against Torah but the enduring command of the law carried forward into the assembly: the evil purged that the whole lump be kept clean.',
       sv.verse_id, ev.verse_id, 'free', 6703
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18',
       E'The fornication Torah curses — his father''s wife (Leviticus 18, Deuteronomy 27)',
       E'The sin that opens the chapter is the one the Torah had already named and cursed. *It is reported commonly that there is fornication among you... that one should have his father''s wife* (1 Corinthians 5:1) — and the law forbids it by the very relation: *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8); *A man shall not take his father''s wife, nor discover his father''s skirt* (Deuteronomy 22:30); and from Mount Ebal the covenant curse: *Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen* (Deuteronomy 27:20). The assembly was *puffed up* (1 Corinthians 5:2) over a thing that stands under the curse of the law — they boasted where they should have mourned. Paul measures the case not by the leniency of the nations but by the holiness Yahuah (LORD) gave Yashar''el (Israel); and his sentence, *to deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:5), honours the gravity the Torah-curse already declared, while aiming at the man''s final salvation.',
       sv.verse_id, ev.verse_id, 'free', 6706
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18',
       E'Deliver such an one unto Satan — the assembly judges them that are within (Matthew 18)',
       E'Paul exercises an authority Yahusha (Jesus) had given the assembly to judge an unrepentant brother. *In the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), when ye are gathered together... To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:4-5); for *do not ye judge them that are within?* (1 Corinthians 5:12). This is the last step of the Master''s own order of discipline: *if he shall neglect to hear them, tell it unto the church: but if he neglect to hear the church, let him be unto thee as an heathen man and a publican* (Matthew 18:17). The one who will not be reclaimed is put outside the fellowship of the gathered — *with such an one no not to eat* (1 Corinthians 5:11) — yet the aim is not destruction but restoration, *that the spirit may be saved.* The same chapter binds this to the feast: the offender is the *old leaven* that must be purged *that ye may be a new lump* (1 Corinthians 5:7); the assembly keeps itself unleavened by putting the unrepentant out, on the Master''s authority and the law''s.',
       sv.verse_id, ev.verse_id, 'free', 6709
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:5 — *Your lamb shall be without blemish, a male of the first year* the Passover lamb the feast required; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:13 — *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* the blood that turns the destroyer aside; the blood of *Messiah (Christ) our passover* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:15 — *even the first day ye shall put away leaven out of your houses* the Feast of Unleavened Bread begins; *Purge out therefore the old leaven, that ye may be a new lump* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:8 — *roast with fire, and unleavened bread* the lamb eaten with unleavened bread; *with the unleavened bread of sincerity and truth* (1 Corinthians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 13:7 — *there shall no leavened bread be seen with thee... in all thy quarters* the total purge Torah required; *a little leaven leaveneth the whole lump* (1 Corinthians 5:6).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 23:5 — *In the fourteenth day of the first month at even is the LORD''S passover* the Passover among Yahuah''s (LORD''s) appointed feasts; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Leviticus 23:6 — *the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* the appointed feast; *Therefore let us keep the feast* (1 Corinthians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Deuteronomy 16:3 — *seven days shalt thou eat unleavened bread therewith, even the bread of affliction... that thou mayest remember the day when thou camest forth out of the land of Egypt* the feast of remembrance; now kept *with the unleavened bread of sincerity and truth* (1 Corinthians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'John 1:29 — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* Yahusha (Jesus) named the Passover Lamb; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Peter 1:19 — *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* the unblemished Passover lamb of Exodus 12:5 fulfilled; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:5 — *So shalt thou put the evil away from the midst of thee* the formula against the prophet who turns the people away; *put away from among yourselves that wicked person* (1 Corinthians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 17:7 — *So thou shalt put the evil away from among you* the formula against the idolater, almost word for word; *put away from among yourselves that wicked person* (1 Corinthians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:19 — *so shalt thou put the evil away from among you* the formula against the false witness; the assembly that *judge[s] them that are within* (1 Corinthians 5:12) on this authority.'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 21:21 — *so shalt thou put evil away from among you; and all Yashar''el (Israel) shall hear, and fear* the formula against the rebellious son; the leaven removed *that ye may be a new lump* (1 Corinthians 5:7,13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 22:21 — *so shalt thou put evil away from among you* the formula against the sexual sin in Yashar''el (Israel); Paul judges a sexual sin, *put away from among yourselves that wicked person* (1 Corinthians 5:1,13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 24:7 — *thou shalt put evil away from among you* the formula against the man-stealer; the enduring command applied to the assembly, *put away from among yourselves that wicked person* (1 Corinthians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:8 — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* the relation the law forbids; *that one should have his father''s wife* (1 Corinthians 5:1).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 22:30 — *A man shall not take his father''s wife, nor discover his father''s skirt* the plain prohibition; the assembly harboured *one should have his father''s wife* (1 Corinthians 5:1).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:20 — *Cursed be he that lieth with his father''s wife... And all the people shall say, Amen* the covenant curse from Ebal; the assembly *puffed up* over what stands cursed (1 Corinthians 5:1-2).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 18:17 — *tell it unto the church: but if he neglect to hear the church, let him be unto thee as an heathen man and a publican* the Master''s order of discipline; *To deliver such an one unto Satan... that the spirit may be saved* (1 Corinthians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_06.sql (S228 1 Corinthians 6) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 6 (20 verses) — lawsuits among saints; the body a temple.
-- Tag: co06 (temp view _s228_co06_lookup).
-- Sort band: floor 6725, step 3 (6725, 6728, 6731, 6734 used; under 6750).
-- Source is ALWAYS the canon 1 Corinthians 6 verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul rebukes a fleshly assembly going to law before the unjust when *the saints
-- shall judge the world* (6:2) — the Daniel-7 promise that *judgment was given to the saints of the
-- El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22). The
-- unrighteous *shall not inherit the kingdom of Elohim (God)* (6:9-10) — yet *such were some of you:
-- but ye are washed, but ye are sanctified, but ye are justified* (6:11): justification language read
-- per the brief's works-of-law note — the redeemed are WASHED in the name of the Lord Yahusha (Lord
-- Jesus) and by the Spirit, not a flesh-credential earned. Sexual holiness is grounded in the Tanakh:
-- *he which is joined to an harlot is one body... for two, saith he, shall be one flesh* (6:16) cites
-- Genesis 2:24; *flee fornication* (6:18) breathes Leviticus 18 (the sexual-holiness law) and Joseph
-- who *fled, and got him out* (Genesis 39:12). And *your body is the temple of the Ruach HaKodesh
-- (Holy Spirit)... glorify Elohim (God) in your body* (6:19-20) re-speaks the SAME tabernacle root as
-- 3:16 — Leviticus 26:11-12, Exodus 25:8 (the indwelling Yahuah making his house among his people),
-- now brought down to the individual body. No law-vs-grace antithesis; Torah is the air the rebuke
-- breathes.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-8   go to law before the unjust; the saints shall judge the world; we shall judge angels
--           Tanakh: Daniel 7:22 (judgment given to the saints; the saints possessed the kingdom),
--                   Daniel 7:27 (the kingdom given to the people of the saints of the El Elyon)
--           Extras: none warranted (the saints-judging weight is carried by Daniel 7 itself)
--           NT:     none warranted (Matthew 19:28 thrones-judging is Israel-tribes, a different frame)
--   v.9-11  the unrighteous shall not inherit the kingdom; but ye are washed, sanctified, justified
--           Tanakh: none warranted (no cited root; the washing/justification weight carried in prose
--                   and bound to the temple-holiness of vv.19-20 — the redeemed washed, not earned)
--           Extras: none warranted   NT: none warranted
--   v.12-14 all things lawful but not expedient; the body not for fornication but for Yahuah
--           Tanakh: none warranted (the body-holiness root surfaces fully at vv.18-20)
--           Extras: none warranted   NT: none warranted
--   v.15-17 members of Messiah; joined to an harlot is one body; two shall be one flesh
--           Tanakh: Genesis 2:24 (they shall be one flesh — Paul's explicit citation, *saith he*)
--           Extras: none warranted   NT: none warranted
--   v.18    flee fornication; he that committeth fornication sinneth against his own body
--           Tanakh: Leviticus 18:24-30 (the sexual-holiness law, defile not yourselves),
--                   Genesis 39:12 (Joseph fled, and got him out)
--           Extras: none warranted   NT: none warranted
--   v.19-20 your body is the temple of the Ruach HaKodesh; glorify Elohim in your body
--           Tanakh: Leviticus 26:11-12 (I will set my tabernacle among you; walk among you),
--                   Exodus 25:8 (let them make me a sanctuary; that I may dwell among them)
--           Extras: none warranted   NT: none warranted (SAME root as 3:16 — framing kept consistent)
--
-- THREADS (slug -> target libraries):
--   6725 1-corinthians-6-the-saints-shall-judge-the-world-daniel-7              (Tanakh)
--   6728 1-corinthians-6-joined-to-an-harlot-or-one-flesh-with-his-wife-genesis-2  (Tanakh)
--   6731 1-corinthians-6-flee-fornication-the-sexual-holiness-of-the-law-leviticus-18  (Tanakh)
--   6734 1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-6-the-saints-shall-judge-the-world-daniel-7
  ('canon', '1-corinthians', 6, 2, 'canon', 'daniel', 7, 22, 'free', E'*Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom.* (Daniel 7:22). This is the ground Paul stands on when he asks, *Do ye not know that the saints shall judge the world?* (1 Corinthians 6:2). Daniel saw the Ancient of days give *judgment... to the saints,* and the time when *the saints possessed the kingdom* — so the assembly that will judge the world has no business dragging brother against brother *to law before the unjust* (1 Corinthians 6:1). The destiny of the gathered seed is to share the judgment of the El Elyon (most High); to run to the courts of the unbelievers is to forget the kingdom they are promised.'),
  ('canon', '1-corinthians', 6, 3, 'canon', 'daniel', 7, 27, 'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). The everlasting kingdom *given to the people of the saints* — with *all dominions* made to *serve and obey* — is the warrant for Paul''s greater claim: *Know ye not that we shall judge angels?* (1 Corinthians 6:3). If the saints are to receive the dominion under the whole heaven, that all powers serve them, then how much more *things that pertain to this life;* the smallest disputes of the assembly are beneath those appointed to the dominion of the El Elyon (most High).'),
  -- thread: 1-corinthians-6-joined-to-an-harlot-or-one-flesh-with-his-wife-genesis-2
  ('canon', '1-corinthians', 6, 16, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). Paul reasons sexual ethics straight from the creation word, and quotes it — *for two, saith he, shall be one flesh* (1 Corinthians 6:16). The *one flesh* spoken over the man and his wife in the garden is the very union that makes joining to a harlot so grave: *he which is joined to an harlot is one body* (1 Corinthians 6:16). The Genesis word is not abolished but pressed as binding instruction — the body is made for the one-flesh covenant Yahuah (LORD) ordained, not for fornication; *he that is joined unto Yahuah (Lord) is one spirit* (1 Corinthians 6:17).'),
  -- thread: 1-corinthians-6-flee-fornication-the-sexual-holiness-of-the-law-leviticus-18
  ('canon', '1-corinthians', 6, 18, 'canon', 'leviticus', 18, 24, 'free', E'*Defile not ye yourselves in any of these things: for in all these the nations are defiled which I cast out before you:* (Leviticus 18:24). The whole sexual-holiness law of Leviticus 18 stands behind *Flee fornication* (1 Corinthians 6:18). Yahuah (LORD) set Yashar''el (Israel) apart from the defilements of the nations — *defile not ye yourselves in any of these things* — and warned that the land itself *vomiteth out her inhabitants* for them. Paul presses the same holiness on the gathered seed: the body that sins in fornication *sinneth against his own body,* defiling the very vessel set apart for Yahuah (LORD). The Torah''s sexual ethic is not behind the assembly but binding upon it.'),
  ('canon', '1-corinthians', 6, 18, 'canon', 'genesis', 39, 12, 'free', E'*And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* (Genesis 39:12). Joseph is the Tanakh''s living picture of *Flee fornication* (1 Corinthians 6:18). Pressed *day by day* by his master''s wife, he would not *sin against Elohim (God)* (Genesis 39:9); when she seized him, *he left his garment in her hand, and fled, and got him out.* Paul does not say resist or reason but flee — and Joseph fled the room rather than the temptation, the same posture toward the sin that sins *against his own body.* The righteous man of Genesis embodies the command Paul lays on the assembly.'),
  -- thread: 1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26
  ('canon', '1-corinthians', 6, 19, 'canon', 'leviticus', 26, 11, 'free', E'*And I will set my tabernacle among you: and my soul shall not abhor you.* (Leviticus 26:11). The covenant promise of Sinai — Yahuah (LORD) dwelling in the midst of his people, *I will set my tabernacle among you* — is the same indwelling Paul names of the individual body: *know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God)* (1 Corinthians 6:19). The tabernacle set among Yashar''el (Israel) and the Spirit dwelling in the believer''s body are one indwelling — the same root Paul pressed on the whole assembly, *ye are the temple of Elohim (God)* (1 Corinthians 3:16), now brought down to the body of each one bought with a price.'),
  ('canon', '1-corinthians', 6, 19, 'canon', 'leviticus', 26, 12, 'free', E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12). Yahuah (LORD) promised to *walk among you, and will be your Elohim (God), and ye shall be my people* — the heart of the covenant. That walking-among is now the Ruach HaKodesh (Holy Spirit) indwelling the body: *your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you... and ye are not your own* (1 Corinthians 6:19). Because the body is the dwelling-place of his own Spirit, it is no longer one''s own to give to a harlot; the command follows, *glorify Elohim (God) in your body* (1 Corinthians 6:20) — to honor the house in which he walks.'),
  ('canon', '1-corinthians', 6, 19, 'canon', 'exodus', 25, 8, 'free', E'*And let them make me a sanctuary; that I may dwell among them.* (Exodus 25:8). The whole purpose Yahuah (LORD) named for the tabernacle — *let them make me a sanctuary; that I may dwell among them* — is fulfilled not in cut stone but in the living body of the redeemed: *your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you* (1 Corinthians 6:19). The sanctuary built so Yahuah (LORD) might dwell among Yashar''el (Israel) becomes the body indwelt by his Spirit; therefore *ye are not your own. For ye are bought with a price: therefore glorify Elohim (God) in your body* (1 Corinthians 6:19-20). The dwelling makes the house holy, and the body of him in whom the Spirit dwells is the sanctuary he must not defile.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-6-the-saints-shall-judge-the-world-daniel-7',
       E'The saints shall judge the world (Daniel 7)',
       E'Paul is appalled that the assembly drags brother against brother *to law before the unjust, and not before the saints* (1 Corinthians 6:1), and he names the destiny they have forgotten: *Do ye not know that the saints shall judge the world? and if the world shall be judged by you, are ye unworthy to judge the smallest matters? Know ye not that we shall judge angels?* (1 Corinthians 6:2-3). The whole claim rests on Daniel''s night-vision. The Ancient of days came, *and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22) — the saints judge the world because the judgment of the El Elyon (most High) is given to them. And more: *the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27) — if *all dominions* are to serve the saints, then they shall *judge angels,* and *things that pertain to this life* are beneath them. The gathered seed is appointed to the everlasting kingdom and its judgment-seat; to run to the courts of the unbelievers over the smallest matters is to despise the dominion Daniel saw given them. There is *utterly a fault* (1 Corinthians 6:7) in a people who will judge the world yet cannot bear to *take wrong* from a brother.',
       sv.verse_id, ev.verse_id, 'free', 6725
  FROM _s228_co06_lookup sv, _s228_co06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-6-joined-to-an-harlot-or-one-flesh-with-his-wife-genesis-2',
       E'Joined to an harlot, or one flesh with his wife (Genesis 2)',
       E'Paul reasons the body''s holiness straight out of the creation word, and quotes it. *Know ye not that your bodies are the members of Messiah (Christ)? shall I then take the members of Messiah (Christ), and make them the members of an harlot? Elohim (God) forbid. What? know ye not that he which is joined to an harlot is one body? for two, saith he, shall be one flesh* (1 Corinthians 6:15-16). The *saith he* is the Genesis word over the man and his wife: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). The one-flesh union Yahuah (LORD) ordained in the garden is precisely what makes joining to a harlot so grave — it is not a passing act but a one-body joining, and the body that belongs to Messiah (Christ) cannot be made one with a harlot. Paul does not set the creation order aside; he presses it as binding. The body is made for the one-flesh covenant, and above it the spiritual union: *he that is joined unto Yahuah (Lord) is one spirit* (1 Corinthians 6:17). The members of Messiah (Christ) are kept for the holy joining, not the defiling one.',
       sv.verse_id, ev.verse_id, 'free', 6728
  FROM _s228_co06_lookup sv, _s228_co06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-6-flee-fornication-the-sexual-holiness-of-the-law-leviticus-18',
       E'Flee fornication — the sexual holiness of the law (Leviticus 18, Genesis 39)',
       E'*Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body* (1 Corinthians 6:18). The command breathes the Torah''s sexual-holiness law and the Tanakh''s own picture of obedience to it. In Leviticus 18 Yahuah (LORD) set Yashar''el (Israel) apart from the defilements of the nations: *Defile not ye yourselves in any of these things: for in all these the nations are defiled which I cast out before you* (Leviticus 18:24), warning that the land itself *vomiteth out her inhabitants* for such abominations. Paul presses that same holiness on the gathered seed — the body is set apart for Yahuah (LORD), and fornication defiles the very vessel he claims. And the Tanakh shows what *flee* looks like in the flesh: when his master''s wife *caught him by his garment, saying, Lie with me,* Joseph *left his garment in her hand, and fled, and got him out* (Genesis 39:12), refusing to *do this great wickedness, and sin against Elohim (God)* (Genesis 39:9). Paul does not say argue or resist but flee — and Joseph fled the room rather than risk the sin. The law''s sexual ethic and the righteous man who kept it stand together behind the apostle''s charge.',
       sv.verse_id, ev.verse_id, 'free', 6731
  FROM _s228_co06_lookup sv, _s228_co06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26',
       E'Your body is the temple of the Ruach HaKodesh (Leviticus 26, Exodus 25)',
       E'*What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own? For ye are bought with a price: therefore glorify Elohim (God) in your body, and in your spirit, which are Elohim''s (God''s)* (1 Corinthians 6:19-20). This is the same indwelling Paul named over the whole assembly — *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16) — now brought down to the individual body, and it rests on the same covenant root. Yahuah (LORD) gave the tabernacle for one purpose: *let them make me a sanctuary; that I may dwell among them* (Exodus 25:8). And the heart of the covenant was his dwelling in the midst of his people: *I will set my tabernacle among you: and my soul shall not abhor you. And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12). That walking-among is now the Ruach HaKodesh (Holy Spirit) indwelling the body of the redeemed. Because the body is the very dwelling-place of his Spirit, it is no longer one''s own to give to a harlot — it is bought with a price, the sanctuary in which he walks. The same indwelling Yahuah (LORD), the same covenant presence that hallowed the tabernacle, now makes the believer''s body holy; therefore *glorify Elohim (God) in your body.*',
       sv.verse_id, ev.verse_id, 'free', 6734
  FROM _s228_co06_lookup sv, _s228_co06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-6-the-saints-shall-judge-the-world-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:22 — *judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* the warrant for *the saints shall judge the world* (1 Corinthians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-the-saints-shall-judge-the-world-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *the kingdom and dominion... shall be given to the people of the saints of the El Elyon (most High)... all dominions shall serve and obey him* if all powers serve the saints, *we shall judge angels* (1 Corinthians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-the-saints-shall-judge-the-world-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-6-joined-to-an-harlot-or-one-flesh-with-his-wife-genesis-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *they shall be one flesh* the creation word Paul quotes (*for two, saith he, shall be one flesh*); the one-body joining that makes union with a harlot grave (1 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-joined-to-an-harlot-or-one-flesh-with-his-wife-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-6-flee-fornication-the-sexual-holiness-of-the-law-leviticus-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:24 — *Defile not ye yourselves in any of these things: for in all these the nations are defiled which I cast out before you* the sexual-holiness law behind *Flee fornication* (1 Corinthians 6:18).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-flee-fornication-the-sexual-holiness-of-the-law-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:12 — *he left his garment in her hand, and fled, and got him out* Joseph the living picture of *Flee fornication;* he fled the room rather than *sin against Elohim (God)* (1 Corinthians 6:18).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-flee-fornication-the-sexual-holiness-of-the-law-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:11 — *I will set my tabernacle among you: and my soul shall not abhor you* the Sinai indwelling, now the Spirit in the body: *your body is the temple of the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 6:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:12 — *I will walk among you, and will be your Elohim (God), and ye shall be my people* the covenant walking-among, now the indwelt body that is *not your own* (1 Corinthians 6:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 25:8 — *let them make me a sanctuary; that I may dwell among them* the tabernacle''s purpose fulfilled in the living body; therefore *glorify Elohim (God) in your body* (1 Corinthians 6:19-20).'
  FROM cross_reference_threads t, cross_references x, _s228_co06_lookup sv, _s228_co06_lookup tv
 WHERE t.slug='1-corinthians-6-your-body-is-the-temple-of-the-holy-spirit-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_07.sql (S228 1 Corinthians 7) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 7 (40 verses) — the Torah-affirming watchpoint chapter.
-- Tag: co07 (temp view _s228_co07_lookup).
-- Sort band: floor 6750, step 3 (6750, 6753, 6756 used; under 6775).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. Chapter 7 is long and largely pastoral counsel — much of it Paul's own judgment
-- ("none warranted" for most of the marriage casuistry). But it carries the load-bearing thesis of
-- the whole letter and the whole framework: *Circumcision is nothing, and uncircumcision is nothing,
-- but the keeping of the commandments of Elohim (God)* (7:19). The outward flesh-credential — the
-- mark in the flesh — counts for nothing; what counts is the keeping of the commandments. This is
-- NOT a law-vs-grace antithesis and NOT the abolition of Torah; it is the very opposite — the
-- commandments are named as the thing that matters when the flesh-boast is stripped away. Paul binds
-- it to *Let every man abide in the same calling wherein he was called* (7:20,24): the distinction of
-- Yashar'el (Israel) and the nations is not erased — *let him not become uncircumcised... let him not
-- be circumcised* (7:18) — each abides where he was called, with Elohim (God). Marriage is grounded
-- in the creation order and the one-flesh bond (Genesis 2:24, the wife of the covenant of Malachi 2).
-- Concentrate the threads on 7:19 (commandments), abide-in-calling, and marriage/one-flesh; record
-- "none warranted" for the verse-blocks that are pastoral counsel without a genuine library root.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-9   marriage as the remedy against fornication; render due benevolence; better to marry than burn
--           Tanakh: Genesis 2:24 (one flesh — carried in the marriage thread at v.2-4)
--           Extras: none warranted (pastoral counsel)   NT: none warranted
--   v.10-16 the married not to depart; the unbelieving spouse sanctified; called to peace
--           Tanakh: Malachi 2:14-16 (the wife of thy covenant, deal not treacherously — marriage thread)
--           Extras: none warranted   NT: none warranted (Yahusha's own divorce word is Paul's *not I,
--                   but Yahuah (Lord)* in v.10; left in prose, no separate gospel member forced)
--   v.17-24 abide in the calling; circumcised/uncircumcised stay as called; commandments are what counts
--           Tanakh: Deuteronomy 30:8 (do all his commandments — abide-in-calling), Deuteronomy 13:4
--                   (keep his commandments... cleave unto him), Deuteronomy 30:11-16 + 30:14 (the
--                   commandment near, do it — the 7:19 commandments thread), Ecclesiastes 12:13
--                   (fear Elohim and keep his commandments — the whole duty of man)
--           Extras: Ecclesiasticus (Sirach) 15:15 (if thou wilt, to keep the commandments)
--           NT: none warranted (the keeping-the-commandments weave is Tanakh + extras)
--   v.25-38 virgins, the present distress, the time is short, marrying doeth well
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (Paul's judgment)
--   v.39-40 the wife bound by the law while her husband liveth; happier if she abide
--           Tanakh: Genesis 2:24 (the one-flesh bond — marriage thread), Malachi 2:14 (carried)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6750 1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30  (Tanakh + Extras)  [BLESSING CENTERPIECE]
--   6753 1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30     (Tanakh)
--   6756 1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2        (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30  [BLESSING CENTERPIECE]
  ('canon', '1-corinthians', 7, 19, 'canon', 'deuteronomy', 30, 11, 'free', E'*For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11). When Paul says *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19), he speaks of the very commandment Moses set before Yashar''el (Israel) — not a buried or impossible thing, *not hidden from thee, neither is it far off.* The outward mark in the flesh counts for nothing; the keeping of the commandment that is near is what counts. Paul does not abolish the commandment; he names it as the one thing that matters once the flesh-credential is stripped away.'),
  ('canon', '1-corinthians', 7, 19, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). The commandment is *very nigh... in thy mouth, and in thy heart, that thou mayest do it* — given to be done, not admired. This is the keeping that Paul sets over against every flesh-mark: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The word near in the mouth and heart is the word to be kept; the doing of it, not the cutting of the flesh, is the measure of the called.'),
  ('canon', '1-corinthians', 7, 19, 'canon', 'deuteronomy', 30, 16, 'free', E'*In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* (Deuteronomy 30:16). The life set before Yashar''el (Israel) is to *keep his commandments and his statutes and his judgments, that thou mayest live.* Paul holds the same standard over the divided assembly: not the flesh-credential of circumcision or uncircumcision, but *the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). What was life in the land is the shape of the redeemed life now — the commandments kept, the flesh-mark set aside.'),
  ('canon', '1-corinthians', 7, 19, 'canon', 'ecclesiastes', 12, 13, 'free', E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* (Ecclesiastes 12:13). The Preacher''s whole conclusion is Paul''s thesis: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* Against the boast of the flesh — circumcised or uncircumcised — Paul sets the same one thing: *the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The whole duty of man is not the mark in the flesh but the commandment kept; the outward sign is nothing, the keeping is everything.'),
  ('canon', '1-corinthians', 7, 19, 'apocrypha', 'ecclesiasticus', 15, 15, 'extras', E'*If you will, to keep the commandments, and to perform acceptable faithfulness.* (Ecclesiasticus 15:15). The Hebrew library names the same measure: man is left *in the hand of his counsel,* and the path set before him is *to keep the commandments, and to perform acceptable faithfulness.* This is exactly what Paul calls the one thing that counts: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). Not the flesh-credential but the kept commandment and the faithfulness performed — the wisdom-tradition and the apostle speak with one voice.'),
  -- thread: 1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30
  ('canon', '1-corinthians', 7, 24, 'canon', 'deuteronomy', 30, 8, 'free', E'*And thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day.* (Deuteronomy 30:8). The calling Paul bids each man abide in is the calling to obey: *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments.* So Paul says *Brethren, let every man, wherein he is called, therein abide with Elohim (God)* (1 Corinthians 7:24) — to abide in the calling is to abide with Elohim (God), doing his commandments where one stands, whether circumcised or uncircumcised, bond or free.'),
  ('canon', '1-corinthians', 7, 18, 'canon', 'deuteronomy', 13, 4, 'free', E'*Ye shall walk after Yahuah Elohaychem (the LORD your God), and fear him, and keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him.* (Deuteronomy 13:4). The walk Moses commands is to *keep his commandments... and cleave unto him* — and Paul keeps the distinction of the called intact precisely so each may so walk: *Is any man called being circumcised? let him not become uncircumcised. Is any called in uncircumcision? let him not be circumcised* (1 Corinthians 7:18). The mark of Yashar''el (Israel) is not erased and the nations are not forced under it; each abides as called, all alike cleaving unto Yahuah (LORD) and keeping his commandments.'),
  -- thread: 1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2
  ('canon', '1-corinthians', 7, 2, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). Paul grounds marriage where the Maker set it at creation: a man cleaves unto his wife and *they shall be one flesh.* So *let every man have his own wife, and let every woman have her own husband* (1 Corinthians 7:2), and *the wife hath not power of her own body, but the husband: and likewise also the husband hath not power of his own body, but the wife* (1 Corinthians 7:4) — the one-flesh bond of Eden, where the two are no longer two separate powers but one.'),
  ('canon', '1-corinthians', 7, 4, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). The mutual claim Paul lays down — *the wife hath not power of her own body, but the husband... the husband hath not power of his own body, but the wife* (1 Corinthians 7:4) — is the one-flesh of the garden, where *they shall be one flesh.* Because the two are one body, neither owns the body alone; the creation order, not custom, is the root of the rendering of *due benevolence* each to the other.'),
  ('canon', '1-corinthians', 7, 10, 'canon', 'malachi', 2, 14, 'free', E'*Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* (Malachi 2:14). Yahuah (LORD) is *witness between thee and the wife of thy youth,* who is *the wife of thy covenant* — and so Paul commands, *not I, but Yahuah (Lord), Let not the wife depart from her husband... and let not the husband put away his wife* (1 Corinthians 7:10-11). The marriage is a covenant Yahuah (LORD) witnesses; to depart or put away is to deal treacherously against the companion of the covenant.'),
  ('canon', '1-corinthians', 7, 39, 'canon', 'malachi', 2, 15, 'free', E'*And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* (Malachi 2:15). The Maker *made one* and seeks *a godly seed,* binding the wife to her husband while he lives; so *the wife is bound by the law as long as her husband liveth; but if her husband be dead, she is at liberty to be married to whom she will; only in Yahuah (Lord)* (1 Corinthians 7:39). The bond is the covenant-bond Malachi guards, loosed only by death, and her liberty is *only in Yahuah (Lord)* — the godly seed and the witnessed covenant honored to the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30',
       E'Circumcision is nothing, but the keeping of the commandments of Elohim (Deuteronomy 30, Ecclesiastes 12)',
       E'Here Paul lays down the thesis of the whole letter and the whole framework in a single line: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The outward mark in the flesh — the great flesh-credential of the divided assembly — counts for nothing. What counts is the keeping of the commandments. This is no abolition of Torah and no law-against-grace antithesis; it is the very opposite. When every flesh-boast is stripped away, the one thing Paul names as mattering is the commandment kept. And the commandment he means is the commandment Moses set before Yashar''el (Israel): *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11) — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). It was never given to be admired from afar but to be done; the life set before the people is *to keep his commandments and his statutes and his judgments, that thou mayest live and multiply* (Deuteronomy 30:16). The Preacher reaches the same conclusion of the whole matter: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The whole duty of man is not the sign in the flesh but the commandment kept. And the Hebrew wisdom-library names the same measure — man is left in the hand of his own counsel, and the path before him is *to keep the commandments, and to perform acceptable faithfulness* (Ecclesiasticus 15:15). Moses, the Preacher, the wisdom-tradition, and the apostle speak with one voice: the flesh-credential is nothing; the keeping of the commandments of Elohim (God) is everything.',
       sv.verse_id, ev.verse_id, 'extras', 6750
  FROM _s228_co07_lookup sv, _s228_co07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30',
       E'Let every man abide in the calling wherein he was called (Deuteronomy 30, 13)',
       E'Around the thesis of 7:19 Paul wraps a counsel that guards the distinction of the called: *Is any man called being circumcised? let him not become uncircumcised. Is any called in uncircumcision? let him not be circumcised* (1 Corinthians 7:18); *Let every man abide in the same calling wherein he was called* (1 Corinthians 7:20); *Brethren, let every man, wherein he is called, therein abide with Elohim (God)* (1 Corinthians 7:24). The mark of Yashar''el (Israel) is not to be undone, and the nations are not to be driven under it — each abides where he was called, and the abiding is *with Elohim (God).* For the calling is a calling to obey: *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day* (Deuteronomy 30:8); the walk is *to keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4). To abide in the calling is to abide doing the commandments, cleaving unto Yahuah (LORD), whether circumcised or uncircumcised, bond or free. The distinction is preserved; the obedience is the same for all.',
       sv.verse_id, ev.verse_id, 'free', 6753
  FROM _s228_co07_lookup sv, _s228_co07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2',
       E'They shall be one flesh — the wife of the covenant (Genesis 2, Malachi 2)',
       E'Paul''s counsel on marriage is not bare pragmatism; it rests on the creation order and the covenant the Maker witnesses. *Let every man have his own wife, and let every woman have her own husband* (1 Corinthians 7:2), and *the wife hath not power of her own body, but the husband: and likewise also the husband hath not power of his own body, but the wife* (1 Corinthians 7:4) — because at the beginning *a man... shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). The two are one body, and so neither holds the body alone. Upon that one-flesh bond Paul lays the command against departing: *not I, but Yahuah (Lord), Let not the wife depart from her husband... and let not the husband put away his wife* (1 Corinthians 7:10-11) — for Yahuah (LORD) *hath been witness between thee and the wife of thy youth... yet is she thy companion, and the wife of thy covenant* (Malachi 2:14). To depart is to deal treacherously against the wife of the covenant. And the bond holds while life lasts: *the wife is bound by the law as long as her husband liveth; but if her husband be dead, she is at liberty to be married to whom she will; only in Yahuah (Lord)* (1 Corinthians 7:39) — the Maker who *made one... that he might seek a godly seed* (Malachi 2:15) guards the marriage to the end, and her liberty, when it comes, is *only in Yahuah (Lord).*',
       sv.verse_id, ev.verse_id, 'free', 6756
  FROM _s228_co07_lookup sv, _s228_co07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=7 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *this commandment which I command thee this day, it is not hidden from thee, neither is it far off* the commandment Paul means by *the keeping of the commandments of Elohim (God),* near and given to be kept (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* the commandment given to be done; the keeping, not the flesh-mark, is the measure (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:16 — *to keep his commandments and his statutes and his judgments, that thou mayest live* the life set before Yashar''el (Israel); the same standard Paul sets over the assembly in place of the flesh-credential (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 12:13 — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* the Preacher''s conclusion is Paul''s thesis; not the flesh-mark but the kept commandment is the whole duty (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 15:15 — *If you will, to keep the commandments, and to perform acceptable faithfulness* the wisdom-library''s same measure; the kept commandment and faithfulness performed, not the flesh-credential (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:4 — *keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* the walk of the called; the distinction of circumcised/uncircumcised kept so each may so cleave (1 Corinthians 7:18).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:8 — *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments* the calling is a calling to obey; *abide with Elohim (God)* is to abide doing the commandments where one stands (1 Corinthians 7:24).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *shall cleave unto his wife: and they shall be one flesh* the creation-order ground for each having his own wife and husband (1 Corinthians 7:2).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *they shall be one flesh* the two are one body, so neither holds the body alone: *the wife hath not power of her own body, but the husband* (1 Corinthians 7:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 2:14 — *Yahuah (LORD) hath been witness between thee and the wife of thy youth... the wife of thy covenant* the witnessed covenant behind the command not to depart or put away (1 Corinthians 7:10-11).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 2:15 — *did not he make one?... That he might seek a godly seed* the Maker who guards the marriage; the wife *bound by the law as long as her husband liveth... only in Yahuah (Lord)* (1 Corinthians 7:39).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session228 — 1 Corinthians cross-references complete.'
