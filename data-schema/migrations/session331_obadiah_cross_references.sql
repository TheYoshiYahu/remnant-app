-- =====================================================================
-- Session 331 — Obadiah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session331_obadiah_cross_references.sql
-- =====================================================================

\echo 'session331 — Obadiah cross-references starting...'
BEGIN;

-- ----- fragment: minion_obadiah_1.sql (Obadiah 1) -----
-- Chapter: Obadiah 1 (the whole single-chapter book, 21 verses) — Edom's pride and fall; the violence
-- against his brother Jacob; the day of Yahuah upon all the heathen; saviours on mount Zion, and the
-- kingdom shall be Yahuah's. Edom = Esau, the brother-line; the oracle judges CONDUCT and election, NOT
-- ethnicity — Edom is condemned for what he DID (gloated over, cut off, and plundered his brother Yahudah
-- in the day of Jerusalem's fall), and the recompense is measure-for-measure. The keystone close is the
-- consummation: *And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom
-- shall be the LORD'S* (v.21).
-- Tag: oba01   Temp view: _s331_oba01_lookup   Session prefix: s331
-- Sort band: base 45300, step 3 -> threads at 45300, 45303, 45306, 45309, 45312 (5 threads)
-- Source of EVERY row: 'canon','obadiah',1,v
--
-- Obadiah 1 coverage:
--   v.1-2 (the vision; the rumour from Yahuah; I have made thee small among the heathen)
--        NT: none warranted | Extras: none warranted distinct
--        Tanakh: ★ Jeremiah 49:14-15 (near-identical parallel Edom oracle) — woven into THREAD 1 (v.3-4)
--   ★ v.3-4 (The pride of thine heart hath deceived thee... Though thou exalt thyself as the eagle, and
--          though thou set thy nest among the stars, thence will I bring thee down)
--        NT:     ★ Luke 14:11 (whosoever exalteth himself shall be abased) — THREAD 1
--        Extras: none warranted (the pride-before-fall weave is fully carried by Tanakh + NT)
--        Tanakh: ★ Jeremiah 49:16 (the pride of thine heart... though thou make thy nest as high as the
--                eagle, I will bring thee down), ★ Isaiah 14:13-14 (I will exalt my throne above the
--                stars of Elohim... I will be like the El Elyon) + 14:15 (brought down to hell),
--                ★ Proverbs 16:18 (Pride goeth before destruction) — THREAD 1
--   v.5-9 (the grapegatherers/thieves; Esau's hidden things searched out; the confederates that deceived;
--          the wise men destroyed out of Edom; Teman dismayed)
--        NT: none warranted | Extras: none warranted distinct
--        Tanakh: the searching-out and the destruction woven in prose; no separate forced add (the
--                pride-judgment of THREAD 1 and the brother-betrayal of THREAD 2 carry the chapter's heart)
--   ★★ v.10-14 (For thy violence against thy brother Jacob shame shall cover thee... In the day that thou
--          stoodest on the other side... thou wast as one of them... neither shouldest thou have stood in
--          the crossway, to cut off those of his that did escape)
--        NT:     ★★ Romans 9:13 (Jacob have I loved, but Esau have I hated) — THREAD 2 (the Esau-line,
--                election-not-ethnic)
--        Extras: ★ 1 Maccabees 5:3 (Judas fought against the children of Esau in Idumea... and gave them
--                a great overthrow) — THREAD 2 (clean witness on the recompense on the brother-line)
--        Tanakh: ★ Genesis 25:23 (Two nations are in thy womb... the elder shall serve the younger),
--                ★ Genesis 27:41 (Esau hated Jacob... then will I slay my brother Jacob), ★ Psalm 137:7
--                (Remember... the children of Edom in the day of Jerusalem; who said, Rase it, rase it),
--                ★ Ezekiel 35:5 (thou hast had a perpetual hatred, and hast shed the blood of the
--                children of Yashar'el), ★ Malachi 1:2-3 (Was not Esau Jacob's brother?... yet I loved
--                Jacob, And I hated Esau) — THREAD 2
--   ★★ v.15 (For the day of Yahuah is near upon all the heathen: as thou hast done, it shall be done unto
--          thee: thy reward shall return upon thine own head) [+ v.16 the drinking on the holy mountain,
--          woven in prose]
--        NT:     ★★ Matthew 7:2 (with what measure ye mete, it shall be measured to you again),
--                ★ Galatians 6:7 (whatsoever a man soweth, that shall he also reap) — THREAD 3
--        Extras: none warranted (the measure-for-measure law is fully canon-carried)
--        Tanakh: ★ Joel 3:14 (Multitudes... in the valley of decision: for the day of Yahuah is near) —
--                THREAD 3 (the universal day of Yahuah)
--   ★★ v.17-18 (But upon mount Zion shall be deliverance... and the house of Jacob shall possess their
--          possessions. And the house of Jacob shall be a fire, and the house of Joseph a flame, and the
--          house of Esau for stubble) [two-house: Jacob AND Joseph named together]
--        NT: none warranted distinct (the Zion-deliverance forward-weave is gathered into THREAD 5)
--        Extras: none warranted
--        Tanakh: ★ Zechariah 12:6 (I will make the governors of Yahudah like an hearth of fire among the
--                wood... they shall devour all the people round about), ★ Isaiah 10:17 (the light of
--                Yashar'el shall be for a fire, and his Holy One for a flame... it shall burn and devour) —
--                THREAD 4 (the house of Jacob/Joseph a devouring fire; the two-house restored to inherit)
--   v.19-20 (the south possess the mount of Esau... the captivity of this host of the children of
--          Yashar'el... and the captivity of Jerusalem... shall possess the cities of the south)
--        NT: none warranted | Extras: none warranted
--        Tanakh: the two-house repossession woven into THREAD 4/THREAD 5 prose (Yashar'el AND Jerusalem
--                both gathered to inherit); no separate forced add
--   ★★★ v.21 (And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom shall
--          be the LORD'S) — THE KEYSTONE CLOSE
--        NT:     ★★★ Revelation 11:15 (The kingdoms of this world are become the kingdoms of our Lord, and
--                of his Messiah; and he shall reign for ever and ever) — THREAD 5
--        Extras: none warranted (the kingdom-consummation is canon-carried, NT + Tanakh)
--        Tanakh: ★★ Daniel 7:27 (the kingdom and dominion... shall be given to the people of the saints of
--                the El Elyon... an everlasting kingdom), ★★ Zechariah 14:9 (Yahuah shall be king over all
--                the earth: in that day shall there be one Yahuah, and his name one), ★ Psalm 22:28 (the
--                kingdom is the LORD'S: and he is the governor among the nations) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down — Tanakh (Jeremiah 49,
--      Isaiah 14, Proverbs 16) + NT (Luke 14) [free]
--      (★ the pride before the fall; the star-climbing pride brought down — Edom's = Lucifer's = every
--      haughty heart)
--   2. obadiah-1-thy-violence-against-thy-brother-jacob — Tanakh (Genesis 25, Genesis 27, Psalm 137,
--      Ezekiel 35, Malachi 1) + NT (Romans 9) + Extras (1 Maccabees 5) [extras]
--      (★★ Edom's betrayal of his brother Yahudah; the seed-war within the family, CONDUCT-not-ethnic;
--      the Esau-line judged for the deed)
--   3. obadiah-1-as-thou-hast-done-it-shall-be-done-unto-thee — NT (Matthew 7, Galatians 6) + Tanakh
--      (Joel 3) [free]
--      (★★ the day of Yahuah upon all the heathen; the measure-for-measure recompense, the lex talionis
--      of judgment)
--   4. obadiah-1-the-house-of-jacob-a-fire-the-house-of-esau-stubble — Tanakh (Zechariah 12, Isaiah 10)
--      [free]
--      (★ the house of Jacob AND the house of Joseph — both houses — a devouring fire; the two-house
--      restored to possess their possessions)
--   5. obadiah-1-saviours-on-mount-zion-and-the-kingdom-shall-be-yahuahs — NT (Revelation 11) + Tanakh
--      (Daniel 7, Zechariah 14, Psalm 22) [free]
--      (★★★ THE KEYSTONE: deliverance and holiness on Zion, saviours/deliverers under the one Saviour,
--      and the consummation — the kingdom shall be Yahuah's)
--
-- Framing notes:
--   ★ THE PRIDE BROUGHT DOWN (THREAD 1): *The pride of thine heart hath deceived thee, thou that dwellest
--      in the clefts of the rock, whose habitation is high; that saith in his heart, Who shall bring me
--      down to the ground? Though thou exalt thyself as the eagle, and though thou set thy nest among the
--      stars, thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:3-4). Jeremiah's parallel
--      Edom oracle is near word-for-word — *Thy terribleness hath deceived thee, and the pride of thine
--      heart... though thou shouldest make thy nest as high as the eagle, I will bring thee down from
--      thence* (Jeremiah 49:16) — one Spirit, one verdict on the rock-dwelling pride. It is the same
--      star-climbing pride that was brought down in Isaiah 14: *I will exalt my throne above the stars of
--      Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13-14), *Yet thou shalt be
--      brought down to hell* (14:15). And it is the proverb's own law — *Pride goeth before destruction,
--      and an haughty spirit before a fall* (Proverbs 16:18) — which the Messiah states as the kingdom's
--      rule: *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted*
--      (Luke 14:11). The eagle's nest among the stars is brought down to the ground.
--   ★★ THY VIOLENCE AGAINST THY BROTHER (THREAD 2): *For thy violence against thy brother Jacob shame
--      shall cover thee... In the day that thou stoodest on the other side... thou wast as one of them*
--      (Obadiah 1:10-11); *neither shouldest thou have stood in the crossway, to cut off those of his
--      that did escape* (1:14). This is the seed-war WITHIN the family — Esau and Jacob, the twins of one
--      womb: *Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23); and
--      the old enmity from the start, *Esau hated Jacob... then will I slay my brother Jacob* (Genesis
--      27:41). The Psalmist remembers Edom's gloating at Jerusalem's fall: *Remember, O Yahuah (LORD), the
--      children of Edom in the day of Jerusalem; who said, Rase it, rase it, even to the foundation
--      thereof* (Psalm 137:7); Ezekiel names the perpetual hatred and the blood shed in the day of
--      calamity (Ezekiel 35:5). Edom is judged for CONDUCT, not ethnicity — for what he DID to his
--      brother. The election-word frames it without ethnic spite: *Was not Esau Jacob's brother? saith
--      Yahuah (LORD): yet I loved Jacob, And I hated Esau* (Malachi 1:2-3), which Paul cites of the line
--      and its calling: *Jacob have I loved, but Esau have I hated* (Romans 9:13) — a love-and-rejection
--      of the LINE'S election and conduct, not a license for hatred of persons; the lost are victims of
--      the seed-war, not enemies to be cursed. The Maccabean witness records the recompense returning on
--      the brother-line: *Judas fought against the children of Esau in Idumea... and gave them a great
--      overthrow* (1 Maccabees 5:3).
--   ★★ AS THOU HAST DONE (THREAD 3): *For the day of Yahuah (LORD) is near upon all the heathen: as thou
--      hast done, it shall be done unto thee: thy reward shall return upon thine own head* (Obadiah 1:15).
--      This is the universal day of Yahuah and its measure-for-measure law. Joel sets the same near day:
--      *Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the
--      valley of decision* (Joel 3:14). And the Messiah states the recompense as the kingdom's standing
--      rule: *with what measure ye mete, it shall be measured to you again* (Matthew 7:2); *whatsoever a
--      man soweth, that shall he also reap* (Galatians 6:7). What Edom did to his brother returns upon his
--      own head — the lex talionis of Yahuah's judgment.
--   ★ THE HOUSE OF JACOB A FIRE (THREAD 4): *And the house of Jacob shall be a fire, and the house of
--      Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them*
--      (Obadiah 1:18). Both houses are named together — Jacob (Yahudah) AND Joseph (Ephraim/Yashar'el),
--      the two sticks made one — restored to *possess their possessions* (1:17) and made a devouring fire
--      against the stubble. Zechariah uses the same fire-figure for restored Yahudah: *I will make the
--      governors of Yahudah (Judah) like an hearth of fire among the wood, and like a torch of fire in a
--      sheaf; and they shall devour all the people round about* (Zechariah 12:6); and Isaiah names the
--      holy fire of Yashar'el: *the light of Yashar'el (Israel) shall be for a fire, and his Holy One for
--      a flame: and it shall burn and devour* (Isaiah 10:17). The two-house people, gathered home, are the
--      fire; Esau's pride is the stubble.
--   ★★★ THE KEYSTONE — SAVIOURS ON ZION (THREAD 5): *But upon mount Zion shall be deliverance, and there
--      shall be holiness; and the house of Jacob shall possess their possessions* (Obadiah 1:17), and the
--      book closes: *And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom
--      shall be the LORD'S* (1:21). The saviours (moshi'im) are the deliverers raised under the one
--      Saviour, the Formed Son; the consummation is the kingdom become Yahuah's. The Revelation declares
--      the same: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah
--      (Christ); and he shall reign for ever and ever* (Revelation 11:15). Daniel sees it given to the
--      saints: *the kingdom and dominion... shall be given to the people of the saints of the El Elyon
--      (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27). Zechariah names the one King:
--      *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD),
--      and his name one* (Zechariah 14:9). And the Psalm sings it: *For the kingdom is the LORD'S: and he
--      is the governor among the nations* (Psalm 22:28). Deliverance on Zion, judgment on Esau's mount,
--      and the kingdom Yahuah's forever.
--   EXTRAS: 1 Maccabees 5:3 (the children of Esau in Idumea overthrown) is the one clean extras witness
--      woven (THREAD 2 — the recompense on the brother-line). Sirach 50:25-26 (the nation in Seir) was
--      weighed and NOT used (it names Samaria/Philistines/Sichem, not the Edom judgment). No extras forced
--      on the pride, the measure, the fire, or the keystone close.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the rumour/the ambassador — the Jeremiah-49 parallel introduced
--      with THREAD 1's 49:16), v.5-9 (the searching-out, the confederates, the wise men of Edom destroyed,
--      Teman dismayed — woven in the prose of THREADS 1-2), v.16 (the drinking on the holy mountain — the
--      same-day recompense, woven into THREAD 3), v.19-20 (the two-house repossession — woven into
--      THREADS 4-5). All recorded, none silently skipped.

CREATE TEMP VIEW _s331_oba01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Though thou exalt as the eagle, thence will I bring thee down (the pride before the fall)
    ('canon','obadiah',1,4,'canon','jeremiah',49,16,'free',
      E'*Thy terribleness hath deceived thee, and the pride of thine heart, O thou that dwellest in the clefts of the rock, that holdest the height of the hill: though thou shouldest make thy nest as high as the eagle, I will bring thee down from thence, saith Yahuah (LORD)* (Jeremiah 49:16). Jeremiah''s Edom oracle is near word-for-word with *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down* (Obadiah 1:4): the same rock-clefts, the same eagle''s nest, the same *pride of thine heart* deceiving, the same bringing-down. One Spirit, one verdict on Esau''s exalted pride.'),
    ('canon','obadiah',1,3,'canon','isaiah',14,13,'free',
      E'*For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13). Edom''s boast — *that saith in his heart, Who shall bring me down to the ground?* (Obadiah 1:3) — is the same star-climbing pride of Isaiah''s fallen one, who *said in thine heart* he would set his throne *above the stars*. The heart that exalts itself to the stars is the heart Yahuah brings down.'),
    ('canon','obadiah',1,4,'canon','isaiah',14,15,'free',
      E'*Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:15). The one who would be *like the El Elyon (most High)* (Isaiah 14:14) ends *brought down to hell* — the very end of Edom who set his *nest among the stars*: *thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:4). The higher the nest, the deeper the fall; the pride that climbs to the stars is cast to the pit.'),
    ('canon','obadiah',1,3,'canon','proverbs',16,18,'free',
      E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). Obadiah names the cause of Edom''s ruin plainly: *The pride of thine heart hath deceived thee* (Obadiah 1:3). The proverb is the law of it — pride precedes destruction, the haughty spirit precedes the fall. Edom''s high habitation in the rock could not save the high heart within it.'),
    ('canon','obadiah',1,4,'canon','luke',14,11,'free',
      E'*For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11). The Messiah states the kingdom''s rule that Edom learns: *Though thou exalt thyself as the eagle... thence will I bring thee down* (Obadiah 1:4). He who exalts himself to the stars shall be abased to the ground; the law that fells Edom is the same law that governs every haughty heart.'),

    -- THREAD 2 (★★): Thy violence against thy brother Jacob (the seed-war, conduct-not-ethnic)
    ('canon','obadiah',1,10,'canon','genesis',25,23,'free',
      E'*And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). The *brother Jacob* against whom Edom did *violence* (Obadiah 1:10) is his own twin — *two nations* striving from one womb, Esau the elder and Jacob the younger. Obadiah''s quarrel is the seed-war within the family, the enmity that began before the twins were born.'),
    ('canon','obadiah',1,10,'canon','genesis',27,41,'free',
      E'*And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob* (Genesis 27:41). The *violence against thy brother Jacob* (Obadiah 1:10) is the old hatred come to its harvest: from the first, *Esau hated Jacob... then will I slay my brother Jacob*. The murder-in-the-heart of the father became the gloating-and-cutting-off of the descendant in the day of Jerusalem''s fall.'),
    ('canon','obadiah',1,11,'canon','psalms',137,7,'free',
      E'*Remember, O Yahuah (LORD), the children of Edom in the day of Jerusalem; who said, Rase it, rase it, even to the foundation thereof* (Psalm 137:7). The Psalmist names the very deed Obadiah condemns — *In the day that thou stoodest on the other side... thou wast as one of them* (Obadiah 1:11): Edom cheering Jerusalem''s destruction, crying *Rase it, rase it*. The brother who should have wept stood on the other side and urged the leveling.'),
    ('canon','obadiah',1,10,'canon','ezekiel',35,5,'free',
      E'*Because thou hast had a perpetual hatred, and hast shed the blood of the children of Yashar''el (Israel) by the force of the sword in the time of their calamity, in the time that their iniquity had an end* (Ezekiel 35:5). Ezekiel names Edom''s sin as Obadiah does — *thy violence against thy brother Jacob* (Obadiah 1:10): a *perpetual hatred* that shed his brother''s blood *in the time of their calamity*. The judgment is for the CONDUCT — the hatred and the bloodshed in the day of distress — not for the blood in his veins.'),
    ('canon','obadiah',1,10,'canon','malachi',1,2,'free',
      E'*I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2). Malachi frames Edom''s judgment by the election of the LINE — *Was not Esau Jacob''s brother?... yet I loved Jacob* — the same brother-bond Obadiah invokes: *thy violence against thy brother Jacob* (Obadiah 1:10). The love and the rejection are of the covenant calling, not an ethnic verdict.'),
    ('canon','obadiah',1,10,'canon','malachi',1,3,'free',
      E'*And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:3). The wasting of Esau''s mountains — *the mount of Esau* of Obadiah — is the recompense for the violence: *thou shalt be cut off for ever* (Obadiah 1:10). The hatred of the line is Yahuah''s judgment on its conduct and election; Edom''s heritage is laid waste for what Edom did to his brother.'),
    ('canon','obadiah',1,10,'canon','romans',9,13,'free',
      E'*As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). Paul cites the Esau-line verdict (Malachi 1:2-3) of the calling and the election — the same brother-line Obadiah judges: *thy violence against thy brother Jacob* (Obadiah 1:10). It is a love-and-rejection of the LINE''S election and conduct, NOT a license to hate persons; the lost of the seed-war are victims to be reclaimed, not enemies to be cursed.'),
    ('canon','obadiah',1,10,'apocrypha','1-maccabees',5,3,'extras',
      E'*Then Judas fought against the children of Esau in Idumea at Arabattine, because they besieged Gael: and he gave them a great overthrow, and abated their courage, and took their spoils* (1 Maccabees 5:3). The recompense Obadiah foretold returns on the brother-line — *thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10): centuries later *the children of Esau in Idumea* are given *a great overthrow*. The deed done to Jacob is repaid upon Esau''s house.'),

    -- THREAD 3 (★★): As thou hast done, it shall be done unto thee (the day of Yahuah; the measure)
    ('canon','obadiah',1,15,'canon','joel',3,14,'free',
      E'*Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley of decision* (Joel 3:14). Obadiah and Joel proclaim one near day — *For the day of Yahuah (LORD) is near upon all the heathen* (Obadiah 1:15). The universal day of Yahuah, the valley of decision, falls *upon all the heathen*; Edom is the first-named, but the recompense is for all.'),
    ('canon','obadiah',1,15,'canon','matthew',7,2,'free',
      E'*For with what judgment ye judge, ye shall be judged: and with what measure ye mete, it shall be measured to you again* (Matthew 7:2). The Messiah states as the kingdom''s law the very rule Obadiah pronounces on Edom: *as thou hast done, it shall be done unto thee: thy reward shall return upon thine own head* (Obadiah 1:15). The measure Edom meted to his brother is measured back to Edom; the recompense returns upon his own head.'),
    ('canon','obadiah',1,15,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Edom sowed violence against his brother in the day of calamity, and reaps the day of Yahuah: *as thou hast done, it shall be done unto thee* (Obadiah 1:15). The sowing-and-reaping is the same measure-for-measure law — the reward returns upon the head that sowed it.'),

    -- THREAD 4 (★): The house of Jacob a fire, the house of Esau stubble (the two-house, restored to inherit)
    ('canon','obadiah',1,18,'canon','zechariah',12,6,'free',
      E'*In that day will I make the governors of Yahudah (Judah) like an hearth of fire among the wood, and like a torch of fire in a sheaf; and they shall devour all the people round about, on the right hand and on the left: and Jerusalem shall be inhabited again in her own place, even in Jerusalem* (Zechariah 12:6). The same fire-figure crowns restored Yahudah as Obadiah crowns restored Jacob: *the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble* (Obadiah 1:18). The gathered house is *a torch of fire in a sheaf*, devouring the stubble round about.'),
    ('canon','obadiah',1,18,'canon','isaiah',10,17,'free',
      E'*And the light of Yashar''el (Israel) shall be for a fire, and his Holy One for a flame: and it shall burn and devour his thorns and his briers in one day* (Isaiah 10:17). Obadiah''s *house of Jacob shall be a fire, and the house of Joseph a flame* (Obadiah 1:18) is Isaiah''s same holy fire — *the light of Yashar''el... for a fire, and his Holy One for a flame* — that *burns and devours* the thorns. The two-house people, gathered home, are the consuming flame; Esau''s pride is the stubble that does not remain.'),

    -- THREAD 5 (★★★): Saviours on mount Zion, and the kingdom shall be Yahuah's (THE KEYSTONE close)
    ('canon','obadiah',1,21,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). Obadiah''s closing word is the same consummation: *And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom shall be the LORD''S* (Obadiah 1:21). The deliverance on Zion ends where Revelation''s seventh trumpet ends — the kingdom become Yahuah''s and his Messiah''s, who shall reign for ever.'),
    ('canon','obadiah',1,21,'canon','daniel',7,27,'free',
      E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). The *saviours* who *come up on mount Zion* and the *kingdom* that *shall be the LORD''S* (Obadiah 1:21) are the kingdom Daniel sees *given to the people of the saints of the El Elyon* — *an everlasting kingdom*. The deliverers on Zion are the saints who receive the kingdom that all dominions shall serve.'),
    ('canon','obadiah',1,21,'canon','zechariah',14,9,'free',
      E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). Obadiah''s last clause — *and the kingdom shall be the LORD''S* (Obadiah 1:21) — is Zechariah''s one King over all the earth: *Yahuah (LORD) shall be king... and his name one*. The deliverance on Zion consummates in the reign of the one Yahuah whose Name is one.'),
    ('canon','obadiah',1,21,'canon','psalms',22,28,'free',
      E'*For the kingdom is the LORD''S: and he is the governor among the nations* (Psalm 22:28). The Psalm sings what Obadiah declares — *the kingdom shall be the LORD''S* (Obadiah 1:21): *the kingdom is the LORD''S: and he is the governor among the nations*. The saviours on Zion judge the mount of Esau, and the rule over all nations returns to its true King.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s331_oba01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s331_oba01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down',
       E'Though thou exalt as the eagle — thence will I bring thee down (the pride before the fall)',
       E'Edom''s ruin begins in his heart: *The pride of thine heart hath deceived thee, thou that dwellest in the clefts of the rock, whose habitation is high; that saith in his heart, Who shall bring me down to the ground? Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:3-4). Jeremiah''s parallel Edom oracle is near word-for-word: *Thy terribleness hath deceived thee, and the pride of thine heart, O thou that dwellest in the clefts of the rock... though thou shouldest make thy nest as high as the eagle, I will bring thee down from thence, saith Yahuah (LORD)* (Jeremiah 49:16) — one Spirit, one verdict. It is the same star-climbing pride that fell in Isaiah 14: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13), *I will be like the El Elyon (most High)* (14:14) — and ended *brought down to hell, to the sides of the pit* (14:15). The proverb is the plain law of it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18); and the Messiah states it as the kingdom''s standing rule: *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11). The higher the nest among the stars, the deeper the fall to the ground.',
       sv.verse_id, ev.verse_id, 'free', 45300
  FROM _s331_oba01_lookup sv, _s331_oba01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='obadiah' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'obadiah-1-thy-violence-against-thy-brother-jacob',
       E'Thy violence against thy brother Jacob — the seed-war within the family',
       E'The heart of the oracle is a brother''s betrayal: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever. In the day that thou stoodest on the other side, in the day that the strangers carried away captive his forces... even thou wast as one of them* (Obadiah 1:10-11); *neither shouldest thou have stood in the crossway, to cut off those of his that did escape* (1:14). The brother is Edom''s own twin — *Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23) — and the enmity is the old hatred from the start: *Esau hated Jacob... then will I slay my brother Jacob* (Genesis 27:41). The Psalmist remembers Edom''s gloating at the fall: *Remember, O Yahuah (LORD), the children of Edom in the day of Jerusalem; who said, Rase it, rase it, even to the foundation thereof* (Psalm 137:7); and Ezekiel names the *perpetual hatred* that *shed the blood of the children of Yashar''el (Israel)... in the time of their calamity* (Ezekiel 35:5). Edom is judged for CONDUCT, not for blood — for what he DID to his brother in the day of distress. The election-word frames it without ethnic spite: *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2), *And I hated Esau, and laid his mountains and his heritage waste* (1:3), which Paul cites of the line and its calling: *Jacob have I loved, but Esau have I hated* (Romans 9:13) — a love-and-rejection of the LINE''S election and conduct, never a license to hate persons; the lost of the seed-war are victims to be reclaimed. And the recompense returns: *Judas fought against the children of Esau in Idumea... and gave them a great overthrow* (1 Maccabees 5:3).',
       sv.verse_id, ev.verse_id, 'extras', 45303
  FROM _s331_oba01_lookup sv, _s331_oba01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='obadiah' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'obadiah-1-as-thou-hast-done-it-shall-be-done-unto-thee',
       E'As thou hast done, it shall be done unto thee — the day of Yahuah and the measure',
       E'The judgment is measure-for-measure, and it is universal: *For the day of Yahuah (LORD) is near upon all the heathen: as thou hast done, it shall be done unto thee: thy reward shall return upon thine own head* (Obadiah 1:15). For as Edom *drunk upon my holy mountain, so shall all the heathen drink continually* (1:16) — the same cup returns. Joel proclaims the same near day: *Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley of decision* (Joel 3:14). And the Messiah states the recompense as the kingdom''s standing law: *with what measure ye mete, it shall be measured to you again* (Matthew 7:2); *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Edom sowed violence against his brother in the day of calamity, and reaps the day of Yahuah; the reward returns upon the head that meted it.',
       sv.verse_id, ev.verse_id, 'free', 45306
  FROM _s331_oba01_lookup sv, _s331_oba01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='obadiah' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'obadiah-1-the-house-of-jacob-a-fire-the-house-of-esau-stubble',
       E'The house of Jacob a fire, the house of Esau stubble — the two houses restored to inherit',
       E'Deliverance turns to inheritance, and both houses are named together: *But upon mount Zion shall be deliverance, and there shall be holiness; and the house of Jacob shall possess their possessions. And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them* (Obadiah 1:17-18). Jacob (Yahudah) AND Joseph (Ephraim/Yashar''el) — the two sticks made one — are restored to *possess their possessions* and made a devouring fire against the stubble. Zechariah uses the same fire-figure for restored Yahudah: *I will make the governors of Yahudah (Judah) like an hearth of fire among the wood, and like a torch of fire in a sheaf; and they shall devour all the people round about* (Zechariah 12:6). And Isaiah names the holy fire of Yashar''el: *the light of Yashar''el (Israel) shall be for a fire, and his Holy One for a flame: and it shall burn and devour his thorns and his briers in one day* (Isaiah 10:17). The two-house people, gathered home — *the captivity of this host of the children of Yashar''el (Israel)* and *the captivity of Jerusalem* alike (1:20) — are the consuming flame; Esau''s pride is the stubble that does not remain.',
       sv.verse_id, ev.verse_id, 'free', 45309
  FROM _s331_oba01_lookup sv, _s331_oba01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='obadiah' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'obadiah-1-saviours-on-mount-zion-and-the-kingdom-shall-be-yahuahs',
       E'Saviours on mount Zion, and the kingdom shall be Yahuah''s — the keystone close',
       E'The book closes on the consummation: *But upon mount Zion shall be deliverance, and there shall be holiness; and the house of Jacob shall possess their possessions* (Obadiah 1:17); *And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom shall be the LORD''S* (1:21). The saviours (moshi''im) are the deliverers raised up under the one Saviour, the Formed Son; the close is the kingdom become Yahuah''s. The Revelation declares the same end: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). Daniel sees the kingdom given to the saints: *the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27). Zechariah names the one King: *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). And the Psalm sings it: *For the kingdom is the LORD''S: and he is the governor among the nations* (Psalm 22:28). Deliverance on Zion, judgment on Esau''s mount, and the kingdom Yahuah''s forever — the whole canon''s end answered in Obadiah''s last word.',
       sv.verse_id, ev.verse_id, 'free', 45312
  FROM _s331_oba01_lookup sv, _s331_oba01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='obadiah' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *though thou shouldest make thy nest as high as the eagle, I will bring thee down from thence* (Jeremiah 49:16) — the near-identical parallel Edom oracle; same clefts, same eagle''s nest, same pride brought down as Obadiah 1:4.'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=49 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13) — the same star-climbing pride of *Who shall bring me down to the ground?* (Obadiah 1:3); the heart that says it in itself.'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:15) — the end of the nest *among the stars*: *thence will I bring thee down* (Obadiah 1:4); the deeper the fall.'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — the plain law that fells Edom: *The pride of thine heart hath deceived thee* (Obadiah 1:3).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11) — the Messiah''s kingdom-rule that Edom learns: exalt to the stars, be abased to the ground (Obadiah 1:4).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-though-thou-exalt-as-the-eagle-thence-will-i-bring-thee-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23) — the *brother Jacob* (Obadiah 1:10) is Esau''s own twin; the seed-war from one womb.'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Esau hated Jacob... then will I slay my brother Jacob* (Genesis 27:41) — the old hatred whose harvest is the *violence against thy brother Jacob* (Obadiah 1:10).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Remember, O Yahuah (LORD), the children of Edom in the day of Jerusalem; who said, Rase it, rase it* (Psalm 137:7) — Edom cheering the fall, *thou wast as one of them* (Obadiah 1:11).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *thou hast had a perpetual hatred, and hast shed the blood of the children of Yashar''el (Israel)... in the time of their calamity* (Ezekiel 35:5) — the conduct judged: the hatred and bloodshed of *thy violence against thy brother Jacob* (Obadiah 1:10).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=35 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2) — the election of the line frames the brother-bond of *thy brother Jacob* (Obadiah 1:10); not ethnic spite.'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *And I hated Esau, and laid his mountains and his heritage waste* (Malachi 1:3) — the wasting of *the mount of Esau* is the recompense: *thou shalt be cut off for ever* (Obadiah 1:10).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *Jacob have I loved, but Esau have I hated* (Romans 9:13) — Paul of the LINE''S election and conduct, NOT a license to hate persons; the lost of the seed-war are victims to reclaim.'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Judas fought against the children of Esau in Idumea... and gave them a great overthrow* (1 Maccabees 5:3) — the recompense returns on the brother-line; the deed done to Jacob repaid (Obadiah 1:10).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-thy-violence-against-thy-brother-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near* (Joel 3:14) — the same near day *upon all the heathen* (Obadiah 1:15).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-as-thou-hast-done-it-shall-be-done-unto-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *with what measure ye mete, it shall be measured to you again* (Matthew 7:2) — the Messiah''s kingdom-law of the recompense: *as thou hast done, it shall be done unto thee* (Obadiah 1:15).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-as-thou-hast-done-it-shall-be-done-unto-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — Edom sowed violence, reaps the day of Yahuah; the reward returns upon his own head (Obadiah 1:15).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-as-thou-hast-done-it-shall-be-done-unto-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will make the governors of Yahudah (Judah) like an hearth of fire among the wood... they shall devour all the people round about* (Zechariah 12:6) — the same fire-figure for restored Yahudah as Obadiah''s *house of Jacob shall be a fire* (1:18).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-the-house-of-jacob-a-fire-the-house-of-esau-stubble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the light of Yashar''el (Israel) shall be for a fire, and his Holy One for a flame: and it shall burn and devour* (Isaiah 10:17) — the holy fire of Yashar''el; the two-house flame against Esau''s stubble (Obadiah 1:18).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-the-house-of-jacob-a-fire-the-house-of-esau-stubble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the consummation of *the kingdom shall be the LORD''S* (Obadiah 1:21).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-saviours-on-mount-zion-and-the-kingdom-shall-be-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the kingdom... shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27) — the *saviours* on Zion are the saints who receive the everlasting kingdom (Obadiah 1:21).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-saviours-on-mount-zion-and-the-kingdom-shall-be-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — the one King of *the kingdom shall be the LORD''S* (Obadiah 1:21).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-saviours-on-mount-zion-and-the-kingdom-shall-be-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *For the kingdom is the LORD''S: and he is the governor among the nations* (Psalm 22:28) — the Psalm sings Obadiah''s last word: *the kingdom shall be the LORD''S* (1:21).'
  FROM cross_reference_threads t
  JOIN _s331_oba01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='obadiah' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s331_oba01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='obadiah-1-saviours-on-mount-zion-and-the-kingdom-shall-be-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session331 — Obadiah cross-references complete.'
