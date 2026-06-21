-- =====================================================================
-- Session 334 — Nahum FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session334_nahum_cross_references.sql
-- =====================================================================

\echo 'session334 — Nahum cross-references starting...'
BEGIN;

-- ----- fragment: minion_nahum_1.sql (Nahum 1) -----
-- Chapter: Nahum 1 — THE BALANCED CHARACTER OF YAHUAH, the storm-theophany of the coming Judge,
-- the refuge for the faithful, and the beautiful feet of him that bringeth good tidings. The burden
-- opens with the two-sided revelation: *Elohim (God) is jealous, and Yahuah (LORD) revengeth... Yahuah
-- (LORD) is slow to anger, and great in power, and will not at all acquit the wicked* (1:2-3) — the
-- Exodus 34:6-7 creed's OTHER half (the One *abundant in goodness* who *will by no means clear the
-- guilty*). The wrath against the wicked is the necessary complement to the mercy. The Judge comes in
-- storm — *Yahuah (LORD) hath his way in the whirlwind and in the storm... The mountains quake at him*
-- (1:3-6) — and *Who can stand before his indignation?* (1:6). In the same breath the oracle names the
-- refuge: *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust
-- in him* (1:7) — goodness and severity together. The keystone is the herald on the mountains: *Behold
-- upon the mountains the feet of him that bringeth good tidings, that publisheth peace! O Yahudah
-- (Judah), keep thy solemn feasts* (1:15) — near-identical to Isaiah 52:7, quoted in Romans 10:15, AND
-- the command to KEEP the appointed times after deliverance — Torah affirmed, never abolished.
-- Tag: nah01   Temp view: _s334_nah01_lookup
-- Sort band: base 45500, step 3 -> threads at 45500, 45503, 45506, 45509, 45512 (5 threads)
-- Source of EVERY row: 'canon','nahum',1,v
--
-- Nahum 1 coverage:
--   v.1 (The burden of Nineveh. The book of the vision of Nahum the Elkoshite.)
--        NT/Extras/Tanakh: none warranted (superscription; the burden-against-Nineveh is the frame
--        woven into the threads, not a separate cross-add)
--   ★★ v.2-3 (Elohim is jealous, and Yahuah revengeth... Yahuah is slow to anger, and great in power,
--          and will not at all acquit the wicked)
--        NT:     ★★ Romans 12:19 (Vengeance is mine; I will repay, saith Yahuah), ★★ Hebrews 10:30
--                (Vengeance belongeth unto me... Yahuah shall judge his people), Hebrews 10:31 (a fearful
--                thing to fall into the hands of the living Elohim), ★ Romans 11:22 (the goodness and
--                severity of Elohim) — THREAD 1
--        Extras: ★ Sirach 5:6-7 (mercy and wrath come from him... the day of vengeance) — THREAD 1
--        Tanakh: ★★ Exodus 34:6-7 (merciful and gracious, longsuffering... and that will by no means
--                clear the guilty), ★ Deuteronomy 4:24 (Yahuah thy Elohim is a consuming fire, even a
--                jealous Elohim) — THREAD 1
--   ★ v.3-6 (Yahuah hath his way in the whirlwind and in the storm... He rebuketh the sea... The
--          mountains quake at him... Who can stand before his indignation?)
--        NT:     ★ Matthew 8:26 (rebuked the winds and the sea; and there was a great calm) — THREAD 2
--                (the rebuke of the sea); ★ Revelation 6:17 (the great day of his wrath is come; and who
--                shall be able to stand?) — THREAD 2 (who can stand)
--        Extras: none warranted distinct (the theophany weave is full in canon)
--        Tanakh: ★ Psalm 18:7-9 (the earth shook... smoke out of his nostrils... darkness under his
--                feet), ★ Habakkuk 3:3-6 (Elohim came from Teman... the everlasting mountains were
--                scattered), ★ Micah 1:3-4 (Yahuah cometh forth... the mountains shall be molten),
--                Psalm 106:9 (He rebuked the Red sea... and it was dried up), ★ Malachi 3:2 (who shall
--                stand when he appeareth?) — THREAD 2
--   ★★ v.7 (Yahuah is good, a strong hold in the day of trouble; and he knoweth them that trust in him)
--        NT:     ★★ 2 Timothy 2:19 (the foundation of Elohim standeth sure... Yahuah knoweth them that
--                are his) — THREAD 3
--        Extras: ★ Sirach 2:10-11 (did ever any trust in Yahuah, and was confounded?... Yahuah is full
--                of compassion... and saves in time of affliction) — THREAD 3
--        Tanakh: ★★ Psalm 46:1 (Elohim is our refuge and strength, a very present help in trouble),
--                ★ Psalm 9:9-10 (a refuge in times of trouble... they that know thy name will put their
--                trust in thee), ★ Psalm 1:6 (Yahuah knoweth the way of the righteous), Psalm 34:8
--                (O taste and see that Yahuah is good) — THREAD 3
--   v.8-11 (with an overrunning flood he will make an utter end... affliction shall not rise up the
--          second time... one come out of thee, that imagineth evil against Yahuah)
--        NT/Extras: none warranted (the utter-end-of-Nineveh judgment is woven into THREAD 1's
--                severity prose; the wicked counsellor framed there)
--        Tanakh: held in prose (the overflowing flood = the burden of Nineveh of v.1)
--   v.12-14 (Though I have afflicted thee, I will afflict thee no more... now will I break his yoke
--          from off thee, and will burst thy bonds in sunder... no more of thy name be sown)
--        NT:     none warranted distinct
--        Extras: none warranted
--        Tanakh: ★ the yoke-breaking / bonds-burst = deliverance of Yahudah, woven into THREAD 4 as the
--                ground of the good tidings (the oppressor cut off, freedom restored)
--   ★★ v.15 (Behold upon the mountains the feet of him that bringeth good tidings, that publisheth
--          peace! O Yahudah, keep thy solemn feasts, perform thy vows...)
--        NT:     ★★★ Romans 10:15 (How beautiful are the feet of them that preach the gospel of peace,
--                and bring glad tidings of good things!) — THREAD 4 (keystone)
--        Extras: none warranted
--        Tanakh: ★★★ Isaiah 52:7 (How beautiful upon the mountains are the feet of him that bringeth
--                good tidings... that saith unto Zion, Thy Elohim reigneth!) — THREAD 4 (near-twin);
--                ★★ Leviticus 23:2 / 23:4 (the feasts of Yahuah... holy convocations) — THREAD 5 (keep
--                thy solemn feasts = Torah affirmed); ★ Zechariah 14:16 (to keep the feast of
--                tabernacles) — THREAD 5 (the feasts kept after deliverance, into the kingdom)
--
-- Threads (slug — target libraries):
--   1. nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power — NT (Romans 12, Hebrews 10, Romans 11)
--      + Extras (Sirach 5) + Tanakh (Exodus 34, Deuteronomy 4) [extras]
--      (★★ the balanced character; the Exodus 34:6-7 creed's other half — goodness AND severity)
--   2. nahum-1-his-way-in-the-whirlwind-who-can-stand — NT (Matthew 8, Revelation 6) + Tanakh (Psalm 18,
--      Habakkuk 3, Micah 1, Psalm 106, Malachi 3) [free]
--      (★ the storm-theophany of the coming Judge; the rebuke of the sea; who can stand)
--   3. nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble — NT (2 Timothy 2) + Extras (Sirach 2)
--      + Tanakh (Psalm 46, Psalm 9, Psalm 1, Psalm 34) [extras]
--      (★★ the refuge for the faithful amid the wrath; he knoweth them that trust in him)
--   4. nahum-1-the-feet-of-him-that-bringeth-good-tidings — NT (Romans 10) + Tanakh (Isaiah 52) [free]
--      (★★★ KEYSTONE: the beautiful feet on the mountains; Isaiah 52:7 / Romans 10:15 the gospel of peace)
--   5. nahum-1-o-yahudah-keep-thy-solemn-feasts — Tanakh (Leviticus 23, Zechariah 14) [free]
--      (★★ the appointed times KEPT after deliverance — Torah affirmed, NOT abolished)
--
-- Framing notes:
--   ★★ THE BALANCED CHARACTER (THREAD 1): *Elohim (God) is jealous, and Yahuah (LORD) revengeth... Yahuah
--      (LORD) is slow to anger, and great in power, and will not at all acquit the wicked* (1:2-3). This is
--      the OTHER half of the creed Yahuah proclaimed at Sinai — *merciful and gracious, longsuffering, and
--      abundant in goodness and truth... and that will by no means clear the guilty* (Exodus 34:6-7). The
--      jealous, avenging Yahuah and the slow-to-anger Yahuah are ONE; the wrath against the wicked is the
--      necessary complement to the mercy — *Yahuah thy Elohim is a consuming fire, even a jealous Elohim*
--      (Deuteronomy 4:24). The NT does not soften it but takes it up: *Vengeance is mine; I will repay,
--      saith Yahuah* (Romans 12:19; Hebrews 10:30), *a fearful thing to fall into the hands of the living
--      Elohim* (Hebrews 10:31) — and names both sides at once: *the goodness and severity of Elohim*
--      (Romans 11:22). The restored witness says the same: *mercy and wrath come from him... suddenly shall
--      the wrath of Yahuah come forth... in the day of vengeance* (Sirach 5:6-7). Severity on the wicked is
--      conduct-and-judgment, the just verdict on Nineveh's evil; never caprice, never cruelty.
--   ★ THE STORM-THEOPHANY (THREAD 2): *Yahuah (LORD) hath his way in the whirlwind and in the storm, and
--      the clouds are the dust of his feet. He rebuketh the sea... The mountains quake at him, and the
--      hills melt* (1:3-5), *Who can stand before his indignation?* (1:6). This is the standing
--      Tanakh picture of the Judge coming down: *the earth shook and trembled... smoke out of his
--      nostrils... darkness under his feet* (Psalm 18:7-9); *Elohim came from Teman... the everlasting
--      mountains were scattered* (Habakkuk 3:3-6); *Yahuah cometh forth out of his place... the mountains
--      shall be molten under him* (Micah 1:3-4). The Formed Son does this very thing in the flesh —
--      *rebuked the winds and the sea; and there was a great calm* (Matthew 8:26), the same hand that
--      *rebuked the Red sea* (Psalm 106:9). And the question *Who can stand?* is the last-day cry:
--      *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17); *who
--      shall stand when he appeareth?* (Malachi 3:2).
--   ★★ THE REFUGE AMID THE WRATH (THREAD 3): in the very middle of the judgment-oracle stands the
--      mercy: *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust
--      in him* (1:7). The goodness is spoken in the same breath as the wrath — the storm that destroys
--      the wicked is the shelter of the faithful. *Elohim is our refuge and strength, a very present help
--      in trouble* (Psalm 46:1); *a refuge in times of trouble... they that know thy name will put their
--      trust in thee* (Psalm 9:9-10); *O taste and see that Yahuah is good* (Psalm 34:8). And *he knoweth
--      them that trust in him* is the seal Paul names: *the foundation of Elohim standeth sure... Yahuah
--      knoweth them that are his* (2 Timothy 2:19; cf. *Yahuah knoweth the way of the righteous*, Psalm
--      1:6). The restored witness asks it plainly: *did ever any trust in Yahuah, and was confounded?...
--      Yahuah is full of compassion... and saves in time of affliction* (Sirach 2:10-11).
--   ★★★ THE BEAUTIFUL FEET (THREAD 4, KEYSTONE): *Behold upon the mountains the feet of him that bringeth
--      good tidings, that publisheth peace!* (1:15). This is the near-twin of Isaiah's herald: *How
--      beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace...
--      that saith unto Zion, Thy Elohim reigneth!* (Isaiah 52:7) — and the NT gathers both into the gospel
--      proclamation: *How beautiful are the feet of them that preach the gospel of peace, and bring glad
--      tidings of good things!* (Romans 10:15). The good news in Nahum is concrete: the oppressor cut off,
--      Yahudah's yoke broken (*now will I break his yoke from off thee, and will burst thy bonds in
--      sunder*, 1:13) — freedom to worship restored. The same shape as the gospel: deliverance accomplished,
--      peace published on the mountains.
--   ★★ KEEP THY SOLEMN FEASTS (THREAD 5): the herald's good news lands on a command — *O Yahudah (Judah),
--      keep thy solemn feasts, perform thy vows: for the wicked shall no more pass through thee; he is
--      utterly cut off* (1:15). The appointed times (the mo'adim) are KEPT after the deliverance — the
--      Torah affirmed, never abolished: *Concerning the feasts of Yahuah, which ye shall proclaim to be
--      holy convocations, even these are my feasts* (Leviticus 23:2); *These are the feasts of Yahuah...
--      which ye shall proclaim in their seasons* (Leviticus 23:4). And these same feasts run forward into
--      the kingdom — *every one that is left of all the nations... shall even go up from year to year...
--      to keep the feast of tabernacles* (Zechariah 14:16). The good news is precisely freedom to keep the
--      calendar of Yahuah; the gospel restores the feasts, it does not retire them.
--   EXTRAS: Sirach 5:6-7 (mercy and wrath from him; the day of vengeance — THREAD 1) and Sirach 2:10-11
--      (trust in Yahuah is never confounded; he saves in affliction — THREAD 3) are clean witnesses,
--      parses verified. No extras forced on the theophany, the keystone feet, or the feasts.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription — the burden-of-Nineveh frame, woven not cross-added),
--      v.8-11 (the overrunning flood / utter end / wicked counsellor — the severity of THREAD 1 enacted on
--      Nineveh, held in prose), v.12-14 (the yoke broken, the name cut off — the ground of THREAD 4's good
--      tidings, woven into the keystone). All recorded, none silently skipped.

CREATE TEMP VIEW _s334_nah01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the jealous Yahuah, slow to anger and great in power — goodness AND severity
    ('canon','nahum',1,2,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). Nahum opens with the OTHER half of the Sinai creed: *Elohim (God) is jealous, and Yahuah (LORD) revengeth* (Nahum 1:2). The same Yahuah who proclaimed himself *merciful and gracious, longsuffering* is the One who *revengeth* — mercy and judgment are one character, not two gods.'),
    ('canon','nahum',1,3,'canon','exodus',34,7,'free',
      E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:7). This is Nahum 1:3 in seed — *Yahuah (LORD) is slow to anger, and great in power, and will not at all acquit the wicked*. The creed itself holds both: He forgives iniquity AND *will by no means clear the guilty*. Nahum simply preaches the half Nineveh needed to hear.'),
    ('canon','nahum',1,2,'canon','deuteronomy',4,24,'free',
      E'*For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24). Nahum''s opening — *Elohim (God) is jealous, and Yahuah (LORD) revengeth* (Nahum 1:2) — names the same jealous fire Moses warned of. The jealousy of Yahuah is His covenant zeal; the consuming fire falls on the unrepentant adversary.'),
    ('canon','nahum',1,2,'canon','romans',12,19,'free',
      E'*Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). Because *Yahuah (LORD) revengeth... and he reserveth wrath for his enemies* (Nahum 1:2), His people need not avenge themselves — the vengeance belongs to Him alone, and He will repay in His time.'),
    ('canon','nahum',1,2,'canon','hebrews',10,30,'free',
      E'*For we know him that hath said, Vengeance belongeth unto me, I will recompense, saith Yahuah (Lord). And again, Yahuah (Lord) shall judge his people* (Hebrews 10:30). The avenging Yahuah of *Yahuah (LORD) revengeth; Yahuah (LORD) revengeth, and is furious* (Nahum 1:2) is the unchanging Judge — *Vengeance belongeth unto me, I will recompense*. Nahum''s burden against Nineveh is the same righteous recompense.'),
    ('canon','nahum',1,2,'canon','hebrews',10,31,'free',
      E'*It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31). Nahum says it of Nineveh''s adversaries — *Yahuah (LORD) will take vengeance on his adversaries, and he reserveth wrath for his enemies* (Nahum 1:2). To stand against Yahuah is to fall into the hands of the living El whose wrath is reserved and sure.'),
    ('canon','nahum',1,3,'canon','romans',11,22,'free',
      E'*Behold therefore the goodness and severity of Elohim (God): on them which fell, severity; but toward thee, goodness, if thou continue in his goodness: otherwise thou also shalt be cut off* (Romans 11:22). This is Nahum''s whole oracle in one verse — *slow to anger, and great in power, and will not at all acquit the wicked* (Nahum 1:3): goodness toward the faithful, severity on the unrepentant, the two sides of one Yahuah.'),
    ('canon','nahum',1,2,'apocrypha','ecclesiasticus',5,6,'extras',
      E'*And say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners* (Sirach 5:6). The restored witness states Nahum''s balance plainly — *mercy and wrath come from him* — answering the one who presumes on mercy alone. Nahum''s *Yahuah (LORD) revengeth, and is furious* (Nahum 1:2) is the wrath that *resteth upon sinners*.'),
    ('canon','nahum',1,3,'apocrypha','ecclesiasticus',5,7,'extras',
      E'*Make no tarrying to turn to Yahuah (God), and put not off from day to day: for suddenly shall the wrath of Yahuah (God) come forth, and in your security you shall be destroyed, and perish in the day of vengeance* (Sirach 5:7). The slowness of *Yahuah (LORD) is slow to anger* (Nahum 1:3) is no acquittal — *he will not at all acquit the wicked*; the *day of vengeance* comes suddenly on the secure who would not turn.'),

    -- THREAD 2 (★): the storm-theophany — his way in the whirlwind, who can stand
    ('canon','nahum',1,3,'canon','psalms',18,7,'free',
      E'*Then the earth shook and trembled; the foundations also of the hills moved and were shaken, because he was wroth* (Psalm 18:7). The same coming-down of the Judge stands in Nahum — *Yahuah (LORD) hath his way in the whirlwind and in the storm, and the clouds are the dust of his feet* (Nahum 1:3). When Yahuah descends in wrath the earth itself convulses.'),
    ('canon','nahum',1,3,'canon','psalms',18,9,'free',
      E'*He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9). Nahum sees the same theophany — *the clouds are the dust of his feet* (Nahum 1:3): the storm-cloud is the very footstool of the descending Yahuah, darkness and dust beneath His tread.'),
    ('canon','nahum',1,4,'canon','psalms',106,9,'free',
      E'*He rebuked the Red sea also, and it was dried up: so he led them through the depths, as through the wilderness* (Psalm 106:9). Nahum''s *He rebuketh the sea, and maketh it dry, and drieth up all the rivers* (Nahum 1:4) is the same word of power that split the Red sea — the Creator who rebukes the waters and they obey.'),
    ('canon','nahum',1,4,'canon','matthew',8,26,'free',
      E'*And he saith unto them, Why are ye fearful, O ye of little faith? Then he arose, and rebuked the winds and the sea; and there was a great calm* (Matthew 8:26). The Formed Son does in the flesh what Nahum says of Yahuah — *He rebuketh the sea, and maketh it dry* (Nahum 1:4). The hand that rebukes the sea in the boat is the hand that rebukes it in the prophet''s oracle: He is Yahuah, and He has a Father.'),
    ('canon','nahum',1,5,'canon','habakkuk',3,6,'free',
      E'*He stood, and measured the earth: he beheld, and drove asunder the nations; and the everlasting mountains were scattered, the perpetual hills did bow: his ways are everlasting* (Habakkuk 3:6). Nahum''s *The mountains quake at him, and the hills melt* (Nahum 1:5) is the same theophany Habakkuk sings — the everlasting mountains scattered, the perpetual hills bowing before the coming One.'),
    ('canon','nahum',1,5,'canon','micah',1,4,'free',
      E'*And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place* (Micah 1:4). Nahum and Micah, near-neighbors, see the same descent — *the hills melt, and the earth is burned at his presence* (Nahum 1:5): the mountains melt like wax when Yahuah comes forth out of His place.'),
    ('canon','nahum',1,6,'canon','malachi',3,2,'free',
      E'*But who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire, and like fullers'' soap* (Malachi 3:2). Nahum''s *Who can stand before his indignation? and who can abide in the fierceness of his anger?* (Nahum 1:6) is the same unanswerable question — none may abide the day of His coming but the refined.'),
    ('canon','nahum',1,6,'canon','revelation',6,17,'free',
      E'*For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Nahum''s *Who can stand before his indignation?* (Nahum 1:6) is the cry of the last day, when *his fury is poured out like fire* (1:6) and the kings of the earth seek to be hidden from the face of Him that sitteth on the throne.'),

    -- THREAD 3 (★★): Yahuah is good, a strong hold in the day of trouble — the refuge
    ('canon','nahum',1,7,'canon','psalms',46,1,'free',
      E'*Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1). Nahum''s *Yahuah (LORD) is good, a strong hold in the day of trouble* (Nahum 1:7) sings the same refuge — the storm that destroys the wicked is the stronghold of the faithful; a very present help when trouble comes.'),
    ('canon','nahum',1,7,'canon','psalms',9,9,'free',
      E'*Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble* (Psalm 9:9). The *strong hold in the day of trouble* (Nahum 1:7) is the refuge for the oppressed — Yahudah crushed under Nineveh''s yoke finds Yahuah Himself the shelter in the day of trouble.'),
    ('canon','nahum',1,7,'canon','psalms',9,10,'free',
      E'*And they that know thy name will put their trust in thee: for thou, Yahuah (LORD), hast not forsaken them that seek thee* (Psalm 9:10). Nahum''s *he knoweth them that trust in him* (Nahum 1:7) is the mutual knowing — they that know His name trust Him, and He has not forsaken them that seek Him.'),
    ('canon','nahum',1,7,'canon','psalms',1,6,'free',
      E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). Nahum''s *he knoweth them that trust in him* (Nahum 1:7) is the same divine knowing that divides the two ways — the righteous known and kept, the ungodly perishing in the overrunning flood (1:8).'),
    ('canon','nahum',1,7,'canon','psalms',34,8,'free',
      E'*O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* (Psalm 34:8). Nahum says it in the midst of judgment — *Yahuah (LORD) is good... and he knoweth them that trust in him* (Nahum 1:7): the goodness is tasted by the one who trusts, even on the day of trouble.'),
    ('canon','nahum',1,7,'canon','2-timothy',2,19,'free',
      E'*Nevertheless the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his. And, Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19). Nahum''s *he knoweth them that trust in him* (Nahum 1:7) is the very seal on the sure foundation — *Yahuah knoweth them that are his*. The day of trouble cannot shake the ones He knows.'),
    ('canon','nahum',1,7,'apocrypha','ecclesiasticus',2,10,'extras',
      E'*Look at the generations of old, and see; did ever any trust in Yahuah (God), and was confounded? or did any abide in his fear, and was forsaken? or whom did he ever despise, that called upon him?* (Sirach 2:10). The restored witness presses Nahum''s promise — *he knoweth them that trust in him* (Nahum 1:7): never once was the one who trusted Yahuah confounded or forsaken.'),
    ('canon','nahum',1,7,'apocrypha','ecclesiasticus',2,11,'extras',
      E'*For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction* (Sirach 2:11). Nahum''s *Yahuah (LORD) is good, a strong hold in the day of trouble* (Nahum 1:7) is the same — He *saves in time of affliction*; the goodness is the refuge of all who trust Him.'),

    -- THREAD 4 (★★★ KEYSTONE): the feet of him that bringeth good tidings
    ('canon','nahum',1,15,'canon','isaiah',52,7,'free',
      E'*How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). Nahum''s *Behold upon the mountains the feet of him that bringeth good tidings, that publisheth peace!* (Nahum 1:15) is the near-twin — the same herald, the same mountains, the same published peace. The oppressor cut off, Zion''s Elohim reigns.'),
    ('canon','nahum',1,15,'canon','romans',10,15,'free',
      E'*And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15). Paul gathers Nahum 1:15 and Isaiah 52:7 into the gospel proclamation — *the feet of him that bringeth good tidings, that publisheth peace* (Nahum 1:15). The good news is the same shape: deliverance accomplished, peace published abroad.'),

    -- THREAD 5 (★★): O Yahudah, keep thy solemn feasts — Torah affirmed
    ('canon','nahum',1,15,'canon','leviticus',23,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). Nahum''s command after deliverance — *O Yahudah (Judah), keep thy solemn feasts, perform thy vows* (Nahum 1:15) — points straight back to *the feasts of Yahuah... even these are my feasts*. The appointed times are KEPT, not retired; the good news is freedom to keep them.'),
    ('canon','nahum',1,15,'canon','leviticus',23,4,'free',
      E'*These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons* (Leviticus 23:4). *Keep thy solemn feasts* (Nahum 1:15) is obedience to this very word — the mo''adim *proclaim[ed] in their seasons*. The deliverance from Nineveh restores the people to the calendar of Yahuah.'),
    ('canon','nahum',1,15,'canon','zechariah',14,16,'free',
      E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The feasts of *keep thy solemn feasts* (Nahum 1:15) run forward into the kingdom — even the nations go up to keep the feast of tabernacles. The appointed times are not abolished; they are the worship of the age to come.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s334_nah01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s334_nah01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power',
       E'The jealous Yahuah, slow to anger and great in power — the goodness and severity',
       E'The burden of Nineveh opens with the two-sided revelation of Yahuah''s character: *Elohim (God) is jealous, and Yahuah (LORD) revengeth; Yahuah (LORD) revengeth, and is furious; Yahuah (LORD) will take vengeance on his adversaries, and he reserveth wrath for his enemies. Yahuah (LORD) is slow to anger, and great in power, and will not at all acquit the wicked* (Nahum 1:2-3). This is the OTHER half of the creed Yahuah proclaimed at Sinai: *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth, Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:6-7). The creed itself holds both — He forgives iniquity AND *will by no means clear the guilty*; Nahum simply preaches the half Nineveh needed to hear. The jealousy is covenant zeal: *Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24). The NT does not soften this Yahuah but takes Him up word for word: *Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19); *Vengeance belongeth unto me, I will recompense, saith Yahuah (Lord). And again, Yahuah (Lord) shall judge his people* (Hebrews 10:30); *It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31). And Paul names both sides at once: *Behold therefore the goodness and severity of Elohim (God): on them which fell, severity; but toward thee, goodness* (Romans 11:22). The restored witness states the balance plainly: *for mercy and wrath come from him, and his indignation resteth upon sinners... suddenly shall the wrath of Yahuah (God) come forth... in the day of vengeance* (Sirach 5:6-7). Severity on the wicked is the just verdict on Nineveh''s evil — the necessary complement to the mercy, never caprice, never cruelty.',
       sv.verse_id, ev.verse_id, 'extras', 45500
  FROM _s334_nah01_lookup sv, _s334_nah01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-1-his-way-in-the-whirlwind-who-can-stand',
       E'His way in the whirlwind — the storm-theophany of the coming Judge, and who can stand',
       E'Nahum paints the descent of the Judge in storm: *Yahuah (LORD) hath his way in the whirlwind and in the storm, and the clouds are the dust of his feet. He rebuketh the sea, and maketh it dry, and drieth up all the rivers... The mountains quake at him, and the hills melt, and the earth is burned at his presence* (Nahum 1:3-5), and then the unanswerable question: *Who can stand before his indignation? and who can abide in the fierceness of his anger? his fury is poured out like fire* (1:6). This is the standing Tanakh picture of Yahuah coming down: *Then the earth shook and trembled... He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:7,9); *He stood, and measured the earth: he beheld, and drove asunder the nations; and the everlasting mountains were scattered* (Habakkuk 3:6); *the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire* (Micah 1:4). His rebuke of the sea is the Creator''s old power — *He rebuked the Red sea also, and it was dried up* (Psalm 106:9) — and the Formed Son does the very thing in the flesh: *Then he arose, and rebuked the winds and the sea; and there was a great calm* (Matthew 8:26). He who rebukes the sea in the boat is the Yahuah who rebukes it in the oracle; He is Yahuah and has a Father. And the question *Who can stand?* is the cry of the last day: *who shall stand when he appeareth? for he is like a refiner''s fire* (Malachi 3:2); *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17).',
       sv.verse_id, ev.verse_id, 'free', 45503
  FROM _s334_nah01_lookup sv, _s334_nah01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble',
       E'Yahuah is good, a strong hold in the day of trouble — the refuge amid the wrath',
       E'In the very middle of the judgment-oracle, in the same breath as the storm, stands the mercy: *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him* (Nahum 1:7). The flood that makes an utter end of Nineveh (1:8) is the shelter of the faithful — goodness and severity together. The Psalms sing the same refuge: *Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1); *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble. And they that know thy name will put their trust in thee: for thou, Yahuah (LORD), hast not forsaken them that seek thee* (Psalm 9:9-10); *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* (Psalm 34:8). And *he knoweth them that trust in him* is the divine knowing that divides the two ways — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) — and the seal Paul names on the sure foundation: *Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). The restored witness presses the promise: *did ever any trust in Yahuah (God), and was confounded? or... was forsaken?* (Sirach 2:10); *For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction* (Sirach 2:11). The day of trouble cannot shake the ones He knows.',
       sv.verse_id, ev.verse_id, 'extras', 45506
  FROM _s334_nah01_lookup sv, _s334_nah01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-1-the-feet-of-him-that-bringeth-good-tidings',
       E'The feet of him that bringeth good tidings — beautiful upon the mountains, the gospel of peace',
       E'The oracle of doom on Nineveh ends in good news for Yahudah: *Behold upon the mountains the feet of him that bringeth good tidings, that publisheth peace! O Yahudah (Judah), keep thy solemn feasts, perform thy vows: for the wicked shall no more pass through thee; he is utterly cut off* (Nahum 1:15). The good news is concrete — the oppressor cut off, the yoke broken: *now will I break his yoke from off thee, and will burst thy bonds in sunder* (1:13). This is the near-twin of Isaiah''s herald: *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7) — the same feet, the same mountains, the same published peace. And the NT gathers both into the gospel proclamation: *And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15). The shape is one across the library: deliverance accomplished, the adversary cut off, peace published abroad on the mountains — and the freed people restored to the worship of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 45509
  FROM _s334_nah01_lookup sv, _s334_nah01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-1-o-yahudah-keep-thy-solemn-feasts',
       E'O Yahudah, keep thy solemn feasts — the appointed times kept after deliverance, Torah affirmed',
       E'The herald''s good news lands on a command: *O Yahudah (Judah), keep thy solemn feasts, perform thy vows: for the wicked shall no more pass through thee; he is utterly cut off* (Nahum 1:15). The very point of the deliverance is freedom to keep the appointed times — the mo''adim KEPT after the oppressor is cut off, the Torah affirmed and never abolished. The solemn feasts are Yahuah''s own calendar: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2); *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons* (Leviticus 23:4). To *keep thy solemn feasts* is simple obedience to this word. And these same feasts run forward into the kingdom, kept even by the nations: *every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The good news is precisely the freedom to keep the calendar of Yahuah; the deliverance restores the feasts, it does not retire them — the appointed times are the worship of the age to come.',
       sv.verse_id, ev.verse_id, 'free', 45512
  FROM _s334_nah01_lookup sv, _s334_nah01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — the Sinai creed''s mercy-half; Nahum 1:2 preaches the avenging half of the SAME character.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *forgiving iniquity... and that will by no means clear the guilty* (Exodus 34:7) — the creed itself holds both; *will not at all acquit the wicked* (Nahum 1:3) is its other edge.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahuah thy Elohim is a consuming fire, even a jealous Elohim* (Deuteronomy 4:24) — the jealous fire of *Elohim is jealous, and Yahuah revengeth* (Nahum 1:2); covenant zeal, not caprice.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Vengeance is mine; I will repay, saith Yahuah* (Romans 12:19) — because *Yahuah revengeth* (Nahum 1:2), His people leave the avenging to Him.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Vengeance belongeth unto me, I will recompense, saith Yahuah... Yahuah shall judge his people* (Hebrews 10:30) — the avenging Yahuah of Nahum 1:2 is the unchanging Judge.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*a fearful thing to fall into the hands of the living Elohim* (Hebrews 10:31) — to be the adversary Yahuah *reserveth wrath for* (Nahum 1:2).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Behold therefore the goodness and severity of Elohim* (Romans 11:22) — Nahum''s whole oracle in one verse: *slow to anger... will not at all acquit the wicked* (Nahum 1:3).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *for mercy and wrath come from him, and his indignation resteth upon sinners* (Sirach 5:6) — the restored witness states Nahum''s balance; *Yahuah revengeth, and is furious* (Nahum 1:2) rests on sinners.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*suddenly shall the wrath of Yahuah come forth... in the day of vengeance* (Sirach 5:7) — the slowness of *slow to anger* (Nahum 1:3) is no acquittal of the wicked.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-jealous-yahuah-slow-to-anger-and-great-in-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the earth shook and trembled... because he was wroth* (Psalm 18:7) — the convulsing earth when Yahuah *hath his way in the whirlwind* (Nahum 1:3).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9) — the storm-cloud is the footstool; *the clouds are the dust of his feet* (Nahum 1:3).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He rebuked the Red sea also, and it was dried up* (Psalm 106:9) — the Creator''s old power; *He rebuketh the sea, and maketh it dry* (Nahum 1:4).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he... rebuked the winds and the sea; and there was a great calm* (Matthew 8:26) — the Formed Son does in the flesh what *He rebuketh the sea* (Nahum 1:4) says of Yahuah; He is Yahuah and has a Father.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the everlasting mountains were scattered, the perpetual hills did bow* (Habakkuk 3:6) — the same theophany; *The mountains quake at him, and the hills melt* (Nahum 1:5).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the mountains shall be molten under him... as wax before the fire* (Micah 1:4) — Nahum''s near-neighbor sees the same melting; *the hills melt, and the earth is burned at his presence* (Nahum 1:5).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *who shall stand when he appeareth? for he is like a refiner''s fire* (Malachi 3:2) — the same unanswerable question as *Who can stand before his indignation?* (Nahum 1:6).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17) — the last-day echo of *Who can stand before his indignation?* (Nahum 1:6); *his fury is poured out like fire* (1:6).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-his-way-in-the-whirlwind-who-can-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Elohim is our refuge and strength, a very present help in trouble* (Psalm 46:1) — the same refuge as *a strong hold in the day of trouble* (Nahum 1:7).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a refuge for the oppressed, a refuge in times of trouble* (Psalm 9:9) — Yahudah under Nineveh''s yoke finds the *strong hold in the day of trouble* (Nahum 1:7).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they that know thy name will put their trust in thee* (Psalm 9:10) — the mutual knowing of *he knoweth them that trust in him* (Nahum 1:7).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) — the divine knowing of *he knoweth them that trust in him* (Nahum 1:7) divides the two ways.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*O taste and see that Yahuah is good: blessed is the man that trusteth in him* (Psalm 34:8) — the goodness of *Yahuah is good* (Nahum 1:7) tasted by the one who trusts.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *the foundation of Elohim standeth sure, having this seal, Yahuah knoweth them that are his* (2 Timothy 2:19) — the seal is Nahum''s *he knoweth them that trust in him* (Nahum 1:7).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *did ever any trust in Yahuah, and was confounded?* (Sirach 2:10) — the restored witness presses *he knoweth them that trust in him* (Nahum 1:7).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Yahuah is full of compassion and mercy... and saves in time of affliction* (Sirach 2:11) — *Yahuah is good, a strong hold in the day of trouble* (Nahum 1:7); He saves in affliction.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-yahuah-is-good-a-strong-hold-in-the-day-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace... that saith unto Zion, Thy Elohim reigneth!* (Isaiah 52:7) — the near-twin of *the feet of him that bringeth good tidings, that publisheth peace* (Nahum 1:15).'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-feet-of-him-that-bringeth-good-tidings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15) — Paul gathers Nahum 1:15 and Isaiah 52:7 into the gospel proclamation; deliverance accomplished, peace published.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-the-feet-of-him-that-bringeth-good-tidings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Concerning the feasts of Yahuah... even these are my feasts* (Leviticus 23:2) — *keep thy solemn feasts* (Nahum 1:15) points back to Yahuah''s own appointed times; Torah affirmed, not abolished.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-o-yahudah-keep-thy-solemn-feasts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*These are the feasts of Yahuah... which ye shall proclaim in their seasons* (Leviticus 23:4) — *keep thy solemn feasts* (Nahum 1:15) is obedience to this word; the deliverance restores the people to the calendar of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-o-yahudah-keep-thy-solemn-feasts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *every one that is left of all the nations... shall even go up from year to year... to keep the feast of tabernacles* (Zechariah 14:16) — the feasts of *keep thy solemn feasts* (Nahum 1:15) run into the kingdom, kept even by the nations.'
  FROM cross_reference_threads t
  JOIN _s334_nah01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s334_nah01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-1-o-yahudah-keep-thy-solemn-feasts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nahum_2.sql (Nahum 2) -----
-- Chapter: Nahum 2 — THE SIEGE AND SACK OF NINEVEH, and the comfort hidden within the oracle:
-- THE RESTORATION OF THE EXCELLENCY OF JACOB AND ISRAEL. Even as Yahuah pronounces the doom of
-- the bloody Assyrian capital, He turns first to His own: *For Yahuah (LORD) hath turned away the
-- excellency of Jacob, as the excellency of Yashar'el (Israel): for the emptiers have emptied them
-- out, and marred their vine branches* (2:2) — the two houses, Jacob AND Yashar'el, whom the
-- Assyrian "emptiers" had plundered, are RESTORED; Yahuah avenges His people on the oppressor. Then
-- the war-oracle: the chariots rage with flaming torches, the river-gates are opened, the palace is
-- dissolved (2:3-6) — the day of Yahuah's reckoning on the violent empire (Isaiah 13, Jeremiah 51,
-- Revelation 18, the fall of the great city). Nineveh the predatory lion-empire that *did tear in
-- pieces enough for his whelps* (2:12) is now *empty, and void, and waste* (2:10) — buqah u-mevuqah,
-- the un-creation Genesis-1:2 tohu, the desolation Isaiah 24/34 and Zephaniah 2. And the verdict
-- that ends it: *Behold, I am against thee, saith Yahuah Tseva'ot (LORD of hosts)* (2:13) — Yahuah
-- Himself the adversary of the empire of blood (the "I am against thee" of Ezekiel 38-39, Jeremiah
-- 50). No empire stands when Yahuah is against it. Tobit, who lived in Nineveh's own captivity,
-- foretold and rejoiced over its fall — a clean restored witness to the proud city brought down.
-- Tag: nah02   Temp view: _s334_nah02_lookup
-- Sort band: base 45520, step 3 -> threads at 45520, 45523, 45526, 45529, 45532 (5 threads)
-- Source of EVERY row: 'canon','nahum',2,v
--
-- Nahum 2 coverage:
--   v.1 (He that dasheth in pieces is come up before thy face: keep the munition...)
--        NT:     none warranted (the assailant's approach — preface to the siege of THREAD 2)
--        Extras: none warranted
--        Tanakh: held in prose (the besieger arriving; folded into THREAD 2's siege)
--   ★ v.2 (For Yahuah hath turned away the excellency of Jacob, as the excellency of Yashar'el:
--          for the emptiers have emptied them out, and marred their vine branches)
--        NT:     none warranted (the two-house comfort is OT-weighted; NT regathering woven in prose)
--        Extras: none warranted distinct
--        Tanakh: ★ Isaiah 60:15 (I will make thee an eternal excellency), ★ Psalm 80:8-15 (the vine
--                out of Egypt, broken down and pleaded for), ★ Hosea 10:1 (Yashar'el an empty vine),
--                ★★ Ezekiel 37:19 + 37:22 (the two sticks made one, no more two nations) — THREAD 1
--   ★★ v.3-6 (the chariots with flaming torches... rage in the streets... run like the lightnings...
--          The gates of the rivers shall be opened, and the palace shall be dissolved)
--        NT:     ★★ Revelation 18:2 (Babylon the great is fallen, is fallen) — THREAD 2
--        Extras: none warranted (the empire-fall is heavily canon-witnessed; Tobit on Nineveh = THREAD 5)
--        Tanakh: ★ Isaiah 13:6 + 13:9 (the day of Yahuah... to lay the land desolate), ★ Jeremiah 51:8
--                + 51:58 (Babylon suddenly fallen... her high gates burned) — THREAD 2
--   v.7 (And Huzzab shall be led away captive... her maids shall lead her as with the voice of doves)
--        NT/Extras/Tanakh: none warranted (the captive city mourning — folded into THREAD 2/3 prose)
--   ★★ v.8-12 (But Nineveh is of old like a pool of water: yet they shall flee away... She is empty,
--          and void, and waste... Where is the dwelling of the lions... the lion did tear in pieces
--          enough for his whelps... and filled his holes with prey)
--        NT:     none warranted (the desolation is OT-imaged; the lion-empire judged within the oracle)
--        Extras: none warranted distinct (Tobit on Nineveh's fall = THREAD 5)
--        Tanakh: ★ Isaiah 24:1 (maketh the earth empty... and waste), ★ Isaiah 34:11 (the line of
--                confusion, and the stones of emptiness), ★ Genesis 1:2 (without form, and void = tohu),
--                ★★ Zephaniah 2:13 + 2:15 (make Nineveh a desolation... how is she become a
--                desolation) — THREAD 3
--   ★★ v.13 (Behold, I am against thee, saith Yahuah Tseva'ot, and I will burn her chariots in the
--          smoke, and the sword shall devour thy young lions... the voice of thy messengers shall
--          no more be heard)
--        NT:     ★ Revelation 18:8 (her plagues... in one day... she shall be utterly burned with
--                fire: for strong is Yahuah Elohim who judgeth her) — THREAD 4
--        Extras: ★ Tobit 14:4 + 14:15 (the destruction of Nineve... he rejoiced over Nineve) — THREAD 5
--        Tanakh: ★★ Ezekiel 38:3 + 39:1 (Behold, I am against thee, O Gog), ★ Jeremiah 50:31 (Behold,
--                I am against thee, O thou most proud) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel — Tanakh (Isaiah 60, Psalm 80,
--      Hosea 10, Ezekiel 37) [free] (★ the two-house restoration hidden in the Nineveh-oracle;
--      the marred vine restored, Jacob AND Yashar'el avenged on the emptiers)
--   2. nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened — Tanakh (Isaiah 13, Jeremiah 51)
--      + NT (Revelation 18) [free] (★★ the siege; the day of Yahuah's reckoning on the violent empire)
--   3. nahum-2-empty-void-and-waste-the-lions-den-plundered — Tanakh (Isaiah 24, Isaiah 34, Genesis 1,
--      Zephaniah 2) [free] (★★ Nineveh empty/void/waste = the un-creation tohu; the lion-empire torn)
--   4. nahum-2-behold-i-am-against-thee-saith-yahuah-tsevaot — Tanakh (Ezekiel 38-39, Jeremiah 50)
--      + NT (Revelation 18) [free] (★★ Yahuah Himself the adversary of the empire of blood)
--   5. nahum-2-nineveh-shall-be-overthrown-the-proud-city-falls — Extras (Tobit 14) [extras]
--      (★ Tobit, living in Nineveh's captivity, foretold and rejoiced over its fall — clean witness)
--
-- Framing notes:
--   ★ THE EXCELLENCY OF JACOB AND ISRAEL (THREAD 1): the comfort within the judgment. *For Yahuah
--      (LORD) hath turned away the excellency of Jacob, as the excellency of Yashar'el (Israel): for
--      the emptiers have emptied them out, and marred their vine branches* (2:2). BOTH houses named —
--      Jacob AND Yashar'el — the two-house people whom Assyria emptied; the marred vine is the vine
--      Yahuah brought out of Egypt (Psalm 80:8) and pleads to restore (80:14-15). Yahuah turns away
--      (restores) their excellency: *I will make thee an eternal excellency, a joy of many generations*
--      (Isaiah 60:15). And the regathering is the two sticks made one: *I will take the stick of
--      Joseph... and the stick of Yahudah (Judah)... and make them one stick* (Ezekiel 37:19); *they
--      shall be no more two nations* (37:22). Never replacement — Yahuah's own two houses restored.
--   ★★ THE SIEGE / THE DAY OF YAHUAH ON THE EMPIRE (THREAD 2): the river-gates breached. *The gates
--      of the rivers shall be opened, and the palace shall be dissolved* (2:6) — the Khosr/Tigris
--      flood that took Nineveh. The proud city's defenses fail before Yahuah's appointed reckoning,
--      the same day-of-Yahuah that fells Babylon: *the day of Yahuah (LORD) cometh... to lay the land
--      desolate* (Isaiah 13:9); *Babylon is suddenly fallen and destroyed* (Jeremiah 51:8); *her high
--      gates shall be burned with fire* (51:58); *Babylon the great is fallen, is fallen* (Revelation
--      18:2). Every violent empire falls the same way.
--   ★★ EMPTY, VOID, AND WASTE — THE LION'S DEN (THREAD 3): *She is empty, and void, and waste* (2:10,
--      buqah u-mevuqah u-mevullaqah) — the un-creation reversal of the proud. The same waste Yahuah
--      brings on the earth-judged (*maketh the earth empty... and waste*, Isaiah 24:1), the *line of
--      confusion, and the stones of emptiness* (Isaiah 34:11), back to the formless *without form, and
--      void* of Genesis 1:2 (tohu). The lion-empire that devoured the nations — *the lion did tear in
--      pieces enough for his whelps* (2:12) — is named for desolation: *will make Nineveh a desolation*
--      (Zephaniah 2:13); *how is she become a desolation* (2:15). The violent who lived by tearing are torn.
--   ★★ BEHOLD, I AM AGAINST THEE (THREAD 4): the verdict. *Behold, I am against thee, saith Yahuah
--      Tseva'ot (LORD of hosts)* (2:13). The same divine adversary-word over Gog — *Behold, I am
--      against thee, O Gog* (Ezekiel 38:3; 39:1) — and over proud Babylon — *Behold, I am against
--      thee, O thou most proud* (Jeremiah 50:31). And the burning: *she shall be utterly burned with
--      fire: for strong is Yahuah Elohim (the Lord God) who judgeth her* (Revelation 18:8). No empire
--      stands when Yahuah is against it.
--   ★ TOBIT ON NINEVEH'S FALL (THREAD 5, EXTRAS): Tobit, carried captive into Nineveh itself,
--      foretold and lived to rejoice over its overthrow: *I surely believe those things which Jonas
--      the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4); *before he died he
--      heard of the destruction of Nineve... and before his death he rejoiced over Nineve* (14:15).
--      A clean restored witness — the captive's own testimony that the bloody city fell as Yahuah said.
--   VERSES WITH NO SEPARATE ADD: v.1 (the besieger come up — preface to THREAD 2), v.7 (Huzzab led
--      captive, the maids mourning — folded into THREAD 2/3), v.9 (take ye the spoil — the plunder
--      within THREAD 3's lion's-den). All recorded, none silently skipped.

CREATE TEMP VIEW _s334_nah02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The excellency of Jacob, as the excellency of Yashar'el — the two-house restoration
    ('canon','nahum',2,2,'canon','isaiah',60,15,'free',
      E'*Whereas thou hast been forsaken and hated, so that no man went through thee, I will make thee an eternal excellency, a joy of many generations* (Isaiah 60:15). The *excellency of Jacob* that Yahuah *hath turned away* — restored — in *For Yahuah (LORD) hath turned away the excellency of Jacob, as the excellency of Yashar''el (Israel)* (Nahum 2:2) is the very *eternal excellency* of Zion forsaken-then-glorified. The emptiers plundered her; Yahuah makes her excellency stand for ever.'),
    ('canon','nahum',2,2,'canon','psalms',80,8,'free',
      E'*Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* (Psalm 80:8). Nahum''s lament that the emptiers *marred their vine branches* (Nahum 2:2) is the marring of this very vine — the vine Yahuah brought out of Egypt and planted. The two houses are the planted vine; the Assyrian is the boar that wastes it (Psalm 80:13).'),
    ('canon','nahum',2,2,'canon','psalms',80,15,'free',
      E'*And the vineyard which thy right hand hath planted, and the branch that thou madest strong for thyself* (Psalm 80:15). The plea of the broken vine — *Return, we beseech thee, O Elohim (God) of hosts... and visit this vine* (80:14) — answers Nahum''s *for the emptiers have emptied them out, and marred their vine branches* (Nahum 2:2). Yahuah turns away (restores) the excellency of the marred vine His right hand planted.'),
    ('canon','nahum',2,2,'canon','hosea',10,1,'free',
      E'*Yashar''el (Israel) is an empty vine, he bringeth forth fruit unto himself: according to the multitude of his fruit he hath increased the altars* (Hosea 10:1). The *vine branches* the emptiers *marred* (Nahum 2:2) are the vine of Yashar''el — the northern house emptied and scattered by Assyria; yet Yahuah turns away their excellency to restore it. The emptied vine of Hosea is the marred vine Nahum says Yahuah avenges.'),
    ('canon','nahum',2,2,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). Nahum names BOTH houses — *the excellency of Jacob, as the excellency of Yashar''el (Israel)* (Nahum 2:2) — Jacob (Yahudah) and Yashar''el (Ephraim/Joseph), the two sticks Yahuah restores and makes one. The comfort in the oracle is the two-house regathering.'),
    ('canon','nahum',2,2,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two excellencies of *Jacob* and *Yashar''el (Israel)* (Nahum 2:2) become one nation under one King — never two replacement peoples, but the one house of Yahuah, both branches Yashar''el, gathered home and made one.'),

    -- THREAD 2 (★★): The chariots rage, the gates of the rivers opened — the day of Yahuah on the empire
    ('canon','nahum',2,6,'canon','jeremiah',51,58,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts); The broad walls of Babylon shall be utterly broken, and her high gates shall be burned with fire; and the people shall labour in vain, and the folk in the fire, and they shall be weary* (Jeremiah 51:58). Nineveh''s *gates of the rivers shall be opened, and the palace shall be dissolved* (Nahum 2:6) is the same fall Yahuah brings on every proud capital — *her high gates shall be burned with fire*. The breached gates and dissolved palace are the empire''s defenses failing before the appointed reckoning.'),
    ('canon','nahum',2,5,'canon','jeremiah',51,8,'free',
      E'*Babylon is suddenly fallen and destroyed: howl for her; take balm for her pain, if so be she may be healed* (Jeremiah 51:8). The frantic defence of Nineveh — *they shall stumble in their walk; they shall make haste to the wall thereof, and the defence shall be prepared* (Nahum 2:5) — collapses suddenly, as Babylon *is suddenly fallen and destroyed*. The proud city''s scramble to the wall cannot stay the sudden ruin Yahuah appoints.'),
    ('canon','nahum',2,3,'canon','isaiah',13,9,'free',
      E'*Behold, the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate: and he shall destroy the sinners thereof out of it* (Isaiah 13:9). The chariots *with flaming torches in the day of his preparation* (Nahum 2:3) are the instruments of the day of Yahuah — the same *day of Yahuah (LORD)* that comes upon Babylon *to lay the land desolate*. The siege of Nineveh is the reckoning-day of the violent empire.'),
    ('canon','nahum',2,4,'canon','isaiah',13,6,'free',
      E'*Howl ye; for the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6). The chariots that *rage in the streets... run like the lightnings* (Nahum 2:4) are the day-of-Yahuah destruction at hand — *a destruction from the Almighty*. The lightning-swift assault is Yahuah''s own reckoning loosed on the city of blood.'),
    ('canon','nahum',2,6,'canon','revelation',18,2,'free',
      E'*And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird* (Revelation 18:2). Nineveh whose *palace shall be dissolved* (Nahum 2:6) is the type of *Babylon the great* — every violent empire that exalts itself falls *is fallen, is fallen*. The breached city of Nahum prefigures the fall of the great city at the end.'),

    -- THREAD 3 (★★): Empty, void, and waste — the lion's den plundered (the un-creation tohu)
    ('canon','nahum',2,10,'canon','isaiah',24,1,'free',
      E'*Behold, Yahuah (LORD) maketh the earth empty, and maketh it waste, and turneth it upside down, and scattereth abroad the inhabitants thereof* (Isaiah 24:1). Nineveh *empty, and void, and waste* (Nahum 2:10) is the very desolation Yahuah brings — He *maketh the earth empty... and waste*. The proud city is un-made; the same emptying-and-wasting word over the rebellious earth.'),
    ('canon','nahum',2,10,'canon','isaiah',34,11,'free',
      E'*But the cormorant and the bittern shall possess it; the owl also and the raven shall dwell in it: and he shall stretch out upon it the line of confusion, and the stones of emptiness* (Isaiah 34:11). *She is empty, and void, and waste* (Nahum 2:10) is measured by the same surveyor''s cord of ruin — *the line of confusion, and the stones of emptiness* (tohu and bohu) — stretched over the city of judgment. Nineveh is reduced to the emptiness Yahuah lays upon the proud.'),
    ('canon','nahum',2,10,'canon','genesis',1,2,'free',
      E'*And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). Nahum''s *empty, and void, and waste* (Nahum 2:10) reaches back to creation''s *without form, and void* — tohu va-bohu. The judgment on Nineveh is an un-creation: the proud city returned to the formless waste from which Elohim brought order, the reversal of the violent.'),
    ('canon','nahum',2,11,'canon','zephaniah',2,13,'free',
      E'*And he will stretch out his hand against the north, and destroy Assyria; and will make Nineveh a desolation, and dry like a wilderness* (Zephaniah 2:13). The lion''s den of Nahum — *Where is the dwelling of the lions, and the feedingplace of the young lions* (Nahum 2:11) — is the very Nineveh Zephaniah names for desolation: Yahuah *will make Nineveh a desolation, and dry like a wilderness*. The predator''s lair is emptied of its lions.'),
    ('canon','nahum',2,12,'canon','zephaniah',2,15,'free',
      E'*This is the rejoicing city that dwelt carelessly, that said in her heart, I am, and there is none beside me: how is she become a desolation, a place for beasts to lie down in! every one that passeth by her shall hiss, and wag his hand* (Zephaniah 2:15). The lion that *did tear in pieces enough for his whelps... and filled his holes with prey* (Nahum 2:12) is the careless self-exalting city — *I am, and there is none beside me* — brought to desolation. The empire that lived by tearing becomes a den of beasts and a hissing.'),

    -- THREAD 4 (★★): Behold, I am against thee, saith Yahuah Tseva'ot — Yahuah the adversary of the empire
    ('canon','nahum',2,13,'canon','ezekiel',38,3,'free',
      E'*And say, Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against thee, O Gog, the chief prince of Meshech and Tubal* (Ezekiel 38:3). Nahum''s verdict on Nineveh — *Behold, I am against thee, saith Yahuah Tseva''ot (LORD of hosts)* (Nahum 2:13) — is the same divine adversary-word Yahuah speaks over the great enemy-power Gog: *Behold, I am against thee*. When Yahuah Himself is the adversary, no empire can stand.'),
    ('canon','nahum',2,13,'canon','ezekiel',39,1,'free',
      E'*Therefore, thou son of Adam, prophesy against Gog, and say, Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against thee, O Gog, the chief prince of Meshech and Tubal* (Ezekiel 39:1). The *Behold, I am against thee, saith Yahuah Tseva''ot* (Nahum 2:13) over Nineveh is the repeated sentence over Gog — *Behold, I am against thee*. Yahuah is the personal adversary of every violent, blood-built power; their chariots burn in the smoke before Him.'),
    ('canon','nahum',2,13,'canon','jeremiah',50,31,'free',
      E'*Behold, I am against thee, O thou most proud, saith Adonai Yahuah (the Lord GOD) of hosts: for thy day is come, the time that I will visit thee* (Jeremiah 50:31). The word over Nineveh — *Behold, I am against thee, saith Yahuah Tseva''ot (LORD of hosts)* (Nahum 2:13) — is spoken word-for-word over proud Babylon: *Behold, I am against thee, O thou most proud*. The day of the violent empire comes; Yahuah of hosts visits it.'),
    ('canon','nahum',2,13,'canon','revelation',18,8,'free',
      E'*Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her* (Revelation 18:8). Nahum''s *I will burn her chariots in the smoke* (Nahum 2:13) is the same burning of the great city — *she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her*. Yahuah against the empire means the empire goes up in smoke; strong is the One who judges her.'),

    -- THREAD 5 (★, EXTRAS): Nineveh shall be overthrown — Tobit foretells and rejoices over the fall
    ('canon','nahum',2,8,'apocrypha','tobit',14,4,'extras',
      E'*Go into Media my son, for I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown... and that our brothers shall lie scattered in the earth from that good land: and Jerusalem shall be desolate, and the house of Yahuah (God) in it shall be burned* (Tobit 14:4). Nahum''s *yet they shall flee away. Stand, stand, shall they cry; but none shall look back* (Nahum 2:8) is the very overthrow Tobit, a captive in Nineveh, surely believed was coming — *that it shall be overthrown*. The restored witness of the exile confirms the prophet''s word: the city of the emptiers will itself be emptied.'),
    ('canon','nahum',2,13,'apocrypha','tobit',14,15,'extras',
      E'*But before he died he heard of the destruction of Nineve, which was taken by Nabuchodonosor and Assuerus: and before his death he rejoiced over Nineve* (Tobit 14:15). When Yahuah said *Behold, I am against thee, saith Yahuah Tseva''ot (LORD of hosts)* (Nahum 2:13), the doom was sure — and Tobit, carried captive into Nineveh itself, lived to hear *the destruction of Nineve* and *rejoiced over Nineve*. The captive''s own testimony seals the oracle: the bloody city fell exactly as Yahuah had spoken.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s334_nah02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s334_nah02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel',
       E'The excellency of Jacob, as the excellency of Yashar''el — the two houses restored',
       E'Even in the oracle that dooms Nineveh, Yahuah turns first to comfort His own — and He names BOTH houses: *For Yahuah (LORD) hath turned away the excellency of Jacob, as the excellency of Yashar''el (Israel): for the emptiers have emptied them out, and marred their vine branches* (Nahum 2:2). Jacob and Yashar''el — Yahudah (Judah) the south and Yashar''el/Ephraim/Joseph the north — the two-house people whom the Assyrian "emptiers" plundered. The *marred vine branches* are the vine Yahuah planted: *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* (Psalm 80:8), the vine broken down and pleaded for — *the vineyard which thy right hand hath planted, and the branch that thou madest strong for thyself* (80:15) — and Yashar''el the *empty vine* of Hosea 10:1. To "turn away" their excellency is to RESTORE it: *Whereas thou hast been forsaken and hated... I will make thee an eternal excellency, a joy of many generations* (Isaiah 60:15). And the regathering of the two houses is the two sticks made one: *I will take the stick of Joseph, which is in the hand of Ephraim... and the stick of Yahudah (Judah)... and make them one stick* (Ezekiel 37:19); *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (37:22). This is no replacement people — it is Yahuah''s own two houses, the marred vine, avenged on the oppressor and gathered home.',
       sv.verse_id, ev.verse_id, 'free', 45520
  FROM _s334_nah02_lookup sv, _s334_nah02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened',
       E'The chariots rage, the gates of the rivers opened — the day of Yahuah on the empire',
       E'The siege falls on the proud city in unstoppable fury: *The shield of his mighty men is made red... the chariots shall be with flaming torches in the day of his preparation... The chariots shall rage in the streets, they shall justle one against another in the broad ways: they shall seem like torches, they shall run like the lightnings* (Nahum 2:3-4). The defence is mustered but it stumbles — *they shall make haste to the wall thereof, and the defence shall be prepared* (2:5) — and then the decisive breach: *The gates of the rivers shall be opened, and the palace shall be dissolved* (2:6), the Khosr and Tigris loosed to take the city. This is the day of Yahuah''s reckoning on the violent empire, the same day that fells every proud capital: *Howl ye; for the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6); *Behold, the day of Yahuah (LORD) cometh... to lay the land desolate* (13:9). It comes suddenly, beyond all defence: *Babylon is suddenly fallen and destroyed* (Jeremiah 51:8); *her high gates shall be burned with fire* (51:58). And it is the pattern of the end: *Babylon the great is fallen, is fallen* (Revelation 18:2). The river-gates of Nineveh, the burned gates of Babylon, the fall of the great city — one reckoning, one Almighty, against every empire built on blood.',
       sv.verse_id, ev.verse_id, 'free', 45523
  FROM _s334_nah02_lookup sv, _s334_nah02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-2-empty-void-and-waste-the-lions-den-plundered',
       E'Empty, void, and waste — the lion''s den plundered, the un-creation of the proud',
       E'Nineveh, *of old like a pool of water* (Nahum 2:8), is drained to nothing: *She is empty, and void, and waste: and the heart melteth, and the knees smite together... and the faces of them all gather blackness* (2:10) — buqah u-mevuqah u-mevullaqah, three words of un-making piled one on another. This is the desolation Yahuah lays on the proud: *Behold, Yahuah (LORD) maketh the earth empty, and maketh it waste, and turneth it upside down* (Isaiah 24:1); the surveyor''s cord of ruin stretched over it — *the line of confusion, and the stones of emptiness* (Isaiah 34:11, tohu and bohu); reaching all the way back to creation''s formless deep — *And the earth was without form, and void* (Genesis 1:2). The proud city is un-created, returned to the waste from which Elohim brought order. And the predator''s lair is stripped: *Where is the dwelling of the lions, and the feedingplace of the young lions... The lion did tear in pieces enough for his whelps, and strangled for his lionesses, and filled his holes with prey, and his dens with ravin* (2:11-12) — the lion-empire that devoured the nations. Zephaniah names its end: *will make Nineveh a desolation, and dry like a wilderness* (2:13); the careless city that said *I am, and there is none beside me* — *how is she become a desolation, a place for beasts to lie down in!* (2:15). The violent who lived by tearing are themselves torn down to the void.',
       sv.verse_id, ev.verse_id, 'free', 45526
  FROM _s334_nah02_lookup sv, _s334_nah02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-2-behold-i-am-against-thee-saith-yahuah-tsevaot',
       E'Behold, I am against thee, saith Yahuah Tseva''ot — Yahuah the adversary of the empire',
       E'The oracle ends in a single dreadful sentence: *Behold, I am against thee, saith Yahuah Tseva''ot (LORD of hosts), and I will burn her chariots in the smoke, and the sword shall devour thy young lions: and I will cut off thy prey from the earth, and the voice of thy messengers shall no more be heard* (Nahum 2:13). It is not armies that undo Nineveh — it is Yahuah Himself the adversary. This is the same divine word spoken over the great enemy-power Gog: *Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against thee, O Gog, the chief prince of Meshech and Tubal* (Ezekiel 38:3); *prophesy against Gog... Behold, I am against thee* (39:1); and over proud Babylon, word for word: *Behold, I am against thee, O thou most proud, saith Adonai Yahuah (the Lord GOD) of hosts: for thy day is come* (Jeremiah 50:31). And it ends as it always ends, in fire: *she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her* (Revelation 18:8). When Yahuah of hosts is the adversary, the chariots burn in the smoke, the messengers fall silent, and no empire of blood stands.',
       sv.verse_id, ev.verse_id, 'free', 45529
  FROM _s334_nah02_lookup sv, _s334_nah02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★, EXTRAS)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-2-nineveh-shall-be-overthrown-the-proud-city-falls',
       E'Nineveh shall be overthrown — Tobit, the captive, rejoices over the fall',
       E'Nahum''s war-oracle ends with the city fled and silenced — *yet they shall flee away. Stand, stand, shall they cry; but none shall look back* (Nahum 2:8) — and the sentence of Yahuah hanging over it: *Behold, I am against thee, saith Yahuah Tseva''ot (LORD of hosts)* (2:13). The restored witness places a believer inside that very city, in the Assyrian captivity, who held the prophets'' word as sure: *I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown... and that our brothers shall lie scattered in the earth from that good land: and Jerusalem shall be desolate, and the house of Yahuah (God) in it shall be burned* (Tobit 14:4). Tobit, a captive of the empire of the emptiers, believed the emptier would itself be emptied — and he lived to see it: *But before he died he heard of the destruction of Nineve, which was taken by Nabuchodonosor and Assuerus: and before his death he rejoiced over Nineve* (14:15). The captive''s own testimony seals the oracle Nahum spoke: the bloody city fell exactly as Yahuah said, and the faithful who suffered under her rejoiced to see Yahuah avenge His people.',
       sv.verse_id, ev.verse_id, 'extras', 45532
  FROM _s334_nah02_lookup sv, _s334_nah02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will make thee an eternal excellency, a joy of many generations* (Isaiah 60:15) — the *excellency of Jacob* Yahuah *hath turned away* (Nahum 2:2) is the eternal excellency of the forsaken-then-glorified people.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou hast brought a vine out of Egypt... and planted it* (Psalm 80:8) — the *marred vine branches* (Nahum 2:2) are this planted vine the emptiers wasted.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the vineyard which thy right hand hath planted, and the branch that thou madest strong for thyself* (Psalm 80:15) — Yahuah restores the marred vine (Nahum 2:2) His own right hand planted.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yashar''el (Israel) is an empty vine* (Hosea 10:1) — the marred, emptied vine of Nahum 2:2 is the northern house, emptied by Assyria yet not abandoned.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I will take the stick of Joseph... and the stick of Yahudah (Judah)... and make them one stick* (Ezekiel 37:19) — Nahum names BOTH houses (*Jacob* and *Yashar''el*, 2:2); the two sticks Yahuah restores and makes one.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *they shall be no more two nations* (Ezekiel 37:22) — the two excellencies of Jacob and Yashar''el (Nahum 2:2) become one nation under one King; never replacement, both branches Yashar''el restored.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-excellency-of-jacob-as-the-excellency-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6) — the chariots running *like the lightnings* (Nahum 2:4) are the day-of-Yahuah destruction loosed.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the day of Yahuah (LORD) cometh... to lay the land desolate* (Isaiah 13:9) — the chariots *in the day of his preparation* (Nahum 2:3) serve the same reckoning-day on the empire.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Babylon is suddenly fallen and destroyed* (Jeremiah 51:8) — Nineveh''s frantic *haste to the wall* (Nahum 2:5) cannot stay the sudden ruin Yahuah appoints.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *her high gates shall be burned with fire* (Jeremiah 51:58) — the *gates of the rivers... opened, and the palace... dissolved* (Nahum 2:6) is the same fall of the proud capital.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Babylon the great is fallen, is fallen* (Revelation 18:2) — Nineveh whose *palace shall be dissolved* (Nahum 2:6) is the type of the great city''s end; every violent empire falls the same way.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-the-chariots-rage-the-gates-of-the-rivers-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (LORD) maketh the earth empty, and maketh it waste* (Isaiah 24:1) — Nineveh *empty, and void, and waste* (Nahum 2:10) is the very emptying-and-wasting Yahuah brings on the proud.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-empty-void-and-waste-the-lions-den-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the line of confusion, and the stones of emptiness* (Isaiah 34:11) — *empty, and void, and waste* (Nahum 2:10) is the tohu-and-bohu cord of ruin stretched over the city.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-empty-void-and-waste-the-lions-den-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *And the earth was without form, and void* (Genesis 1:2) — Nineveh''s *empty, and void, and waste* (Nahum 2:10) is an un-creation, the proud city returned to the formless tohu.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-empty-void-and-waste-the-lions-den-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *will make Nineveh a desolation, and dry like a wilderness* (Zephaniah 2:13) — the *dwelling of the lions* (Nahum 2:11) is the very Nineveh Zephaniah names for desolation.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-empty-void-and-waste-the-lions-den-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *how is she become a desolation, a place for beasts to lie down in!* (Zephaniah 2:15) — the lion that *did tear in pieces enough for his whelps* (Nahum 2:12) is the careless self-exalting city brought to ruin.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-empty-void-and-waste-the-lions-den-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Behold, I am against thee, O Gog* (Ezekiel 38:3) — the same adversary-word Yahuah speaks over Nineveh, *Behold, I am against thee, saith Yahuah Tseva''ot* (Nahum 2:13).'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-behold-i-am-against-thee-saith-yahuah-tsevaot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *prophesy against Gog... Behold, I am against thee* (Ezekiel 39:1) — the repeated sentence over the violent power; Yahuah the personal adversary of the empire of blood (Nahum 2:13).'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-behold-i-am-against-thee-saith-yahuah-tsevaot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Behold, I am against thee, O thou most proud... for thy day is come* (Jeremiah 50:31) — the same word over proud Babylon as over Nineveh (Nahum 2:13); the day of the violent empire comes.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-behold-i-am-against-thee-saith-yahuah-tsevaot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her* (Revelation 18:8) — Nahum''s *I will burn her chariots in the smoke* (Nahum 2:13); when Yahuah is against the empire, it goes up in fire.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-behold-i-am-against-thee-saith-yahuah-tsevaot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★, EXTRAS)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4) — the captive in Nineveh believed the city of the emptiers would itself be emptied (Nahum 2:8); the restored witness holds the prophet''s word as sure.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-nineveh-shall-be-overthrown-the-proud-city-falls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *before his death he rejoiced over Nineve* (Tobit 14:15) — when Yahuah said *I am against thee* (Nahum 2:13), the doom was sure; the captive lived to hear *the destruction of Nineve* and rejoiced that Yahuah avenged His people.'
  FROM cross_reference_threads t
  JOIN _s334_nah02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s334_nah02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-2-nineveh-shall-be-overthrown-the-proud-city-falls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nahum_3.sql (Nahum 3) -----
-- Chapter: Nahum 3 — WOE TO THE BLOODY CITY; the harlot of witchcrafts; Nineveh's fall complete,
-- none to bemoan her. *Woe to the bloody city! it is all full of lies and robbery; the prey
-- departeth not* (3:1); *Behold, I am against thee, saith Yahuah Tseva'ot (LORD of hosts); and I
-- will discover thy skirts upon thy face, and I will shew the nations thy nakedness* (3:5) —
-- Nineveh the seductive harlot-empire, *the mistress of witchcrafts, that selleth nations through
-- her whoredoms* (3:4), exposed and shamed; the TYPE of the end-time Babylon-harlot of Revelation
-- 17-18. *Art thou better than populous No* (3:8) — even mighty Thebes fell, no fortress is secure.
-- *All thy strong holds shall be like fig trees with the firstripe figs: if they be shaken, they
-- shall even fall* (3:12). And the close: *There is no healing of thy bruise; thy wound is grievous:
-- all that hear the bruit of thee shall clap the hands over thee* (3:19) — the incurable fall of the
-- perpetual oppressor, the nations relieved. Victims-not-enemies: the systems of violence dismantled.
-- Tag: nah03   Temp view: _s334_nah03_lookup
-- Sort band: base 45540, step 3 -> threads at 45540, 45543, 45546, 45549, 45552 (5 threads)
-- Source of EVERY row: 'canon','nahum',3,v
--
-- Nahum 3 coverage:
--   ★★ v.1-3 (Woe to the bloody city! it is all full of lies and robbery; the prey departeth not...
--          there is a multitude of slain... none end of their corpses)
--        NT:     ★★ Revelation 18:24 (in her was found the blood of prophets, and of saints, and of
--                all that were slain upon the earth) — THREAD 1 (the bloody city's blood-guilt judged)
--        Extras: none warranted (Tobit's Nineveh witness woven on the FALL, THREAD 5)
--        Tanakh: ★★ Ezekiel 24:6 (Woe to the bloody city, to the pot whose scum is therein) +
--                Ezekiel 24:9 (Woe to the bloody city! I will even make the pile for fire great),
--                ★ Habakkuk 2:12 (Woe to him that buildeth a town with blood) — THREAD 1
--   ★★ v.4-6 (the multitude of the whoredoms of the wellfavoured harlot, the mistress of
--          witchcrafts, that selleth nations... Behold, I am against thee... I will shew the nations
--          thy nakedness)
--        NT:     ★★★ Revelation 17:1-2 (the great whore that sitteth upon many waters: With whom the
--                kings of the earth have committed fornication) + 17:5 (MYSTERY, BABYLON THE GREAT,
--                THE MOTHER OF HARLOTS) + 18:3 (by thy sorceries were all nations deceived / all
--                nations have drunk of the wine of the wrath of her fornication) — THREAD 2
--        Extras: none warranted clean (Wisdom-on-sorcery not pulled as member; held in prose)
--        Tanakh: ★★ Isaiah 47:9 (for the multitude of thy sorceries, and for the great abundance of
--                thine enchantments) — THREAD 2 (Babylon's sorceries, the lady-of-kingdoms exposed)
--   ★ v.7 (Nineveh is laid waste: who will bemoan her? whence shall I seek comforters for thee?)
--        NT:     none warranted distinct (the none-to-mourn close woven with v.19, THREAD 5)
--        Extras: ★ Tobit 14:15 (he heard of the destruction of Nineve... he rejoiced over Nineve) — THREAD 5
--        Tanakh: ★ Zephaniah 2:13,15 (make Nineveh a desolation... how is she become a desolation) — THREAD 5
--   ★ v.8-10 (Art thou better than populous No... Ethiopia and Egypt were her strength... yet was
--          she carried away, she went into captivity)
--        NT:     none warranted (no-fortress-is-secure is a Tanakh-internal precedent weave)
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 46:25 (I will punish the multitude of No, and Pharaoh, and Egypt), ★ Psalm
--                20:7 (Some trust in chariots, and some in horses: but we will remember the name of
--                Yahuah Eloheinu) — THREAD 3 (No-Amon's precedent; the futility of trusting strongholds)
--   ★ v.11-13 (Thou also shalt be drunken... the gates of thy land shall be set wide open... the
--          fire shall devour thy bars) and v.12 the firstripe figs
--        NT:     ★ Revelation 6:13 (the stars of heaven fell... even as a fig tree casteth her
--                untimely figs, when she is shaken of a mighty wind) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Isaiah 34:4 (all their host shall fall down... as a falling fig from the fig
--                tree) — THREAD 4 (the easy fall of the proud defenses at a shake)
--   v.14-18 (Draw thee waters for the siege... the cankerworm... thy crowned are as the locusts...
--          thy shepherds slumber, O king of Assyria: thy people is scattered, no man gathereth them)
--        NT:     none warranted distinct
--        Extras: none warranted
--        Tanakh: held in prose — the locust-merchants and slumbering shepherds are the empire
--                emptying out; the siege-prep is futile (the fall is THREAD 4/5); no separate add forced
--   ★★ v.19 (There is no healing of thy bruise; thy wound is grievous: all that hear the bruit of
--          thee shall clap the hands over thee: for upon whom hath not thy wickedness passed
--          continually?)
--        NT:     none warranted distinct (the relief-of-the-oppressed close is Tanakh + Tobit witness)
--        Extras: ★ Tobit 14:15 (rejoiced over Nineve) — THREAD 5
--        Tanakh: ★★ Jeremiah 30:12-13 (Thy bruise is incurable... thou hast no healing medicines) AS
--                CONTRAST — Israel's wound IS healed (30:17 I will restore health unto thee), Nineveh's
--                is not; ★ Zephaniah 2:13,15 — THREAD 5
--
-- Threads (slug — target libraries):
--   1. nahum-3-woe-to-the-bloody-city-full-of-lies — NT (Revelation 18) + Tanakh (Ezekiel 24, Habakkuk 2) [free]
--      (★★ the bloody city full of lies; the blood-guilt of the violent deceitful empire judged)
--   2. nahum-3-the-harlot-of-witchcrafts-i-am-against-thee — NT (Revelation 17, 18) + Tanakh (Isaiah 47) [free]
--      (★★★ the harlot of witchcrafts exposed — Nineveh the TYPE of Babylon the Great, MOTHER OF HARLOTS)
--   3. nahum-3-art-thou-better-than-populous-no — Tanakh (Jeremiah 46, Psalm 20) [free]
--      (★ No-Amon's precedent; even mighty Thebes fell — the futility of trusting strongholds)
--   4. nahum-3-strong-holds-like-fig-trees-shaken — NT (Revelation 6) + Tanakh (Isaiah 34) [free]
--      (★ the defenses fall at a shake, the untimely figs cast down)
--   5. nahum-3-no-healing-of-thy-bruise-none-to-bemoan — Extras (Tobit 14) + Tanakh (Jeremiah 30, Zephaniah 2) [extras]
--      (★★ the incurable bruise / none to bemoan her — Nineveh's wound NOT healed, contrast Israel's IS)
--
-- Framing notes:
--   ★★ THE BLOODY CITY (THREAD 1): *Woe to the bloody city! it is all full of lies and robbery; the
--      prey departeth not* (3:1). The very phrase is Ezekiel's against Jerusalem-of-blood — *Woe to
--      the bloody city, to the pot whose scum is therein* (Ezekiel 24:6); *Woe to the bloody city! I
--      will even make the pile for fire great* (Ezekiel 24:9) — and Habakkuk's against the violent
--      builder: *Woe to him that buildeth a town with blood, and stablisheth a city by iniquity!*
--      (Habakkuk 2:12). The judgment lands at last on Babylon the Great: *in her was found the blood of
--      prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). The
--      systems of violence and lies are dismantled — victims-not-enemies; the blood cries from the ground.
--   ★★★ THE HARLOT OF WITCHCRAFTS (THREAD 2): *Because of the multitude of the whoredoms of the
--      wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms,
--      and families through her witchcrafts. Behold, I am against thee, saith Yahuah Tseva'ot (LORD of
--      hosts); and I will discover thy skirts upon thy face, and I will shew the nations thy nakedness*
--      (3:4-5). Nineveh is the seductive harlot-empire, exposed and shamed — the TYPE of the end-time
--      harlot-system John sees: *Come hither; I will shew unto thee the judgment of the great whore
--      that sitteth upon many waters: With whom the kings of the earth have committed fornication*
--      (Revelation 17:1-2); *upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE
--      MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (17:5); *by thy sorceries were all nations
--      deceived* (18:3). And Babylon's own sorceries fall in Isaiah: *for the multitude of thy
--      sorceries, and for the great abundance of thine enchantments* (Isaiah 47:9). One harlot-city,
--      selling nations by witchcraft, stripped naked before the nations she seduced.
--   ★ ART THOU BETTER THAN NO-AMON (THREAD 3): *Art thou better than populous No, that was situate
--      among the rivers... Ethiopia and Egypt were her strength, and it was infinite... Yet was she
--      carried away, she went into captivity* (3:8-10). Even mighty Thebes, with Egypt and Ethiopia for
--      strength, fell — the precedent that no fortress is secure: *Behold, I will punish the multitude
--      of No, and Pharaoh, and Egypt, with their gods* (Jeremiah 46:25); and the psalmist names the only
--      sure trust: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah
--      Eloheinu (the LORD our God)* (Psalm 20:7). Pride and fortresses fall; the Name stands.
--   ★ STRONG HOLDS LIKE FIG TREES (THREAD 4): *All thy strong holds shall be like fig trees with the
--      firstripe figs: if they be shaken, they shall even fall into the mouth of the eater* (3:12). The
--      proud defenses drop at a shake — the same figure of the day of judgment: *the stars of heaven
--      fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty
--      wind* (Revelation 6:13); *all their host shall fall down... as a falling fig from the fig tree*
--      (Isaiah 34:4). What seemed unshakeable falls into the mouth of the eater.
--   ★★ NO HEALING OF THY BRUISE (THREAD 5): *There is no healing of thy bruise; thy wound is grievous:
--      all that hear the bruit of thee shall clap the hands over thee: for upon whom hath not thy
--      wickedness passed continually?* (3:19); already *Nineveh is laid waste: who will bemoan her?*
--      (3:7). The incurable wound — read it AGAINST Israel's: Yahuah says of His own people *Thy bruise
--      is incurable, and thy wound is grievous... thou hast no healing medicines* (Jeremiah 30:12-13),
--      and then *For I will restore health unto thee, and I will heal thee of thy wounds, saith Yahuah
--      (LORD)* (Jeremiah 30:17) — Israel's wound IS healed; Nineveh's is not. The oppressor's end is
--      certain: *he will... make Nineveh a desolation, and dry like a wilderness... how is she become a
--      desolation* (Zephaniah 2:13,15). And the restored witness records the relief: *before he died he
--      heard of the destruction of Nineve... and before his death he rejoiced over Nineve* (Tobit
--      14:15) — Jonah's word fulfilled, every nation that felt her cruelty now clapping the hands.
--   EXTRAS: Tobit 14 (the destruction of Nineve, Jonah's word fulfilled) — clean witness, parse
--      verified. No extras forced on the bloody-city, the harlot, No-Amon, or the fig trees.
--   VERSES WITH NO SEPARATE ADD: v.2-3 (the whip, the chariots, the slain — woven into THREAD 1 with
--      v.1), v.6 (abominable filth, the gazingstock — the shaming of THREAD 2's harlot), v.11
--      (thou also shalt be drunken — the reeling fall, THREAD 4), v.13-18 (the siege-prep, the
--      cankerworm-merchants, the locust-captains, the slumbering shepherds and scattered people — the
--      empire emptying out, the futile defense behind THREADS 4-5). All recorded, none silently skipped.

CREATE TEMP VIEW _s334_nah03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Woe to the bloody city, full of lies and robbery
    ('canon','nahum',3,1,'canon','ezekiel',24,6,'free',
      E'*Wherefore thus saith Adonai Yahuah (the Lord GOD); Woe to the bloody city, to the pot whose scum is therein, and whose scum is not gone out of it!* (Ezekiel 24:6). The very cry over Nineveh — *Woe to the bloody city! it is all full of lies and robbery* (Nahum 3:1) — is Ezekiel''s over Jerusalem-of-blood: the city whose violence is a scum that will not boil out. One verdict on every city built on blood; the same Yahuah judges His own and the oppressor alike.'),
    ('canon','nahum',3,1,'canon','ezekiel',24,9,'free',
      E'*Therefore thus saith Adonai Yahuah (the Lord GOD); Woe to the bloody city! I will even make the pile for fire great* (Ezekiel 24:9). The doubled *Woe to the bloody city* binds Nahum''s Nineveh to Ezekiel''s judgment-pot: the bloody city *full of lies and robbery* (Nahum 3:1) is heaped for the fire. The blood she shed and would not cover (Ezekiel 24:7-8) cries up for the burning.'),
    ('canon','nahum',3,1,'canon','habakkuk',2,12,'free',
      E'*Woe to him that buildeth a town with blood, and stablisheth a city by iniquity!* (Habakkuk 2:12). Nahum''s contemporary names the same indictment: the city *full of lies and robbery* (Nahum 3:1) is the town built with blood and established by iniquity. The empire that prospers by violence and deceit is under the prophets'' shared woe.'),
    ('canon','nahum',3,1,'canon','revelation',18,24,'free',
      E'*And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). The blood-guilt of *the bloody city... full of lies and robbery* (Nahum 3:1) lands at last on Babylon the Great — *in her was found the blood of prophets, and of saints, and of all that were slain upon the earth*. Nineveh is the type; the harlot-city''s accumulated blood is judged to the full.'),

    -- THREAD 2 (★★★): The harlot of witchcrafts — Behold, I am against thee
    ('canon','nahum',3,4,'canon','revelation',17,1,'free',
      E'*And there came one of the seven angels which had the seven vials, and talked with me, saying unto me, Come hither; I will shew unto thee the judgment of the great whore that sitteth upon many waters* (Revelation 17:1). Nineveh *the wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms* (Nahum 3:4) is the TYPE of John''s *great whore that sitteth upon many waters* — the seductive city-empire whose judgment the angel unveils. The same harlot-system, exposed and brought down.'),
    ('canon','nahum',3,4,'canon','revelation',17,2,'free',
      E'*With whom the kings of the earth have committed fornication, and the inhabitants of the earth have been made drunk with the wine of her fornication* (Revelation 17:2). The harlot who *selleth nations through her whoredoms, and families through her witchcrafts* (Nahum 3:4) is the very pattern of the great whore — *the kings of the earth have committed fornication* with her, the nations made drunk. Nineveh sold nations by sorcery; Babylon the Great does the same to the end.'),
    ('canon','nahum',3,4,'canon','revelation',17,5,'free',
      E'*And upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (Revelation 17:5). *The wellfavoured harlot, the mistress of witchcrafts* (Nahum 3:4) is the foreshadow of *THE MOTHER OF HARLOTS* — Nineveh a daughter of the same harlot-spirit that crowns Babylon the Great. The witchcraft-empire that seduces and sells the nations bears one name across the canon.'),
    ('canon','nahum',3,4,'canon','revelation',18,3,'free',
      E'*For all nations have drunk of the wine of the wrath of her fornication... by thy sorceries were all nations deceived* (Revelation 18:3, 23). Nineveh *selleth nations through her whoredoms, and families through her witchcrafts* (Nahum 3:4); Babylon *by her sorceries* deceives *all nations*. The same witchcraft-trade in peoples; the harlot-city''s enchantments are her doom in both.'),
    ('canon','nahum',3,5,'canon','isaiah',47,9,'free',
      E'*But these two things shall come to thee in a moment in one day, the loss of children, and widowhood: they shall come upon thee in their perfection for the multitude of thy sorceries, and for the great abundance of thine enchantments* (Isaiah 47:9). Yahuah''s *Behold, I am against thee... I will shew the nations thy nakedness* (Nahum 3:5) over the *mistress of witchcrafts* is His same word against Babylon the lady-of-kingdoms, judged *for the multitude of thy sorceries, and for the great abundance of thine enchantments*. The sorcery-empire is stripped and shamed.'),

    -- THREAD 3 (★): Art thou better than populous No (Thebes' precedent)
    ('canon','nahum',3,8,'canon','jeremiah',46,25,'free',
      E'*Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of Yashar''el (Israel), saith; Behold, I will punish the multitude of No, and Pharaoh, and Egypt, with their gods, and their kings* (Jeremiah 46:25). Nahum holds up Thebes as the warning — *Art thou better than populous No, that was situate among the rivers* (Nahum 3:8) — the very city Jeremiah names for punishment: *I will punish the multitude of No*. If mighty No-Amon fell, Nineveh is no safer.'),
    ('canon','nahum',3,9,'canon','psalms',20,7,'free',
      E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). Thebes trusted her strength — *Ethiopia and Egypt were her strength, and it was infinite; Put and Lubim were thy helpers* (Nahum 3:9) — *Yet was she carried away* (3:10). The psalm names the futility: chariots and horses and infinite allies fail, but the Name of Yahuah stands. No fortress secures the proud.'),

    -- THREAD 4 (★): Strong holds like fig trees shaken
    ('canon','nahum',3,12,'canon','revelation',6,13,'free',
      E'*And the stars of heaven fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty wind* (Revelation 6:13). The same figure judges Nineveh: *All thy strong holds shall be like fig trees with the firstripe figs: if they be shaken, they shall even fall into the mouth of the eater* (Nahum 3:12). The proud defenses drop like ripe figs at a shake — what seemed fixed falls at the day of wrath.'),
    ('canon','nahum',3,12,'canon','isaiah',34,4,'free',
      E'*And all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll: and all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree* (Isaiah 34:4). Nineveh''s strongholds *like fig trees with the firstripe figs: if they be shaken, they shall even fall* (Nahum 3:12) are the same falling fig — the easy collapse of the proud when Yahuah shakes the earth. The defenses are no firmer than fruit ready to drop.'),

    -- THREAD 5 (★★): No healing of thy bruise — none to bemoan her
    ('canon','nahum',3,19,'canon','jeremiah',30,12,'free',
      E'*For thus saith Yahuah (LORD), Thy bruise is incurable, and thy wound is grievous* (Jeremiah 30:12). Of Nineveh it is final: *There is no healing of thy bruise; thy wound is grievous* (Nahum 3:19). Yahuah speaks the same words over His own scattered people — but read on: the wound He calls incurable He Himself will heal. The contrast is the whole point: Israel''s grievous wound is bound up, Nineveh''s is not.'),
    ('canon','nahum',3,19,'canon','jeremiah',30,17,'free',
      E'*For I will restore health unto thee, and I will heal thee of thy wounds, saith Yahuah (LORD); because they called thee an Outcast, saying, This is Zion, whom no man seeketh after* (Jeremiah 30:17). Here is the turn that Nineveh never gets: *There is no healing of thy bruise* (Nahum 3:19) for the oppressor, but for the scattered two-house people *I will restore health unto thee, and I will heal thee of thy wounds*. The Outcast whom no man sought is gathered and healed; the bloody city is not.'),
    ('canon','nahum',3,19,'canon','zephaniah',2,13,'free',
      E'*And he will stretch out his hand against the north, and destroy Assyria; and will make Nineveh a desolation, and dry like a wilderness* (Zephaniah 2:13). Nahum''s incurable bruise — *all that hear the bruit of thee shall clap the hands over thee* (Nahum 3:19) — is Zephaniah''s desolation: Yahuah makes *Nineveh a desolation, and dry like a wilderness*. Two prophets, one sentence on the oppressor of the nations.'),
    ('canon','nahum',3,7,'canon','zephaniah',2,15,'free',
      E'*This is the rejoicing city that dwelt carelessly, that said in her heart, I am, and there is none beside me: how is she become a desolation... every one that passeth by her shall hiss, and wag his hand* (Zephaniah 2:15). Nahum asks *Nineveh is laid waste: who will bemoan her?* (Nahum 3:7) — and Zephaniah answers: none mourn; *every one that passeth by her shall hiss, and wag his hand*. The careless self-exalting city becomes a gazingstock; the passersby clap, not weep.'),
    ('canon','nahum',3,19,'apocrypha','tobit',14,15,'extras',
      E'*But before he died he heard of the destruction of Nineve, which was taken by Nabuchodonosor and Assuerus: and before his death he rejoiced over Nineve* (Tobit 14:15). The restored witness records the very relief Nahum foretells — *all that hear the bruit of thee shall clap the hands over thee* (Nahum 3:19): faithful Tobit, who lived under Nineveh''s cruelty, *rejoiced over Nineve* at her fall. Jonah''s word (Tobit 14:4,8) is fulfilled; the oppressed are glad at the end of the perpetual oppressor.'),
    ('canon','nahum',3,7,'apocrypha','tobit',14,4,'extras',
      E'*Go into Media my son, for I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4). Nahum''s *Nineveh is laid waste: who will bemoan her?* (Nahum 3:7) is the certain overthrow Tobit stakes his counsel on — *I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown*. The fall is so sure the righteous flee the city before it comes; none will be left to mourn.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s334_nah03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s334_nah03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-3-woe-to-the-bloody-city-full-of-lies',
       E'Woe to the bloody city — full of lies and robbery, judged for blood',
       E'Nahum opens the last word over Nineveh with the prophets'' standing indictment: *Woe to the bloody city! it is all full of lies and robbery; the prey departeth not* (Nahum 3:1) — the violent, deceitful empire that lives by plunder, *a multitude of slain, and a great number of carcases* in its wake (3:3). The cry is not new. Ezekiel raised it over Jerusalem-of-blood: *Woe to the bloody city, to the pot whose scum is therein, and whose scum is not gone out of it!* (Ezekiel 24:6); *Woe to the bloody city! I will even make the pile for fire great* (Ezekiel 24:9) — the city whose blood *she poured it not upon the ground, to cover it with dust* (24:7) cries up for the burning. Habakkuk, Nahum''s contemporary, names the same sin: *Woe to him that buildeth a town with blood, and stablisheth a city by iniquity!* (Habakkuk 2:12). And the verdict runs forward to the harlot-city at the end: *in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). One woe over every city built on blood — the systems of violence and lies dismantled, the blood answered for. Victims, not enemies; the prey set free at last.',
       sv.verse_id, ev.verse_id, 'free', 45540
  FROM _s334_nah03_lookup sv, _s334_nah03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-3-the-harlot-of-witchcrafts-i-am-against-thee',
       E'The harlot of witchcrafts — Behold, I am against thee; Nineveh the type of Babylon the Great',
       E'Nineveh''s sin is named as harlotry and sorcery: *Because of the multitude of the whoredoms of the wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms, and families through her witchcrafts* (Nahum 3:4) — the seductive city-empire that traffics whole peoples by enchantment. Yahuah answers in person: *Behold, I am against thee, saith Yahuah Tseva''ot (LORD of hosts); and I will discover thy skirts upon thy face, and I will shew the nations thy nakedness, and the kingdoms thy shame* (3:5) — the harlot stripped and exposed before the nations she seduced. This is the TYPE of the end-time harlot-system John sees brought down: *Come hither; I will shew unto thee the judgment of the great whore that sitteth upon many waters: With whom the kings of the earth have committed fornication* (Revelation 17:1-2); *upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (17:5); *by thy sorceries were all nations deceived* (18:23), *for all nations have drunk of the wine of the wrath of her fornication* (18:3). And Babylon''s own sorceries fall in Isaiah: judgment comes *for the multitude of thy sorceries, and for the great abundance of thine enchantments* (Isaiah 47:9). One harlot-spirit across the canon — the city that sells nations by witchcraft, stripped naked at the last; the Most High Himself standing against her.',
       sv.verse_id, ev.verse_id, 'free', 45543
  FROM _s334_nah03_lookup sv, _s334_nah03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-3-art-thou-better-than-populous-no',
       E'Art thou better than populous No? — Thebes fell; no fortress is secure',
       E'Nahum presses Nineveh with a precedent she cannot answer: *Art thou better than populous No, that was situate among the rivers, that had the waters round about it, whose rampart was the sea, and her wall was from the sea? Ethiopia and Egypt were her strength, and it was infinite; Put and Lubim were thy helpers. Yet was she carried away, she went into captivity* (Nahum 3:8-10). No-Amon — Thebes — had rivers for a moat, the sea for a wall, Egypt and Ethiopia and Libya for infinite strength, and still *was carried away*, her children *dashed in pieces*, her great men *bound in chains*. The city Nahum names is the very one Jeremiah marks for judgment: *Behold, I will punish the multitude of No, and Pharaoh, and Egypt, with their gods, and their kings* (Jeremiah 46:25). If the mightiest fortress of the age fell, Nineveh''s walls are nothing. The psalm names the only sure refuge: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God). They are brought down and fallen: but we are risen, and stand upright* (Psalm 20:7-8). Pride and ramparts and allies fail; the Name of Yahuah stands.',
       sv.verse_id, ev.verse_id, 'free', 45546
  FROM _s334_nah03_lookup sv, _s334_nah03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-3-strong-holds-like-fig-trees-shaken',
       E'Thy strong holds like fig trees — they fall at a shake into the mouth of the eater',
       E'Nineveh''s vaunted defenses are weighed and found weightless: *All thy strong holds shall be like fig trees with the firstripe figs: if they be shaken, they shall even fall into the mouth of the eater* (Nahum 3:12) — ripe fruit that drops at the first jolt, swallowed without resistance. *The gates of thy land shall be set wide open unto thine enemies: the fire shall devour thy bars* (3:13). The figure is the day-of-judgment figure across the canon. Isaiah: *all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree* (Isaiah 34:4). And John at the sixth seal: *the stars of heaven fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty wind* (Revelation 6:13). What looked unshakeable — the strongholds, the host of heaven, the very stars — falls like fruit too ripe to hold when Yahuah shakes the earth. Nineveh''s walls are no firmer than figs ready to drop.',
       sv.verse_id, ev.verse_id, 'free', 45549
  FROM _s334_nah03_lookup sv, _s334_nah03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nahum-3-no-healing-of-thy-bruise-none-to-bemoan',
       E'There is no healing of thy bruise — none to bemoan her; the oppressor''s incurable end',
       E'The book closes on a wound that will not heal: *There is no healing of thy bruise; thy wound is grievous: all that hear the bruit of thee shall clap the hands over thee: for upon whom hath not thy wickedness passed continually?* (Nahum 3:19). The final rhetorical question answers itself — every nation had felt Nineveh''s cruelty, so all clap their hands at her fall. Already she is *laid waste: who will bemoan her? whence shall I seek comforters for thee?* (3:7). Read the incurable bruise against Israel''s: Yahuah says of His own scattered people *Thy bruise is incurable, and thy wound is grievous... thou hast no healing medicines* (Jeremiah 30:12-13) — and then turns: *For I will restore health unto thee, and I will heal thee of thy wounds, saith Yahuah (LORD); because they called thee an Outcast, saying, This is Zion, whom no man seeketh after* (Jeremiah 30:17). That is the whole difference: the two-house Outcast whom no man sought is gathered and healed; the bloody city is not. Zephaniah seals the desolation: Yahuah will *make Nineveh a desolation, and dry like a wilderness... how is she become a desolation... every one that passeth by her shall hiss, and wag his hand* (Zephaniah 2:13,15). And the restored witness records the relief in a faithful man''s own heart: *before he died he heard of the destruction of Nineve... and before his death he rejoiced over Nineve* (Tobit 14:15), for he had *surely believe[d] those things which Jonas the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4). Jonah''s word fulfilled, the perpetual oppressor ended — and the nations, relieved, clap their hands.',
       sv.verse_id, ev.verse_id, 'extras', 45552
  FROM _s334_nah03_lookup sv, _s334_nah03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='nahum' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Woe to the bloody city, to the pot whose scum is therein* (Ezekiel 24:6) — the same cry Nahum raises over Nineveh (3:1), Ezekiel''s over Jerusalem-of-blood; one verdict on every city built on blood.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=24 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-woe-to-the-bloody-city-full-of-lies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Woe to the bloody city! I will even make the pile for fire great* (Ezekiel 24:9) — the bloody city *full of lies and robbery* (Nahum 3:1) heaped for the burning; the blood she would not cover cries up.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=24 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-woe-to-the-bloody-city-full-of-lies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Woe to him that buildeth a town with blood, and stablisheth a city by iniquity!* (Habakkuk 2:12) — Nahum''s contemporary names the same indictment of the city built on violence and lies (Nahum 3:1).'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-woe-to-the-bloody-city-full-of-lies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24) — the bloody city''s blood-guilt (Nahum 3:1) judged to the full in Babylon the Great; Nineveh the type.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-woe-to-the-bloody-city-full-of-lies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Come hither; I will shew unto thee the judgment of the great whore that sitteth upon many waters* (Revelation 17:1) — Nineveh *the wellfavoured harlot, the mistress of witchcrafts* (Nahum 3:4) is the type of the great whore whose judgment is unveiled.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-the-harlot-of-witchcrafts-i-am-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *With whom the kings of the earth have committed fornication* (Revelation 17:2) — the harlot who *selleth nations through her whoredoms* (Nahum 3:4) is the very pattern of the great whore who seduces the kings of the earth.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-the-harlot-of-witchcrafts-i-am-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS* (Revelation 17:5) — *the mistress of witchcrafts* (Nahum 3:4) is a daughter of the same harlot-spirit; one name across the canon.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-the-harlot-of-witchcrafts-i-am-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *all nations have drunk of the wine of the wrath of her fornication... by thy sorceries were all nations deceived* (Revelation 18:3,23) — Nineveh *selleth nations... through her witchcrafts* (Nahum 3:4); Babylon deceives all nations by the same sorcery.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-the-harlot-of-witchcrafts-i-am-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *for the multitude of thy sorceries, and for the great abundance of thine enchantments* (Isaiah 47:9) — Yahuah''s *I am against thee... I will shew the nations thy nakedness* (Nahum 3:5) is His same word against Babylon the lady-of-kingdoms.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-the-harlot-of-witchcrafts-i-am-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Behold, I will punish the multitude of No, and Pharaoh, and Egypt, with their gods* (Jeremiah 46:25) — the very Thebes Nahum names (3:8) marked by Jeremiah for judgment; if No-Amon fell, Nineveh is no safer.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=46 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-art-thou-better-than-populous-no'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7) — Thebes'' infinite strength (Nahum 3:9) failed; the only sure refuge is the Name of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-art-thou-better-than-populous-no'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the stars of heaven fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty wind* (Revelation 6:13) — the same figure as Nineveh''s strongholds falling like firstripe figs at a shake (Nahum 3:12).'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-strong-holds-like-fig-trees-shaken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *all their host shall fall down... as a falling fig from the fig tree* (Isaiah 34:4) — the proud defenses (Nahum 3:12) are no firmer than fruit ready to drop when Yahuah shakes the earth.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-strong-holds-like-fig-trees-shaken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Thy bruise is incurable, and thy wound is grievous* (Jeremiah 30:12) — Yahuah speaks the same words over His own people, but read on: the wound He calls incurable He Himself heals; Nineveh''s (Nahum 3:19) is not healed.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-no-healing-of-thy-bruise-none-to-bemoan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *For I will restore health unto thee, and I will heal thee of thy wounds, saith Yahuah (LORD); because they called thee an Outcast* (Jeremiah 30:17) — the turn Nineveh never gets: the two-house Outcast is gathered and healed; the bloody city (Nahum 3:19) is not.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=30 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-no-healing-of-thy-bruise-none-to-bemoan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he will... make Nineveh a desolation, and dry like a wilderness* (Zephaniah 2:13) — two prophets, one sentence on the oppressor; the incurable bruise (Nahum 3:19) is the same desolation.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-no-healing-of-thy-bruise-none-to-bemoan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *how is she become a desolation... every one that passeth by her shall hiss, and wag his hand* (Zephaniah 2:15) — answers Nahum''s *who will bemoan her?* (Nahum 3:7): none mourn the careless self-exalting city; the passersby clap, not weep.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-no-healing-of-thy-bruise-none-to-bemoan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *before he died he heard of the destruction of Nineve... and before his death he rejoiced over Nineve* (Tobit 14:15) — the very relief Nahum foretells (3:19): faithful Tobit, who lived under her cruelty, rejoiced at her fall.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-no-healing-of-thy-bruise-none-to-bemoan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4) — Nahum''s *who will bemoan her?* (Nahum 3:7) is so certain the righteous flee before it comes; Jonah''s word stands sure.'
  FROM cross_reference_threads t
  JOIN _s334_nah03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nahum' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s334_nah03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nahum-3-no-healing-of-thy-bruise-none-to-bemoan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session334 — Nahum cross-references complete.'
