-- =====================================================================
-- Session 330 — Amos FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session330_amos_cross_references.sql
-- =====================================================================

\echo 'session330 — Amos cross-references starting...'
BEGIN;

-- ----- fragment: minion_amos_1.sql (Amos 1) -----
-- Chapter: Amos 1 — YAHUAH ROARS FROM ZION and the oracles against the nations, "for three
-- transgressions and for four." The herdman of Tekoa opens with the lion's roar: *Yahuah (LORD)
-- will roar from Zion, and utter his voice from Jerusalem; and the habitations of the shepherds
-- shall mourn, and the top of Carmel shall wither* (1:2) — the same word Joel speaks (*Yahuah
-- (LORD) also shall roar out of Zion, and utter his voice from Jerusalem*, Joel 3:16), the same
-- roar Jeremiah hears (*Yahuah (LORD) shall roar from on high*, Jeremiah 25:30), the lion's cry
-- Amos himself names later (*The lion hath roared, who will not fear?*, Amos 3:8), echoed in
-- the Revelation angel who *cried with a loud voice, as when a lion roareth* (Revelation 10:3).
-- Then the formulaic judgments fall on Damascus/Syria (1:3-5), Gaza/Philistia (1:6-8), Tyrus
-- (1:9-10), Edom (1:11-12), Ammon (1:13-15) — Yahuah the JUDGE OF ALL NATIONS, not Yashar'el
-- only, holding every people to the moral law written on the conscience (Romans 2:14-15). The
-- atrocities judged are the systems of cruelty: the slave-trade ("carried away captive the
-- whole captivity, to deliver them up to Edom" 1:6,9), the breaking of the brotherly covenant
-- (1:9), Edom pursuing his brother with the sword and casting off all pity (1:11 = Esau against
-- Jacob → Obadiah 1:10-14, Genesis 27:41), Ammon ripping up the women with child to enlarge
-- their border (1:13). Victims, not enemies; the dismantling of cruelty, the universal justice
-- of Yahuah.
-- Tag: amo01   Temp view: _s330_amo01_lookup
-- Sort band: base 45200, step 3 -> threads at 45200, 45203, 45206 (3 threads)
-- Source of EVERY row: 'canon','amos',1,v
--
-- Amos 1 coverage:
--   v.1 (The words of Amos... which he saw concerning Yashar'el (Israel) in the days of Uzziah...
--        two years before the earthquake)
--        NT:     none warranted (the superscription; the substance begins at the roar of v.2)
--        Extras: none warranted
--        Tanakh: none warranted (held in prose)
--   ★★★ v.2 (Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem)
--        NT:     ★ Revelation 10:3 (cried with a loud voice, as when a lion roareth) — THREAD 1
--        Extras: none warranted (the roar is a canon-witnessed chain; no clean extras add)
--        Tanakh: ★★★ Joel 3:16 (Yahuah (LORD) also shall roar out of Zion, and utter his voice from
--                Jerusalem — IDENTICAL), ★ Jeremiah 25:30 (Yahuah (LORD) shall roar from on high),
--                ★ Amos 3:8 (The lion hath roared, who will not fear?), ★ Hosea 11:10 (he shall
--                roar like a lion) — THREAD 1
--   ★★ v.3,6,9,11,13 (For three transgressions of Damascus/Gaza/Tyrus/Edom/Ammon, and for four,
--        I will not turn away the punishment thereof) — the oracle-pattern of universal judgment
--        NT:     ★ Romans 2:14-15 (the Gentiles... do by nature the things contained in the law...
--                the work of the law written in their hearts, their conscience also bearing
--                witness) — THREAD 2 (the moral law on every nation's conscience)
--        Extras: ★ Sirach 36:1-3 (send your fear upon all the nations that seek not after you;
--                Lift up your hand against the strange nations) — THREAD 2 (Yahuah Judge of all)
--        Tanakh: ★★ Jeremiah 25:30-31 (Yahuah (LORD) hath a controversy with the nations, he will
--                plead with all flesh) — THREAD 2 (the same nations-lawsuit; cup to all peoples)
--   v.4-5,7-8,10,12,14-15 (But I will send a fire... which shall devour the palaces) — the
--        fire-on-the-palaces refrain
--        NT:     none warranted (the judgment-fire is woven into THREAD 2's universal-justice prose)
--        Extras: none warranted
--        Tanakh: held in THREAD 2 (the fire that devours every nation's strongholds)
--   ★★ v.11 (Edom... because he did pursue his brother with the sword, and did cast off all pity)
--        NT:     none warranted distinct (the brother-hatred → seed-line is a Tanakh weave)
--        Extras: none warranted clean (Edom material in extras carries apparatus noise; canon
--                witnesses are stronger)
--        Tanakh: ★★ Obadiah 1:10-11 (For thy violence against thy brother Jacob shame shall cover
--                thee), ★ Obadiah 1:12,14, ★★ Genesis 27:41 (Esau hated Jacob... then will I slay
--                my brother Jacob) — THREAD 3 (Esau against his brother Jacob, the seed-line enmity)
--
-- Threads (slug — target libraries):
--   1. amos-1-yahuah-will-roar-from-zion — NT (Revelation 10) + Tanakh (Joel 3, Jeremiah 25,
--      Amos 3, Hosea 11) [free]  (★★★ the lion's roar of judgment from Zion; the voice that shakes)
--   2. amos-1-for-three-transgressions-and-for-four — NT (Romans 2) + Tanakh (Jeremiah 25) +
--      Extras (Sirach 36) [extras]  (★★ Yahuah Judge of ALL nations; the moral law on the conscience)
--   3. amos-1-edom-pursued-his-brother-with-the-sword — Tanakh (Obadiah 1, Genesis 27) [free]
--      (★★ Esau against his brother Jacob; the seed-line enmity, the brotherly covenant broken)
--
-- Framing notes:
--   ★★★ THE ROAR FROM ZION (THREAD 1): *And he said, Yahuah (LORD) will roar from Zion, and utter
--      his voice from Jerusalem; and the habitations of the shepherds shall mourn, and the top of
--      Carmel shall wither* (Amos 1:2). Joel speaks the line word for word — *Yahuah (LORD) also
--      shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth
--      shall shake* (Joel 3:16) — and Jeremiah extends it to all flesh — *Yahuah (LORD) shall
--      roar from on high... he will plead with all flesh* (Jeremiah 25:30-31). Amos names the
--      lion plainly later: *The lion hath roared, who will not fear?* (Amos 3:8), and Hosea makes
--      the roar the very call that gathers the children home: *he shall roar like a lion: when he
--      shall roar, then the children shall tremble from the west* (Hosea 11:10). The roar surfaces
--      one last time in the Revelation angel who *cried with a loud voice, as when a lion roareth*
--      (Revelation 10:3) — the voice of Yahuah that shakes heaven and earth, the same Lion's cry.
--   ★★ JUDGE OF ALL NATIONS (THREAD 2): the formula falls on nation after nation — *For three
--      transgressions of Damascus, and for four, I will not turn away the punishment thereof*
--      (1:3); of Gaza (1:6); of Tyrus (1:9); of Edom (1:11); of the children of Ammon (1:13).
--      Yahuah is not Yashar'el's tribal deity but the Judge of all the earth, holding every nation
--      to the moral law written on the conscience: *the Gentiles, which have not the law, do by
--      nature the things contained in the law... the work of the law written in their hearts,
--      their conscience also bearing witness* (Romans 2:14-15). Jeremiah states the principle —
--      *Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh*
--      (Jeremiah 25:31) — and the restored witness prays it: *send your fear upon all the nations
--      that seek not after you. Lift up your hand against the strange nations* (Sirach 36:2-3).
--      The atrocities named are systems of cruelty dismantled — the slave-trade (1:6,9), broken
--      covenant (1:9), ripping up women with child (1:13) — victims, not enemies.
--   ★★ EDOM AGAINST HIS BROTHER (THREAD 3): the heaviest charge is Edom's — *because he did pursue
--      his brother with the sword, and did cast off all pity, and his anger did tear perpetually,
--      and he kept his wrath for ever* (1:11). This is Esau against Jacob, the seed-line enmity
--      reaching back to the tent: *Esau hated Jacob because of the blessing wherewith his father
--      blessed him: and Esau said in his heart... then will I slay my brother Jacob* (Genesis
--      27:41). Obadiah's whole vision is the indictment: *For thy violence against thy brother
--      Jacob shame shall cover thee* (Obadiah 1:10), Edom standing by on the day Jacob was carried
--      captive (1:11), looking on his brother's calamity (1:12,14). The brotherly covenant Tyrus
--      forgot (1:9) Edom shattered with the sword — the perpetual wrath of the rejected seed
--      against the chosen.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription, prose), v.4-5/7-8/10/12/14-15 (the
--      fire-on-the-palaces refrain, woven into THREAD 2's universal-justice prose). All recorded,
--      none silently skipped.

CREATE TEMP VIEW _s330_amo01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Yahuah will roar from Zion — the lion's roar of judgment
    ('canon','amos',1,2,'canon','joel',3,16,'free',
      E'*Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)* (Joel 3:16). Joel speaks Amos''s opening word for word — *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2). The same Lion''s roar from the same holy mountain, the voice that *shakes* heaven and earth; and where it terrifies the nations, it is the hope and strength of His own people.'),
    ('canon','amos',1,2,'canon','jeremiah',25,30,'free',
      E'*Yahuah (LORD) shall roar from on high, and utter his voice from his holy habitation; he shall mightily roar upon his habitation; he shall give a shout, as they that tread the grapes, against all the inhabitants of the earth* (Jeremiah 25:30). Jeremiah hears the same roar Amos opens with — *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2) — and widens it to *all the inhabitants of the earth*. The roar from the holy habitation is the Judge''s shout against every nation.'),
    ('canon','amos',1,2,'canon','amos',3,8,'free',
      E'*The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* (Amos 3:8). Amos himself names the roar of his own opening — *Yahuah (LORD) will roar from Zion* (1:2) — as the Lion''s cry that compels the prophet: when Yahuah roars, the herdman of Tekoa cannot but prophesy. The voice from Zion is the dread word that makes the watchman speak.'),
    ('canon','amos',1,2,'canon','hosea',11,10,'free',
      E'*They shall walk after Yahuah (LORD): he shall roar like a lion: when he shall roar, then the children shall tremble from the west* (Hosea 11:10). Hosea turns the roar of *Yahuah (LORD) will roar from Zion* (Amos 1:2) into the very call that gathers Yashar''el (Israel) home: when He *shall roar like a lion*, the scattered children tremble back from the west. The same Lion''s voice that judges the nations summons the lost sheep.'),
    ('canon','amos',1,2,'canon','revelation',10,3,'free',
      E'*And cried with a loud voice, as when a lion roareth: and when he had cried, seven thunders uttered their voices* (Revelation 10:3). The mighty angel clothed with a cloud cries *as when a lion roareth* — the same Lion''s roar Amos opens with, *Yahuah (LORD) will roar from Zion* (Amos 1:2). The voice of Yahuah that shakes heaven and earth surfaces one last time at the end, the seven thunders answering the Lion''s cry.'),

    -- THREAD 2 (★★): For three transgressions and for four — Yahuah Judge of ALL nations
    ('canon','amos',1,3,'canon','jeremiah',25,31,'free',
      E'*A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD)* (Jeremiah 25:31). The drumbeat *For three transgressions of Damascus, and for four, I will not turn away the punishment thereof* (Amos 1:3), repeated over Gaza, Tyrus, Edom, and Ammon, is the same truth Jeremiah states outright: Yahuah *hath a controversy with the nations, he will plead with all flesh*. The Judge of all the earth holds every people to account.'),
    ('canon','amos',1,3,'canon','romans',2,14,'free',
      E'*For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves* (Romans 2:14). Amos judges nations who never received Sinai — *For three transgressions of Damascus, and for four* (Amos 1:3) — because the moral law binds them too: the Gentiles *do by nature the things contained in the law*. The threshing of Gilead, the slave-trade, the ripped-up women with child are crimes against a law written on every conscience.'),
    ('canon','amos',1,3,'canon','romans',2,15,'free',
      E'*Which shew the work of the law written in their hearts, their conscience also bearing witness, and their thoughts the mean while accusing or else excusing one another* (Romans 2:15). The nations Amos arraigns — *For three transgressions... and for four, I will not turn away the punishment thereof* (Amos 1:3) — stand condemned by *the work of the law written in their hearts*. Damascus, Gaza, Tyrus, Edom, Ammon had no Torah-scroll, yet their conscience bore witness against their cruelty; the Judge of all judges them justly.'),
    ('canon','amos',1,3,'apocrypha','ecclesiasticus',36,2,'extras',
      E'*And send your fear upon all the nations that seek not after you* (Sirach 36:2). The oracle-formula *For three transgressions of Damascus, and for four* (Amos 1:3), rolling through nation after nation, is the cry of the restored witness answered: Yahuah sends His fear *upon all the nations that seek not after you*. The Judge of all the earth visits the heathen who never sought Him.'),
    ('canon','amos',1,3,'apocrypha','ecclesiasticus',36,3,'extras',
      E'*Lift up your hand against the strange nations, and let them see your power* (Sirach 36:3). The fire Yahuah sends on the palaces of every nation in Amos''s oracles — beginning *For three transgressions of Damascus, and for four* (Amos 1:3) — is His hand lifted *against the strange nations, and let them see your power*. The universal judgment of the prophet is the universal justice the faithful pray for.'),

    -- THREAD 3 (★★): Edom pursued his brother with the sword — Esau against Jacob
    ('canon','amos',1,11,'canon','obadiah',1,10,'free',
      E'*For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10). Amos''s charge against Edom — *because he did pursue his brother with the sword, and did cast off all pity* (Amos 1:11) — is the whole burden of Obadiah: *thy violence against thy brother Jacob*. Edom''s sin is not war against a stranger but the sword turned on his own brother.'),
    ('canon','amos',1,11,'canon','obadiah',1,11,'free',
      E'*In the day that thou stoodest on the other side, in the day that the strangers carried away captive his forces, and foreigners entered into his gates, and cast lots upon Jerusalem, even thou wast as one of them* (Obadiah 1:11). Edom''s pity cast off — *did cast off all pity, and his anger did tear perpetually* (Amos 1:11) — is Edom standing by while Jacob was carried captive, *even thou wast as one of them*. The brother who should have wept stood with the plunderers.'),
    ('canon','amos',1,11,'canon','obadiah',1,12,'free',
      E'*But thou shouldest not have looked on the day of thy brother in the day that he became a stranger; neither shouldest thou have rejoiced over the children of Yahudah (Judah) in the day of their destruction; neither shouldest thou have spoken proudly in the day of distress* (Obadiah 1:12). The perpetual wrath Amos names — *he kept his wrath for ever* (Amos 1:11) — is Edom rejoicing *over the children of Yahudah (Judah) in the day of their destruction*. The kept wrath gloats over a brother''s ruin.'),
    ('canon','amos',1,11,'canon','genesis',27,41,'free',
      E'*And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob* (Genesis 27:41). The sword Edom drew against his brother — *he did pursue his brother with the sword* (Amos 1:11) — was forged in Esau''s heart at the very beginning: *then will I slay my brother Jacob*. The perpetual wrath of Edom is the rejected seed''s ancient enmity against the chosen, running from the tent to the prophet''s indictment.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-1-yahuah-will-roar-from-zion',
       E'Yahuah will roar from Zion — the lion''s roar of judgment',
       E'The herdman of Tekoa opens with a Lion''s roar: *And he said, Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem; and the habitations of the shepherds shall mourn, and the top of Carmel shall wither* (Amos 1:2). The voice that shakes is one voice across the prophets. Joel speaks the line word for word: *Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)* (Joel 3:16). Jeremiah widens it to all flesh: *Yahuah (LORD) shall roar from on high, and utter his voice from his holy habitation... against all the inhabitants of the earth* (Jeremiah 25:30). Amos himself names the Lion: *The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* (Amos 3:8). Hosea makes the roar the call that gathers the scattered home: *he shall roar like a lion: when he shall roar, then the children shall tremble from the west* (Hosea 11:10) — the same Lion''s voice that judges the nations summons the lost sheep of Yashar''el (Israel). And it sounds one last time at the end, in the mighty angel clothed with a cloud who *cried with a loud voice, as when a lion roareth: and when he had cried, seven thunders uttered their voices* (Revelation 10:3). One roar, from Zion to the seven thunders — the voice of Yahuah that makes heaven and earth shake.',
       sv.verse_id, ev.verse_id, 'free', 45200
  FROM _s330_amo01_lookup sv, _s330_amo01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-1-for-three-transgressions-and-for-four',
       E'For three transgressions, and for four — Yahuah, Judge of all nations',
       E'After the roar from Zion the judgments fall, nation by nation, in one relentless formula: *Thus saith Yahuah (LORD); For three transgressions of Damascus, and for four, I will not turn away the punishment thereof* (Amos 1:3) — and again of Gaza (1:6), of Tyrus (1:9), of Edom (1:11), of the children of Ammon (1:13). Yahuah is not Yashar''el''s tribal deity but the Judge of all the earth, and the crimes He arraigns are systems of cruelty: threshing Gilead with iron (1:3), the slave-trade that *carried away captive the whole captivity, to deliver them up to Edom* (1:6), the broken brotherly covenant (1:9), Ammon ripping up *the women with child of Gilead, that they might enlarge their border* (1:13). These nations never stood at Sinai, yet they are condemned, for the moral law is written on every conscience: *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves: Which shew the work of the law written in their hearts, their conscience also bearing witness* (Romans 2:14-15). Jeremiah states the principle plainly: *Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh* (Jeremiah 25:31). And the restored witness prays for that very justice: *send your fear upon all the nations that seek not after you. Lift up your hand against the strange nations, and let them see your power* (Sirach 36:2-3). The fire on the palaces is the Judge of all the earth dismantling cruelty — victims avenged, not peoples hated.',
       sv.verse_id, ev.verse_id, 'extras', 45203
  FROM _s330_amo01_lookup sv, _s330_amo01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-1-edom-pursued-his-brother-with-the-sword',
       E'Edom pursued his brother with the sword — Esau against Jacob',
       E'The heaviest charge in the chapter is Edom''s, and it is not war against a stranger but the sword turned on his own brother: *Thus saith Yahuah (LORD); For three transgressions of Edom, and for four, I will not turn away the punishment thereof; because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever* (Amos 1:11). This is Esau against Jacob, an enmity forged in the tent at the very beginning: *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart... then will I slay my brother Jacob* (Genesis 27:41). The kept wrath ripened into the standing-by of the day of calamity, the whole burden of Obadiah: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10); *In the day that thou stoodest on the other side... when foreigners entered into his gates, and cast lots upon Jerusalem, even thou wast as one of them* (Obadiah 1:11); *neither shouldest thou have rejoiced over the children of Yahudah (Judah) in the day of their destruction* (Obadiah 1:12). The brotherly covenant Tyrus merely forgot (1:9), Edom shattered with the sword and cast off all pity. This is the seed-line enmity — the rejected seed''s perpetual wrath against the chosen — running from Esau''s heart to the prophet''s indictment.',
       sv.verse_id, ev.verse_id, 'free', 45206
  FROM _s330_amo01_lookup sv, _s330_amo01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake* (Joel 3:16) — Joel speaks Amos 1:2 word for word; the same roar from the same holy mountain, hope to His people, terror to the nations.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-yahuah-will-roar-from-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD) shall roar from on high, and utter his voice from his holy habitation... against all the inhabitants of the earth* (Jeremiah 25:30) — the roar of Amos 1:2 widened to all flesh; the Judge''s shout against every nation.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-yahuah-will-roar-from-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* (Amos 3:8) — Amos names the Lion of his own opening (1:2); when Yahuah roars, the herdman cannot but prophesy.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-yahuah-will-roar-from-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he shall roar like a lion: when he shall roar, then the children shall tremble from the west* (Hosea 11:10) — the same Lion''s roar (Amos 1:2) becomes the call that gathers the scattered children of Yashar''el (Israel) home.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-yahuah-will-roar-from-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *And cried with a loud voice, as when a lion roareth: and when he had cried, seven thunders uttered their voices* (Revelation 10:3) — the Lion''s roar of Amos 1:2 sounds one last time; the seven thunders answer the voice from Zion.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-yahuah-will-roar-from-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh* (Jeremiah 25:31) — the same nations-lawsuit as the "three transgressions and four" formula (Amos 1:3ff); the Judge of all the earth holds every people to account.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-for-three-transgressions-and-for-four'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the Gentiles, which have not the law, do by nature the things contained in the law... are a law unto themselves* (Romans 2:14) — the nations Amos judges (1:3) never stood at Sinai, yet the moral law binds them; their cruelty is a crime against the conscience.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-for-three-transgressions-and-for-four'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the work of the law written in their hearts, their conscience also bearing witness* (Romans 2:15) — the heathen of the oracles (Amos 1:3) stand condemned by the law written on every heart; the Judge of all judges them justly.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-for-three-transgressions-and-for-four'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*send your fear upon all the nations that seek not after you* (Sirach 36:2) — the restored witness prays the very justice the oracle-formula (Amos 1:3) enacts: Yahuah visits the heathen who never sought Him.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=36 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-for-three-transgressions-and-for-four'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Lift up your hand against the strange nations, and let them see your power* (Sirach 36:3) — the fire on every nation''s palaces (the refrain of Amos 1) is Yahuah''s hand lifted against the strange nations; universal judgment, universal justice.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=36 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-for-three-transgressions-and-for-four'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10) — Edom''s sin in Amos 1:11 is the whole burden of Obadiah: the sword turned on his own brother Jacob, not on a stranger.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-edom-pursued-his-brother-with-the-sword'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*In the day that thou stoodest on the other side... even thou wast as one of them* (Obadiah 1:11) — the cast-off pity of Amos 1:11 is Edom standing by while Jacob was carried captive, counted with the plunderers.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-edom-pursued-his-brother-with-the-sword'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*neither shouldest thou have rejoiced over the children of Yahudah (Judah) in the day of their destruction* (Obadiah 1:12) — the wrath Edom *kept for ever* (Amos 1:11) gloats over a brother''s ruin.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-edom-pursued-his-brother-with-the-sword'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *And Esau hated Jacob... then will I slay my brother Jacob* (Genesis 27:41) — the sword Edom drew (Amos 1:11) was forged in Esau''s heart at the beginning; the rejected seed''s ancient enmity against the chosen.'
  FROM cross_reference_threads t
  JOIN _s330_amo01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s330_amo01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-1-edom-pursued-his-brother-with-the-sword'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_2.sql (Amos 2) -----
-- Chapter: Amos 2 — the covenant-lawsuit closes its circuit. The "for three transgressions, and
-- for four" oracles round on Moab (the bones of the king of Edom burned to lime, 2:1-3), then turn
-- the indictment HOME: ★★ Yahudah is judged precisely *because they have despised the law of Yahuah
-- (LORD), and have not kept his commandments* (2:4) — Torah-AFFIRMED as the binding covenant standard,
-- the anti-antinomian frame: judgment falls FOR forsaking the Torah, never for keeping it. Then
-- ★★ Yashar'el: *they sold the righteous for silver, and the poor for a pair of shoes... and turn
-- aside the way of the meek* (2:6-7) — the Torah's own defense of the poor trampled; *a man and his
-- father will go in unto the same maid, to profane my holy name* (2:7) — Leviticus 18 sexual sin
-- profaning the Name; pledged garments kept by every altar (2:8). And ★ the recital of Yahuah's
-- spurned grace: the Amorite destroyed, the exodus, the forty years, *I raised up of your sons for
-- prophets, and of your young men for Nazarites* — but *ye gave the Nazarites wine to drink; and
-- commanded the prophets, saying, Prophesy not* (2:11-12), the silenced prophets the NT will name
-- as the fathers' enduring sin (Acts 7, Matthew 23). Victims, not enemies; the curse falls for
-- breaking the covenant, never for the Torah itself.
-- Tag: amo02   Temp view: _s330_amo02_lookup
-- Sort band: base 45220, step 3 -> threads at 45220, 45223, 45226, 45229 (4 threads)
-- Source of EVERY row: 'canon','amos',2,v
--
-- Amos 2 coverage:
--   v.1-3 (Moab... he burned the bones of the king of Edom into lime)
--        NT:     none warranted (the foreign-nation oracle; the indictment's weight falls on Yahudah/Yashar'el)
--        Extras: none warranted
--        Tanakh: woven in prose as the turn of the lawsuit; no separate add forced
--   ★★ v.4-5 (because they have despised the law of Yahuah (LORD), and have not kept his commandments,
--          and their lies caused them to err)
--        NT:     ★★ 1 John 2:3-4 (hereby we do know that we know him, if we keep his commandments... He
--                that saith, I know him, and keepeth not his commandments, is a liar) — THREAD 1 (the filter)
--        Extras: ★ Baruch 4:1 (the law that endureth for ever: all they that keep it shall come to life;
--                but such as leave it shall die) — THREAD 1 (the Torah forsaken = death)
--        Tanakh: ★ Deuteronomy 28:15 (if thou wilt not hearken... all these curses shall come), ★ Daniel
--                9:11 (all Yashar'el have transgressed thy law... the curse is poured upon us), ★ Nehemiah
--                1:7 (have not kept the commandments... which thou commandedst thy servant Moses) — THREAD 1
--   ★★ v.6-7a (they sold the righteous for silver, and the poor for a pair of shoes; That pant after the
--          dust of the earth on the head of the poor, and turn aside the way of the meek)
--        NT:     ★ James 5:4 (the hire of the labourers... kept back by fraud, crieth), ★ James 5:6 (Ye
--                have condemned and killed the just) — THREAD 2
--        Extras: ★ Wisdom 2:10 (Let us oppress the poor righteous man), ★ Sirach 4:1 (defraud not the poor
--                of his living) — THREAD 2
--        Tanakh: ★ Exodus 23:6 (Thou shalt not wrest the judgment of thy poor), ★ Deuteronomy 24:14-15
--                (oppress not an hired servant that is poor), ★ Amos 8:6 (buy the poor for silver... the
--                needy for a pair of shoes) — THREAD 2
--   ★ v.7b-8 (a man and his father will go in unto the same maid, to profane my holy name; And they lay
--          themselves down upon clothes laid to pledge by every altar)
--        NT:     none warranted distinct (the holiness/Name weave is Torah-rooted; held in prose)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 18:8 (The nakedness of thy father's wife shalt thou not uncover), ★ Leviticus
--                18:21 (neither shalt thou profane the name of thy Elohim), ★ Exodus 22:26-27 (take thy
--                neighbour's raiment to pledge... deliver it unto him by that the sun goeth down) — THREAD 3
--   v.9-10 (Yet destroyed I the Amorite before them... Also I brought you up from the land of Egypt)
--        NT:     none warranted distinct (the saving-grace recital is the preface to the spurned prophets; woven into THREAD 4 prose)
--        Extras: none warranted
--        Tanakh: held in prose as the grace that v.11-12 spurns
--   ★ v.11-12 (I raised up of your sons for prophets, and of your young men for Nazarites... But ye gave
--          the Nazarites wine to drink; and commanded the prophets, saying, Prophesy not)
--        NT:     ★ Acts 7:51-52 (Which of the prophets have not your fathers persecuted?), ★ Matthew 23:37
--                (O Jerusalem... thou that killest the prophets) — THREAD 4
--        Extras: none warranted (the Nazarite gift is Torah-rooted; clean NT weave carries the silenced prophets)
--        Tanakh: ★ Numbers 6:2-3 (vow a vow of a Nazarite... separate himself from wine and strong drink) — THREAD 4
--   v.13-16 (I am pressed under you... the flight shall perish from the swift... shall flee away naked)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: woven in prose as the press of judgment closing the oracle; no separate add
--
-- Threads (slug — target libraries):
--   1. amos-2-despised-the-law-of-yahuah — NT (1 John 2) + Extras (Baruch 4) + Tanakh (Deut 28, Daniel 9, Nehemiah 1) [extras]
--      (★★ KEYSTONE: Yahudah judged FOR despising the Torah — the anti-antinomian frame; Torah affirmed as binding)
--   2. amos-2-sold-the-righteous-for-silver — NT (James 5) + Extras (Wisdom 2, Sirach 4) + Tanakh (Exodus 23, Deut 24, Amos 8) [extras]
--      (★★ selling the righteous/poor, turning aside the meek — the Torah's defense of the poor trampled)
--   3. amos-2-a-man-and-his-father-profane-my-holy-name — Tanakh (Leviticus 18, Exodus 22) [free]
--      (★ sexual sin profaning the Name + the pledged garment kept by every altar — Torah's holiness)
--   4. amos-2-i-raised-up-prophets-and-nazarites — NT (Acts 7, Matthew 23) + Tanakh (Numbers 6) [free]
--      (★ Yahuah's gift of prophets and Nazarites spurned; the silenced prophets, the fathers' enduring sin)
--
-- Framing notes:
--   ★★ DESPISED THE TORAH (THREAD 1, KEYSTONE): *Thus saith Yahuah (LORD); For three transgressions of
--      Yahudah (Judah), and for four, I will not turn away the punishment thereof; because they have
--      despised the law of Yahuah (LORD), and have not kept his commandments, and their lies caused them
--      to err* (Amos 2:4). Yahudah is judged for the precise sin of DESPISING the Torah and NOT keeping
--      the commandments — the Torah is the binding covenant standard, the judgment falls FOR forsaking it.
--      This is the anti-antinomian verse: the curse is the Deuteronomy 28 exile-judgment for
--      covenant-breaking — *if thou wilt not hearken unto the voice of Yahuah Elohayka... that all these
--      curses shall come upon thee* (Deut 28:15) — NEVER the Torah itself. Daniel's confession reads it
--      the same: *all Yashar'el (Israel) have transgressed thy law... therefore the curse is poured upon
--      us* (Daniel 9:11); Nehemiah's: *have not kept the commandments... which thou commandedst thy
--      servant Moses* (Nehemiah 1:7). And the NT filter stands unbroken: *hereby we do know that we know
--      him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is
--      a liar* (1 John 2:3-4) — the very lies that *caused them to err*. The restored witness names the
--      Torah forsaken as death: *the law that endureth for ever: all they that keep it shall come to life;
--      but such as leave it shall die* (Baruch 4:1).
--   ★★ SOLD THE RIGHTEOUS (THREAD 2): *because they sold the righteous for silver, and the poor for a
--      pair of shoes; That pant after the dust of the earth on the head of the poor, and turn aside the
--      way of the meek* (Amos 2:6-7). The very social injustice the Torah forbids: *Thou shalt not wrest
--      the judgment of thy poor in his cause* (Exodus 23:6); *Thou shalt not oppress an hired servant
--      that is poor and needy... lest he cry against thee unto Yahuah (LORD)* (Deut 24:14-15). Amos
--      sounds it again: *That we may buy the poor for silver, and the needy for a pair of shoes* (Amos
--      8:6). James pronounces the same woe forward: *the hire of the labourers... kept back by fraud,
--      crieth* (James 5:4); *Ye have condemned and killed the just* (James 5:6). The restored witnesses
--      stand with the poor: *Let us oppress the poor righteous man* — the wicked's own scheme (Wisdom
--      2:10); *defraud not the poor of his living* (Sirach 4:1).
--   ★ PROFANE MY HOLY NAME (THREAD 3): *a man and his father will go in unto the same maid, to profane
--      my holy name: And they lay themselves down upon clothes laid to pledge by every altar* (Amos
--      2:7-8). The Torah's holiness trampled twice: the forbidden union, *The nakedness of thy father's
--      wife shalt thou not uncover* (Leviticus 18:8), which *profane[s] the name of thy Elohim (God)*
--      (Leviticus 18:21); and the pledged garment that should have been returned by sunset, *take thy
--      neighbour's raiment to pledge, thou shalt deliver it unto him by that the sun goeth down... when
--      he crieth unto me... I will hear; for I am gracious* (Exodus 22:26-27) — kept instead by every
--      altar, the poor man's covering stolen at the place of worship.
--   ★ PROPHETS AND NAZARITES (THREAD 4): *And I raised up of your sons for prophets, and of your young
--      men for Nazarites... But ye gave the Nazarites wine to drink; and commanded the prophets, saying,
--      Prophesy not* (Amos 2:11-12). Yahuah's saving grace — the Amorite destroyed, the exodus, the
--      forty years (2:9-10) — and the gift of prophets and the Nazarite-set-apart (Numbers 6:2-3, who
--      *shall separate himself from wine*) spurned: the Nazarites defiled with wine, the prophets
--      silenced. The NT names this the fathers' enduring sin: *Which of the prophets have not your
--      fathers persecuted?* (Acts 7:52); *O Jerusalem, Jerusalem, thou that killest the prophets*
--      (Matthew 23:37). Covenant-lawsuit, conduct-within-the-covenant — the lost sheep who silenced the
--      voices sent to gather them.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the Moab oracle — the turn of the lawsuit, woven in prose),
--      v.9-10 (the spurned grace — preface to THREAD 4), v.13-16 (the press of judgment, the swift not
--      delivered — the oracle's close, woven in prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★ KEYSTONE): despised the law of Yahuah — Torah affirmed, judgment FOR forsaking it
    ('canon','amos',2,4,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). Yahudah is judged for the exact inversion: *because they have despised the law of Yahuah (LORD), and have not kept his commandments* (Amos 2:4). The NT filter affirms the very standard Amos affirms — to KNOW Yahuah is to KEEP his commandments; despising the Torah and not keeping the commandments is the covenant-breaking the lawsuit punishes. The Torah is binding; the judgment falls FOR forsaking it.'),
    ('canon','amos',2,4,'canon','1-john',2,4,'free',
      E'*He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). Amos names the same lie: *their lies caused them to err* (Amos 2:4) — the false confession of knowing Yahuah while *they have despised the law of Yahuah (LORD), and have not kept his commandments*. The man who claims Him yet keeps not His commandments is *a liar*; commandment-keeping is never irrelevant — it is the proof of the truth.'),
    ('canon','amos',2,4,'canon','deuteronomy',28,15,'free',
      E'*But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). This is the covenant sanction Amos 2:4-5 enforces: Yahudah *despised the law of Yahuah (LORD), and have not kept his commandments*, so the fire devours the palaces of Jerusalem (2:5). The curse is the Deuteronomy 28 judgment for breaking the covenant — never the Torah itself, which is the inheritance forsaken.'),
    ('canon','amos',2,4,'canon','daniel',9,11,'free',
      E'*Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him* (Daniel 9:11). Daniel''s confession reads Amos 2:4 from the inside: the people *despised the law of Yahuah (LORD)* — *transgressed thy law... that they might not obey thy voice* — and *the curse is poured upon us*. The Torah stands; the curse is the sworn sanction for departing from it.'),
    ('canon','amos',2,4,'canon','nehemiah',1,7,'free',
      E'*We have dealt very corruptly against thee, and have not kept the commandments, nor the statutes, nor the judgments, which thou commandedst thy servant Moses* (Nehemiah 1:7). Nehemiah confesses the precise charge of Amos 2:4 — *have not kept his commandments* — naming the Torah as the standard never abolished but forsaken: the commandments, statutes, and judgments *commandedst thy servant Moses*. The covenant remedy is repentance and return to the Torah, not its replacement.'),
    ('canon','amos',2,4,'apocrypha','baruch-with-the-letter-of-jeremiah',4,1,'extras',
      E'*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). The restored witness names the stakes of Amos 2:4 exactly: Yahudah *despised the law of Yahuah (LORD)* — and *such as leave it shall die*. The Torah is *the law that endureth for ever*; to forsake it is to choose death, which is the judgment the lawsuit pronounces.'),

    -- THREAD 2 (★★): sold the righteous for silver — the Torah's defense of the poor trampled
    ('canon','amos',2,6,'canon','exodus',23,6,'free',
      E'*Thou shalt not wrest the judgment of thy poor in his cause* (Exodus 23:6). Yashar''el is judged for doing the forbidden thing: *they sold the righteous for silver, and the poor for a pair of shoes* (Amos 2:6). The Torah expressly guards the poor man''s judgment; selling the righteous and the poor *wrest[s] the judgment of thy poor in his cause* — the very statute Amos invokes as the covenant standard broken.'),
    ('canon','amos',2,7,'canon','deuteronomy',24,14,'free',
      E'*Thou shalt not oppress an hired servant that is poor and needy, whether he be of thy brethren, or of thy strangers that are in thy land within thy gates* (Deuteronomy 24:14). They who *pant after the dust of the earth on the head of the poor, and turn aside the way of the meek* (Amos 2:7) trample this Torah-command. The poor and needy are protected by the covenant; oppressing them is the sin the lawsuit names.'),
    ('canon','amos',2,7,'canon','deuteronomy',24,15,'free',
      E'*At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:15). To *turn aside the way of the meek* (Amos 2:7) is to make the poor man cry to Yahuah — and the Torah warns *lest he cry against thee unto Yahuah (LORD), and it be sin unto thee*. The cry of the oppressed poor is heard; the lawsuit answers it.'),
    ('canon','amos',2,6,'canon','amos',8,6,'free',
      E'*That we may buy the poor for silver, and the needy for a pair of shoes; yea, and sell the refuse of the wheat?* (Amos 8:6). Amos sounds the same indictment again: the *sold the righteous for silver, and the poor for a pair of shoes* of 2:6 is the merchants'' boast of 8:6 — *buy the poor for silver, and the needy for a pair of shoes*. The poor traded as chattel; one trampling, named twice across the prophet''s lawsuit.'),
    ('canon','amos',2,6,'canon','james',5,4,'free',
      E'*Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). James carries Amos 2:6 forward unbroken: those who *sold the righteous for silver, and the poor for a pair of shoes* are the rich whose defrauded laborers'' wages *crieth... into the ears of Yahuah (Lord) of sabaoth*. The Torah''s defense of the poor stands; the cry of the defrauded is heard in heaven.'),
    ('canon','amos',2,6,'canon','james',5,6,'free',
      E'*Ye have condemned and killed the just; and he doth not resist you* (James 5:6). The *sold the righteous for silver* of Amos 2:6 is the *condemned and killed the just* of James 5:6 — the righteous trafficked, oppressed, destroyed by the powerful. The same woe on those who trample the poor and the just for gain.'),
    ('canon','amos',2,7,'apocrypha','the-wisdom-of-solomon',2,10,'extras',
      E'*Let us oppress the poor righteous man, let us not spare the widow, nor reverence the ancient gray hairs of the aged* (Wisdom 2:10). The restored witness gives the wicked''s own voice for the sin of Amos 2:6-7 — *sold the righteous for silver... turn aside the way of the meek* — the scheme to *oppress the poor righteous man*. The poor and the righteous are one in the oppressor''s contempt; the lawsuit answers both.'),
    ('canon','amos',2,6,'apocrypha','ecclesiasticus',4,1,'extras',
      E'*My son, defraud not the poor of his living, and make not the needy eyes to wait long* (Sirach 4:1). The restored wisdom forbids exactly what Yashar''el did: *they sold the righteous for silver, and the poor for a pair of shoes* (Amos 2:6) — to *defraud... the poor of his living*. The Torah''s defense of the poor is the same wisdom Amos enforces; the needy are not to be sold but spared.'),

    -- THREAD 3 (★): profane my holy name — Lev 18 sexual sin + the pledged garment kept by the altar
    ('canon','amos',2,7,'canon','leviticus',18,8,'free',
      E'*The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8). The sin Amos names — *a man and his father will go in unto the same maid* (Amos 2:7) — is the forbidden union of Leviticus 18: father and son to the same woman, *thy father''s nakedness* uncovered. The Torah''s holiness code is the standard violated, and the violation *profane[s] my holy name*.'),
    ('canon','amos',2,7,'canon','leviticus',18,21,'free',
      E'*And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21). Amos charges that the sexual sin is *to profane my holy name* (Amos 2:7) — the very profaning Leviticus 18 forbids: *neither shalt thou profane the name of thy Elohim (God)*. To break the holiness statutes is to profane the Name; the lawsuit names the Name dishonoured.'),
    ('canon','amos',2,8,'canon','exodus',22,26,'free',
      E'*If thou at all take thy neighbour''s raiment to pledge, thou shalt deliver it unto him by that the sun goeth down* (Exodus 22:26). They who *lay themselves down upon clothes laid to pledge by every altar* (Amos 2:8) keep the garment the Torah commands returned: *deliver it unto him by that the sun goeth down*. The poor man''s covering, owed back by sunset, is stolen and lounged upon at the place of worship.'),
    ('canon','amos',2,8,'canon','exodus',22,27,'free',
      E'*For that is his covering only, it is his raiment for his skin: wherein shall he sleep? and it shall come to pass, when he crieth unto me, that I will hear; for I am gracious* (Exodus 22:27). The pledged garment of Amos 2:8 is the poor man''s only *covering... raiment for his skin* — and Yahuah swears *when he crieth unto me, that I will hear; for I am gracious*. The cry of the stripped poor is heard; to keep his garment by every altar is to mock the gracious God who hears him.'),

    -- THREAD 4 (★): prophets and Nazarites raised up and spurned; the silenced prophets
    ('canon','amos',2,11,'canon','numbers',6,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), and say unto them, When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2). The *young men for Nazarites* Yahuah raised up (Amos 2:11) are the Torah''s own set-apart ones — those who *separate themselves to vow a vow of a Nazarite... unto Yahuah (LORD)*. The gift of the consecrated is rooted in the Torah; to defile them is to spurn Yahuah''s own provision.'),
    ('canon','amos',2,12,'canon','numbers',6,3,'free',
      E'*He shall separate himself from wine and strong drink, and shall drink no vinegar of wine, or vinegar of strong drink, neither shall he drink any liquor of grapes, nor eat moist grapes, or dried* (Numbers 6:3). The Nazarite''s vow is total abstinence from wine — so the charge *ye gave the Nazarites wine to drink* (Amos 2:12) is the deliberate defiling of the consecrated, forcing them to break the very separation the Torah commands. Yahuah''s set-apart ones, made to violate their vow.'),
    ('canon','amos',2,12,'canon','acts',7,52,'free',
      E'*Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers* (Acts 7:52). Stephen names the enduring sin Amos charges: *commanded the prophets, saying, Prophesy not* (Amos 2:12). Silencing the prophets in Amos''s day is the same persecution the fathers never ceased — *Which of the prophets have not your fathers persecuted?* Covenant-lawsuit, conduct across generations, never ethnic hatred.'),
    ('canon','amos',2,12,'canon','matthew',23,37,'free',
      E'*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37). The *commanded the prophets, saying, Prophesy not* of Amos 2:12 is the *killest the prophets* of Matthew 23:37 — the voices Yahuah sent to gather, silenced and slain. And still the lament is a Gatherer''s grief: *how often would I have gathered thy children* — the lost sheep, not the cast-off; victims, not enemies.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-2-despised-the-law-of-yahuah',
       E'They despised the law of Yahuah — Yahudah judged FOR forsaking the Torah',
       E'The covenant-lawsuit turns home, and Yahudah''s charge is named precisely: *Thus saith Yahuah (LORD); For three transgressions of Yahudah (Judah), and for four, I will not turn away the punishment thereof; because they have despised the law of Yahuah (LORD), and have not kept his commandments, and their lies caused them to err, after the which their fathers have walked* (Amos 2:4). This is the anti-antinomian verse: judgment falls *because they have despised the law... and have not kept his commandments* — the Torah is AFFIRMED as the binding covenant standard, and the fire that devours the palaces of Jerusalem (2:5) is the sanction for forsaking it, never for keeping it. The curse is the Deuteronomy 28 covenant-judgment: *if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee* (Deuteronomy 28:15). Daniel''s and Nehemiah''s confessions read it the same way — *all Yashar''el (Israel) have transgressed thy law... therefore the curse is poured upon us* (Daniel 9:11); *have not kept the commandments... which thou commandedst thy servant Moses* (Nehemiah 1:7). The NT filter never relaxes the standard: *hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4) — the very *lies [that] caused them to err*. And the restored witness names the stakes: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). The Torah is the inheritance forsaken; the curse is the consequence of leaving it.',
       sv.verse_id, ev.verse_id, 'extras', 45220
  FROM _s330_amo02_lookup sv, _s330_amo02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-2-sold-the-righteous-for-silver',
       E'They sold the righteous for silver — the Torah''s defense of the poor trampled',
       E'Yashar''el''s charge is social injustice raised to covenant-crime: *because they sold the righteous for silver, and the poor for a pair of shoes; That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek* (Amos 2:6-7). Every clause violates a Torah-command guarding the poor: *Thou shalt not wrest the judgment of thy poor in his cause* (Exodus 23:6); *Thou shalt not oppress an hired servant that is poor and needy... At his day thou shalt give him his hire... lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:14-15). Amos sounds the same trafficking again: *That we may buy the poor for silver, and the needy for a pair of shoes* (Amos 8:6). James carries the woe forward unbroken: *the hire of the labourers... kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4); *Ye have condemned and killed the just* (James 5:6). And the restored witnesses stand with the poor and the righteous: *Let us oppress the poor righteous man* — the wicked''s own scheme, named to be judged (Wisdom 2:10); *My son, defraud not the poor of his living, and make not the needy eyes to wait long* (Sirach 4:1). The cry of the trampled poor enters the ears of Yahuah; the lawsuit answers it.',
       sv.verse_id, ev.verse_id, 'extras', 45223
  FROM _s330_amo02_lookup sv, _s330_amo02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-2-a-man-and-his-father-profane-my-holy-name',
       E'To profane my holy name — the holiness code trampled and the pledged garment kept',
       E'The indictment deepens to the holiness of the Name itself: *and a man and his father will go in unto the same maid, to profane my holy name: And they lay themselves down upon clothes laid to pledge by every altar, and they drink the wine of the condemned in the house of their god* (Amos 2:7-8). The forbidden union is the very sin of the holiness code: *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8) — and to break those statutes is to *profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21), the exact charge *to profane my holy name*. The pledged garment is the second crime against the poor: *If thou at all take thy neighbour''s raiment to pledge, thou shalt deliver it unto him by that the sun goeth down: For that is his covering only, it is his raiment for his skin: wherein shall he sleep? and it shall come to pass, when he crieth unto me, that I will hear; for I am gracious* (Exodus 22:26-27). The poor man''s only covering, owed back by sunset, is stolen and lounged upon *by every altar* — sin dressed as worship, the gracious God who hears the poor man''s cry mocked at the place of his honour.',
       sv.verse_id, ev.verse_id, 'free', 45226
  FROM _s330_amo02_lookup sv, _s330_amo02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-2-i-raised-up-prophets-and-nazarites',
       E'I raised up prophets and Nazarites — Yahuah''s grace spurned, the prophets silenced',
       E'Against the indictment Yahuah recites His spurned grace: the Amorite destroyed *whose height was like the height of the cedars* (2:9), the exodus and the forty years (2:10), and the gift of His own voices: *And I raised up of your sons for prophets, and of your young men for Nazarites. Is it not even thus, O ye children of Yashar''el (Israel)? saith Yahuah (LORD). But ye gave the Nazarites wine to drink; and commanded the prophets, saying, Prophesy not* (Amos 2:11-12). The Nazarite is the Torah''s own set-apart one: *When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2), who *shall separate himself from wine and strong drink* (Numbers 6:3) — so to *give the Nazarites wine to drink* is to force the consecrated to break their vow, defiling Yahuah''s own provision. And silencing the prophets is the fathers'' enduring sin the NT names: *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One* (Acts 7:52); *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together... and ye would not!* (Matthew 23:37). The voices sent to gather were silenced and slain — yet the lament is a Gatherer''s grief: the lost sheep, not the cast-off; victims, not enemies.',
       sv.verse_id, ev.verse_id, 'free', 45229
  FROM _s330_amo02_lookup sv, _s330_amo02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the filter affirms the standard Amos 2:4 affirms; to know Yahuah is to keep his commandments.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-despised-the-law-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4) — the *lies [that] caused them to err* (Amos 2:4); commandment-keeping never irrelevant.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-despised-the-law-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *if thou wilt not hearken... that all these curses shall come upon thee* (Deuteronomy 28:15) — the covenant sanction Amos 2:4-5 enforces; the curse for forsaking the Torah, never for it.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-despised-the-law-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *all Yashar''el (Israel) have transgressed thy law... therefore the curse is poured upon us* (Daniel 9:11) — Daniel reads Amos 2:4 from within; the Torah stands, the curse is the sanction for departing.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-despised-the-law-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *have not kept the commandments... which thou commandedst thy servant Moses* (Nehemiah 1:7) — the precise charge of Amos 2:4; the Torah forsaken, the remedy return not replacement.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-despised-the-law-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1) — the stakes of despising the Torah (Amos 2:4); to leave it is to choose death.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-despised-the-law-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt not wrest the judgment of thy poor in his cause* (Exodus 23:6) — the Torah-statute broken by selling the righteous and the poor (Amos 2:6).'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou shalt not oppress an hired servant that is poor and needy* (Deuteronomy 24:14) — the command trampled by those who *turn aside the way of the meek* (Amos 2:7).'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:15) — the cry of the meek turned aside (Amos 2:7) is heard; the lawsuit answers it.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *buy the poor for silver, and the needy for a pair of shoes* (Amos 8:6) — the same trafficking of Amos 2:6 sounded again across the prophet''s lawsuit.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the hire of the labourers... kept back by fraud, crieth... into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — Amos 2:6 carried forward; the defrauded poor''s cry heard in heaven.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Ye have condemned and killed the just; and he doth not resist you* (James 5:6) — the *sold the righteous for silver* (Amos 2:6) become the *killed the just*.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Let us oppress the poor righteous man* (Wisdom 2:10) — the wicked''s own scheme for the sin of Amos 2:6-7; the poor and the righteous one in the oppressor''s contempt.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*defraud not the poor of his living, and make not the needy eyes to wait long* (Sirach 4:1) — the restored wisdom forbids exactly what Yashar''el did (Amos 2:6).'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-sold-the-righteous-for-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *The nakedness of thy father''s wife shalt thou not uncover* (Leviticus 18:8) — the forbidden union of Amos 2:7, father and son to the same woman.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-a-man-and-his-father-profane-my-holy-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21) — the exact charge *to profane my holy name* (Amos 2:7); breaking the holiness code profanes the Name.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-a-man-and-his-father-profane-my-holy-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *take thy neighbour''s raiment to pledge, thou shalt deliver it unto him by that the sun goeth down* (Exodus 22:26) — the garment of Amos 2:8 owed back by sunset, kept instead by every altar.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-a-man-and-his-father-profane-my-holy-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *that is his covering only... when he crieth unto me, that I will hear; for I am gracious* (Exodus 22:27) — the poor man''s only covering (Amos 2:8); the gracious God who hears him mocked at the altar.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-a-man-and-his-father-profane-my-holy-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2) — the *young men for Nazarites* of Amos 2:11 are the Torah''s own set-apart ones.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-i-raised-up-prophets-and-nazarites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He shall separate himself from wine and strong drink* (Numbers 6:3) — so *ye gave the Nazarites wine to drink* (Amos 2:12) forces the consecrated to break their vow.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-i-raised-up-prophets-and-nazarites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Which of the prophets have not your fathers persecuted?* (Acts 7:52) — the *commanded the prophets, saying, Prophesy not* (Amos 2:12) is the fathers'' enduring sin; covenant-lawsuit across generations.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-i-raised-up-prophets-and-nazarites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *O Jerusalem... thou that killest the prophets... how often would I have gathered thy children* (Matthew 23:37) — Amos 2:12''s silenced prophets; a Gatherer''s grief, the lost sheep not the cast-off.'
  FROM cross_reference_threads t
  JOIN _s330_amo02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s330_amo02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-2-i-raised-up-prophets-and-nazarites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_3.sql (Amos 3) -----
-- Chapter: Amos 3 — THE COVENANT LAWSUIT OPENED. *Hear this word that Yahuah (LORD) hath spoken
-- against you, O children of Yashar'el (Israel), against the whole family which I brought up from
-- the land of Egypt* (3:1). The chapter holds two keystones. First, ELECTION IS RESPONSIBILITY:
-- *You only have I known of all the families of the earth: therefore I will punish you for all your
-- iniquities* (3:2) — chosenness is not exemption but greater accountability. Second, THE SECRET
-- REVEALED TO THE PROPHETS: *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth
-- his secret unto his servants the prophets* (3:7) — the prophetic word as Yahuah's disclosed
-- counsel. Between them runs the chain of cause and effect (3:3-6, nothing by chance, *shall there
-- be evil in a city, and Yahuah (LORD) hath not done it?*) and the compulsion of the call (3:8,
-- *the lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but
-- prophesy?*). Then the lawsuit's verdict on Samaria's oppression, the altars of Bethel with their
-- horns cut off, the tiny remnant rescued *as the shepherd taketh out of the mouth of the lion two
-- legs, or a piece of an ear* (3:9-15). Read the lawsuit as conduct-within-the-covenant — victims,
-- not enemies; a remnant always preserved (Romans 11:1-2 guard woven in prose).
-- Tag: amo03   Temp view: _s330_amo03_lookup
-- Sort band: base 45240, step 3 -> threads at 45240, 45243, 45246, 45249 (4 threads)
-- Source of EVERY row: 'canon','amos',3,v
--
-- Amos 3 coverage:
--   ★★ v.1-2 (the whole family which I brought up from the land of Egypt... You only have I known of
--          all the families of the earth: therefore I will punish you for all your iniquities)
--        NT:     ★★ Luke 12:48 (unto whomsoever much is given, of him shall be much required),
--                ★ Romans 2:9 (Tribulation and anguish... of the Yahudi (Jew) first), ★★ 1 Peter 4:17
--                (judgment must begin at the house of Elohim (God)) — THREAD 1
--        Extras: ★ Wisdom of Solomon 6:6 (mighty men shall be mightily tormented) — THREAD 1
--        Tanakh: ★ Deuteronomy 7:6 (Yahuah Elohayka hath chosen thee to be a special people) — THREAD 1
--   ★ v.3-6 (Can two walk together, except they be agreed?... shall there be evil in a city, and
--          Yahuah (LORD) hath not done it?)
--        NT:     none warranted distinct (the cause-and-effect chain is a Tanakh sovereignty theme;
--                its NT weight is carried in the lawsuit prose, not forced to one verse)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 45:7 (I make peace, and create evil: I Yahuah (LORD) do all these things),
--                ★ Lamentations 3:37-38 (Who is he that saith... when Yahuah (Lord) commandeth it not?)
--                — THREAD 2 (nothing by chance; Yahuah behind the judgment)
--   ★★ v.7 (Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto
--          his servants the prophets)
--        NT:     ★★ Revelation 10:7 (the mystery of Elohim (God)... as he hath declared to his
--                servants the prophets), ★★ John 15:15 (all things that I have heard of my Father I
--                have made known unto you) — THREAD 3
--        Extras: ★ Sirach 48:25 (He shewed what should come to pass for ever, and secret things or
--                ever they came), ★ 1 Enoch 1:2 (whose eyes were opened by Elohim... I understood as
--                I saw, but not for this generation, but for a remote one) — THREAD 3
--        Tanakh: ★ Genesis 18:17 (Shall I hide from Abraham that thing which I do), ★ Daniel 2:28
--                (there is a Elohim (God) in heaven that revealeth secrets) — THREAD 3
--   ★ v.8 (The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who
--          can but prophesy?)
--        NT:     ★ Acts 4:20 (we can not but speak the things which we have seen and heard),
--                ★ 1 Corinthians 9:16 (woe is unto me, if I preach not the gospel) — THREAD 4
--        Extras: none warranted (clean compulsion witness carried by Jeremiah + the NT)
--        Tanakh: ★★ Jeremiah 20:9 (his word was in mine heart as a burning fire shut up in my bones),
--                ★ Amos 1:2 (Yahuah (LORD) will roar from Zion) — THREAD 4
--   v.9-12 (the great tumults... the oppressed... they know not to do right... who store up violence
--          and robbery in their palaces... as the shepherd taketh out of the mouth of the lion two
--          legs, or a piece of an ear)
--        NT:     none warranted distinct (the oppression-lawsuit and the tiny-remnant rescue are
--                woven in the chapter prose; the remnant is the two-house theme guarded in prose)
--        Extras: none warranted
--        Tanakh: none forced (the shepherd-rescue remnant carried in prose; no single lateral forced)
--   v.13-15 (testify in the house of Jacob... I will also visit the altars of Beth-el: and the horns
--          of the altar shall be cut off... the houses of ivory shall perish)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none forced (the Bethel-altar judgment is the lawsuit's verdict; held in prose)
--
-- Threads (slug — target libraries):
--   1. amos-3-you-only-have-i-known-therefore-i-will-punish-you — NT (Luke 12, Romans 2, 1 Peter 4)
--      + Extras (Wisdom 6) + Tanakh (Deuteronomy 7) [extras]
--      (★★ election is responsibility — chosenness is greater accountability, not exemption)
--   2. amos-3-shall-there-be-evil-and-yahuah-hath-not-done-it — Tanakh (Isaiah 45, Lamentations 3) [free]
--      (★ the chain of cause and effect; nothing by chance, Yahuah behind the judgment)
--   3. amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets — NT (Revelation 10, John 15)
--      + Extras (Sirach 48, 1 Enoch 1) + Tanakh (Genesis 18, Daniel 2) [extras]
--      (★★ the prophetic word as Yahuah's disclosed counsel — the secret shown to the servants)
--   4. amos-3-the-lion-hath-roared-who-can-but-prophesy — NT (Acts 4, 1 Corinthians 9)
--      + Tanakh (Jeremiah 20, Amos 1) [free]
--      (★ the compulsion of the prophetic call — the word a fire that cannot be held back)
--
-- Framing notes:
--   ★★ ELECTION IS RESPONSIBILITY (THREAD 1): *You only have I known of all the families of the
--      earth: therefore I will punish you for all your iniquities* (Amos 3:2). The "therefore" is the
--      whole lesson — being chosen does not exempt, it accounts. Yahusha states the principle:
--      *unto whomsoever much is given, of him shall be much required* (Luke 12:48). Paul orders the
--      judgment by privilege: *Tribulation and anguish... of the Yahudi (Jew) first* (Romans 2:9).
--      Peter puts the household first under the fire: *judgment must begin at the house of Elohim
--      (God)* (1 Peter 4:17). The chosenness is real — *Yahuah Elohayka (the LORD thy God) hath
--      chosen thee to be a special people unto himself* (Deuteronomy 7:6) — and precisely because it
--      is real, *the whole family* brought up from Egypt (the two houses, 3:1) is held to the higher
--      standard. Covenant-lawsuit, never ethnic; the lost sheep held accountable, not cast off.
--   ★ NOTHING BY CHANCE (THREAD 2): the chain of cause and effect drives to one point — *shall there
--      be evil in a city, and Yahuah (LORD) hath not done it?* (Amos 3:6). Isaiah says it plainest:
--      *I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all
--      these things* (Isaiah 45:7); and Lamentations: *Who is he that saith, and it cometh to pass,
--      when Yahuah (Lord) commandeth it not?* (Lamentations 3:37). The judgment falling on Samaria is
--      not blind fate — it is Yahuah's own covenant-lawsuit verdict.
--   ★★ THE SECRET TO THE PROPHETS (THREAD 3): *Surely Adonai Yahuah (the Lord GOD) will do nothing,
--      but he revealeth his secret unto his servants the prophets* (Amos 3:7). This is the charter of
--      prophecy. Yahuah disclosed his counsel before Sodom — *Shall I hide from Abraham that thing
--      which I do* (Genesis 18:17); he reveals what shall be to Daniel — *there is a Elohim (God) in
--      heaven that revealeth secrets* (Daniel 2:28); the seventh trumpet finishes the disclosed
--      mystery *as he hath declared to his servants the prophets* (Revelation 10:7); and the Formed
--      Son hands his servants the Father's whole counsel — *all things that I have heard of my Father
--      I have made known unto you* (John 15:15). The restored witnesses sing the same: Isaiah *shewed
--      what should come to pass for ever, and secret things or ever they came* (Sirach 48:25), and
--      Enoch *whose eyes were opened by Elohim (God)... understood as I saw, but not for this
--      generation, but for a remote one which is for to come* (1 Enoch 1:2). One disclosed counsel,
--      shown to the servants.
--   ★ THE COMPULSION (THREAD 4): *The lion hath roared, who will not fear? Adonai Yahuah (the Lord
--      GOD) hath spoken, who can but prophesy?* (Amos 3:8) — the roar of Amos 1:2 (*Yahuah (LORD)
--      will roar from Zion*) lays a necessity on the one who hears. Jeremiah feels it as fire: *his
--      word was in mine heart as a burning fire shut up in my bones, and I was weary with forbearing,
--      and I could not stay* (Jeremiah 20:9). The apostles: *we can not but speak the things which we
--      have seen and heard* (Acts 4:20); *woe is unto me, if I preach not the gospel* (1 Corinthians
--      9:16). The roar compels the prophecy.
--   EXTRAS: Wisdom of Solomon 6:6 (the mighty mightily tormented — privilege accounted) on THREAD 1;
--      Sirach 48:25 (Isaiah shewing secret things) and 1 Enoch 1:2 (the seer's opened eyes) on
--      THREAD 3. Clean witnesses, parses verified.
--   VERSES WITH NO SEPARATE ADD: v.3-5 (the chain's opening links — woven into THREAD 2 with the v.6
--      keystone); v.9-12 (the oppression-lawsuit and the shepherd-rescue of the tiny remnant — the
--      remnant is the two-house theme, carried in the chapter prose, no single forced add);
--      v.13-15 (the Bethel-altar judgment, the horns cut off, the ivory houses — the lawsuit's
--      verdict, held in prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): You only have I known... therefore I will punish you (election = responsibility)
    ('canon','amos',3,2,'canon','luke',12,48,'free',
      E'*But he that knew not, and did commit things worthy of stripes, shall be beaten with few stripes. For unto whomsoever much is given, of him shall be much required: and to whom men have committed much, of him they will ask the more* (Luke 12:48). This is the very logic of *You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2). Chosenness is not exemption; the more given, the more required. The covenant people held to the higher account.'),
    ('canon','amos',3,2,'canon','romans',2,9,'free',
      E'*Tribulation and anguish, upon every soul of man that doeth evil, of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9). Amos''s *therefore I will punish you* (3:2) is the same order Paul names: judgment falls *of the Yahudi (Jew) first*. The privilege of being known first means being held to account first; *for there is no respect of persons with Elohim (God)* (Romans 2:11).'),
    ('canon','amos',3,2,'canon','1-peter',4,17,'free',
      E'*For the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)?* (1 Peter 4:17). The household Yahuah *only have I known* (Amos 3:2) is the household where judgment begins. To be the people brought up from Egypt (3:1) is to stand first under the fire — election as accountability, never as a covering for sin.'),
    ('canon','amos',3,2,'canon','deuteronomy',7,6,'free',
      E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). This is the choosing Amos invokes: *You only have I known of all the families of the earth* (Amos 3:2). The election is real and gracious — and exactly because it is real, it raises the standard: *therefore I will punish you for all your iniquities*.'),
    ('canon','amos',3,2,'apocrypha','the-wisdom-of-solomon',6,6,'extras',
      E'*For mercy will soon pardon the meanest: but mighty men shall be mightily tormented* (Wisdom of Solomon 6:6). The restored witness holds Amos''s principle: greater standing brings greater reckoning. As Yahuah''s *only* known people draw the heavier *therefore I will punish you* (Amos 3:2), so *mighty men shall be mightily tormented* — privilege accounted, not excused.'),

    -- THREAD 2 (★): Shall there be evil in a city, and Yahuah hath not done it? (nothing by chance)
    ('canon','amos',3,6,'canon','isaiah',45,7,'free',
      E'*I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7). Amos asks *shall there be evil in a city, and Yahuah (LORD) hath not done it?* (3:6) and Isaiah answers without flinching: *I make peace, and create evil: I Yahuah (LORD) do all these things*. The calamity falling on Samaria is no accident of history but Yahuah''s own covenant-lawsuit verdict.'),
    ('canon','amos',3,6,'canon','lamentations',3,37,'free',
      E'*Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not?* (Lamentations 3:37). The chain of cause and effect — *Can two walk together, except they be agreed?* (Amos 3:3) — drives to the truth that nothing comes to pass apart from Yahuah''s word. *Shall there be evil in a city, and Yahuah (LORD) hath not done it?* (3:6) and *Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not?* are the same confession: He stands behind the judgment.'),

    -- THREAD 3 (★★): He revealeth his secret unto his servants the prophets (the disclosed counsel)
    ('canon','amos',3,7,'canon','revelation',10,7,'free',
      E'*But in the days of the voice of the seventh angel, when he shall begin to sound, the mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7). Amos''s charter — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (3:7) — runs to its end here: the mystery *finished, as he hath declared to his servants the prophets*. The disclosed counsel of Yahuah, opened from Amos to the last trumpet.'),
    ('canon','amos',3,7,'canon','john',15,15,'free',
      E'*Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you* (John 15:15). The Formed Son does the very thing Amos names — *he revealeth his secret unto his servants* (3:7) — handing on the Father''s whole counsel: *all things that I have heard of my Father I have made known unto you*. The secret shown to the prophets is the Father''s counsel disclosed.'),
    ('canon','amos',3,7,'canon','genesis',18,17,'free',
      E'*And Yahuah (LORD) said, Shall I hide from Abraham that thing which I do* (Genesis 18:17). Before Sodom fell, Yahuah disclosed his purpose to his friend — the pattern Amos states as law: *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (3:7). He does not act in judgment without first opening his counsel to his own.'),
    ('canon','amos',3,7,'canon','daniel',2,28,'free',
      E'*But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28). Daniel confesses the same Yahuah Amos preaches — the One who *revealeth his secret unto his servants the prophets* (Amos 3:7). *There is a Elohim (God) in heaven that revealeth secrets*: the disclosed counsel, made known through his servant the seer.'),
    ('canon','amos',3,7,'apocrypha','ecclesiasticus',48,25,'extras',
      E'*He shewed what should come to pass for ever, and secret things or ever they came* (Sirach 48:25). Of Isaiah the prophet the restored witness says he was shown what should come *or ever they came* — the very disclosure Amos names: *he revealeth his secret unto his servants the prophets* (3:7). The prophet sees the secret things before they arrive because Yahuah opens his counsel to his servants.'),
    ('canon','amos',3,7,'enoch','1-enoch',1,2,'extras',
      E'*And he took up his parable and said—Enoch a righteous man, whose eyes were opened by Elohim (God), saw the vision of the Holy One in the heavens, which the angels showed me, and from them I heard everything, and from them I understood as I saw, but not for this generation, but for a remote one which is for to come* (1 Enoch 1:2). The seer''s opened eyes are Amos''s charter in person: *he revealeth his secret unto his servants the prophets* (3:7). Enoch *understood as I saw* — the disclosed counsel given to a servant, kept for a generation to come.'),

    -- THREAD 4 (★): The lion hath roared, who can but prophesy? (the compulsion of the call)
    ('canon','amos',3,8,'canon','jeremiah',20,9,'free',
      E'*Then I said, I will not make mention of him, nor speak any more in his name. But his word was in mine heart as a burning fire shut up in my bones, and I was weary with forbearing, and I could not stay* (Jeremiah 20:9). Amos''s *who can but prophesy?* (3:8) is Jeremiah''s lived agony — he resolves to be silent, and *his word was in mine heart as a burning fire... and I could not stay*. The roar lays a necessity on the prophet that he cannot refuse.'),
    ('canon','amos',3,8,'canon','acts',4,20,'free',
      E'*For we can not but speak the things which we have seen and heard* (Acts 4:20). Forbidden to speak, the apostles answer with Amos''s logic: *the lion hath roared, who will not fear?... who can but prophesy?* (3:8). *We can not but speak* — the same compulsion that drove the prophet drives the witness; the word heard demands utterance.'),
    ('canon','amos',3,8,'canon','1-corinthians',9,16,'free',
      E'*For though I preach the gospel, I have nothing to glory of: for necessity is laid upon me; yea, woe is unto me, if I preach not the gospel!* (1 Corinthians 9:16). *Necessity is laid upon me* is Amos''s *who can but prophesy?* (3:8) in Paul''s mouth — *woe is unto me, if I preach not*. When *Adonai Yahuah (the Lord GOD) hath spoken* (3:8), the one who heard has no liberty to keep silent.'),
    ('canon','amos',3,8,'canon','amos',1,2,'free',
      E'*And he said, Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem; and the habitations of the shepherds shall mourn, and the top of Carmel shall wither* (Amos 1:2). The roar that compels the prophecy in 3:8 — *the lion hath roared, who will not fear?* — is the very roar that opened the book: *Yahuah (LORD) will roar from Zion*. The lion is Yahuah himself; his roar from Zion is the word the prophet must then speak.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-3-you-only-have-i-known-therefore-i-will-punish-you',
       E'You only have I known — therefore I will punish you (election is responsibility)',
       E'The covenant lawsuit opens by naming the accused as the chosen: *Hear this word that Yahuah (LORD) hath spoken against you, O children of Yashar''el (Israel), against the whole family which I brought up from the land of Egypt* (Amos 3:1). And then the keystone: *You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (3:2). The word is *therefore*. Being known is not a covering for sin — it is the ground of a higher accounting. The choosing is real and gracious: *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6); and exactly because it is real, it raises the standard. Yahusha states the principle bare: *unto whomsoever much is given, of him shall be much required: and to whom men have committed much, of him they will ask the more* (Luke 12:48). Paul orders the judgment by privilege: *Tribulation and anguish, upon every soul of man that doeth evil, of the Yahudi (Jew) first* (Romans 2:9). Peter puts the household first under the fire: *the time is come that judgment must begin at the house of Elohim (God)* (1 Peter 4:17). The restored witness keeps the same scale: *mighty men shall be mightily tormented* (Wisdom of Solomon 6:6). Read it as covenant-lawsuit, never ethnic hatred — *the whole family* brought up from Egypt is the two houses, the lost sheep held to account, never the cast-off; *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). Election is responsibility, not exemption.',
       sv.verse_id, ev.verse_id, 'extras', 45240
  FROM _s330_amo03_lookup sv, _s330_amo03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-3-shall-there-be-evil-and-yahuah-hath-not-done-it',
       E'Shall there be evil in a city, and Yahuah hath not done it? (nothing by chance)',
       E'A run of plain questions teaches that effects do not come without causes, and causes do not come without Yahuah: *Can two walk together, except they be agreed? Will a lion roar in the forest, when he hath no prey?... Can a bird fall in a snare upon the earth, where no gin is for him?... Shall a trumpet be blown in the city, and the people not be afraid?* (Amos 3:3-6). The chain lands on the point: *shall there be evil in a city, and Yahuah (LORD) hath not done it?* (3:6). The judgment falling on Samaria is no accident of history. Isaiah says it plainest: *I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7). And Lamentations confesses it under the rod: *Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not? Out of the mouth of the El Elyon (most High) proceedeth not evil and good?* (Lamentations 3:37-38). Nothing by chance — the covenant-lawsuit calamity is Yahuah''s own verdict, the trumpet of warning that should make the city afraid.',
       sv.verse_id, ev.verse_id, 'free', 45243
  FROM _s330_amo03_lookup sv, _s330_amo03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets',
       E'He revealeth his secret unto his servants the prophets (the disclosed counsel)',
       E'Between the warning trumpet and the roaring lion stands the charter of prophecy itself: *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (Amos 3:7). Yahuah does not act in judgment without first opening his counsel to his own. It was so before Sodom — *And Yahuah (LORD) said, Shall I hide from Abraham that thing which I do* (Genesis 18:17); so to the exile''s seer — *there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28); and so to the end, when the seventh angel sounds and *the mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7). The Formed Son does the very thing Amos names, handing his servants the Father''s whole counsel: *all things that I have heard of my Father I have made known unto you* (John 15:15). The restored witnesses sing it too: of Isaiah, *He shewed what should come to pass for ever, and secret things or ever they came* (Sirach 48:25); and Enoch, *whose eyes were opened by Elohim (God)... I understood as I saw, but not for this generation, but for a remote one which is for to come* (1 Enoch 1:2). One disclosed counsel, opened to the servants — the sure prophetic word.',
       sv.verse_id, ev.verse_id, 'extras', 45246
  FROM _s330_amo03_lookup sv, _s330_amo03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-3-the-lion-hath-roared-who-can-but-prophesy',
       E'The lion hath roared — who can but prophesy? (the compulsion of the call)',
       E'The chapter''s lion-imagery turns from threat to vocation: *The lion hath roared, who will not fear? Adonai Yahuah (the Lord GOD) hath spoken, who can but prophesy?* (Amos 3:8). The roar is Yahuah''s own — the roar that opened the book: *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2). And the one who hears it has no liberty to keep silent. Jeremiah lived the agony of trying: *Then I said, I will not make mention of him, nor speak any more in his name. But his word was in mine heart as a burning fire shut up in my bones, and I was weary with forbearing, and I could not stay* (Jeremiah 20:9). The apostles, forbidden to speak, answered the same way: *we can not but speak the things which we have seen and heard* (Acts 4:20). And Paul: *necessity is laid upon me; yea, woe is unto me, if I preach not the gospel!* (1 Corinthians 9:16). When the lion roars, fear comes unbidden; when *Adonai Yahuah (the Lord GOD) hath spoken*, the word comes out — *who can but prophesy?*',
       sv.verse_id, ev.verse_id, 'free', 45249
  FROM _s330_amo03_lookup sv, _s330_amo03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *unto whomsoever much is given, of him shall be much required* (Luke 12:48) — the bare principle of Amos''s *therefore I will punish you* (3:2); chosenness accounts, never exempts.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-you-only-have-i-known-therefore-i-will-punish-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Tribulation and anguish... of the Yahudi (Jew) first* (Romans 2:9) — judgment falls first on the people first known (Amos 3:2); no respect of persons with Elohim.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-you-only-have-i-known-therefore-i-will-punish-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *judgment must begin at the house of Elohim (God)* (1 Peter 4:17) — the household Yahuah *only have I known* (Amos 3:2) stands first under the fire.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-you-only-have-i-known-therefore-i-will-punish-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* (Deuteronomy 7:6) — the real, gracious choosing Amos invokes as *You only have I known* (3:2); election that raises the standard.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-you-only-have-i-known-therefore-i-will-punish-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *mighty men shall be mightily tormented* (Wisdom of Solomon 6:6) — the restored witness keeps Amos''s scale: greater standing, greater reckoning (3:2).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-you-only-have-i-known-therefore-i-will-punish-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7) — the answer to Amos''s *shall there be evil in a city, and Yahuah (LORD) hath not done it?* (3:6).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-shall-there-be-evil-and-yahuah-hath-not-done-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not?* (Lamentations 3:37) — nothing comes to pass apart from his word; the same confession as Amos 3:6.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-shall-there-be-evil-and-yahuah-hath-not-done-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the mystery of Elohim (God) should be finished, as he hath declared to his servants the prophets* (Revelation 10:7) — Amos''s charter (3:7) run to its end at the seventh trumpet.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *all things that I have heard of my Father I have made known unto you* (John 15:15) — the Formed Son revealing his secret to his servants, exactly as Amos 3:7.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Shall I hide from Abraham that thing which I do* (Genesis 18:17) — Yahuah opening his counsel before Sodom; the pattern Amos states as law (3:7).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *there is a Elohim (God) in heaven that revealeth secrets* (Daniel 2:28) — the same Yahuah Amos preaches, making known what shall be through his servant the seer (3:7).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *He shewed what should come to pass for ever, and secret things or ever they came* (Sirach 48:25) — of Isaiah; the prophet shown the secret things before they arrive (Amos 3:7).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *whose eyes were opened by Elohim (God)... I understood as I saw, but not for this generation, but for a remote one which is for to come* (1 Enoch 1:2) — the seer''s opened eyes are Amos''s charter in person (3:7).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-he-revealeth-his-secret-unto-his-servants-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *his word was in mine heart as a burning fire shut up in my bones... and I could not stay* (Jeremiah 20:9) — Amos''s *who can but prophesy?* (3:8) lived as agony; the word cannot be held back.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=20 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-the-lion-hath-roared-who-can-but-prophesy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *we can not but speak the things which we have seen and heard* (Acts 4:20) — the apostles answer with Amos''s logic: when the Lord has spoken, silence is not possible (3:8).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-the-lion-hath-roared-who-can-but-prophesy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *necessity is laid upon me; yea, woe is unto me, if I preach not the gospel!* (1 Corinthians 9:16) — Paul''s *necessity* is Amos''s *who can but prophesy?* (3:8).'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-the-lion-hath-roared-who-can-but-prophesy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2) — the roar that compels the prophecy in 3:8 is the very roar that opened the book; the lion is Yahuah himself.'
  FROM cross_reference_threads t
  JOIN _s330_amo03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s330_amo03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-3-the-lion-hath-roared-who-can-but-prophesy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_4.sql (Amos 4) -----
-- Chapter: Amos 4 — THE KINE OF BASHAN; THE DISCIPLINES IGNORED; "PREPARE TO MEET THY ELOHIM."
-- The luxurious elite of Samaria *which oppress the poor, which crush the needy* (4:1) are summoned to
-- judgment; their zealous worship at the false shrines is itself transgression — *Come to Beth-el, and
-- transgress... for this liketh you* (4:4-5), worship that pleases THEM, not Yahuah (the corrupted
-- worship judged, NOT the appointed times abolished). The chapter's spine is the fivefold discipline
-- with its refrain *yet have ye not returned unto me, saith Yahuah (LORD)* (4:6-11) — famine, drought,
-- blight, pestilence, overthrow, each a covenant-curse of Leviticus 26 / Deuteronomy 28 sent to TURN
-- them, refused. The summons follows: *prepare to meet thy Elohim (God), O Yashar'el (Israel)* (4:12),
-- and the chapter closes in a Creator-doxology naming the Maker who *formeth the mountains... declareth
-- unto man what is his thought... Yahuah (LORD), The Elohim (God) of hosts, is his name* (4:13) — the
-- Formed Maker who declares his thought to man (one of the three Amos doxologies).
-- Tag: amo04   Temp view: _s330_amo04_lookup
-- Sort band: base 45260, step 3 -> threads at 45260, 45263, 45266, 45269, 45272, 45275 (6 threads)
-- Source of EVERY row: 'canon','amos',4,v
--
-- Amos 4 coverage:
--   ★ v.1-3 (ye kine of Bashan... which oppress the poor, which crush the needy... he will take you
--          away with hooks)
--        NT:     ★ James 5:1-6 (Go to now, ye rich men, weep and howl... the hire of the labourers...
--                kept back by fraud, crieth) — THREAD 1
--        Extras: none warranted (the oppressed-poor weave is full in canon)
--        Tanakh: ★ Amos 2:6-7 (sold the righteous for silver, and the poor for a pair of shoes), Amos
--                5:11 (your treading is upon the poor... ye have built houses of hewn stone, but ye
--                shall not dwell in them) — THREAD 1
--   ★ v.4-5 (Come to Beth-el, and transgress; at Gilgal multiply transgression... for this liketh you)
--        NT:     none warranted distinct (the heart-vs-worship weave is the Tanakh prophets' own)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 1:11-15 (To what purpose is the multitude of your sacrifices... when ye make
--                many prayers, I will not hear; your hands are full of blood), Amos 5:21-23 (I hate, I
--                despise your feast days... I will not hear the melody of thy viols), Hosea 6:6 framed in
--                prose — THREAD 2 (corrupted worship judged, NOT the feasts abolished)
--   ★★ v.6-11 (the fivefold discipline — famine, drought, blight, pestilence, overthrow — each closing:
--          yet have ye not returned unto me, saith Yahuah (LORD))
--        NT:     ★★ Hebrews 12:5-6 (whom Yahuah loveth he chasteneth), 12:11 (afterward it yieldeth the
--                peaceable fruit of righteousness); ★ Revelation 9:20 (yet repented not of the works of
--                their hands) — THREAD 3
--        Extras: ★ Wisdom 12:2 (chastenest you them by little and little... that leaving their wickedness
--                they may believe), ★ Ecclesiasticus 16:12 (As his mercy is great, so is his correction
--                also) — THREAD 3
--        Tanakh: ★★ Leviticus 26:18 (if ye will not yet for all this hearken... I will punish you seven
--                times more), 26:23-24 (if ye will not be reformed by me by these things... I will walk
--                contrary unto you), 26:40 (if they shall confess their iniquity); ★ Deuteronomy 28:22
--                (blasting, and... mildew), 28:27 (the botch of Egypt) — THREAD 3
--   ★ v.11 (I have overthrown some of you, as Elohim overthrew Sodom and Gomorrah... a firebrand
--          plucked out of the burning)
--        NT:     none warranted distinct (Sodom-overthrow held; Amos quotes the Genesis event itself)
--        Extras: none warranted (clean canon witness preferred)
--        Tanakh: ★ Genesis 19:24-25 (Yahuah rained upon Sodom and upon Gomorrah brimstone and fire),
--                19:29 (Elohim remembered Abraham, and sent Lot out of the midst of the overthrow) — THREAD 4
--   ★★ v.12 (prepare to meet thy Elohim, O Yashar'el)
--        NT:     ★★ Hebrews 10:31 (a fearful thing to fall into the hands of the living Elohim), ★ Matthew
--                24:44 (be ye also ready: for in such an hour as ye think not the Son of Adam cometh) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★ Amos 5:18 (the day of Yahuah is darkness, and not light) — THREAD 5
--   ★ v.13 (he that formeth the mountains, and createth the wind, and declareth unto man what is his
--          thought... Yahuah, The Elohim of hosts, is his name)
--        NT:     none warranted distinct (Creator-doxology held in Tanakh; Gen 1 the root)
--        Extras: none warranted (clean canon witness preferred)
--        Tanakh: ★ Genesis 1:1 (In the beginning Elohim created the heaven and the earth); ★ Isaiah 40:12
--                (Who hath measured the waters... and weighed the mountains in scales), 40:26 (behold who
--                hath created these things); ★ Psalm 139:2 (thou understandest my thought afar off); Amos
--                5:8 / 9:6 the sister-doxologies framed in prose — THREAD 6
--
-- Threads (slug — target libraries):
--   1. amos-4-the-kine-of-bashan-which-oppress-the-poor — NT (James 5) + Tanakh (Amos 2, Amos 5) [free]
--      (★ the elite oppressing the poor; the Torah's defense of the needy, the hire kept back crieth)
--   2. amos-4-come-to-bethel-and-transgress-for-this-liketh-you — Tanakh (Isaiah 1, Amos 5) [free]
--      (★ corrupted worship that pleases THEM is transgression — NOT the appointed times abolished)
--   3. amos-4-yet-have-ye-not-returned-unto-me — NT (Hebrews 12, Rev 9) + Extras (Wisdom 12, Sirach 16)
--      + Tanakh (Leviticus 26, Deuteronomy 28) [extras]
--      (★★ the fatherly discipline-refrain; Lev 26 escalating curses meant to drive return, refused)
--   4. amos-4-as-elohim-overthrew-sodom-and-gomorrah — Tanakh (Genesis 19) [free]
--      (★ the firebrand plucked out of the burning; the Sodom-overthrow as warning-mercy)
--   5. amos-4-prepare-to-meet-thy-elohim — NT (Hebrews 10, Matthew 24) + Tanakh (Amos 5) [free]
--      (★★ the summons to stand before Yahuah; the day of Yahuah; be ye ready)
--   6. amos-4-he-that-formeth-the-mountains-yahuah-is-his-name — Tanakh (Genesis 1, Isaiah 40, Psalm 139) [free]
--      (★ the Creator-doxology; the Formed Maker who declares his thought to man)
--
-- Framing notes:
--   ★ THE KINE OF BASHAN (THREAD 1): *Hear this word, ye kine of Bashan... which oppress the poor, which
--      crush the needy* (4:1). James pronounces the same woe on the same sin: *Go to now, ye rich men,
--      weep and howl for your miseries that shall come upon you... the hire of the labourers who have
--      reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which
--      have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:1-4). Amos' own lawsuit
--      named it before: *they sold the righteous for silver, and the poor for a pair of shoes* (Amos 2:6),
--      *your treading is upon the poor... ye have built houses of hewn stone, but ye shall not dwell in
--      them* (Amos 5:11). The Torah's defense of the poor is the standard; the oppressing elite are
--      victims of their own greed-system under judgment, not an ethnic class hated.
--   ★ THIS LIKETH YOU (THREAD 2): *Come to Beth-el, and transgress; at Gilgal multiply transgression...
--      for this liketh you, O ye children of Yashar'el (Israel)* (4:4-5). The biting irony: their zealous
--      sacrifices at the false shrines are themselves the transgression — worship that pleases THEM, not
--      Yahuah. This is NOT the appointed times of Leviticus 23 abolished; it is corrupted, self-pleasing
--      worship divorced from obedience and justice that Yahuah rejects, as Isaiah and Amos both declare:
--      *To what purpose is the multitude of your sacrifices unto me?... when ye make many prayers, I will
--      not hear: your hands are full of blood* (Isaiah 1:11,15); *I hate, I despise your feast days...
--      Take thou away from me the noise of thy songs* (Amos 5:21,23). The feasts stand; the heart that
--      empties them is condemned.
--   ★★ YET HAVE YE NOT RETURNED UNTO ME (THREAD 3): the refrain across 4:6-11 binds five chastenings —
--      famine (*cleanness of teeth*, 4:6), withheld rain (4:7-8), *blasting and mildew* and the palmerworm
--      (4:9), *the pestilence after the manner of Egypt* and the sword (4:10), the overthrow *as Elohim
--      (God) overthrew Sodom and Gomorrah* (4:11) — each sealed *yet have ye not returned unto me, saith
--      Yahuah (LORD)*. These are the covenant-curses of Leviticus 26 / Deuteronomy 28 sent to TURN them:
--      *if ye will not yet for all this hearken unto me, then I will punish you seven times more* (Lev
--      26:18), *if ye will not be reformed by me by these things... then will I also walk contrary unto
--      you* (Lev 26:23-24) — the escalating discipline aimed at *if they shall confess their iniquity*
--      (Lev 26:40); Deuteronomy names the very plagues — *blasting, and... mildew* (Deut 28:22), *the
--      botch of Egypt* (Deut 28:27). The discipline is FATHERLY: *whom Yahuah (Lord) loveth he chasteneth*
--      (Hebrews 12:6), and *afterward it yieldeth the peaceable fruit of righteousness* (12:11). The
--      tragedy is the refusal — the same hardness Revelation marks: *yet repented not of the works of
--      their hands* (Revelation 9:20). The restored witness sings the correcting mercy: *chastenest you
--      them by little and little that offend... that leaving their wickedness they may believe on you*
--      (Wisdom 12:2); *As his mercy is great, so is his correction also* (Ecclesiasticus 16:12). The
--      curse is the discipline of covenant-breaking, never the Torah itself — and its whole aim is return.
--   ★ A FIREBRAND PLUCKED OUT (THREAD 4): *I have overthrown some of you, as Elohim (God) overthrew Sodom
--      and Gomorrah, and ye were as a firebrand plucked out of the burning* (4:11). Amos reaches back to
--      the Genesis event itself: *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and
--      fire from Yahuah (LORD) out of heaven; And he overthrew those cities, and all the plain* (Genesis
--      19:24-25). Yet mercy ran through even that overthrow — *Elohim (God) remembered Abraham, and sent
--      Lot out of the midst of the overthrow* (Genesis 19:29) — and so the *firebrand plucked out* is
--      itself a mercy: they were spared to return, and would not.
--   ★★ PREPARE TO MEET THY ELOHIM (THREAD 5): *Therefore thus will I do unto thee, O Yashar'el (Israel):
--      and because I will do this unto thee, prepare to meet thy Elohim (God), O Yashar'el (Israel)*
--      (4:12). The summons to stand before Yahuah — sobering because *the day of Yahuah (LORD) is
--      darkness, and not light* (Amos 5:18). The NT carries the same warning forward: *It is a fearful
--      thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31), and the Son of Adam's own
--      charge: *be ye also ready: for in such an hour as ye think not the Son of Adam cometh* (Matthew
--      24:44). To prepare to meet him is to return now, while the discipline still calls.
--   ★ HE THAT FORMETH THE MOUNTAINS (THREAD 6): *For, lo, he that formeth the mountains, and createth the
--      wind, and declareth unto man what is his thought... Yahuah (LORD), The Elohim (God) of hosts, is
--      his name* (4:13). The doxology names the Creator who is also the Judge — the One who *formeth the
--      mountains* (Genesis 1:1, *In the beginning Elohim (God) created the heaven and the earth*; Isaiah
--      40:12, *weighed the mountains in scales*; 40:26, *behold who hath created these things*) and who
--      *declareth unto man what is his thought* (Psalm 139:2, *thou understandest my thought afar off*).
--      This is the Formed Maker — Yahuah who fashions and reveals, the One who walks and speaks with man;
--      the same doxology-name recurs in Amos 5:8 and 9:6 (framed in prose).
--   EXTRAS: Wisdom 12:2 (chastening unto repentance) and Ecclesiasticus 16:12 (mercy and correction
--      together) woven on the discipline-refrain — clean witnesses, parses verified. No extras forced on
--      the kine, the false worship, the Sodom-overthrow, the summons, or the Creator-doxology.
--   VERSES WITH NO SEPARATE ADD: v.2-3 (the hooks/breaches — the captivity foretold, woven into THREAD 1
--      with v.1), v.7-8 (the withheld rain — bound in THREAD 3 with the refrain), v.9-10 (blight,
--      pestilence — THREAD 3). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The kine of Bashan which oppress the poor
    ('canon','amos',4,1,'canon','james',5,4,'free',
      E'*Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). The kine of Bashan *which oppress the poor, which crush the needy* (Amos 4:1) are the same rich oppressors James indicts — the defrauded hireling''s cry reaches the same ears. The wrong done to the poor does not go unheard; it ascends to Yahuah of hosts.'),
    ('canon','amos',4,1,'canon','james',5,1,'free',
      E'*Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1). The luxurious elite *which say to their masters, Bring, and let us drink* (Amos 4:1) stand under the same sentence — *the days shall come upon you, that he will take you away with hooks* (Amos 4:2). The oppressing rich are warned to weep for a judgment already on its way.'),
    ('canon','amos',4,1,'canon','amos',2,6,'free',
      E'*Thus saith Yahuah (LORD)... because they sold the righteous for silver, and the poor for a pair of shoes* (Amos 2:6). Amos'' lawsuit named this sin at the start: the trafficking of the needy. The kine of Bashan *which oppress the poor, which crush the needy* (Amos 4:1) are the same covenant-breakers, weighed by the Torah''s defense of the poor.'),
    ('canon','amos',4,1,'canon','amos',5,11,'free',
      E'*Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat... ye have built houses of hewn stone, but ye shall not dwell in them* (Amos 5:11). The luxury wrung from the poor (Amos 4:1) is the very ground of the judgment — they shall not enjoy what oppression built. The Torah''s justice for the needy is the standard their wealth is tried by.'),

    -- THREAD 2 (★): Come to Beth-el and transgress — for this liketh you
    ('canon','amos',4,4,'canon','isaiah',1,11,'free',
      E'*To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams... I delight not in the blood of bullocks* (Isaiah 1:11). The irony of *Come to Beth-el, and transgress... bring your sacrifices every morning* (Amos 4:4) is Isaiah''s very word: worship multiplied without obedience is no worship at all. The appointed offerings are not abolished — the corrupted, self-pleasing heart behind them is rejected.'),
    ('canon','amos',4,5,'canon','isaiah',1,15,'free',
      E'*And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). *For this liketh you, O ye children of Yashar''el (Israel)* (Amos 4:5) — worship that pleases the worshipper while the hands are full of injustice is hateful to Yahuah. Not the feast condemned, but the bloodstained heart that brings it.'),
    ('canon','amos',4,5,'canon','amos',5,21,'free',
      E'*I hate, I despise your feast days, and I will not smell in your solemn assemblies* (Amos 5:21). Amos'' own later word unfolds *for this liketh you* (Amos 4:5): the assemblies that delight the people while justice is trodden down are rejected — *But let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24). The corrupted worship is judged; the calendar Yahuah gave still stands.'),

    -- THREAD 3 (★★): Yet have ye not returned unto me — the fivefold discipline refused
    ('canon','amos',4,6,'canon','leviticus',26,18,'free',
      E'*And if ye will not yet for all this hearken unto me, then I will punish you seven times more for your sins* (Leviticus 26:18). The famine *cleanness of teeth in all your cities, and want of bread* (Amos 4:6), sealed *yet have ye not returned unto me*, is the escalating covenant-discipline of Leviticus 26 — each blow heavier because the last was unheeded. The curse is the chastening of covenant-breaking, sent to drive them home.'),
    ('canon','amos',4,8,'canon','leviticus',26,23,'free',
      E'*And if ye will not be reformed by me by these things, but will walk contrary unto me* (Leviticus 26:23). The withheld rain that left them *not satisfied* (Amos 4:8) is exactly Yahuah''s *reforming* hand of Leviticus 26 — the discipline meant to turn, and *yet have ye not returned unto me*. The refusal, not the rod, is the tragedy.'),
    ('canon','amos',4,9,'canon','deuteronomy',28,22,'free',
      E'*Yahuah (LORD) shall smite thee... with blasting, and with mildew; and they shall pursue thee until thou perish* (Deuteronomy 28:22). The plague of *blasting and mildew... the palmerworm devoured them* (Amos 4:9) is the named curse of Deuteronomy 28 — the very words. The covenant-curse falls as foretold, sent to provoke return, and *yet have ye not returned unto me*.'),
    ('canon','amos',4,10,'canon','deuteronomy',28,27,'free',
      E'*Yahuah (LORD) will smite thee with the botch of Egypt, and with the emerods, and with the scab, and with the itch, whereof thou canst not be healed* (Deuteronomy 28:27). *I have sent among you the pestilence after the manner of Egypt* (Amos 4:10) draws on the Deuteronomy curse of Egypt''s diseases — the plagues of the Exodus turned back upon a people who will not hear. Still the refrain: *yet have ye not returned unto me*.'),
    ('canon','amos',4,11,'canon','leviticus',26,40,'free',
      E'*If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me... if then their uncircumcised hearts be humbled* (Leviticus 26:40-41). The whole aim of the discipline is THIS — the confessing, humbled return. *Ye were as a firebrand plucked out of the burning: yet have ye not returned unto me* (Amos 4:11) is the heartbreak: spared for repentance, the return withheld.'),
    ('canon','amos',4,6,'canon','hebrews',12,6,'free',
      E'*For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6). The fivefold rod of Amos 4:6-11 is not wrath without love but a Father''s chastening — *yet have ye not returned unto me* the grief of a child who will not be corrected. The discipline is the proof of sonship, aimed at return.'),
    ('canon','amos',4,11,'canon','hebrews',12,11,'free',
      E'*Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (Hebrews 12:11). The famine, drought, blight, and overthrow (Amos 4:6-11) are the grievous chastening whose intended fruit is righteousness and return. *Yet have ye not returned unto me* (4:11) names the fruit unborn — the discipline refused, not the discipline failed.'),
    ('canon','amos',4,11,'canon','revelation',9,20,'free',
      E'*And the rest of the men which were not killed by these plagues yet repented not of the works of their hands* (Revelation 9:20). The refrain *yet have ye not returned unto me* (Amos 4:6-11) is the same hardness Revelation marks at the end: plague upon plague, and still no repentance. The disciplines of Yahuah are mercies that summon return; the horror is the heart that will not turn.'),
    ('canon','amos',4,11,'apocrypha','the-wisdom-of-solomon',12,2,'extras',
      E'*Therefore chastenest you them by little and little that offend, and warnest them by putting them in remembrance in which they have offended, that leaving their wickedness they may believe on you, O Yahuah (God)* (Wisdom 12:2). The restored witness names the very logic of Amos'' fivefold rod: Yahuah chastens *by little and little*, escalating, *that leaving their wickedness they may believe* — exactly the return *yet have ye not returned unto me* (Amos 4:11) mourns as refused.'),
    ('canon','amos',4,6,'apocrypha','ecclesiasticus',16,12,'extras',
      E'*As his mercy is great, so is his correction also: he judges a man according to his works* (Ecclesiasticus 16:12). The discipline of Amos 4:6-11 is the measure of Yahuah''s mercy, not its denial — *yet have ye not returned unto me* shows correction proportioned to love, sent to turn the heart back. Great mercy and great correction are one hand.'),

    -- THREAD 4 (★): As Elohim overthrew Sodom and Gomorrah — the firebrand plucked out
    ('canon','amos',4,11,'canon','genesis',19,24,'free',
      E'*Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). Amos reaches to the Genesis event itself: *I have overthrown some of you, as Elohim (God) overthrew Sodom and Gomorrah* (Amos 4:11). The fire that fell on the cities of the plain is the pattern of the judgment hanging over Yashar''el (Israel) — and the warning that some were spared, *a firebrand plucked out of the burning*.'),
    ('canon','amos',4,11,'canon','genesis',19,29,'free',
      E'*And it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow* (Genesis 19:29). Even the Sodom-overthrow ran with mercy — Lot drawn out *of the midst of the overthrow*. So the *firebrand plucked out of the burning* (Amos 4:11) is itself a mercy: they were spared from the fire to return, and *yet have ye not returned unto me*.'),

    -- THREAD 5 (★★): Prepare to meet thy Elohim
    ('canon','amos',4,12,'canon','hebrews',10,31,'free',
      E'*It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31). *Prepare to meet thy Elohim (God), O Yashar''el (Israel)* (Amos 4:12) is precisely this summons — to stand before the living Elohim is a thing to be readied for with trembling. The disciplines refused now give way to the meeting itself.'),
    ('canon','amos',4,12,'canon','matthew',24,44,'free',
      E'*Therefore be ye also ready: for in such an hour as ye think not the Son of Adam cometh* (Matthew 24:44). The charge *prepare to meet thy Elohim (God)* (Amos 4:12) is the Son of Adam''s own word: readiness for the day of meeting. To prepare is to return now, before the hour none foresees.'),
    ('canon','amos',4,12,'canon','amos',5,18,'free',
      E'*Woe unto you that desire the day of Yahuah (LORD)! to what end is it for you? the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). To *prepare to meet thy Elohim (God)* (Amos 4:12) is sobering precisely because the day of meeting, for the unrepentant, is *darkness, and not light*. The summons calls them to return so the day may be light and not woe.'),

    -- THREAD 6 (★): He that formeth the mountains — Yahuah is his name
    ('canon','amos',4,13,'canon','genesis',1,1,'free',
      E'*In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1). The doxology *he that formeth the mountains, and createth the wind... Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13) names the same Creator of the first verse of Torah. The Judge who disciplines is the Maker who *formeth* and *createth* — the One whose name is over all.'),
    ('canon','amos',4,13,'canon','isaiah',40,12,'free',
      E'*Who hath measured the waters in the hollow of his hand, and meted out heaven with the span... and weighed the mountains in scales, and the hills in a balance?* (Isaiah 40:12). The Maker who *formeth the mountains* (Amos 4:13) is Isaiah''s incomparable Creator who *weighed the mountains in scales*. The same doxology of the unsearchable Maker who is also the covenant Elohim of hosts.'),
    ('canon','amos',4,13,'canon','isaiah',40,26,'free',
      E'*Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names* (Isaiah 40:26). *He that formeth the mountains, and createth the wind* (Amos 4:13) is the One who marshals the host of heaven by name — and so cannot forget his people: *Why sayest thou, O Jacob... My way is hid from Yahuah (LORD)?* (Isaiah 40:27). The Creator-name is the ground of both judgment and hope.'),
    ('canon','amos',4,13,'canon','psalms',139,2,'free',
      E'*Thou knowest my downsitting and mine uprising, thou understandest my thought afar off* (Psalm 139:2). The Maker who *declareth unto man what is his thought* (Amos 4:13) is the One who *understandest my thought afar off* — He knows the heart and discloses it. The Formed Maker who fashions the mountains also reads and reveals the inmost thought of man.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-4-the-kine-of-bashan-which-oppress-the-poor',
       E'The kine of Bashan — which oppress the poor, which crush the needy',
       E'Amos turns the lawsuit on the luxurious elite of Samaria: *Hear this word, ye kine of Bashan, that are in the mountain of Samaria, which oppress the poor, which crush the needy, which say to their masters, Bring, and let us drink* (Amos 4:1) — fattened on the spoil of the needy, and now under sentence: *Adonai Yahuah (The Lord GOD) hath sworn by his holiness, that, lo, the days shall come upon you, that he will take you away with hooks, and your posterity with fishhooks* (4:2). This is the sin Amos named at the start of his lawsuit — *they sold the righteous for silver, and the poor for a pair of shoes* (Amos 2:6) — and the very ground of the coming ruin: *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat... ye have built houses of hewn stone, but ye shall not dwell in them* (Amos 5:11). The Torah''s defense of the poor is the standard they are weighed by. And the same woe carries forward: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1), *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). The cry of the defrauded poor reaches the ears of Yahuah of hosts; the oppressing rich are warned victims of their own greed-system, not an ethnic class hated — the system is dismantled, the door of return left open.',
       sv.verse_id, ev.verse_id, 'free', 45260
  FROM _s330_amo04_lookup sv, _s330_amo04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-4-come-to-bethel-and-transgress-for-this-liketh-you',
       E'Come to Beth-el, and transgress — for this liketh you',
       E'With biting irony Amos sends them to their shrines as if to call them to worship — but every step is sin: *Come to Beth-el, and transgress; at Gilgal multiply transgression; and bring your sacrifices every morning, and your tithes after three years: And offer a sacrifice of thanksgiving with leaven, and proclaim and publish the free offerings: for this liketh you, O ye children of Yashar''el (Israel)* (Amos 4:4-5). The damning phrase is *for this liketh you* — worship that pleases the worshipper, divorced from obedience and justice, is itself transgression. This is NOT the appointed times of the Torah abolished; it is the corrupted, self-pleasing heart behind them that Yahuah rejects — as the prophets declare with one voice: *To what purpose is the multitude of your sacrifices unto me?... I delight not in the blood of bullocks* (Isaiah 1:11), *and when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15); and Amos'' own later word: *I hate, I despise your feast days, and I will not smell in your solemn assemblies... But let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:21,24). The calendar Yahuah gave still stands; what is condemned is the assembly that delights the flesh while the poor are crushed.',
       sv.verse_id, ev.verse_id, 'free', 45263
  FROM _s330_amo04_lookup sv, _s330_amo04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-4-yet-have-ye-not-returned-unto-me',
       E'Yet have ye not returned unto me — the fivefold discipline refused',
       E'Five times Yahuah recounts a chastening sent to turn his people, and five times the same heartbreaking refrain: *yet have ye not returned unto me, saith Yahuah (LORD)*. Famine: *And I also have given you cleanness of teeth in all your cities, and want of bread in all your places: yet have ye not returned unto me* (Amos 4:6). Withheld rain: *I caused it to rain upon one city, and caused it not to rain upon another... yet have ye not returned unto me* (4:7-8). Blight: *I have smitten you with blasting and mildew... the palmerworm devoured them: yet have ye not returned unto me* (4:9). Pestilence and sword: *I have sent among you the pestilence after the manner of Egypt... yet have ye not returned unto me* (4:10). And overthrow: *I have overthrown some of you, as Elohim (God) overthrew Sodom and Gomorrah, and ye were as a firebrand plucked out of the burning: yet have ye not returned unto me* (4:11). These are the escalating covenant-curses of the Torah, sent to drive repentance: *if ye will not yet for all this hearken unto me, then I will punish you seven times more* (Leviticus 26:18), *if ye will not be reformed by me by these things... then will I also walk contrary unto you* (Lev 26:23-24) — the whole aim being *if they shall confess their iniquity... if then their uncircumcised hearts be humbled* (Lev 26:40-41); and Deuteronomy names the very plagues — *with blasting, and with mildew* (Deuteronomy 28:22), *the botch of Egypt* (Deut 28:27). The curse is the discipline of covenant-breaking, never the Torah itself. And it is FATHERLY: *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6), and *afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (12:11). The tragedy is the refusal — the same hardness Revelation marks: *the rest of the men which were not killed by these plagues yet repented not of the works of their hands* (Revelation 9:20). The restored witness sings the correcting mercy: *Therefore chastenest you them by little and little that offend... that leaving their wickedness they may believe on you* (Wisdom 12:2); *As his mercy is great, so is his correction also* (Ecclesiasticus 16:12). Every blow was a summons home; only the return was withheld.',
       sv.verse_id, ev.verse_id, 'extras', 45266
  FROM _s330_amo04_lookup sv, _s330_amo04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-4-as-elohim-overthrew-sodom-and-gomorrah',
       E'As Elohim overthrew Sodom and Gomorrah — a firebrand plucked out of the burning',
       E'The fifth and heaviest of the disciplines reaches back to the Genesis event itself: *I have overthrown some of you, as Elohim (God) overthrew Sodom and Gomorrah, and ye were as a firebrand plucked out of the burning: yet have ye not returned unto me, saith Yahuah (LORD)* (Amos 4:11). The fire that fell on the cities of the plain is the pattern of the judgment hanging over Yashar''el (Israel): *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven; And he overthrew those cities, and all the plain, and all the inhabitants of the cities* (Genesis 19:24-25). Yet even that overthrow ran with mercy: *And it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow, when he overthrew the cities in the which Lot dwelt* (Genesis 19:29). So the *firebrand plucked out of the burning* is itself a mercy — they were snatched from the fire, spared not for safety but for return. And still, *yet have ye not returned unto me*: the rescue from judgment was meant to break the heart toward home, and it did not.',
       sv.verse_id, ev.verse_id, 'free', 45269
  FROM _s330_amo04_lookup sv, _s330_amo04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-4-prepare-to-meet-thy-elohim',
       E'Prepare to meet thy Elohim, O Yashar''el',
       E'When discipline after discipline is refused, only the meeting itself remains: *Therefore thus will I do unto thee, O Yashar''el (Israel): and because I will do this unto thee, prepare to meet thy Elohim (God), O Yashar''el (Israel)* (Amos 4:12). The summons is to stand before Yahuah — and it is sobering, for *Woe unto you that desire the day of Yahuah (LORD)! to what end is it for you? the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). The NT carries the same charge forward without softening it: *It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31), and the Son of Adam''s own word: *Therefore be ye also ready: for in such an hour as ye think not the Son of Adam cometh* (Matthew 24:44). To *prepare to meet thy Elohim* is not despair but invitation: return NOW, while the disciplines still call and the day may yet be light and not woe. The God who chastened to turn them is the God they must meet; the only preparation is the return so long withheld.',
       sv.verse_id, ev.verse_id, 'free', 45272
  FROM _s330_amo04_lookup sv, _s330_amo04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-4-he-that-formeth-the-mountains-yahuah-is-his-name',
       E'He that formeth the mountains — Yahuah, The Elohim of hosts, is his name',
       E'The chapter closes in a doxology that names the One who disciplines as the Creator of all: *For, lo, he that formeth the mountains, and createth the wind, and declareth unto man what is his thought, that maketh the morning darkness, and treadeth upon the high places of the earth, Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13). The Judge of the fivefold rod is the Maker of the first verse of Torah — *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1) — the incomparable Creator Isaiah sings: *Who hath measured the waters in the hollow of his hand... and weighed the mountains in scales, and the hills in a balance?* (Isaiah 40:12), *Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names* (Isaiah 40:26). And the One who *declareth unto man what is his thought* is the One who *understandest my thought afar off* (Psalm 139:2) — the Maker who fashions the mountains also reads and discloses the inmost heart of man. This is the Formed Maker — Yahuah who creates, who treads the high places, who reveals his thought, and walks and speaks with man; the same Creator-name (*Yahuah (LORD) is his name*) seals the sister-doxologies of Amos 5:8 and 9:6. The God they must prepare to meet is the God who made them and knows them through.',
       sv.verse_id, ev.verse_id, 'free', 45275
  FROM _s330_amo04_lookup sv, _s330_amo04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Go to now, ye rich men, weep and howl for your miseries* (James 5:1) — the oppressing elite *which crush the needy* (Amos 4:1) under the same sentence of woe.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-the-kine-of-bashan-which-oppress-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the hire of the labourers... kept back by fraud, crieth... entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — the cry of the poor *which oppress the poor* (Amos 4:1) wronged reaches the ears of Yahuah of hosts.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-the-kine-of-bashan-which-oppress-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they sold the righteous for silver, and the poor for a pair of shoes* (Amos 2:6) — Amos'' opening lawsuit named the very sin of the kine of Bashan (Amos 4:1).'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-the-kine-of-bashan-which-oppress-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *your treading is upon the poor... ye have built houses of hewn stone, but ye shall not dwell in them* (Amos 5:11) — the luxury wrung from the poor (Amos 4:1) is the ground of the judgment.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-the-kine-of-bashan-which-oppress-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *To what purpose is the multitude of your sacrifices unto me?... I delight not in the blood of bullocks* (Isaiah 1:11) — worship multiplied without obedience, as at Beth-el (Amos 4:4); the offering is not abolished, the empty heart is rejected.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-come-to-bethel-and-transgress-for-this-liketh-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15) — *for this liketh you* (Amos 4:5): worship that pleases the worshipper while injustice stains the hands.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-come-to-bethel-and-transgress-for-this-liketh-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I hate, I despise your feast days, and I will not smell in your solemn assemblies* (Amos 5:21) — Amos'' later word unfolds *for this liketh you* (Amos 4:5); the corrupted assembly judged, the calendar Yahuah gave still standing (Amos 5:24).'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-come-to-bethel-and-transgress-for-this-liketh-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *if ye will not yet for all this hearken unto me, then I will punish you seven times more* (Leviticus 26:18) — the famine *yet have ye not returned* (Amos 4:6) is the escalating covenant-discipline of the Torah.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *if ye will not be reformed by me by these things, but will walk contrary unto me* (Leviticus 26:23) — the withheld rain (Amos 4:8) is Yahuah''s reforming hand, the discipline meant to turn.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahuah shall smite thee... with blasting, and with mildew* (Deuteronomy 28:22) — the *blasting and mildew... the palmerworm* (Amos 4:9) is the named curse of Deuteronomy 28, word for word.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah will smite thee with the botch of Egypt* (Deuteronomy 28:27) — *the pestilence after the manner of Egypt* (Amos 4:10) is the Deuteronomy curse of Egypt''s diseases turned back on the unrepentant.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *If they shall confess their iniquity... if then their uncircumcised hearts be humbled* (Leviticus 26:40-41) — the whole aim of the rod; *yet have ye not returned unto me* (Amos 4:11) is the return withheld.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6) — the fivefold rod (Amos 4:6-11) is a Father''s chastening, the mark of sonship.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (Hebrews 12:11) — the grievous chastening of Amos 4 whose intended fruit, refused, is righteousness and return.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *the rest of the men... yet repented not of the works of their hands* (Revelation 9:20) — the same hardness as *yet have ye not returned unto me* (Amos 4); plague upon plague, and no turning.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *chastenest you them by little and little that offend... that leaving their wickedness they may believe on you* (Wisdom 12:2) — the restored witness names the very logic of Amos'' escalating, return-seeking rod.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *As his mercy is great, so is his correction also* (Ecclesiasticus 16:12) — the discipline of Amos 4 is the measure of Yahuah''s mercy, not its denial; correction proportioned to love.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-yet-have-ye-not-returned-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24) — the Genesis overthrow Amos quotes as the pattern of judgment (Amos 4:11).'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-as-elohim-overthrew-sodom-and-gomorrah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow* (Genesis 19:29) — mercy ran through the overthrow; the *firebrand plucked out* (Amos 4:11) was spared for return.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-as-elohim-overthrew-sodom-and-gomorrah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31) — *prepare to meet thy Elohim* (Amos 4:12): to stand before the living Elohim is readied for with trembling.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-prepare-to-meet-thy-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *be ye also ready: for in such an hour as ye think not the Son of Adam cometh* (Matthew 24:44) — the Son of Adam''s own charge echoes *prepare to meet thy Elohim* (Amos 4:12): readiness for the day of meeting.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-prepare-to-meet-thy-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18) — the meeting *prepare to meet thy Elohim* (Amos 4:12) summons to is sobering for the unrepentant; the call is to return so the day may be light.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-prepare-to-meet-thy-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1) — the Judge who *formeth the mountains* (Amos 4:13) is the Creator of the first verse of Torah.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-he-that-formeth-the-mountains-yahuah-is-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Who hath measured the waters in the hollow of his hand... and weighed the mountains in scales* (Isaiah 40:12) — the Maker who *formeth the mountains* (Amos 4:13) is Isaiah''s incomparable Creator.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-he-that-formeth-the-mountains-yahuah-is-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *behold who hath created these things, that bringeth out their host by number: he calleth them all by names* (Isaiah 40:26) — the One who *createth the wind* (Amos 4:13) marshals the host of heaven by name, and so cannot forget his people (Isaiah 40:27).'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-he-that-formeth-the-mountains-yahuah-is-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *thou understandest my thought afar off* (Psalm 139:2) — the Maker who *declareth unto man what is his thought* (Amos 4:13) knows and discloses the inmost heart.'
  FROM cross_reference_threads t
  JOIN _s330_amo04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s330_amo04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-4-he-that-formeth-the-mountains-yahuah-is-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_5.sql (Amos 5) -----
-- Chapter: Amos 5 — the lament over fallen virgin Yashar'el and the prophet's great altar-call:
-- *Seek ye me, and ye shall live* (5:4); *Seek Yahuah (LORD), and ye shall live* (5:6); *Seek good,
-- and not evil, that ye may live... Hate the evil, and love the good, and establish judgment in the
-- gate* (5:14-15). Between the calls stands the Creator-doxology — *Seek him that maketh the seven
-- stars and Orion... Yahuah (LORD) is his name* (5:8) — and the lawsuit against corrupt courts that
-- *hate him that rebuketh in the gate* and *take a bribe, and... turn aside the poor in the gate from
-- their right* (5:10-12). Then the two great warnings: the day of Yahuah is *darkness, and not light*
-- (5:18-20), and Yahuah's rejection of worship divorced from justice — *I hate, I despise your feast
-- days... But let judgment run down as waters, and righteousness as a mighty stream* (5:21-24) — NOT
-- the appointed times abolished, but feasts kept by oppressors made an abomination. The chapter ends
-- with the hidden star-worship Stephen quotes (5:25-27 -> Acts 7:42-43).
-- Tag: amo05   Temp view: _s330_amo05_lookup
-- Sort band: base 45280, step 3 -> threads at 45280, 45283, 45286, 45289, 45292, 45295 (6 threads)
-- Source of EVERY row: 'canon','amos',5,v
--
-- Amos 5 coverage:
--   v.1-3 (the virgin of Yashar'el (Israel) is fallen; she shall no more rise)
--        NT: none warranted (the lament frames the chapter; the hope is the seek-and-live call)
--        Extras: none warranted   Tanakh: woven into prose of THREAD 1
--   ★★★ v.4 / v.6 / v.14-15 (Seek ye me, and ye shall live... Seek good, and not evil, that ye may
--          live... Hate the evil, and love the good, and establish judgment in the gate)
--        NT:     ★★★ Matthew 6:33 (seek ye first the kingdom of Elohim (God), and his righteousness) — THREAD 1
--        Extras: ★ Wisdom of Solomon 1:1 (in simplicity of heart seek him) — THREAD 1
--        Tanakh: ★★★ Deuteronomy 30:19 (I have set before you life and death... choose life), Isaiah
--                55:6 (Seek ye Yahuah while he may be found), Psalm 34:14 (Depart from evil, and do good) — THREAD 1
--   ★ v.8 (Seek him that maketh the seven stars and Orion... Yahuah (LORD) is his name)
--        NT:     none warranted (the Creator-doxology is a Tanakh-internal hymn; weave is lateral)
--        Extras: none warranted (clean Tanakh witness preferred)
--        Tanakh: ★ Job 9:9 (Which maketh Arcturus, Orion, and Pleiades), Job 38:31 (Canst thou bind
--                the sweet influences of Pleiades, or loose the bands of Orion?), Genesis 1:16 (he made
--                the stars also) — THREAD 2
--   v.5 (seek not Beth-el, nor enter into Gilgal) — woven into THREAD 1 prose (the false shrines vs the living seek)
--   v.7, v.10-13 (Ye who turn judgment to wormwood... They hate him that rebuketh in the gate... they
--          take a bribe, and they turn aside the poor in the gate)
--        NT:     none distinct (the justice-in-the-gate forward-weave carried in THREAD 5 / Matthew 23)
--        Extras: ★ Ecclesiasticus (Sirach) 35:13-15 (he will hear the prayer of the oppressed... the
--                widow's cry) — THREAD 3
--        Tanakh: ★ Exodus 23:6 (Thou shalt not wrest the judgment of thy poor), Exodus 23:8 (thou shalt
--                take no gift: for the gift blindeth — here 23:8 'a gift doth blind'), Deuteronomy 16:19
--                (Thou shalt not wrest judgment... neither take a gift) — THREAD 3
--   v.16-17 (Wailing shall be in all streets... I will pass through thee) — woven into THREAD 4 (the judgment that the day brings)
--   ★★ v.18-20 (Woe unto you that desire the day of Yahuah! ... the day of Yahuah is darkness, and not light)
--        NT:     ★★ 1 Thessalonians 5:2-3 (the day of Yahuah so cometh as a thief in the night... sudden destruction) — THREAD 4
--        Extras: none warranted   Tanakh: ★ Joel 2:1-2 (the day of Yahuah cometh... A day of darkness),
--                Zephaniah 1:14-15 (The great day of Yahuah is near... a day of darkness and gloominess) — THREAD 4
--   ★★★ v.21-24 (I hate, I despise your feast days... But let judgment run down as waters, and
--          righteousness as a mighty stream)
--        NT:     ★★ Matthew 23:23 (omitted the weightier matters of the law, judgment, mercy, and faith:
--                these ought ye to have done, and not to leave the other undone) — THREAD 5
--        Extras: none warranted   Tanakh: ★★ Isaiah 1:11-17 (To what purpose is the multitude of your
--                sacrifices... seek judgment, relieve the oppressed), Hosea 6:6 (I desired mercy, and not
--                sacrifice), Micah 6:6-8 (what doth Yahuah require of thee, but to do justly, and to love
--                mercy) — THREAD 5. FRAMED: corrupt worship judged, NOT the appointed times abolished.
--   ★ v.25-27 (ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god...
--          I will cause you to go into captivity beyond Damascus)
--        NT:     ★ Acts 7:42-43 (ye took up the tabernacle of Moloch, and the star of your god Remphan...
--                and I will carry you away beyond Babylon) — Stephen quotes this chapter — THREAD 6
--        Extras: none warranted   Tanakh: held in prose (the hidden idolatry; the captivity-sentence)
--
-- Threads (slug — target libraries):
--   1. amos-5-seek-ye-me-and-ye-shall-live — NT (Matthew 6) + Extras (Wisdom 1) + Tanakh (Deut 30, Isaiah 55, Psalm 34) [extras]
--      (★★★ the chapter's heart: seek Yahuah / seek good, and live; choose life; the remnant of Joseph)
--   2. amos-5-seek-him-that-maketh-the-seven-stars-and-orion — Tanakh (Job 9, Job 38, Genesis 1) [free]
--      (★ the Creator-doxology; the Maker of the constellations who turns death-shadow to morning; Yahuah is his name)
--   3. amos-5-they-hate-him-that-rebuketh-in-the-gate — Extras (Sirach 35) + Tanakh (Exodus 23, Deut 16) [extras]
--      (★ the corrupt courts: bribe-taking, the poor turned aside — against the Torah's justice in the gate)
--   4. amos-5-the-day-of-yahuah-is-darkness-and-not-light — NT (1 Thessalonians 5) + Tanakh (Joel 2, Zephaniah 1) [free]
--      (★★ the day of Yahuah a day of judgment, not light; against false security in chosenness; cometh as a thief)
--   5. amos-5-let-judgment-run-down-as-waters — NT (Matthew 23) + Tanakh (Isaiah 1, Hosea 6, Micah 6) [free]
--      (★★★ I hate your feast days = corrupt worship judged, NOT appointed times abolished; mercy/justice the heart they point to)
--   6. amos-5-the-tabernacle-of-your-moloch-the-star-of-your-god — NT (Acts 7) [free]
--      (★ the hidden star-worship; quoted by Stephen; captivity beyond Damascus/Babylon)
--
-- Framing notes:
--   ★★★ SEEK AND LIVE (THREAD 1): the call repeats — *Seek ye me, and ye shall live* (5:4), *Seek
--      Yahuah (LORD), and ye shall live* (5:6), *Seek good, and not evil, that ye may live* (5:14). This
--      is Moses' covenant choice set before the people again: *I have set before you life and death,
--      blessing and cursing: therefore choose life* (Deuteronomy 30:19). It is Isaiah's *Seek ye Yahuah
--      (LORD) while he may be found* (Isaiah 55:6), the Psalm's *Depart from evil, and do good* (Psalm
--      34:14), and Yahusha's *seek ye first the kingdom of Elohim (God), and his righteousness* (Matthew
--      6:33). And the broken house of Joseph (the northern house) is held in mercy — *it may be that
--      Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph* (5:15) — the
--      two-house remnant. The false shrines (5:5 Beth-el, Gilgal) are the counterfeit of the living seek.
--   ★ THE CREATOR-DOXOLOGY (THREAD 2): *Seek him that maketh the seven stars and Orion, and turneth the
--      shadow of death into the morning... that calleth for the waters of the sea, and poureth them out
--      upon the face of the earth: Yahuah (LORD) is his name* (5:8). The same Maker of the constellations
--      is hymned in Job — *Which maketh Arcturus, Orion, and Pleiades* (Job 9:9), *Canst thou bind the
--      sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31) — and named in the
--      creation: *he made the stars also* (Genesis 1:16). The One to be sought is the Formed Maker by
--      whom all was made, whose Name is Yahuah.
--   ★ THE GATE-JUSTICE LAWSUIT (THREAD 3): *They hate him that rebuketh in the gate* (5:10); *they
--      afflict the just, they take a bribe, and they turn aside the poor in the gate from their right*
--      (5:12). This is straight Torah-breaking: *Thou shalt not wrest the judgment of thy poor in his
--      cause* (Exodus 23:6); *thou shalt take no gift* / *a gift doth blind the eyes of the wise*
--      (Exodus 23:8; Deuteronomy 16:19). The restored witness echoes the cry: *He will not accept any
--      person against a poor man, but will hear the prayer of the oppressed... the widow, when she
--      poureth out her complaint* (Sirach 35:13-15).
--   ★★ THE DAY OF YAHUAH (THREAD 4): *Woe unto you that desire the day of Yahuah (LORD)! ... the day of
--      Yahuah (LORD) is darkness, and not light* (5:18-20). Against the false security of the presumptuous
--      who think chosenness exempts them. Joel: *the day of Yahuah (LORD) cometh... A day of darkness*
--      (Joel 2:1-2); Zephaniah: *The great day of Yahuah (LORD) is near... a day of darkness and
--      gloominess* (Zephaniah 1:14-15); and Paul: *the day of Yahuah (Lord) so cometh as a thief in the
--      night... sudden destruction* (1 Thessalonians 5:2-3).
--   ★★★ I HATE YOUR FEAST DAYS (THREAD 5): *I hate, I despise your feast days... But let judgment run
--      down as waters, and righteousness as a mighty stream* (5:21-24). FRAME CAREFULLY: this is NOT the
--      abolition of the appointed times (Leviticus 23 stands) — it is the rejection of feasts kept by
--      bribe-takers and oppressors of the poor, worship divorced from the justice it points to. Isaiah
--      says the same — *To what purpose is the multitude of your sacrifices... seek judgment, relieve the
--      oppressed* (Isaiah 1:11-17); Hosea — *I desired mercy, and not sacrifice* (Hosea 6:6); Micah —
--      *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy* (Micah 6:8); and
--      Yahusha names justice/mercy *the weightier matters of the law... these ought ye to have done, and
--      not to leave the other undone* (Matthew 23:23) — the feasts kept AND the justice done.
--   ★ THE STAR-WORSHIP STEPHEN QUOTES (THREAD 6): *ye have borne the tabernacle of your Moloch and Chiun
--      your images, the star of your god... I will cause you to go into captivity beyond Damascus*
--      (5:26-27). Stephen quotes it verbatim against the same hidden idolatry: *ye took up the tabernacle
--      of Moloch, and the star of your god Remphan... and I will carry you away beyond Babylon* (Acts
--      7:43). The library reads itself.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the lament — preface to THREAD 1), v.5 (the false shrines —
--      woven into THREAD 1), v.7 (turn judgment to wormwood — preface to THREAD 3), v.9 / v.13 (the
--      spoiled / the prudent keep silence — held in prose), v.16-17 (the wailing — the judgment the day
--      brings, THREAD 4), v.25 (the wilderness question — preface to THREAD 6). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Seek ye me, and ye shall live
    ('canon','amos',5,4,'canon','deuteronomy',30,19,'free',
      E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The prophet sets Moses'' covenant choice before the people again: *Seek ye me, and ye shall live* (Amos 5:4). To seek Yahuah is to *choose life*; the call to live is the call to return to the covenant He set before them.'),
    ('canon','amos',5,6,'canon','isaiah',55,6,'free',
      E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The urgency of *Seek Yahuah (LORD), and ye shall live; lest he break out like fire in the house of Joseph* (Amos 5:6) is Isaiah''s same word — seek Him *while he may be found*, before the fire falls. The window is open; the seeking must be now.'),
    ('canon','amos',5,14,'canon','psalms',34,14,'free',
      E'*Depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14). Amos'' *Seek good, and not evil, that ye may live... Hate the evil, and love the good* (Amos 5:14-15) is the Psalm''s own counsel to the one who *desireth life, and loveth many days* (Psalm 34:12) — depart from evil, do good. Seeking good is seeking the One who is good.'),
    ('canon','amos',5,14,'canon','matthew',6,33,'free',
      E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). Amos'' *Seek good, and not evil, that ye may live: and so Yahuah (LORD), the Elohim (God) of hosts, shall be with you* (Amos 5:14) is Yahusha''s same charge — seek first His kingdom and *his righteousness*. To seek good and establish judgment in the gate (5:15) is to seek the kingdom and the righteousness of the King.'),
    ('canon','amos',5,4,'apocrypha','the-wisdom-of-solomon',1,1,'extras',
      E'*Love righteousness, you that be judges of the earth: think of Yahuah (God) with a good (heart,) and in simplicity of heart seek him* (Wisdom of Solomon 1:1). The restored witness joins the seek-and-live call of *Seek ye me, and ye shall live* (Amos 5:4): the judges of the earth are to *seek him* in *simplicity of heart* — the very thing Amos'' bribe-taking judges (5:12) would not do. To seek Yahuah is to love righteousness.'),

    -- THREAD 2 (★): Seek him that maketh the seven stars and Orion
    ('canon','amos',5,8,'canon','job',9,9,'free',
      E'*Which maketh Arcturus, Orion, and Pleiades, and the chambers of the south* (Job 9:9). The One Amos bids them seek — *him that maketh the seven stars and Orion... Yahuah (LORD) is his name* (Amos 5:8) — is the Maker Job names: the One who *maketh... Orion, and Pleiades*. The constellations themselves declare whose Name they were to seek.'),
    ('canon','amos',5,8,'canon','job',38,31,'free',
      E'*Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31). Yahuah out of the whirlwind asks Job what only the Maker can do — *bind... Pleiades, or loose the bands of Orion* — the very *seven stars and Orion* Amos says He *maketh* (Amos 5:8). The Creator of the stars is the One to be sought, *Yahuah (LORD) is his name*.'),
    ('canon','amos',5,8,'canon','genesis',1,16,'free',
      E'*And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also* (Genesis 1:16). The doxology *Seek him that maketh the seven stars and Orion* (Amos 5:8) reaches back to the fourth day, when *he made the stars also*. The Maker of the lights is the One Israel forsook for the star of their god (5:26) — and the One they are called to seek.'),

    -- THREAD 3 (★): They hate him that rebuketh in the gate (the corrupt courts)
    ('canon','amos',5,12,'canon','exodus',23,6,'free',
      E'*Thou shalt not wrest the judgment of thy poor in his cause* (Exodus 23:6). Amos charges them — *they take a bribe, and they turn aside the poor in the gate from their right* (Amos 5:12) — with breaking this very command: they *wrest the judgment of the poor*. The gate is the Torah''s courtroom, and they have made it a place of plunder.'),
    ('canon','amos',5,12,'canon','exodus',23,8,'free',
      E'*And thou shalt take no gift: for the gift blindeth the wise, and perverteth the words of the righteous* (Exodus 23:8). The bribe-takers who *take a bribe* in the gate (Amos 5:12) do the forbidden thing: the *gift* that *blindeth the wise*. Their courts are dark because the bribe has blinded them.'),
    ('canon','amos',5,12,'canon','deuteronomy',16,19,'free',
      E'*Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous* (Deuteronomy 16:19). The charge against those who *take a bribe, and... turn aside the poor in the gate* (Amos 5:12) is the breaking of the judges'' own Torah-charge — set in the gates (Deuteronomy 16:18) precisely *not* to *wrest judgment* nor *take a gift*.'),
    ('canon','amos',5,12,'apocrypha','ecclesiasticus',35,13,'extras',
      E'*He will not accept any person against a poor man, but will hear the prayer of the oppressed* (Sirach 35:13). Against the courts that *afflict the just... and turn aside the poor in the gate from their right* (Amos 5:12), the restored witness sets Yahuah Himself as the Judge who *will hear the prayer of the oppressed* — He takes the side the corrupt judges abandoned.'),
    ('canon','amos',5,12,'apocrypha','ecclesiasticus',35,15,'extras',
      E'*Do not the tears run down the widow''s cheeks? and is not her cry against him that causeth them to fall?* (Sirach 35:15). The poor *turned aside in the gate from their right* (Amos 5:12) have a cry that rises — the widow''s *tears* are *against him that causeth them to fall*. The oppressor''s wrong does not vanish; it cries to the true Judge.'),

    -- THREAD 4 (★★): The day of Yahuah is darkness, and not light
    ('canon','amos',5,18,'canon','joel',2,1,'free',
      E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1). Amos'' *Woe unto you that desire the day of Yahuah (LORD)!* (Amos 5:18) is met by Joel''s alarm: the day *cometh*, and the land is to *tremble* — not a day of triumph for the presumptuous, but a day to fear.'),
    ('canon','amos',5,18,'canon','joel',2,2,'free',
      E'*A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:2). Amos says *the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18); Joel says the same word for word — *a day of darkness... thick darkness*. The two prophets describe one day: not light for those who longed for it lightly.'),
    ('canon','amos',5,20,'canon','zephaniah',1,15,'free',
      E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). Amos asks, *Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* (Amos 5:20); Zephaniah answers — the *great day of Yahuah (LORD)* (1:14) is *a day of darkness and gloominess*. No brightness in it for the wicked.'),
    ('canon','amos',5,18,'canon','1-thessalonians',5,2,'free',
      E'*For yourselves know perfectly that the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). The day the presumptuous *desire* (Amos 5:18) comes unlooked-for — *as a thief in the night* — upon those who say *Peace and safety; then sudden destruction cometh upon them* (1 Thessalonians 5:3). Amos'' woe on false security is Paul''s warning to watch.'),

    -- THREAD 5 (★★★): Let judgment run down as waters (corrupt worship judged, NOT appointed times abolished)
    ('canon','amos',5,21,'canon','isaiah',1,11,'free',
      E'*To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams... and I delight not in the blood of bullocks, or of lambs, or of he goats* (Isaiah 1:11). Amos'' *I hate, I despise your feast days... Though ye offer me burnt offerings... I will not accept them* (Amos 5:21-22) is Isaiah''s same verdict: worship from bloody hands is rejected. Not the offerings abolished — the offerings of oppressors refused.'),
    ('canon','amos',5,24,'canon','isaiah',1,17,'free',
      E'*Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17). Amos'' *let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24) is Isaiah''s remedy spelled out: *seek judgment, relieve the oppressed*. The river of justice is the heart the feasts were always meant to carry.'),
    ('canon','amos',5,22,'canon','hosea',6,6,'free',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Yahuah''s refusal — *Though ye offer me burnt offerings... I will not accept them* (Amos 5:22) — is Hosea''s same heart: *mercy, and not sacrifice*. The offering without mercy is the thing rejected; mercy is what the altar was always pointing to (not the altar abolished).'),
    ('canon','amos',5,24,'canon','micah',6,8,'free',
      E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Amos'' *let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24) is Micah''s *do justly, and... love mercy* — the weight of the covenant the feasts were meant to bear. The appointed times kept WITH justice; never one without the other.'),
    ('canon','amos',5,24,'canon','matthew',23,23,'free',
      E'*Woe unto you, scribes and Pharisees, hypocrites! for ye pay tithe of mint and anise and cummin, and have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23). Yahusha names the very thing Amos demands — *judgment* and *mercy* as *the weightier matters of the law* — and seals the frame: *these ought ye to have done, and not to leave the other undone*. The justice that should *run down as waters* (Amos 5:24) is kept ALONGSIDE the tithe and the feast, never instead of the Torah.'),

    -- THREAD 6 (★): The tabernacle of your Moloch, the star of your god (Stephen quotes it)
    ('canon','amos',5,26,'canon','acts',7,43,'free',
      E'*Yea, ye took up the tabernacle of Moloch, and the star of your god Remphan, figures which ye made to worship them: and I will carry you away beyond Babylon* (Acts 7:43). Stephen quotes Amos verbatim — *ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god, which ye made to yourselves* (Amos 5:26) — naming the hidden idolatry carried even in the wilderness, and its sentence: *captivity beyond Damascus* (5:27), *beyond Babylon* (Acts 7:43). The library reads itself.'),
    ('canon','amos',5,27,'canon','acts',7,42,'free',
      E'*Then Elohim (God) turned, and gave them up to worship the host of heaven; as it is written in the book of the prophets, O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* (Acts 7:42). Stephen reads Amos'' own wilderness question — *Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* (Amos 5:25) — before the captivity-sentence of *go into captivity beyond Damascus* (Amos 5:27). The star-worship, not the slain beasts, is the indictment.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-5-seek-ye-me-and-ye-shall-live',
       E'Seek ye me, and ye shall live — choose life, seek good, and the remnant of Joseph',
       E'Over the fallen virgin of Yashar''el (Israel) the prophet sounds the chapter''s heart, three times: *For thus saith Yahuah (LORD) unto the house of Yashar''el (Israel), Seek ye me, and ye shall live* (Amos 5:4); *Seek Yahuah (LORD), and ye shall live; lest he break out like fire in the house of Joseph* (5:6); *Seek good, and not evil, that ye may live: and so Yahuah (LORD), the Elohim (God) of hosts, shall be with you... Hate the evil, and love the good, and establish judgment in the gate* (5:14-15). This is Moses'' covenant choice set before them once more: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). It is Isaiah''s urgency — *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6) — and the Psalm''s plain counsel — *Depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14). Yahusha gathers it into one charge: *seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). Even the restored witness joins the call: *Love righteousness, you that be judges of the earth... in simplicity of heart seek him* (Wisdom of Solomon 1:1). And the broken northern house is not abandoned — *it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph* (5:15): the two-house remnant held in mercy. The false shrines (*seek not Beth-el, nor enter into Gilgal*, 5:5) are the counterfeit; the living God Himself is the One to be sought, and in the seeking is life.',
       sv.verse_id, ev.verse_id, 'extras', 45280
  FROM _s330_amo05_lookup sv, _s330_amo05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=5 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-5-seek-him-that-maketh-the-seven-stars-and-orion',
       E'Seek him that maketh the seven stars and Orion — the Creator-doxology, Yahuah is his name',
       E'Between the calls to seek and live stands a hymn to the One sought: *Seek him that maketh the seven stars and Orion, and turneth the shadow of death into the morning, and maketh the day dark with night: that calleth for the waters of the sea, and poureth them out upon the face of the earth: Yahuah (LORD) is his name* (Amos 5:8). The Maker of the constellations is the One Israel forsook for the star of their god (5:26) — and He is named across the Scriptures by His own works. Job names Him twice: *Which maketh Arcturus, Orion, and Pleiades, and the chambers of the south* (Job 9:9); and from the whirlwind Yahuah asks what only the Maker can do — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31). And the fourth day of creation set them: *he made the stars also* (Genesis 1:16). The One who *turneth the shadow of death into the morning* is the Formed Maker by whom all things were made; to seek Him is to seek the Creator whose Name is Yahuah, written over the night sky.',
       sv.verse_id, ev.verse_id, 'free', 45283
  FROM _s330_amo05_lookup sv, _s330_amo05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-5-they-hate-him-that-rebuketh-in-the-gate',
       E'They hate him that rebuketh in the gate — the bribe-taking courts against the Torah''s justice',
       E'The lawsuit turns to the courts: *Ye who turn judgment to wormwood, and leave off righteousness in the earth* (Amos 5:7); *They hate him that rebuketh in the gate, and they abhor him that speaketh uprightly* (5:10); *they afflict the just, they take a bribe, and they turn aside the poor in the gate from their right* (5:12). The gate is the Torah''s courtroom, and every charge names a broken command. *Thou shalt not wrest the judgment of thy poor in his cause* (Exodus 23:6) — they wrest it. *Thou shalt take no gift: for the gift blindeth the wise* (Exodus 23:8) — they take the bribe. The judges set in the gates were charged precisely against this: *Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous* (Deuteronomy 16:19). And the cry of the trampled poor does not vanish — the restored witness sets Yahuah as the Judge who *will not accept any person against a poor man, but will hear the prayer of the oppressed* (Sirach 35:13), for *do not the tears run down the widow''s cheeks? and is not her cry against him that causeth them to fall?* (Sirach 35:15). The gate corrupted by bribes is the very evil the call to *establish judgment in the gate* (5:15) would undo.',
       sv.verse_id, ev.verse_id, 'extras', 45286
  FROM _s330_amo05_lookup sv, _s330_amo05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-5-the-day-of-yahuah-is-darkness-and-not-light',
       E'The day of Yahuah is darkness, and not light — woe to the presumptuous who desire it',
       E'Against all false security in chosenness the prophet lifts a woe: *Woe unto you that desire the day of Yahuah (LORD)! to what end is it for you? the day of Yahuah (LORD) is darkness, and not light. As if a man did flee from a lion, and a bear met him... Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* (Amos 5:18-20). Those who long for the day as a day of triumph have not reckoned with judgment. Joel sounds the same alarm: *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand; A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:1-2). Zephaniah piles up the darkness: *The great day of Yahuah (LORD) is near... That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:14-15). And Paul carries the day forward to those who cry *Peace and safety*: *the day of Yahuah (Lord) so cometh as a thief in the night... then sudden destruction cometh upon them... and they shall not escape* (1 Thessalonians 5:2-3). The day is real; for the presumptuous it is darkness, no brightness in it.',
       sv.verse_id, ev.verse_id, 'free', 45289
  FROM _s330_amo05_lookup sv, _s330_amo05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-5-let-judgment-run-down-as-waters',
       E'Let judgment run down as waters — corrupt worship judged, the appointed times never abolished',
       E'The keystone of the chapter, and the most misread: *I hate, I despise your feast days, and I will not smell in your solemn assemblies. Though ye offer me burnt offerings and your meat offerings, I will not accept them... Take thou away from me the noise of thy songs... But let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:21-24). Read rightly, this is NOT the abolition of Yahuah''s appointed times (Leviticus 23 stands) — it is the rejection of feasts kept by the same hands that *take a bribe, and... turn aside the poor in the gate* (5:12): worship divorced from the justice it was always meant to carry. Isaiah says it identically — *To what purpose is the multitude of your sacrifices unto me?... I delight not in the blood of bullocks... Learn to do well; seek judgment, relieve the oppressed* (Isaiah 1:11,17). Hosea: *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Micah: *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). And Yahusha seals the frame against any antinomian misreading: justice and mercy are *the weightier matters of the law... these ought ye to have done, and not to leave the other undone* (Matthew 23:23) — the tithe kept, the feast kept, AND the justice done. The river of judgment running down as waters is the heart the appointed times point to; never one without the other.',
       sv.verse_id, ev.verse_id, 'free', 45292
  FROM _s330_amo05_lookup sv, _s330_amo05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-5-the-tabernacle-of-your-moloch-the-star-of-your-god',
       E'The tabernacle of your Moloch, the star of your god — the idolatry Stephen quotes',
       E'The chapter ends by exposing the hidden idolatry carried even through the wilderness: *Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)? But ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god, which ye made to yourselves. Therefore will I cause you to go into captivity beyond Damascus, saith Yahuah (LORD), whose name is The Elohim (God) of hosts* (Amos 5:25-27). Stephen, on the day he died, reads this very passage against his accusers: *Then Elohim (God) turned, and gave them up to worship the host of heaven; as it is written in the book of the prophets, O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness? Yea, ye took up the tabernacle of Moloch, and the star of your god Remphan, figures which ye made to worship them: and I will carry you away beyond Babylon* (Acts 7:42-43). The same star-worship, the same captivity-sentence — *beyond Damascus* in Amos, *beyond Babylon* in Stephen''s mouth: the library reading itself across the centuries. The indictment was never the slain beasts; it was the star of a strange god borne in the heart.',
       sv.verse_id, ev.verse_id, 'free', 45295
  FROM _s330_amo05_lookup sv, _s330_amo05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=5 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I have set before you life and death, blessing and cursing: therefore choose life* (Deuteronomy 30:19) — *Seek ye me, and ye shall live* (Amos 5:4) is Moses'' covenant choice set before the people again.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-ye-me-and-ye-shall-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6) — the urgency of *Seek Yahuah... lest he break out like fire* (Amos 5:6); seek Him while the window is open.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-ye-me-and-ye-shall-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14) — *Seek good, and not evil... Hate the evil, and love the good* (Amos 5:14-15) is the Psalm''s counsel to the one who loveth life.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-ye-me-and-ye-shall-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *seek ye first the kingdom of Elohim (God), and his righteousness* (Matthew 6:33) — Yahusha gathers Amos'' *Seek good... that ye may live* (Amos 5:14) into one charge: seek first the King and His righteousness.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-ye-me-and-ye-shall-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Love righteousness, you that be judges of the earth... in simplicity of heart seek him* (Wisdom of Solomon 1:1) — the restored witness joins the call of *Seek ye me, and ye shall live* (Amos 5:4): seek Him in simplicity of heart.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-ye-me-and-ye-shall-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Which maketh Arcturus, Orion, and Pleiades, and the chambers of the south* (Job 9:9) — the One Amos bids them seek, *him that maketh the seven stars and Orion* (Amos 5:8), is the Maker Job names.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-him-that-maketh-the-seven-stars-and-orion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31) — the *seven stars and Orion* (Amos 5:8) only the Maker can bind and loose; the Creator is the One to seek.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-him-that-maketh-the-seven-stars-and-orion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he made the stars also* (Genesis 1:16) — the doxology *Seek him that maketh the seven stars* (Amos 5:8) reaches back to the fourth day of creation.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-seek-him-that-maketh-the-seven-stars-and-orion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt not wrest the judgment of thy poor in his cause* (Exodus 23:6) — the courts that *turn aside the poor in the gate from their right* (Amos 5:12) break this very command.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-they-hate-him-that-rebuketh-in-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt take no gift: for the gift blindeth the wise* (Exodus 23:8) — the bribe-takers who *take a bribe* in the gate (Amos 5:12) do the forbidden thing; the gift has blinded them.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-they-hate-him-that-rebuketh-in-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not wrest judgment... neither take a gift: for a gift doth blind the eyes of the wise* (Deuteronomy 16:19) — the judges'' own gate-charge, broken by those who *afflict the just* and *take a bribe* (Amos 5:12).'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-they-hate-him-that-rebuketh-in-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *He will not accept any person against a poor man, but will hear the prayer of the oppressed* (Sirach 35:13) — against the courts that *turn aside the poor* (Amos 5:12), Yahuah is the Judge who hears the oppressed.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-they-hate-him-that-rebuketh-in-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*do not the tears run down the widow''s cheeks? and is not her cry against him that causeth them to fall?* (Sirach 35:15) — the poor *turned aside in the gate* (Amos 5:12) have a cry that rises to the true Judge.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-they-hate-him-that-rebuketh-in-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1) — Amos'' woe on those who *desire the day of Yahuah* (Amos 5:18) is met by Joel''s alarm: let the land tremble.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-the-day-of-yahuah-is-darkness-and-not-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:2) — Joel says word for word what Amos says: the day is *darkness, and not light* (Amos 5:18).'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-the-day-of-yahuah-is-darkness-and-not-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15) — Amos asks if the day is *very dark, and no brightness in it* (Amos 5:20); Zephaniah answers, a day of wrath.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-the-day-of-yahuah-is-darkness-and-not-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — the day the presumptuous *desire* (Amos 5:18) comes unlooked-for on those who cry Peace and safety.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-the-day-of-yahuah-is-darkness-and-not-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *To what purpose is the multitude of your sacrifices unto me?... I delight not in the blood of bullocks* (Isaiah 1:11) — Isaiah''s same verdict on worship from bloody hands; *I will not accept them* (Amos 5:22). Not the offerings abolished, the oppressors'' offerings refused.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-let-judgment-run-down-as-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17) — the river of *judgment... and righteousness* (Amos 5:24) spelled out; the heart the feasts were meant to carry.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-let-judgment-run-down-as-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — Yahuah''s refusal of the offering (Amos 5:22) is Hosea''s same heart: mercy is what the altar pointed to, never the altar abolished.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-let-judgment-run-down-as-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8) — *let judgment run down as waters* (Amos 5:24) is Micah''s do-justly-love-mercy, the weight of the covenant the feasts bear.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-let-judgment-run-down-as-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23) — Yahusha seals the frame: the justice of *judgment run down as waters* (Amos 5:24) kept ALONGSIDE the tithe and the feast, never instead of the Torah.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-let-judgment-run-down-as-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yea, ye took up the tabernacle of Moloch, and the star of your god Remphan... and I will carry you away beyond Babylon* (Acts 7:43) — Stephen quotes Amos verbatim (Amos 5:26); the same star-worship, the same captivity-sentence.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=26
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-the-tabernacle-of-your-moloch-the-star-of-your-god'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* (Acts 7:42) — Stephen reads Amos'' own wilderness question (Amos 5:25) before the captivity-sentence; the star-worship, not the slain beasts, is the indictment.'
  FROM cross_reference_threads t
  JOIN _s330_amo05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s330_amo05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-5-the-tabernacle-of-your-moloch-the-star-of-your-god'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_6.sql (Amos 6) -----
-- Chapter: Amos 6 — WOE TO THEM THAT ARE AT EASE IN ZION. The covenant-lawsuit against the
-- complacent elite of the northern house: they lie on beds of ivory, eat the lambs of the flock,
-- drink wine in bowls, anoint with the chief ointments — *but they are not grieved for the
-- affliction of Joseph* (6:6). The two-house breach (the ruin of the north, Yoseph/Ephraim) is
-- the very grief their luxury ignores; therefore they go captive at the head of the captives
-- (6:7). Yahuah swears by himself: *I abhor the excellency of Jacob, and hate his palaces* (6:8).
-- The absurdity of injustice — horses do not run on rock, no one plows the rock with oxen — yet
-- *ye have turned judgment into gall, and the fruit of righteousness into hemlock* (6:12). And
-- they boast in their own might: *Have we not taken to us horns by our own strength?* (6:13). The
-- woe on callous wealth, the pride judged, justice perverted, vain strength rebuked.
-- Tag: amo06   Temp view: _s330_amo06_lookup
-- Sort band: base 45300, step 3 -> threads at 45300, 45303, 45306, 45309 (4 threads)
-- Source of EVERY row: 'canon','amos',6,v
--
-- Amos 6 coverage:
--   ★★ v.1-6 (Woe to them that are at ease in Zion... lie upon beds of ivory... drink wine in
--          bowls, and anoint themselves with the chief ointments: but they are not grieved for the
--          affliction of Joseph)
--        NT:     ★★ Luke 6:24-25 (woe unto you that are rich... woe unto you that are full...
--                that laugh now), ★★ Luke 16:19,25 (the rich man clothed in purple, faring
--                sumptuously every day; thou in thy lifetime receivedst thy good things), ★★
--                James 5:1,5 (ye rich men, weep and howl... ye have lived in pleasure on the
--                earth, and been wanton), ★ 1 Timothy 5:6 (she that liveth in pleasure is dead
--                while she liveth) — THREAD 1
--        Extras: ★ Sirach 5:1 (Set your heart upon your goods; and say not, I have enough for my
--                life), Sirach 5:8 (Set not your heart upon goods unjustly gotten, for they shall
--                not profit you in the day of calamity) — THREAD 1 (clean witness on false
--                security in riches)
--        Tanakh: Amos 5:11-12 (treading upon the poor / take a bribe) woven in prose; the two-house
--                grief (affliction of Joseph) is the chapter's own weight — held in THREAD 1 prose
--   ★ v.8 (Adonai Yahuah... I abhor the excellency of Jacob, and hate his palaces)
--        NT:     ★ James 4:6 (Elohim resisteth the proud, but giveth grace unto the humble) — THREAD 2
--        Extras: ★ Sirach 11:30 (Like as a partridge taken and kept in a cage, so is the heart of
--                the proud) — THREAD 2 (clean witness on the heart of the proud)
--        Tanakh: ★ Proverbs 16:18 (Pride goeth before destruction, and an haughty spirit before a
--                fall) — THREAD 2
--   v.7 (go captive with the first that go captive; the banquet of them that stretched themselves
--          removed) — held in THREAD 1 prose (the sentence on the careless feasters)
--   v.9-11 (if there remain ten men in one house, they shall die... smite the great house with
--          breaches) — none warranted distinct; the desolation woven into THREAD 1/2 prose
--   ★ v.12 (Shall horses run upon the rock?... for ye have turned judgment into gall, and the
--          fruit of righteousness into hemlock)
--        NT:     ★ Hebrews 12:15 (lest any root of bitterness springing up trouble you, and
--                thereby many be defiled) — THREAD 3
--        Extras: none warranted (Sirach/Wisdom carry no clean gall-of-injustice witness; the lateral
--                Torah/prophet root is the load-bearing weave)
--        Tanakh: ★ Amos 5:7 (Ye who turn judgment to wormwood, and leave off righteousness in the
--                earth), ★ Deuteronomy 29:18 (a root that beareth gall and wormwood) — THREAD 3
--   ★ v.13 (Ye which rejoice in a thing of nought, which say, Have we not taken to us horns by our
--          own strength?)
--        NT:     ★ 1 Corinthians 1:31 (He that glorieth, let him glory in Yahuah (Lord)) — THREAD 4
--        Extras: none warranted (the glory-in-might weave is carried by Jeremiah 9 + Psalm 20,
--                the strongest witnesses)
--        Tanakh: ★ Psalm 20:7 (Some trust in chariots, and some in horses: but we will remember
--                the name of Yahuah Eloheinu), ★ Jeremiah 9:23-24 (let not the mighty man glory in
--                his might... but let him that glorieth glory in this, that he... knoweth me) — THREAD 4
--   v.14 (I will raise up against you a nation... afflict you from Hemath unto the river) — held
--          in prose (the foreign nation as the rod of judgment on the boasters of v.13)
--
-- Threads (slug — target libraries):
--   1. amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph
--        — NT (Luke 6, Luke 16, James 5, 1 Timothy 5) + Extras (Sirach 5) [extras]
--        (★★ KEYSTONE: the woe on callous luxury; the two-house breach of Yoseph ignored)
--   2. amos-6-i-abhor-the-excellency-of-jacob-and-hate-his-palaces
--        — NT (James 4) + Extras (Sirach 11) + Tanakh (Proverbs 16) [extras]
--        (★ the self-glory judged; pride before the fall, Elohim resists the proud)
--   3. amos-6-ye-have-turned-judgment-into-gall — NT (Hebrews 12) + Tanakh (Amos 5, Deuteronomy 29) [free]
--        (★ justice perverted is against nature; the root of gall and bitterness)
--   4. amos-6-rejoice-in-a-thing-of-nought-by-our-own-strength
--        — NT (1 Corinthians 1) + Tanakh (Psalm 20, Jeremiah 9) [free]
--        (★ vain boasting in their own might; glory only in knowing Yahuah)
--
-- Framing notes:
--   ★★ AT EASE IN ZION (THREAD 1): *Woe to them that are at ease in Zion... That lie upon beds of
--      ivory, and stretch themselves upon their couches... That drink wine in bowls, and anoint
--      themselves with the chief ointments: but they are not grieved for the affliction of Joseph*
--      (6:1-6). The "affliction of Joseph" is the two-house grief — the collapse of the northern
--      house (Yoseph/Ephraim) that the complacent elite feel nothing for. Yahusha's woes answer it
--      directly (*woe unto you that are rich... that are full... that laugh now*, Luke 6:24-25; the
--      rich man faring sumptuously while Lazarus starves, Luke 16:19,25), as does James (*ye have
--      lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day
--      of slaughter*, James 5:5) and Paul (*she that liveth in pleasure is dead while she liveth*,
--      1 Tim 5:6). Sirach's clean witness names the false security: *Set your heart upon your
--      goods; and say not, I have enough for my life* (5:1); *Set not your heart upon goods
--      unjustly gotten, for they shall not profit you in the day of calamity* (5:8).
--   ★ THE EXCELLENCY OF JACOB (THREAD 2): *I abhor the excellency of Jacob, and hate his palaces*
--      (6:8) — self-glory judged. *Pride goeth before destruction, and an haughty spirit before a
--      fall* (Prov 16:18); *Elohim resisteth the proud, but giveth grace unto the humble* (Jas 4:6);
--      *Like as a partridge taken and kept in a cage, so is the heart of the proud* (Sirach 11:30).
--   ★ JUDGMENT TURNED TO GALL (THREAD 3): horses do not run on rock — yet *ye have turned judgment
--      into gall, and the fruit of righteousness into hemlock* (6:12). Justice perverted is against
--      nature. Amos already named it (*Ye who turn judgment to wormwood*, 5:7); Torah named the
--      poison-root (*a root that beareth gall and wormwood*, Deut 29:18); Hebrews carries it forward
--      (*lest any root of bitterness springing up trouble you*, Heb 12:15).
--   ★ BY OUR OWN STRENGTH (THREAD 4): *Ye which rejoice in a thing of nought, which say, Have we
--      not taken to us horns by our own strength?* (6:13) — boasting in their own might. *Some
--      trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu*
--      (Ps 20:7); *let not the mighty man glory in his might... but let him that glorieth glory in
--      this, that he... knoweth me* (Jer 9:23-24); *He that glorieth, let him glory in Yahuah*
--      (1 Cor 1:31).
--   VERSES WITH NO SEPARATE ADD: v.2 (the comparison cities — held in prose), v.7 (the captivity
--      sentence — bound to THREAD 1's feasters), v.9-11 (the desolation/breaches — woven into the
--      judgment prose), v.14 (the foreign nation raised up — the rod on the boasters of v.13).
--      All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): At ease in Zion — not grieved for the affliction of Joseph
    ('canon','amos',6,1,'canon','luke',6,24,'free',
      E'*But woe unto you that are rich! for ye have received your consolation* (Luke 6:24). The *Woe to them that are at ease in Zion* (Amos 6:1) is taken up word for posture by Yahusha (Jesus): the woe on those whose comfort is their wealth, who *have received* their consolation now. The complacent rich of Zion and the rich of the gospel-woe stand under one verdict.'),
    ('canon','amos',6,4,'canon','luke',6,25,'free',
      E'*Woe unto you that are full! for ye shall hunger. Woe unto you that laugh now! for ye shall mourn and weep* (Luke 6:25). They that *eat the lambs out of the flock, and the calves out of the midst of the stall* (Amos 6:4) are the full who shall hunger; their feasting laughter turns to mourning. The luxury of Amos 6 is the very fullness Yahusha pronounces woe upon.'),
    ('canon','amos',6,4,'canon','luke',16,19,'free',
      E'*There was a certain rich man, which was clothed in purple and fine linen, and fared sumptuously every day* (Luke 16:19). The man on the *beds of ivory* who feasts on the flock (Amos 6:4) is the rich man faring sumptuously while Lazarus starves at the gate — the same callous luxury that feels nothing for the afflicted at its door.'),
    ('canon','amos',6,6,'canon','luke',16,25,'free',
      E'*But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented* (Luke 16:25). They who *drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph* (Amos 6:6) received their good things and grieved not for the afflicted; the reversal of Lazarus is the end of the ungrieving feasters.'),
    ('canon','amos',6,1,'canon','james',5,1,'free',
      E'*Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1). The woe on those *at ease in Zion* (Amos 6:1) is James''s woe on the rich men called to weep and howl for the misery coming — the same covenant-lawsuit against complacent wealth.'),
    ('canon','amos',6,6,'canon','james',5,5,'free',
      E'*Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter* (James 5:5). The bowls of wine and the chief ointments, while *not grieved for the affliction of Joseph* (Amos 6:6), are the pleasure and wantonness James indicts — hearts nourished for slaughter even as the poor cry. The day of their banquet is the day of their judgment.'),
    ('canon','amos',6,6,'canon','1-timothy',5,6,'free',
      E'*But she that liveth in pleasure is dead while she liveth* (1 Timothy 5:6). The careless luxury of Amos 6:6 — wine, ointments, and no grief for the afflicted — is death masked as life: *dead while she liveth*. Pleasure without mercy is already the grave.'),
    ('canon','amos',6,1,'apocrypha','ecclesiasticus',5,1,'extras',
      E'*Set your heart upon your goods; and say not, I have enough for my life* (Sirach 5:1). The ease of those who *trust in the mountain of Samaria* (Amos 6:1) is the false security Sirach warns against — the heart set upon goods, saying I have enough. The complacent rich say it in their palaces; the wise are warned not to.'),
    ('canon','amos',6,7,'apocrypha','ecclesiasticus',5,8,'extras',
      E'*Set not your heart upon goods unjustly gotten, for they shall not profit you in the day of calamity* (Sirach 5:8). They who feast and stretch themselves *shall go captive with the first that go captive* (Amos 6:7) — for goods unjustly gotten *profit nothing in the day of calamity*. The banquet is removed when the calamity comes.'),

    -- THREAD 2 (★): I abhor the excellency of Jacob, and hate his palaces
    ('canon','amos',6,8,'canon','proverbs',16,18,'free',
      E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). When Yahuah swears *I abhor the excellency of Jacob, and hate his palaces* (Amos 6:8), it is the self-exalting pride that draws the destruction down — the haughty spirit before the fall. The palaces of the proud are the very thing handed over.'),
    ('canon','amos',6,8,'canon','james',4,6,'free',
      E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). The *excellency of Jacob* that Yahuah *abhors* (Amos 6:8) is the pride Elohim resists; the same Elohim who hates the proud man''s palaces gives grace to the lowly. The covenant turns on this: the proud are set against, the humble lifted up.'),
    ('canon','amos',6,8,'apocrypha','ecclesiasticus',11,30,'extras',
      E'*Like as a partridge taken and kept in a cage, so is the heart of the proud; and like as a spy, watcheth he for your fall* (Sirach 11:30). The *excellency of Jacob* that Yahuah hates (Amos 6:8) is the caged, restless heart of the proud Sirach pictures — self-glory that ends in the fall it watches to bring on others.'),

    -- THREAD 3 (★): Ye have turned judgment into gall
    ('canon','amos',6,12,'canon','amos',5,7,'free',
      E'*Ye who turn judgment to wormwood, and leave off righteousness in the earth* (Amos 5:7). Amos already named the crime that 6:12 calls absurd: *ye have turned judgment into gall, and the fruit of righteousness into hemlock*. Justice made bitter, righteousness cast down — the same indictment, the poison of perverted judgment.'),
    ('canon','amos',6,12,'canon','deuteronomy',29,18,'free',
      E'*Lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God)... lest there should be among you a root that beareth gall and wormwood* (Deuteronomy 29:18). The Torah named the poison-root long before: the heart turned from Yahuah bears *gall and wormwood*. When they *turned judgment into gall* (Amos 6:12), the covenant-root of bitterness had sprung up in Zion.'),
    ('canon','amos',6,12,'canon','hebrews',12,15,'free',
      E'*Looking diligently lest any man fail of the grace of Elohim (God); lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15). The *judgment... turned into gall* (Amos 6:12) is the root of bitterness Hebrews warns the assembly to watch for — it springs up and defiles many. The gall of perverted justice poisons the whole people.'),

    -- THREAD 4 (★): Rejoice in a thing of nought — by our own strength
    ('canon','amos',6,13,'canon','psalms',20,7,'free',
      E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). They who say *Have we not taken to us horns by our own strength?* (Amos 6:13) trust in chariots and horses; the faithful trust the Name. The boast in their own might is the *thing of nought* the psalm answers.'),
    ('canon','amos',6,13,'canon','jeremiah',9,23,'free',
      E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* (Jeremiah 9:23). The boast *we have taken to us horns by our own strength* (Amos 6:13) is exactly the might in which Yahuah forbids glorying — the mighty man''s vain glory in his own strength.'),
    ('canon','amos',6,13,'canon','jeremiah',9,24,'free',
      E'*But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth* (Jeremiah 9:24). Against those who *rejoice in a thing of nought* and trust their own horns (Amos 6:13), Jeremiah sets the only true glory: to know Yahuah. The strength they boast in is nought; the knowledge of Him is everything.'),
    ('canon','amos',6,13,'canon','1-corinthians',1,31,'free',
      E'*That, according as it is written, He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31). Paul carries Jeremiah''s word forward against the very boast of Amos 6:13 — *Have we not taken to us horns by our own strength?* No flesh may glory in its own might; *he that glorieth, let him glory in Yahuah*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph',
       E'Woe to them that are at ease in Zion — not grieved for the affliction of Joseph',
       E'The covenant-lawsuit falls on the complacent elite: *Woe to them that are at ease in Zion, and trust in the mountain of Samaria, which are named chief of the nations* (Amos 6:1). They feel nothing for the ruin of the people: *That lie upon beds of ivory, and stretch themselves upon their couches, and eat the lambs out of the flock, and the calves out of the midst of the stall... That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph* (6:4-6). The *affliction of Joseph* is the two-house grief — the collapse of the northern house, Yoseph/Ephraim — and their luxury cannot be bothered with it. Therefore *they go captive with the first that go captive, and the banquet of them that stretched themselves shall be removed* (6:7). Yahusha (Jesus) takes up the very woe: *woe unto you that are rich! for ye have received your consolation. Woe unto you that are full! for ye shall hunger. Woe unto you that laugh now! for ye shall mourn and weep* (Luke 6:24-25). He paints it as a man: *There was a certain rich man, which was clothed in purple and fine linen, and fared sumptuously every day* (Luke 16:19), to whom Abraham says, *Son, remember that thou in thy lifetime receivedst thy good things... but now he is comforted, and thou art tormented* (Luke 16:25). James indicts the same: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1); *Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter* (James 5:5). Paul names its end: *she that liveth in pleasure is dead while she liveth* (1 Tim 5:6). And the restored wisdom witness warns the heart against it: *Set your heart upon your goods; and say not, I have enough for my life* (Sirach 5:1); *Set not your heart upon goods unjustly gotten, for they shall not profit you in the day of calamity* (Sirach 5:8). One verdict across the library: the wealth that feels no grief for the afflicted is the wealth that goes first into captivity.',
       sv.verse_id, ev.verse_id, 'extras', 45300
  FROM _s330_amo06_lookup sv, _s330_amo06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-6-i-abhor-the-excellency-of-jacob-and-hate-his-palaces',
       E'I abhor the excellency of Jacob — pride before the fall',
       E'Yahuah swears against the self-glory of the proud: *Adonai Yahuah (The Lord GOD) hath sworn by himself, saith Yahuah (LORD) the Elohim (God) of hosts, I abhor the excellency of Jacob, and hate his palaces: therefore will I deliver up the city with all that is therein* (Amos 6:8). The proud excellency and the gleaming palaces are the very things handed over. Wisdom named the law of it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). James names the divine posture: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). And Sirach pictures the restless, self-watching heart that ends in its own fall: *Like as a partridge taken and kept in a cage, so is the heart of the proud; and like as a spy, watcheth he for your fall* (Sirach 11:30). The excellency Yahuah abhors is the very pride that, by the whole library''s witness, goes before destruction.',
       sv.verse_id, ev.verse_id, 'extras', 45303
  FROM _s330_amo06_lookup sv, _s330_amo06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-6-ye-have-turned-judgment-into-gall',
       E'Ye have turned judgment into gall — the root of bitterness',
       E'The prophet exposes injustice as a thing against nature itself: *Shall horses run upon the rock? will one plow there with oxen? for ye have turned judgment into gall, and the fruit of righteousness into hemlock* (Amos 6:12). Horses do not run on rock; no one plows the rock with oxen — and just so, to pervert justice is to fight nature, to poison the sweet fruit of righteousness into bitter gall. Amos had already named the crime: *Ye who turn judgment to wormwood, and leave off righteousness in the earth* (Amos 5:7). The Torah named the poison-root long before: *lest there should be among you a root that beareth gall and wormwood* (Deuteronomy 29:18) — the heart turned away from Yahuah bears this very fruit. And the warning carries forward to the assembly: *Looking diligently lest any man fail of the grace of Elohim (God); lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15). The gall of perverted judgment is no private sin; it is a root that springs up and defiles the whole people.',
       sv.verse_id, ev.verse_id, 'free', 45306
  FROM _s330_amo06_lookup sv, _s330_amo06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-6-rejoice-in-a-thing-of-nought-by-our-own-strength',
       E'Have we not taken to us horns by our own strength? — the vain boast in might',
       E'The complacent boast in their own conquests: *Ye which rejoice in a thing of nought, which say, Have we not taken to us horns by our own strength?* (Amos 6:13). The "horns" are their power and victories, and they credit them to themselves — rejoicing in a thing of nought. The Psalms answer the boast: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). Jeremiah forbids the very glory: *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* (Jeremiah 9:23), and sets the only true glory in its place: *But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth* (Jeremiah 9:24). Paul carries Jeremiah''s word forward — *He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31). The strength they boast in is nought; the knowledge of Him is everything. And the boast is answered at once: *behold, I will raise up against you a nation, O house of Yashar''el (Israel)* (6:14) — the horns of their own strength cannot stand before the nation Yahuah raises.',
       sv.verse_id, ev.verse_id, 'free', 45309
  FROM _s330_amo06_lookup sv, _s330_amo06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *woe unto you that are rich! for ye have received your consolation* (Luke 6:24) — Yahusha takes up the woe of *them that are at ease in Zion* (Amos 6:1) on those whose comfort is their wealth.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Woe unto you that are full! for ye shall hunger. Woe unto you that laugh now!* (Luke 6:25) — they that *eat the lambs out of the flock* (Amos 6:4) are the full who shall hunger.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *a certain rich man... fared sumptuously every day* (Luke 16:19) — the feaster on *beds of ivory* (Amos 6:4) is the rich man at whose gate Lazarus starves.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *thou in thy lifetime receivedst thy good things... but now he is comforted, and thou art tormented* (Luke 16:25) — the reversal of those who *are not grieved for the affliction of Joseph* (Amos 6:6).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1) — the woe on *them that are at ease in Zion* (Amos 6:1) is James''s woe on complacent wealth.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter* (James 5:5) — the bowls of wine while *not grieved for the affliction of Joseph* (Amos 6:6); hearts nourished for slaughter.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *she that liveth in pleasure is dead while she liveth* (1 Timothy 5:6) — the careless luxury of Amos 6:6 is death masked as life.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Set your heart upon your goods; and say not, I have enough for my life* (Sirach 5:1) — the false security of those who *trust in the mountain of Samaria* (Amos 6:1).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *Set not your heart upon goods unjustly gotten, for they shall not profit you in the day of calamity* (Sirach 5:8) — the banquet *removed* (Amos 6:7) when the calamity comes.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-at-ease-in-zion-not-grieved-for-the-affliction-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — the *excellency of Jacob* Yahuah abhors (Amos 6:8) is the pride that draws destruction down.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-i-abhor-the-excellency-of-jacob-and-hate-his-palaces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — the *excellency of Jacob* (Amos 6:8) is the pride Elohim sets himself against.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-i-abhor-the-excellency-of-jacob-and-hate-his-palaces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Like as a partridge taken and kept in a cage, so is the heart of the proud* (Sirach 11:30) — the caged, restless heart of the *excellency of Jacob* Yahuah hates (Amos 6:8).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-i-abhor-the-excellency-of-jacob-and-hate-his-palaces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Ye who turn judgment to wormwood, and leave off righteousness in the earth* (Amos 5:7) — the same crime 6:12 calls absurd: *judgment into gall*.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-ye-have-turned-judgment-into-gall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a root that beareth gall and wormwood* (Deuteronomy 29:18) — the Torah named the poison-root long before they *turned judgment into gall* (Amos 6:12).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-ye-have-turned-judgment-into-gall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15) — the *gall* of perverted judgment (Amos 6:12) springs up and defiles the whole people.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-ye-have-turned-judgment-into-gall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7) — against the boast *by our own strength* (Amos 6:13).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-rejoice-in-a-thing-of-nought-by-our-own-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *neither let the mighty man glory in his might* (Jeremiah 9:23) — exactly the might in which Amos 6:13''s boasters glory.'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-rejoice-in-a-thing-of-nought-by-our-own-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *let him that glorieth glory in this, that he... knoweth me* (Jeremiah 9:24) — the only true glory against the *thing of nought* (Amos 6:13).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-rejoice-in-a-thing-of-nought-by-our-own-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31) — Paul carries Jeremiah''s word forward against the boast in their own strength (Amos 6:13).'
  FROM cross_reference_threads t
  JOIN _s330_amo06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s330_amo06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-6-rejoice-in-a-thing-of-nought-by-our-own-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_7.sql (Amos 7) -----
-- Chapter: Amos 7 — THE VISIONS AND THE CALL. Twice Amos sees judgment rising — the grasshoppers
-- devouring the latter growth (7:1-3) and the fire devouring the deep (7:4-6) — and twice he stands in
-- the breach: *O Yahuah (Lord) GOD, forgive, I beseech thee: by whom shall Jacob arise? for he is small*
-- (7:2), and twice *Yahuah (LORD) repented for this: It shall not be, saith Yahuah (LORD)* (7:3). The
-- prophet's intercession turns back wrath — the Moses-pattern (Exodus 32:11-14; Psalm 106:23), the man
-- Yahuah seeks to stand in the gap (Ezekiel 22:30), Abraham pleading for Sodom (Genesis 18), the
-- righteous man's effectual prayer (James 5:16), the Formed Son who *ever liveth to make intercession*
-- (Hebrews 7:25). Then the plumbline is set *in the midst of my people Yashar'el (Israel)* (7:7-9) — the
-- righteous standard against which the people are found crooked (2 Kings 21:13; Isaiah 28:17; Lamentations
-- 2:8; the measuring reed of Revelation 11:1). Finally Amaziah the priest of Beth-el silences the prophet
-- and tells him to flee (7:10-13); Amos answers *I was no prophet, neither was I a prophet's son... And
-- Yahuah (LORD) took me as I followed the flock* (7:14-15) — Yahuah's commission over institutional
-- credential, the unlikely called (Jeremiah 1:5-7; 1 Corinthians 1:27-29; Acts 4:13; Matthew 4:18-19),
-- the prophet sent against the priest who would gag him (Amos 2:12; Matthew 23).
-- Tag: amo07   Temp view: _s330_amo07_lookup
-- Sort band: base 45320, step 3 -> threads at 45320, 45323, 45326, 45329 (4 threads)
-- Source of EVERY row: 'canon','amos',7,v
--
-- Amos 7 coverage:
--   ★★ v.1-6 (he formed grasshoppers... O Yahuah (Lord) GOD, forgive, I beseech thee: by whom shall
--          Jacob arise? for he is small... Yahuah (LORD) repented for this: It shall not be)
--        NT:     ★★ James 5:16 (The effectual fervent prayer of a righteous man availeth much) — THREAD 1;
--                ★★ Hebrews 7:25 (he ever liveth to make intercession for them) — THREAD 1
--        Extras: ★ 2 Maccabees 15:14 (a lover of the brothers, who prayeth much for the people... Jeremias
--                the prophet) — THREAD 1 (the prophet interceding for the people)
--        Tanakh: ★★ Exodus 32:11-14 (Moses besought Yahuah... and Yahuah repented of the evil),
--                ★★ Psalm 106:23 (had not Moses his chosen stood before him in the breach),
--                ★★ Ezekiel 22:30 (I sought for a man... that should stand in the gap),
--                ★ Genesis 18:23,32 (Wilt thou also destroy the righteous with the wicked... for ten's sake)
--                — THREAD 1
--   ★★ v.7-9 (Behold, I will set a plumbline in the midst of my people Yashar'el (Israel): I will not
--          again pass by them any more)
--        NT:     ★ Revelation 11:1 (Rise, and measure the temple of Elohim (God)) — THREAD 2 (the
--                measuring reed/standard)
--        Extras: none warranted (the measuring-standard weave is canon-heavy; no clean extras add forced)
--        Tanakh: ★★ Isaiah 28:17 (Judgment also will I lay to the line, and righteousness to the plummet),
--                ★ 2 Kings 21:13 (I will stretch over Jerusalem the line of Samaria, and the plummet of
--                the house of Ahab), ★ Lamentations 2:8 (he hath stretched out a line, he hath not
--                withdrawn his hand from destroying) — THREAD 2
--   ★★ v.14-15 (I was no prophet, neither was I a prophet's son... And Yahuah (LORD) took me as I followed
--          the flock, and Yahuah (LORD) said unto me, Go, prophesy unto my people Yashar'el (Israel))
--        NT:     ★ 1 Corinthians 1:27-29 (Elohim hath chosen the foolish... the weak... that no flesh
--                should glory), ★ Acts 4:13 (unlearned and ignorant men... they had been with Yahusha),
--                Matthew 4:18-19 (Follow me, and I will make you fishers of men) — THREAD 3
--        Extras: none warranted distinct (the call-over-credential weave is canon; Sirach 48 is Elijah-type
--                zeal, not the unlikely-call note — declined)
--        Tanakh: ★★ Jeremiah 1:5-7 (Before I formed thee in the belly I knew thee... thou shalt go to all
--                that I shall send thee) — THREAD 3 (Yahuah's commission over the man's protest)
--   ★★ v.10-13,16-17 (Amaziah the priest of Beth-el... Prophesy not against Yashar'el (Israel)... but
--          prophesy not again any more at Beth-el)
--        NT:     ★ Matthew 23:34 (I send unto you prophets... and some of them ye shall kill), Matthew
--                23:37 (Jerusalem... thou that killest the prophets, and stonest them which are sent) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Amos 2:12 (commanded the prophets, saying, Prophesy not) — THREAD 4 (the same gagging
--                of the prophets, named earlier in Amos's own lawsuit)
--
-- Threads (slug — target libraries):
--   1. amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach
--      — NT (James 5, Hebrews 7) + Extras (2 Maccabees 15) + Tanakh (Exodus 32, Psalm 106, Ezekiel 22,
--        Genesis 18) [extras]  (★★ the intercession that turns back judgment — the Moses-pattern, the
--        Formed-Son intercessor)
--   2. amos-7-i-will-set-a-plumbline-in-the-midst-of-my-people
--      — NT (Revelation 11) + Tanakh (Isaiah 28, 2 Kings 21, Lamentations 2) [free]  (★★ the plumbline
--        = the righteous standard/the Torah-measure by which the people are found crooked)
--   3. amos-7-i-was-no-prophet-but-yahuah-took-me
--      — NT (1 Corinthians 1, Acts 4, Matthew 4) + Tanakh (Jeremiah 1) [free]  (★★ the unlikely,
--        unschooled prophet — Yahuah's commission over institutional credential)
--   4. amos-7-prophesy-not-amaziah-the-priest-silences-the-prophet
--      — NT (Matthew 23) + Tanakh (Amos 2) [free]  (★★ the false priest who gags the prophet; the
--        persecuted/silenced prophets, covenant-lawsuit, victims-not-enemies)
--
-- Framing notes:
--   ★★ STAND IN THE BREACH (THREAD 1): twice the prophet pleads and twice Yahuah relents — *O Yahuah
--      (Lord) GOD, forgive, I beseech thee: by whom shall Jacob arise? for he is small* (7:2,5);
--      *Yahuah (LORD) repented for this: It shall not be* (7:3,6). This is the Moses-pattern: *And Moses
--      besought Yahuah Elohav (the LORD his God)... Turn from thy fierce wrath, and repent of this evil
--      against thy people... And Yahuah (LORD) repented of the evil which he thought to do unto his people*
--      (Exodus 32:11-14); *had not Moses his chosen stood before him in the breach, to turn away his wrath*
--      (Psalm 106:23). It is the very man Yahuah searches for: *I sought for a man among them, that should
--      make up the hedge, and stand in the gap before me for the land, that I should not destroy it*
--      (Ezekiel 22:30) — and here, in Amos, Yahuah finds him. Abraham did it for Sodom (Genesis 18:23,32);
--      the righteous man's prayer still does it (*The effectual fervent prayer of a righteous man availeth
--      much*, James 5:16); and the restored witness shows the prophet doing it from heaven (*a lover of
--      the brothers, who prayeth much for the people... Jeremias the prophet of Yahuah (God)*, 2 Maccabees
--      15:14). The whole pattern points to the Formed Son who *ever liveth to make intercession for them*
--      (Hebrews 7:25) — the great Intercessor standing in the breach for ever.
--   ★★ THE PLUMBLINE (THREAD 2): *Behold, I will set a plumbline in the midst of my people Yashar'el
--      (Israel): I will not again pass by them any more* (7:8). The plumbline is the measure of
--      righteousness laid against a crooked wall — *Judgment also will I lay to the line, and righteousness
--      to the plummet* (Isaiah 28:17). The same measuring line is stretched over Jerusalem in judgment
--      (*I will stretch over Jerusalem the line of Samaria, and the plummet of the house of Ahab*, 2 Kings
--      21:13; *he hath stretched out a line, he hath not withdrawn his hand from destroying*, Lamentations
--      2:8). It runs forward to the measuring reed of the last days (*Rise, and measure the temple of
--      Elohim (God), and the altar, and them that worship therein*, Revelation 11:1). The standard is the
--      Torah-righteousness of Yahuah; the people are found out of plumb against it, and the high places of
--      Isaac and the sanctuaries are laid waste (7:9).
--   ★★ I WAS NO PROPHET (THREAD 3): against the priest's credential Amos answers, *I was no prophet,
--      neither was I a prophet's son; but I was an herdman, and a gatherer of sycomore fruit: And Yahuah
--      (LORD) took me as I followed the flock, and Yahuah (LORD) said unto me, Go, prophesy unto my people
--      Yashar'el (Israel)* (7:14-15). The call is Yahuah's, not the institution's — exactly Jeremiah's
--      commission over his own protest: *Before I formed thee in the belly I knew thee... I cannot speak:
--      for I am a child. But Yahuah (LORD) said... for thou shalt go to all that I shall send thee*
--      (Jeremiah 1:5-7). Yahuah chooses the unlikely and unschooled — *Elohim (God) hath chosen the
--      foolish things of the world to confound the wise... that no flesh should glory in his presence*
--      (1 Corinthians 1:27-29); *unlearned and ignorant men... they had been with Yahusha (Jesus)* (Acts
--      4:13); the fishermen called *Follow me, and I will make you fishers of men* (Matthew 4:19). The
--      herdman is taken from the flock as the fishermen are taken from the nets.
--   ★★ PROPHESY NOT (THREAD 4): Amaziah the priest of Beth-el silences the prophet — *prophesy not again
--      any more at Beth-el: for it is the king's chapel* (7:13) — and pronounces his own ruin in return
--      (7:16-17). This is the same gagging Amos named earlier in his lawsuit: *ye gave the Nazarites wine
--      to drink; and commanded the prophets, saying, Prophesy not* (Amos 2:12). It is the long pattern of
--      the silenced and slain prophets: *behold, I send unto you prophets... and some of them ye shall
--      kill and crucify* (Matthew 23:34); *Jerusalem, Jerusalem, thou that killest the prophets, and
--      stonest them which are sent unto thee... and ye would not!* (Matthew 23:37). Read as covenant-
--      lawsuit on the false priest's house — conduct and judgment, never ethnic; the prophet is the
--      victim, the gag the sin.
--   EXTRAS: 2 Maccabees 15:14 (Jeremiah praying for the people) woven on the intercession; clean witness,
--      parse verified. No extras forced on the plumbline, the call, or the silenced prophet.
--   VERSES WITH NO SEPARATE ADD: v.1 (the forming of the grasshoppers — preface to the intercession of
--      THREAD 1), v.4 (the fire devouring the deep — the second vision, woven into THREAD 1), v.9 (the high
--      places of Isaac laid waste — the verdict the plumbline measures, woven into THREAD 2), v.10-12
--      (Amaziah's accusation and the flee-to-Yahudah taunt — preface to THREADS 3 and 4), v.16-17
--      (Amaziah's judgment — the answer to the gag, woven into THREAD 4). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): by whom shall Jacob arise — the prophet stands in the breach (intercession turns back wrath)
    ('canon','amos',7,2,'canon','exodus',32,11,'free',
      E'*And Moses besought Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), why doth thy wrath wax hot against thy people, which thou hast brought forth out of the land of Egypt with great power, and with a mighty hand?* (Exodus 32:11). Amos''s plea *O Yahuah (Lord) GOD, forgive, I beseech thee: by whom shall Jacob arise? for he is small* (Amos 7:2) is the Moses-pattern: the prophet besought Yahuah to turn from his fierce wrath against his own people. The intercessor stands between the wrath and the people.'),
    ('canon','amos',7,2,'canon','exodus',32,12,'free',
      E'*Turn from thy fierce wrath, and repent of this evil against thy people* (Exodus 32:12). Moses asks Yahuah to *repent of this evil* — and that is exactly what Amos''s plea wins: *Yahuah (LORD) repented for this: It shall not be, saith Yahuah (LORD)* (Amos 7:3). The same intercession, the same turning-back of judgment.'),
    ('canon','amos',7,3,'canon','exodus',32,14,'free',
      E'*And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14). Twice over Amos hears the same answer Moses heard — *Yahuah (LORD) repented for this: It shall not be* (Amos 7:3). The prophet''s intercession stays the hand of judgment; Yahuah repents of the evil against his people.'),
    ('canon','amos',7,2,'canon','psalms',106,23,'free',
      E'*Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them* (Psalm 106:23). Amos *stood before him in the breach* as Moses did — *by whom shall Jacob arise? for he is small* (Amos 7:2) — and turned away the wrath. The chosen one in the gap is the reason the people are not destroyed.'),
    ('canon','amos',7,2,'canon','ezekiel',22,30,'free',
      E'*And I sought for a man among them, that should make up the hedge, and stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30). The man Yahuah searches for — one *that should... stand in the gap... that I should not destroy it* — is the very man Amos is here: pleading *by whom shall Jacob arise?* (Amos 7:2) and winning *It shall not be* (7:3). Where Ezekiel found none, Amos stands in the gap.'),
    ('canon','amos',7,2,'canon','genesis',18,23,'free',
      E'*And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23). Abraham pleading for Sodom is the same intercession Amos makes for Jacob — *O Yahuah (Lord) GOD, forgive, I beseech thee: by whom shall Jacob arise?* (Amos 7:2). The righteous draw near to plead for the many, that judgment be stayed.'),
    ('canon','amos',7,2,'canon','genesis',18,32,'free',
      E'*And he said, Oh let not Yahuah (Lord) be angry, and I will speak yet but this once: Peradventure ten shall be found there. And he said, I will not destroy it for ten''s sake* (Genesis 18:32). Abraham presses Yahuah down to ten and wins the answer *I will not destroy it* — and Amos, pleading *by whom shall Jacob arise? for he is small* (Amos 7:2), wins *It shall not be, saith Yahuah (LORD)* (7:3). The bold intercessor obtains mercy for the small and the few.'),
    ('canon','amos',7,2,'canon','james',5,16,'free',
      E'*Confess your faults one to another, and pray one for another, that ye may be healed. The effectual fervent prayer of a righteous man availeth much* (James 5:16). Amos is the proof of it: *by whom shall Jacob arise? for he is small* (Amos 7:2), and the prayer prevails — *Yahuah (LORD) repented for this: It shall not be* (7:3). The fervent prayer of the righteous man avails to turn back the very judgment that was rising.'),
    ('canon','amos',7,2,'canon','hebrews',7,25,'free',
      E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). Amos in the breach (Amos 7:2) is a shadow of the great Intercessor: the Formed Son who *ever liveth to make intercession*. The prophet pleads and judgment is stayed once; the Son pleads and saves *to the uttermost* for ever.'),
    ('canon','amos',7,2,'apocrypha','2-maccabees',15,14,'extras',
      E'*Then Onias answered, saying, This is a lover of the brothers, who prayeth much for the people, and for the holy city, to wit, Jeremias the prophet of Yahuah (God)* (2 Maccabees 15:14). The restored witness shows the prophet still in the breach — *Jeremias the prophet... who prayeth much for the people*. As Amos pleads *by whom shall Jacob arise?* (Amos 7:2), so the prophet''s intercession for the people endures.'),

    -- THREAD 2 (★★): I will set a plumbline in the midst of my people (the righteous standard)
    ('canon','amos',7,8,'canon','isaiah',28,17,'free',
      E'*Judgment also will I lay to the line, and righteousness to the plummet: and the hail shall sweep away the refuge of lies, and the waters shall overflow the hiding place* (Isaiah 28:17). The plumbline of Amos — *Behold, I will set a plumbline in the midst of my people Yashar''el (Israel)* (Amos 7:8) — is named outright by Isaiah: the line is *judgment*, the plummet is *righteousness*. The standard against which the crooked wall is measured is the righteousness of Yahuah.'),
    ('canon','amos',7,8,'canon','2-kings',21,13,'free',
      E'*And I will stretch over Jerusalem the line of Samaria, and the plummet of the house of Ahab: and I will wipe Jerusalem as a man wipeth a dish* (2 Kings 21:13). The measuring *plummet* set against the people in Amos 7:8 is the same instrument of judgment stretched over Jerusalem — *the line of Samaria, and the plummet of the house of Ahab*. The plumbline measures the wall and finds it must come down.'),
    ('canon','amos',7,7,'canon','lamentations',2,8,'free',
      E'*Yahuah (LORD) hath purposed to destroy the wall of the daughter of Zion: he hath stretched out a line, he hath not withdrawn his hand from destroying* (Lamentations 2:8). The *wall made by a plumbline, with a plumbline in his hand* (Amos 7:7) is the wall Yahuah measures for destruction — *he hath stretched out a line, he hath not withdrawn his hand*. The line laid against the wall is the verdict made visible.'),
    ('canon','amos',7,8,'canon','revelation',11,1,'free',
      E'*And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). The plumbline set *in the midst of my people* (Amos 7:8) runs forward to the measuring reed of the last days — *Rise, and measure the temple... and them that worship therein*. The same act: the standard laid against the people of Yahuah to separate the true from the false.'),

    -- THREAD 3 (★★): I was no prophet, but Yahuah took me (the unlikely called over institutional credential)
    ('canon','amos',7,14,'canon','jeremiah',1,5,'free',
      E'*Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5). Amos''s answer — *I was no prophet, neither was I a prophet''s son* (Amos 7:14) — meets the same truth Jeremiah heard: the prophet is not self-made nor priest-made but Yahuah-ordained from the womb. The call is wholly Yahuah''s.'),
    ('canon','amos',7,14,'canon','jeremiah',1,6,'free',
      E'*Then said I, Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child* (Jeremiah 1:6). Jeremiah protests his unfitness as Amos protests his lowly trade — *I was an herdman, and a gatherer of sycomore fruit* (Amos 7:14). The called one names his weakness; Yahuah''s commission overrides it.'),
    ('canon','amos',7,15,'canon','jeremiah',1,7,'free',
      E'*But Yahuah (LORD) said unto me, Say not, I am a child: for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7). This is Amos''s commission exactly — *And Yahuah (LORD) took me as I followed the flock, and Yahuah (LORD) said unto me, Go, prophesy unto my people Yashar''el (Israel)* (Amos 7:15). Yahuah sends; the prophet goes and speaks what he is commanded, credential or none.'),
    ('canon','amos',7,14,'canon','1-corinthians',1,27,'free',
      E'*But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The herdman over the priest of Beth-el is the pattern: *I was no prophet... but I was an herdman* (Amos 7:14). Yahuah chooses the weak and lowly to confound the mighty and the credentialed.'),
    ('canon','amos',7,14,'canon','1-corinthians',1,29,'free',
      E'*That no flesh should glory in his presence* (1 Corinthians 1:29). Amos has nothing to glory in — no prophet, no prophet''s son, only a gatherer of sycomore fruit (Amos 7:14) whom *Yahuah (LORD) took* (7:15). The call rests on Yahuah alone, *that no flesh should glory in his presence*.'),
    ('canon','amos',7,15,'canon','acts',4,13,'free',
      E'*Now when they saw the boldness of Peter and John, and perceived that they were unlearned and ignorant men, they marvelled; and they took knowledge of them, that they had been with Yahusha (Jesus)* (Acts 4:13). The boldness of the *unlearned and ignorant* is the herdman''s boldness before the priest: *Yahuah (LORD) took me as I followed the flock... Go, prophesy unto my people Yashar''el (Israel)* (Amos 7:15). The power is not schooling but the One who sent them.'),
    ('canon','amos',7,15,'canon','matthew',4,19,'free',
      E'*And he saith unto them, Follow me, and I will make you fishers of men* (Matthew 4:19). The herdman taken from the flock (Amos 7:15) is the fisherman taken from the nets — *Yahuah (LORD) took me as I followed the flock*. The Formed Son still calls the unlikely from their common work and sends them to his people.'),

    -- THREAD 4 (★★): Prophesy not — Amaziah the priest silences the prophet
    ('canon','amos',7,13,'canon','amos',2,12,'free',
      E'*But ye gave the Nazarites wine to drink; and commanded the prophets, saying, Prophesy not* (Amos 2:12). Amaziah''s *prophesy not again any more at Beth-el* (Amos 7:13) is the very sin Amos named earlier in his lawsuit — *commanded the prophets, saying, Prophesy not*. The gagging of the prophet is the indictment, now enacted by the king''s priest.'),
    ('canon','amos',7,13,'canon','matthew',23,34,'free',
      E'*Wherefore, behold, I send unto you prophets, and wise men, and scribes: and some of them ye shall kill and crucify; and some of them shall ye scourge in your synagogues, and persecute them from city to city* (Matthew 23:34). Amaziah silencing Amos — *prophesy not again any more at Beth-el* (Amos 7:13) — is one link in the long chain of the persecuted prophets *sent* and rejected. The one who would gag the prophet stands in the line of those who kill the sent.'),
    ('canon','amos',7,13,'canon','matthew',23,37,'free',
      E'*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37). The priest who tells the prophet *prophesy not... flee thee away* (Amos 7:12-13) is of the house that *killest the prophets, and stonest them which are sent*. The lament is covenant-grief over a people who silence the very ones sent to save them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach',
       E'By whom shall Jacob arise — the prophet stands in the breach',
       E'Twice Amos sees judgment rising — *he formed grasshoppers in the beginning of the shooting up of the latter growth* (Amos 7:1), then *Adonai Yahuah (the Lord GOD) called to contend by fire, and it devoured the great deep* (7:4) — and twice he stands between the wrath and the people: *O Yahuah (Lord) GOD, forgive, I beseech thee: by whom shall Jacob arise? for he is small* (7:2,5). And twice the answer comes: *Yahuah (LORD) repented for this: It shall not be, saith Yahuah (LORD)* (7:3,6). This is the Moses-pattern. *And Moses besought Yahuah Elohav (the LORD his God)... Turn from thy fierce wrath, and repent of this evil against thy people... And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:11-14); *had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them* (Psalm 106:23). It is the man Yahuah searches for and so rarely finds: *I sought for a man among them, that should make up the hedge, and stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30) — and here, in the herdman of Tekoa, Yahuah finds him. Abraham drew near for Sodom — *Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) — and pressed Yahuah down to ten: *I will not destroy it for ten''s sake* (18:32). The fervent prayer still avails: *The effectual fervent prayer of a righteous man availeth much* (James 5:16). The restored witness shows the prophet interceding still — *a lover of the brothers, who prayeth much for the people, and for the holy city, to wit, Jeremias the prophet of Yahuah (God)* (2 Maccabees 15:14). And the whole pattern points to the One who fulfils it for ever: the Formed Son who *is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The prophet pleads and judgment is stayed once; the Son pleads and saves to the uttermost.',
       sv.verse_id, ev.verse_id, 'extras', 45320
  FROM _s330_amo07_lookup sv, _s330_amo07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-7-i-will-set-a-plumbline-in-the-midst-of-my-people',
       E'I will set a plumbline in the midst of my people — the righteous standard',
       E'The third vision is not a swarm or a fire but a measuring tool: *behold, Yahuah (Lord) stood upon a wall made by a plumbline, with a plumbline in his hand. And Yahuah (LORD) said unto me, Amos, what seest thou? And I said, A plumbline. Then said Yahuah (Lord), Behold, I will set a plumbline in the midst of my people Yashar''el (Israel): I will not again pass by them any more* (Amos 7:7-8). The plumbline is the standard of righteousness laid against a crooked wall — and Isaiah names it outright: *Judgment also will I lay to the line, and righteousness to the plummet: and the hail shall sweep away the refuge of lies* (Isaiah 28:17). The line is judgment, the plummet is righteousness; the wall is measured and found out of plumb. The same measuring instrument is stretched over Jerusalem in judgment: *I will stretch over Jerusalem the line of Samaria, and the plummet of the house of Ahab: and I will wipe Jerusalem as a man wipeth a dish* (2 Kings 21:13); *he hath stretched out a line, he hath not withdrawn his hand from destroying* (Lamentations 2:8). And it runs forward to the measuring reed of the last days: *And there was given me a reed like unto a rod... Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). The standard is the Torah-righteousness of Yahuah; against it *the high places of Isaac shall be desolate, and the sanctuaries of Yashar''el (Israel) shall be laid waste* (Amos 7:9). The plumbline does not bend to the wall; the wall is judged by the plumbline.',
       sv.verse_id, ev.verse_id, 'free', 45323
  FROM _s330_amo07_lookup sv, _s330_amo07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-7-i-was-no-prophet-but-yahuah-took-me',
       E'I was no prophet, but Yahuah took me — the call over the credential',
       E'Amaziah the priest tells the prophet to flee and earn his bread elsewhere — *O thou seer, go, flee thee away into the land of Yahudah (Judah), and there eat bread, and prophesy there* (Amos 7:12). Amos answers not with credentials but with a call: *I was no prophet, neither was I a prophet''s son; but I was an herdman, and a gatherer of sycomore fruit: And Yahuah (LORD) took me as I followed the flock, and Yahuah (LORD) said unto me, Go, prophesy unto my people Yashar''el (Israel)* (7:14-15). The authority is wholly Yahuah''s — exactly Jeremiah''s commission over his own protest: *Before I formed thee in the belly I knew thee... and I ordained thee a prophet unto the nations* (Jeremiah 1:5); *Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child* (1:6); *But Yahuah (LORD) said unto me, Say not, I am a child: for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (1:7). Yahuah delights to choose the unlikely and unschooled: *Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27), *That no flesh should glory in his presence* (1:29). So the council marvelled at the apostles, *unlearned and ignorant men... that they had been with Yahusha (Jesus)* (Acts 4:13). The herdman taken from the flock is the fisherman taken from the nets: *Follow me, and I will make you fishers of men* (Matthew 4:19). The priest has the chapel and the court (Amos 7:13); the herdman has the word and the sending — and that is enough.',
       sv.verse_id, ev.verse_id, 'free', 45326
  FROM _s330_amo07_lookup sv, _s330_amo07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=7 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-7-prophesy-not-amaziah-the-priest-silences-the-prophet',
       E'Prophesy not — Amaziah the priest silences the sent prophet',
       E'The king''s priest moves against the prophet: *Then Amaziah the priest of Beth-el sent to Jeroboam king of Yashar''el (Israel), saying, Amos hath conspired against thee... the land is not able to bear all his words* (Amos 7:10), and then to Amos himself: *prophesy not again any more at Beth-el: for it is the king''s chapel, and it is the king''s court* (7:13). This gagging of the prophet is the very sin Amos had already named in his covenant-lawsuit: *ye gave the Nazarites wine to drink; and commanded the prophets, saying, Prophesy not* (Amos 2:12). It is one link in the long chain of the silenced and slain who are *sent*: *behold, I send unto you prophets, and wise men, and scribes: and some of them ye shall kill and crucify; and some of them shall ye scourge in your synagogues* (Matthew 23:34); *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together... and ye would not!* (Matthew 23:37). Amos answers the gag with Yahuah''s sentence on the priest''s own house (7:16-17). Read it as covenant-lawsuit on a corrupt office, never as ethnic judgment: the prophet is the victim, the silencing is the sin, and the grief at the end is Yahuah''s own grief over a people who will not hear the ones He sends to save them.',
       sv.verse_id, ev.verse_id, 'free', 45329
  FROM _s330_amo07_lookup sv, _s330_amo07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *And Moses besought Yahuah Elohav (the LORD his God)... why doth thy wrath wax hot against thy people* (Exodus 32:11) — Amos''s plea *by whom shall Jacob arise?* (Amos 7:2) is the Moses-pattern of intercession against the wrath.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Turn from thy fierce wrath, and repent of this evil against thy people* (Exodus 32:12) — what Moses asks is what Amos wins: *Yahuah (LORD) repented for this: It shall not be* (Amos 7:3).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14) — the same answer Amos hears twice: *It shall not be, saith Yahuah (LORD)* (Amos 7:3,6).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *had not Moses his chosen stood before him in the breach, to turn away his wrath* (Psalm 106:23) — Amos stands in the breach as Moses did (Amos 7:2), and the wrath is turned away.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I sought for a man... that should... stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30) — the man Yahuah seeks is found in Amos (Amos 7:2-3).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) — Abraham pleading for Sodom is Amos''s intercession for Jacob (Amos 7:2).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Peradventure ten shall be found there. And he said, I will not destroy it for ten''s sake* (Genesis 18:32) — the bold intercessor wins mercy for the few, as Amos wins *It shall not be* (Amos 7:3).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *The effectual fervent prayer of a righteous man availeth much* (James 5:16) — Amos is the proof: the prayer prevails and the judgment is stayed (Amos 7:2-3).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *he ever liveth to make intercession for them* (Hebrews 7:25) — the prophet in the breach is a shadow of the Formed-Son Intercessor who saves to the uttermost (Amos 7:2).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *a lover of the brothers, who prayeth much for the people... to wit, Jeremias the prophet of Yahuah (God)* (2 Maccabees 15:14) — the restored witness shows the prophet interceding still, as Amos pleads for Jacob (Amos 7:2).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-by-whom-shall-jacob-arise-the-prophet-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Judgment also will I lay to the line, and righteousness to the plummet* (Isaiah 28:17) — names the plumbline of Amos 7:8: the line is judgment, the plummet righteousness.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-will-set-a-plumbline-in-the-midst-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will stretch over Jerusalem the line of Samaria, and the plummet of the house of Ahab* (2 Kings 21:13) — the same measuring plummet of Amos 7:8, stretched over the city for judgment.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-will-set-a-plumbline-in-the-midst-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he hath stretched out a line, he hath not withdrawn his hand from destroying* (Lamentations 2:8) — the *wall made by a plumbline* (Amos 7:7) measured for destruction; the line is the verdict made visible.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-will-set-a-plumbline-in-the-midst-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1) — the plumbline *in the midst of my people* (Amos 7:8) runs forward to the last-days measuring reed.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-will-set-a-plumbline-in-the-midst-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Before I formed thee in the belly I knew thee... I ordained thee a prophet unto the nations* (Jeremiah 1:5) — like Amos *no prophet... but Yahuah took me* (Amos 7:14-15), the prophet is Yahuah-ordained, not priest-made.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child* (Jeremiah 1:6) — Jeremiah protests his unfitness as Amos names his lowly trade, *an herdman, and a gatherer of sycomore fruit* (Amos 7:14).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7) — Amos''s commission exactly: *Go, prophesy unto my people Yashar''el (Israel)* (Amos 7:15).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Elohim (God) hath chosen the foolish things of the world to confound the wise... the weak things... to confound the mighty* (1 Corinthians 1:27) — the herdman over the priest of Beth-el (Amos 7:14).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *That no flesh should glory in his presence* (1 Corinthians 1:29) — Amos has nothing to glory in, no prophet nor prophet''s son, only the One who *took* him (Amos 7:14-15).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *unlearned and ignorant men... they had been with Yahusha (Jesus)* (Acts 4:13) — the herdman''s boldness before the priest: the power is the Sender, not the schooling (Amos 7:15).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Follow me, and I will make you fishers of men* (Matthew 4:19) — the herdman taken from the flock is the fisherman taken from the nets (Amos 7:15).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-i-was-no-prophet-but-yahuah-took-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *commanded the prophets, saying, Prophesy not* (Amos 2:12) — Amaziah''s *prophesy not... at Beth-el* (Amos 7:13) is the very sin Amos named in his lawsuit, now enacted by the king''s priest.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-prophesy-not-amaziah-the-priest-silences-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I send unto you prophets... and some of them ye shall kill and crucify; and some of them shall ye scourge* (Matthew 23:34) — silencing Amos (Amos 7:13) is one link in the chain of the persecuted sent ones.'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-prophesy-not-amaziah-the-priest-silences-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *thou that killest the prophets, and stonest them which are sent unto thee... and ye would not!* (Matthew 23:37) — covenant-grief over a people who silence the ones sent to save them, as Amaziah silences Amos (Amos 7:12-13).'
  FROM cross_reference_threads t
  JOIN _s330_amo07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s330_amo07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-7-prophesy-not-amaziah-the-priest-silences-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_8.sql (Amos 8) -----
-- Chapter: Amos 8 — THE BASKET OF SUMMER FRUIT (THE END), THE FALSE BALANCES, THE SUN GONE DOWN AT
-- NOON, and THE FAMINE OF HEARING THE WORDS OF YAHUAH. Adonai Yahuah shews Amos *a basket of summer
-- fruit* and declares *The end is come upon my people of Yashar''el (Israel)* (8:1-2) — the ripe-fruit
-- (qayits) / end (qets) wordplay: ripeness = ripe for judgment. The greedy *swallow up the needy* and
-- chafe at the new moon and the sabbath as interruptions to profit, falsifying *the balances by deceit*
-- (8:4-6) — note: the appointed times are ASSUMED BINDING here, resented by the wicked, NOT abolished;
-- the Torah''s just weights stand against them. Yahuah will *cause the sun to go down at noon* and make
-- it *as the mourning of an only son* (8:9-10) — a type answered in the noonday darkness at the
-- impaling and the only-son mourning of Zechariah 12:10. And the severest judgment: *a famine... of
-- hearing the words of Yahuah* (8:11-12), the withdrawal of the prophetic word — the dark contrast to
-- *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah*
-- (Deuteronomy 8:3) and to the Bread of Life who satisfies the hungry (John 6:35).
-- Tag: amo08   Temp view: _s330_amo08_lookup
-- Sort band: base 45340, step 3 -> threads at 45340, 45343, 45346, 45349 (4 threads)
-- Source of EVERY row: 'canon','amos',8,v
--
-- Amos 8 coverage:
--   ★ v.1-3 (a basket of summer fruit... The end is come upon my people of Yashar''el (Israel))
--        NT:     ★ Matthew 13:39 (the harvest is the end of the world) — THREAD 1
--        Extras: none warranted clean (2 Esdras harvest material is apocalyptic-noisy; held)
--        Tanakh: ★ Jeremiah 1:11-12 (a rod of an almond tree... I will hasten my word to perform it),
--                ★ Ezekiel 7:2,6 (An end, the end is come upon the four corners of the land) — THREAD 1
--   ★★ v.4-6 (swallow up the needy... When will the new moon be gone... and the sabbath... making the
--          ephah small, and the shekel great, and falsifying the balances by deceit)
--        NT:     none warranted distinct here (oppressed-poor weave James held to other Amos chapters;
--                the appointed-times and just-weights weight is Tanakh+Torah — kept in this thread)
--        Extras: ★ Ecclesiasticus (Sirach) 42:4 (exactness of balance and weights) — THREAD 2
--        Tanakh: ★★ Leviticus 19:35-36 (Just balances, just weights, a just ephah, and a just hin),
--                ★ Deuteronomy 25:13-16 (Thou shalt not have... divers weights... an abomination),
--                ★ Proverbs 11:1 (A false balance is abomination to Yahuah), ★ Micah 6:10-11
--                (the scant measure... wicked balances... deceitful weights), Exodus 20:8 (the sabbath
--                they resent) — THREAD 2
--   ★★ v.9-10 (I will cause the sun to go down at noon... I will make it as the mourning of an only son)
--        NT:     ★★ Matthew 27:45 (from the sixth hour there was darkness over all the land) — THREAD 3
--        Extras: none warranted clean (held)
--        Tanakh: ★★ Zechariah 12:10 (they shall mourn for him, as one mourneth for his only son),
--                ★ Jeremiah 6:26 (make thee mourning, as for an only son, most bitter lamentation) — THREAD 3
--   ★★★ v.11-12 (a famine in the land... but of hearing the words of Yahuah... they shall run to and fro
--          to seek the word of Yahuah, and shall not find it)
--        NT:     ★★★ Matthew 4:4 (Man shall not live by bread alone, but by every word... of Elohim),
--                ★★ John 6:35 (I am the bread of life: he that cometh to me shall never hunger) — THREAD 4
--        Extras: ★ 2 Esdras 5:9-10 (then shall wit hide itself... shall be sought of many, and yet not
--                be found) — THREAD 4
--        Tanakh: ★★★ Deuteronomy 8:3 (man doth not live by bread only, but by every word... of Yahuah),
--                ★ Proverbs 1:28 (they shall seek me early, but they shall not find me), ★ 1 Samuel 3:1
--                (the word of Yahuah was precious in those days; there was no open vision) — THREAD 4
--   v.7 (Yahuah hath sworn by the excellency of Jacob, Surely I will never forget any of their works)
--        — woven in THREAD 2 prose (the oath against the cheaters); no separate add forced.
--   v.8 (Shall not the land tremble... rise up wholly as a flood) — the lawsuit-judgment, woven in
--        THREAD 1/THREAD 3 prose; no separate add forced.
--   v.13-14 (the fair virgins and young men faint for thirst... they that swear by the sin of Samaria)
--        — the famine''s effect and the false-worship that falls; woven in THREAD 4 prose (the thirst)
--        and named as the apostasy under judgment; no separate add forced.
--
-- Threads (slug — target libraries):
--   1. amos-8-the-basket-of-summer-fruit-the-end-is-come — NT (Matthew 13) + Tanakh (Jeremiah 1, Ezekiel 7) [free]
--      (★ the ripe fruit = ripe for judgment; the end is come; the harvest is the end of the world)
--   2. amos-8-when-will-the-new-moon-be-gone-the-false-balances — Tanakh (Leviticus 19, Deuteronomy 25, Proverbs 11, Micah 6) + Extras (Sirach 42) [extras]
--      (★★ the greedy resent the new moon and the sabbath — appointed times ASSUMED BINDING, NOT abolished — and cheat with false weights the Torah condemns)
--   3. amos-8-the-sun-to-go-down-at-noon-the-mourning-of-an-only-son — NT (Matthew 27) + Tanakh (Zechariah 12, Jeremiah 6) [free]
--      (★★ the noonday darkness / only-son mourning, a type woven toward the impaling — framed, not overclaimed)
--   4. amos-8-a-famine-of-hearing-the-words-of-yahuah — NT (Matthew 4, John 6) + Tanakh (Deuteronomy 8, Proverbs 1, 1 Samuel 3) + Extras (2 Esdras 5) [extras]
--      (★★★ the withdrawn word as the severest judgment; man lives by every word; the Bread of Life who never lets the comer hunger)
--
-- Framing notes:
--   ★ THE BASKET OF SUMMER FRUIT (THREAD 1): *and behold a basket of summer fruit... The end is come
--      upon my people of Yashar''el (Israel); I will not again pass by them any more* (8:1-2). The ripe
--      fruit is ripe for judgment — the same vision-and-word pattern Jeremiah sees: *I see a rod of an
--      almond tree. Then said Yahuah... I will hasten my word to perform it* (Jeremiah 1:11-12). Ezekiel
--      pronounces the same verdict: *An end, the end is come upon the four corners of the land* (Ezekiel
--      7:2). And Yahusha names what the harvest is: *the harvest is the end of the world* (Matthew 13:39).
--   ★★ THE FALSE BALANCES (THREAD 2): *When will the new moon be gone, that we may sell corn? and the
--      sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying
--      the balances by deceit?* (8:5). The wicked CHAFE at the new moon and the sabbath as interruptions
--      to profit — which proves the appointed times are still Yahuah''s binding calendar, RESENTED by the
--      greedy, NOT abolished (Exodus 20:8). And their cheating is exactly what the Torah forbids: *Just
--      balances, just weights, a just ephah, and a just hin, shall ye have* (Leviticus 19:36); *Thou shalt
--      not have in thy bag divers weights... For all that do such things... are an abomination unto Yahuah
--      Elohayka* (Deuteronomy 25:13,16); *A false balance is abomination to Yahuah* (Proverbs 11:1); the
--      *scant measure that is abominable... the bag of deceitful weights* (Micah 6:10-11). Sirach keeps
--      the same charge: *exactness of balance and weights* (Sirach 42:4).
--   ★★ THE SUN GONE DOWN AT NOON (THREAD 3): *I will cause the sun to go down at noon, and I will darken
--      the earth in the clear day... I will make it as the mourning of an only son, and the end thereof as
--      a bitter day* (8:9-10). The noonday darkness and the only-son mourning are a TYPE woven (not
--      overclaimed) toward the impaling: *from the sixth hour there was darkness over all the land unto the
--      ninth hour* (Matthew 27:45), and *they shall mourn for him, as one mourneth for his only son*
--      (Zechariah 12:10); Jeremiah uses the same figure of the bitter end (Jeremiah 6:26).
--   ★★★ THE FAMINE OF THE WORD (THREAD 4): *I will send a famine in the land, not a famine of bread, nor a
--      thirst for water, but of hearing the words of Yahuah... they shall run to and fro to seek the word
--      of Yahuah, and shall not find it* (8:11-12). The withdrawal of the prophetic word is the severest
--      judgment — the dark inverse of the manna lesson: *man doth not live by bread only, but by every
--      word that proceedeth out of the mouth of Yahuah doth man live* (Deuteronomy 8:3), which Yahusha
--      quotes in the wilderness (Matthew 4:4). When the word is withdrawn the seekers seek too late:
--      *they shall seek me early, but they shall not find me* (Proverbs 1:28); *the word of Yahuah was
--      precious in those days; there was no open vision* (1 Samuel 3:1); and the restored witness sees the
--      same silence — *then shall wit hide itself, and understanding withdraw itself into his secret
--      chamber, And shall be sought of many, and yet not be found* (2 Esdras 5:9-10). The cure is the
--      living Word who satisfies: *I am the bread of life: he that cometh to me shall never hunger; and he
--      that believeth on me shall never thirst* (John 6:35).
--   VERSES WITH NO SEPARATE ADD: v.7 (the oath against the cheaters, woven THREAD 2), v.8 (the trembling
--      land, woven THREAD 1/3), v.13-14 (the fainting for thirst + the false worship that falls, woven
--      THREAD 4). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The basket of summer fruit — the end is come
    ('canon','amos',8,2,'canon','jeremiah',1,11,'free',
      E'*Moreover the word of Yahuah (LORD) came unto me, saying, Jeremiah, what seest thou? And I said, I see a rod of an almond tree* (Jeremiah 1:11). Amos is shown *a basket of summer fruit* and asked *Amos, what seest thou?* (Amos 8:2) — the same vision-and-question by which Yahuah sets a word in motion. The ripe fruit and the almond rod are both signs that the word is about to be performed.'),
    ('canon','amos',8,2,'canon','jeremiah',1,12,'free',
      E'*Then said Yahuah (LORD) unto me, Thou hast well seen: for I will hasten my word to perform it* (Jeremiah 1:12). The summer fruit means *The end is come upon my people of Yashar''el (Israel)* (Amos 8:2) — the ripeness is the readiness of the word for performing, just as the almond-rod (the ''waker'') means *I will hasten my word to perform it*. The vision certifies the judgment is at the door.'),
    ('canon','amos',8,2,'canon','ezekiel',7,2,'free',
      E'*Also, thou son of Adam, thus saith Adonai Yahuah (the Lord GOD) unto the land of Yashar''el (Israel); An end, the end is come upon the four corners of the land* (Ezekiel 7:2). Amos''s verdict — *The end is come upon my people of Yashar''el (Israel); I will not again pass by them any more* (Amos 8:2) — is Ezekiel''s very word: *An end, the end is come*. Two prophets pronounce the one ripe end on the same people.'),
    ('canon','amos',8,2,'canon','ezekiel',7,6,'free',
      E'*An end is come, the end is come: it watcheth for thee; behold, it is come* (Ezekiel 7:6). The ripe summer fruit declaring *The end is come* (Amos 8:2) is the end Ezekiel sees awake and watching — *the end is come: it watcheth for thee*. The harvest of judgment is fully ripe and waiting.'),
    ('canon','amos',8,2,'canon','matthew',13,39,'free',
      E'*The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39). The basket of ripe fruit that means *The end is come* (Amos 8:2) is the harvest Yahusha names: *the harvest is the end of the world*. When the fruit is ripe the reaping comes; the end Amos saw in the summer basket is the end of the age.'),

    -- THREAD 2 (★★): When will the new moon be gone — the false balances (appointed times assumed binding, NOT abolished)
    ('canon','amos',8,5,'canon','leviticus',19,35,'free',
      E'*Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure* (Leviticus 19:35). The greedy of Amos 8:5 do exactly this unrighteousness — *making the ephah small, and the shekel great, and falsifying the balances by deceit*. The Torah''s standard stands directly against them: no unrighteousness *in weight, or in measure*.'),
    ('canon','amos',8,5,'canon','leviticus',19,36,'free',
      E'*Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:36). Against the *ephah small... shekel great... balances by deceit* (Amos 8:5) the Torah commands the very opposite — *Just balances, just weights, a just ephah*. The cheating merchants break the commandment of the One who redeemed them.'),
    ('canon','amos',8,5,'canon','deuteronomy',25,13,'free',
      E'*Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13). The merchant of Amos 8:5 carries exactly the divers weights — *making the ephah small, and the shekel great* — buying with the great and selling with the small. The Torah forbids the very bag of deceit they use.'),
    ('canon','amos',8,5,'canon','deuteronomy',25,16,'free',
      E'*For all that do such things, and all that do unrighteously, are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:16). The false balances of Amos 8:5 are named an abomination — *all that do such things... are an abomination unto Yahuah Elohayka*. The same God who swears *Surely I will never forget any of their works* (Amos 8:7) had written their cheating an abomination long before.'),
    ('canon','amos',8,5,'canon','proverbs',11,1,'free',
      E'*A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). The men *falsifying the balances by deceit* (Amos 8:5) hold the very thing Yahuah abhors — *A false balance is abomination to Yahuah*. The wisdom-word and the prophet agree: the rigged scale is hateful to Him.'),
    ('canon','amos',8,5,'canon','micah',6,10,'free',
      E'*Are there yet the treasures of wickedness in the house of the wicked, and the scant measure that is abominable?* (Micah 6:10). Amos''s *ephah small* (Amos 8:5) is Micah''s *scant measure that is abominable* — the same shrunken measure that robs the poor, the wealth of the wicked house built on cheating the buyer.'),
    ('canon','amos',8,5,'canon','micah',6,11,'free',
      E'*Shall I count them pure with the wicked balances, and with the bag of deceitful weights?* (Micah 6:11). The *balances by deceit* and the divers weights of Amos 8:5 are Micah''s *wicked balances... bag of deceitful weights* — and Yahuah will not count such men pure. The two prophets bring the one covenant-lawsuit against the rigged scale.'),
    ('canon','amos',8,5,'canon','exodus',20,8,'free',
      E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The greedy ask *when will... the sabbath* be gone *that we may set forth wheat* (Amos 8:5) — they chafe at the very day commanded *Remember the sabbath day, to keep it holy*. Their resentment proves the sabbath stands as Yahuah''s binding appointed time; it is not abolished, it is hated by those who would rather trade.'),
    ('canon','amos',8,5,'apocrypha','ecclesiasticus',42,4,'extras',
      E'*Of reckoning with your partners and travellers; or of the gift of the heritage of friends; Of exactness of balance and weights; or of getting much or little* (Sirach 42:3-4). The wisdom of the second-Temple keeps the same charge Amos brings against *the balances by deceit* (Amos 8:5): a man is to be unashamed *of exactness of balance and weights*. The just scale is the abiding mark of the righteous dealer.'),

    -- THREAD 3 (★★): The sun to go down at noon — the mourning of an only son (type woven toward the impaling)
    ('canon','amos',8,9,'canon','matthew',27,45,'free',
      E'*Now from the sixth hour there was darkness over all the land unto the ninth hour* (Matthew 27:45). Amos foretold *I will cause the sun to go down at noon, and I will darken the earth in the clear day* (Amos 8:9) — and at the impaling the darkness fell *from the sixth hour... unto the ninth hour*, the sun darkened at the very noon. The prophet''s sign of the bitter day is answered when the light fails over the land at midday.'),
    ('canon','amos',8,10,'canon','zechariah',12,10,'free',
      E'*and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn* (Zechariah 12:10). Amos says Yahuah will *make it as the mourning of an only son, and the end thereof as a bitter day* (Amos 8:10) — and Zechariah names the only-son mourning poured out upon the pierced One: *they shall mourn for him, as one mourneth for his only son*. The bitter only-son grief Amos foretold is the grief over the One they pierced.'),
    ('canon','amos',8,10,'canon','jeremiah',6,26,'free',
      E'*O daughter of my people, gird thee with sackcloth, and wallow thyself in ashes: make thee mourning, as for an only son, most bitter lamentation: for the spoiler shall suddenly come upon us* (Jeremiah 6:26). Amos''s *sackcloth upon all loins... the mourning of an only son... a bitter day* (Amos 8:10) is Jeremiah''s *sackcloth... mourning, as for an only son, most bitter lamentation*. The same sign of utter grief — sackcloth and the only-son cry — marks the day of the spoiler in both prophets.'),

    -- THREAD 4 (★★★): A famine of hearing the words of Yahuah
    ('canon','amos',8,11,'canon','deuteronomy',8,3,'free',
      E'*And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). Amos threatens *a famine in the land, not a famine of bread... but of hearing the words of Yahuah* (Amos 8:11) — the exact inverse of the manna lesson: if man lives *by every word that proceedeth out of the mouth of Yahuah*, then to withdraw that word is the deadliest famine of all.'),
    ('canon','amos',8,11,'canon','matthew',4,4,'free',
      E'*But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4). Yahusha in the wilderness quotes the very truth that makes the famine of Amos 8:11 so terrible — *Man shall not live by bread alone, but by every word... of Elohim*. The word of Yahuah is the bread the soul cannot live without; its famine is the worst hunger.'),
    ('canon','amos',8,11,'canon','john',6,35,'free',
      E'*And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). Against the famine *of hearing the words of Yahuah* (Amos 8:11) and the *thirst* of the fainting (Amos 8:13), the living Word answers: *he that cometh to me shall never hunger... never thirst*. The word withdrawn in Amos is the Bread of Life freely given to all who come.'),
    ('canon','amos',8,12,'canon','proverbs',1,28,'free',
      E'*Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me* (Proverbs 1:28). The famine sends men *to and fro to seek the word of Yahuah, and shall not find it* (Amos 8:12) — wisdom warned of this very silence: *they shall seek me early, but they shall not find me*. Those who would not hear when the word was near cannot find it once it is withdrawn.'),
    ('canon','amos',8,11,'canon','1-samuel',3,1,'free',
      E'*And the child Samuel ministered unto Yahuah (LORD) before Eli. And the word of Yahuah (LORD) was precious in those days; there was no open vision* (1 Samuel 3:1). The famine of *hearing the words of Yahuah* (Amos 8:11) is the dearth Israel knew before Samuel — *the word of Yahuah was precious... there was no open vision*. When the prophetic word grows scarce, the land starves for what no bread can supply.'),
    ('canon','amos',8,12,'apocrypha','2-esdras',5,9,'extras',
      E'*And salt waters shall be found in the sweet, and all friends shall destroy one another; then shall wit hide itself, and understanding withdraw itself into his secret chamber* (2 Esdras 5:9). The famine of the word in Amos 8:12 — men running *to and fro to seek the word of Yahuah, and shall not find it* — is the withdrawal the restored witness foresees: *understanding withdraw itself into his secret chamber*. Wisdom hides when the day of judgment ripens.'),
    ('canon','amos',8,12,'apocrypha','2-esdras',5,10,'extras',
      E'*And shall be sought of many, and yet not be found: then shall unrighteousness and incontinency be multiplied upon earth* (2 Esdras 5:10). The seekers of Amos 8:12 *shall not find it* — and 2 Esdras says of the hidden understanding, *shall be sought of many, and yet not be found*. The same dark sign: the word and the wisdom sought too late by those who spurned it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-8-the-basket-of-summer-fruit-the-end-is-come',
       E'The basket of summer fruit — the end is come upon my people',
       E'Adonai Yahuah shews Amos a single sign and turns it into a verdict: *behold a basket of summer fruit. And he said, Amos, what seest thou? And I said, A basket of summer fruit. Then said Yahuah (LORD) unto me, The end is come upon my people of Yashar''el (Israel); I will not again pass by them any more* (Amos 8:1-2). The ripe summer fruit means ripeness for judgment — *the songs of the temple shall be howlings in that day* (8:3). It is the same vision-and-word by which Yahuah sets judgment in motion through Jeremiah: *I see a rod of an almond tree. Then said Yahuah... Thou hast well seen: for I will hasten my word to perform it* (Jeremiah 1:11-12) — the waker-rod and the ripe fruit alike certify the word is at the door. Ezekiel pronounces the very sentence: *An end, the end is come upon the four corners of the land* (Ezekiel 7:2); *An end is come, the end is come: it watcheth for thee; behold, it is come* (Ezekiel 7:6). And Yahusha names the harvest of which all this is a figure: *the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39). When the fruit is ripe the reaping comes — the summer basket Amos saw is the end of the age.',
       sv.verse_id, ev.verse_id, 'free', 45340
  FROM _s330_amo08_lookup sv, _s330_amo08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-8-when-will-the-new-moon-be-gone-the-false-balances',
       E'When will the new moon be gone — the false balances and the resented appointed times',
       E'Amos exposes the heart of the greedy merchant: *Hear this, O ye that swallow up the needy, even to make the poor of the land to fail, Saying, When will the new moon be gone, that we may sell corn? and the sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying the balances by deceit? That we may buy the poor for silver, and the needy for a pair of shoes; yea, and sell the refuse of the wheat?* (Amos 8:4-6). Mark what this proves: the wicked CHAFE at the new moon and the sabbath as interruptions to profit — which means the appointed times are still Yahuah''s binding calendar, *resented* by the greedy, NOT abolished (*Remember the sabbath day, to keep it holy*, Exodus 20:8). And their cheating is precisely what the Torah forbids: *Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure... Just balances, just weights, a just ephah, and a just hin, shall ye have* (Leviticus 19:35-36); *Thou shalt not have in thy bag divers weights, a great and a small... For all that do such things... are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:13,16). The wisdom-word agrees: *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1); and Micah brings the same lawsuit: *the scant measure that is abominable... the wicked balances... the bag of deceitful weights* (Micah 6:10-11). Sirach keeps the charge into the second Temple: a man should be unashamed *Of exactness of balance and weights* (Sirach 42:4). Against all this Yahuah swears: *Surely I will never forget any of their works* (8:7). The Torah they trample is the very law that condemns their scale.',
       sv.verse_id, ev.verse_id, 'extras', 45343
  FROM _s330_amo08_lookup sv, _s330_amo08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-8-the-sun-to-go-down-at-noon-the-mourning-of-an-only-son',
       E'The sun to go down at noon — the mourning of an only son',
       E'The day of judgment carries two signs Amos names together: *I will cause the sun to go down at noon, and I will darken the earth in the clear day: And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day* (Amos 8:9-10). The noonday darkness and the only-son mourning are a type woven (not overclaimed) toward the impaling. At the cross the sun failed at the very noon: *Now from the sixth hour there was darkness over all the land unto the ninth hour* (Matthew 27:45). And the only-son grief Amos foretold is the grief Zechariah names over the pierced One: *they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn* (Zechariah 12:10). Jeremiah uses the very same figure for the bitter end: *make thee mourning, as for an only son, most bitter lamentation* (Jeremiah 6:26). The feasts turned to mourning, the sackcloth, the darkened noon, the only-son cry — the bitter day Amos saw is the day the Light of the world was darkened and the only Son mourned.',
       sv.verse_id, ev.verse_id, 'free', 45346
  FROM _s330_amo08_lookup sv, _s330_amo08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=8 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-8-a-famine-of-hearing-the-words-of-yahuah',
       E'A famine of hearing the words of Yahuah — the withdrawn word',
       E'The severest judgment of the chapter is not sword or drought but silence: *Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD): And they shall wander from sea to sea, and from the north even to the east, they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:11-12). This is the exact inverse of the manna lesson: *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3) — the very word Yahusha takes up in the wilderness, *Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4). If man lives by the word, then to withdraw it is the deadliest famine of all. And it comes to those who would not hear when the word was near: *they shall seek me early, but they shall not find me* (Proverbs 1:28); it is the dearth Israel knew before Samuel — *the word of Yahuah was precious in those days; there was no open vision* (1 Samuel 3:1). The restored witness foresees the same hiding: *then shall wit hide itself, and understanding withdraw itself into his secret chamber, And shall be sought of many, and yet not be found* (2 Esdras 5:9-10). The fair virgins and young men *faint for thirst* (8:13). Yet the answer to every such famine is the living Word: *I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). The word withdrawn in Amos is the Bread of Life freely given to all who come.',
       sv.verse_id, ev.verse_id, 'extras', 45349
  FROM _s330_amo08_lookup sv, _s330_amo08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I see a rod of an almond tree* (Jeremiah 1:11) — the same vision-and-question (*Amos, what seest thou?* Amos 8:2) by which Yahuah launches a word to be performed.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-basket-of-summer-fruit-the-end-is-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will hasten my word to perform it* (Jeremiah 1:12) — the ripe summer fruit (Amos 8:2) means the word is ready to be performed, just as the waker-rod does.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-basket-of-summer-fruit-the-end-is-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *An end, the end is come upon the four corners of the land* (Ezekiel 7:2) — Amos''s verdict *The end is come* (Amos 8:2) is Ezekiel''s very word on the same people.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-basket-of-summer-fruit-the-end-is-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the end is come: it watcheth for thee; behold, it is come* (Ezekiel 7:6) — the ripe end of Amos 8:2 is the end awake and waiting.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-basket-of-summer-fruit-the-end-is-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39) — the basket of ripe fruit declaring *The end is come* (Amos 8:2) is the harvest of the age''s end.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-basket-of-summer-fruit-the-end-is-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure* (Leviticus 19:35) — the very unrighteousness the greedy of Amos 8:5 commit with ephah and shekel.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Just balances, just weights, a just ephah, and a just hin, shall ye have* (Leviticus 19:36) — the Torah commands the exact opposite of the *ephah small... shekel great* (Amos 8:5).'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13) — the divers weights the merchant of Amos 8:5 carries to cheat the poor.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *all that do such things... are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:16) — the false balances of Amos 8:5 were named an abomination long before.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1) — the *balances by deceit* (Amos 8:5) are the thing Yahuah abhors.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the scant measure that is abominable* (Micah 6:10) — Amos''s *ephah small* (Amos 8:5) is Micah''s scant abominable measure.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the wicked balances... the bag of deceitful weights* (Micah 6:11) — the *balances by deceit* of Amos 8:5; Yahuah will not count such men pure.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Remember the sabbath day, to keep it holy* (Exodus 20:8) — the day the greedy resent (*when will... the sabbath* be gone, Amos 8:5); their resentment proves it stands, binding and not abolished.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *Of exactness of balance and weights* (Sirach 42:4) — the second-Temple wisdom keeps the same charge against the false scale of Amos 8:5. [extras]'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=42 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-when-will-the-new-moon-be-gone-the-false-balances'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *from the sixth hour there was darkness over all the land unto the ninth hour* (Matthew 27:45) — the sun gone down at noon (Amos 8:9) answered when the light failed at midday over the impaling.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=9
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-sun-to-go-down-at-noon-the-mourning-of-an-only-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they shall mourn for him, as one mourneth for his only son* (Zechariah 12:10) — the only-son mourning of Amos 8:10 poured out over the One they pierced.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-sun-to-go-down-at-noon-the-mourning-of-an-only-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *make thee mourning, as for an only son, most bitter lamentation* (Jeremiah 6:26) — the sackcloth and only-son cry of Amos 8:10; the same sign of utter grief on the bitter day.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-the-sun-to-go-down-at-noon-the-mourning-of-an-only-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3) — the manna lesson whose inverse is the famine of the word (Amos 8:11).'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4) — Yahusha names the truth that makes the famine of Amos 8:11 the deadliest of all.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35) — the living Word answers the famine of the word (Amos 8:11) and the thirst of the fainting (8:13).'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *they shall seek me early, but they shall not find me* (Proverbs 1:28) — the men who *run to and fro to seek the word... and shall not find it* (Amos 8:12) seek the word they once spurned, too late.'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the word of Yahuah (LORD) was precious in those days; there was no open vision* (1 Samuel 3:1) — the dearth before Samuel, the famine of *hearing the words of Yahuah* (Amos 8:11).'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *understanding withdraw itself into his secret chamber* (2 Esdras 5:9) — the restored witness foresees the same hiding of the word that Amos 8:12''s seekers cannot find. [extras]'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *shall be sought of many, and yet not be found* (2 Esdras 5:10) — the seekers of Amos 8:12 *shall not find it*; the word and wisdom sought too late. [extras]'
  FROM cross_reference_threads t
  JOIN _s330_amo08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s330_amo08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-8-a-famine-of-hearing-the-words-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_amos_9.sql (Amos 9) -----
-- Chapter: Amos 9 — THE BOOK'S CLOSE. The vision of Yahuah upon the altar opens with judgment from
-- which there is no escape: *Though they dig into hell, thence shall mine hand take them; though they
-- climb up to heaven, thence will I bring them down* (9:2) — the inescapable omnipresence in judgment.
-- The third creator-doxology names the Maker: *Adonai Yahuah (the Lord GOD) of hosts is he that toucheth
-- the land, and it shall melt... Yahuah (LORD) is his name* (9:5-6). Then the turn: Yahuah is sovereign
-- over all nations' migrations, the chosen not exempt (9:7); yet though he sift the house of Yashar'el
-- among all nations *like as corn is sifted in a sieve, yet shall not the least grain fall upon the
-- earth* (9:9) — the two-house people scattered yet preserved, NOT ONE TRUE GRAIN LOST. The keystone of
-- the whole book: *In that day will I raise up the tabernacle of David that is fallen... That they may
-- possess the remnant of Edom, and of all the heathen, which are called by my name* (9:11-12) — quoted by
-- James at the Jerusalem council (Acts 15:16-17) as the ingathering of the nations into the restored
-- Davidic kingdom (the Formed Son who rebuilds and HAS a Father; the nations grafted INTO restored
-- Yashar'el, NOT replacement — Romans 11 guard). And the close: the ploughman overtakes the reaper, the
-- captivity regathered, *I will plant them upon their land, and they shall no more be pulled up* (9:15) —
-- the irreversible restoration.
-- Tag: amo09   Temp view: _s330_amo09_lookup
-- Sort band: base 45360, step 3 -> threads at 45360, 45363, 45366, 45369, 45372 (5 threads)
-- Source of EVERY row: 'canon','amos',9,v
--
-- Amos 9 coverage:
--   ★ v.1-4 (Though they dig into hell, thence shall mine hand take them; though they climb up to heaven,
--          thence will I bring them down... though they be hid from my sight in the bottom of the sea)
--        NT:     none warranted distinct (the inescapable-presence motif is Tanakh-saturated; the forward
--                weave is carried laterally and in prose)
--        Extras: none warranted (clean lateral witnesses preferred)
--        Tanakh: ★★ Psalm 139:7-10 (Whither shall I flee from thy presence? If I ascend up into heaven...
--                if I make my bed in hell, behold, thou art there), ★ Jeremiah 23:23-24 (Can any hide
--                himself in secret places that I shall not see him?... Do not I fill heaven and earth?),
--                ★ Obadiah 1:4 (Though thou exalt thyself as the eagle... thence will I bring thee down) — THREAD 1
--   ★ v.5-6 (Adonai Yahuah (the Lord GOD) of hosts is he that toucheth the land, and it shall melt...
--          he that calleth for the waters of the sea, and poureth them out... Yahuah (LORD) is his name)
--        NT:     none warranted distinct (the creator-doxology weaves to the rest of Amos and to Ps 104/Isa 40
--                in prose; no single NT add forced)
--        Extras: none warranted
--        Tanakh: ★ Amos 4:13 (he that formeth the mountains, and createth the wind... Yahuah (LORD), The
--                Elohim (God) of hosts, is his name), ★ Amos 5:8 (Seek him that maketh the seven stars and
--                Orion... that calleth for the waters of the sea, and poureth them out... Yahuah is his name) — THREAD 2
--   ★★ v.7-10 (Have not I brought up Yashar'el out of the land of Egypt?... I will sift the house of
--          Yashar'el among all nations, like as corn is sifted in a sieve, yet shall not the least grain
--          fall upon the earth)
--        NT:     ★★ Luke 22:31 (Satan hath desired to have you, that he may sift you as wheat), ★ Matthew
--                3:12 (he will throughly purge his floor, and gather his wheat into the garner; but he will
--                burn up the chaff), ★ Romans 11:1 (Hath Elohim (God) cast away his people? Elohim (God)
--                forbid) — THREAD 3
--        Extras: ★ 2 Esdras 13:40 (Those are the ten tribes, which were carried away prisoners... whom
--                Salmanasar the king of Assyria led away captive) — THREAD 3 (the scattered ten tribes)
--        Tanakh: ★ Hosea 1:10 (in the place where it was said... Ye are not my people, there it shall be
--                said unto them, Ye are the sons of the living Elohim (God)) — THREAD 3 (the preserved remnant)
--   ★★★ v.11-12 (In that day will I raise up the tabernacle of David that is fallen... That they may
--          possess the remnant of Edom, and of all the heathen, which are called by my name)
--        NT:     ★★★ Acts 15:16 (After this I will return, and will build again the tabernacle of David,
--                which is fallen down), ★★★ Acts 15:17 (That the residue of men might seek after Yahuah...
--                and all the Gentiles, upon whom my name is called) — THREAD 4 (THE supreme keystone)
--        Extras: ★ Sirach 47:22 (he gave a remnant to Jacob, and out of him a root to David), ★ Tobit 14:6
--                (And all nations shall turn, and fear Yahuah (God) truly) — THREAD 4
--        Tanakh: ★ Isaiah 16:5 (in mercy shall the throne be established... in the tabernacle of David),
--                ★ Ezekiel 37:24 (And David my servant shall be king over them... one shepherd) — THREAD 4
--   ★★ v.13-15 (the plowman shall overtake the reaper... I will plant them upon their land, and they
--          shall no more be pulled up out of their land which I have given them)
--        NT:     ★ John 4:35 (Lift up your eyes, and look on the fields; for they are white already to
--                harvest) — THREAD 5 (the overtaking harvest)
--        Extras: none warranted (clean canon witnesses carry the restored-land weave)
--        Tanakh: ★ Leviticus 26:5 (your threshing shall reach unto the vintage... and dwell in your land
--                safely), ★ Joel 3:18 (the mountains shall drop down new wine), ★ Jeremiah 31:5 (Thou shalt
--                yet plant vines upon the mountains of Samaria), ★ Isaiah 65:21-22 (they shall plant
--                vineyards, and eat the fruit of them... mine elect shall long enjoy the work of their
--                hands), ★ Ezekiel 36:35-36 (This land that was desolate is become like the garden of
--                Eden... I Yahuah (LORD) build the ruined places, and plant that that was desolate) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. amos-9-whither-shall-i-flee-no-escape-from-his-presence — Tanakh (Psalm 139, Jeremiah 23, Obadiah 1) [free]
--      (★ the inescapable omnipresence — in heaven, in hell, in the bottom of the sea, his hand takes them)
--   2. amos-9-yahuah-is-his-name-he-toucheth-the-land — Tanakh (Amos 4, Amos 5) [free]
--      (★ the third creator-doxology; the Maker who toucheth the land and calleth for the sea — Yahuah is his name)
--   3. amos-9-the-sieve-that-loses-not-the-least-grain — NT (Luke 22, Matthew 3, Romans 11) + Tanakh (Hosea 1) + Extras (2 Esdras 13) [extras]
--      (★★ the house of Yashar'el sifted among all nations yet NOT ONE GRAIN LOST — the two-house dispersion + preservation)
--   4. amos-9-the-tabernacle-of-david-that-is-fallen-raised-up — NT (Acts 15) + Tanakh (Isaiah 16, Ezekiel 37) + Extras (Sirach 47, Tobit 14) [extras]
--      (★★★ THE KEYSTONE — the fallen booth of David rebuilt, the nations called by his name brought IN, quoted by James at the Jerusalem council; Formed Son who rebuilds, Romans 11 anti-replacement guard)
--   5. amos-9-planted-and-no-more-pulled-up — NT (John 4) + Tanakh (Leviticus 26, Joel 3, Jeremiah 31, Isaiah 65, Ezekiel 36) [free]
--      (★★ the ploughman overtakes the reaper; the captivity regathered; planted, never again pulled up)
--
-- Framing notes:
--   ★ NO ESCAPE (THREAD 1): Yahuah upon the altar declares the inescapable judgment — *Though they dig
--      into hell, thence shall mine hand take them; though they climb up to heaven, thence will I bring
--      them down* (9:2). David sings the same omnipresence as comfort and as inescapability: *Whither
--      shall I flee from thy presence? If I ascend up into heaven, thou art there: if I make my bed in
--      hell, behold, thou art there* (Psalm 139:7-8). Jeremiah names it as the warrant of judgment: *Can
--      any hide himself in secret places that I shall not see him?... Do not I fill heaven and earth?*
--      (Jeremiah 23:24). And Edom is told the same eagle-flight is futile: *Though thou exalt thyself as
--      the eagle... thence will I bring thee down* (Obadiah 1:4). The One on the altar fills heaven and earth.
--   ★ YAHUAH IS HIS NAME (THREAD 2): the third of Amos's creator-doxologies — *Adonai Yahuah (the Lord
--      GOD) of hosts is he that toucheth the land, and it shall melt... It is he that buildeth his stories
--      in the heaven... he that calleth for the waters of the sea, and poureth them out upon the face of
--      the earth: Yahuah (LORD) is his name* (9:5-6). It echoes the first — *he that formeth the
--      mountains, and createth the wind... Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos
--      4:13) — and the second — *Seek him that maketh the seven stars and Orion... that calleth for the
--      waters of the sea, and poureth them out... Yahuah is his name* (Amos 5:8). The Judge is the Maker.
--   ★★ THE SIEVE (THREAD 3): *I will sift the house of Yashar'el (Israel) among all nations, like as corn
--      is sifted in a sieve, yet shall not the least grain fall upon the earth* (9:9). The sifting IS the
--      two-house dispersion — Yahuah sovereign even over which nation he brought up from where (9:7) — yet
--      not one true grain is lost. Yahusha tells Simon the same: *Satan hath desired to have you, that he
--      may sift you as wheat* (Luke 22:31); the Baptist sees the floor purged, the wheat gathered, the
--      chaff burned (Matthew 3:12); and the scattered ten tribes are named in the restored witness — *Those
--      are the ten tribes, which were carried away prisoners* (2 Esdras 13:40). Paul guards it:
--      *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — and Hosea's *Lo-ammi*
--      is reversed (Hosea 1:10). The kingdom is sifted but the seed is kept.
--   ★★★ THE TABERNACLE OF DAVID (THREAD 4): the keystone of the whole book — *In that day will I raise up
--      the tabernacle of David that is fallen, and close up the breaches thereof... That they may possess
--      the remnant of Edom, and of all the heathen, which are called by my name* (9:11-12). James quotes
--      it verbatim at the Jerusalem council to settle the ingathering of the nations: *After this I will
--      return, and will build again the tabernacle of David, which is fallen down... That the residue of
--      men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called* (Acts
--      15:16-17). The fallen booth/dynasty of David is rebuilt by the Davidic Messiah-King — the Formed
--      Son who rebuilds and HAS a Father, NOT a co-equal abstraction. The nations called by his name are
--      brought INTO the restored Davidic kingdom — grafted into Yashar'el, NOT replacing her (Romans 11).
--      Isaiah saw the throne *in the tabernacle of David* (Isaiah 16:5); Ezekiel saw David as the one
--      shepherd-king (Ezekiel 37:24); Sirach saw *a root to David* preserved (Sirach 47:22); Tobit saw
--      *all nations... turn, and fear Yahuah (God)* (Tobit 14:6).
--   ★★ PLANTED, NEVER PULLED UP (THREAD 5): the abundance and the irreversible planting — *the plowman
--      shall overtake the reaper... And I will plant them upon their land, and they shall no more be
--      pulled up out of their land which I have given them* (9:13,15). Leviticus had promised the
--      overtaking harvest (Leviticus 26:5); Joel the mountains dropping wine (Joel 3:18); Jeremiah the
--      vines replanted on Samaria's mountains (Jeremiah 31:5); Isaiah the elect long enjoying the work of
--      their hands (Isaiah 65:21-22); Ezekiel the desolate land made like Eden (Ezekiel 36:35-36); and
--      Yahusha the fields white to harvest (John 4:35). The two-house people planted forever.
--   VERSES WITH NO SEPARATE ADD: v.1 (the altar-vision, Smite the lintel — the preface to the no-escape
--      judgment of THREAD 1, woven in its prose), v.10 (the sinners die by the sword — the chaff burned of
--      THREAD 3, bound there), v.13-14 (the abundance + regathered captivity — woven into THREAD 5 with
--      v.15). All recorded, none silently skipped.

CREATE TEMP VIEW _s330_amo09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Whither shall I flee — no escape from his presence
    ('canon','amos',9,2,'canon','psalms',139,7,'free',
      E'*Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7). The judgment-word of Amos — *Though they dig into hell, thence shall mine hand take them; though they climb up to heaven, thence will I bring them down* (Amos 9:2) — is David''s omnipresence turned to its terror: there is no spirit, no presence, that any can flee. The same Yahuah who upholds the saint pursues the rebel; whither shall he flee?'),
    ('canon','amos',9,2,'canon','psalms',139,8,'free',
      E'*If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there* (Psalm 139:8). Amos''s *though they dig into hell... though they climb up to heaven* (Amos 9:2) is this very verse read as a sentence of judgment — heaven and Sheol alike are within his hand. The hiding-places are no hiding at all; *behold, thou art there*.'),
    ('canon','amos',9,3,'canon','psalms',139,9,'free',
      E'*If I take the wings of the morning, and dwell in the uttermost parts of the sea* (Psalm 139:9). Amos closes the same circle — *though they be hid from my sight in the bottom of the sea, thence will I command the serpent, and he shall bite them* (Amos 9:3). The uttermost parts of the sea, David''s last refuge, are where Yahuah''s hand still reaches; *Even there shall thy hand lead me* (139:10), or take hold for judgment.'),
    ('canon','amos',9,3,'canon','jeremiah',23,24,'free',
      E'*Can any hide himself in secret places that I shall not see him? saith Yahuah (LORD). Do not I fill heaven and earth? saith Yahuah (LORD)* (Jeremiah 23:24). Amos''s search-and-take — *though they hide themselves in the top of Carmel, I will search and take them out thence* (Amos 9:3) — rests on the same warrant: the One who *fill[s] heaven and earth* leaves no secret place. He is no *Elohim (God) afar off* (23:23) but the Maker present in every refuge.'),
    ('canon','amos',9,2,'canon','obadiah',1,4,'free',
      E'*Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:4). The same *thence* that brings Yashar''el down from heaven (Amos 9:2) brings proud Edom down from the stars — the futile flight upward met by the hand that *brings... down*. No height, no nest among the stars, escapes the One who fills heaven and earth.'),

    -- THREAD 2 (★): Yahuah is his name — the third creator-doxology
    ('canon','amos',9,6,'canon','amos',4,13,'free',
      E'*For, lo, he that formeth the mountains, and createth the wind, and declareth unto man what is his thought, that maketh the morning darkness, and treadeth upon the high places of the earth, Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13). The third doxology — *It is he that buildeth his stories in the heaven... Yahuah (LORD) is his name* (Amos 9:6) — echoes the first: the Judge who toucheth the land is the Maker who *formeth the mountains, and createth the wind*. The sealing refrain is the same: *Yahuah is his name*.'),
    ('canon','amos',9,6,'canon','amos',5,8,'free',
      E'*Seek him that maketh the seven stars and Orion, and turneth the shadow of death into the morning, and maketh the day dark with night: that calleth for the waters of the sea, and poureth them out upon the face of the earth: Yahuah (LORD) is his name* (Amos 5:8). The second doxology shares Amos 9:6''s own words — *he that calleth for the waters of the sea, and poureth them out upon the face of the earth: Yahuah (LORD) is his name*. The One who commands the sea in creation is the One who commands it in judgment; the Maker and the Judge bear one Name.'),

    -- THREAD 3 (★★): The sieve that loses not the least grain
    ('canon','amos',9,9,'canon','luke',22,31,'free',
      E'*And the Lord said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat* (Luke 22:31). Yahusha names the very figure of Amos — *I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve* (Amos 9:9). The sieve shakes the wheat hard, but the true grain holds; *yet shall not the least grain fall upon the earth*. Satan desires the sifting; Yahuah ordains that not one true seed is lost.'),
    ('canon','amos',9,9,'canon','matthew',3,12,'free',
      E'*Whose fan is in his hand, and he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12). The sieve of Amos 9:9 is the threshing-floor fan: the wheat *gather[ed]... into the garner* — *not the least grain fall[ing] upon the earth* — while the chaff is burned, even as *All the sinners of my people shall die by the sword* (Amos 9:10). The sifting separates; the seed is kept, the chaff consumed.'),
    ('canon','amos',9,8,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Amos guards the same line: *I will not utterly destroy the house of Jacob, saith Yahuah (LORD)* (Amos 9:8). The sinful kingdom is destroyed, but the house of Jacob is not cast away — Paul''s own answer to whether Yahuah has finished with his people. The sifting is judgment within the covenant, never a casting-off.'),
    ('canon','amos',9,9,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The grain that does not fall (Amos 9:9) is Hosea''s *Lo-ammi* reversed: scattered *among all nations*, yet preserved and reclaimed as *the sons of the living Elohim (God)*. The two-house people sifted through the nations yet gathered, not one true seed lost.'),
    ('canon','amos',9,9,'apocrypha','2-esdras',13,40,'extras',
      E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40). The restored witness names the very people of the sieve — *the house of Yashar''el (Israel)* sifted *among all nations* (Amos 9:9): the ten tribes carried away, scattered, yet (13:39) gathered again as *a peaceable multitude*. The lost grain is not lost; it is sifted into the nations and kept for the gathering.'),

    -- THREAD 4 (★★★): The tabernacle of David that is fallen — raised up (THE keystone)
    ('canon','amos',9,11,'canon','acts',15,16,'free',
      E'*After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up* (Acts 15:16). James quotes Amos 9:11 verbatim at the Jerusalem council — *In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins*. The fallen booth of David is rebuilt by the Davidic Messiah-King — the Formed Son who rebuilds and HAS a Father. The promise is not abolished; it is being kept.'),
    ('canon','amos',9,12,'canon','acts',15,17,'free',
      E'*That the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called, saith Yahuah (Lord), who doeth all these things* (Acts 15:17). This is Amos 9:12 — *That they may possess the remnant of Edom, and of all the heathen, which are called by my name, saith Yahuah (LORD)*. James settles the council by it: the nations called by his name are brought INTO the rebuilt tabernacle of David, grafted into restored Yashar''el — NOT replacing her, but the residue of men seeking after Yahuah within the Davidic kingdom (Romans 11).'),
    ('canon','amos',9,11,'canon','isaiah',16,5,'free',
      E'*And in mercy shall the throne be established: and he shall sit upon it in truth in the tabernacle of David, judging, and seeking judgment, and hasting righteousness* (Isaiah 16:5). The tabernacle of David that Amos sees *raise[d] up... fallen* (Amos 9:11) is the throne Isaiah sees *established* in mercy — *he shall sit upon it in truth in the tabernacle of David*. The rebuilt booth is the seat of the righteous Davidic King who judges in truth.'),
    ('canon','amos',9,11,'canon','ezekiel',37,24,'free',
      E'*And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). The raised tabernacle of David (Amos 9:11) is David the king restored over the gathered two sticks — *one shepherd* over the reunited houses, who keep Torah: *they shall... observe my statutes, and do them*. The Davidic kingdom rebuilt is the kingdom that walks in his judgments.'),
    ('canon','amos',9,12,'apocrypha','ecclesiasticus',47,22,'extras',
      E'*But Yahuah (God) will never leave off his mercy, neither shall any of his works perish, neither will he abolish the posterity of his elect, and the seed of him that loves him he will not take away: wherefore he gave a remnant to Jacob, and out of him a root to David* (Sirach 47:22). The remnant possessed and the nations called by his name (Amos 9:12) rest on this kept word: *a remnant to Jacob, and out of him a root to David*. The Davidic line is never abolished; from its root the tabernacle is raised again.'),
    ('canon','amos',9,12,'apocrypha','tobit',14,6,'extras',
      E'*And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). The heathen *called by my name* (Amos 9:12), the residue of men seeking after Yahuah, are the all-nations that *turn, and fear Yahuah (God) truly*. The rebuilt tabernacle of David draws the nations in — they bury their idols and seek the Name called upon them.'),

    -- THREAD 5 (★★): Planted, and no more pulled up
    ('canon','amos',9,13,'canon','leviticus',26,5,'free',
      E'*And your threshing shall reach unto the vintage, and the vintage shall reach unto the sowing time: and ye shall eat your bread to the full, and dwell in your land safely* (Leviticus 26:5). Amos''s *the plowman shall overtake the reaper, and the treader of grapes him that soweth seed* (Amos 9:13) is this covenant-blessing fulfilled — harvest overtaking harvest, the seasons crowding upon one another in abundance, the people dwelling *in [their] land safely*. The restored land overflows.'),
    ('canon','amos',9,13,'canon','joel',3,18,'free',
      E'*And it shall come to pass in that day, that the mountains shall drop down new wine, and the hills shall flow with milk, and all the rivers of Yahudah (Judah) shall flow with waters, and a fountain shall come forth of the house of Yahuah (LORD)* (Joel 3:18). Amos and Joel share the very image — *the mountains shall drop sweet wine, and all the hills shall melt* (Amos 9:13). In the day of restoration the mountains themselves run with wine; the land made whole pours out its abundance.'),
    ('canon','amos',9,14,'canon','jeremiah',31,5,'free',
      E'*Thou shalt yet plant vines upon the mountains of Samaria: the planters shall plant, and shall eat them as common things* (Jeremiah 31:5). Amos''s *they shall plant vineyards, and drink the wine thereof* (Amos 9:14) is Jeremiah''s word to the northern house — vines replanted *upon the mountains of Samaria*, the very seat of scattered Ephraim. The regathered captivity rebuilds and replants the land it lost.'),
    ('canon','amos',9,15,'canon','isaiah',65,21,'free',
      E'*And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21). Amos''s *they shall build the waste cities, and inhabit them; and they shall plant vineyards* (Amos 9:14) is Isaiah''s new-creation promise — and its security, *they shall not build, and another inhabit; they shall not plant, and another eat* (65:22), is Amos''s *they shall no more be pulled up* (9:15). The planting is permanent; the elect long enjoy the work of their hands.'),
    ('canon','amos',9,15,'canon','ezekiel',36,35,'free',
      E'*And they shall say, This land that was desolate is become like the garden of Eden; and the waste and desolate and ruined cities are become fenced, and are inhabited* (Ezekiel 36:35). The land where Yashar''el is *plant[ed]... and they shall no more be pulled up* (Amos 9:15) becomes *like the garden of Eden* — the waste cities of Amos 9:14 rebuilt and inhabited. The final planting restores Eden in the land Yahuah gave.'),
    ('canon','amos',9,15,'canon','ezekiel',36,36,'free',
      E'*Then the heathen that are left round about you shall know that I Yahuah (LORD) build the ruined places, and plant that that was desolate: I Yahuah (LORD) have spoken it, and I will do it* (Ezekiel 36:36). Amos seals his book the same way — *I will plant them upon their land... which I have given them, saith Yahuah Elohayka (the LORD thy God)* (Amos 9:15). The One who builds the ruined places and plants the desolate land has spoken it; the restoration is his own irreversible work.'),
    ('canon','amos',9,13,'canon','john',4,35,'free',
      E'*Say not ye, There are yet four months, and then cometh harvest? behold, I say unto you, Lift up your eyes, and look on the fields; for they are white already to harvest* (John 4:35). Amos''s *the plowman shall overtake the reaper* (Amos 9:13) — the harvest crowding upon the sowing — is the fields *white already to harvest*: the seasons collapsed, the ingathering at hand. *He that reapeth receiveth wages, and gathereth fruit unto life eternal* (4:36); the overtaking harvest is the gathering of the restored people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s330_amo09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s330_amo09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-9-whither-shall-i-flee-no-escape-from-his-presence',
       E'Whither shall I flee — no escape from his presence',
       E'The book''s final vision opens with Yahuah upon the altar pronouncing a judgment from which there is no hiding: *Though they dig into hell, thence shall mine hand take them; though they climb up to heaven, thence will I bring them down: And though they hide themselves in the top of Carmel, I will search and take them out thence; and though they be hid from my sight in the bottom of the sea, thence will I command the serpent, and he shall bite them* (Amos 9:2-3). This is David''s omnipresence read as inescapability: *Whither shall I go from thy spirit? or whither shall I flee from thy presence? If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there. If I take the wings of the morning, and dwell in the uttermost parts of the sea; Even there shall thy hand lead me* (Psalm 139:7-10). Jeremiah names the warrant: *Can any hide himself in secret places that I shall not see him? saith Yahuah (LORD). Do not I fill heaven and earth?* (Jeremiah 23:24). And proud Edom is told the same upward flight is futile: *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:4). The One on the altar fills heaven and earth; there is no refuge from his hand.',
       sv.verse_id, ev.verse_id, 'free', 45360
  FROM _s330_amo09_lookup sv, _s330_amo09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-9-yahuah-is-his-name-he-toucheth-the-land',
       E'Yahuah is his name — the Maker who toucheth the land',
       E'The third of Amos''s creator-doxologies names the Judge as the Maker: *And Adonai Yahuah (the Lord GOD) of hosts is he that toucheth the land, and it shall melt, and all that dwell therein shall mourn... It is he that buildeth his stories in the heaven, and hath founded his troop in the earth; he that calleth for the waters of the sea, and poureth them out upon the face of the earth: Yahuah (LORD) is his name* (Amos 9:5-6). It seals the book with the same refrain as the first doxology — *he that formeth the mountains, and createth the wind... Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13) — and the second — *Seek him that maketh the seven stars and Orion... that calleth for the waters of the sea, and poureth them out upon the face of the earth: Yahuah (LORD) is his name* (Amos 5:8). The God who upholds heaven, who calls the sea and pours it out, who forms the mountains, is the One whose hand has just been declared inescapable. The Judge is the Creator; Yahuah is his name.',
       sv.verse_id, ev.verse_id, 'free', 45363
  FROM _s330_amo09_lookup sv, _s330_amo09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-9-the-sieve-that-loses-not-the-least-grain',
       E'The sieve that loses not the least grain — the two-house people sifted yet preserved',
       E'Yahuah is sovereign over every nation''s migrations — *Are ye not as children of the Ethiopians unto me, O children of Yashar''el (Israel)?... Have not I brought up Yashar''el (Israel) out of the land of Egypt? and the Philistines from Caphtor, and the Syrians from Kir?* (Amos 9:7) — and so the chosen are not exempt from his sieve. Yet the sieve does not destroy the seed: *Behold, the eyes of Adonai Yahuah (the Lord GOD) are upon the sinful kingdom, and I will destroy it from off the face of the earth; saving that I will not utterly destroy the house of Jacob, saith Yahuah (LORD). For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth* (Amos 9:8-9). This is the two-house dispersion and its preservation: scattered through the nations, yet not one true grain lost. Yahusha tells Simon the same: *Satan hath desired to have you, that he may sift you as wheat* (Luke 22:31); the Baptist sees the floor purged, *gather[ing] his wheat into the garner; but he will burn up the chaff* (Matthew 3:12) — even as *All the sinners of my people shall die by the sword* (Amos 9:10). The scattered ten tribes are named in the restored witness — *Those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — and gathered again. Paul guards it absolutely: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); and Hosea''s *Lo-ammi* is reversed — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The kingdom is sifted but the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 45366
  FROM _s330_amo09_lookup sv, _s330_amo09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-9-the-tabernacle-of-david-that-is-fallen-raised-up',
       E'The tabernacle of David that is fallen, raised up — and the nations called by his name',
       E'The keystone of the whole book: *In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins, and I will build it as in the days of old: That they may possess the remnant of Edom, and of all the heathen, which are called by my name, saith Yahuah (LORD) that doeth this* (Amos 9:11-12). The fallen booth — the broken dynasty of David — is rebuilt, its breaches closed; and the nations called by Yahuah''s name are brought in. James quotes it verbatim to settle the Jerusalem council: *After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up: That the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called, saith Yahuah (Lord), who doeth all these things* (Acts 15:16-17). This is the Davidic Messiah-King who rebuilds — the Formed Son who has a Father, the King upon the throne *established... in the tabernacle of David, judging, and seeking judgment* (Isaiah 16:5), *David my servant... king over them... one shepherd* over the reunited houses who keep Torah (Ezekiel 37:24). The nations are grafted INTO the restored Davidic kingdom, NOT replacing Yashar''el but seeking after Yahuah within her — *a remnant to Jacob, and out of him a root to David* (Sirach 47:22), and *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). The booth is raised; the residue of men and all the nations come in under the Name.',
       sv.verse_id, ev.verse_id, 'extras', 45369
  FROM _s330_amo09_lookup sv, _s330_amo09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'amos-9-planted-and-no-more-pulled-up',
       E'Planted, and no more pulled up — the irreversible restoration',
       E'The book ends in overflowing abundance and an unbreakable planting: *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt. And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof... And I will plant them upon their land, and they shall no more be pulled up out of their land which I have given them, saith Yahuah Elohayka (the LORD thy God)* (Amos 9:13-15). The overtaking harvest is Torah''s own covenant-blessing — *your threshing shall reach unto the vintage, and the vintage shall reach unto the sowing time... and dwell in your land safely* (Leviticus 26:5). The mountains dropping wine is Joel''s day — *the mountains shall drop down new wine, and the hills shall flow with milk* (Joel 3:18). The replanted vines are Jeremiah''s word to scattered Ephraim — *Thou shalt yet plant vines upon the mountains of Samaria* (Jeremiah 31:5). The secure planting is Isaiah''s new creation — *they shall not build, and another inhabit; they shall not plant, and another eat... mine elect shall long enjoy the work of their hands* (Isaiah 65:22) — and Ezekiel''s Eden restored — *This land that was desolate is become like the garden of Eden... I Yahuah (LORD) build the ruined places, and plant that that was desolate: I Yahuah (LORD) have spoken it, and I will do it* (Ezekiel 36:35-36). And the overtaking harvest is the ingathering Yahusha sees at hand — *Lift up your eyes, and look on the fields; for they are white already to harvest* (John 4:35). The two-house people are planted upon their land forever; never again pulled up.',
       sv.verse_id, ev.verse_id, 'free', 45372
  FROM _s330_amo09_lookup sv, _s330_amo09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='amos' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7) — David''s omnipresence turned to terror: the *thence... mine hand take them* of Amos 9:2 leaves no flight.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-whither-shall-i-flee-no-escape-from-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there* (Psalm 139:8) — Amos 9:2 word for word as judgment: heaven and Sheol alike within his hand.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-whither-shall-i-flee-no-escape-from-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If I take the wings of the morning, and dwell in the uttermost parts of the sea* (Psalm 139:9) — the sea-bottom of Amos 9:3 is David''s last refuge, and *even there shall thy hand* reach.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-whither-shall-i-flee-no-escape-from-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Can any hide himself in secret places that I shall not see him?... Do not I fill heaven and earth?* (Jeremiah 23:24) — the warrant of Amos''s search-and-take (Amos 9:3): no secret place hides from the One who fills all.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-whither-shall-i-flee-no-escape-from-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Though thou exalt thyself as the eagle... thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:4) — the same *thence... bring them down* of Amos 9:2; no nest among the stars escapes his hand.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-whither-shall-i-flee-no-escape-from-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he that formeth the mountains, and createth the wind... Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13) — the first doxology; the Judge who toucheth the land (Amos 9:6) is the Maker, sealed by the same Name.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-yahuah-is-his-name-he-toucheth-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *that calleth for the waters of the sea, and poureth them out upon the face of the earth: Yahuah (LORD) is his name* (Amos 5:8) — Amos 9:6''s own words; the One who commands the sea in creation commands it in judgment.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-yahuah-is-his-name-he-toucheth-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Satan hath desired to have you, that he may sift you as wheat* (Luke 22:31) — Yahusha names the figure of Amos 9:9; the sieve shakes hard, but *not the least grain* falls.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-sieve-that-loses-not-the-least-grain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12) — the sieve as threshing-floor: the grain kept (Amos 9:9), the chaff (the sinners, 9:10) burned.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-sieve-that-loses-not-the-least-grain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — Paul''s guard on Amos 9:8: the sinful kingdom destroyed, but *I will not utterly destroy the house of Jacob*.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-sieve-that-loses-not-the-least-grain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the grain that does not fall (Amos 9:9) is *Lo-ammi* reversed; the two-house people sifted yet reclaimed.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-sieve-that-loses-not-the-least-grain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Those are the ten tribes, which were carried away prisoners... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the restored witness names the people of the sieve (Amos 9:9): scattered among the nations, kept for the gathering.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-sieve-that-loses-not-the-least-grain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will return, and will build again the tabernacle of David, which is fallen down* (Acts 15:16) — James quotes Amos 9:11 verbatim at the Jerusalem council; the fallen booth rebuilt by the Davidic King.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-tabernacle-of-david-that-is-fallen-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *That the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called* (Acts 15:17) — Amos 9:12; the nations called by his name brought INTO restored Yashar''el, not replacing her (Romans 11).'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=12
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-tabernacle-of-david-that-is-fallen-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *in mercy shall the throne be established... in the tabernacle of David, judging, and seeking judgment* (Isaiah 16:5) — the raised booth of Amos 9:11 is the seat of the righteous Davidic King.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-tabernacle-of-david-that-is-fallen-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *David my servant shall be king over them; and they all shall have one shepherd... observe my statutes, and do them* (Ezekiel 37:24) — the rebuilt tabernacle is David restored over the reunited two houses who keep Torah.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-tabernacle-of-david-that-is-fallen-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *he gave a remnant to Jacob, and out of him a root to David* (Sirach 47:22) — the remnant possessed (Amos 9:12) rests on the kept Davidic root from which the tabernacle is raised.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=12
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=47 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-tabernacle-of-david-that-is-fallen-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6) — the heathen *called by my name* (Amos 9:12) are the nations that turn to Yahuah within the rebuilt tabernacle.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=12
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-the-tabernacle-of-david-that-is-fallen-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *your threshing shall reach unto the vintage... and dwell in your land safely* (Leviticus 26:5) — the covenant-blessing fulfilled in Amos 9:13''s plowman overtaking the reaper.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the mountains shall drop down new wine, and the hills shall flow with milk* (Joel 3:18) — Amos and Joel share the image of Amos 9:13: the restored mountains running with wine.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Thou shalt yet plant vines upon the mountains of Samaria* (Jeremiah 31:5) — Amos 9:14''s replanted vineyards spoken to scattered Ephraim, the northern house regathered.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21) — Amos 9:14''s planting; its security, *they shall not plant, and another eat* (65:22), is Amos 9:15''s *no more be pulled up*.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *This land that was desolate is become like the garden of Eden... ruined cities are become fenced, and are inhabited* (Ezekiel 36:35) — the land where Yashar''el is planted (Amos 9:15) becomes Eden restored.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I Yahuah (LORD) build the ruined places, and plant that that was desolate: I Yahuah (LORD) have spoken it, and I will do it* (Ezekiel 36:36) — Amos 9:15''s irreversible planting is Yahuah''s own work, spoken and done.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Lift up your eyes, and look on the fields; for they are white already to harvest* (John 4:35) — Amos 9:13''s plowman overtaking the reaper is the ingathering at hand, the seasons collapsed.'
  FROM cross_reference_threads t
  JOIN _s330_amo09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='amos' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s330_amo09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='amos-9-planted-and-no-more-pulled-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session330 — Amos cross-references complete.'
