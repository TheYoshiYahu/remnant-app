-- ----- fragment: minion_2corinthians_07.sql (S229 2 Corinthians 7) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 7 (16 verses) — godly sorrow worketh repentance; perfecting holiness.
-- Tag: 2c07 (temp view _s229_2c07_lookup).
-- Sort band: floor 7150, step 3 (7150, 7153 used; under 7175). One sort_order per thread.
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — this is a pastoral chapter, and a thin one for parallels. 7:1 *let us cleanse
-- ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim
-- (God)* flows straight out of the 6:16-18 indwelling/separation promises — *I will dwell in them,
-- and walk in them... be ye separate.* Having those promises, the called-out people answer the
-- Leviticus holiness call: *ye shall be holy; for I am holy* (Leviticus 11:44-45, 19:2, 20:26). The
-- fear of Elohim (God) in which holiness is perfected is the very fear of Yahuah (God) the restored
-- library names as the heart's preparation (Sirach 2:17, 1:14). Then 7:9-11 unfolds the two sorrows:
-- *godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world
-- worketh death* (7:10) — the turning-of-the-heart the prophets called Yashar'el (Israel) to: the
-- broken and contrite heart Elohim (God) will not despise (Psalm 51:17), the rent heart and the
-- turning unto Yahuah (LORD) (Joel 2:12-13), the contrite spirit that trembleth at his word (Isaiah
-- 66:2), and the repentance shewn in the time of sins (Sirach 18:21). Two curated threads; the
-- comfort/Titus narrative (vv.2-8,12-16) is pastoral report with no load-bearing root — none warranted.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     having these promises, cleanse ourselves... perfecting holiness in the fear of Elohim (God)
--           Tanakh: Leviticus 11:44, 11:45, 19:2, 20:26 (be ye holy, for I am holy)
--           Extras: Sirach 2:17 (they that fear Yahuah will prepare their hearts, and humble their
--                   souls), Sirach 1:14 (to fear Yahuah is the beginning of wisdom)
--           NT: none warranted (the holiness-call root is the Leviticus catena)
--   v.2-8   receive us... comforted by the coming of Titus... made you sorry with a letter
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (pastoral narrative — Paul's defense and the report of Titus; no load-bearing parallel)
--   v.9-11  ye sorrowed to repentance; godly sorrow worketh repentance to salvation; the sorrow of
--           the world worketh death
--           Tanakh: Psalm 51:17 (a broken and a contrite heart), Joel 2:12 (turn ye even to me with
--                   all your heart... with weeping, and with mourning), Joel 2:13 (rend your heart...
--                   and turn unto Yahuah Elohaychem), Isaiah 66:2 (poor and of a contrite spirit, and
--                   trembleth at my word)
--           Extras: Sirach 18:21 (in the time of sins shew repentance)
--           NT: none warranted (the godly-sorrow root is the Tanakh repentance call)
--   v.12-16 our care for you... comforted in your comfort... the joy of Titus... confidence in you
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (pastoral close — Paul's confidence and Titus' refreshment; no parallel)
--
-- THREADS (slug -> target libraries):
--   7150 2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11  (Tanakh + Extras)
--   7153 2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51  (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s229_2c07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 11, 44, 'free', E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* (Leviticus 11:44). The holiness Paul calls for is the holiness Yahuah (LORD) commanded at Sinai — *ye shall be holy; for I am holy.* Having the indwelling promise of 6:16-18, the called-out people *cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The cleansing and the holiness are not new commandments but the old call answered: the people in whom Elohim (God) dwells *sanctify yourselves, and ye shall be holy,* for he who walks among them is holy.'),
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 11, 45, 'free', E'*For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy.* (Leviticus 11:45). The ground of the holiness call is that Yahuah (LORD) made himself their Elohim (God) — *to be your Elohim (God): ye shall therefore be holy.* This is the very promise Paul has just rehearsed, *I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16); so *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1) is the indwelt people becoming what their indwelling God is. Because *I am holy,* his redeemed are to *be holy.*'),
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 19, 2, 'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* (Leviticus 19:2). The whole congregation of Yashar''el (Israel) is summoned to holiness on one ground — *for I Yahuah Elohaychem (the LORD your God) am holy.* Paul speaks the same word to the gathered assembly: *let us cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The Corinthian assembly is that congregation called to *be holy,* the holiness of the covenant people grounded in the holiness of their God.'),
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 20, 26, 'free', E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* (Leviticus 20:26). Holiness and separation are one word: Yahuah (LORD) *severed you from other people, that ye should be mine,* and therefore *ye shall be holy unto me.* This is exactly the movement of Paul''s plea — out of the *come out from among them, and be ye separate* of 6:17 flows *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The severed, separated people *that ye should be mine* are the same called-out ones cleansing themselves *from all filthiness of the flesh and spirit,* holy because their God is holy.'),
  ('canon', '2-corinthians', 7, 1, 'apocrypha', 'ecclesiasticus', 2, 17, 'extras', E'*They that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight,* (Sirach 2:17). The restored library knows the *fear of Elohim (God)* in which holiness is perfected as the heart''s own preparation: *they that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight.* This is the inward work behind Paul''s *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1) — the cleansing *from all filthiness of the flesh and spirit* is a prepared heart and a humbled soul before the One who dwells among his people. The fear of Yahuah (God) is not dread but the reverent self-cleansing of those who would be holy unto him.'),
  ('canon', '2-corinthians', 7, 1, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Sirach 1:14). The library roots all true wisdom in the fear Paul names — *to fear Yahuah (God) is the beginning of wisdom.* When Paul bids the assembly *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1), he sets the whole pursuit of holiness in that beginning: the reverence of the indwelling God is the soil in which a clean and sanctified life grows. The fear of Yahuah (God), the first thing and the deepest thing, is the very fear in which the called-out people cleanse themselves and are made holy.'),
  -- thread: 2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51
  ('canon', '2-corinthians', 7, 10, 'canon', 'psalms', 51, 17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). David''s repentance names the godly sorrow Paul commends: not a sacrifice of beasts but *a broken and a contrite heart,* which *thou wilt not despise.* Paul rejoices that the Corinthians *sorrowed to repentance,* for *godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:9-10). The broken spirit Elohim (God) receives is the godly sorrow that works repentance unto salvation — the heart turned toward him, not the world''s remorse that ends in death.'),
  ('canon', '2-corinthians', 7, 10, 'canon', 'joel', 2, 12, 'free', E'*Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* (Joel 2:12). Yahuah (LORD) calls his people to the very sorrow that turns: *turn ye even to me with all your heart, and with... weeping, and with mourning.* This is *godly sorrow* — the weeping and mourning that move the heart back to him — and it *worketh repentance to salvation not to be repented of* (2 Corinthians 7:10). Paul saw it in the Corinthians'' *mourning* and *earnest desire* (7:7); the sorrow that turns the whole heart to Yahuah (LORD) is the sorrow unto life, not the sorrow of the world that *worketh death.*'),
  ('canon', '2-corinthians', 7, 10, 'canon', 'joel', 2, 13, 'free', E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* (Joel 2:13). True repentance is inward — *rend your heart, and not your garments,* and *turn unto Yahuah Elohaychem (the LORD your God).* This is the difference between the two sorrows Paul sets side by side: *godly sorrow worketh repentance to salvation... but the sorrow of the world worketh death* (2 Corinthians 7:10). The rent heart that turns to the gracious and merciful Yahuah (LORD) is the godly sorrow; mere outward grief, the rent garment without the rent heart, is the world''s sorrow that ends in death.'),
  ('canon', '2-corinthians', 7, 10, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). Yahuah (LORD) looks upon one man — *him that is poor and of a contrite spirit, and trembleth at my word.* The contrite spirit that trembles at his word is the *godly sorrow* that *worketh repentance to salvation* (2 Corinthians 7:10), and it is of a piece with the *fear of Elohim (God)* in which the same chapter calls the people to perfect holiness (7:1). The trembling, contrite heart upon which Yahuah (LORD) sets his eye is the heart Paul rejoices to see in the Corinthians — sorrow that draws near to God, not the world''s grief that drives toward death.'),
  ('canon', '2-corinthians', 7, 10, 'apocrypha', 'ecclesiasticus', 18, 21, 'extras', E'*Humble thyself before you be sick, and in the time of sins shew repentance.* (Sirach 18:21). The restored library counsels the very thing Paul commends — *in the time of sins shew repentance,* and *humble thyself.* This is the godly sorrow that does not wait, the turning of the heart in the day of wrongdoing: *godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). The humbled soul that shews repentance in the time of its sins is the soul that sorrows unto life; the unhumbled grief of the world is the sorrow that works death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11',
       E'Perfecting holiness in the fear of Elohim (God) — be ye holy, for I am holy (Leviticus 11)',
       E'*Having therefore these promises, dearly beloved, let us cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The *promises* are the ones just rehearsed — *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (6:16), *come out from among them, and be ye separate* (6:17). Out of the indwelling and the separation flows the holiness; and the holiness Paul calls for is not a new commandment but the old Sinai word answered. Four times Yahuah (LORD) grounds the call on his own holiness: *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44); *I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* (Leviticus 11:45); *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2); and the holiness that is also separation — *ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). The very logic of 6:16-7:1 is there in Leviticus: he is their Elohim (God), he has severed them to be his own, therefore they are to be holy as he is holy. And the *fear of Elohim (God)* in which holiness is perfected is the fear the restored library names as the heart''s own preparation: *they that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* (Sirach 2:17), for *to fear Yahuah (God) is the beginning of wisdom* (Sirach 1:14). The cleansing *from all filthiness of the flesh and spirit* is a prepared heart and a humbled soul; the holiness is the indwelt, separated people becoming what their indwelling God is. This is not Torah set aside but Torah''s holiness call brought to its purpose in the people in whom Elohim (God) now dwells.',
       sv.verse_id, ev.verse_id, 'extras', 7150
  FROM _s229_2c07_lookup sv, _s229_2c07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51',
       E'Godly sorrow worketh repentance — the broken and contrite heart that turns to Yahuah (Psalm 51, Joel 2)',
       E'Paul rejoices not that the Corinthians grieved but that *ye sorrowed to repentance: for ye were made sorry after a godly manner* (2 Corinthians 7:9), and he draws the line between two sorrows: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (7:10). The godly sorrow is the broken heart the prophets and the psalmist knew. David, after his sin, learned that *the sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the sorrow that God receives is the contrite heart, not the spilt blood of beasts. Yahuah (LORD) calls his people into that same sorrow that turns: *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12), and presses it inward — *rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful* (Joel 2:13). There is the whole distinction: the rent heart that turns to the merciful Yahuah (LORD) is godly sorrow unto salvation; the rent garment without the rent heart, the mere remorse of the world, *worketh death.* It is the contrite spirit upon whom Yahuah (LORD) sets his eye — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2) — the same trembling reverence as the *fear of Elohim (God)* of 7:1. And the restored library urges the turning without delay: *Humble thyself before you be sick, and in the time of sins shew repentance* (Sirach 18:21). The Corinthians'' *mourning,* their *fear,* their *vehement desire* (7:7,11) are this godly sorrow — the heart broken and turned to God, the sorrow that works life, not the world''s grief that ends in death.',
       sv.verse_id, ev.verse_id, 'extras', 7153
  FROM _s229_2c07_lookup sv, _s229_2c07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:44 — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* the Sinai holiness call grounded in God''s own holiness; *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:45 — *to be your Elohim (God): ye shall therefore be holy, for I am holy* the same ground Paul rehearsed (*I will be their Elohim,* 6:16); the indwelt people becoming what their God is (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* the whole congregation of Yashar''el (Israel) summoned to holiness; the gathered assembly cleansing itself (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 20:26 — *ye shall be holy unto me... and have severed you from other people, that ye should be mine* holiness as separation, the very movement of 6:17 into 7:1 (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 2:17 — *they that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* the inward work behind *the fear of Elohim (God)* in which holiness is perfected (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 1:14 — *to fear Yahuah (God) is the beginning of wisdom* the reverence that is the soil of holiness; *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 51:17 — *a broken and a contrite heart, O Elohim (God), thou wilt not despise* the sorrow God receives; *godly sorrow worketh repentance to salvation* (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:12 — *turn ye even to me with all your heart, and with... weeping, and with mourning* the sorrow that turns; the *mourning* Paul saw working repentance unto salvation (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:13 — *rend your heart, and not your garments, and turn unto Yahuah Elohaychem* the rent heart that turns is godly sorrow; the rent garment alone is the world''s sorrow that *worketh death* (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 66:2 — *him that is poor and of a contrite spirit, and trembleth at my word* the contrite, trembling heart God looks upon; the same reverence as the *fear of Elohim* of 7:1 (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 18:21 — *Humble thyself before you be sick, and in the time of sins shew repentance* the turning without delay; the godly sorrow that works life, not the world''s grief unto death (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
