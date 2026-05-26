-- =====================================================================
-- Session 138 — Matt 9 extras-tier cross-references (single chapter)
-- =====================================================================
-- Adds Matt 9's extras-tier rows + threads to the cross-reference
-- corpus. Continues the S131 (Matt 1-2), S132 (Matt 3), S133 (Matt 4),
-- S134 (Matt 5), S135 (Matt 6), and S137 (Matt 7-8 paired) extras-tier
-- coverage onto the post-Sermon forgiveness-and-calling ministry. Single
-- chapter migration — precedent: S132 / S133 / S134 / S135 were each
-- single-chapter; S131 and S137 were paired. Matt 9 is single because
-- the chapter is dense narrative ground (paralytic + sins-forgiven
-- blasphemy debate, call of Mattityahu + *I will have mercy and not
-- sacrifice* (Hosea 6:6), fasting question + new wine in old bottles,
-- Yair + the woman with the issue of blood double-narrative-interweave,
-- two blind men + Son of David Messianic-credential, mute demoniac +
-- Pharisaic Beelzebul-attribution, the harvest is plenteous).
--
-- Matt 9 reading-target: the post-Sermon ministry deepening from the
-- credentialing-healings of chapter 8 into forgiveness, calling,
-- fasting-reframing, raising-of-the-dead, Son of David Messianic
-- recognition, and the first appearance of the Beelzebul slander that
-- Matthew 12 will dismantle. Thirteen Hebrew-library threads track the
-- chapter's framework moves at the restoration-not-innovation register:
--   * Hosea 6:6 mercy-not-sacrifice diagnostic — the wisdom-stream's
--     direct articulation at Sirach 35 (mercy AS the sacrifice-
--     substance), the alms-as-laid-up-treasure architecture at Tobit 4,
--     and the wisdom-stream's WRONG-stance the Pharisaic-counterfeit
--     inherits at Sirach 12 (give-not-to-the-sinner) that the King
--     REVERSES at the table with Mattityahu (Matthew).
--   * The named-title Son of Adam at Matt 9:6 — the Similitudes of
--     Enoch register (1 Enoch 48 pre-existence + naming-before-the-
--     Head-of-Days; 1 Enoch 62 enthronement) extending S137 Thread 10's
--     anchor at Matt 8:20 into the forgiveness-prerogative-exercise
--     register at Matt 9:6.
--   * The fasting question at Matt 9:14-15 — Tobit 12's prayer-fasting-
--     alms architecture and Sirach 34:26's fasting-without-repentance-is-
--     vain diagnostic locking the framework reading that fasting-with-
--     mercy stays operative while fasting-as-credential-without-mercy is
--     indicted.
--   * The new-wine / old-bottles parable at Matt 9:17 — Sirach 9:10's
--     inverse register on the wisdom-stream's old-vs-new wine.
--   * The healing-architecture at Matt 9:20-26 — Sirach 38's physician-
--     prayer prescription that the King's direct-touch bypasses; Wisdom
--     of Solomon 16:13's *power of life and death* architecture that
--     the King's raising-of-Yair's-daughter exercises in flesh.
--   * The Davidic-Messiah at Matt 9:27 — 2 Esdras (4 Ezra) 12's lion-
--     symbol Messiah-anointed-from-the-seed-of-David architecture that
--     the wisdom-stream had named explicitly in the apocalyptic register.
--   * The shepherdless multitudes and harvest at Matt 9:35-38 — 1 Enoch
--     90's Animal Apocalypse shepherds-judged-and-new-house-built
--     architecture, 2 Baruch 35's harvest-of-the-age-ripening, 2 Esdras
--     4's harvest-when-the-number-is-fulfilled, and 2 Baruch 38's
--     gathering-of-the-dispersed-with-much-mercy architecture.
--
-- Editions used at S138: Apocrypha KJV 1611 (`apocrypha` — Tobit,
-- Ecclesiasticus / Sirach, Wisdom of Solomon, 2 Esdras / 4 Ezra),
-- 1 Enoch (`enoch`), Pseudepigrapha Charles vol 2 (`pseudepigrapha` —
-- 2 Baruch). The full view filter retains every scripture-level extras
-- edition seeded for V1 for forward compatibility (Jasher, Apocrypha
-- Charles vol 1, Adam-Eve Conflict, Apocalypse of Abraham, Sonnini
-- Acts 29, Ascension of Isaiah, Jubilees) — these are not all targeted
-- in S138 because the Matt 9 readings do not surface a framework-bearing
-- connection from those other editions at the rigour the migration
-- requires. Historical-witness editions (Josephus, M.R. James's
-- apocryphal NT, Lightfoot's Apostolic Fathers) remain deferred from
-- V1 cross-refs per the historical-witness one-way rule.
--
-- Books not threaded at S138 (and why):
--   * Psalms of Solomon 17 (Davidic-Messianic) — NOT seeded V1
--     (`pseudepigrapha` edition carries Testaments of XII, 2/3 Baruch,
--     2 Enoch, 4 Maccabees, Adam-Eve; Psalms of Solomon is not in the
--     Charles vol 2 seeded set). The Davidic-Messianic register at
--     Matt 9:27 is carried by canon-anchors (2 Sam 7, Isa 11, Jer 23,
--     Ezek 34/37 — all in S110) PLUS the new 4 Ezra anchor in T9.
--
-- 2 Esdras 7:28 textual fix: the seeded text reads *my son Yahusha
-- (Jesus) shall be revealed* — the "Jesus" naming is a Christian-era
-- interpolation; the underlying Syriac reads *my son the Messiah.* The
-- voice-skill apocrypha-mode-exclusion rule was designed to prevent
-- exactly this case ("every 'Jesus' in the Apocrypha is Yeshua /
-- Yehoshua (Joshua) — NOT the Messiah"); the rule failed at ingestion
-- because the underlying KJV 1611 source carried the Christian-
-- interpolated naming. This migration applies an UPDATE statement to
-- correct the seeded verse text. The Davidic-Messiah thread T9 anchors
-- at 12:31-34 (the lion-symbol Messiah-anointed-from-David's-seed) and
-- includes 7:28-29 with the corrected text.
--
-- Thirteen PROPOSED threads at extras-tier:
--   1.  `mercy-not-sacrifice-in-sirach`                              (sort 236)
--   2.  `alms-as-laid-up-treasure-in-tobit`                          (sort 237)
--   3.  `publicans-and-sinners-and-sirach-12-inverse`                (sort 238)
--   4.  `the-named-son-of-adam-in-enoch-similitudes`                 (sort 239)
--   5.  `fasting-with-mercy-not-without-in-tobit-and-sirach`         (sort 240)
--   6.  `new-wine-and-the-old-friend-inverse-in-sirach`              (sort 241)
--   7.  `physician-prayer-architecture-in-sirach-bypassed`           (sort 242)
--   8.  `power-over-life-and-death-in-wisdom`                        (sort 243)
--   9.  `the-davidic-messiah-in-4-ezra`                              (sort 244)
--   10. `the-animal-apocalypse-shepherds-judged-and-new-house`       (sort 245)
--   11. `harvest-of-the-age-in-2-baruch`                             (sort 246)
--   12. `harvest-when-the-number-is-fulfilled-in-4-ezra`             (sort 247)
--   13. `gathering-the-dispersed-with-much-mercy-in-2-baruch`        (sort 248)
--
-- 34 new cross_references rows, all at tier_required='extras'. Every
-- member-note passes the 12 Red Lines and the 12-point editorial
-- checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 138 — Matt 9 extras-tier cross-references migration starting...'
BEGIN;

-- ---------------------------------------------------------------------
-- Verse-text fix: 2 Esdras 7:28 Christian-interpolation removal.
-- The seeded "Yahusha (Jesus)" in 7:28 is a Christian-era interpolation
-- (the underlying Syriac reads "my son the Messiah"). Restore to the
-- pre-interpolation reading.
-- ---------------------------------------------------------------------
UPDATE verses
   SET text = 'For my son the Messiah shall be revealed with those that be with him, and they that remain shall rejoice within four hundred years.'
 WHERE id = (
   SELECT v.id
     FROM verses v
     JOIN chapters c ON v.chapter_id = c.id
     JOIN books    b ON c.book_id    = b.id
     JOIN editions e ON b.edition_id = e.id
    WHERE e.slug = 'apocrypha'
      AND b.slug = '2-esdras'
      AND c.chapter_number = 7
      AND v.verse_number = 28
 );

-- Verse-lookup temp view. Same edition filter as S131-S137 — every
-- scripture-level extras edition seeded for V1, plus canon.
CREATE TEMP VIEW _s138_verse_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah'
   );

-- ---------------------------------------------------------------------
-- Insert 34 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: mercy-not-sacrifice-in-sirach
  ('canon', 'matthew', 9, 13, 'apocrypha', 'ecclesiasticus', 35, 1,
   '*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering.* Sirach (Ecclesiasticus) 35:1 names the wisdom-stream''s reframing of sacrifice-substance: keeping the Torah IS bringing offerings enough; taking heed to the commandment IS offering a peace-offering. The Pharisaic-counterfeit form at Matt 9:11-13 is the inverse — categorical-classification of the publicans-and-sinners while keeping the sacrificial-credential intact. Yahusha (Jesus) cites Hosea 6:6 against precisely this counterfeit; the wisdom-stream had named the corrected substance centuries before — Torah-keeping IS the offering; mercy IS the sacrifice-substance.'),
  ('canon', 'matthew', 9, 13, 'apocrypha', 'ecclesiasticus', 35, 2,
   '*He that requiteth a goodturn offers fine flour; and he that gives alms sacrificeth praise.* Sirach (Ecclesiasticus) 35:2 names the wisdom-stream''s direct architecture: giving alms IS sacrificing praise. The acts-of-mercy ARE the sacrifice-substance the Tanakh-prophetic-stream has been naming since 1 Samuel 15:22. Matt 9:13''s *I will have mercy, and not sacrifice* (Hosea 6:6) walks the same architecture at the kingdom-citizens level — the heart-Torah of mercy IS the sacrifice-substance the Pharisaic-counterfeit voids by external-credential-without-mercy.'),
  ('canon', 'matthew', 9, 13, 'apocrypha', 'ecclesiasticus', 35, 3,
   '*To depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation.* Sirach (Ecclesiasticus) 35:3 names the wisdom-stream''s atonement-substance: turning-from-wickedness IS propitiation. The Pharisaic-counterfeit at Matt 9:11-13 is the categorical-credential-without-heart-turning; Yahusha (Jesus) calls Mattityahu (Matthew) and the publicans-and-sinners to *repentance* (v.13b) precisely because their turning IS the propitiation the wisdom-stream had named.'),

  -- Thread 2: alms-as-laid-up-treasure-in-tobit
  ('canon', 'matthew', 9, 13, 'apocrypha', 'tobit', 4, 7,
   '*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* Tobit 4:7 names the wisdom-stream''s alms-and-mercy architecture as the heart-of-the-Torah-substance — giving alms with the eye-not-envious is the heart-Torah Hosea 6:6 names. The Pharisaic-counterfeit at Matt 9:11''s indignation over the table-fellowship-with-sinners is the inverse: envy-of-the-mercy-extended-to-the-marginalized in the costume of purity-credential.'),
  ('canon', 'matthew', 9, 13, 'apocrypha', 'tobit', 4, 9,
   '*For you layest up a good treasure for thyself against the day of necessity.* Tobit 4:9 names the alms-as-laid-up-treasure-against-the-day architecture explicitly — alms in the present-age lay up good treasure against the eschatological-day-of-necessity. The Sermon''s own *lay not up for yourselves treasures upon earth, but lay up for yourselves treasures in heaven* (Matthew 6:19-20) walks the same architecture in the heart-Torah register; Matt 9:13''s *I will have mercy, and not sacrifice* walks the same architecture at the kingdom-citizens dismantling of the Pharisaic-counterfeit.'),
  ('canon', 'matthew', 9, 13, 'apocrypha', 'tobit', 4, 10,
   '*Because that alms do deliver from death, and suffers not to come into darkness.* Tobit 4:10 names the alms-as-deliverance-from-death architecture in the wisdom-stream''s eschatological register. The Pharisaic-counterfeit collects sacrifice-credential while withholding the mercy-substance that Tobit names as the actual deliverance-architecture. Matt 9:13''s Hosea 6:6 citation walks the same diagnostic at the kingdom-citizens level: the mercy-substance IS the deliverance-substance.'),
  ('canon', 'matthew', 9, 13, 'apocrypha', 'tobit', 12, 9,
   '*For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life.* Tobit 12:9 (the angel Raphael''s closing instruction to Tobit and Tobias) names the alms-purges-away-all-sin architecture explicitly — the wisdom-stream''s naming of the mercy-substance as the very forgiveness-substance the King exercises at the paralytic''s pronouncement (Matt 9:2) and the Mattityahu (Matthew) table (Matt 9:13). Alms-and-righteousness — heart-Torah — is the deliverance-architecture both passages walk.'),

  -- Thread 3: publicans-and-sinners-and-sirach-12-inverse
  ('canon', 'matthew', 9, 10, 'apocrypha', 'ecclesiasticus', 12, 4,
   '*Give to the godly man, and help not a sinner.* Sirach (Ecclesiasticus) 12:4 names the wisdom-stream''s discriminating-mercy stance that the Pharisaic-counterfeit-righteousness inherited and weaponized: hold-back-mercy-from-the-sinner because the sinner is categorically excluded from the wisdom-stream''s mercy-flow. The framework reads Matt 9:10''s *many publicans and sinners came and sat down with him* as the King''s direct-reversal of the Sirach 12 stance — the categorical-exclusion the wisdom-stream had taught is dismantled at the table the King keeps.'),
  ('canon', 'matthew', 9, 11, 'apocrypha', 'ecclesiasticus', 12, 5,
   '*Do well to him that is lowly, but give not to the ungodly: hold back your bread, and give it not to him.* Sirach (Ecclesiasticus) 12:5 names the wisdom-stream''s explicit instruction the Pharisees of Matt 9:11 are operating under — hold-back-the-bread-from-the-ungodly. The Pharisaic *why eateth your Master with publicans and sinners?* indictment of Matt 9:11 IS the Sirach 12:5 framework operative; Yahusha (Jesus) is breaking the wisdom-stream''s discriminating-bread-fellowship rule by eating with those Sirach 12 instructed his disciples to hold-back-from. The framework reading: not every wisdom-stream teaching is operative in the kingdom-at-hand; the King''s direct-mercy supersedes the wisdom-stream''s categorical-exclusion stance.'),
  ('canon', 'matthew', 9, 13, 'apocrypha', 'ecclesiasticus', 12, 7,
   '*Give to the good, and help not the sinner.* Sirach (Ecclesiasticus) 12:7 reiterates the wisdom-stream''s categorical-exclusion stance the King reverses at Matt 9:13. Yahusha (Jesus) is *not come to call the righteous, but sinners to repentance* — the inverse of the Sirach 12 mandate. The wisdom-stream had a wrong-stance on this; the King restores the heart-Torah by going TO the sinners precisely because the wisdom-stream''s discriminating-mercy excluded them. The Hosea 6:6 mercy-substance is BROADER than the wisdom-stream''s godly-righteous register; it extends to the sinners-to-be-called.'),

  -- Thread 4: the-named-son-of-adam-in-enoch-similitudes
  ('canon', 'matthew', 9, 6, 'enoch', '1-enoch', 48, 2,
   '*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* 1 Enoch 48:2 names the Son of Adam''s pre-existence-and-naming-before-the-Head-of-Days architecture in the Similitudes — the Son of Adam was named BEFORE creation; his name was named before Yahuah (God) of Spirits. Matt 9:6''s *the Son of Adam hath power on earth to forgive sins* is the in-flesh exercise of the authority that 1 Enoch 48 names as eternally-pre-existent. The figure who has the Father''s-forgiveness-prerogative in flesh is the figure 1 Enoch had named as pre-existent. Red Line #12 governs the named-title rendering (not kaph-comparative).'),
  ('canon', 'matthew', 9, 6, 'enoch', '1-enoch', 48, 3,
   '*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* 1 Enoch 48:3 intensifies the architecture: the Son of Adam''s name was named before creation itself. Matt 9:6''s in-flesh exercise of the Father''s forgiveness-prerogative is the present-tense demonstration of the eternal-pre-existence the Similitudes had named — the Son of Adam exercising on earth what was his before the foundation of the world.'),
  ('canon', 'matthew', 9, 6, 'enoch', '1-enoch', 62, 7,
   '*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.* 1 Enoch 62:7 names the Son of Adam''s righteousness-abides-over-him architecture — the Son of Adam IS the righteous one over whom righteousness abides. Matt 9:6''s authority to forgive sins is the present-tense exercise of the righteousness 1 Enoch 62 had named as eternally-abiding. The Father''s forgiveness-prerogative is exercised in flesh by the Son of Adam whose righteousness is the architecture of the forgiveness-flow.'),

  -- Thread 5: fasting-with-mercy-not-without-in-tobit-and-sirach
  ('canon', 'matthew', 9, 14, 'apocrypha', 'tobit', 12, 8,
   '*Prayer is good with fasting and alms and righteousness. A little with righteousness is better than much with unrighteousness. It is better to give alms than to lay up gold.* Tobit 12:8 (the angel Raphael''s instruction) names the wisdom-stream''s prayer-fasting-alms-righteousness triad as the operative-discipline of the godly. Matt 9:14''s fasting-question presupposes the Pharisaic-style fasting-as-credential-without-the-mercy-triad operative; Yahusha (Jesus) does not abolish fasting (he affirms it at v.15b *then shall they fast*) but reframes it in the bridegroom-architecture and in the Tobit-mercy-triad. Fasting alone is not the discipline; fasting WITH prayer, alms, and righteousness is the wisdom-stream''s teaching the King restores.'),
  ('canon', 'matthew', 9, 15, 'apocrypha', 'ecclesiasticus', 34, 26,
   '*So is it with a man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer? or what does his humbling profit him?* Sirach (Ecclesiasticus) 34:26 names the wisdom-stream''s fasting-without-repentance-is-vain diagnostic explicitly — the faster who fasts for his sins and continues in them is not heard. The Pharisaic-counterfeit form at Matt 9:14 is fasting-as-credential while the categorical-exclusion-of-sinners and the mercy-withholding continues; Sirach 34:26 had named the diagnostic centuries before. The King''s bridegroom-frame at Matt 9:15 reframes fasting in the wedding-substance; the post-ascension assembly fasts (*then shall they fast*) but in the mercy-substance Sirach 34:26 implied as the precondition.'),

  -- Thread 6: new-wine-and-the-old-friend-inverse-in-sirach
  ('canon', 'matthew', 9, 17, 'apocrypha', 'ecclesiasticus', 9, 10,
   '*Forsake not an old friend; for the new is not comparable to him: a new friend is as new wine; when it is old, you shall drink it with pleasure.* Sirach (Ecclesiasticus) 9:10 names the wisdom-stream''s old-vs-new wine register — the wisdom-stream holds the old friend (and the old wine) as more trustworthy than the new. The framework reads Matt 9:17''s new-wine / new-bottles parable in inverse register: the wisdom-stream''s old-is-better register is precisely the Pharisaic-rabbinic-system''s self-justification — the old-tradition-fences cannot be ruptured by the new heart-Torah-walking. The framework angle is that the wisdom-stream RECOGNIZES the new-vs-old containment question as a real question; the gospel REFRAMES it by naming the heart-Torah-substance the new-heart container holds and the Pharisaic-old-bottle cannot. The Torah itself is NEITHER the wine NOR the wineskin; the Pharisaic-system''s wisdom-stream-old-friend-loyalty is the old wineskin that bursts when the heart-Torah-life enters.'),

  -- Thread 7: physician-prayer-architecture-in-sirach-bypassed
  ('canon', 'matthew', 9, 20, 'apocrypha', 'ecclesiasticus', 38, 9,
   '*My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole.* Sirach (Ecclesiasticus) 38:9 names the wisdom-stream''s prescribed-healing-architecture: pray to the Most High first; he will make you whole. The bleeding-woman of Matt 9:20-22 walks an inversion of the Sirach-38 architecture in one register and a fulfillment in another. The framework reads the inversion: she does not pray-then-wait for the indirect-healing-flow Sirach prescribes; she touches the King''s garment directly because the King is the Formed-Voice through whom the Most High''s healing-flow operates in present-tense-direct.'),
  ('canon', 'matthew', 9, 22, 'apocrypha', 'ecclesiasticus', 38, 12,
   '*Then give place to the physician, for Yahuah (God) has created him: let him not go from you, for you have need of him.* Sirach (Ecclesiasticus) 38:12 names the wisdom-stream''s give-place-to-the-physician prescription. The bleeding-woman of Matt 9:20-22 had given place to physicians for twelve years (Mark 5:26 records the Sirach-38 prescription faithfully followed and failed); the King''s direct-cleansing-source-touch reverses the defiling-flow that the physician-chain could not heal — and Yahusha (Jesus) names her faith (not her physician-adherence) as the architecture of her wholeness at v.22.'),
  ('canon', 'matthew', 9, 25, 'apocrypha', 'ecclesiasticus', 38, 14,
   '*For they shall also pray to Yahuah (God), that he would prosper that, which they give for ease and remedy to prolong life.* Sirach (Ecclesiasticus) 38:14 names the wisdom-stream''s physician-prays-to-the-Most-High architecture — the physician''s success is itself dependent on the Most High''s prosper-the-remedy authority. At Matt 9:25 the King takes the dead girl''s hand directly; the physician-chain has reached its limit (the girl is dead), and the prosper-the-remedy authority Sirach 38 names as flowing through the physician-prayer-chain is now exercised directly by the Formed-in-flesh.'),

  -- Thread 8: power-over-life-and-death-in-wisdom
  ('canon', 'matthew', 9, 24, 'apocrypha', 'the-wisdom-of-solomon', 16, 13,
   '*For you have power of life and death: you leadest to the gates of hell, and bringest up again.* Wisdom of Solomon 16:13 names the wisdom-stream''s direct architecture of the Most High''s power-of-life-and-death: he leads to the gates of hell, and brings up again. Matt 9:24''s *the maid is not dead, but sleepeth* and 9:25''s raising-of-Yair''s-daughter walk the same architecture in flesh-presence: the King who exercises the power-of-life-and-death IS the Formed through whom that power operates. The wisdom-stream had named the Most High''s authority over death; the King at Matt 9:25 IS that authority in flesh.'),
  ('canon', 'matthew', 9, 25, 'apocrypha', 'the-wisdom-of-solomon', 16, 14,
   '*A man indeed killeth through his malice: and the spirit, when it is gone forth, returns not; neither the soul received up comes again.* Wisdom of Solomon 16:14 names the wisdom-stream''s mortal-man-cannot-bring-back diagnostic explicitly — the spirit that is gone returns not; the soul received up comes not again BY MAN. The framework reads Matt 9:25 against the diagnostic: the King brings back the spirit that has gone, raises the daughter the wisdom-stream had named no-mortal-can-raise. The Formed-in-flesh exercises the prerogative the wisdom-stream had named as the Most High''s alone — confirming the Formed-from-the-Formless framework on the nature of Yahusha (Jesus).'),

  -- Thread 9: the-davidic-messiah-in-4-ezra
  ('canon', 'matthew', 9, 27, 'apocrypha', '2-esdras', 12, 31,
   '*And the lion, whom you sawest rising up out of the wood, and roaring, and speaking to the eagle, and rebuking her for her unrighteousness with all the words which you have heard...* 2 Esdras (4 Ezra) 12:31 names the lion-rising-out-of-the-wood vision the Most High''s angel-interpreter identifies as the Messiah-from-the-seed-of-David at v.32. The framework reads the lion-symbol as the wisdom-stream''s apocalyptic-register naming of the Davidic-Messianic restoration-figure — the lion who rebukes the eagle (the fourth-beast-empire of Daniel 7) is the Messiah-anointed who Matt 9:27''s blind men confess as *Son of David.*'),
  ('canon', 'matthew', 9, 27, 'apocrypha', '2-esdras', 12, 32,
   '*This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty.* 2 Esdras (4 Ezra) 12:32 names the lion-figure as the anointed (the Messiah / Christ) the Most High has kept against the end-of-the-age — the figure who shall reprove and upbraid the cruelty of the wicked. The framework''s Davidic-Messianic register at Matt 9:27 has its wisdom-stream apocalyptic-witness here: the Messiah-anointed from-the-seed-of-David is the figure the blind men confess in present-tense, and the figure 2 Esdras names as kept for the end. The same figure; the apocalyptic-stream named him; the in-flesh-King walks him.'),
  ('canon', 'matthew', 9, 27, 'apocrypha', '2-esdras', 12, 34,
   '*For the rest of my people shall he deliver with mercy, those that have been pressed upon my borders, and he shall make them joyful until the coming of the day of judgment.* 2 Esdras (4 Ezra) 12:34 names the Davidic-Messiah''s deliver-with-mercy architecture explicitly — the Messiah delivers the remnant of the people with mercy, those who have been pressed upon the borders (the scattered seed). The framework''s gathering-thesis lands at full weight in this verse: the Messiah-from-the-seed-of-David delivers the scattered-and-pressed remnant with mercy — Hosea 6:6''s mercy-substance + the gathering of Matt 9:36 + the Davidic-Messianic recognition of Matt 9:27 are one architecture.'),
  ('canon', 'matthew', 9, 27, 'apocrypha', '2-esdras', 7, 28,
   '*For my son the Messiah shall be revealed with those that be with him, and they that remain shall rejoice within four hundred years.* 2 Esdras (4 Ezra) 7:28 names the Messianic-revelation explicitly — the Most High''s son the Messiah shall be revealed. (The seeded text''s "Yahusha (Jesus)" naming at this verse is a Christian-era interpolation corrected by this migration to the underlying Syriac''s *the Messiah*.) The framework reads the verse as the wisdom-stream''s apocalyptic-register confirmation of the Davidic-Messianic figure Matt 9:27''s blind men confess in present-tense — the Messiah whose revelation 4 Ezra had named as future is the figure the blind men perceive as present.'),

  -- Thread 10: the-animal-apocalypse-shepherds-judged-and-new-house
  ('canon', 'matthew', 9, 36, 'enoch', '1-enoch', 90, 16,
   '*And the shepherds (corrupt leaders) who had not fed the sheep were judged, and cast into the same fiery abyss with the beasts.* 1 Enoch 90:16 (within the Animal Apocalypse) names the shepherds-who-had-not-fed-the-sheep judgment explicitly — the false-shepherds of Yashar''el (Israel) cast into the fiery abyss for failing the flock. Matt 9:36''s *sheep having no shepherd* multitudes is the same diagnostic operative at the King''s arrival: the contemporary-Pharisaic-Sadducean-leadership is the same architecture 1 Enoch 90 names as appointed-for-judgment. The Yechezk''el-34 anchor (canon-tier, S110) and the 1 Enoch 90:16 apocalyptic-witness both name the shepherds-who-failed the flock.'),
  ('canon', 'matthew', 9, 36, 'enoch', '1-enoch', 90, 17,
   '*And a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house.* 1 Enoch 90:17 names the restoration-architecture immediately after the shepherds-judgment — the Lord of the sheep builds a new house greater than the first and brings all the sheep into it. Matt 9:36''s scattered-shepherdless multitudes are the sheep the Lord of the sheep is in the process of gathering into the new-house-substance Yahusha (Jesus) is inaugurating. The wisdom-stream had named the gather-into-the-new-house architecture; the King at Matt 9:36 sees the multitudes in the present-tense fulfillment.'),
  ('canon', 'matthew', 9, 36, 'enoch', '1-enoch', 90, 18,
   '*And I saw till all the beasts and the birds and the wild animals were gathered, and they all feared the Lord of the sheep, and they began to praise Him.* 1 Enoch 90:18 names the full-gathering-and-fear-of-the-Lord-of-the-sheep architecture — at the end of the restoration-arc, all the sheep are gathered into the new house and fear the Lord of the sheep. Matt 9:36''s present-tense seeing of the scattered multitudes is the Shepherd''s arrival at the moment the gathering 1 Enoch 90 had named begins to be enacted in flesh.'),

  -- Thread 11: harvest-of-the-age-in-2-baruch
  ('canon', 'matthew', 9, 37, 'pseudepigrapha', '2-baruch', 35, 1,
   '*Behold! the days come, and it shall be when the time of the age has ripened, And the harvest of its evil and good seeds has come, That the Mighty One will bring upon them...* 2 Baruch 35:1 names the wisdom-stream''s apocalyptic-harvest architecture explicitly — the harvest comes when the time of the age has ripened; the harvest is of evil-and-good-seeds together. Matt 9:37''s *the harvest truly is plenteous, but the labourers are few* walks the same architecture at the King''s arrival: the harvest the apocalyptic-stream had named as eschatologically-future is now plenteous and present at the King''s seeing of the multitudes.'),
  ('canon', 'matthew', 9, 38, 'pseudepigrapha', '2-baruch', 35, 1,
   '*Behold! the days come, and it shall be when the time of the age has ripened, And the harvest of its evil and good seeds has come, That the Mighty One will bring upon them...* 2 Baruch 35:1 — the same eschatological-harvest-of-the-age verse also anchors Matt 9:38''s *pray ye therefore the Lord of the harvest, that he will send forth labourers.* The Lord-of-the-harvest is the Mighty One the apocalyptic-stream had named; the labourers being prayed-for are about to be commissioned at Matt 10:1.'),

  -- Thread 12: harvest-when-the-number-is-fulfilled-in-4-ezra
  ('canon', 'matthew', 9, 37, 'apocrypha', '2-esdras', 4, 35,
   '*Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* 2 Esdras (4 Ezra) 4:35 names the wisdom-stream''s apocalyptic-fruit-of-the-floor (= harvest) question explicitly — the souls of the righteous in their chambers ask how long until the harvest comes. Matt 9:37''s *the harvest truly is plenteous* names the answer in present-tense at the King''s arrival: the harvest the souls had asked about is now plenteous; the wisdom-stream''s anticipation is met in the King''s seeing of the multitudes.'),
  ('canon', 'matthew', 9, 38, 'apocrypha', '2-esdras', 4, 36,
   '*And to these things Uriel the archangel gave them answer, and said, Even when the number of seeds is filled in you: for he has weighed the world in the balance.* 2 Esdras (4 Ezra) 4:36 names the harvest-comes-when-the-number-of-seeds-is-filled architecture — the harvest is timed to the fulness of the seed-count. Matt 9:38''s prayer-for-labourers is the kingdom-citizens'' participation in the seed-filling: the labourers being sent into the harvest are the means by which the number of seeds is gathered to fulness. The wisdom-stream named the timing-architecture; the King at Matt 9:38 enlists the disciples in its execution.'),

  -- Thread 13: gathering-the-dispersed-with-much-mercy-in-2-baruch
  ('canon', 'matthew', 9, 36, 'pseudepigrapha', '2-baruch', 38, 4,
   '*And truly I know that behold all we the twelve tribes are bound by one bond, inasmuch as we are born from one father.* 2 Baruch 38:4 names the twelve-tribes-bound-by-one-bond architecture in the wisdom-stream''s apocalyptic register — all the twelve tribes are bound by one bond, born from one father. The framework''s gathering-thesis holds the twelve-tribe-restoration as the load-bearing prophetic substance; Matt 9:36''s *sheep having no shepherd* multitudes are the same twelve-tribe-bound-by-one-bond body the wisdom-stream had named.'),
  ('canon', 'matthew', 9, 36, 'pseudepigrapha', '2-baruch', 38, 7,
   '*He who always promised on our behalf to those who were more excellent than we, that He will never forget or forsake us, but with much mercy will gather together again those who were dispersed.* 2 Baruch 38:7 (epistle to the nine-and-a-half scattered tribes across the Euphrates) names the wisdom-stream''s gathering-of-the-dispersed-with-much-mercy architecture explicitly. The much-mercy register at 2 Baruch 38:7 is the same mercy-substance Hosea 6:6 names at Matt 9:13; the gathering-of-the-dispersed IS the mercy-architecture of the kingdom-at-hand.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s138_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s138_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 13 new extras-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1 (sort 236): mercy-not-sacrifice-in-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mercy-not-sacrifice-in-sirach',
       'Mercy not sacrifice — Sirach 35 on the corrected sacrifice-substance',
       'Matt 9:13''s *I will have mercy, and not sacrifice* (Hosea 6:6) — read against the wisdom-stream''s own articulation of the corrected sacrifice-substance in Sirach (Ecclesiasticus) 35. Three explicit moves: keeping the Torah IS bringing offerings enough (35:1); giving alms IS sacrificing praise (35:2); departing from wickedness IS propitiation (35:3). The Tanakh-prophetic stream that backs Yahusha (Jesus)''s citation (1 Sam 15:22, Isa 1:11-17, Jer 7:22-23, Amos 5:21-24, Mic 6:8) is canon-anchored and walked in matthew-9.md §2; this thread surfaces the wisdom-stream''s direct articulation of the same diagnostic. The Pharisaic-counterfeit form is sacrifice-with-no-mercy; the wisdom-stream had named the corrected substance centuries before.',
       sv.verse_id, ev.verse_id, 'extras', 236
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (sort 237): alms-as-laid-up-treasure-in-tobit
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'alms-as-laid-up-treasure-in-tobit',
       'Alms as laid-up treasure — Tobit 4 and Tobit 12 on the mercy-substance as eschatological deliverance',
       'Matt 9:13''s *I will have mercy, and not sacrifice* (Hosea 6:6) — read against the wisdom-stream''s alms-as-laid-up-treasure architecture in Tobit. Tobit 4:7 names the eye-not-envious discipline of alms-giving (the face of Yahuah (God) shall not be turned away from the giver). Tobit 4:9 names the alms-as-treasure-against-the-day-of-necessity architecture explicitly. Tobit 4:10 names the alms-deliver-from-death substance. Tobit 12:9 (the angel Raphael''s closing instruction) locks the diagnostic: *alms does deliver from death, and shall purge away all sin.* The mercy-substance IS the deliverance-and-forgiveness architecture; the Pharisaic-counterfeit''s sacrifice-without-mercy at Matt 9:11-13 is what Yahusha (Jesus) dismantles by going to the table with the publicans-and-sinners.',
       sv.verse_id, ev.verse_id, 'extras', 237
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

-- Thread 3 (sort 238): publicans-and-sinners-and-sirach-12-inverse
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'publicans-and-sinners-and-sirach-12-inverse',
       'The Sirach 12 give-not-to-the-sinner stance the King reverses at Mattityahu''s table',
       'Matt 9:10-13''s table-fellowship with publicans-and-sinners — read against the wisdom-stream''s explicit categorical-exclusion teaching in Sirach (Ecclesiasticus) 12. Sirach 12:4 instructs *give to the godly man, and help not a sinner.* Sirach 12:5 instructs *hold back your bread, and give it not* to the ungodly. Sirach 12:7 reiterates *give to the good, and help not the sinner.* This is the wisdom-stream''s wrong-stance the Pharisaic-counterfeit-righteousness inherited and weaponized into the categorical-exclusion architecture Yahusha (Jesus) dismantles at the table with Mattityahu (Matthew). The framework reads the King''s response as direct-reversal of the Sirach 12 stance: *I am not come to call the righteous, but sinners to repentance* (v.13b) inverts the Sirach 12 mandate explicitly. Not every wisdom-stream teaching is operative in the kingdom-at-hand; the King''s direct-mercy supersedes the wisdom-stream''s categorical-exclusion. The Hosea 6:6 mercy-substance is BROADER than the wisdom-stream''s godly-righteous register; it extends to the sinners-to-be-called.',
       sv.verse_id, ev.verse_id, 'extras', 238
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

-- Thread 4 (sort 239): the-named-son-of-adam-in-enoch-similitudes
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-named-son-of-adam-in-enoch-similitudes',
       'The named Son of Adam in the Similitudes of Enoch — pre-existence, naming, and enthronement at Matt 9:6',
       'Matt 9:6''s *the Son of Adam hath power on earth to forgive sins* — read against the Similitudes of Enoch''s named-Son-of-Adam architecture. 1 Enoch 48:2-3 names the Son of Adam''s pre-existence-and-naming-before-the-Head-of-Days — the name was named before the sun and the signs were created. 1 Enoch 62:7 names the Son of Adam as the one over whom righteousness abides eternally. Matt 9:6 is the in-flesh exercise of the authority 1 Enoch had named as eternally-pre-existent. The figure who has the Father''s-forgiveness-prerogative in flesh is the figure 1 Enoch had named as pre-existent; the righteousness that abides over him is the architecture of the forgiveness-flow he exercises in flesh. Red Line #12 governs the named-title rendering — this is the title-naming case (not the kaph-comparative case of Daniel 7:13 / Rev 1:13 / Rev 14:14 where the comparative is preserved). S137 Thread 10 anchored the named-title parallel at Matt 8:20 with 1 Enoch 46:1-3; this thread extends the architecture into the forgiveness-prerogative-exercise register at Matt 9:6 with 1 Enoch 48 and 62.',
       sv.verse_id, ev.verse_id, 'extras', 239
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 6
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 6
ON CONFLICT (slug) DO NOTHING;

-- Thread 5 (sort 240): fasting-with-mercy-not-without-in-tobit-and-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'fasting-with-mercy-not-without-in-tobit-and-sirach',
       'Fasting with the mercy-triad, not fasting as credential — Tobit 12 and Sirach 34',
       'Matt 9:14-15''s fasting-question and bridegroom-reframe — read against the wisdom-stream''s naming of fasting as one part of a triad-discipline that requires the mercy-substance to be operative. Tobit 12:8 (the angel Raphael''s instruction) names the prayer-fasting-alms-righteousness triad as the godly-discipline; fasting alone is not the discipline — fasting WITH prayer, alms, and righteousness is. Sirach 34:26 names the fasting-without-repentance-is-vain diagnostic explicitly — *the man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer?* The Pharisaic-counterfeit form at Matt 9:14 is fasting-as-credential while the categorical-exclusion-of-sinners continues; the wisdom-stream had named the diagnostic centuries before. Yahusha (Jesus) does not abolish fasting (he affirms it at v.15b *then shall they fast*) but reframes it in the bridegroom-architecture and presupposes the mercy-triad operating beneath it. The post-ascension assembly fasts; the framework reads the discipline in the Tobit-Sirach register.',
       sv.verse_id, ev.verse_id, 'extras', 240
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 14
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

-- Thread 6 (sort 241): new-wine-and-the-old-friend-inverse-in-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'new-wine-and-the-old-friend-inverse-in-sirach',
       'New wine and the old friend — Sirach 9:10 as inverse to the Matt 9:17 reframing',
       'Matt 9:17''s *neither do men put new wine into old bottles ... but they put new wine into new bottles, and both are preserved* — read against the Hebrew library''s wisdom-stream old-vs-new wine register. Sirach (Ecclesiasticus) 9:10 holds the old-vs-new wine architecture in inverse register: *forsake not an old friend; for the new is not comparable to him: a new friend is as new wine; when it is old, you shall drink it with pleasure.* The wisdom-stream holds the old as more trustworthy than the new — and the Pharisaic-rabbinic-system''s self-justification rests on precisely that wisdom-stream loyalty: the old-tradition-fences cannot be ruptured by the new heart-Torah-walking; the inherited rabbinic-system is the trustworthy-old-friend. The framework angle is that the wisdom-stream RECOGNIZES the new-vs-old containment question as a real question, and the gospel REFRAMES it by naming the heart-Torah-substance the new-heart container holds and the Pharisaic-old-bottle cannot. The Torah itself is NEITHER the wine NOR the wineskin (per the matthew-9.md §3 framework reading); the Pharisaic-rabbinic-system''s wisdom-stream-old-friend-loyalty is the old wineskin that bursts when the heart-Torah-life enters.',
       sv.verse_id, ev.verse_id, 'extras', 241
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 17
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

-- Thread 7 (sort 242): physician-prayer-architecture-in-sirach-bypassed
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'physician-prayer-architecture-in-sirach-bypassed',
       'The physician-prayer architecture of Sirach 38 bypassed at the King''s direct touch',
       'Matt 9:20-26''s bleeding-woman and Yair (Jairus)''s daughter pericopes — read against the Hebrew library''s wisdom-stream prescribed-healing architecture. Sirach (Ecclesiasticus) 38:9-15 prescribes the architecture explicitly: pray to the Most High (38:9), depart from sin (38:10), bring the prescribed-offering (38:11), then give place to the physician (38:12) because the physician''s success depends on his own prayer to the Most High (38:14). The framework reads the Matt 9 healings in inverse register: the bleeding-woman (9:20-22) had given place to physicians for twelve years (Mark 5:26 records the failure of the Sirach-38 prescription faithfully followed); Yair''s daughter (9:23-26) is past the physician-chain''s limit (she is dead). The King''s direct-cleansing-source-touch bypasses the Sirach-38 mediator-chain and exercises the prosper-the-remedy authority directly. The wisdom-stream had named the prescribed-healing architecture truly; the gospel reveals the King as the direct-source the wisdom-stream''s prescription pointed toward through its mediator-chain. The framework reading distinguishes carefully from the Sirach-38-as-prescription-of-medicine inheritance the Christian-commentary tradition often surfaces — the wisdom-stream''s prayer-first / physician-second sequence is preserved in its proper register, and the King at Matt 9:20-26 is the present-tense direct-source the wisdom-stream had named the Most High to be.',
       sv.verse_id, ev.verse_id, 'extras', 242
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 20
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 26
ON CONFLICT (slug) DO NOTHING;

-- Thread 8 (sort 243): power-over-life-and-death-in-wisdom
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'power-over-life-and-death-in-wisdom',
       'Power over life and death — Wisdom of Solomon 16 and the raising of Yair''s daughter',
       'Matt 9:24-25''s raising of Yair (Jairus)''s daughter — read against the wisdom-stream''s direct articulation of the power-over-life-and-death architecture. Wisdom of Solomon 16:13 names the Most High''s authority explicitly: *you have power of life and death: you leadest to the gates of hell, and bringest up again.* Wisdom 16:14 names the inverse diagnostic — mortal-man can kill but cannot bring back; the spirit that is gone returns not by man. The framework reads Matt 9:25 against the full Wisdom 16 architecture: the King who raises the daughter exercises the prerogative the wisdom-stream had named as the Most High''s alone. The framework''s nature-of-God reading holds at full weight — the Formed-in-flesh is the present-tense exercise of the Father''s-power-of-life-and-death; the King is the source the wisdom-stream had named.',
       sv.verse_id, ev.verse_id, 'extras', 243
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

-- Thread 9 (sort 244): the-davidic-messiah-in-4-ezra
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-davidic-messiah-in-4-ezra',
       'The Davidic Messiah in 4 Ezra (2 Esdras) — the lion-symbol Messiah-anointed at Matt 9:27',
       'Matt 9:27''s *Thou Son of David, have mercy on us* — read against the wisdom-stream''s apocalyptic-register naming of the Davidic-Messianic figure. The Tanakh-anchors of the Davidic-Messianic stream (2 Sam 7:12-16, Isa 11:1-10, Jer 23:5-6, Ezek 34:23-24, Ezek 37:24-25) are canon-anchored and walked in matthew-9.md §5; this thread surfaces the wisdom-stream''s apocalyptic-witness in 4 Ezra (= 2 Esdras 3-14 in the seeded apocrypha edition). 2 Esdras 12:31-34 names the lion-rising-out-of-the-wood vision as the Messiah-anointed-from-the-seed-of-David the Most High has kept against the end of the age; v.34 names his deliver-with-mercy architecture for the remnant pressed-upon-the-borders (the scattered seed). 2 Esdras 7:28 names the Messianic-revelation explicitly (the seeded text''s "Yahusha (Jesus)" naming at this verse is a Christian-era interpolation corrected by this migration to the underlying Syriac''s *the Messiah*). Psalms of Solomon 17 — the classic Davidic-Messianic register of the Pseudepigrapha — is NOT seeded in the V1 `pseudepigrapha` edition; 4 Ezra carries the equivalent architecture in the seeded library.',
       sv.verse_id, ev.verse_id, 'extras', 244
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 27
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- Thread 10 (sort 245): the-animal-apocalypse-shepherds-judged-and-new-house
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-animal-apocalypse-shepherds-judged-and-new-house',
       'The Animal Apocalypse — shepherds judged, new house built, sheep gathered (1 Enoch 90)',
       'Matt 9:36''s *fainted, and were scattered abroad, as sheep having no shepherd* — read against the Animal Apocalypse''s diagnosis-judgment-restoration arc in 1 Enoch 90. The Tanakh-anchors of the *sheep having no shepherd* language (Numbers 27:17, 1 Kings 22:17, Jeremiah 50:6, Ezekiel 34 full, Zechariah 10:2 / 13:7) are canon-anchored and walked in matthew-9.md §7; this thread surfaces the Animal Apocalypse''s direct architecture. 1 Enoch 90:16 names the shepherds-who-had-not-fed-the-sheep judgment explicitly — the false-shepherds of Yashar''el (Israel) cast into the fiery abyss for failing the flock. 1 Enoch 90:17 names the restoration architecture — the Lord of the sheep builds a new house greater than the first and brings all the sheep into it. 1 Enoch 90:18 names the gathering-and-fear-of-the-Lord-of-the-sheep architecture at the end of the arc. Matt 9:36''s present-tense seeing of the scattered multitudes is the Shepherd''s arrival at the moment the gathering 1 Enoch 90 had named begins to be enacted in flesh — the King is the Yechezk''el-34 shepherd AND the Lord of the sheep the Animal Apocalypse had named.',
       sv.verse_id, ev.verse_id, 'extras', 245
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

-- Thread 11 (sort 246): harvest-of-the-age-in-2-baruch
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'harvest-of-the-age-in-2-baruch',
       'The harvest of the age — 2 Baruch 35:1 and the King''s commissioning-setup',
       'Matt 9:37-38''s *the harvest truly is plenteous, but the labourers are few; pray ye therefore the Lord of the harvest, that he will send forth labourers into his harvest* — read against the Hebrew library''s apocalyptic-stream naming of the harvest-of-the-age architecture. The Tanakh-anchors of the harvest-language (Joel 3:13, Isa 27:12, Matt 3:12) are canon-anchored and walked in matthew-9.md §7; this thread surfaces the apocalyptic-stream''s explicit naming of the harvest as the ripening-of-the-age. 2 Baruch 35:1 names the architecture directly: *behold! the days come, and it shall be when the time of the age has ripened, and the harvest of its evil and good seeds has come, that the Mighty One will bring upon...* The harvest in the wisdom-stream''s apocalyptic register is the eschatological-sifting that comes when the time of the age has ripened; the harvest is of evil-and-good-seeds together. Matt 9:37 walks the same architecture at the King''s arrival — the harvest the apocalyptic-stream had named as eschatologically-future is now plenteous and present at the King''s seeing of the multitudes; the Lord of the harvest the apocalyptic-stream had named as the Mighty One is the Father the King at v.38 instructs the disciples to pray to; the labourers being prayed-for are about to be commissioned at Matt 10:1.',
       sv.verse_id, ev.verse_id, 'extras', 246
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 37
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

-- Thread 12 (sort 247): harvest-when-the-number-is-fulfilled-in-4-ezra
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'harvest-when-the-number-is-fulfilled-in-4-ezra',
       'The harvest comes when the number of seeds is fulfilled — 4 Ezra (2 Esdras 4) at Matt 9:37-38',
       'Matt 9:37-38''s *the harvest truly is plenteous, but the labourers are few* — read against the wisdom-stream''s apocalyptic-register naming of the harvest-timing-to-the-fulness-of-the-seed-count. 2 Esdras (4 Ezra) 4:35 names the wisdom-stream''s anticipation: *the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* 2 Esdras 4:36 names the answer Uriel the archangel gives: *even when the number of seeds is filled in you: for he has weighed the world in the balance.* The harvest is timed to the fulness of the seed-count; the labourers being prayed-for at Matt 9:38 are the kingdom-citizens'' participation in the seed-filling. The wisdom-stream named the timing-architecture; the King at Matt 9:38 enlists the disciples in its execution.',
       sv.verse_id, ev.verse_id, 'extras', 247
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 37
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

-- Thread 13 (sort 248): gathering-the-dispersed-with-much-mercy-in-2-baruch
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'gathering-the-dispersed-with-much-mercy-in-2-baruch',
       'Gathering the dispersed with much mercy — 2 Baruch 38 and the sheep without a shepherd',
       'Matt 9:36''s *fainted, and were scattered abroad, as sheep having no shepherd* — read against the Hebrew library''s apocalyptic-stream naming of the gathering-of-the-dispersed architecture. 2 Baruch 38 — the epistle to the nine-and-a-half scattered tribes across the Euphrates — names the architecture: *all we the twelve tribes are bound by one bond, inasmuch as we are born from one father* (38:4), and *with much mercy will gather together again those who were dispersed* (38:7). The framework''s gathering-thesis holds the twelve-tribe-restoration as the load-bearing prophetic substance; 2 Baruch 38:4 and 38:7 are the wisdom-stream''s explicit witnesses to the same architecture. Matt 9:36''s scattered-and-shepherdless multitudes are the same twelve-tribe-bound-by-one-bond body the wisdom-stream had named; the gathering Yahusha (Jesus) sees and Matt 10:5-6 will commission is the gathering of the same one-father-born twelve-tribe-body. The much-mercy register at 2 Baruch 38:7 is the same mercy-substance Hosea 6:6 names at Matt 9:13 — the gathering-of-the-dispersed IS the mercy-architecture of the kingdom-at-hand, not a separate movement from it.',
       sv.verse_id, ev.verse_id, 'extras', 248
  FROM _s138_verse_lookup sv, _s138_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 9 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads (34 thread-members).
-- ---------------------------------------------------------------------

-- Thread 1: mercy-not-sacrifice-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 35:1 — *he that keepeth the law brings offerings enough.* The wisdom-stream''s reframing of sacrifice-substance: keeping the Torah IS bringing offerings enough; the heart-Torah is the offering.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'mercy-not-sacrifice-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 35 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 35:2 — *he that gives alms sacrificeth praise.* Acts of mercy ARE the sacrifice-substance the Tanakh-prophetic stream had been naming; Matt 9:13''s Hosea 6:6 citation walks the same.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'mercy-not-sacrifice-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 35 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 35:3 — *to depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation.* The wisdom-stream''s atonement-substance: turning-from-wickedness IS propitiation; Matt 9:13''s call-to-repentance walks the same.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'mercy-not-sacrifice-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 35 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: alms-as-laid-up-treasure-in-tobit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Tobit 4:7 — *give alms ... and the face of Yahuah (God) shall not be turned away from you.* The wisdom-stream''s alms-with-eye-not-envious architecture; Matt 9:11-13''s Pharisaic indignation is the inverse: envy of the mercy extended to the marginalized in the costume of purity-credential.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'alms-as-laid-up-treasure-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Tobit 4:9 — *you layest up a good treasure for thyself against the day of necessity.* The alms-as-laid-up-treasure architecture; the Sermon''s own *treasures in heaven* (Matt 6:19-20) walks the same; Matt 9:13''s Hosea-6:6 citation locks the diagnostic against the Pharisaic-counterfeit.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'alms-as-laid-up-treasure-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Tobit 4:10 — *alms do deliver from death, and suffers not to come into darkness.* The wisdom-stream''s alms-as-deliverance-architecture; the mercy-substance IS the deliverance-substance.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'alms-as-laid-up-treasure-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Tobit 12:9 — *alms does deliver from death, and shall purge away all sin.* The angel Raphael''s closing instruction names the mercy-substance as the very forgiveness-substance the King exercises at the paralytic''s pronouncement (Matt 9:2) and the Mattityahu (Matthew) table (Matt 9:13).'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'alms-as-laid-up-treasure-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 12 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: publicans-and-sinners-and-sirach-12-inverse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 12:4 — *give to the godly man, and help not a sinner.* The wisdom-stream''s discriminating-mercy stance the Pharisaic-counterfeit-righteousness inherited; Matt 9:10''s King-at-the-table-with-sinners is the direct-reversal.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'publicans-and-sinners-and-sirach-12-inverse'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 12 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 12:5 — *hold back your bread, and give it not to the ungodly.* The wisdom-stream''s explicit instruction the Pharisees at Matt 9:11 are operating under; the King breaks the discriminating-bread-fellowship rule by eating with those Sirach 12 instructed his disciples to hold-back-from.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'publicans-and-sinners-and-sirach-12-inverse'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 12 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 12:7 — *give to the good, and help not the sinner.* The wisdom-stream''s categorical-exclusion the King reverses at Matt 9:13: *not come to call the righteous, but sinners to repentance* is the inverse of the Sirach 12 mandate.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'publicans-and-sinners-and-sirach-12-inverse'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 12 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the-named-son-of-adam-in-enoch-similitudes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 48:2 — *at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Similitudes name the Son of Adam''s pre-existence-and-naming-before-the-Head-of-Days; Matt 9:6''s authority-on-earth is the in-flesh exercise of the eternally-pre-existent figure.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-named-son-of-adam-in-enoch-similitudes'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 6
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 48:3 — *yea, before the sun and the signs were created ... His name was named before Yahuah (God) of Spirits.* The pre-existence is named before creation itself; the in-flesh exercise of the Father''s forgiveness-prerogative at Matt 9:6 is the present-tense demonstration of what the figure had before the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-named-son-of-adam-in-enoch-similitudes'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 6
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 62:7 — *this is the Son of Adam who is born unto righteousness, And righteousness abides over him.* The Son of Adam''s righteousness-abides-eternally architecture; Matt 9:6''s authority to forgive sins is the present-tense exercise of the righteousness that abides over him.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-named-son-of-adam-in-enoch-similitudes'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 6
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: fasting-with-mercy-not-without-in-tobit-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Tobit 12:8 — *prayer is good with fasting and alms and righteousness.* The wisdom-stream''s prayer-fasting-alms-righteousness triad; Matt 9:14''s Pharisaic-fasting-question presupposes the credential-without-the-mercy-triad operative, and the King reframes fasting in the bridegroom-architecture without abolishing it.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'fasting-with-mercy-not-without-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 12 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 34:26 — *the man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer?* The wisdom-stream''s fasting-without-repentance-is-vain diagnostic; Matt 9:15''s bridegroom-reframe and *then shall they fast* affirms fasting reframed in the mercy-substance Sirach 34 implied as precondition.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'fasting-with-mercy-not-without-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 34 AND tv.verse_number = 26
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: new-wine-and-the-old-friend-inverse-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 9:10 — *forsake not an old friend; for the new is not comparable to him.* The wisdom-stream holds the old-vs-new in inverse register to the gospel; the Pharisaic-rabbinic-system''s self-justification rests on the wisdom-stream loyalty. The Torah is NEITHER the wine NOR the wineskin; the rabbinic-old-bottle bursts when the heart-Torah-life enters.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'new-wine-and-the-old-friend-inverse-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 17
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 9 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: physician-prayer-architecture-in-sirach-bypassed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 38:9 — *in your sickness ... pray to Yahuah (God), and he will make you whole.* The wisdom-stream''s prayer-first architecture; the bleeding woman at Matt 9:20 bypasses the prescribed-mediator-chain because the King IS the direct-source the wisdom-stream''s prescription pointed toward.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'physician-prayer-architecture-in-sirach-bypassed'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 38 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 38:12 — *give place to the physician, for Yahuah (God) has created him.* The wisdom-stream''s give-place-to-the-physician prescription; the bleeding woman had given place to physicians for twelve years (Mark 5:26 records the Sirach-38 prescription faithfully followed and failed); the King''s direct-touch at Matt 9:22 makes whole what the physician-chain could not.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'physician-prayer-architecture-in-sirach-bypassed'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 38 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 38:14 — *they shall also pray to Yahuah (God), that he would prosper that, which they give for ease and remedy to prolong life.* The physician''s prosper-the-remedy authority depends on the Most High; at Matt 9:25 the King takes the dead girl''s hand and exercises the prosper-the-remedy authority directly — the Formed-in-flesh IS the source the physician-chain prays to.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'physician-prayer-architecture-in-sirach-bypassed'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 38 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: power-over-life-and-death-in-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 16:13 — *you have power of life and death: you leadest to the gates of hell, and bringest up again.* The wisdom-stream''s direct architecture of the Most High''s power-over-life-and-death; Matt 9:24-25''s raising of Yair (Jairus)''s daughter is the in-flesh exercise of the same authority.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'power-over-life-and-death-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 16 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom of Solomon 16:14 — *a man indeed killeth ... the spirit, when it is gone forth, returns not.* The mortal-man-cannot-bring-back diagnostic; the King at Matt 9:25 brings back the spirit that has gone — confirming the Formed-from-the-Formless framework on the nature of Yahusha (Jesus).'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'power-over-life-and-death-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 16 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 9: the-davidic-messiah-in-4-ezra
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '2 Esdras (4 Ezra) 12:31 — *the lion, whom you sawest rising up out of the wood.* The apocalyptic-stream''s lion-rising-out-of-the-wood vision the angel-interpreter identifies as the Messiah-anointed-from-the-seed-of-David at v.32.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-davidic-messiah-in-4-ezra'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 12 AND tv.verse_number = 31
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '2 Esdras (4 Ezra) 12:32 — *this is the anointed, which the Highest has kept for them ... to the end.* The lion-figure named as the anointed (Messiah / Christ) kept against the end-of-the-age; Matt 9:27''s *Son of David* recognition lands the figure in present-tense.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-davidic-messiah-in-4-ezra'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 12 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '2 Esdras (4 Ezra) 12:34 — *for the rest of my people shall he deliver with mercy, those that have been pressed upon my borders.* The Davidic-Messiah delivers the remnant of the scattered seed with mercy — Hosea 6:6''s mercy-substance + the gathering of Matt 9:36 + the Davidic-Messianic recognition of Matt 9:27 are one architecture.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-davidic-messiah-in-4-ezra'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 12 AND tv.verse_number = 34
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, '2 Esdras (4 Ezra) 7:28 — *for my son the Messiah shall be revealed.* (Seeded text''s "Yahusha (Jesus)" naming at this verse is corrected by this migration to the underlying Syriac''s *the Messiah*.) The wisdom-stream''s apocalyptic-register confirmation of the Davidic-Messianic figure Matt 9:27''s blind men confess.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-davidic-messiah-in-4-ezra'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 7 AND tv.verse_number = 28
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 10: the-animal-apocalypse-shepherds-judged-and-new-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 90:16 — *the shepherds who had not fed the sheep were judged, and cast into the same fiery abyss with the beasts.* The Animal Apocalypse''s shepherds-judged architecture; Matt 9:36''s scattered-shepherdless multitudes have the same diagnostic operative at the King''s arrival.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-animal-apocalypse-shepherds-judged-and-new-house'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 90:17 — *a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house.* The restoration-architecture immediately following the shepherds-judgment; the new-house-substance Yahusha (Jesus) is inaugurating at Matt 9:36.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-animal-apocalypse-shepherds-judged-and-new-house'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 90:18 — *all the beasts and the birds and the wild animals were gathered, and they all feared the Lord of the sheep, and they began to praise Him.* The full-gathering-and-fear-of-the-Lord-of-the-sheep at the end of the restoration-arc; Matt 9:36''s present-tense seeing of the scattered multitudes is the Shepherd''s arrival at the moment the gathering begins to be enacted in flesh.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'the-animal-apocalypse-shepherds-judged-and-new-house'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 11: harvest-of-the-age-in-2-baruch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '2 Baruch 35:1 — *the days come, and it shall be when the time of the age has ripened, and the harvest of its evil and good seeds has come.* The apocalyptic-stream names the harvest of the age explicitly; Matt 9:37''s *the harvest truly is plenteous* names the present-tense fulfillment at the King''s arrival.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'harvest-of-the-age-in-2-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 37
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '2-baruch' AND tv.chapter_number = 35 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '2 Baruch 35:1 (extended) — the same eschatological-harvest-of-the-age verse also anchors Matt 9:38''s *pray ye therefore the Lord of the harvest, that he will send forth labourers.* The Lord-of-the-harvest is the Mighty One the apocalyptic-stream had named; the labourers being prayed-for are about to be commissioned at Matt 10:1.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'harvest-of-the-age-in-2-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 38
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '2-baruch' AND tv.chapter_number = 35 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 12: harvest-when-the-number-is-fulfilled-in-4-ezra
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '2 Esdras (4 Ezra) 4:35 — *the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* The wisdom-stream''s how-long-until-the-harvest question; Matt 9:37 names the answer in present-tense.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'harvest-when-the-number-is-fulfilled-in-4-ezra'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 37
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 4 AND tv.verse_number = 35
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '2 Esdras (4 Ezra) 4:36 — *even when the number of seeds is filled in you: for he has weighed the world in the balance.* The harvest is timed to the fulness of the seed-count; Matt 9:38''s prayer-for-labourers is the kingdom-citizens'' participation in the seed-filling.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'harvest-when-the-number-is-fulfilled-in-4-ezra'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 38
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 4 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 13: gathering-the-dispersed-with-much-mercy-in-2-baruch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '2 Baruch 38:4 — *all we the twelve tribes are bound by one bond, inasmuch as we are born from one father.* The apocalyptic-stream''s twelve-tribes-bound-by-one-bond architecture; the scattered-shepherdless multitudes Yahusha (Jesus) sees at Matt 9:36 are the same one-father-born twelve-tribe-body the wisdom-stream had named.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'gathering-the-dispersed-with-much-mercy-in-2-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '2-baruch' AND tv.chapter_number = 38 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '2 Baruch 38:7 — *with much mercy will gather together again those who were dispersed.* The apocalyptic-stream''s explicit gathering-of-the-dispersed-with-much-mercy architecture; the same mercy-substance Hosea 6:6 names at Matt 9:13, now operative as the gathering-architecture of Matt 9:36''s scattered-shepherdless multitudes.'
  FROM cross_reference_threads t, cross_references x, _s138_verse_lookup sv, _s138_verse_lookup tv
 WHERE t.slug = 'gathering-the-dispersed-with-much-mercy-in-2-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 9 AND sv.verse_number = 36
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '2-baruch' AND tv.chapter_number = 38 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

\echo 'Session 138 — Matt 9 extras-tier cross-references migration complete.'
\echo '  Verse-text fix: 2 Esdras 7:28 Christian-interpolation removed.'
\echo '  New rows: 34 cross_references at tier_required=extras.'
\echo '  New threads: 13 (sort_order 236-248).'
\echo '  New thread members: 34.'
\echo '  Cumulative Matt 1-9 extras: 60 threads, 178 rows, 179 members.'

COMMIT;
