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
