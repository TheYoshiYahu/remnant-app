-- =====================================================================
-- Session 237 — Titus FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session237_titus_cross_references.sql
-- =====================================================================

\echo 'session237 — Titus cross-references starting...'
BEGIN;

-- ----- fragment: minion_titus_01.sql (S237 Titus 1) -----
-- =====================================================================
-- S237 minion — TITUS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: TITUS 1 (16 verses) — Paul's charge to a shepherd in Crete: set in order the things that
-- are wanting, ordain elders in every city, and rebuke the empty talkers of the circumcision.
-- Tag: t237c1 (temp view _s237_t237c1_lookup).
-- Sort band: floor 8650 (8650, 8653, 8656, 8659 used; under 8674).
-- Source is ALWAYS the canon Titus verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: ★ 1:2 — eternal life promised before the world began is the FATHER'S eternal
-- purpose, the twin of 2 Timothy 1:9 (grace given us before the world began); *Elohim that cannot
-- lie* echoes Numbers 23:19 (*Elohim is not a man, that he should lie*). ⚠ 1:10-16 — the rebuke is
-- corrupt MEN (deceivers who teach for filthy lucre) and the *Yahudi (Jewish) fables, and commandments
-- of men* (1:14), the traditions of men that make void the word (Isaiah 29:13, Mark 7:7) — NOT the
-- Torah of Yahuah. ⚠ 1:15 *Unto the pure all things are pure... unto them that are defiled... is
-- nothing pure; but even their mind and conscience is defiled* is the DEFILED CONSCIENCE (Psalm 24:4,
-- 51:10; Wisdom 17:11), NOT a repeal of clean/unclean — Leviticus 11 / Deuteronomy 14 STAND. Keep the
-- Father the source of the promise; no replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the faith of Elohim's elect, eternal life promised before the world began
--           Tanakh: Numbers 23:19 (Elohim is not a man, that he should lie)
--           Extras: none warranted   NT: 2 Timothy 1:9 (grace given... before the world began)
--   v.4-9   ordain elders / a bishop blameless, holding fast the faithful word
--           Tanakh: none warranted (the household-order qualities carry no load-bearing single parallel)
--           Extras: none warranted   NT: none warranted
--   v.10-12 unruly vain talkers and deceivers... for filthy lucre's sake; Cretians alway liars
--           Tanakh: none warranted (carried in the commandments-of-men thread's frame)
--           Extras: Ecclesiasticus 27:4 (so the filth of man in his talk)
--           NT: none warranted
--   v.13-14,16 rebuke them sharply; not giving heed to Jewish fables, and commandments of men
--           Tanakh: Isaiah 29:13 (their fear toward me is taught by the precept of men)
--           Extras: none warranted   NT: Mark 7:7 (teaching for doctrines the commandments of men),
--                   Mark 7:9 (reject the commandment of Elohim, that ye may keep your own tradition)
--   v.15    Unto the pure all things are pure... their mind and conscience is defiled
--           Tanakh: Psalm 24:4 (clean hands, and a pure heart), Psalm 51:10 (create in me a clean heart)
--           Extras: Wisdom of Solomon 17:11 (wickedness... being pressed with conscience)
--           NT: none warranted (kept on the conscience-frame, NOT a clean/unclean repeal)
--
-- THREADS (slug -> target libraries):
--   8650 titus-1-eternal-life-promised-before-the-world-began-numbers-23-2-timothy-1  (Tanakh + NT)
--   8653 titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7  (Tanakh + NT)
--   8656 titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51  (Tanakh + Extras)
--   8659 titus-1-vain-talkers-and-deceivers-for-filthy-lucre-the-filth-of-mans-talk-sirach-27  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s237_t237c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: titus-1-eternal-life-promised-before-the-world-began-numbers-23-2-timothy-1
  ('canon', 'titus', 1, 2, 'canon', 'numbers', 23, 19, 'free', E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). Paul rests the believer''s hope on the One *which Elohim (God), that cannot lie, promised before the world began* (Titus 1:2). The very ground of the hope is what Balaam was made to confess: *Elohim (God) is not a man, that he should lie.* What the Father has *spoken* he *shall... make it good* — the promise of eternal life is sure because the Promiser cannot lie nor reverse his word, the same faithfulness that turned the curse into a blessing for Yashar''el (Israel).'),
  ('canon', 'titus', 1, 2, 'canon', '2-timothy', 1, 9, 'free', E'*Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began,* (2 Timothy 1:9). This is the twin of *In hope of eternal life, which Elohim (God), that cannot lie, promised before the world began* (Titus 1:2). Both letters reach back behind the ages to the Father''s own counsel: his *own purpose and grace* and his promise of *eternal life* were set *before the world began.* The salvation is the Father''s eternal purpose, secured *in HaMashiach Yahusha (Christ Jesus)* and *now made manifest* in due time — not according to our works, but according to the One who cannot lie.'),
  -- thread: titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7
  ('canon', 'titus', 1, 14, 'canon', 'isaiah', 29, 13, 'free', E'*Wherefore Yahuah (Lord) said, Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men:* (Isaiah 29:13). Paul charges Titus to rebuke those *Not giving heed to Yahudi (Jewish) fables, and commandments of men, that turn from the truth* (Titus 1:14). The thing rebuked is the very thing Yahuah (Lord) named through Isaiah — a worship *taught by the precept of men,* hearts removed far off while lips draw near. It is the *commandments of men,* the traditions that make void the word, that *turn from the truth* — not the Torah of Yahuah, which is the truth itself.'),
  ('canon', 'titus', 1, 14, 'canon', 'mark', 7, 7, 'free', E'*Howbeit in vain do they worship me, teaching for doctrines the commandments of men.* (Mark 7:7). Yahusha (Jesus) quotes Isaiah against the tradition of the elders, naming the disease exactly: *teaching for doctrines the commandments of men.* Paul names the same disease in Crete — *commandments of men, that turn from the truth* (Titus 1:14). The rebuke in both mouths falls on the *commandments of men,* the man-made tradition, not on the commandment of Elohim (God); Yahusha (Jesus) draws the line in the next breath, *laying aside the commandment of Elohim (God), ye hold the tradition of men* (Mark 7:8).'),
  ('canon', 'titus', 1, 14, 'canon', 'mark', 7, 9, 'free', E'*And he said unto them, Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition.* (Mark 7:9). Yahusha (Jesus) exposes the mechanism of the *commandments of men*: men *reject the commandment of Elohim (God)* in order to *keep your own tradition,* *Making the word of Elohim (God) of none effect through your tradition* (Mark 7:13). This is precisely what Paul means by *commandments of men, that turn from the truth* (Titus 1:14): the fables and man-made rules that displace the word and *turn from the truth.* The guard is plain — what is rebuked is the tradition that voids the Torah, never the Torah of Yahuah itself.'),
  -- thread: titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51
  ('canon', 'titus', 1, 15, 'canon', 'psalms', 24, 4, 'free', E'*He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully.* (Psalm 24:4). The one who may ascend the hill of Yahuah (LORD) is *He that hath... a pure heart.* Paul speaks of the same purity of the inward man: *Unto the pure all things are pure: but unto them that are defiled and unbelieving is nothing pure; but even their mind and conscience is defiled* (Titus 1:15). Purity here is a matter of *clean hands, and a pure heart* — the standing of the inner man before Yahuah (LORD) — not a declaration that the distinctions of clean and unclean are void. To the pure of heart all is pure; to the defiled and unbelieving, *even their mind and conscience is defiled.*'),
  ('canon', 'titus', 1, 15, 'canon', 'psalms', 51, 10, 'free', E'*Create in me a clean heart, O Elohim (God); and renew a right spirit within me.* (Psalm 51:10). David''s cry is for the very thing the defiled lack — *a clean heart.* Paul''s word turns on this same inward purity: *unto them that are defiled and unbelieving is nothing pure; but even their mind and conscience is defiled* (Titus 1:15). The defilement Paul names is of *their mind and conscience,* the unclean heart that no outward observance can mend; only the One who can *Create... a clean heart* makes a man pure. The verse weighs the heart, not the table — it is the conscience that must be cleansed.'),
  ('canon', 'titus', 1, 15, 'apocrypha', 'the-wisdom-of-solomon', 17, 11, 'extras', E'*For wickedness, condemned by her own witness, is very timorous, and being pressed with conscience, always forecasteth grievous things.* (Wisdom of Solomon 17:11). The restored library knew the defiled conscience that Paul names: *wickedness, condemned by her own witness... being pressed with conscience.* So Paul writes, *unto them that are defiled and unbelieving is nothing pure; but even their mind and conscience is defiled* (Titus 1:15). To the man whose own conscience condemns him, nothing can appear pure, for the impurity is within; the unclean heart, not the law of clean and unclean, is the thing in view.'),
  -- thread: titus-1-vain-talkers-and-deceivers-for-filthy-lucre-the-filth-of-mans-talk-sirach-27
  ('canon', 'titus', 1, 11, 'apocrypha', 'ecclesiasticus', 27, 4, 'extras', E'*As when one sifteth with a sieve, the refuse remains; so the filth of man in his talk.* (Ecclesiasticus 27:4). The Wisdom of Yeshua ben Sira tests a man by his speech: sift him, and *the filth of man in his talk* remains in the sieve. Paul charges that the deceivers in Crete, *Whose mouths must be stopped, who subvert whole houses, teaching things which they ought not, for filthy lucre''s sake* (Titus 1:11), are known by exactly this — the refuse of their talk. They are the *unruly and vain talkers* (Titus 1:10) whose words, sifted, leave only filth; their teaching for gain betrays the corrupt heart beneath the speech.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s237_t237c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s237_t237c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-1-eternal-life-promised-before-the-world-began-numbers-23-2-timothy-1',
       E'Eternal life promised before the world began by the Elohim who cannot lie (Numbers 23, 2 Timothy 1)',
       E'Paul grounds the whole letter on the Father''s eternal purpose: *In hope of eternal life, which Elohim (God), that cannot lie, promised before the world began* (Titus 1:2). Two things hold this hope fast. First, the One who promised *cannot lie* — the very confession Balaam was made to speak: *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). What the Father has spoken he will make good; the promise of life is as sure as his faithfulness, the same faithfulness that turned the hired curse into a blessing upon Yashar''el (Israel). Second, the promise reaches back *before the world began* — into the Father''s own counsel from of old. This is the twin of Paul''s word to Timothy: *Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9). The salvation is the Father''s *own purpose and grace,* set before the ages and *now made manifest* in due time; eternal life is no afterthought but the covenant of life laid up in the Father''s counsel, *not according to our works,* secured in HaMashiach Yahusha (Christ Jesus), and certain because the Promiser cannot lie. Keep the Father the source of the promise and the Son the One in whom it is secured.',
       sv.verse_id, ev.verse_id, 'free', 8650
  FROM _s237_t237c1_lookup sv, _s237_t237c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7',
       E'Jewish fables and the commandments of men — the tradition that voids the word, NOT the Torah (Isaiah 29, Mark 7)',
       E'Paul charges Titus to rebuke the deceivers sharply, *Not giving heed to Yahudi (Jewish) fables, and commandments of men, that turn from the truth* (Titus 1:14). Read this with care, for the trained ear hears it wrong: what is rebuked is the *commandments of men* and the *fables* — the man-made tradition — never the Torah of Yahuah. The phrase is lifted straight from Isaiah, where Yahuah (Lord) names the very disease: *Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men* (Isaiah 29:13) — a worship *taught by the precept of men,* hearts removed far off while lips draw near. Yahusha (Jesus) took up Isaiah''s indictment against the tradition of the elders: *in vain do they worship me, teaching for doctrines the commandments of men* (Mark 7:7), and he laid the line down exactly — *laying aside the commandment of Elohim (God), ye hold the tradition of men* (Mark 7:8); *Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition* (Mark 7:9), *Making the word of Elohim (God) of none effect through your tradition* (Mark 7:13). There is the whole frame: the *commandments of men* are set OVER AGAINST *the commandment of Elohim (God),* and it is the tradition that *rejects* and *makes of none effect* the word. So Paul''s *commandments of men, that turn from the truth* are the fables and rules of men that displace the Torah and *turn from the truth* — for the Torah of Yahuah is the truth itself, *removed* from no one who keeps it with the heart. The rebuke is on the deceivers and their man-made doctrine, never on the law of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 8653
  FROM _s237_t237c1_lookup sv, _s237_t237c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51',
       E'Unto the pure all things are pure — the defiled conscience, not a repeal of clean and unclean (Psalm 24, 51, Wisdom 17)',
       E'*Unto the pure all things are pure: but unto them that are defiled and unbelieving is nothing pure; but even their mind and conscience is defiled* (Titus 1:15). The trained reading hears here a sweeping away of the clean and the unclean — but the verse is about the heart, not the table. The purity in view is the purity of the inward man, the standing of the one who may ascend the hill of Yahuah (LORD): *He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully* (Psalm 24:4). It is the *clean heart* David begged for — *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10) — that no outward observance can manufacture and no defilement can be hid from. To the man whose heart is pure, all that he touches is pure; to the man whose heart is unclean, *nothing* is pure, *for even their mind and conscience is defiled.* The restored library knew this defiled conscience well: *For wickedness, condemned by her own witness, is very timorous, and being pressed with conscience, always forecasteth grievous things* (Wisdom of Solomon 17:11) — the guilty conscience condemns itself, and to it nothing can appear clean. Paul''s word weighs the *mind and conscience,* not the dietary law: it is the unbelieving and defiled heart that is in view, the very opposite of the pure heart of the Psalms. This is no declaration that the distinctions of Leviticus 11 and Deuteronomy 14 are void — those stand; it is a statement that purity is a matter of the heart standing right before Yahuah (LORD), and that to the defiled, even the clean is made unclean by the uncleanness within.',
       sv.verse_id, ev.verse_id, 'extras', 8656
  FROM _s237_t237c1_lookup sv, _s237_t237c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-1-vain-talkers-and-deceivers-for-filthy-lucre-the-filth-of-mans-talk-sirach-27',
       E'Vain talkers and deceivers for filthy lucre — known by the filth of their talk (Ecclesiasticus 27)',
       E'Paul warns of the corrupt teachers Titus must silence: *there are many unruly and vain talkers and deceivers, specially they of the circumcision: Whose mouths must be stopped, who subvert whole houses, teaching things which they ought not, for filthy lucre''s sake* (Titus 1:10-11). The Wisdom of Yeshua ben Sira gave the test by which such men are known — by their speech: *As when one sifteth with a sieve, the refuse remains; so the filth of man in his talk* (Ecclesiasticus 27:4). Sift the *vain talkers,* and what remains in the sieve is the refuse of a corrupt heart; their teaching *for filthy lucre''s sake* betrays the filth beneath the words. The same wisdom warns that *Unless a man hold himself diligently in the fear of Yahuah (God), his house shall soon be overthrown* (Ecclesiasticus 27:3) — and these deceivers *subvert whole houses.* The mark of the false teacher is not hidden: it is in the mouth, in the talk that the sieve lays bare, in the gain he seeks. Their mouths must be stopped, that the households they would overthrow may be sound in the faith.',
       sv.verse_id, ev.verse_id, 'extras', 8659
  FROM _s237_t237c1_lookup sv, _s237_t237c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: titus-1-eternal-life-promised-before-the-world-began-numbers-23-2-timothy-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie... hath he spoken, and shall he not make it good?* the ground of the hope; the One who *cannot lie* promised eternal life (Titus 1:2).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-eternal-life-promised-before-the-world-began-numbers-23-2-timothy-1'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 1:9 — *grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* the twin of Titus 1:2; the Father''s own purpose and grace set before the ages, *not according to our works.*'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-eternal-life-promised-before-the-world-began-numbers-23-2-timothy-1'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 29:13 — *their fear toward me is taught by the precept of men* the source of the phrase; a worship taught by men''s precepts, hearts removed far off, the *commandments of men* (Titus 1:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 7:7 — *in vain do they worship me, teaching for doctrines the commandments of men* Yahusha (Jesus) quoting Isaiah against the tradition; the same *commandments of men* Paul names (Titus 1:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 7:9 — *Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition* the line drawn: tradition set over against the commandment of Elohim (God); the guard that 1:14 rebukes the fables, NOT the Torah.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-jewish-fables-and-commandments-of-men-not-the-torah-isaiah-29-mark-7'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 24:4 — *He that hath clean hands, and a pure heart* the purity of the inward man who ascends the hill of Yahuah (LORD); to the pure all things are pure (Titus 1:15).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 51:10 — *Create in me a clean heart, O Elohim (God)* the clean heart no observance can make; the defilement Paul names is of *their mind and conscience* (Titus 1:15), not the table.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 17:11 — *wickedness, condemned by her own witness... being pressed with conscience* the defiled conscience that finds nothing pure; the guilty heart in view, NOT a repeal of clean/unclean (Titus 1:15).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-unto-the-pure-all-things-are-pure-the-defiled-conscience-psalm-24-51'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-1-vain-talkers-and-deceivers-for-filthy-lucre-the-filth-of-mans-talk-sirach-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 27:4 — *As when one sifteth with a sieve, the refuse remains; so the filth of man in his talk* the test of the false teacher by his speech; the *vain talkers and deceivers... for filthy lucre''s sake* known by their words (Titus 1:10-11).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c1_lookup sv, _s237_t237c1_lookup tv
 WHERE t.slug='titus-1-vain-talkers-and-deceivers-for-filthy-lucre-the-filth-of-mans-talk-sirach-27'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_titus_02.sql (S237 Titus 2) -----
-- =====================================================================
-- S237 minion — TITUS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: TITUS 2 (15 verses) — sound doctrine to every household, and the
--   grace of Elohim that TEACHES us to deny ungodliness unto a peculiar people
--   zealous of good works. THE GREAT ANTI-ANTINOMIAN KEYSTONE (2:11-14).
-- Tag: t237c2 (temp view _s237_t237c2_lookup).
-- Sort band: floor 8675 (8675, 8678, 8681 used; under 8699).
-- Source is ALWAYS the canon Titus verse; targets span Tanakh + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical = 'extras'.
--
-- GOVERNING FRAME: grace does NOT abolish obedience — grace TEACHES it. The very
--   grace that appeared is the schoolmaster that trains us *to deny ungodliness*
--   and live *righteously* (the righteousness the Torah defines). The redeemed are
--   *a peculiar people* — the exact phrase of Exodus 19:5 / Deuteronomy 14:2 /
--   Deuteronomy 26:18 — the covenant people *zealous of good works*, *redeemed from
--   all iniquity* (Ezekiel 37:23, Psalm 130:8). Grace UNTO Torah-keeping, NOT grace
--   INSTEAD OF the Torah. 2:13 *the great Elohim and our Saviour Yahusha HaMashiach*
--   = the Formed: the Father the source, the Son the one through whom he saves.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST:
--   v.1      speak the things which become sound doctrine
--            Tanakh: none warranted (a single charge-phrase, no load-bearing parallel)
--            Extras: none warranted   NT: none warranted
--   v.2-10   household order (aged men/women, young, servants); adorn the doctrine
--            Tanakh: none warranted (honestly weighed — exhortation, no quote-target)
--            Extras: none warranted   NT: none warranted
--   v.11-12  the grace of Elohim that bringeth salvation hath appeared, TEACHING us
--            to deny ungodliness and live soberly, righteously, godly
--            Tanakh: carried in the peculiar-people thread (the grace teaches Torah-
--                    righteousness; Deuteronomy 26:18 the peculiar people that keep
--                    his commandments)
--            Extras: none warranted   NT: Ephesians 2:8-10 (grace UNTO good works ordained)
--   v.13     the glorious appearing of the great Elohim and our Saviour Yahusha
--            HaMashiach (the Formed)
--            Tanakh: none warranted (Christology carried in prose; the Father source,
--                    the Son the one through whom he saves)
--            Extras: none warranted   NT: none warranted
--   v.14     who gave himself for us, that he might REDEEM us from all iniquity, and
--            PURIFY unto himself a PECULIAR PEOPLE, zealous of good works
--            Tanakh: Exodus 19:5 (a peculiar treasure unto me), Deuteronomy 14:2 (a
--                    peculiar people unto himself), Deuteronomy 26:18 (his peculiar
--                    people, that thou shouldest keep all his commandments);
--                    Ezekiel 37:23 (I will cleanse them), Psalm 130:8 (he shall
--                    redeem Yashar'el from all his iniquities)
--            Extras: none warranted   NT: 1 Peter 2:9 (a peculiar people), Ephesians
--                    2:8-10 (grace UNTO good works)
--   v.15     these things speak, exhort, rebuke with all authority
--            Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8675 titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14   (Tanakh + NT)  [KEYSTONE]
--   8678 titus-2-redeemed-from-all-iniquity-and-purified-a-people-ezekiel-37-psalm-130   (Tanakh)
--   8681 titus-2-grace-unto-good-works-not-instead-of-them-ephesians-2   (NT)
-- =====================================================================

CREATE TEMP VIEW _s237_t237c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14  [KEYSTONE]
  ('canon', 'titus', 2, 14, 'canon', 'exodus', 19, 5, 'free', E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* (Exodus 19:5). At Sinai Yahuah (LORD) named his people *a peculiar treasure* — and Paul says the One who *gave himself for us* did so *that he might... purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The phrase is not new-minted: the redeemed are the very *peculiar* people of the covenant, and mark the Sinai condition — *if ye will obey my voice indeed, and keep my covenant.* The grace that purifies a peculiar people purifies them *zealous of good works,* exactly as Yahuah (LORD) made a peculiar treasure of a people called to keep his covenant. Grace unto obedience, not grace instead of it.'),
  ('canon', 'titus', 2, 14, 'canon', 'deuteronomy', 14, 2, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth.* (Deuteronomy 14:2). Here is the exact phrase Paul takes up: *a peculiar people unto himself.* Moses speaks it in the very chapter that sets out the clean and the unclean — *a peculiar people* who are *an holy people* set apart by walking in Yahuah''s (LORD''s) ways. When Paul says the Saviour gave himself *to purify unto himself a peculiar people, zealous of good works* (Titus 2:14), he names the redeemed by the covenant name of a people chosen to be holy, set apart, walking in obedience — not a people loosed from it.'),
  ('canon', 'titus', 2, 14, 'canon', 'deuteronomy', 26, 18, 'free', E'*And Yahuah (LORD) hath avouched thee this day to be his peculiar people, as he hath promised thee, and that thou shouldest keep all his commandments;* (Deuteronomy 26:18). This is the verse that seals the link: to be *his peculiar people* is, in the same breath, *that thou shouldest keep all his commandments.* The peculiar people and the keeping of the commandments are one covenant. So when the grace of Elohim (God) purifies *a peculiar people, zealous of good works* (Titus 2:14) and *teaching us that, denying ungodliness and worldly lusts, we should live soberly, righteously, and godly* (Titus 2:12), it makes the redeemed into precisely what Deuteronomy describes — a peculiar people who keep his commandments. Grace teaches the obedience; it does not abolish it.'),
  ('canon', 'titus', 2, 14, 'canon', '1-peter', 2, 9, 'free', E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* (1 Peter 2:9). Peter, like Paul, names the redeemed by the Sinai titles: *an holy nation, a peculiar people* — the very words of Exodus 19 and Deuteronomy 14 laid upon the gathered seed. It is the same people Paul describes, *a peculiar people, zealous of good works* (Titus 2:14). The calling out of darkness is not a calling out of the covenant but into its fullness; the peculiar people of the Tanakh and the peculiar people of the apostles are one people, set apart to shew forth his praises.'),
  ('canon', 'titus', 2, 12, 'canon', 'ephesians', 2, 10, 'free', E'*For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them.* (Ephesians 2:10). The grace that *bringeth salvation* is *teaching us that, denying ungodliness and worldly lusts, we should live soberly, righteously, and godly* (Titus 2:12) — and Ephesians says the same: we are created *unto good works, which Elohim (God) hath before ordained that we should walk in them.* Grace does not end in idleness; it is *unto good works.* The very grace by which we are saved is the grace that trains us to deny ungodliness and walk in the works ordained beforehand — grace UNTO obedience, the schoolmaster, not the discharge from the Master''s ways.'),
  -- thread: titus-2-redeemed-from-all-iniquity-and-purified-a-people-ezekiel-37-psalm-130
  ('canon', 'titus', 2, 14, 'canon', 'psalms', 130, 8, 'free', E'*And he shall redeem Yashar''el (Israel) from all his iniquities.* (Psalm 130:8). The psalmist''s hope — that Yahuah (LORD), with whom *is plenteous redemption,* *shall redeem Yashar''el (Israel) from all his iniquities* — is the very work Paul ascribes to the Saviour: he *gave himself for us, that he might redeem us from all iniquity* (Titus 2:14). The phrase is the psalm''s own: *redeem... from all iniquity.* The redemption Yashar''el (Israel) waited for out of the depths is accomplished in the One who gave himself, who redeems his people from all their iniquities and makes them his peculiar, purified people.'),
  ('canon', 'titus', 2, 14, 'canon', 'ezekiel', 37, 23, 'free', E'*Neither shall they defile themselves any more with their idols, nor with their detestable things, nor with any of their transgressions: but I will save them out of all their dwellingplaces, wherein they have sinned, and will cleanse them: so shall they be my people, and I will be their Elohim (God).* (Ezekiel 37:23). Yahuah (LORD) promised to gather his people, *save them out of all their dwellingplaces... and will cleanse them* unto a purified, undefiled people. Paul speaks the fulfilment: the Saviour gave himself *that he might redeem us from all iniquity, and purify unto himself a peculiar people* (Titus 2:14). The cleansing of Ezekiel — *neither shall they defile themselves any more* — is the purifying Paul names, and it issues in the same end: a people who walk in his judgments and do them (Ezekiel 37:24), zealous of good works.'),
  -- thread: titus-2-grace-unto-good-works-not-instead-of-them-ephesians-2
  ('canon', 'titus', 2, 11, 'canon', 'ephesians', 2, 8, 'free', E'*For by grace are ye saved through faith; and that not of yourselves: it is the gift of Elohim (God):* (Ephesians 2:8). Paul opens the keystone of Titus with the same grace: *For the grace of Elohim (God) that bringeth salvation hath appeared to all men* (Titus 2:11). Salvation is *by grace... the gift of Elohim (God),* not of ourselves — the flesh boasts in nothing. But this grace is no license: in both letters it runs straight on to the obedient life, for the same chapter declares we are created *unto good works* (Ephesians 2:10). The grace that saves is the grace that appears *teaching us* to live righteously.'),
  ('canon', 'titus', 2, 14, 'canon', 'ephesians', 2, 10, 'free', E'*For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them.* (Ephesians 2:10). The Saviour purifies *unto himself a peculiar people, zealous of good works* (Titus 2:14); Ephesians names those works *good works, which Elohim (God) hath before ordained that we should walk in them.* The zeal for good works is not the cause of redemption but its appointed fruit — the workmanship of grace walking in the works prepared from of old. Grace UNTO good works, not grace that excuses their absence.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s237_t237c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s237_t237c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14',
       E'The grace that teaches us to deny ungodliness, unto a peculiar people (Exodus 19, Deuteronomy 14, 26)',
       E'Here is the great anti-antinomian word of the letter: *For the grace of Elohim (God) that bringeth salvation hath appeared to all men, Teaching us that, denying ungodliness and worldly lusts, we should live soberly, righteously, and godly, in this present world... Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:11-14). Mark what grace DOES here: it *teaches.* It does not abolish obedience — it trains the redeemed to *deny ungodliness* and live *righteously,* according to the righteousness the Torah defines. And mark the name Paul gives the redeemed — *a peculiar people* — for it is not a phrase he coined but the covenant name spoken at Sinai. *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5); *thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself* (Deuteronomy 14:2) — and that chapter is the very one that sets apart the clean from the unclean, a peculiar people because a holy, set-apart people. The seal is Deuteronomy 26:18: *Yahuah (LORD) hath avouched thee this day to be his peculiar people... and that thou shouldest keep all his commandments.* To be the peculiar people IS, in the same breath, to keep his commandments — the two are one covenant. So when grace purifies *a peculiar people, zealous of good works,* it makes the redeemed into precisely what Deuteronomy describes. Peter lays the same Sinai titles on the gathered seed — *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9) — one people, not a replacement. And Paul''s own twin says it plainly: *we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:10). This is grace UNTO Torah-keeping, NOT grace INSTEAD OF the Torah — grace the schoolmaster, training a peculiar people zealous of the good works their Elohim (God) ordained from of old.',
       sv.verse_id, ev.verse_id, 'free', 8675
  FROM _s237_t237c2_lookup sv, _s237_t237c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-2-redeemed-from-all-iniquity-and-purified-a-people-ezekiel-37-psalm-130',
       E'Redeemed from all iniquity and cleansed unto a purified people (Ezekiel 37, Psalm 130)',
       E'When Paul writes that the Saviour *gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people* (Titus 2:14), he speaks the hope of the Tanakh in its own words. The psalmist cried out of the depths, knowing that with Yahuah (LORD) *is plenteous redemption,* and confessed the promise: *And he shall redeem Yashar''el (Israel) from all his iniquities* (Psalm 130:8). *Redeem... from all iniquity* — Paul takes the phrase whole. And the purifying he names is Ezekiel''s cleansing: *I will save them out of all their dwellingplaces, wherein they have sinned, and will cleanse them: so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). The redemption Yashar''el (Israel) waited for, the cleansing Yahuah (LORD) promised to his gathered people, is accomplished in the One who gave himself — and it issues, in Ezekiel as in Titus, in an obedient people: *they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24), a peculiar people zealous of good works. The blood does not cancel the walk; it cleanses a people INTO the walk.',
       sv.verse_id, ev.verse_id, 'free', 8678
  FROM _s237_t237c2_lookup sv, _s237_t237c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-2-grace-unto-good-works-not-instead-of-them-ephesians-2',
       E'Grace unto good works, not instead of them (Ephesians 2)',
       E'*For the grace of Elohim (God) that bringeth salvation hath appeared to all men, Teaching us that, denying ungodliness and worldly lusts, we should live soberly, righteously, and godly* (Titus 2:11-12). The grace that saves is the grace that teaches — and Ephesians sets the same two truths side by side so neither can be lost. First the gift: *For by grace are ye saved through faith; and that not of yourselves: it is the gift of Elohim (God): Not of works, lest any man should boast* (Ephesians 2:8-9). The flesh boasts in nothing; salvation is grace, not earned standing. But the very next breath forbids the antinomian conclusion: *For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:10). Saved by grace — UNTO good works ordained from of old. So in Titus the same grace that brings salvation *purifies unto himself a peculiar people, zealous of good works* (Titus 2:14). Grace is the cause of the obedient life, never its excuse; it appears not to discharge the redeemed from the Master''s ways but to train them to walk in the works he prepared beforehand.',
       sv.verse_id, ev.verse_id, 'free', 8681
  FROM _s237_t237c2_lookup sv, _s237_t237c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *ye shall be a peculiar treasure unto me above all people* the Sinai covenant name, given *if ye will obey my voice indeed, and keep my covenant*; the Saviour purifies *a peculiar people, zealous of good works* (Titus 2:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 14:2 — *Yahuah (LORD) hath chosen thee to be a peculiar people unto himself* the exact phrase Paul takes up, spoken in the chapter of the clean and unclean — a holy, set-apart people (Titus 2:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 26:18 — *his peculiar people... and that thou shouldest keep all his commandments* the peculiar people and the keeping of the commandments are one covenant; grace teaches that obedience, it does not abolish it (Titus 2:12,14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 2:9 — *an holy nation, a peculiar people* the Sinai titles laid on the gathered seed; the same people Paul names *a peculiar people, zealous of good works* — one people, not a replacement (Titus 2:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 2:10 — *created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained* the grace that teaches us to live righteously is grace UNTO the ordained works (Titus 2:12).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-the-grace-that-teaches-us-to-deny-ungodliness-a-peculiar-people-exodus-19-deuteronomy-14'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-2-redeemed-from-all-iniquity-and-purified-a-people-ezekiel-37-psalm-130
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 130:8 — *he shall redeem Yashar''el (Israel) from all his iniquities* the psalm''s own phrase; the Saviour *gave himself for us, that he might redeem us from all iniquity* (Titus 2:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-redeemed-from-all-iniquity-and-purified-a-people-ezekiel-37-psalm-130'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:23 — *I will save them... and will cleanse them: so shall they be my people* the promised cleansing unto an undefiled people; the Saviour gave himself *to purify unto himself a peculiar people* (Titus 2:14), who walk in his judgments (Ezekiel 37:24).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-redeemed-from-all-iniquity-and-purified-a-people-ezekiel-37-psalm-130'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-2-grace-unto-good-works-not-instead-of-them-ephesians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 2:8 — *by grace are ye saved through faith... it is the gift of Elohim (God)* the same grace that *bringeth salvation hath appeared* (Titus 2:11); the flesh boasts in nothing.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-grace-unto-good-works-not-instead-of-them-ephesians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:10 — *created... unto good works, which Elohim (God) hath before ordained that we should walk in them* grace UNTO good works, the appointed fruit; the Saviour purifies *a peculiar people, zealous of good works* (Titus 2:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c2_lookup sv, _s237_t237c2_lookup tv
 WHERE t.slug='titus-2-grace-unto-good-works-not-instead-of-them-ephesians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_titus_03.sql (S237 Titus 3) -----
-- =====================================================================
-- S237 minion — TITUS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: TITUS 3 (15 verses) — the obedient, ready-to-every-good-work life that the washing of
-- regeneration produces; not by works of OUR righteousness but by his mercy; avoid foolish questions
-- and law-strivings.
-- Tag: t237c3 (temp view _s237_t237c3_lookup).
-- Sort band: floor 8700 (8700-8724); one slot per thread.
-- Source is ALWAYS the canon Titus verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: ★ 3:5 *Not by works of righteousness which we have done, but according to his
-- mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh* — *not by
-- works of OUR righteousness* excludes FLESH-MERIT, self-earned standing and boasting (the same guard
-- as 2 Timothy 1:9 *not according to our works* and Ephesians 2:8-10), NOT the Torah of Yahuah.
-- Salvation is by his mercy (Deuteronomy 7:7-8 election by love, Deuteronomy 9:5 *not for thy
-- righteousness*); the washing of regeneration and the new heart is Ezekiel 36:25-27 (*clean water...
-- a new heart... cause you to walk in my statutes*), which leads STRAIGHT into walking in his statutes,
-- and the Ruach poured out is Joel 2:28 — the new birth PRODUCES the obedient life (3:8,14 *careful to
-- maintain good works*). 3:9 *strivings about the law* rebukes vain WRANGLING and fables, NOT the law
-- itself. No replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   subject to powers, ready to every good work, gentle, meek
--           Tanakh: none warranted (the good-works weight carried at the 3:8,14 thread)
--           Extras: none warranted   NT: none warranted
--   v.3-4   we ourselves were once foolish... but the kindness and love of Elohim our Saviour appeared
--           Tanakh: none warranted (the mercy-not-our-righteousness root carried at 3:5)
--           Extras: none warranted   NT: none warranted
--   v.5-7   ★ not by works of righteousness which we have done, but by his mercy, by the washing of
--           regeneration and renewing of the Ruach [BLESSING]
--           Tanakh: Deuteronomy 9:5 (not for thy righteousness), Deuteronomy 7:7-8 (he loved you...
--                   not because ye were more in number), Ezekiel 36:25-27 (clean water... a new
--                   heart... cause you to walk in my statutes), Joel 2:28 (I will pour out my spirit)
--           Extras: none warranted (the new-heart root is fully canon)
--           NT: 2 Timothy 1:9 (not according to our works but his purpose and grace), Ephesians
--                   2:8-10 (by grace... not of works... created unto good works), John 3:5 (born of
--                   water and of the Spirit)
--   v.8,14  faithful saying... careful to maintain good works; let ours learn to maintain good works
--           Tanakh: Deuteronomy 26:17-18 (to walk in his ways and keep his statutes... a peculiar people)
--           Extras: Tobit 4:7-10 (give alms... thou layest up a good treasure against the day of necessity)
--           NT: Ephesians 2:10 (his workmanship, created unto good works ordained that we should walk in them)
--   v.9     avoid foolish questions, genealogies, contentions, and strivings about the law — vain
--           wrangling, NOT the law itself
--           Tanakh: Proverbs 26:4 (answer not a fool according to his folly), Proverbs 23:9 (speak
--                   not in the ears of a fool)
--           Extras: Sirach 8:3 (strive not with a man that is full of tongue)
--           NT: none warranted (the contention-with-fools root is the Tanakh wisdom layer)
--   v.10-15 reject the heretick after admonition; travel arrangements; greetings
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8700 titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36  (Tanakh + NT)  [BLESSING]
--   8701 titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4      (Tanakh + Extras + NT)
--   8702 titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8       (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s237_t237c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36  [BLESSING]
  ('canon', 'titus', 3, 5, 'canon', 'deuteronomy', 9, 5, 'free', E'*Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land: but for the wickedness of these nations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee, and that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob.* (Deuteronomy 9:5). Moses tells Yashar''el (Israel) plainly that the land is not earned: *not for thy righteousness... but... that he may perform the word which Yahuah (LORD) sware unto thy fathers.* Paul says the same of salvation — *Not by works of righteousness which we have done, but according to his mercy he saved us* (Titus 3:5). What is excluded in both is FLESH-MERIT, self-earned standing, the boast of *thy righteousness* — never the statutes of Yahuah (LORD), which the very next breath of Deuteronomy commands. He saves to keep his oath, by his mercy, not to reward our deserving.'),
  ('canon', 'titus', 3, 5, 'canon', 'deuteronomy', 7, 8, 'free', E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). Yashar''el (Israel) was redeemed *because Yahuah (LORD) loved you,* not for any greatness of their own — *ye were the fewest of all people* (Deuteronomy 7:7). This is the very ground of Titus 3:5: *according to his mercy he saved us.* The kindness and love of Elohim (God) our Saviour that *appeared* (Titus 3:4) is the same covenant love that brought the fathers out of Egypt with a mighty hand — salvation flowing from his love and his oath, not from the worth of the saved.'),
  ('canon', 'titus', 3, 5, 'canon', 'ezekiel', 36, 25, 'free', E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* (Ezekiel 36:25). The *washing of regeneration* (Titus 3:5) is this promised cleansing — Yahuah (LORD) sprinkling clean water to make his people clean. It is not a washing away of his Torah but a washing away of *filthiness* and *idols,* the heart made fit to keep his word. The new birth Paul names is the new-covenant cleansing Ezekiel foretold.'),
  ('canon', 'titus', 3, 5, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). Here is the decisive guard: the *renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5) is Yahuah (LORD) putting his spirit within his people — and its STATED purpose is *to cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The new heart and the indwelling Ruach lead STRAIGHT into walking in his statutes, not away from them. The washing of regeneration is the engine of obedience, the opposite of a Torah abolished.'),
  ('canon', 'titus', 3, 6, 'canon', 'joel', 2, 28, 'free', E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions:* (Joel 2:28). Joel promised the Ruach *poured out... upon all flesh.* Paul says the Ruach was *shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour* (Titus 3:6) — the very outpouring Joel foretold, now given in abundance. The renewing of the Ruach HaKodesh (Holy Spirit) that washes and makes new is the latter-rain Spirit of the prophet, poured out to write the law upon the heart.'),
  ('canon', 'titus', 3, 5, 'canon', '2-timothy', 1, 9, 'free', E'*Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began,* (2 Timothy 1:9). The twin of Titus 3:5. *Not according to our works... but according to his own purpose and grace* says exactly what *Not by works of righteousness which we have done, but according to his mercy he saved us* says: the ground of salvation is his eternal purpose and mercy, not our merit. *Our works* and *works of righteousness which WE have done* are the flesh-credential excluded — not the commandments of Yahuah (LORD), but the boast of self-earned standing.'),
  ('canon', 'titus', 3, 5, 'canon', 'ephesians', 2, 9, 'free', E'*Not of works, lest any man should boast.* (Ephesians 2:9). *For by grace are ye saved through faith; and that not of yourselves... Not of works, lest any man should boast* (Ephesians 2:8-9) is the same guard Paul sets in Titus: *Not by works of righteousness which we have done, but according to his mercy he saved us* (Titus 3:5). The thing barred is BOASTING — the works by which a man would earn and claim his own standing. And Ephesians names the goal of grace in the very next verse: *created in HaMashiach Yahusha (Christ Jesus) unto good works* (Ephesians 2:10) — grace UNTO obedience, never grace that abolishes it.'),
  ('canon', 'titus', 3, 5, 'canon', 'john', 3, 5, 'free', E'*Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* (John 3:5). Yahusha (Jesus) told Nicodemus a man must be *born of water and of the Spirit* — the new birth by cleansing-water and indwelling-Spirit. This is the *washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* of Titus 3:5: the water that cleanses (Ezekiel 36:25) and the Spirit that gives the new heart (Ezekiel 36:27), the one regeneration into the kingdom.'),
  -- thread: titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4
  ('canon', 'titus', 3, 8, 'canon', 'ephesians', 2, 10, 'free', E'*For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them.* (Ephesians 2:10). The same Paul who says salvation is *not by works of righteousness which we have done* (Titus 3:5) charges in the next breath that the saved *be careful to maintain good works* (Titus 3:8). Ephesians joins the two without contradiction: we are saved *not of works* yet *created... unto good works, which Elohim (God) hath before ordained that we should walk in them.* Good works are not the root of salvation but its ordained fruit — the obedient life the new birth produces.'),
  ('canon', 'titus', 3, 8, 'canon', 'deuteronomy', 26, 17, 'free', E'*Thou hast avouched Yahuah (LORD) this day to be thy Elohim (God), and to walk in his ways, and to keep his statutes, and his commandments, and his judgments, and to hearken unto his voice:* (Deuteronomy 26:17). The good works Paul would have the believers *maintain* (Titus 3:8,14) are the covenant life Moses describes — *to walk in his ways, and to keep his statutes, and his commandments... and to hearken unto his voice.* The redeemed people, washed by the regeneration, are avouched to walk in his ways; the *good works... good and profitable unto men* are the doing of his statutes from a new heart, not a righteousness apart from him.'),
  ('canon', 'titus', 3, 8, 'apocrypha', 'tobit', 4, 9, 'extras', E'*For you layest up a good treasure for thyself against the day of necessity.* (Tobit 4:9). Tobit charges his son to do good works as a treasure laid up: *Give alms of your substance... If you have abundance give alms accordingly: if you have but a little, be not afraid to give... For you layest up a good treasure for thyself against the day of necessity* (Tobit 4:7-9). This is the very posture Paul commends — *that they which have believed in Elohim (God) might be careful to maintain good works... good and profitable unto men* (Titus 3:8) — the obedient, open-handed life that flows from a heart that fears Yahuah (God) and keeps his commandments (Tobit 4:5).'),
  ('canon', 'titus', 3, 14, 'apocrypha', 'tobit', 4, 7, 'extras', E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7). Paul tells Titus to teach the believers a settled habit of usefulness: *let ours also learn to maintain good works for necessary uses, that they be not unfruitful* (Titus 3:14). Tobit''s charge — *Give alms of your substance... turn not your face from any poor* — is the same fruitful, neighbour-serving good work, the doing of mercy that the law commands and the new heart loves.'),
  -- thread: titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8
  ('canon', 'titus', 3, 9, 'canon', 'proverbs', 26, 4, 'free', E'*Answer not a fool according to his folly, lest thou also be like unto him.* (Proverbs 26:4). What Paul bids Titus shun is the wrangling itself: *avoid foolish questions, and genealogies, and contentions, and strivings about the law; for they are unprofitable and vain* (Titus 3:9). The wisdom of Proverbs already warned against being drawn into a fool''s quarrel — *answer not a fool according to his folly, lest thou also be like unto him.* The rebuke falls on the vain CONTENTION and the foolish questioner, not on the law of Yahuah (LORD) over which the fool wrangles; the law is *holy, and just, and good,* but the strife about it is unprofitable.'),
  ('canon', 'titus', 3, 9, 'canon', 'proverbs', 23, 9, 'free', E'*Speak not in the ears of a fool: for he will despise the wisdom of thy words.* (Proverbs 23:9). Titus is to turn away from *foolish questions... and strivings about the law; for they are unprofitable and vain* (Titus 3:9) — and Proverbs gives the reason such striving is fruitless: *Speak not in the ears of a fool: for he will despise the wisdom of thy words.* The unprofitableness is in the contentious fool who twists and despises, not in the word he contends about; the shepherd spends himself on sound doctrine, not on the empty disputes of those who *love to strive.*'),
  ('canon', 'titus', 3, 9, 'apocrypha', 'ecclesiasticus', 8, 3, 'extras', E'*Strive not with a man that is full of tongue, and heap not wood upon his fire.* (Sirach 8:3). The Hebrew wisdom of Sirach names the same trap Paul warns Titus against: *avoid foolish questions, and genealogies, and contentions, and strivings about the law; for they are unprofitable and vain* (Titus 3:9). To enter the quarrel of *a man that is full of tongue* is to *heap wood upon his fire* — the contention only grows. The fault lies in the empty, endless wrangling and the babbler who loves it, not in the law itself; the wise shepherd refuses to feed the fire.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s237_t237c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s237_t237c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36',
       E'Not by works of our righteousness, but by his mercy: the washing of regeneration (Deuteronomy 9, Ezekiel 36)',
       E'*Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit); Which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour* (Titus 3:5-6). Read this through the framework, for the trained ear hears it wrongly. *Not by works of righteousness which WE have done* excludes FLESH-MERIT — self-earned standing, the boast of one''s own deserving — NOT the Torah of Yahuah (LORD). Moses set the same guard over the land: *Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land... but that he may perform the word which Yahuah (LORD) sware unto thy fathers* (Deuteronomy 9:5); and again, Yashar''el (Israel) was redeemed *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:8), for *ye were the fewest of all people* (Deuteronomy 7:7). Salvation flows from his mercy and his oath, never from the worth of the saved — *the kindness and love of Elohim (God) our Saviour toward man appeared* (Titus 3:4). And the *washing of regeneration* is no washing away of his commandments but the new-covenant cleansing Ezekiel foretold: *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25). Mark where it leads — *A new heart also will I give you... And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:26-27). The new heart and the indwelling Ruach run STRAIGHT into walking in his statutes; the washing of regeneration is the engine of obedience, the very opposite of a Torah abolished. The Ruach *shed on us abundantly* (Titus 3:6) is the Spirit Joel promised — *I will pour out my spirit upon all flesh* (Joel 2:28). Yahusha (Jesus) named this same new birth to Nicodemus: *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5) — the cleansing water and the renewing Spirit of Ezekiel, one regeneration into the kingdom. And the twins confirm the guard: *Who hath saved us... not according to our works, but according to his own purpose and grace* (2 Timothy 1:9), *by grace are ye saved through faith... Not of works, lest any man should boast* (Ephesians 2:8-9) — yet *created in HaMashiach Yahusha (Christ Jesus) unto good works* (Ephesians 2:10). Harmonized: he saved us by his mercy and not by our merit, washed us with the clean water of the new covenant, put his Ruach within us, and so caused us to walk in his statutes. Grace UNTO obedience, never grace INSTEAD OF the Torah.',
       sv.verse_id, ev.verse_id, 'free', 8700
  FROM _s237_t237c3_lookup sv, _s237_t237c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4',
       E'Careful to maintain good works: the obedient life the new birth produces (Deuteronomy 26, Tobit 4, Ephesians 2)',
       E'The same Paul who has just said salvation is *not by works of righteousness which we have done* (Titus 3:5) turns at once to the works the saved must do: *This is a faithful saying... that they which have believed in Elohim (God) might be careful to maintain good works. These things are good and profitable unto men* (Titus 3:8); and again, *let ours also learn to maintain good works for necessary uses, that they be not unfruitful* (Titus 3:14). There is no contradiction — grace is not the end of obedience but its source. Ephesians binds the two in one breath: *For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:10). Good works are not the root of salvation but its ordained fruit, the obedient life the new birth produces. And those good works are the covenant walk Moses set before the redeemed: *Thou hast avouched Yahuah (LORD) this day to be thy Elohim (God), and to walk in his ways, and to keep his statutes, and his commandments, and his judgments, and to hearken unto his voice* (Deuteronomy 26:17) — to walk in his ways and keep his statutes from a new heart. The Hebrew library teaches the same open-handed fruitfulness: *Give alms of your substance... If you have abundance give alms accordingly: if you have but a little, be not afraid to give... For you layest up a good treasure for thyself against the day of necessity* (Tobit 4:7-9), the charge of a father who first bids his son *be mindful of Yahuah (God)... and let not your will be set to sin, or to transgress his commandments* (Tobit 4:5). This is the very life Paul would have the believers learn — good works *for necessary uses,* mercy to the poor, the doing of the law from love, that they *be not unfruitful.*',
       sv.verse_id, ev.verse_id, 'extras', 8701
  FROM _s237_t237c3_lookup sv, _s237_t237c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8',
       E'Avoid strivings about the law: the rebuke is vain wrangling, not the law itself (Proverbs 26, Sirach 8)',
       E'*But avoid foolish questions, and genealogies, and contentions, and strivings about the law; for they are unprofitable and vain* (Titus 3:9). Read with care, for the trained ear hears *strivings about the law* as a slight against the law. It is not. What Paul calls *unprofitable and vain* is the wrangling itself — the *foolish questions,* the *contentions,* the empty disputes of the babbler — never the Torah of Yahuah (LORD) over which the fool quarrels. The wisdom of Proverbs long taught the shepherd not to be drawn into a fool''s quarrel: *Answer not a fool according to his folly, lest thou also be like unto him* (Proverbs 26:4), for *Speak not in the ears of a fool: for he will despise the wisdom of thy words* (Proverbs 23:9). The unprofitableness lies in the contentious fool who twists and despises, not in the word he twists. The Hebrew library says the same: *Strive not with a man that is full of tongue, and heap not wood upon his fire* (Sirach 8:3) — to enter such a quarrel is only to feed the flame. So the charge stands beside Paul''s own teaching that the law is *holy, and just, and good* and *good, if a man use it lawfully*: the law is not the vanity; the vain wrangling and the fables are. The wise shepherd refuses to heap wood on that fire, and spends himself instead on sound doctrine and the maintaining of good works.',
       sv.verse_id, ev.verse_id, 'extras', 8702
  FROM _s237_t237c3_lookup sv, _s237_t237c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='titus' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 9:5 — *Not for thy righteousness, or for the uprightness of thine heart... but that he may perform the word which Yahuah (LORD) sware unto thy fathers* the same guard Paul sets: *Not by works of righteousness which we have done, but according to his mercy he saved us* (Titus 3:5) — flesh-merit excluded, not the Torah.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:8 — *because Yahuah (LORD) loved you, and because he would keep the oath... hath Yahuah (LORD) brought you out* salvation flowing from his love and his oath, the ground of *according to his mercy he saved us* (Titus 3:5).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean... will I cleanse you* the new-covenant cleansing behind the *washing of regeneration* (Titus 3:5) — filthiness and idols washed away, not the Torah.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* the decisive guard: the *renewing of the Ruach HaKodesh* (Titus 3:5) leads STRAIGHT into walking in his statutes.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joel 2:28 — *I will pour out my spirit upon all flesh* the outpouring behind the Ruach *shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour* (Titus 3:6).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Timothy 1:9 — *not according to our works, but according to his own purpose and grace* the twin of Titus 3:5; *our works* the flesh-credential excluded, not the commandments of Yahuah (LORD).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ephesians 2:9 — *Not of works, lest any man should boast* the thing barred is the BOAST of self-earned standing; the same guard as *not by works of righteousness which we have done* (Titus 3:5), and grace UNTO good works in the next verse.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'John 3:5 — *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* the new birth by cleansing-water and renewing-Spirit, the *washing of regeneration, and renewing of the Ruach HaKodesh* of Titus 3:5.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-not-by-works-of-our-righteousness-but-by-his-mercy-the-washing-of-regeneration-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 2:10 — *his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* good works the ordained fruit, not the root; the obedient life Paul would have *maintained* (Titus 3:8).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 26:17 — *to walk in his ways, and to keep his statutes, and his commandments... and to hearken unto his voice* the covenant walk that IS the good works the redeemed *maintain* (Titus 3:8) from a new heart.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:9 — *you layest up a good treasure for thyself against the day of necessity* almsgiving as good works laid up; the open-handed fruit of *be careful to maintain good works* (Titus 3:8).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance... turn not your face from any poor* the neighbour-serving good work behind *let ours also learn to maintain good works for necessary uses, that they be not unfruitful* (Titus 3:14).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-careful-to-maintain-good-works-the-life-the-new-birth-produces-deuteronomy-26-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:4 — *Answer not a fool according to his folly, lest thou also be like unto him* the wisdom not to be drawn into the fool''s quarrel; the rebuke of Titus 3:9 falls on the *contentions* and the foolish questioner, not on the law.'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:9 — *Speak not in the ears of a fool: for he will despise the wisdom of thy words* the reason the striving is fruitless lies in the contentious fool, not in the word he despises; *unprofitable and vain* (Titus 3:9).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 8:3 — *Strive not with a man that is full of tongue, and heap not wood upon his fire* the Hebrew wisdom against feeding the babbler''s quarrel; the *strivings about the law... unprofitable and vain* are the vain wrangling, not the law (Titus 3:9).'
  FROM cross_reference_threads t, cross_references x, _s237_t237c3_lookup sv, _s237_t237c3_lookup tv
 WHERE t.slug='titus-3-avoid-strivings-about-the-law-vain-wrangling-not-the-law-itself-proverbs-26-sirach-8'
   AND sv.edition_slug='canon' AND sv.book_slug='titus' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session237 — Titus cross-references complete.'
