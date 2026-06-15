-- ----- fragment: minion_1peter_05.sql (S240 1 Peter 5) -----
-- =====================================================================
-- S240 minion — 1 PETER 5 (Kepha Aleph 5) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 Peter 5 (14 verses) — the chief Shepherd / grace to the humble / the roaring lion.
-- Tag: p240c5 (temp view _s240_p240c5_lookup).
-- Sort band: floor 9720, step 3 (9720, 9723, 9726, 9729, 9732, 9735 used; under 9750).
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the scattered elect — the dispersed two-house remnant,
-- holiness in suffering, the Torah in force and honored; NOT a church replacing Yashar'el (Israel),
-- NOT a law-vs-grace antithesis). Chapter 5 closes the letter with the under-shepherds charged to
-- *feed the flock of Elohim (God)* — the very charge Yahuah (LORD) laid against the false shepherds
-- of Yashar'el (Israel) in Ezekiel 34, where He Himself comes to seek the scattered sheep and sets
-- over them *one shepherd... my servant David.* Peter names that One *the chief Shepherd* who shall
-- appear (5:4). The chapter's keystone is 5:5 — *Elohim (God) resisteth the proud, and giveth grace
-- to the humble* — Proverbs 3:34 quoted as binding scripture, the very verse James 4:6 quotes (the
-- twin). The humbling under the mighty hand (Job 22:29 / Matthew 23:12), the casting of all care
-- (Psalm 55:22), and the adversary as a roaring lion (Job 1:7 / Psalm 22:13) all rest on Tanakh
-- roots. Christology kept exact: *the Elohim (God) of all grace, who hath called us unto his eternal
-- glory by HaMashiach Yahusha (Christ Jesus)* (5:10) — the Father the source and caller, the Son the
-- one through whom; no co-equal-persons grammar, no modalist collapse.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   feed the flock of Elohim, taking the oversight, not as lords but ensamples
--           Tanakh: Ezekiel 34:2 (the shepherds that feed themselves), 34:4 (the lost not sought),
--                   34:10 (I am against the shepherds), 34:15-16 (I will feed my flock)
--           Extras: none warranted   NT: Acts 20:28 (feed the church... over which made you overseers)
--   v.4     the chief Shepherd shall appear / a crown of glory that fadeth not away
--           Tanakh: Ezekiel 34:23 (one shepherd... my servant David), Psalm 23:1 (Yahuah is my shepherd)
--           Extras: none warranted   NT: John 10:11 (I am the good shepherd... giveth his life)
--   v.5     be clothed with humility: Elohim resisteth the proud, giveth grace to the humble [BLESSING]
--           Tanakh: Proverbs 3:34 (he giveth grace unto the lowly), Isaiah 57:15 (with him of a
--                   humble spirit), Proverbs 29:23 (honour shall uphold the humble in spirit)
--           Extras: none warranted   NT: James 4:6 (Elohim resisteth the proud — the twin quotation)
--   v.6     humble yourselves under the mighty hand of Elohim, that he may exalt you
--           Tanakh: Job 22:29 (he shall save the humble person)
--           Extras: none warranted   NT: Matthew 23:12 (he that shall humble himself shall be exalted)
--   v.7     casting all your care upon him; for he careth for you
--           Tanakh: Psalm 55:22 (Cast thy burden upon Yahuah, and he shall sustain thee)
--           Extras: none warranted   NT: none warranted
--   v.8     your adversary the devil, as a roaring lion, walketh about
--           Tanakh: Job 1:7 (Satan from going to and fro in the earth), Psalm 22:13 (as a ravening
--                   and a roaring lion)
--           Extras: none warranted   NT: none warranted
--   v.9-14  resist stedfast / the Elohim of all grace / Babylon / kiss of charity
--           Tanakh: none warranted (the suffering-then-glory carried in the apparatus; greeting verses
--                   have no load-bearing root)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9720 1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34         (Tanakh + NT)
--   9723 1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23  (Tanakh + NT)
--   9726 1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3      (Tanakh + NT)  [BLESSING]
--   9729 1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22         (Tanakh + NT)
--   9732 1-peter-5-casting-all-your-care-upon-him-psalm-55                          (Tanakh)
--   9735 1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22                    (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s240_p240c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34
  ('canon', '1-peter', 5, 2, 'canon', 'ezekiel', 34, 2, 'free', E'*Son of Adam, prophesy against the shepherds of Yashar''el (Israel), prophesy, and say unto them, Thus saith Adonai Yahuah (the Lord GOD) unto the shepherds; Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). Yahuah (LORD) charged the shepherds of Yashar''el (Israel) with feeding themselves and not the flock. Peter lays the same charge on the elders: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind* (1 Peter 5:2). The flock is Yahuah''s (LORD''s); the shepherd''s task is to feed it, never to feed off it — *not for filthy lucre* answers Ezekiel''s shepherds who ate the fat and clothed themselves with the wool.'),
  ('canon', '1-peter', 5, 2, 'canon', 'ezekiel', 34, 4, 'free', E'*The diseased have ye not strengthened, neither have ye healed that which was sick, neither have ye bound up that which was broken, neither have ye brought again that which was driven away, neither have ye sought that which was lost; but with force and with cruelty have ye ruled them.* (Ezekiel 34:4). The false shepherds *ruled them* *with force and with cruelty* — and Peter forbids exactly this: *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3). The under-shepherd is not to lord it over the heritage of Elohim (God) as Ezekiel''s shepherds lorded over Yahuah''s (LORD''s) sheep, but to lead by example, gathering the driven-away and the lost.'),
  ('canon', '1-peter', 5, 3, 'canon', 'ezekiel', 34, 10, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against the shepherds; and I will require my flock at their hand, and cause them to cease from feeding the flock; neither shall the shepherds feed themselves any more; for I will deliver my flock from their mouth, that they may not be meat for them.* (Ezekiel 34:10). Yahuah (LORD) will *require my flock at their hand* — the shepherds answer to Him for the sheep. Peter writes as one *who am also an elder* (1 Peter 5:1) charging the elders to shepherd *not as being lords over Elohim''s (God''s) heritage* (1 Peter 5:3): the flock belongs to Elohim (God), and those who oversee it are accountable to the One who owns it.'),
  ('canon', '1-peter', 5, 2, 'canon', 'ezekiel', 34, 15, 'free', E'*I will feed my flock, and I will cause them to lie down, saith Adonai Yahuah (the Lord GOD). I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick: but I will destroy the fat and the strong; I will feed them with judgment.* (Ezekiel 34:15-16). Where the false shepherds failed, Yahuah (LORD) Himself comes: *I will feed my flock... I will seek that which was lost.* The elders Peter charges to *feed the flock of Elohim (God)... taking the oversight thereof* (1 Peter 5:2) serve under that true Shepherd; their feeding is His feeding extended, never their own.'),
  ('canon', '1-peter', 5, 2, 'canon', 'acts', 20, 28, 'free', E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood.* (Acts 20:28). Paul charged the elders of Ephesus in the very words Peter uses — *to feed the church of Elohim (God)* as *overseers.* The same apostolic charge runs through both: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof* (1 Peter 5:2). The flock is purchased and owned by Elohim (God); the overseers are stewards set over what is His.'),
  -- thread: 1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23
  ('canon', '1-peter', 5, 4, 'canon', 'ezekiel', 34, 23, 'free', E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* (Ezekiel 34:23). After the false shepherds are removed, Yahuah (LORD) promises *one shepherd... my servant David* over the regathered flock. Peter names His appearing: *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4). The under-shepherds feed the flock until the *chief Shepherd* — the promised one-shepherd, the Branch of David — is revealed; He is the head over all who tend His sheep.'),
  ('canon', '1-peter', 5, 4, 'canon', 'psalms', 23, 1, 'free', E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want.* (Psalm 23:1). David sang of Yahuah (LORD) as his shepherd who leads, restores, and dwells with His sheep for ever. The chief Shepherd whom Peter awaits — *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4) — is that same Shepherd of the flock, the One in whose house the sheep dwell *for ever.* The crown that *fadeth not away* is the abiding goodness and mercy of the Shepherd''s own keeping.'),
  ('canon', '1-peter', 5, 4, 'canon', 'john', 10, 11, 'free', E'*I am the good shepherd: the good shepherd giveth his life for the sheep.* (John 10:11). Yahusha (Jesus) declared Himself the good shepherd who lays down His life — the fulfilment of Ezekiel''s *one shepherd... my servant David* and of Yahuah (LORD) coming to feed His own flock. Peter names His return *the chief Shepherd* who *shall appear* (1 Peter 5:4): the Shepherd who gave His life for the sheep is the One the under-shepherds serve and await, at whose appearing the faithful receive *a crown of glory that fadeth not away.*'),
  -- thread: 1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3  [BLESSING]
  ('canon', '1-peter', 5, 5, 'canon', 'proverbs', 3, 34, 'free', E'*Surely he scorneth the scorners: but he giveth grace unto the lowly.* (Proverbs 3:34). This is the very scripture Peter quotes: *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Yahuah (LORD) scorns the scorners — *resisteth the proud* — but *giveth grace unto the lowly.* The lowly and the humble are one; the grace is given precisely to those who do not exalt themselves. This is the same verse James 4:6 quotes, the two pillars of the scattered citing one proverb as binding scripture.'),
  ('canon', '1-peter', 5, 5, 'canon', 'isaiah', 57, 15, 'free', E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones.* (Isaiah 57:15). The high and lofty One dwells *with him also that is of a contrite and humble spirit* — He *giveth grace to the humble* (1 Peter 5:5) by dwelling with them and reviving them. Where pride is resisted, the humble spirit is the very place where the Holy One makes His home; Peter''s *be clothed with humility* is the garment that draws near the One who inhabiteth eternity.'),
  ('canon', '1-peter', 5, 5, 'canon', 'proverbs', 29, 23, 'free', E'*A man''s pride shall bring him low: but honour shall uphold the humble in spirit.* (Proverbs 29:23). The proverb states the double law Peter quotes: *a man''s pride shall bring him low* — Elohim (God) *resisteth the proud* — *but honour shall uphold the humble in spirit* — He *giveth grace to the humble* (1 Peter 5:5). Pride is its own undoing; humility is its own exaltation by the hand of Yahuah (LORD). The clothing of humility Peter commands is the way of honour, not of shame.'),
  ('canon', '1-peter', 5, 5, 'canon', 'james', 4, 6, 'free', E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* (James 4:6). James and Peter — both writing to the scattered (James 1:1; 1 Peter 1:1) — quote the same Proverbs 3:34 word for word: *Elohim (God) resisteth the proud, but giveth grace unto the humble.* Peter writes it as *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). The twin quotation binds the two epistles of the dispersion: one proverb, cited as scripture by both apostles, the standard of the humbled and gathered remnant.'),
  -- thread: 1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22
  ('canon', '1-peter', 5, 6, 'canon', 'job', 22, 29, 'free', E'*When men are cast down, then thou shalt say, There is lifting up; and he shall save the humble person.* (Job 22:29). Job''s counsel holds the same law as Peter''s charge: *he shall save the humble person* — and *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The cast-down who humble themselves are the ones Yahuah (LORD) lifts up; the *lifting up* of Job is the *exalt you in due time* of Peter — exaltation is His to give, in His season, to the lowly.'),
  ('canon', '1-peter', 5, 6, 'canon', 'matthew', 23, 12, 'free', E'*And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted.* (Matthew 23:12). Yahusha (Jesus) spoke the law of the kingdom that Peter now applies: *he that shall humble himself shall be exalted.* Peter writes *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The one who refuses to exalt himself and bows under the mighty hand is the one Elohim (God) raises; self-exaltation is abasement, self-humbling is the path to glory in due time.'),
  -- thread: 1-peter-5-casting-all-your-care-upon-him-psalm-55
  ('canon', '1-peter', 5, 7, 'canon', 'psalms', 55, 22, 'free', E'*Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* (Psalm 55:22). David''s charge is the root of Peter''s: *Cast thy burden upon Yahuah (LORD), and he shall sustain thee* becomes *Casting all your care upon him; for he careth for you* (1 Peter 5:7). The burden cast on Yahuah (LORD) is met by His sustaining; the care cast on Him is answered by His caring. The humbled who bow under the mighty hand (1 Peter 5:6) are the very ones invited to unload every care upon the One who will not let the righteous be moved.'),
  -- thread: 1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22
  ('canon', '1-peter', 5, 8, 'canon', 'job', 1, 7, 'free', E'*And Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it.* (Job 1:7). The adversary in Job is the one *going to and fro in the earth,* prowling among men — exactly Peter''s warning: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The Satan who *walketh up and down in it* in Job is the *adversary* who *walketh about* in Peter; the saints are to be sober and watchful against the same prowling enemy.'),
  ('canon', '1-peter', 5, 8, 'canon', 'psalms', 22, 13, 'free', E'*They gaped upon me with their mouths, as a ravening and a roaring lion.* (Psalm 22:13). The psalm of the suffering righteous one likens his attackers to *a ravening and a roaring lion* — the very image Peter gives the devil: *your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The roaring lion that gaped upon David''s anointed is the adversary the scattered saints must *resist stedfast in the faith* (1 Peter 5:9), knowing the same afflictions are accomplished in their brethren in the world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34',
       E'Feed the flock of Elohim (God), taking the oversight thereof (Ezekiel 34)',
       E'Peter closes the letter charging the elders: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind; Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:2-3). Every clause answers the great shepherd-oracle of Ezekiel 34, where Yahuah (LORD) indicted the shepherds of Yashar''el (Israel): *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). They ate the fat and clothed themselves with the wool; *the diseased have ye not strengthened... neither have ye sought that which was lost; but with force and with cruelty have ye ruled them* (Ezekiel 34:4) — the very lording Peter forbids. So Yahuah (LORD) declared, *Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10): the flock is His, and its overseers answer to Him. And He pledged to do Himself what they would not: *I will feed my flock... I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken* (Ezekiel 34:15-16). The under-shepherds Peter charges serve under that true Shepherd; their feeding is His feeding extended, never their own profit. Paul gave the identical charge at Ephesus — *feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). The flock is purchased and owned by Elohim (God); to oversee it is to steward what is His, gathering the lost and the driven-away as He commanded, not feeding off the sheep but feeding them.',
       sv.verse_id, ev.verse_id, 'free', 9720
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23',
       E'When the chief Shepherd shall appear, a crown of glory (Ezekiel 34, Psalm 23)',
       E'*And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4). The under-shepherds feed the flock until the *chief Shepherd* is revealed — and that one Shepherd is the promise of Ezekiel 34. After Yahuah (LORD) removes the false shepherds and gathers the scattered, He vows: *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The *chief Shepherd* is that promised one-shepherd, the Branch of David set over the regathered flock. He is the Shepherd David himself sang of: *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1) — the One who leads, restores, and keeps His sheep in His house *for ever.* And He is the One who named Himself in the flesh: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The good shepherd who laid down His life, the *one shepherd... my servant David,* and *Yahuah Ra''ah (The LORD is my shepherd)* are the same chief Shepherd whose appearing the faithful await. The *crown of glory that fadeth not away* is the abiding portion of those whom He keeps — goodness and mercy that follow His sheep all their days, the unfading inheritance of the flock at the Shepherd''s appearing.',
       sv.verse_id, ev.verse_id, 'free', 9723
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3',
       E'Elohim (God) resisteth the proud, and giveth grace to the humble (Proverbs 3)',
       E'*Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Peter quotes the proverb *according to the scripture* — the very verse James cites: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Yahuah (LORD) scorns the scorners — *resisteth the proud* — but pours grace on the lowly. James, writing like Peter to the scattered, quotes the same word for word: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). Two apostles of the dispersion, one proverb, cited as binding scripture — the standard of the humbled and gathered remnant. The Tanakh holds the double law throughout: *A man''s pride shall bring him low: but honour shall uphold the humble in spirit* (Proverbs 29:23) — pride is its own undoing, humility its own exaltation by the hand of Yahuah (LORD). And the place where grace is given is the humble spirit itself: *thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones* (Isaiah 57:15). The Holy One makes His home with the contrite; to *be clothed with humility* is to put on the garment that draws near the One who inhabiteth eternity. Pride He resists; the lowly He revives, upholds with honour, and crowns with grace.',
       sv.verse_id, ev.verse_id, 'free', 9726
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22',
       E'Humble yourselves under the mighty hand of Elohim (God) (Job 22, Matthew 23)',
       E'*Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The grace given to the humble (1 Peter 5:5) flows straight into this charge: bow low, and Elohim (God) Himself will lift you up in His season. Job''s counsel holds the same law: *When men are cast down, then thou shalt say, There is lifting up; and he shall save the humble person* (Job 22:29). The cast-down who humble themselves are the ones Yahuah (LORD) lifts; the *lifting up* of Job is Peter''s *exalt you in due time* — exaltation is His to give, never self-seized. Yahusha (Jesus) spoke the same law of the kingdom: *whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* (Matthew 23:12). Self-exaltation ends in abasement; self-humbling under the mighty hand ends in glory. The mighty hand that humbles is the same hand that exalts, in due time, the one who waits low beneath it.',
       sv.verse_id, ev.verse_id, 'free', 9729
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-casting-all-your-care-upon-him-psalm-55',
       E'Casting all your care upon him; for he careth for you (Psalm 55)',
       E'*Casting all your care upon him; for he careth for you* (1 Peter 5:7). Peter draws this directly from David''s psalm of distress: *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved* (Psalm 55:22). The burden cast on Yahuah (LORD) is met by His sustaining; the care cast on Him is answered by His caring. The two charges belong together: those who *humble yourselves... under the mighty hand of Elohim (God)* (1 Peter 5:6) are the very ones invited to unload every care upon Him — for the humbling and the casting are one act of trust, the bowing-low that lets go of all anxiety into the hands of the One who *shall never suffer the righteous to be moved.* He who careth for His own bears the weight His sheep cannot.',
       sv.verse_id, ev.verse_id, 'free', 9732
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22',
       E'Your adversary the devil, as a roaring lion, walketh about (Job 1, Psalm 22)',
       E'*Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The adversary who *walketh about* is the very Satan of Job: *Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it* (Job 1:7). The one *going to and fro in the earth,* prowling among men, is the *adversary* who *walketh about* — and the saints are to be sober and watchful against him. His likeness as a *roaring lion* is the image of the psalm of the suffering righteous one: *They gaped upon me with their mouths, as a ravening and a roaring lion* (Psalm 22:13). The lion that gaped upon David''s anointed is the adversary the scattered must *resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world* (1 Peter 5:9). The enemy roars and prowls, but he is a defeated prowler before Yahuah (LORD); the watchful and steadfast withstand him, and the Elohim (God) of all grace stablishes them after they have suffered a while.',
       sv.verse_id, ev.verse_id, 'free', 9735
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:2 — *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* the charge against the false shepherds; *Feed the flock of Elohim (God)... not for filthy lucre* (1 Peter 5:2).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:4 — *with force and with cruelty have ye ruled them* the lording over the sheep; *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:10 — *I will require my flock at their hand* the shepherds accountable for the sheep; *not as being lords over Elohim''s (God''s) heritage* (1 Peter 5:3) — the flock belongs to Elohim (God).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 34:15 — *I will feed my flock... I will seek that which was lost* Yahuah (LORD) the true Shepherd; the elders'' *Feed the flock of Elohim (God)... taking the oversight* (1 Peter 5:2) is His feeding extended.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 20:28 — *to feed the church of Elohim (God), which he hath purchased with his own blood* Paul''s identical charge to the Ephesian elders; *Feed the flock of Elohim (God)... taking the oversight thereof* (1 Peter 5:2).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:23 — *I will set up one shepherd over them... even my servant David... he shall be their shepherd* the promised one-shepherd; *when the chief Shepherd shall appear* (1 Peter 5:4).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 23:1 — *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* the Shepherd in whose house the sheep dwell for ever; *a crown of glory that fadeth not away* (1 Peter 5:4).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep* Yahusha (Jesus) the good shepherd; the chief Shepherd who *shall appear* (1 Peter 5:4).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:34 — *he scorneth the scorners: but he giveth grace unto the lowly* the scripture Peter quotes; *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:6 — *Elohim (God) resisteth the proud, but giveth grace unto the humble* the twin quotation of Proverbs 3:34 by the other apostle of the dispersion; *giveth grace to the humble* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 29:23 — *A man''s pride shall bring him low: but honour shall uphold the humble in spirit* the double law of pride and humility; *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 57:15 — *I dwell in the high and holy place, with him also that is of a contrite and humble spirit* the Holy One dwells with the humble; *giveth grace to the humble... be clothed with humility* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 22:29 — *There is lifting up; and he shall save the humble person* the cast-down lifted; *Humble yourselves... under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=22 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:12 — *he that shall humble himself shall be exalted* the law of the kingdom; *Humble yourselves... that he may exalt you in due time* (1 Peter 5:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-casting-all-your-care-upon-him-psalm-55
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved* the root of Peter''s charge; *Casting all your care upon him; for he careth for you* (1 Peter 5:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-casting-all-your-care-upon-him-psalm-55'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:7 — *Satan... From going to and fro in the earth, and from walking up and down in it* the prowling adversary; *your adversary the devil, as a roaring lion, walketh about* (1 Peter 5:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:13 — *They gaped upon me with their mouths, as a ravening and a roaring lion* the lion against the suffering righteous one; *your adversary the devil, as a roaring lion* (1 Peter 5:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
