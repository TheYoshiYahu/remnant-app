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
