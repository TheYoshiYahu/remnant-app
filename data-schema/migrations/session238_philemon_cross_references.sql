-- =====================================================================
-- Session 238 — Philemon FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session238_philemon_cross_references.sql
-- =====================================================================

\echo 'session238 — Philemon cross-references starting...'
BEGIN;

-- ----- fragment: minion_philemon_01.sql (S238 Philemon 1) -----
-- =====================================================================
-- S238 minion — PHILEMON 1 FULL-LIBRARY cross-references (the whole one-chapter letter)
-- =====================================================================
-- Chapter: PHILEMON 1 (25 verses) — Paul's plea from prison for Onesimus, the runaway servant,
-- to be received back *not now as a servant, but above a servant, a brother beloved* (1:16).
-- Tag: t238c1 (temp view _s238_t238c1_lookup).
-- Sort band: floor 8750, step 3 (8750, 8753 used).
-- Source is ALWAYS the canon Philemon verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (no replacement theology, no law-vs-grace antithesis): this is a short, intensely
-- personal letter, and its load-bearing weight is RECONCILIATION and the RECEIVING OF A BROTHER. Two
-- centers warrant a thread; the greetings, thanksgiving, and travel notes warrant nothing. The brother
-- received not as a servant but above a servant reads through the Yoseph (Joseph) pattern — the brother
-- sold/lost, received back, the evil meant against him turned to good by Elohim's providence; the assumed
-- debt reads through the surety of the Tanakh — Yahudah (Judah) becoming surety for Binyamin (Benjamin).
-- Onesimus is being RETURNED to his master willingly (not harbored), so Deuteronomy 23:15-16 (the escaped
-- servant not delivered up) is the OPPOSITE posture and is NOT woven; Deuteronomy 15:12-15 (the freed
-- servant) is a different sense and NOT woven. Proverbs on suretyship is a CAUTION, a different sense, NOT
-- woven against 1:18-19.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   greeting (Paul a prisoner; to Philemon, Apphia, Archippus, the church in thy house)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.4-7   thanksgiving and prayer (thy love and faith; the bowels of the saints refreshed)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.8-14  the plea (Onesimus, once unprofitable now profitable; sent again; willingly not of necessity)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (the receiving thread
--                   anchors at 15-17 where the brother-beloved language fires)
--   v.15-17 received no longer as a servant but as a brother beloved  [★ THE YOSEPH PATTERN]
--           Tanakh: Genesis 50:20 (ye thought evil... but Elohim meant it unto good), Genesis 45:5
--                   (Elohim did send me before you to preserve life), Leviticus 19:17 (thou shalt not
--                   hate thy brother), Leviticus 19:18 (thou shalt love thy neighbour as thyself)
--           Extras: Ecclesiasticus/Sirach 7:20 (entreat thy servant not evil), Sirach 7:21 (let thy
--                   soul love a good servant)
--           NT: Colossians 4:9 (Onesimus, a faithful and beloved brother — the twin reference)
--   v.18-19 put that on mine account; I will repay it  [★ THE SURETY]
--           Tanakh: Genesis 43:9 (I will be surety for him), Genesis 44:32 (thy servant became surety
--                   for the lad), Genesis 44:33 (let thy servant abide instead of the lad a bondman)
--           Extras: none warranted   NT: none warranted
--   v.20-25 personal requests, lodging, salutations, benediction
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8750 philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50  (Tanakh + Extras + NT)  [★ CENTERPIECE]
--   8753 philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43             (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s238_t238c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50
  ('canon', 'philemon', 1, 15, 'canon', 'genesis', 45, 5, 'free', E'*Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* (Genesis 45:5). When Yoseph (Joseph) made himself known to the brethren who had sold him, he read his own parting as providence: *Elohim (God) did send me before you to preserve life.* Paul reads Onesimus'' departure the same way: *For perhaps he therefore departed for a season, that thou shouldest receive him for ever* (Philemon 1:15). The brother who was lost was sent ahead by a hidden hand, that the parting might turn to a greater reunion — the runaway returned not as the wrong he did but as the good Elohim (God) meant by it.'),
  ('canon', 'philemon', 1, 15, 'canon', 'genesis', 50, 20, 'free', E'*But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20). This is the heart of the Yoseph (Joseph) pattern: *ye thought evil against me; but Elohim (God) meant it unto good.* The brother sold into servitude is received back, and the wrong is swallowed up in providence. So Paul: *perhaps he therefore departed for a season, that thou shouldest receive him for ever* (Philemon 1:15) — the same turning of an evil parting into an appointed good, the lost one restored by the providence of Elohim (God).'),
  ('canon', 'philemon', 1, 16, 'canon', 'leviticus', 19, 17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* (Leviticus 19:17). The Torah forbids the hatred of a brother; Paul asks Philemon to receive Onesimus *Not now as a servant, but above a servant, a brother beloved* (Philemon 1:16). The grudge a master might hold against a runaway is exactly what *thou shalt not hate thy brother in thine heart* puts away — the receiving back is the commandment kept, the brother no longer reckoned by his offence but loved.'),
  ('canon', 'philemon', 1, 16, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The royal commandment — *thou shalt love thy neighbour as thyself* — is the ground of Paul''s whole plea. Onesimus is to be received *above a servant, a brother beloved... both in the flesh, and in Yahuah (Lord)* (Philemon 1:16). To love him as a brother beloved, neither avenging the wrong nor bearing the grudge, is simply to do toward him what Yahuah (LORD) commanded toward every neighbour.'),
  ('canon', 'philemon', 1, 16, 'apocrypha', 'ecclesiasticus', 7, 20, 'extras', E'*Whereas your servant works truly, entreat him not evil, nor the hireling that bestoweth himself wholly for you.* (Ecclesiasticus 7:20). The Hebrew library already taught the master''s duty: *whereas your servant works truly, entreat him not evil.* Onesimus *now profitable* (Philemon 1:11) is the servant who works truly, and Paul asks that he be received not with the rod but *above a servant, a brother beloved* (Philemon 1:16) — the same merciful posture toward the faithful servant that Sirach commends.'),
  ('canon', 'philemon', 1, 16, 'apocrypha', 'ecclesiasticus', 7, 21, 'extras', E'*Let your soul love a good servant, and defraud him not of liberty.* (Ecclesiasticus 7:21). Sirach goes further than mere fair treatment: *let your soul love a good servant.* This is precisely the step Paul asks of Philemon — to receive Onesimus *above a servant, a brother beloved* (Philemon 1:16), the servant not merely spared but loved, the bond raised into brotherhood.'),
  ('canon', 'philemon', 1, 16, 'canon', 'colossians', 4, 9, 'free', E'*With Onesimus, a faithful and beloved brother, who is one of you. They shall make known unto you all things which are done here.* (Colossians 4:9). The twin reference seals the matter from the other side: writing to the same assembly, Paul names Onesimus *a faithful and beloved brother, who is one of you.* The plea of Philemon — *above a servant, a brother beloved* (Philemon 1:16) — is no mere request but the standing reality Paul announces to the Colossians: the runaway servant now reckoned, openly and among the brethren, a beloved brother.')
,
  -- thread: philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43
  ('canon', 'philemon', 1, 18, 'canon', 'genesis', 43, 9, 'free', E'*I will be surety for him; of my hand shalt thou require him: if I bring him not unto thee, and set him before thee, then let me bear the blame for ever:* (Genesis 43:9). Yahudah (Judah) pledged himself for Binyamin (Benjamin): *I will be surety for him; of my hand shalt thou require him.* Paul does the same for Onesimus: *If he hath wronged thee, or oweth thee ought, put that on mine account* (Philemon 1:18). The one who is whole steps into the place of the one who owes, taking the debt upon himself — the surety of the Tanakh, the brother who answers for the brother.'),
  ('canon', 'philemon', 1, 19, 'canon', 'genesis', 44, 32, 'free', E'*For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever.* (Genesis 44:32). Yahudah (Judah) names his pledge again as he pleads before Yoseph (Joseph): *thy servant became surety for the lad.* Paul takes up the same suretyship in his own hand: *I Paul have written it with mine own hand, I will repay it* (Philemon 1:19). The bond is personal, signed, binding — the surety who will himself make good whatever the other owes.'),
  ('canon', 'philemon', 1, 19, 'canon', 'genesis', 44, 33, 'free', E'*Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren.* (Genesis 44:33). Yahudah''s (Judah''s) suretyship reaches its height: *let thy servant abide instead of the lad a bondman.* He offers to take the bondage himself that his brother may go free. Paul''s pledge breathes the same substitution — *put that on mine account; I... will repay it* (Philemon 1:18-19) — the surety who assumes the other''s debt and bondage, the type of the redeemer who stands in the place of the one who cannot pay.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s238_t238c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s238_t238c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50',
       E'Not now as a servant, but above a servant, a brother beloved — the Yoseph pattern (Genesis 50, 45)',
       E'The heart of Paul''s letter is the receiving of a brother. He sends the runaway Onesimus back to his master with the plea: *For perhaps he therefore departed for a season, that thou shouldest receive him for ever; Not now as a servant, but above a servant, a brother beloved, specially to me, but how much more unto thee, both in the flesh, and in Yahuah (Lord)?* (Philemon 1:15-16). Read through the whole library, this is the Yoseph (Joseph) pattern. Yoseph (Joseph), the brother sold into servitude, received his brethren back and read his own parting as providence: *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5), and again, *ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). The evil parting turned to an appointed good; the lost one restored. So Paul reads Onesimus'' flight — *he therefore departed for a season, that thou shouldest receive him for ever* — the same hidden hand turning a wrong into a greater reunion. And the receiving itself is the Torah kept: *Thou shalt not hate thy brother in thine heart* (Leviticus 19:17), *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To welcome the runaway *above a servant, a brother beloved,* neither avenging the wrong nor bearing the grudge, is to do toward him what Yahuah (LORD) commanded toward every neighbour. The Hebrew library taught the master''s duty in the same key: *Whereas your servant works truly, entreat him not evil* (Ecclesiasticus 7:20), and higher still, *Let your soul love a good servant, and defraud him not of liberty* (Ecclesiasticus 7:21) — the servant not merely spared but loved, the bond raised into brotherhood. And the matter is sealed from the other side: writing to the same assembly Paul names Onesimus openly *a faithful and beloved brother, who is one of you* (Colossians 4:9). No master replacing the servant, no servant cast off — one household, the lost one received, *above a servant, a brother beloved.*',
       sv.verse_id, ev.verse_id, 'extras', 8750
  FROM _s238_t238c1_lookup sv, _s238_t238c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='philemon' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43',
       E'Put that on mine account; I will repay it — the surety (Genesis 43, 44)',
       E'Paul does not only ask that Onesimus be received; he assumes the debt himself. *If he hath wronged thee, or oweth thee ought, put that on mine account; I Paul have written it with mine own hand, I will repay it* (Philemon 1:18-19). This is the surety of the Tanakh. When the famine drove the brethren back to Egypt and the lad Binyamin (Benjamin) had to go with them, Yahudah (Judah) pledged himself: *I will be surety for him; of my hand shalt thou require him: if I bring him not unto thee, and set him before thee, then let me bear the blame for ever* (Genesis 43:9). Pleading before Yoseph (Joseph), he named the pledge again — *thy servant became surety for the lad unto my father* (Genesis 44:32) — and offered to take the bondage himself that the lad might go free: *let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren* (Genesis 44:33). The one who is whole steps into the place of the one who owes, the brother who answers for the brother with his own hand and his own freedom. So Paul, *with mine own hand,* takes Onesimus'' debt as his own — the surety who assumes another''s account, the very type of the redeemer who stands in the place of the one who cannot pay.',
       sv.verse_id, ev.verse_id, 'free', 8753
  FROM _s238_t238c1_lookup sv, _s238_t238c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='philemon' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:5 — *Elohim (God) did send me before you to preserve life* Yoseph (Joseph) reads his parting as providence; *he therefore departed for a season, that thou shouldest receive him for ever* (Philemon 1:15).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:20 — *ye thought evil against me; but Elohim (God) meant it unto good* the heart of the Yoseph (Joseph) pattern, the wrong swallowed up in providence; *that thou shouldest receive him for ever* (Philemon 1:15).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart* the grudge a master might hold put away; received *above a servant, a brother beloved* (Philemon 1:16).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the royal commandment that grounds the plea; *a brother beloved... both in the flesh, and in Yahuah (Lord)* (Philemon 1:16).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 7:20 — *whereas your servant works truly, entreat him not evil* the master''s duty to the faithful servant; Onesimus *now profitable* received *above a servant, a brother beloved* (Philemon 1:11,16).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ecclesiasticus 7:21 — *Let your soul love a good servant* the servant not merely spared but loved; the bond raised into brotherhood, *a brother beloved* (Philemon 1:16).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Colossians 4:9 — *Onesimus, a faithful and beloved brother, who is one of you* the twin reference sealing the matter; the plea of Philemon stands fulfilled, *above a servant, a brother beloved* (Philemon 1:16).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-not-now-a-servant-but-a-brother-beloved-the-yoseph-pattern-genesis-50'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:9 — *I will be surety for him; of my hand shalt thou require him* Yahudah (Judah) pledging himself for Binyamin (Benjamin); *put that on mine account* (Philemon 1:18).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:32 — *thy servant became surety for the lad unto my father* the pledge named before Yoseph (Joseph); *I Paul have written it with mine own hand, I will repay it* (Philemon 1:19).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 44:33 — *let thy servant abide instead of the lad a bondman to my lord; and let the lad go up* the surety offering to take the bondage himself; *put that on mine account; I... will repay it* (Philemon 1:18-19).'
  FROM cross_reference_threads t, cross_references x, _s238_t238c1_lookup sv, _s238_t238c1_lookup tv
 WHERE t.slug='philemon-1-put-that-on-mine-account-i-will-repay-the-surety-genesis-43'
   AND sv.edition_slug='canon' AND sv.book_slug='philemon' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session238 — Philemon cross-references complete.'
