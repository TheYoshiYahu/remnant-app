-- =====================================================================
-- Session 135 — Matt 6 extras-tier cross-references
-- =====================================================================
-- Adds Matt 6's extras-tier rows + threads to the cross-reference
-- corpus. Continues the S131 (Matt 1-2), S132 (Matt 3), S133 (Matt 4),
-- and S134 (Matt 5) extras-tier coverage onto Matt 6, the middle of
-- the Sermon on the Mount.
--
-- The Matt 6 reading-target: the display-vs-secret diagnostic walked
-- across alms, prayer, and fasting (vv.1-4, 5-8, 16-18); the Lord's
-- Prayer (vv.9-13) as kingdom-citizens prayer-pattern with *hallowed
-- be thy name* as Ezekiel 36 gathering-prayer and *thy kingdom come*
-- as the Daniel 7 transfer to the Son of Adam; the forgiveness-economy
-- of vv.14-15 collapsing the institutional-Christian *once saved,
-- always saved* doctrine; the treasures-in-heaven economy of vv.19-21;
-- the *single eye / evil eye* of vv.22-23 as the Tanakh-idiom for
-- generosity / stinginess; the Mammon-or-Elohim binary as Eliyahu's
-- (Elijah's) Carmel-confrontation in the disciple's economic life; the
-- seek-first-the-kingdom manna-trust of vv.25-34. The Hebrew library's
-- extras-tier witness carries the alms-prayer-fasting triad (Tobit 12,
-- Sirach 35), the forgive-thy-neighbour register (Sirach 28), the
-- treasures-laid-up-by-the-open-hand architecture (Tobit 4, Sirach 29),
-- the singleness-of-heart register of the patriarch's testimony
-- (Testament of Issachar) and the wicked-eye / good-eye register of
-- the wisdom-stream (Sirach 14, Sirach 35), the riches-as-snare
-- diagnostic (Sirach 31), the righteous-in-the-Father's-hand promise
-- (Wisdom 5, Sirach 11), and the holy-and-eternal-name + throne-of-
-- glory prayer-architecture of the Enochic prayers (1 Enoch 9, 1 Enoch
-- 84) — the same architecture the Lord's Prayer opens with.
--
-- Editions used at S135: 1 Enoch (`enoch`), Apocrypha KJV 1611
-- (`apocrypha` — Tobit, Wisdom of Solomon, Ecclesiasticus / Sirach),
-- Pseudepigrapha Charles vol 2 (`pseudepigrapha` — Testaments of the
-- XII Patriarchs). The full view filter retains every scripture-level
-- extras edition seeded for V1 for forward compatibility (Jubilees,
-- Jasher, Apocrypha Charles vol 1, Adam-Eve Conflict, Apocalypse of
-- Abraham, Sonnini Acts 29, Ascension of Isaiah) — these are not
-- targeted in S135 because the Matt 6 reading does not surface a
-- framework-bearing connection from those editions at the rigour the
-- migration requires. Historical-witness editions (Josephus, M.R.
-- James's apocryphal NT, Lightfoot's Apostolic Fathers) remain
-- deferred from V1 cross-refs per the historical-witness one-way rule.
--
-- Brief scope notes: The Ezekiel 36:23-24 anchor for *hallowed be thy
-- name* as gathering-prayer and the Daniel 7:13-14 anchor for *thy
-- kingdom come* as the Son-of-Adam kingdom-transfer are canon-anchored
-- and walked in the free.md and matthew-6.md commentaries; the extras-
-- tier add at vv.9-10 is the holy-and-eternal-name + throne-of-glory
-- prayer-architecture of the Enochic prayers (1 Enoch 9:4, 84:2-3),
-- which the gospel's Lord's Prayer opening walks in the same register.
-- The conditional-forgiveness of vv.14-15 reads against Matt 18:32-35
-- and Matt 7:21-23 at the canon-internal level — walked in the short-
-- form commentary — and against the Tanakh's Ezekiel 33:12-13 + Ex
-- 32:33 + Ps 69:28 names-blotted-out architecture in the long-form
-- commentary; the extras-tier add at v.12 is the Sirach 28 forgive-
-- thy-neighbour register that names the conditional in the wisdom-
-- stream's own register. The Testament of Issachar's *singleness of
-- heart* material (DB ch 41 v.8) is the cleanest patriarch-testimony
-- parallel to the *single eye* idiom; the source-text's classic
-- *walking in singleness of eye* phrase is woven through chs 40-43,
-- but the parsed-edition verse-boundary lands the strongest single-
-- verse anchor at DB ch 41 v.8.
--
-- Seven new PROPOSED threads at extras-tier:
--   1. `alms-prayer-fasting-as-triad-in-tobit-and-sirach`           (sort 217)
--   2. `forgive-thy-neighbour-as-sirach-and-the-lords-prayer`       (sort 218)
--   3. `treasures-laid-up-by-the-open-hand-in-tobit-and-sirach`     (sort 219)
--   4. `the-single-eye-of-issachar-and-the-evil-eye-of-sirach`      (sort 220)
--   5. `riches-as-snare-and-stumblingblock-in-sirach`               (sort 221)
--   6. `the-righteous-in-the-fathers-hand-in-wisdom`                (sort 222)
--   7. `thy-name-and-thy-throne-in-the-enochic-prayers`             (sort 223)
--
-- 24 new cross_references rows, all at tier_required='extras'.
-- Every member-note passes the 12 Red Lines and the 12-point editorial
-- checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 135 — Matt 6 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view. Same edition filter as S131-S134 — every
-- scripture-level extras edition seeded for V1, plus canon.
CREATE TEMP VIEW _s135_verse_lookup AS
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
-- Insert 24 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: alms-prayer-fasting-as-triad-in-tobit-and-sirach
  ('canon', 'matthew', 6, 1, 'apocrypha', 'tobit', 12, 8,
   '*Prayer is good with fasting and alms and righteousness. A little with righteousness is better than much with unrighteousness. It is better to give alms than to lay up gold.* Tobit 12:8 names the prayer-fasting-alms triad explicitly in the Hebrew library — the same three Tanakh-substantial practices Matt 6:1-18 walks the display-vs-secret diagnostic across. The architecture of the triad is not a New Testament innovation; the angel Raphael names it as a single righteous-life register at the close of Tobit''s narrative, and the Sermon walks the same three at the motive-level.'),
  ('canon', 'matthew', 6, 4, 'apocrypha', 'ecclesiasticus', 35, 6,
   '*The offering of the righteous makes the altar fat, and the sweet savour thereof is before the Most High.* Sirach (Ecclesiasticus) 35:6 names the architecture of the righteous-offering-accepted-by-the-Most-High that Matt 6:4''s *thy Father which seeth in secret himself shall reward thee openly* walks at the heart-level. The Hebrew library names the offering itself; the gospel names the heart-form of the offering: the secret-act of the kingdom-citizen reaches the same Most High the wisdom-stream named as receiving the offering of the righteous.'),
  ('canon', 'matthew', 6, 4, 'apocrypha', 'ecclesiasticus', 35, 7,
   '*The sacrifice of a just man is acceptable, and the memorial thereof shall never be forgotten.* Sirach 35:7 names the *memorial shall never be forgotten* register the Father''s reward-economy at Matt 6:4 carries. The Pharisaic-counterfeit form trades the eternal memorial for the brief currency of being-seen-of-men; the kingdom-citizens form lays up what the Most High does not forget. The Hebrew library names the architecture the gospel walks.'),

  -- Thread 2: forgive-thy-neighbour-as-sirach-and-the-lords-prayer
  ('canon', 'matthew', 6, 12, 'apocrypha', 'ecclesiasticus', 28, 2,
   '*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* Sirach (Ecclesiasticus) 28:2 names the conditional-forgiveness architecture explicitly in the wisdom-stream — the receiving of pardon from the Most High presupposes the extending of pardon to the neighbour, named in the same act of praying. This is the direct architectural parallel to Matt 6:12''s *forgive us our debts, as we forgive our debtors.* The Hebrew library was already teaching the kingdom-citizens prayer-pattern at the verse-level; the Lord''s Prayer walks the same architecture.'),
  ('canon', 'matthew', 6, 14, 'apocrypha', 'ecclesiasticus', 28, 3,
   '*One man bears hatred against another, and does he seek pardon from Yahuah (God)?* Sirach 28:3 names the diagnostic in question-form — the hatred-bearer cannot rightly seek the Father''s pardon. Matt 6:14''s *if ye forgive men their trespasses, your heavenly Father will also forgive you* walks the same architecture in proposition-form: the receiving of forgiveness from the Father presupposes the extending of forgiveness to the brother. The Hebrew library carries the diagnostic; the gospel binds it as kingdom-citizens grammar.'),
  ('canon', 'matthew', 6, 15, 'apocrypha', 'ecclesiasticus', 28, 4,
   '*He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* Sirach 28:4 lands the diagnostic at the heart-level — the brother-who-is-like-thee is the test of the heart that asks the Father''s mercy. Matt 6:15''s *if ye forgive not men their trespasses, neither will your Father forgive your trespasses* walks the same Hebrew library architecture: the unforgiving heart cannot rightly ask the forgiveness it withholds. The wisdom-stream had already named the condition the Lord''s Prayer formalizes.'),

  -- Thread 3: treasures-laid-up-by-the-open-hand-in-tobit-and-sirach
  ('canon', 'matthew', 6, 20, 'apocrypha', 'tobit', 4, 9,
   '*For you layest up a good treasure for thyself against the day of necessity.* Tobit 4:9 names the architecture Matt 6:20 walks directly: *but lay up for yourselves treasures in heaven.* The Hebrew library''s phrasing is the precise gospel-architecture in the gospel''s own grammar — *lay up treasure against the day.* Tobias gives alms now; the treasure laid up is what stands when the day of necessity comes. The gospel walks the same architecture at the kingdom-citizens level.'),
  ('canon', 'matthew', 6, 20, 'apocrypha', 'tobit', 4, 10,
   '*Because that alms do deliver from death, and suffers not to come into darkness.* Tobit 4:10 names the alms-as-deliverer-from-death architecture — the treasure laid up by the open hand protects the giver at the day of necessity. Matt 6:20''s *treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal* walks the same protection-against-loss architecture at the heavenly-treasure level. The Hebrew library names the deliverance the open hand purchases; the gospel names the corruption-proof storehouse the open hand fills.'),
  ('canon', 'matthew', 6, 20, 'apocrypha', 'ecclesiasticus', 29, 11,
   '*Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* Sirach (Ecclesiasticus) 29:11 names the *lay up your treasure* architecture explicitly with the commandment-keeping the gospel''s kingdom-citizens righteousness presupposes. Matt 6:20''s *lay up for yourselves treasures in heaven* is the gospel-form of the wisdom-stream''s same teaching: the treasure laid up by the open hand of the commandment-keeper is the heavenly-treasure the gospel names.'),
  ('canon', 'matthew', 6, 20, 'apocrypha', 'ecclesiasticus', 29, 12,
   '*Shut up alms in your storehouses: and it shall deliver you from all affliction.* Sirach 29:12 names the storehouse-of-alms architecture — the treasure laid up against affliction. The Hebrew library uses the same *storehouse* image the gospel uses at *treasures in heaven.* Matt 6:20 walks the same Hebrew library architecture: the kingdom-citizen who lays up alms in the heavenly storehouse is delivered from the loss the earthly storehouse cannot protect against.'),

  -- Thread 4: the-single-eye-of-issachar-and-the-evil-eye-of-sirach
  ('canon', 'matthew', 6, 22, 'pseudepigrapha', 'testaments-xii', 41, 8,
   '*Elohim (God) aided my singleness. For on all the poor and oppressed I bestowed the good things of the earth in the singleness of my heart.* Testament of Issachar (DB ch 41 v.8) names the singleness-of-heart architecture in the patriarch''s own testimony to his sons — singleness as the open-handed bestowal of the good things of the earth on the poor and oppressed. Matt 6:22''s *if therefore thine eye be single, thy whole body shall be full of light* walks the same Hebrew library architecture at the antithesis-restoration level. The single eye is the open hand; the singleness of the patriarch''s testimony is the heart-pattern the gospel names.'),
  ('canon', 'matthew', 6, 22, 'apocrypha', 'ecclesiasticus', 35, 8,
   '*Give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands.* Sirach (Ecclesiasticus) 35:8 names the *good eye* in giving — the wisdom-stream''s direct linguistic anchor for the gospel''s *single eye* idiom. The Hebrew *tov-ayin* (good of eye) is rendered into Greek and into English along the architecture the gospel walks: give with a *good eye,* not stinted, not held-back. Matt 6:22''s *single eye* full of light is the gospel-grammar form of the wisdom-stream''s *good eye* in giving.'),
  ('canon', 'matthew', 6, 23, 'apocrypha', 'ecclesiasticus', 14, 8,
   '*The envious man has a wicked eye; he turns away his face, and despiseth men.* Sirach 14:8 names the *wicked eye* of envy as the Hebrew library''s parallel to Matt 6:23''s *evil eye.* The wisdom-stream identifies the wicked-eye not as a generic spiritual-vision metaphor but as the envious/stingy heart that turns its face away and despiseth — the closed hand. Matt 6:23 walks the same Hebrew-idiom architecture.'),
  ('canon', 'matthew', 6, 23, 'apocrypha', 'ecclesiasticus', 14, 9,
   '*A covetous man''s eye is not satisfied with his portion; and the iniquity of the wicked drieth up his soul.* Sirach 14:9 names the covetous-eye-is-not-satisfied architecture — the grasping heart that never has enough is the same heart the gospel names at Matt 6:23. The *whole body full of darkness* of the evil-eye reader is the *iniquity that drieth up the soul* of the wisdom-stream reader. The Hebrew library has been naming the diagnostic for centuries; the gospel walks the same diagnostic.'),
  ('canon', 'matthew', 6, 23, 'apocrypha', 'ecclesiasticus', 14, 10,
   '*A wicked eye envies his bread, and he is a niggard at his table.* Sirach 14:10 names the wicked-eye-at-the-table architecture — the host who serves bread while begrudging it; the food eaten is unblessed because the heart is closed. Matt 6:23''s *if therefore the light that is in thee be darkness, how great is that darkness!* walks the same intensity-of-the-darkness diagnostic the Hebrew library names: the closed-heart host''s whole hospitality is darkness, no matter how much bread crosses the table.'),

  -- Thread 5: riches-as-snare-and-stumblingblock-in-sirach
  ('canon', 'matthew', 6, 24, 'apocrypha', 'ecclesiasticus', 31, 5,
   '*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* Sirach (Ecclesiasticus) 31:5 names the architecture of gold-love-disqualifies-from-justification — the Hebrew library''s direct anti-Mammon teaching. Matt 6:24''s *ye cannot serve Elohim (God) and mammon* walks the same architecture at the kingdom-citizens level: the gold-lover cannot stand justified before the Father whose service is whole-heart.'),
  ('canon', 'matthew', 6, 24, 'apocrypha', 'ecclesiasticus', 31, 6,
   '*Gold has been the ruin of many, and their destruction was present.* Sirach 31:6 names the gold-as-ruin diagnostic the wisdom-stream carried. Matt 6:24''s forced-choice between Yahuah (God) and Mammon is the present-age form of the same wisdom: the disciple who chooses Mammon walks toward the same ruin the wisdom-stream had been naming.'),
  ('canon', 'matthew', 6, 24, 'apocrypha', 'ecclesiasticus', 31, 7,
   '*It is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Sirach 31:7 names gold-as-stumblingblock-for-those-who-sacrifice-to-it — the wisdom-stream''s direct identification of wealth as an object of worship that captures its devotees. Matt 6:24 walks the same architecture at the Mammon-or-Elohim binary: Mammon is treated as a competing master because the gold-sacrificers of the wisdom-stream had already named it as a master that takes its devotees.'),

  -- Thread 6: the-righteous-in-the-fathers-hand-in-wisdom
  ('canon', 'matthew', 6, 26, 'apocrypha', 'the-wisdom-of-solomon', 5, 15,
   '*But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* Wisdom of Solomon 5:15 names the care-of-the-righteous-is-with-the-Most-High architecture the take-no-thought teaching of Matt 6:25-26 grounds itself in. The Hebrew library names the Father''s standing care for the righteous; the gospel names the practice that follows from that care: the kingdom-citizens do not anxiously grasp because the Most High''s care is already with them.'),
  ('canon', 'matthew', 6, 33, 'apocrypha', 'the-wisdom-of-solomon', 5, 16,
   '*Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* Wisdom 5:16 names the glorious-kingdom-from-the-Father''s-hand architecture and the right-hand-covering / arm-protecting protection-economy of the righteous. Matt 6:33''s *seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* walks the same architecture: the kingdom received from the Father''s hand carries the daily-provision the seeker does not have to grasp for.'),
  ('canon', 'matthew', 6, 33, 'apocrypha', 'ecclesiasticus', 11, 14,
   '*Prosperity and adversity, life and death, poverty and riches, come of Yahuah (God).* Sirach (Ecclesiasticus) 11:14 names the all-comes-of-Yahuah architecture the daily-provision trust of the seek-first teaching presupposes. Matt 6:33''s *all these things shall be added unto you* walks the same Hebrew library architecture: the Father is the source of both prosperity and adversity; the kingdom-citizens orientation toward the kingdom carries through both because the Father administers both.'),

  -- Thread 7: thy-name-and-thy-throne-in-the-enochic-prayers
  ('canon', 'matthew', 6, 9, 'enoch', '1-enoch', 9, 4,
   '*Yahuah (Lord) of lords, Elohim (God) of elohiym, King of kings, and Elohim (God) of the ages, the throne of Thy glory standeth unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages!* 1 Enoch 9:4 names the holy-name + throne-of-glory + king-of-kings architecture in the angelic prayer-form. Matt 6:9-10''s *Our Father which art in heaven, Hallowed be thy name. Thy kingdom come* walks the same Hebrew library prayer-architecture at the kingdom-citizens level: the holy and blessed Name, the eternal throne of glory, the King of kings whose kingdom the citizens pray come.'),
  ('canon', 'matthew', 6, 9, 'enoch', '1-enoch', 84, 2,
   '*Blessed be Thou, O Yahuah (God), King, Great and mighty in Thy greatness, Elyon in Thy dominion, And Thy throne is for ever and ever, And Thy name is holy and great for ever and ever, And blessed be Thou for ever.* 1 Enoch 84:2 carries Enoch''s own prayer in the same architecture: blessed-be-the-King-whose-throne-is-forever, whose Name is holy. Matt 6:9''s *hallowed be thy name* is the gospel-form of the same Hebrew library prayer the patriarch already prayed.'),
  ('canon', 'matthew', 6, 10, 'enoch', '1-enoch', 84, 3,
   '*Thou hast made all things, And Thou hast power over all things: And all things are naked and open in Thy sight, And Thou seest all things, And nothing can hide itself from Thee.* 1 Enoch 84:3 names the *Thou hast made all things, And Thou hast power over all things* architecture — kingdom-and-power-as-the-Father''s pattern. Matt 6:10''s *thy kingdom come, thy will be done in earth, as it is in heaven* walks the same architecture: the Father who has made all things and has power over all things is the one whose kingdom the citizens pray to see consummated and whose will they pray to see done in earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s135_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s135_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 7 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'alms-prayer-fasting-as-triad-in-tobit-and-sirach',
       'The alms-prayer-fasting triad in Tobit and the offering of the righteous in Sirach',
       'Matt 6:1-18 walks the display-vs-secret diagnostic across three Tanakh-substantial practices — alms (vv.1-4), prayer (vv.5-8), fasting (vv.16-18) — corrected at the motive-level, not at the practice-level. Tobit 12:8 names the three explicitly as a single righteous-life register in the Hebrew library: *prayer is good with fasting and alms and righteousness.* The angel Raphael''s closing word to Tobias names the triad as the architecture of the righteous-walk before the chapter ever opens. Sirach (Ecclesiasticus) 35:6-7 names the offering-of-the-righteous-accepted-by-the-Most-High architecture the Matt 6:4 reward-economy walks: *the offering of the righteous makes the altar fat, and the sweet savour thereof is before the Most High ... the sacrifice of a just man is acceptable, and the memorial thereof shall never be forgotten.* The Pharisaic-counterfeit form trades the eternal memorial for the brief currency of being-seen-of-men; the kingdom-citizens form lays up what the Most High does not forget. The Hebrew library names the architecture; the gospel walks the heart-form.',
       sv.verse_id, ev.verse_id, 'extras', 217
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'forgive-thy-neighbour-as-sirach-and-the-lords-prayer',
       'Forgive thy neighbour the hurt — Sirach and the Lord''s Prayer',
       'Matt 6:12''s *forgive us our debts, as we forgive our debtors* and the conditional-forgiveness lock at vv.14-15 — *if ye forgive not men their trespasses, neither will your Father forgive your trespasses* — read against the Hebrew library''s wisdom-stream forgive-thy-neighbour register. Sirach (Ecclesiasticus) 28:2 names the conditional explicitly: *forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* Sirach 28:3 carries the diagnostic in question-form: *one man bears hatred against another, and does he seek pardon from Yahuah (God)?* Sirach 28:4 lands it at the heart-of-mercy level: *he sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* The Hebrew library had already named the conditional the Lord''s Prayer formalizes; the gospel walks the same architecture at the kingdom-citizens level. The conditional is not a New Testament innovation; it is the wisdom-stream the Lord''s Prayer inherits.',
       sv.verse_id, ev.verse_id, 'extras', 218
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 12
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'treasures-laid-up-by-the-open-hand-in-tobit-and-sirach',
       'Treasures laid up by the open hand in Tobit and Sirach',
       'Matt 6:19-21''s treasures-in-heaven teaching — *lay not up for yourselves treasures upon earth ... but lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal* — walks an architecture the Hebrew library had already named at the verse-level. Tobit 4:9 names the laid-up-treasure-against-the-day-of-necessity teaching directly: *for you layest up a good treasure for thyself against the day of necessity.* Tobit 4:10 names the protection-economy: *alms do deliver from death, and suffers not to come into darkness.* Sirach (Ecclesiasticus) 29:11 names the lay-up-treasure-by-the-commandments architecture: *lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* Sirach 29:12 names the storehouse-of-alms protection: *shut up alms in your storehouses: and it shall deliver you from all affliction.* The Hebrew library uses the same *lay up* and *storehouse* images the gospel walks; the gospel names the corruption-proof storehouse the open hand fills.',
       sv.verse_id, ev.verse_id, 'extras', 219
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-single-eye-of-issachar-and-the-evil-eye-of-sirach',
       'The single eye of Issachar and the evil eye of Sirach',
       'Matt 6:22-23''s *single eye / evil eye* contrast walks the Hebrew library''s good-eye = generosity / evil-eye = stinginess idiom the wisdom-stream and the patriarch-testimony had already carried. Testament of Issachar (DB ch 41 v.8) names the singleness-of-heart architecture in the patriarch''s own testimony: *Elohim (God) aided my singleness. For on all the poor and oppressed I bestowed the good things of the earth in the singleness of my heart.* The singleness is the open-handed bestowal on the poor and oppressed — the same architecture the gospel names. Sirach (Ecclesiasticus) 35:8 names the *good eye* in giving directly: *give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands.* Sirach 14:8-10 names the wicked-eye / covetous-eye architecture: *the envious man has a wicked eye; he turns away his face, and despiseth men. A covetous man''s eye is not satisfied with his portion ... a wicked eye envies his bread, and he is a niggard at his table.* The wisdom-stream identifies the wicked-eye not as a generic spiritual-vision metaphor but as the envious / stingy heart that turns away, withholds, and serves bread while begrudging it. The gospel''s *single eye* full of light and *evil eye* full of darkness walks the same Hebrew library idiom.',
       sv.verse_id, ev.verse_id, 'extras', 220
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 22
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'riches-as-snare-and-stumblingblock-in-sirach',
       'Riches as snare and stumblingblock in Sirach',
       'Matt 6:24''s *ye cannot serve Elohim (God) and mammon* binary walks an architecture the Hebrew library''s wisdom-stream had already named at the gold-as-snare level. Sirach (Ecclesiasticus) 31:5 names the disqualification directly: *he that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* Sirach 31:6 names the gold-as-ruin diagnostic: *gold has been the ruin of many, and their destruction was present.* Sirach 31:7 names the gold-as-stumblingblock-for-those-who-sacrifice-to-it architecture: *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* The wisdom-stream identifies wealth as an object of worship that captures its devotees; the gospel names the same architecture at the kingdom-citizens forced-choice level. Mammon is treated as a competing master at Matt 6:24 because the wisdom-stream had already named gold as the master that takes those who sacrifice to it.',
       sv.verse_id, ev.verse_id, 'extras', 221
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-righteous-in-the-fathers-hand-in-wisdom',
       'The righteous in the Father''s hand — Wisdom of Solomon and Sirach',
       'Matt 6:25-34''s take-no-thought / seek-first-the-kingdom teaching grounds the kingdom-citizens trust-economy in the Father''s standing care for the righteous. The Hebrew library''s Wisdom of Solomon and Sirach (Ecclesiasticus) name the architecture directly. Wisdom 5:15 names the care-of-the-righteous-is-with-the-Most-High register: *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* Wisdom 5:16 names the glorious-kingdom-from-the-Father''s-hand + right-hand-covering protection-economy: *therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* Sirach 11:14 names the all-comes-of-Yahuah architecture: *prosperity and adversity, life and death, poverty and riches, come of Yahuah (God).* The Father is the source of both prosperity and adversity; the kingdom-citizens orientation carries through both because the Father administers both. The gospel''s seek-first teaching walks the same Hebrew library architecture: the kingdom received from the Father''s hand carries the daily-provision the seeker does not have to anxiously grasp for.',
       sv.verse_id, ev.verse_id, 'extras', 222
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 25
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'thy-name-and-thy-throne-in-the-enochic-prayers',
       'Thy name and thy throne in the Enochic prayers',
       'Matt 6:9-10''s opening of the Lord''s Prayer — *Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done in earth, as it is in heaven* — walks the holy-and-eternal-name + throne-of-glory + kingdom-and-power architecture the Hebrew library''s Enochic prayers already carry. 1 Enoch 9:4 names the architecture in the angelic prayer-form: *Yahuah (Lord) of lords, Elohim (God) of elohiym, King of kings, and Elohim (God) of the ages, the throne of Thy glory standeth unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages.* 1 Enoch 84:2 carries Enoch''s own prayer at the same architecture: *Blessed be Thou, O Yahuah (God), King ... And Thy throne is for ever and ever, And Thy name is holy and great for ever and ever.* 1 Enoch 84:3 names the kingdom-and-power register: *Thou hast made all things, And Thou hast power over all things: And all things are naked and open in Thy sight.* The Hebrew library''s prayer-architecture is the architecture the Lord''s Prayer walks — the same holy Name, the same eternal throne of glory, the same King of kings whose kingdom the citizens pray come and whose will they pray see done in earth. The Ezekiel 36 gathering-prayer (canon) and the Daniel 7 kingdom-transfer to the Son of Adam (canon) hold the gospel-architecture''s scriptural anchors; the Enochic prayers carry the same architecture in the wisdom of Enoch the righteous, prayed before the patriarchs in the early chapters of the world.',
       sv.verse_id, ev.verse_id, 'extras', 223
  FROM _s135_verse_lookup sv, _s135_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 9
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 6 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: alms-prayer-fasting-as-triad-in-tobit-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Tobit 12:8 — *prayer is good with fasting and alms and righteousness.* The Hebrew library names the triad explicitly as a single righteous-life register; Matt 6:1-18 walks the same three at the motive-level.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'alms-prayer-fasting-as-triad-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 12 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach (Ecclesiasticus) 35:6 — *the offering of the righteous makes the altar fat, and the sweet savour thereof is before the Most High.* The Most-High-receives-the-offering-of-the-righteous register; Matt 6:4''s *thy Father which seeth in secret* walks the same architecture at the heart-form.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'alms-prayer-fasting-as-triad-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 4
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 35 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 35:7 — *the sacrifice of a just man is acceptable, and the memorial thereof shall never be forgotten.* The eternal-memorial register; Matt 6:4''s Father-reward-economy walks the same architecture against the Pharisaic-counterfeit trade for being-seen-of-men.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'alms-prayer-fasting-as-triad-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 4
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 35 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: forgive-thy-neighbour-as-sirach-and-the-lords-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 28:2 — *forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* The Hebrew library''s explicit conditional-forgiveness in the wisdom-stream; Matt 6:12''s *forgive us our debts, as we forgive our debtors* walks the same architecture in the Lord''s Prayer.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'forgive-thy-neighbour-as-sirach-and-the-lords-prayer'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 12
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 28 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 28:3 — *one man bears hatred against another, and does he seek pardon from Yahuah (God)?* The diagnostic in question-form; Matt 6:14''s *if ye forgive men their trespasses* walks the same architecture in proposition-form.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'forgive-thy-neighbour-as-sirach-and-the-lords-prayer'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 28 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 28:4 — *he sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* The heart-of-mercy diagnostic; Matt 6:15''s *if ye forgive not men their trespasses, neither will your Father forgive your trespasses* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'forgive-thy-neighbour-as-sirach-and-the-lords-prayer'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 28 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: treasures-laid-up-by-the-open-hand-in-tobit-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Tobit 4:9 — *for you layest up a good treasure for thyself against the day of necessity.* The Hebrew library''s precise *lay up treasure* phrasing; Matt 6:20''s *lay up for yourselves treasures in heaven* walks the same architecture directly.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'treasures-laid-up-by-the-open-hand-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Tobit 4:10 — *alms do deliver from death, and suffers not to come into darkness.* The protection-economy of the open hand; Matt 6:20''s corruption-proof storehouse walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'treasures-laid-up-by-the-open-hand-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 29:11 — *lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* The lay-up-treasure-by-the-commandments architecture; Matt 6:20 walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'treasures-laid-up-by-the-open-hand-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 29 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Sirach 29:12 — *shut up alms in your storehouses: and it shall deliver you from all affliction.* The Hebrew library''s direct *storehouse* image; Matt 6:20 walks the same storehouse-of-treasure architecture at the heavenly-treasure level.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'treasures-laid-up-by-the-open-hand-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 29 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the-single-eye-of-issachar-and-the-evil-eye-of-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Testament of Issachar (DB ch 41 v.8) — *Elohim (God) aided my singleness. For on all the poor and oppressed I bestowed the good things of the earth in the singleness of my heart.* The patriarch''s own testimony to the singleness-as-open-handed-bestowal architecture; Matt 6:22''s *single eye full of light* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-single-eye-of-issachar-and-the-evil-eye-of-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 22
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 41 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 35:8 — *give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands.* The wisdom-stream''s direct *good eye* in giving — the Hebrew *tov-ayin* idiom the gospel walks.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-single-eye-of-issachar-and-the-evil-eye-of-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 35 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 14:8 — *the envious man has a wicked eye; he turns away his face, and despiseth men.* The Hebrew library''s direct *wicked eye* = envious / stingy idiom; Matt 6:23''s *evil eye* walks the same Hebrew-idiom architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-single-eye-of-issachar-and-the-evil-eye-of-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 14 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Sirach 14:9 — *a covetous man''s eye is not satisfied with his portion; and the iniquity of the wicked drieth up his soul.* The grasping-heart diagnostic; Matt 6:23''s *whole body full of darkness* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-single-eye-of-issachar-and-the-evil-eye-of-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 14 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, 'Sirach 14:10 — *a wicked eye envies his bread, and he is a niggard at his table.* The wicked-eye-at-the-table architecture — closed-heart hospitality; Matt 6:23''s *how great is that darkness!* names the intensity of the same diagnostic.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-single-eye-of-issachar-and-the-evil-eye-of-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 14 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: riches-as-snare-and-stumblingblock-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 31:5 — *he that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* The Hebrew library''s direct gold-love-disqualifies architecture; Matt 6:24''s *ye cannot serve Elohim (God) and mammon* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'riches-as-snare-and-stumblingblock-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 31:6 — *gold has been the ruin of many, and their destruction was present.* The gold-as-ruin diagnostic; Matt 6:24''s forced-choice walks the same wisdom into the kingdom-citizens grammar.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'riches-as-snare-and-stumblingblock-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 31:7 — *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Gold as the master that takes those who sacrifice to it — the architectural-parallel to Mammon-as-master at Matt 6:24.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'riches-as-snare-and-stumblingblock-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: the-righteous-in-the-fathers-hand-in-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 5:15 — *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* The care-of-the-righteous-is-with-the-Most-High register the take-no-thought teaching grounds itself in.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-righteous-in-the-fathers-hand-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 5 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 5:16 — *they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* The glorious-kingdom-from-the-Father''s-hand + right-hand-covering architecture; Matt 6:33''s *seek ye first the kingdom of Elohim (God), and his righteousness* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-righteous-in-the-fathers-hand-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 5 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 11:14 — *prosperity and adversity, life and death, poverty and riches, come of Yahuah (God).* The all-comes-of-Yahuah architecture; Matt 6:33''s *all these things shall be added unto you* walks the same source-of-all teaching.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'the-righteous-in-the-fathers-hand-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 11 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: thy-name-and-thy-throne-in-the-enochic-prayers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 9:4 — *Yahuah (Lord) of lords, Elohim (God) of elohiym, King of kings ... the throne of Thy glory standeth unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages.* The Hebrew library''s angelic prayer-form; Matt 6:9''s *hallowed be thy name* and 6:10''s *thy kingdom come* walk the same prayer-architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'thy-name-and-thy-throne-in-the-enochic-prayers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 9
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 9 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 84:2 — *Blessed be Thou, O Yahuah (God), King ... And Thy throne is for ever and ever, And Thy name is holy and great for ever and ever.* Enoch''s own prayer at the same architecture; Matt 6:9''s *hallowed be thy name* walks the same holy-Name + eternal-throne register.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'thy-name-and-thy-throne-in-the-enochic-prayers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 9
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 84 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 84:3 — *Thou hast made all things, And Thou hast power over all things ... And nothing can hide itself from Thee.* The kingdom-and-power register; Matt 6:10''s *thy kingdom come, thy will be done in earth, as it is in heaven* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s135_verse_lookup sv, _s135_verse_lookup tv
 WHERE t.slug = 'thy-name-and-thy-throne-in-the-enochic-prayers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 6 AND sv.verse_number = 10
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 84 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s135_verse_lookup;

\echo 'Session 135 migration complete. Verifying row counts...'

SELECT
    (SELECT count(*) FROM cross_references x WHERE x.tier_required = 'extras') AS extras_xref_rows_total,
    (SELECT count(*) FROM cross_reference_threads t WHERE t.tier_required = 'extras') AS extras_threads_total,
    (SELECT count(*) FROM cross_reference_thread_members m
       JOIN cross_reference_threads t ON t.id = m.thread_id
      WHERE t.tier_required = 'extras') AS extras_members_total;

-- Per-thread member counts for S135's new threads
SELECT t.slug, count(m.*) AS member_count
  FROM cross_reference_threads t
  LEFT JOIN cross_reference_thread_members m ON m.thread_id = t.id
 WHERE t.slug IN (
       'alms-prayer-fasting-as-triad-in-tobit-and-sirach',
       'forgive-thy-neighbour-as-sirach-and-the-lords-prayer',
       'treasures-laid-up-by-the-open-hand-in-tobit-and-sirach',
       'the-single-eye-of-issachar-and-the-evil-eye-of-sirach',
       'riches-as-snare-and-stumblingblock-in-sirach',
       'the-righteous-in-the-fathers-hand-in-wisdom',
       'thy-name-and-thy-throne-in-the-enochic-prayers'
   )
 GROUP BY t.slug
 ORDER BY t.slug;

COMMIT;

\echo 'Session 135 — Matt 6 extras-tier cross-references migration done.'
