-- ----- fragment: minion_2corinthians_06.sql (S229 2 Corinthians 6) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 6 (18 verses) — COME OUT AND BE SEPARATE / the temple of
--   the living Elohim (God) — a HIGH-WATCHPOINT / BLESSING chapter (the gathering/separation).
-- Tag: 2c06 (temp view _s229_2c06_lookup).
-- Sort band: floor 7125, step 3 (7125, 7128, 7131 used; under 7150). One sort_order per thread.
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 2 Corinthians 6:14-18 is the GATHERING/SEPARATION of the covenant people —
-- the regathered, separated Yashar'el (Israel) and the grafted-in seed, the temple of the living
-- Elohim (God) — NOT a new institution replacing Israel. The centerpiece weaves a Tanakh catena:
-- *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my
-- people* (6:16) re-speaks the covenant-presence promise of Leviticus 26:11-12 (*I will set my
-- tabernacle among you... and I will walk among you, and will be your Elohim*) and Ezekiel 37:27
-- (*My tabernacle also shall be with them... and they shall be my people*) — the new-covenant
-- regathering of the two sticks made one. *Come out from among them, and be ye separate... touch
-- not the unclean thing* (6:17) re-speaks Isaiah 52:11 (*touch no unclean thing; go ye out of the
-- midst of her... ye that bear the vessels of Yahuah*) and Ezekiel 20:34 (*I will bring you out
-- from the people, and will gather you out of the countries*). *I will be a Father unto you, and ye
-- shall be my sons and daughters* (6:18) re-speaks the Davidic adoption of 2 Samuel 7:14 (*I will
-- be his father, and he shall be my son*) widened to all the regathered by Isaiah 43:6 (*bring my
-- sons from far, and my daughters from the ends of the earth*). And 6:2 (*now is the accepted time;
-- behold, now is the day of salvation*) cites Isaiah 49:8 (*In an acceptable time have I heard thee,
-- and in a day of salvation have I helped thee*). Sacred names are quoted EXACTLY as dump_canon
-- returns them; in the 6:17-18 catena the pull gives *Yahuah (Lord)* for the cited YHWH text.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   now is the accepted time, the day of salvation
--           Tanakh: Isaiah 49:8 (in an acceptable time have I heard thee, and in a day of salvation)
--           Extras: none warranted   NT: none warranted (the citation IS the Tanakh root)
--   v.3-10  the ministers' endurance catalogue (afflictions, stripes, as poor yet making many rich)
--           Tanakh: none warranted (a pastoral self-commendation, no load-bearing single root)
--           Extras: none warranted   NT: none warranted
--   v.11-13 our heart is enlarged, be ye also enlarged
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14-15 be ye not unequally yoked; what communion hath light with darkness; Messiah with Belial
--           Tanakh: Leviticus 26:1 (make you no idols... I am Yahuah Elohaychem); Deuteronomy roots
--                   allusive only — built on the no-idols separation of Leviticus 26:1 with the
--                   light/darkness contrast as the lead-in to the catena
--           Extras: none warranted   NT: none warranted (held in the separation thread)
--   v.16    the temple of the living Elohim; I will dwell in them and walk in them; they my people
--           Tanakh: Leviticus 26:11-12 (I will set my tabernacle among you... and walk among you),
--                   Ezekiel 37:27 (my tabernacle also shall be with them; they shall be my people)
--           Extras: none warranted   NT: none warranted (the citation IS the Tanakh root)
--   v.17    come out from among them, be ye separate, touch not the unclean thing
--           Tanakh: Isaiah 52:11 (touch no unclean thing; go ye out of the midst of her),
--                   Ezekiel 20:34 (I will bring you out from the people, and gather you)
--           Extras: none warranted   NT: none warranted
--   v.18    I will be a Father unto you, ye shall be my sons and daughters
--           Tanakh: 2 Samuel 7:14 (I will be his father, and he shall be my son),
--                   Isaiah 43:6 (bring my sons from far, and my daughters from the ends of the earth)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7125 2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26  (Tanakh)  [BLESSING CENTERPIECE]
--   7128 2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49  (Tanakh)
--   7131 2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26  [BLESSING CENTERPIECE]
  ('canon', '2-corinthians', 6, 16, 'canon', 'leviticus', 26, 11, 'free', E'*And I will set my tabernacle among you: and my soul shall not abhor you.* (Leviticus 26:11). When Paul says *ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16), he is citing Yahuah''s (LORD''s) own covenant-presence promise to Yashar''el (Israel). The promise *I will set my tabernacle among you* is not retired; it is the very word the apostle hears fulfilled in the gathered, separated people who are now the dwelling-place of the living Elohim (God). The temple is not exchanged for another people — it is the covenant of Sinai brought to its purpose.'),
  ('canon', '2-corinthians', 6, 16, 'canon', 'leviticus', 26, 12, 'free', E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12). This is the sentence Paul quotes almost word for word: *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). The *I will walk among you* of Leviticus becomes *walk in them*; the *ye shall be my people* stands unchanged. The indwelling-and-walking presence promised to Yashar''el (Israel) in the land is the presence dwelling now in the regathered congregation — the same covenant formula, *I will be their Elohim (God), and they shall be my people,* that runs from Sinai to the consummation.'),
  ('canon', '2-corinthians', 6, 16, 'canon', 'ezekiel', 37, 27, 'free', E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27). The same promise Paul cites is spoken by Ezekiel over the regathering of the two sticks made one — Yahudah (Judah) and Yashar''el (Israel) joined, *one nation in the land* under *one shepherd.* When Paul names the assembly *the temple of the living Elohim (God)* in whom Yahuah (LORD) says *I will dwell in them... and they shall be my people* (2 Corinthians 6:16), he is announcing that this new-covenant regathering has come: the tabernacle promised to the reunited house is set among the called-out at Corinth — the gathering, not the replacement, of Yashar''el (Israel).'),
  ('canon', '2-corinthians', 6, 17, 'canon', 'isaiah', 52, 11, 'free', E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD).* (Isaiah 52:11). Paul''s *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17) is this very word to the captives. Isaiah called the people to go out from Babylon clean, *that bear the vessels of Yahuah (LORD)* — set apart to carry the holy things. The apostle hears the same summons sounding over the assembly: the separated people are the ones who bear the vessels, the temple-bearers called out of all uncleanness to be received by Yahuah (LORD).'),
  ('canon', '2-corinthians', 6, 17, 'canon', 'ezekiel', 20, 34, 'free', E'*And I will bring you out from the people, and will gather you out of the countries wherein ye are scattered, with a mighty hand, and with a stretched out arm, and with fury poured out.* (Ezekiel 20:34). The *come out from among them, and be ye separate* of 2 Corinthians 6:17 is the regathering Yahuah (LORD) promised through Ezekiel: *I will bring you out from the people, and will gather you out of the countries.* The separation Paul commands is not a withdrawal into a new sect but obedience to the gathering hand of Yahuah (LORD) — the scattered brought out from the nations, purged of the rebels, *I will receive you* answering *I will bring you out.*'),
  ('canon', '2-corinthians', 6, 18, 'canon', '2-samuel', 7, 14, 'free', E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men:* (2 Samuel 7:14). Paul''s closing word of the catena, *And will be a Father unto you, and ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:18), widens the Davidic adoption Yahuah (LORD) spoke to David''s seed: *I will be his father, and he shall be my son.* The sonship promised to the throne of David is extended to the whole separated people — the regathered made sons and daughters of the Almighty, the household of the One who said he would build David an house for ever.'),
  ('canon', '2-corinthians', 6, 18, 'canon', 'isaiah', 43, 6, 'free', E'*I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* (Isaiah 43:6). The *sons and daughters* of 2 Corinthians 6:18 are the very sons and daughters Yahuah (LORD) promised to regather: *bring my sons from far, and my daughters from the ends of the earth.* Paul''s *ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* gathers up the scattered children Isaiah saw brought home from the four winds — *every one that is called by my name: for I have created him for my glory.* The Father-and-children promise is the promise of the ingathering, the separated people received as the sons and daughters of the living Elohim (God).'),
  -- thread: 2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49
  ('canon', '2-corinthians', 6, 2, 'canon', 'isaiah', 49, 8, 'free', E'*Thus saith Yahuah (LORD), In an acceptable time have I heard thee, and in a day of salvation have I helped thee: and I will preserve thee, and give thee for a covenant of the people, to establish the earth, to cause to inherit the desolate heritages;* (Isaiah 49:8). Paul cites this verse outright: *(For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.)* (2 Corinthians 6:2). The *acceptable time* and *day of salvation* are the appointed season of Yahuah''s (LORD''s) Servant — the One *given for a covenant of the people* to restore the desolate heritages and bring the prisoners out. Paul announces that the appointed day has dawned: *now is the accepted time,* the season of the covenant-Servant''s saving work, the call not to receive the grace of Elohim (God) in vain.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- A second small INSERT for the third thread (Leviticus 26:1 idols; reuses the catena's Isaiah 52:11 row is avoided — distinct target).
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26
  ('canon', '2-corinthians', 6, 14, 'canon', 'leviticus', 26, 1, 'free', E'*Ye shall make you no idols nor graven image, neither rear you up a standing image, neither shall ye set up any image of stone in your land, to bow down unto it: for I am Yahuah Elohaychem (the LORD your God).* (Leviticus 26:1). The chapter whose covenant-presence promise Paul cites at v.16 opens with this very command of separation from idols. Paul''s *Be ye not unequally yoked together with unbelievers... what agreement hath the temple of Elohim (God) with idols?* (2 Corinthians 6:14,16) is the same line drawn at the head of Leviticus 26: the people in whom Yahuah (LORD) sets his tabernacle are the people who set up no idols. The *no concord... with Belial,* *no communion of light with darkness,* is the holiness that flows straight from *I am Yahuah Elohaychem (the LORD your God).*'),
  ('canon', '2-corinthians', 6, 16, 'canon', 'leviticus', 26, 1, 'free', E'*Ye shall make you no idols nor graven image... for I am Yahuah Elohaychem (the LORD your God).* (Leviticus 26:1). When Paul asks *what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God)* (2 Corinthians 6:16), he sets the indwelling promise of Leviticus 26:11-12 against the idol-prohibition of Leviticus 26:1 — the two ends of the same chapter. The dwelling of Yahuah (LORD) among his people and the casting-out of every idol are one covenant: the temple of the living Elohim (God) can hold no graven image, and the separated people bow to none but *Yahuah Elohaychem (the LORD your God).*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26',
       E'I will dwell in them — the temple of the living Elohim (God): come out and be separate (Leviticus 26, Ezekiel 37, Isaiah 52, 2 Samuel 7)',
       E'At the heart of the chapter Paul gathers a Tanakh catena into one call: *And what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people. Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you, And will be a Father unto you, and ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:16-18). Every clause is a quoted promise to Yashar''el (Israel), and reading them together shows what Paul means: this is the regathered, separated covenant people — the temple of the living Elohim (God) — NOT a new institution replacing Israel. The indwelling word is Yahuah''s (LORD''s) own covenant-presence promise: *And I will set my tabernacle among you... And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12), and again over the regathering of the two sticks made one, *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). The *I will walk among you* of Sinai becomes *walk in them*; the covenant formula *they shall be my people* stands unchanged. The come-out word is Isaiah''s summons to the captives: *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11) — the separated people are the temple-bearers, called out clean to carry the holy things — joined to Ezekiel''s regathering, *I will bring you out from the people, and will gather you out of the countries wherein ye are scattered* (Ezekiel 20:34). The *separation* Paul commands is not withdrawal into a sect but obedience to the gathering hand of Yahuah (LORD): *I will bring you out* answered by *I will receive you.* And the closing adoption widens the Davidic promise to the whole people: *I will be his father, and he shall be my son* (2 Samuel 7:14), the sonship of David''s seed, spread to all the regathered as Isaiah foresaw — *bring my sons from far, and my daughters from the ends of the earth* (Isaiah 43:6), *every one that is called by my name.* So the come-out-and-be-separate is the gathering/separation of the one covenant people: dwelt-in by the living Elohim (God), called clean out of the nations, made sons and daughters of *Yahuah (Lord) Almighty.* This is the consummation of Sinai and the prophets, not their abolition; the temple of the living Elohim (God) is Yashar''el (Israel) and the grafted-in seed brought home.',
       sv.verse_id, ev.verse_id, 'free', 7125
  FROM _s229_2c06_lookup sv, _s229_2c06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49',
       E'Now is the accepted time, now is the day of salvation (Isaiah 49)',
       E'Paul opens the chapter pleading that the assembly *receive not the grace of Elohim (God) in vain,* and grounds the urgency in a quoted prophecy: *(For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.)* (2 Corinthians 6:2). The verse he cites is Yahuah''s (LORD''s) word to his Servant: *Thus saith Yahuah (LORD), In an acceptable time have I heard thee, and in a day of salvation have I helped thee: and I will preserve thee, and give thee for a covenant of the people, to establish the earth, to cause to inherit the desolate heritages* (Isaiah 49:8). The *acceptable time* and *day of salvation* are the appointed season of the covenant-Servant — the One given *for a covenant of the people,* sent to say to the prisoners *Go forth,* to restore the preserved of Yashar''el (Israel) and be *a light to the Gentiles... my salvation unto the end of the earth.* Paul announces that this appointed day has dawned: *behold, now is the accepted time.* The season Isaiah foretold is present, the Servant''s saving work is at hand, and therefore the grace of Elohim (God) is not to be received in vain.',
       sv.verse_id, ev.verse_id, 'free', 7128
  FROM _s229_2c06_lookup sv, _s229_2c06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26',
       E'What communion hath light with darkness — the unequal yoke and the no-idols of the covenant (Leviticus 26)',
       E'Before the come-out catena Paul draws the line of separation in a string of contrasts: *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness? And what concord hath Messiah (Christ) with Belial?... And what agreement hath the temple of Elohim (God) with idols?* (2 Corinthians 6:14-16). The chapter whose covenant-presence promise he is about to cite opens with this very command: *Ye shall make you no idols nor graven image, neither rear you up a standing image, neither shall ye set up any image of stone in your land, to bow down unto it: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 26:1). The two ends of Leviticus 26 are the two halves of Paul''s thought: the people in whom Yahuah (LORD) sets his tabernacle (Leviticus 26:11-12) are the people who set up no idols (Leviticus 26:1). The *no concord with Belial,* the *no communion of light with darkness,* is not a new asceticism but the old holiness — the temple of the living Elohim (God) can hold no graven image, and the separated people bow to none but *Yahuah Elohaychem (the LORD your God).* The unequal yoke is forbidden because the dwelling of Yahuah (LORD) among his people and the casting-out of every idol are one and the same covenant.',
       sv.verse_id, ev.verse_id, 'free', 7131
  FROM _s229_2c06_lookup sv, _s229_2c06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:11 — *I will set my tabernacle among you: and my soul shall not abhor you* the covenant-presence promise; *ye are the temple of the living Elohim (God)... I will dwell in them* (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:12 — *I will walk among you, and will be your Elohim (God), and ye shall be my people* quoted almost word for word: *walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:27 — *My tabernacle also shall be with them... and they shall be my people* the same promise over the two sticks made one; the temple-presence in the regathered congregation (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 52:11 — *touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* the summons to the captives; *come out from among them, and be ye separate... touch not the unclean thing* (2 Corinthians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 20:34 — *I will bring you out from the people, and will gather you out of the countries wherein ye are scattered* the regathering; *I will receive you* answers *I will bring you out* (2 Corinthians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Samuel 7:14 — *I will be his father, and he shall be my son* the Davidic adoption; widened to the separated people, *I will be a Father unto you, and ye shall be my sons and daughters* (2 Corinthians 6:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Isaiah 43:6 — *bring my sons from far, and my daughters from the ends of the earth* the ingathering of the scattered children; *ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:8 — *In an acceptable time have I heard thee, and in a day of salvation have I helped thee... give thee for a covenant of the people* the Servant''s appointed season; cited outright, *behold, now is the accepted time; behold, now is the day of salvation* (2 Corinthians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:1 — *Ye shall make you no idols nor graven image... for I am Yahuah Elohaychem (the LORD your God)* the no-idols command opening the chapter; *Be ye not unequally yoked... what communion hath light with darkness?* (2 Corinthians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:1 — *Ye shall make you no idols... for I am Yahuah Elohaychem (the LORD your God)* set against the indwelling promise of the same chapter; *what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God)* (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
